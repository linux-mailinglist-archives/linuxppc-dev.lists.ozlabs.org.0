Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B17D365C90B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Jan 2023 22:45:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NmmW33pLbz3c6V
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Jan 2023 08:45:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=OWV7xG94;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.54; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=OWV7xG94;
	dkim-atps=neutral
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nmk9M2t4dz30CT
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Jan 2023 07:00:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1672775998;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=AfT9k2iKNU82VD838vhRLCA7n1FWjQmZ/wjeb/3a6Vw=;
    b=OWV7xG948fVJZsrXEsCLiPSzYjM2uybyWxUyVQDUvc+jo9WxlHJJ2tdHacMXXTJAU5
    ShGZfv9pm2ui5pTtr4ZCi/f8KurHGoqhahypuBH87e72HOgSdENMY+6yzclcjK9+cvGB
    G1qLwUB1tZHzMIZM5FzUpFpdpHovfTQXdUPrjWBcuVpD6mFwXe4sIUgyujEhVEIbT0Fb
    WTXYVEbyqnFw5z2jZyWjyJBCDLYgyyIWbbZ9x222/HcBO7zT2qFGIHbNoR00QKJyCbAQ
    vTJmMuAwBvn6YF76lFxOpkvrdP2bD+3CUyFXqX+b23DqlYpPOqiK3b4dM753qBgI/9VS
    iafQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7R7b2Yg3rpgwHeJIHZtdizixhiLACOsKYch285IARkW"
X-RZG-CLASS-ID: mo00
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 48.2.1 AUTH)
    with ESMTPSA id e28afdz03JxvLfj
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 3 Jan 2023 20:59:57 +0100 (CET)
Content-Type: multipart/alternative; boundary=Apple-Mail-481E6CEE-7D6E-4F2B-A406-1649F55DD390
Content-Transfer-Encoding: 7bit
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Mime-Version: 1.0 (1.0)
Subject: Re: [FSL P50x0] DPAA Ethernet issue
Date: Tue, 3 Jan 2023 20:59:47 +0100
Message-Id: <66698FE4-603A-4648-82B2-7E4B56B2A3CD@xenosoft.de>
References: <430001ad-bc25-d4be-6013-673c14e87dba@xenosoft.de>
In-Reply-To: <430001ad-bc25-d4be-6013-673c14e87dba@xenosoft.de>
To: Sean Anderson <seanga2@gmail.com>,
 Madalin Bucur <madalin.bucur@nxp.com>,
 "David S. Miller" <davem@davemloft.net>
X-Mailer: iPhone Mail (20C65)
X-Mailman-Approved-At: Wed, 04 Jan 2023 08:44:48 +1100
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: darren@stevens-zone.net, madskateman@gmail.com, sean.anderson@seco.com, netdev@vger.kernel.org, Eric Dumazet <edumazet@google.com>, rtd2@xtra.co.nz, Jakub Kicinski <kuba@kernel.org>, matthew@a-eon.biz, Paolo Abeni <pabeni@redhat.com>, linuxppc-dev@lists.ozlabs.org, info@xenosoft.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--Apple-Mail-481E6CEE-7D6E-4F2B-A406-1649F55DD390
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable



> On 3. Jan 2023, at 05:04, Christian Zigotzky <chzigotzky@xenosoft.de> wrot=
e:
>=20
> =EF=BB=BFOn 02 January 2023 at 04:32 am, Christian Zigotzky wrote:
>> On 01 January 2023 at 07:11 pm, Sean Anderson wrote:
>>=20
>> Thank you for testing this. Unfortunately, I have no P-series hardware,
>> so I was unable to test the 10gec/dtsec parts of this conversion. I had
>> hoped that this would get tested by someone with the hardware (at NXP)
>> before now, but it seems you get to be the "lucky" first user.
>>=20
>> I see you have labeled one of your kernels as supporting QEMU.  Do you
>> happen to have instructions for running Linux on QEMU?
>>=20
>> Can you try the following patch. I think my mail client will mangle it,  s=
o I have also attached it to this email.
>>=20
>> ------------
>>=20
>> Hi Sean,
>>=20
>> Thanks a lot for your answer.
>>=20
>> I use the virtio-net device in a virtual e5500 QEMU/KVM HV machine. [1] [=
2]
>>=20
>> I will test your patch as soon as possible.
>>=20
>> Thanks,
>> Christian
>>=20
>> [1] QEMU command: qemu-system-ppc64 -M ppce500 -cpu e5500 -m 1024 -kernel=
 uImage-6.2 -drive format=3Draw,file=3Dvoid-live-powerpc-20220129.img,index=3D=
0,if=3Dvirtio -netdev user,id=3Dmynet0 -device virtio-net,netdev=3Dmynet0 -a=
ppend "rw root=3D/dev/vda2" -device virtio-gpu -device virtio-mouse-pci -dev=
ice virtio-keyboard-pci -device pci-ohci,id=3Dnewusb -audiodev id=3Dsndbe,dr=
iver=3Dpa,server=3D/run/user/1000/pulse/native -device usb-audio,bus=3Dnewus=
b.0 -enable-kvm -smp 4 -fsdev local,security_model=3Dpassthrough,id=3Dfsdev0=
,path=3D/home/amigaone/Music -device virtio-9p-pci,id=3Dfs0,fsdev=3Dfsdev0,m=
ount_tag=3Dhostshare
>>=20
>> [2] https://forum.hyperion-entertainment.com/viewtopic.php?p=3D46749
>=20
> Hi Sean,
>=20
> I tested your patch with the RC2 today but unfortunately the kernel doesn'=
t link after compiling.
>=20
> Error messages:
>=20
>   LD      .tmp_vmlinux.kallsyms1
> `.exit.text' referenced in section `__bug_table' of crypto/algboss.o: defi=
ned in discarded section `.exit.text' of crypto/algboss.o
> `.exit.text' referenced in section `__bug_table' of crypto/algif_hash.o: d=
efined in discarded section `.exit.text' of crypto/algif_hash.o
> `.exit.text' referenced in section `__bug_table' of drivers/char/hw_random=
/core.o: defined in discarded section `.exit.text' of drivers/char/hw_random=
/core.o
> make[1]: *** [scripts/Makefile.vmlinux:34: vmlinux] Error 1
> make: *** [Makefile:1252: vmlinux] Error 2
>=20
> Maybe it is not an issue because of the patch because the RC1 compilied an=
d linked with the patch.
>=20
> @Dave
> Please test the RC1 with Sean's patch.
>=20
> Download: http://www.xenosoft.de/uImage-6.2-dpaa-t1
>=20
> Cheers,
> Christian

Hi Sean,

Dave successfully tested the DPAA Ethernet with the patched RC1 on his P5020=
 board (X5000) today.

Link to the test thread: https://forum.hyperion-entertainment.com/viewtopic.=
php?p=3D56360#p56360

Your patch has solved the issue. Thanks for your help.

Cheers,
Christian=

--Apple-Mail-481E6CEE-7D6E-4F2B-A406-1649F55DD390
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><br><div dir=3D"ltr"><br><blockquote type=3D=
"cite">On 3. Jan 2023, at 05:04, Christian Zigotzky &lt;chzigotzky@xenosoft.=
de&gt; wrote:<br><br></blockquote></div><blockquote type=3D"cite"><div dir=3D=
"ltr">=EF=BB=BF<span>On 02 January 2023 at 04:32 am, Christian Zigotzky wrot=
e:</span><br><blockquote type=3D"cite"><span>On 01 January 2023 at 07:11 pm,=
 Sean Anderson wrote:</span><br></blockquote><blockquote type=3D"cite"><span=
></span><br></blockquote><blockquote type=3D"cite"><span>Thank you for testi=
ng this. Unfortunately, I have no P-series hardware,</span><br></blockquote>=
<blockquote type=3D"cite"><span>so I was unable to test the 10gec/dtsec part=
s of this conversion. I had</span><br></blockquote><blockquote type=3D"cite"=
><span>hoped that this would get tested by someone with the hardware (at NXP=
)</span><br></blockquote><blockquote type=3D"cite"><span>before now, but it s=
eems you get to be the "lucky" first user.</span><br></blockquote><blockquot=
e type=3D"cite"><span></span><br></blockquote><blockquote type=3D"cite"><spa=
n>I see you have labeled one of your kernels as supporting QEMU.&nbsp; Do yo=
u</span><br></blockquote><blockquote type=3D"cite"><span>happen to have inst=
ructions for running Linux on QEMU?</span><br></blockquote><blockquote type=3D=
"cite"><span></span><br></blockquote><blockquote type=3D"cite"><span>Can you=
 try the following patch. I think my mail client will mangle it,&nbsp; so I h=
ave also attached it to this email.</span><br></blockquote><blockquote type=3D=
"cite"><span></span><br></blockquote><blockquote type=3D"cite"><span>-------=
-----</span><br></blockquote><blockquote type=3D"cite"><span></span><br></bl=
ockquote><blockquote type=3D"cite"><span>Hi Sean,</span><br></blockquote><bl=
ockquote type=3D"cite"><span></span><br></blockquote><blockquote type=3D"cit=
e"><span>Thanks a lot for your answer.</span><br></blockquote><blockquote ty=
pe=3D"cite"><span></span><br></blockquote><blockquote type=3D"cite"><span>I u=
se the virtio-net device in a virtual e5500 QEMU/KVM HV machine. [1] [2]</sp=
an><br></blockquote><blockquote type=3D"cite"><span></span><br></blockquote>=
<blockquote type=3D"cite"><span>I will test your patch as soon as possible.<=
/span><br></blockquote><blockquote type=3D"cite"><span></span><br></blockquo=
te><blockquote type=3D"cite"><span>Thanks,</span><br></blockquote><blockquot=
e type=3D"cite"><span>Christian</span><br></blockquote><blockquote type=3D"c=
ite"><span></span><br></blockquote><blockquote type=3D"cite"><span>[1] QEMU c=
ommand: qemu-system-ppc64 -M ppce500 -cpu e5500 -m 1024 -kernel uImage-6.2 -=
drive format=3Draw,file=3Dvoid-live-powerpc-20220129.img,index=3D0,if=3Dvirt=
io -netdev user,id=3Dmynet0 -device virtio-net,netdev=3Dmynet0 -append "rw r=
oot=3D/dev/vda2" -device virtio-gpu -device virtio-mouse-pci -device virtio-=
keyboard-pci -device pci-ohci,id=3Dnewusb -audiodev id=3Dsndbe,driver=3Dpa,s=
erver=3D/run/user/1000/pulse/native -device usb-audio,bus=3Dnewusb.0 -enable=
-kvm -smp 4 -fsdev local,security_model=3Dpassthrough,id=3Dfsdev0,path=3D/ho=
me/amigaone/Music -device virtio-9p-pci,id=3Dfs0,fsdev=3Dfsdev0,mount_tag=3D=
hostshare</span><br></blockquote><blockquote type=3D"cite"><span></span><br>=
</blockquote><blockquote type=3D"cite"><span>[2] https://forum.hyperion-ente=
rtainment.com/viewtopic.php?p=3D46749</span><br></blockquote><span></span><b=
r><span>Hi Sean,</span><br><span></span><br><span>I tested your patch with t=
he RC2 today but unfortunately the kernel doesn't link after compiling.</spa=
n><br><span></span><br><span>Error messages:</span><br><span></span><br><spa=
n>&nbsp; LD&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .tmp_vmlinux.kallsyms1</span><br><=
span>`.exit.text' referenced in section `__bug_table' of crypto/algboss.o: d=
efined in discarded section `.exit.text' of crypto/algboss.o</span><br><span=
>`.exit.text' referenced in section `__bug_table' of crypto/algif_hash.o: de=
fined in discarded section `.exit.text' of crypto/algif_hash.o</span><br><sp=
an>`.exit.text' referenced in section `__bug_table' of drivers/char/hw_rando=
m/core.o: defined in discarded section `.exit.text' of drivers/char/hw_rando=
m/core.o</span><br><span>make[1]: *** [scripts/Makefile.vmlinux:34: vmlinux]=
 Error 1</span><br><span>make: *** [Makefile:1252: vmlinux] Error 2</span><b=
r><span></span><br><span>Maybe it is not an issue because of the patch becau=
se the RC1 compilied and linked with the patch.</span><br><span></span><br><=
span>@Dave</span><br><span>Please test the RC1 with Sean's patch.</span><br>=
<span></span><br><span>Download: http://www.xenosoft.de/uImage-6.2-dpaa-t1</=
span><br><span></span><br><span>Cheers,</span><br><span>Christian</span><br>=
</div></blockquote><br><div>Hi Sean,</div><div><br></div><div>Dave successfu=
lly tested the DPAA Ethernet with the patched RC1 on his P5020 board (X5000)=
 today.</div><div><br></div><div>Link to the test thread:&nbsp;<a href=3D"ht=
tps://forum.hyperion-entertainment.com/viewtopic.php?p=3D56360#p56360">https=
://forum.hyperion-entertainment.com/viewtopic.php?p=3D56360#p56360</a></div>=
<div><br></div><div>Your patch has solved the issue. Thanks for your help.</=
div><div><br></div><div>Cheers,</div><div>Christian</div></body></html>=

--Apple-Mail-481E6CEE-7D6E-4F2B-A406-1649F55DD390--
