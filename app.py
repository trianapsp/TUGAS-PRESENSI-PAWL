from flask import Flask, render_template, request, session, redirect, url_for
from models import PersonalForm, mahasiswa, dosen, mataKuliah
from models import isiPresensi, JmlhPresensi
from werkzeug.utils import secure_filename
import pymysql
import config
import os

db = cursor = None
application = Flask(__name__)
application.config['SECRET_KEY'] = '@#123456&*()'
UPLOAD_FOLDER = 'static/profil/uploads/'
ALLOWED_EXTENSIONS = {'webp','jpg', 'jpeg','png','gif'}
application.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER
application.config['MAX_CONTENT_LENGTH'] = 16*1024*1024
def allowed_file(filename):
    return '.' in filename and filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS

@application.route('/', methods = ['GET', 'POST'])
def index():
    return render_template('index.html')

@application.route('/mahasiswa', methods = ['GET', 'POST'],endpoint='/mahasiswa')
def loginMhs():
    form = PersonalForm()
    mhs = mahasiswa()
    if request.method == 'POST':
        message=''
        uname = form.uname.data
        password = form.password.data
        user = mhs.selectDB(uname,password)
        if user:
            session['login'] = True
            session['nim'] = user[0]
            session['nama'] = user[1]
            session['uname'] = user[2]
            session['Prodi'] = user[4]
            session['Semester'] = user[5]
            return render_template('response.html',message=message,uname=uname,password=password)
        else:
            message = 'username dan password yang anda masukan salah!'
        return(message)
    navigasi = [
        ('/presensi-mhs', 'Presensi'),
        ('/data-matkul', 'dataMK'),
        ('/data-dosen', 'dataDsn'),
        ('/profil-mhs', 'profil-mhs')
    ]

    return render_template('form.html', form=form, navigasi=navigasi)

@application.route('/dosen', methods = ['GET', 'POST'],endpoint='/dosen')
def loginDsn():
    form = PersonalForm()
    dsn = dosen()
    if request.method == 'POST':
        message=''
        uname = form.uname.data
        password = form.password.data
        user = dsn.selectDBDsn(uname,password)
        if user:
            session['login'] = True
            session['kode_dosen'] = user[0]
            session['kode_mk'] = user[1]
            session['nama_mk'] = user[2]
            session['nama'] = user[3]
            session['uname'] = user[4]
            session['no_telepon'] = user[6]
            return render_template('response-dosen.html',message=message,uname=uname,password=password)
        else:
            message = 'username dan password yang anda masukan salah!'
        return(message)
    navigasi = [
        ('/rekap-presensi', 'Presensi'),
        ('/data-mahasiswa', 'dataMhs'),
        ('/persentase-presensi', 'persentase'),
    ]

    return render_template('form-dosen.html', form=form, navigasi=navigasi)

@application.route('/presensi-mhs', methods=['GET', 'POST'])
def presensi():
    if request.method == 'POST':
        nim = session['nim']
        nama = session['nama']
        prodi = session['Prodi']
        semester = session['Semester']
        nama_mk = request.form['nama_mk']
        jadwal = request.form['jadwal']
        tgl = request.form['tgl']
        jam = request.form['jam']
        isi = request.form['isi']
        data = (nim, nama, prodi, semester, nama_mk, jadwal, tgl, jam, isi)
        prs = isiPresensi()
        prs.insertDB(data)            
        return render_template('response.html')
    else:
        return render_template ('presensi-mhs.html')

@application.route('/rekap-presensi', methods=['GET', 'POST'])
def rekap():
    dsn = dosen()
    container = []
    nama_mk = session['nama_mk']
    container = dsn.selectRekap(nama_mk)
    return render_template('rekap-presensi.html', container=container)

@application.route('/data-mahasiswa', methods=['GET', 'POST'])
def dataMhs():
    mhs = mahasiswa()
    container = []
    container = mhs.selectDataMhs()
    return render_template('data-mahasiswa.html', container=container)

@application.route('/data-matkul', methods=['GET', 'POST'])
def dataMK():
    mk = mataKuliah()
    container = []
    container = mk.selectDB()
    return render_template('data-matkul.html', container=container)

@application.route('/data-dosen', methods=['GET', 'POST'])
def dataDsn():
    dsn = dosen()
    container = []
    container = dsn.selectDsn()
    return render_template('data-dosen.html', container=container)

@application.route('/persentase', methods=['GET', 'POST'])
def persentase():
    dsn = dosen()
    container = []
    # jadwal = session['jadwal']
    container = dsn.persentase()
    return render_template('persentase.html', container=container)

@application.route('/profil-mhs', methods = ['GET', 'POST'])
def profilMhs():
    if request.method=='POST':
        foto = request.form['foto']
        if foto and allowed_file(foto.filename):
            filename = secure_filename(foto.filename)
            foto.save(os.path.join(application.config['UPLOAD_FOLDER'], filename))
            data = (filename, session['nim'])
            mhs = mahasiswa()
            mhs.updateMhs(data)
            return redirect('/profil-mhs')
    return render_template('profil-mhs.html')

@application.route('/profil-dsn', methods = ['GET', 'POST'])
def profilDsn():
    return render_template('profil-dsn.html')

@application.route('/dashboard-mhs',  methods = ['GET', 'POST'])
def dashboardMhs():
    return render_template('response.html')

@application.route('/dashboard-dsn',  methods = ['GET', 'POST'])
def dashboardDsn():
    return render_template('response-dosen.html')

@application.route('/detail-rekapMhs/<nim>',  methods = ['GET', 'POST'],endpoint='detail-rekapMhs')
def detailRekapMhs(nim):
    dsn = dosen()
    container = []
    nama_mk = session['nama_mk']
    data = (nim,nama_mk)
    container = dsn.persenPrs(data)
    mhs = mahasiswa()
    nama = mhs.selectMhs(nim)
    namaMhs = nama[1]
    nimMhs = nama[0]
    prs = isiPresensi()
    jmlhHadir = prs.jmlhHadir(nim)
    jmlhSakit = prs.jmlhSakit(nim)
    jmlhIzin = prs.jmlhIzin(nim)
    jmlhAlfa = prs.jmlhAlfa(nim)
    print(jmlhHadir)
    prsn = jmlhHadir[0]/17*100
    print(prsn)
    if request.method == 'POST':
        # nim = request.form['nim']
        jmlhHadir = request.form['jmlh_hadir']
        jmlhSakit = request.form['jmlh_sakit']
        jmlhIzin = request.form['jmlh_izin']
        jmlhAlfa = request.form['jmlh_alfa']
        data = (jmlhHadir, jmlhSakit, jmlhIzin, jmlhAlfa, nim)
        print('isiisisi',data)
        prs = isiPresensi()
        prs.updateRekap(data)
        return redirect('/rekap-presensi-detail')
    else:
        return render_template('detail-rekapMhs.html', container=container, namaMhs=namaMhs, nimMhs=nimMhs, jmlhHadir=jmlhHadir, jmlhSakit=jmlhSakit, jmlhIzin=jmlhIzin, jmlhAlfa=jmlhAlfa, prsn=prsn)

@application.route('/rekap-presensi-detail', methods = ['GET', 'POST'])
def rekapDetail():
    jp = JmlhPresensi()
    container = []
    container = jp.selectJP()
    return render_template('rekap-presensi-detail.html', container=container)

if __name__ == '__main__':
    application.run(debug=True)