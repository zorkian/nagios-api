from distutils.core import setup
import nagios

setup(name='nagios-api',
      version=nagios.version,
      description='Control nagios using an API',
      author='Mark Smith',
      author_email='mark@qq.is',
      license='BSD New (3-clause) License',
      long_description=open('README').read(),
      url='https://github.com/xb95/nagios-api',
      packages=['nagios'],
      scripts=['nagios-cli', 'nagios-api'],
      requires=[
        'diesel(>=3.0)',
        'greenlet(==0.3.4)',
        'requests'
      ]
     )
