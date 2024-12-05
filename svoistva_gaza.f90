subroutine svoistva_gaza(z,ro,mu,p,t,roc,xa,xy)
    !���� 30319.2�2015
    real,intent(in) :: p,t ! p - � ���, t - � K
    real :: x1,roc,xe,xa,xy,zc,Me,He
    real,intent(out) :: z,ro,mu
    real :: A0,A1,A2
    real :: B0,B1,B2,B23,B3,Bx,Bm,b
    real :: C0,C1,C2,C3,C223,C233,Cx,Cm
    real :: R,Mm,ppk,tpk,pp,tp
    !roc - ��������� ���� ��� ����������� ��������
    !xa - �������� ���� �����
    !xy - �������� ���� �������� ��������
    
    xe=1.-xa-xy !� �������� ���� �������������� ������������
    zc=1.-(0.0741*roc-0.006-0.063*xa-0.0575*xy)**2.
    Me=(24.05525*zc*roc-28.0135*xa-44.01*xy)/xe
    He=128.64+47.479*Me
    B1=-0.425468+2.865e-3*t-4.62073e-6*t**2.+(8.77118e-4-5.56281e-6*t+8.81514e-9*t**2.)*He+&
        & (-8.24747e-7+4.31436e-9*t-6.08319e-12*t**2.)*He**2.
    B2=-0.1446+7.4091e-4*t-9.1195e-7*t**2.
    B23=-0.339693+1.61176e-3*t-2.04429e-6*t**2.
    B3=-0.86834+4.0376e-3*t-5.1657e-6*t**2.
    C1=-0.302488+1.95861e-3*t-3.16302e-6*t**2.+(6.46422e-4-4.22876e-6*t+6.88157e-9*t**2.)*He+&
        & (-3.32805e-7+2.2316e-9*t-3.67713e-12*t**2.)*He**2.
    C2=7.8498e-3-3.9895e-5*t+6.1187e-8*t**2.
    C3=2.0513e-3+3.4888e-5*t-8.3703e-8*t**2.
    C223=5.52066e-3-1.68609e-5*t+1.57169e-8*t**2.
    C233=3.58783e-3+8.06674e-6*t-3.25798e-8*t**2.
    Bx=0.72+1.875e-5*(320.-t)**2.
    Cx=0.92+0.0013*(t-270.)
    Bm=xe**2.*B1+xe*xa*Bx*(B1+B2)-1.73*xe*xy*(B1*B3)**0.5+xa**2.*B2+2.*xa*xy*B23+xy**2.*B3
    Cm=xe**3.*C1+3*xe**2.*xa*Cx*(C1**2*C2)**(1./3.)+2.76*xe**2*xy*(C1**2*C3)**(1./3.)+3.*xe*xa**2.*Cx*(C1*C2**2.)**(1./3.)+&
        & 6.6*xe*xa*xy*(C1*C2*C3)**(1./3.)+2.76*xa*xy**2.*(C1*C3**2.)**(1./3.)+xa**3.*C2+3.*xa**2.*xy*C223+3.*xa*xy**2.*C233+xy**3.*C3
    b=1000.*p/(2.7715*t)
    C0=b**2.*Cm
    B0=b*Bm
    A0=1.+1.5*(B0+C0)
    A1=1.+B0
    A2=(A0-(A0**2.-A1**3.)**0.5)**(1./3.)
    z=(1.+A2+A1/A2)/3.    !����������� ����������� ����
    R=8.31446261815324
    Mm=24.05525*zc*roc !�������� ����� ����
    ro=1000*Mm*p/(R*t*z) !��������� ����, ��/�3
    ppk=2.9585*(1.608-0.05995*roc+xy-0.392*xa) !����������������� ��������, ���
    tpk=88.25*(0.9915+1.759*roc-xy-1.681*xa) !����������������� �����������, �
    pp=p/ppk !����������� ��������
    tp=t/tpk !����������� �����������
    mu=(3.24*(t**0.5+1.37-9.09*roc**0.125)/(roc**0.5+2.08-1.5*(xa+xy))*(1+(pp**2./(30*(tp-1)))))!������������ ��������, ����*�
    !write(*,*)'Mu=',mu
    
    
end subroutine svoistva_gaza
    