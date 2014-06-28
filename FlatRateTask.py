__author__ = 'AYeager'


from PyQt4 import QtGui, QtCore, QtSql
import ui_dlg_FlatRateTask as FlatRateDlg
import sys


class taskWindow(QtGui.QDialog, FlatRateDlg.Ui_FlatRateTaskDialog):
    """Flat Rate Gui Object"""

    def __init__(self, parent=None):
        super(taskWindow, self).__init__(parent)
        self.setupUi(self)
        self.dbConnect()

    def dbConnect(self):

        #self.driver = QtSql.QSqlDriver()
        self.db = QtSql.QSqlDatabase.addDatabase("ODBC3")
        self.db.setDatabaseName('TradeMaster')

class taskObject(object):
    def __init__(self, taskID= None, name= None, invoiceDescription= None, detailedDescription= None, createDate= None,
                 lastUpdated=None, taskMaterials={}, taskGroup=None, laborHours= None):

        self.taskID = taskID
        self.taskName = name
        self.invoiceDescription = invoiceDescription
        self.detailedDescription = detailedDescription
        self.createDate = createDate
        self.lastUpdated = lastUpdated
        self.taskMaterials = taskMaterials
        self.taskGroup = taskGroup
        self.laborHours = laborHours


class inventoryObject(object):
    def __init__(self, partID=None, partName=None, partDescription=None, sellPrice=None):

        self.partID = partID
        self.partName = partName
        self.partDescription= partDescription
        self.sellPrice = sellPrice


def setupEdit():
    """setup of the Flat Rate Task Dock Widget"""

    # Test Data

    task = taskObject(1,'Fix a pooper', 'Make the brown stuff go down', 'The stuff ain\'t flushing man I need some help here!',
                           '07/16/2013', '07/16/2013', taskMaterials={}, taskGroup='Toilet Repair', laborHours=1.20)


    partsData = { '1234':{'Qty':5, 'Name': 'Poop Dissolving Tablet', "SellPrice": 5.50, 'LaborHours':.75 },
                  '1235':{'Qty':1, 'Name': 'Disposable air Filtration Mask', "SellPrice":3.25, 'LaborHours':0}
                }

def setupNew():
    pass

def updateTask():
    pass

def loadTask():
    pass

def makeTask():
    pass

def main():

    app = QtGui.QApplication(sys.argv)
    form = taskWindow()
    form.show()
    app.exec_()

main()





