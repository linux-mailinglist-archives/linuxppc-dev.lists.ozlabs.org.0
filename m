Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6205FFD52
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Oct 2022 07:18:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MqpLV1p7Sz3drS
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Oct 2022 16:18:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=GTBkqKA6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.51; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=GTBkqKA6;
	dkim-atps=neutral
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mprx25XTYz2xJS
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Oct 2022 03:11:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1665763884;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=IiM8cdEwsZYug5Uy9A+BwAm2KOGItZZ1nnbIEgk0Osg=;
    b=GTBkqKA6HmiHi6z/L5SCXzvTm/jwhP2T1zQ+M7c4mxulrRHpaK3JA4Lw7nuwii9R3F
    BG4EzBeB/xaqCKcudZCYDscyN7a9NRuw+LEJcGfc4QCyTmHjoNRNG609//Q6d13k+0Pb
    q4kOaLr/khPUpO4JgOkw2z3ZEY4VOq3i6dYus0Ra3t/v8susYv+ueyP2oMRAJ9O5bykm
    VY+kEVDwfH6SMcg9P42t2rsT8wWozogAD1j5gzinn438pKQ8baP4qMwzIO6OF0gW+7ZC
    9+088r3CGoyIzN4deYK7m4W7TFjqZMVaAr0KDrsgwU3h88fGRQgjmgisslYEbJEsfDmU
    CobA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7R7NGYjiLptwSPMLf/ddej+5XSBebhkRGU9lpwgWL0Z"
X-RZG-CLASS-ID: mo00
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 48.2.0 AUTH)
    with ESMTPSA id j7449ey9EGBMD1b
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Fri, 14 Oct 2022 18:11:22 +0200 (CEST)
Content-Type: multipart/alternative; boundary=Apple-Mail-1D9FC5C2-9D66-458B-9274-975D3F7A8E2B
Content-Transfer-Encoding: 7bit
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Mime-Version: 1.0 (1.0)
Subject: Re: Issues with the first PowerPC updates for the kernel 6.1
Date: Fri, 14 Oct 2022 18:11:21 +0200
Message-Id: <0D8C8783-238D-4B4D-BA3D-766AB7139253@xenosoft.de>
References: <0D40FEF9-D87D-42C4-BC31-EC8AE952C1FB@xenosoft.de>
In-Reply-To: <0D40FEF9-D87D-42C4-BC31-EC8AE952C1FB@xenosoft.de>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
X-Mailer: iPhone Mail (19H12)
X-Mailman-Approved-At: Sun, 16 Oct 2022 16:17:37 +1100
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
Cc: Darren Stevens <darren@stevens-zone.net>, Andrew Donnellan <ajd@linux.ibm.com>, mad skateman <madskateman@gmail.com>, npiggin@gmail.com, rmclure@linux.ibm.com, Trevor Dickinson <rtd2@xtra.co.nz>, Olof Johansson <olof@lixom.net>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--Apple-Mail-1D9FC5C2-9D66-458B-9274-975D3F7A8E2B
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi All,

make oldconfig has asked because of the CPU family. I choosed GENERIC for my=
 P.A. Semi PWRficient PA6T-1682M. Is this correct? Maybe this is the problem=
.

config GENERIC_CPU
-	bool "Generic (POWER4 and above)"
+	bool "Generic (POWER5 and PowerPC 970 and above)"
 	depends on PPC_BOOK3S_64 && !CPU_LITTLE_ENDIAN
 	select PPC_64S_HASH_MMU

There isn=E2=80=99t a POWER4 anymore and I used it via CONFIG_GENERIC_CPU=3D=
y before.

Before the first PowerPC updates:
CONFIG_GENERIC_CPU=3Dy
# CONFIG_POWER5_CPU is not set

Link: https://github.com/torvalds/linux/blob/master/arch/powerpc/platforms/K=
config.cputype

=E2=80=94 Christian

> On 13. Oct 2022, at 11:42, Christian Zigotzky <chzigotzky@xenosoft.de> wro=
te:
>=20
> =EF=BB=BFHi Christophe,
>=20
> Thanks a lot for your answer. OK, now, I know, that I don=E2=80=99t need t=
o test it. After the boot of the latest git kernel, my system was extremely d=
amaged. Some config files have a size of several gigabytes for example the r=
esolv.conf. I tried to repair this Debian system but without any success.
> I copied with dd and Netcat via network another rootfs from another comput=
er to the damaged partition.
> I don=E2=80=99t have the time to do it always again and again after a bad b=
isect result.
> I will wait some weeks and try it again.
>=20
> Cheers,
> Christian
>=20
>> On 13. Oct 2022, at 09:28, Christophe Leroy <christophe.leroy@csgroup.eu>=
 wrote:
>>=20
>> =EF=BB=BF
>>=20
>>>> Le 13/10/2022 =C3=A0 09:03, Christian Zigotzky a =C3=A9crit :
>>> Hi Andrew,
>>>=20
>>> Does this patch also affect 64-bit kernels?
>>>=20
>>> We use often 32-bit userlands with 64-bit kernels.
>>=20
>> As far as I understand, it was already correct for 32-bit userlands with=20=

>> 64 bit kernels, aka compat.
>>=20
>> The patch applies the same approach for 32 bit kernels, as explained in=20=

>> the commit message : "Fix this by having 32-bit kernels share those=20
>> syscall definitions with compat."
>>=20
>> Christophe
>>=20
>>>=20
>>> Cheers,
>>> Christian
>>>=20
>>>>> On 12. Oct 2022, at 09:56, Andrew Donnellan <ajd@linux.ibm.com> wrote:=

>>>>=20
>>>> =EF=BB=BFOn Wed, 2022-10-12 at 08:51 +0200, Christian Zigotzky wrote:
>>>>> Hi All,
>>>>>=20
>>>>> I use the Nemo board with a PASemi PA6T CPU and have some issues
>>>>> since the first PowerPC updates for the kernel 6.1.
>>>>>=20
>>>>> I successfully compiled the git kernel with the first PowerPC updates
>>>>> two days ago.
>>>>>=20
>>>>> Unfortunately this kernel is really dangerous. Many things for
>>>>> example Network Manager and LightDM don't work anymore and produced
>>>>> several gigabyte of config files till the partition has been filled.
>>>>>=20
>>>>> I deleted some files like the resolv.conf that had a size over 200
>>>>> GB!
>>>>>=20
>>>>> Unfortunately, MintPPC was still damaged. For example LightDM doesn't
>>>>> work anymore and the MATE desktop doesn't display any icons anymore
>>>>> because Caja wasn't able to reserve memory anymore.
>>>>>=20
>>>>> In this case, bisecting isn't an option and I have to wait some
>>>>> weeks. It is really difficult to find the issue if the userland will
>>>>> damaged again and again.
>>>>=20
>>>> Could you try with
>>>> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20221012035335.=
866440-1-npiggin@gmail.com/
>>>> to see if your issues are related to that?
>>>>=20
>>>> Andrew
>>>>=20
>>>> --=20
>>>> Andrew Donnellan    OzLabs, ADL Canberra
>>>> ajd@linux.ibm.com   IBM Australia Limited
>>>>=20
>=20

--Apple-Mail-1D9FC5C2-9D66-458B-9274-975D3F7A8E2B
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div>Hi All,</div><div><br></div>make oldco=
nfig has asked because of the CPU family. I choosed GENERIC for my P.A. Semi=
&nbsp;PWRficient&nbsp;PA6T-1682M. Is this correct? Maybe this is the problem=
.<div><br></div><div><div>config GENERIC_CPU</div><div>-<span class=3D"Apple=
-tab-span" style=3D"white-space:pre">	</span>bool "Generic (POWER4 and ab=
ove)"</div><div>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">=
	</span>bool "Generic (POWER5 and PowerPC 970 and above)"</div><div>&nbsp;<s=
pan class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>depends on P=
PC_BOOK3S_64 &amp;&amp; !CPU_LITTLE_ENDIAN</div><div>&nbsp;<span class=3D"Ap=
ple-tab-span" style=3D"white-space:pre">	</span>select PPC_64S_HASH_=
MMU</div><div><br></div><div>There isn=E2=80=99t a POWER4 anymore and I used=
 it via CONFIG_GENERIC_CPU=3Dy before.</div><div><br></div><div>Before the f=
irst PowerPC updates:</div><div>CONFIG_GENERIC_CPU=3Dy</div><div># CONFIG_PO=
WER5_CPU is not set</div><div><br></div><div>Link:&nbsp;<a href=3D"https://g=
ithub.com/torvalds/linux/blob/master/arch/powerpc/platforms/Kconfig.cputype"=
>https://github.com/torvalds/linux/blob/master/arch/powerpc/platforms/Kconfi=
g.cputype</a></div><div><br></div><div>=E2=80=94 Christian</div><div dir=3D"=
ltr"><br><blockquote type=3D"cite">On 13. Oct 2022, at 11:42, Christian Zigo=
tzky &lt;chzigotzky@xenosoft.de&gt; wrote:<br><br></blockquote></div><blockq=
uote type=3D"cite"><div dir=3D"ltr">=EF=BB=BF<span>Hi Christophe,</span><br>=
<span></span><br><span>Thanks a lot for your answer. OK, now, I know, that I=
 don=E2=80=99t need to test it. After the boot of the latest git kernel, my s=
ystem was extremely damaged. Some config files have a size of several gigaby=
tes for example the resolv.conf. I tried to repair this Debian system but wi=
thout any success.</span><br><span>I copied with dd and Netcat via network a=
nother rootfs from another computer to the damaged partition.</span><br><spa=
n>I don=E2=80=99t have the time to do it always again and again after a bad b=
isect result.</span><br><span>I will wait some weeks and try it again.</span=
><br><span></span><br><span>Cheers,</span><br><span>Christian</span><br><spa=
n></span><br><blockquote type=3D"cite"><span>On 13. Oct 2022, at 09:28, Chri=
stophe Leroy &lt;christophe.leroy@csgroup.eu&gt; wrote:</span><br></blockquo=
te><blockquote type=3D"cite"><span></span><br></blockquote><blockquote type=3D=
"cite"><span>=EF=BB=BF</span><br></blockquote><blockquote type=3D"cite"><spa=
n></span><br></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite=
"><span>Le 13/10/2022 =C3=A0 09:03, Christian Zigotzky a =C3=A9crit :</span>=
<br></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"=
cite"><span>Hi Andrew,</span><br></blockquote></blockquote><blockquote type=3D=
"cite"><blockquote type=3D"cite"><span></span><br></blockquote></blockquote>=
<blockquote type=3D"cite"><blockquote type=3D"cite"><span>Does this patch al=
so affect 64-bit kernels?</span><br></blockquote></blockquote><blockquote ty=
pe=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquote></blockq=
uote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>We use often 3=
2-bit userlands with 64-bit kernels.</span><br></blockquote></blockquote><bl=
ockquote type=3D"cite"><span></span><br></blockquote><blockquote type=3D"cit=
e"><span>As far as I understand, it was already correct for 32-bit userlands=
 with </span><br></blockquote><blockquote type=3D"cite"><span>64 bit kernels=
, aka compat.</span><br></blockquote><blockquote type=3D"cite"><span></span>=
<br></blockquote><blockquote type=3D"cite"><span>The patch applies the same a=
pproach for 32 bit kernels, as explained in </span><br></blockquote><blockqu=
ote type=3D"cite"><span>the commit message : "Fix this by having 32-bit kern=
els share those </span><br></blockquote><blockquote type=3D"cite"><span>sysc=
all definitions with compat."</span><br></blockquote><blockquote type=3D"cit=
e"><span></span><br></blockquote><blockquote type=3D"cite"><span>Christophe<=
/span><br></blockquote><blockquote type=3D"cite"><span></span><br></blockquo=
te><blockquote type=3D"cite"><blockquote type=3D"cite"><span></span><br></bl=
ockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><s=
pan>Cheers,</span><br></blockquote></blockquote><blockquote type=3D"cite"><b=
lockquote type=3D"cite"><span>Christian</span><br></blockquote></blockquote>=
<blockquote type=3D"cite"><blockquote type=3D"cite"><span></span><br></block=
quote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><bloc=
kquote type=3D"cite"><blockquote type=3D"cite"><span>On 12. Oct 2022, at 09:=
56, Andrew Donnellan &lt;ajd@linux.ibm.com&gt; wrote:</span><br></blockquote=
></blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquot=
e type=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquote></bl=
ockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><b=
lockquote type=3D"cite"><span>=EF=BB=BFOn Wed, 2022-10-12 at 08:51 +0200, Ch=
ristian Zigotzky wrote:</span><br></blockquote></blockquote></blockquote><bl=
ockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><=
blockquote type=3D"cite"><span>Hi All,</span><br></blockquote></blockquote><=
/blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"=
><blockquote type=3D"cite"><blockquote type=3D"cite"><span></span><br></bloc=
kquote></blockquote></blockquote></blockquote><blockquote type=3D"cite"><blo=
ckquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><s=
pan>I use the Nemo board with a PASemi PA6T CPU and have some issues</span><=
br></blockquote></blockquote></blockquote></blockquote><blockquote type=3D"c=
ite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span>since the first PowerPC updates for the kernel 6.1.</span><br><=
/blockquote></blockquote></blockquote></blockquote><blockquote type=3D"cite"=
><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cit=
e"><span></span><br></blockquote></blockquote></blockquote></blockquote><blo=
ckquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><b=
lockquote type=3D"cite"><span>I successfully compiled the git kernel with th=
e first PowerPC updates</span><br></blockquote></blockquote></blockquote></b=
lockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote ty=
pe=3D"cite"><blockquote type=3D"cite"><span>two days ago.</span><br></blockq=
uote></blockquote></blockquote></blockquote><blockquote type=3D"cite"><block=
quote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><spa=
n></span><br></blockquote></blockquote></blockquote></blockquote><blockquote=
 type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquo=
te type=3D"cite"><span>Unfortunately this kernel is really dangerous. Many t=
hings for</span><br></blockquote></blockquote></blockquote></blockquote><blo=
ckquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><b=
lockquote type=3D"cite"><span>example Network Manager and LightDM don't work=
 anymore and produced</span><br></blockquote></blockquote></blockquote></blo=
ckquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=
=3D"cite"><blockquote type=3D"cite"><span>several gigabyte of config files t=
ill the partition has been filled.</span><br></blockquote></blockquote></blo=
ckquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><bl=
ockquote type=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquo=
te></blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockqu=
ote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>=
I deleted some files like the resolv.conf that had a size over 200</span><br=
></blockquote></blockquote></blockquote></blockquote><blockquote type=3D"cit=
e"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"c=
ite"><span>GB!</span><br></blockquote></blockquote></blockquote></blockquote=
><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cit=
e"><blockquote type=3D"cite"><span></span><br></blockquote></blockquote></bl=
ockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><b=
lockquote type=3D"cite"><blockquote type=3D"cite"><span>Unfortunately, MintP=
PC was still damaged. For example LightDM doesn't</span><br></blockquote></b=
lockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote ty=
pe=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>work a=
nymore and the MATE desktop doesn't display any icons anymore</span><br></bl=
ockquote></blockquote></blockquote></blockquote><blockquote type=3D"cite"><b=
lockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite">=
<span>because Caja wasn't able to reserve memory anymore.</span><br></blockq=
uote></blockquote></blockquote></blockquote><blockquote type=3D"cite"><block=
quote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><spa=
n></span><br></blockquote></blockquote></blockquote></blockquote><blockquote=
 type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquo=
te type=3D"cite"><span>In this case, bisecting isn't an option and I have to=
 wait some</span><br></blockquote></blockquote></blockquote></blockquote><bl=
ockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><=
blockquote type=3D"cite"><span>weeks. It is really difficult to find the iss=
ue if the userland will</span><br></blockquote></blockquote></blockquote></b=
lockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote ty=
pe=3D"cite"><blockquote type=3D"cite"><span>damaged again and again.</span><=
br></blockquote></blockquote></blockquote></blockquote><blockquote type=3D"c=
ite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span></span><br></=
blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><span>Could you try with</span><br></=
blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><span>https://patchwork.ozlabs.org/pr=
oject/linuxppc-dev/patch/20221012035335.866440-1-npiggin@gmail.com/</span><b=
r></blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquo=
te type=3D"cite"><blockquote type=3D"cite"><span>to see if your issues are r=
elated to that?</span><br></blockquote></blockquote></blockquote><blockquote=
 type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span></s=
pan><br></blockquote></blockquote></blockquote><blockquote type=3D"cite"><bl=
ockquote type=3D"cite"><blockquote type=3D"cite"><span>Andrew</span><br></bl=
ockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote typ=
e=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquote></blockqu=
ote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockq=
uote type=3D"cite"><span>-- </span><br></blockquote></blockquote></blockquot=
e><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"ci=
te"><span>Andrew Donnellan &nbsp;&nbsp;&nbsp;OzLabs, ADL Canberra</span><br>=
</blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote=
 type=3D"cite"><blockquote type=3D"cite"><span>ajd@linux.ibm.com &nbsp;&nbsp=
;IBM Australia Limited</span><br></blockquote></blockquote></blockquote><blo=
ckquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><s=
pan></span><br></blockquote></blockquote></blockquote><span></span><br></div=
></blockquote></div></body></html>=

--Apple-Mail-1D9FC5C2-9D66-458B-9274-975D3F7A8E2B--
