Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7EA4219D6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 00:17:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNZpK2hnjz2xtc
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 09:17:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=Z4bflGLl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.50;
 helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=Z4bflGLl; 
 dkim-atps=neutral
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.50])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNFcq3yzrz2xtg
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Oct 2021 20:23:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1633339372;
 s=strato-dkim-0002; d=xenosoft.de;
 h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
 From:Subject:Sender;
 bh=ZVOzDss9x9ngtyfGLYvMwz8KKc8tZQuNcPXQgEYTehg=;
 b=Z4bflGLl33esPMUz2wJnbBQd2nleLwFC70O+FjXozH06UA5UrEiX4tTsqjmkQvHodc
 TBk0ODSP75x6qjlEULhAwA5OLZHvm4g8uHRiybw50J3aApm/8bl5Jmaj+onjgfEhnf9H
 /zxheRcctSUcEIutdiD0UN2ds04BJQu6T/IitIyzKJ6B7YyQDkiIkgZeC8XImwHL8pDv
 ODe8B6G+37vagfA+ddVZK6i6HbRe3wl5cBCxXiiewjCpt5Il6q8TuUuGvutgROzb+DGx
 G3llRdEQ/41umuGVAkuam6NR2QN8ltGiOfHoaILCNqsHKUa8LVww0kxCrCI11SIWelLV
 7lIg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7R7b2Z2iLowxnW5xdau+4p3FLe2JCuii1Hw7eG9unsd"
X-RZG-CLASS-ID: mo00
Received: from smtpclient.apple by smtp.strato.de (RZmta 47.33.8 AUTH)
 with ESMTPSA id I00cdex949Mnl9F
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 4 Oct 2021 11:22:49 +0200 (CEST)
Content-Type: multipart/alternative;
 boundary=Apple-Mail-BFABFE53-1E60-40F3-B9EF-BC1F987A543D
Content-Transfer-Encoding: 7bit
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Mime-Version: 1.0 (1.0)
Subject: Re: Add Apple M1 support to PASemi i2c driver
Date: Mon, 4 Oct 2021 11:22:48 +0200
Message-Id: <E1746395-FC34-4096-80BA-945559F263F2@xenosoft.de>
References: <49890226-cf04-46ff-bc37-33d1643faea2@www.fastmail.com>
In-Reply-To: <49890226-cf04-46ff-bc37-33d1643faea2@www.fastmail.com>
To: Sven Peter <sven@svenpeter.dev>
X-Mailer: iPhone Mail (19A346)
X-Mailman-Approved-At: Tue, 05 Oct 2021 09:16:56 +1100
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
Cc: Darren Stevens <darren@stevens-zone.net>, Arnd Bergmann <arnd@arndb.de>,
 Hector Martin <marcan@marcan.st>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-i2c@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 Olof Johansson <olof@lixom.net>, mohamed.mediouni@caramail.com,
 Matthew Leaman <matthew@a-eon.biz>, Mark Kettenis <mark.kettenis@xs4all.nl>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "R.T.Dickinson" <rtd@a-eon.com>,
 linux-arm-kernel@lists.infradead.org, Stan Skowronek <stan@corellium.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--Apple-Mail-BFABFE53-1E60-40F3-B9EF-BC1F987A543D
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable



> On 3. Oct 2021, at 16:36, Sven Peter <sven@svenpeter.dev> wrote:
>=20
> =EF=BB=BFHi,
>=20
>=20
>> On Fri, Oct 1, 2021, at 06:47, Christian Zigotzky wrote:
>>> On 27 September 2021 at 07:39 am, Sven Peter wrote:
>>> Hi Christian,
>>>=20
>>> Thanks already for volunteering to test this!
>>>=20
>> Hello Sven,
>>=20
>> Damien (Hypex) has successfully tested the RC3 of kernel 5.15 with your=20=

>> modified i2c driver on his Nemo board yesterday. [1]
>=20
> Thanks a lot, that's great to hear!
> If he wants to I can credit him with a Tested-by tag in the commit message=
,
> see e.g. https://www.kernel.org/doc/html/latest/process/submitting-patches=
.html#using-reported-by-tested-by-reviewed-by-suggested-by-and-fixes.
>=20
>=20
> Best,
>=20
>=20
> Sven

Hi Sven,

Unfortunately Damien has found an issue. [1]

Output of i2cdetect -l with the default RC3 of kernel 5.15 without your modi=
fications:

2c-0	i2c       	Radeon i2c bit bus 0x90         	I2C adapter=

i2c-1	i2c       	Radeon i2c bit bus 0x91         	I2C adapter=

i2c-2	i2c       	Radeon i2c bit bus 0x92         	I2C adapter=

i2c-3	i2c       	Radeon i2c bit bus 0x93         	I2C adapter=

i2c-4	i2c       	Radeon i2c bit bus 0x94         	I2C adapter=

i2c-5	i2c       	Radeon i2c bit bus 0x95         	I2C adapter=

i2c-6	i2c       	Radeon i2c bit bus 0x96         	I2C adapter=

i2c-7	i2c       	Radeon i2c bit bus 0x97         	I2C adapter=

i2c-8	i2c       	PA Semi SMBus adapter at 0x800200	I2C adapter=

i2c-9	i2c       	PA Semi SMBus adapter at 0x800240	I2C adapter=

i2c-10	i2c       	PA Semi SMBus adapter at 0x800280	I2C adapter=


Output of i2cdetect -l with your modifications:

i2c-0	i2c       	Radeon i2c bit bus 0x90         	I2C adapter=

i2c-1	i2c       	Radeon i2c bit bus 0x91         	I2C adapter=

i2c-2	i2c       	Radeon i2c bit bus 0x92         	I2C adapter=

i2c-3	i2c       	Radeon i2c bit bus 0x93         	I2C adapter=

i2c-4	i2c       	Radeon i2c bit bus 0x94         	I2C adapter=

i2c-5	i2c       	Radeon i2c bit bus 0x95         	I2C adapter=

i2c-6	i2c       	Radeon i2c bit bus 0x96         	I2C adapter=

i2c-7	i2c       	Radeon i2c bit bus 0x97         	I2C adapter=

i2c-8	i2c       	PA Semi SMBus adapter at 0x(____ptrval____)	I2C=
 adapter
i2c-9	i2c       	PA Semi SMBus adapter at 0x(____ptrval____)	I2C=
 adapter
i2c-10	i2c       	PA Semi SMBus adapter at 0x(____ptrval____)	I2C=
 adapter

Please check the outputs.

Thanks,
Christian

[1] https://forum.hyperion-entertainment.com/viewtopic.php?p=3D54165#p54165=

--Apple-Mail-BFABFE53-1E60-40F3-B9EF-BC1F987A543D
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><br><div dir=3D"ltr"><br><blockquote type=3D=
"cite">On 3. Oct 2021, at 16:36, Sven Peter &lt;sven@svenpeter.dev&gt; wrote=
:<br><br></blockquote></div><blockquote type=3D"cite"><div dir=3D"ltr">=EF=BB=
=BF<span>Hi,</span><br><span></span><br><span></span><br><span>On Fri, Oct 1=
, 2021, at 06:47, Christian Zigotzky wrote:</span><br><blockquote type=3D"ci=
te"><span>On 27 September 2021 at 07:39 am, Sven Peter wrote:</span><br></bl=
ockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>Hi Christ=
ian,</span><br></blockquote></blockquote><blockquote type=3D"cite"><blockquo=
te type=3D"cite"><span></span><br></blockquote></blockquote><blockquote type=
=3D"cite"><blockquote type=3D"cite"><span>Thanks already for volunteering to=
 test this!</span><br></blockquote></blockquote><blockquote type=3D"cite"><b=
lockquote type=3D"cite"><span></span><br></blockquote></blockquote><blockquo=
te type=3D"cite"><span>Hello Sven,</span><br></blockquote><blockquote type=3D=
"cite"><span></span><br></blockquote><blockquote type=3D"cite"><span>Damien (=
Hypex) has successfully tested the RC3 of kernel 5.15 with your </span><br><=
/blockquote><blockquote type=3D"cite"><span>modified i2c driver on his Nemo b=
oard yesterday. [1]</span><br></blockquote><span></span><br><span>Thanks a l=
ot, that's great to hear!</span><br><span>If he wants to I can credit him wi=
th a Tested-by tag in the commit message,</span><br><span>see e.g. https://w=
ww.kernel.org/doc/html/latest/process/submitting-patches.html#using-reported=
-by-tested-by-reviewed-by-suggested-by-and-fixes.</span><br><span></span><br=
><span></span><br><span>Best,</span><br><span></span><br><span></span><br><s=
pan>Sven</span><br></div></blockquote><br><div>Hi Sven,</div><div><br></div>=
<div>Unfortunately Damien has found an issue. [1]</div><div><br></div><div>O=
utput of i2cdetect -l with the default RC3 of kernel 5.15 without your modif=
ications:</div><div><br></div><div><div>2c-0<span class=3D"Apple-tab-span" s=
tyle=3D"white-space:pre">	</span>i2c &nbsp; &nbsp; &nbsp; <span class=
=3D"Apple-tab-span" style=3D"white-space:pre">	</span>Radeon i2c bit bus 0=
x90 &nbsp; &nbsp; &nbsp; &nbsp; <span class=3D"Apple-tab-span" style=3D"whit=
e-space:pre">	</span>I2C adapter</div><div>i2c-1<span class=3D"Apple-tab-=
span" style=3D"white-space:pre">	</span>i2c &nbsp; &nbsp; &nbsp; <sp=
an class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>Radeon i2c b=
it bus 0x91 &nbsp; &nbsp; &nbsp; &nbsp; <span class=3D"Apple-tab-span" style=
=3D"white-space:pre">	</span>I2C adapter</div><div>i2c-2<span class=3D"Ap=
ple-tab-span" style=3D"white-space:pre">	</span>i2c &nbsp; &nbsp; &n=
bsp; <span class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>Rade=
on i2c bit bus 0x92 &nbsp; &nbsp; &nbsp; &nbsp; <span class=3D"Apple-tab-spa=
n" style=3D"white-space:pre">	</span>I2C adapter</div><div>i2c-3<span cla=
ss=3D"Apple-tab-span" style=3D"white-space:pre">	</span>i2c &nbsp; &=
nbsp; &nbsp; <span class=3D"Apple-tab-span" style=3D"white-space:pre">	</s=
pan>Radeon i2c bit bus 0x93 &nbsp; &nbsp; &nbsp; &nbsp; <span class=3D"Apple=
-tab-span" style=3D"white-space:pre">	</span>I2C adapter</div><div>i2c-4<=
span class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>i2c &=
nbsp; &nbsp; &nbsp; <span class=3D"Apple-tab-span" style=3D"white-space:pre"=
>	</span>Radeon i2c bit bus 0x94 &nbsp; &nbsp; &nbsp; &nbsp; <span cl=
ass=3D"Apple-tab-span" style=3D"white-space:pre">	</span>I2C adapter<=
/div><div>i2c-5<span class=3D"Apple-tab-span" style=3D"white-space:pre">=
	</span>i2c &nbsp; &nbsp; &nbsp; <span class=3D"Apple-tab-span" style=3D"whi=
te-space:pre">	</span>Radeon i2c bit bus 0x95 &nbsp; &nbsp; &nbsp; &nbsp; <=
span class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>I2C a=
dapter</div><div>i2c-6<span class=3D"Apple-tab-span" style=3D"white-space:pr=
e">	</span>i2c &nbsp; &nbsp; &nbsp; <span class=3D"Apple-tab-span" styl=
e=3D"white-space:pre">	</span>Radeon i2c bit bus 0x96 &nbsp; &nbsp; &nbsp;=
 &nbsp; <span class=3D"Apple-tab-span" style=3D"white-space:pre">	</s=
pan>I2C adapter</div><div>i2c-7<span class=3D"Apple-tab-span" style=3D"white=
-space:pre">	</span>i2c &nbsp; &nbsp; &nbsp; <span class=3D"Apple-tab-sp=
an" style=3D"white-space:pre">	</span>Radeon i2c bit bus 0x97 &nbsp; &nbsp=
; &nbsp; &nbsp; <span class=3D"Apple-tab-span" style=3D"white-space:pre">=
	</span>I2C adapter</div><div>i2c-8<span class=3D"Apple-tab-span" style=3D"w=
hite-space:pre">	</span>i2c &nbsp; &nbsp; &nbsp; <span class=3D"Appl=
e-tab-span" style=3D"white-space:pre">	</span>PA Semi SMBus adapter at 0x8=
00200<span class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>I2C a=
dapter</div><div>i2c-9<span class=3D"Apple-tab-span" style=3D"white-space:pr=
e">	</span>i2c &nbsp; &nbsp; &nbsp; <span class=3D"Apple-tab-span" styl=
e=3D"white-space:pre">	</span>PA Semi SMBus adapter at 0x800240<span class=
=3D"Apple-tab-span" style=3D"white-space:pre">	</span>I2C adapter</div><di=
v>i2c-10<span class=3D"Apple-tab-span" style=3D"white-space:pre">	</s=
pan>i2c &nbsp; &nbsp; &nbsp; <span class=3D"Apple-tab-span" style=3D"white-s=
pace:pre">	</span>PA Semi SMBus adapter at 0x800280<span class=3D"Appl=
e-tab-span" style=3D"white-space:pre">	</span>I2C adapter</div></div><div>=
<br></div><div>Output of i2cdetect -l with your modifications:</div><div><br=
></div><div><div>i2c-0<span class=3D"Apple-tab-span" style=3D"white-space:pr=
e">	</span>i2c &nbsp; &nbsp; &nbsp; <span class=3D"Apple-tab-span" styl=
e=3D"white-space:pre">	</span>Radeon i2c bit bus 0x90 &nbsp; &nbsp; &nbsp;=
 &nbsp; <span class=3D"Apple-tab-span" style=3D"white-space:pre">	</s=
pan>I2C adapter</div><div>i2c-1<span class=3D"Apple-tab-span" style=3D"white=
-space:pre">	</span>i2c &nbsp; &nbsp; &nbsp; <span class=3D"Apple-tab-sp=
an" style=3D"white-space:pre">	</span>Radeon i2c bit bus 0x91 &nbsp; &nbsp=
; &nbsp; &nbsp; <span class=3D"Apple-tab-span" style=3D"white-space:pre">=
	</span>I2C adapter</div><div>i2c-2<span class=3D"Apple-tab-span" style=3D"w=
hite-space:pre">	</span>i2c &nbsp; &nbsp; &nbsp; <span class=3D"Appl=
e-tab-span" style=3D"white-space:pre">	</span>Radeon i2c bit bus 0x92 &nbs=
p; &nbsp; &nbsp; &nbsp; <span class=3D"Apple-tab-span" style=3D"white-space:=
pre">	</span>I2C adapter</div><div>i2c-3<span class=3D"Apple-tab-span" st=
yle=3D"white-space:pre">	</span>i2c &nbsp; &nbsp; &nbsp; <span class=
=3D"Apple-tab-span" style=3D"white-space:pre">	</span>Radeon i2c bit bus 0=
x93 &nbsp; &nbsp; &nbsp; &nbsp; <span class=3D"Apple-tab-span" style=3D"whit=
e-space:pre">	</span>I2C adapter</div><div>i2c-4<span class=3D"Apple-tab-=
span" style=3D"white-space:pre">	</span>i2c &nbsp; &nbsp; &nbsp; <sp=
an class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>Radeon i2c b=
it bus 0x94 &nbsp; &nbsp; &nbsp; &nbsp; <span class=3D"Apple-tab-span" style=
=3D"white-space:pre">	</span>I2C adapter</div><div>i2c-5<span class=3D"Ap=
ple-tab-span" style=3D"white-space:pre">	</span>i2c &nbsp; &nbsp; &n=
bsp; <span class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>Rade=
on i2c bit bus 0x95 &nbsp; &nbsp; &nbsp; &nbsp; <span class=3D"Apple-tab-spa=
n" style=3D"white-space:pre">	</span>I2C adapter</div><div>i2c-6<span cla=
ss=3D"Apple-tab-span" style=3D"white-space:pre">	</span>i2c &nbsp; &=
nbsp; &nbsp; <span class=3D"Apple-tab-span" style=3D"white-space:pre">	</s=
pan>Radeon i2c bit bus 0x96 &nbsp; &nbsp; &nbsp; &nbsp; <span class=3D"Apple=
-tab-span" style=3D"white-space:pre">	</span>I2C adapter</div><div>i2c-7<=
span class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>i2c &=
nbsp; &nbsp; &nbsp; <span class=3D"Apple-tab-span" style=3D"white-space:pre"=
>	</span>Radeon i2c bit bus 0x97 &nbsp; &nbsp; &nbsp; &nbsp; <span cl=
ass=3D"Apple-tab-span" style=3D"white-space:pre">	</span>I2C adapter<=
/div><div>i2c-8<span class=3D"Apple-tab-span" style=3D"white-space:pre">=
	</span>i2c &nbsp; &nbsp; &nbsp; <span class=3D"Apple-tab-span" style=3D"whi=
te-space:pre">	</span>PA Semi SMBus adapter at 0x(____ptrval____)<span cla=
ss=3D"Apple-tab-span" style=3D"white-space:pre">	</span>I2C adapter<=
/div><div>i2c-9<span class=3D"Apple-tab-span" style=3D"white-space:pre">=
	</span>i2c &nbsp; &nbsp; &nbsp; <span class=3D"Apple-tab-span" style=3D"whi=
te-space:pre">	</span>PA Semi SMBus adapter at 0x(____ptrval____)<span cla=
ss=3D"Apple-tab-span" style=3D"white-space:pre">	</span>I2C adapter<=
/div><div>i2c-10<span class=3D"Apple-tab-span" style=3D"white-space:pre">=
	</span>i2c &nbsp; &nbsp; &nbsp; <span class=3D"Apple-tab-span" style=3D"whi=
te-space:pre">	</span>PA Semi SMBus adapter at 0x(____ptrval____)<span cla=
ss=3D"Apple-tab-span" style=3D"white-space:pre">	</span>I2C adapter<=
/div></div><div><br></div><div>Please check the outputs.</div><div><br></div=
><div>Thanks,</div><div>Christian</div><div><br></div><div>[1]&nbsp;<a href=3D=
"https://forum.hyperion-entertainment.com/viewtopic.php?p=3D54165#p54165">ht=
tps://forum.hyperion-entertainment.com/viewtopic.php?p=3D54165#p54165</a></d=
iv></body></html>=

--Apple-Mail-BFABFE53-1E60-40F3-B9EF-BC1F987A543D--
