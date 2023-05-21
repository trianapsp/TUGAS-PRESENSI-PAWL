from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField, SubmitField
from flask import *
import pymysql
import config

class PersonalForm(FlaskForm):
    uname = StringField('Username : ')
    password = PasswordField('Password : ')
    submit = SubmitField('Login')

db = cursor = None

class mahasiswa :
    def __init__(self, nim=None, nama=None, username=None, password=None, prodi=None, semester=None, foto=None):
        self.nim = nim
        self.nama = nama
        self.username = username
        self.password = password
        self.prodi = prodi
        self.semester = semester
        self.foto = foto

    def openDB(self):
        global db, cursor
        db = pymysql.connect(
            host = config.DB_HOST,
            user = config.DB_USER,
            password = config.DB_PASSWORD,
            database = config.DB_NAME)
        cursor = db.cursor()
    
    def closeDB(self):
        global db, cursor
        db.close()
    
    def selectDB(self,u,p):
        self.openDB()
        cursor.execute('SELECT * FROM mahasiswa where username = % s and password = % s', (u,p))
        user = cursor.fetchone ()
        return user
    
    def selectDataMhs(self):
        self.openDB()
        cursor.execute('SELECT * FROM mahasiswa')
        container = []
        for nim,nama,username,password,Prodi,Semester,foto in cursor.fetchall():
            container.append((nim,nama,Prodi,Semester))
        self.closeDB()
        return container
    
    def selectMhs(self,data):
        self.openDB()
        cursor.execute('SELECT * FROM mahasiswa where nim=%s'%data)
        container = cursor.fetchone()
        return container
    
    def updateMhs(self, data):
        self.openDB()
        cursor.execute("UPDATE fROM mahasiswa SET foto='%s' WHERE nim='%s' "%data)
    
class dosen :
    def __init__(self, kode_mk=None, nama=None, username=None, password=None, no_telepon=None):
        self.kode_mk = kode_mk
        self.nama = nama
        self.username = username
        self.password = password
        self.no_telepon = no_telepon

    def openDB(self):
        global db, cursor
        db = pymysql.connect(
            host = config.DB_HOST,
            user = config.DB_USER,
            password = config.DB_PASSWORD,
            database = config.DB_NAME)
        cursor = db.cursor()
    
    def closeDB(self):
        global db, cursor
        db.close()
    
    def selectDBDsn(self,u,p):
        self.openDB()
        cursor.execute('SELECT * FROM dosen where username = % s and password = % s', (u,p))
        user = cursor.fetchone ()
        return user
    
    def selectRekap(self,data):
        self.openDB()
        cursor.execute("select nim,nama,prodi,semester,nama_mk,jadwal,tgl,jam,status,count(*) as jml from isi_presensi where nama_mk='%s' and jadwal!=''group by nama,jadwal,status"%data)
        container = cursor.fetchall()
        self.closeDB()
        return container
    
    def selectDsn(self):
        self.openDB()
        cursor.execute('SELECT * FROM dosen')
        container = []
        for kode_dosen,kode_mk,nama_mk,nama,username,password,no_telepon in cursor.fetchall():
            container.append((kode_dosen,kode_mk,nama_mk,nama,no_telepon))
        self.closeDB()
        return container
    
    def persenPrs(self, data):
        self.openDB()
        cursor.execute("select * from isi_presensi where nim='%s' and nama_mk='%s' order by jadwal"%data)
        container = cursor.fetchall()
        self.closeDB()
        print(container)
        return container
    
    def persentase(self):
        self.openDB()
        cursor.execute("select * from mahasiswa")
        container = cursor.fetchall()
        self.closeDB()
        print(container)
        return container

class isiPresensi :
    def __init__(self, nim=None, nama=None, prodi=None, semester=None, nama_mk=None, jadwal=None, tgl=None, jam=None, status=None):
        self.nim = nim
        self.nama = nama
        self.prodi = prodi
        self.semester = semester
        self.nama_mk = nama_mk
        self.jadwal = jadwal
        self.tgl = tgl
        self.jam = jam
        self.status = status
    
    def openDB(self):
        global db, cursor
        db = pymysql.connect(
            host = config.DB_HOST,
            user = config.DB_USER,
            password = config.DB_PASSWORD,
            database = config.DB_NAME)
        cursor = db.cursor()

    def closeDB(self):
        global db, cursor
        db.close()
    
    def insertDB(self, data):
        self.openDB()
        cursor.execute("INSERT INTO isi_presensi (nim,nama,prodi,semester,nama_mk,jadwal,tgl,jam,status) VALUES('%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s')" % data)
        db.commit()
        self.closeDB()

    def getDBbyNim(self, nim):
        self.openDB()
        cursor.execute("SELECT * FROM mahasiswa WHERE nim='%s' " % nim)
        data = cursor.fetchone()
        return data

    # def insertPrs(self, data):
    #     self.openDB()
    #     cursor.execute("INSERT INTO isi_presensi (nim,nama,prodi,semester,nama_mk,jadwal,tgl,jam,status) VALUES('%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s')" % data)
    #     db.commit()
    #     self.closeDB()

    def jmlhHadir(self, data):
        self.openDB()
        cursor.execute("select COUNT(*) FROM isi_presensi where nim='%s' and status='Hadir' and jadwal !=''" % data)
        data = cursor.fetchone()
        return data
    
    def jmlhIzin(self, data):
        self.openDB()
        cursor.execute("select COUNT(*) FROM isi_presensi where nim='%s' and status='Izin' and jadwal !=''" % data)
        data = cursor.fetchone()
        return data
    
    def jmlhSakit(self, data):
        self.openDB()
        cursor.execute("select COUNT(*) FROM isi_presensi where nim='%s' and status='Sakit' and jadwal !=''" % data)
        data = cursor.fetchone()
        return data
    
    def jmlhAlfa(self, data):
        self.openDB()
        cursor.execute("select COUNT(*) FROM isi_presensi where nim='%s' and status='Alfa' and jadwal !=''" % data)
        data = cursor.fetchone()
        return data
    
    def updateRekap(self, data):
        self.openDB()
        cursor.execute("UPDATE jmlh_presensi SET jmlh_hadir='%s', jmlh_sakit='%s', jmlh_izin='%s', jmlh_alfa='%s' WHERE nim='%s'" % data)
        db.commit()
        db.close()
    
    
class mataKuliah :
    def __init__(self, kode_mk=None, nama_mk=None, jumlah_sks=None, kode_dosen=None):
        self.kode_mk = kode_mk
        self.nama_mk = nama_mk
        self.jumlah_sks = jumlah_sks
        self.kode_dosen = kode_dosen

    def openDB(self):
        global db, cursor
        db = pymysql.connect(
            host = config.DB_HOST,
            user = config.DB_USER,
            password = config.DB_PASSWORD,
            database = config.DB_NAME)
        cursor = db.cursor()
    
    def closeDB(self):
        global db, cursor
        db.close()
    
    def selectDB(self):
        self.openDB()
        cursor.execute('SELECT * FROM mata_kuliah')
        container = []
        for kode_mk,nama_mk,jumlah_sks,kode_dosen in cursor.fetchall():
            container.append((kode_mk,nama_mk,jumlah_sks,kode_dosen))
        self.closeDB()
        return container
    
class JmlhPresensi():
    
    def __init__(self, jmlh_hadir=None, jmlh_sakit=None, jmlh_izin=None, jmlh_alfa=None):
        self.jmlh_hadir = jmlh_hadir
        self.jmlh_sakit = jmlh_sakit
        self.jmlh_izin = jmlh_izin
        self.jmlh_alfa = jmlh_alfa

    def openDB(self):
        global db, cursor
        db = pymysql.connect(
            host = config.DB_HOST,
            user = config.DB_USER,
            password = config.DB_PASSWORD,
            database = config.DB_NAME)
        cursor = db.cursor()
    
    def closeDB(self):
        global db, cursor
        db.close()

    def selectJP(self):
        self.openDB()
        cursor.execute('SELECT * FROM jmlh_presensi')
        container = cursor.fetchall()
        self.closeDB()
        return container
    