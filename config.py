class Config:
    SECRET_KEY = 'BIKES'
    SQLALCHEMY_DATABASE_URI = 'mysql+pymysql://root:1234@localhost/bicyclestore'
    SQLALCHEMY_TRACK_MODIFICATIONS = False