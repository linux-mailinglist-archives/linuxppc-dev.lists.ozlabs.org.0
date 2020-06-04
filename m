Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E866D1EECC5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 23:04:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49dJF96K4dzDqpG
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jun 2020 07:04:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo4-p00-ob.smtp.rzone.de (client-ip=81.169.146.220;
 helo=mo4-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=A7nn1cqP; 
 dkim-atps=neutral
X-Greylist: delayed 171 seconds by postgrey-1.36 at bilbo;
 Fri, 05 Jun 2020 01:49:57 AEST
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.220])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49d9Fx51zPzDqlZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Jun 2020 01:49:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1591285792;
 s=strato-dkim-0002; d=xenosoft.de;
 h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=l3gzpQjZk5/EtPbt/90ud0byv2MgDMopmydf1tNS8qc=;
 b=A7nn1cqPR0xF0POdl3kHL6MEkr51u5i9gIU7E1A0/CpAOIYVluC/eeBaf7s3GPqbFH
 etCgrUsynNOvI7MvqvgvEayhSyfMwboM2bgFR7mdOFxlE28JvVA+1hrHfL7X6XVAQ7Ra
 fGTOPAK/B6GqJRqQ3n4p2b8L0xU8IRl70DMNm5uLr5uUspZJnt7mMgrcw2hj8HGhkj6Y
 sgyjLI3SIfkZyCvGOKs5LSPqAD85KBN4bOa27F1iO8EjBIdcZsLWuNbVAokQHOX8B1FS
 gV46Vsv2iwc3HLJWtVkPauaXGCBFKO7c125IxclbbqHQjAr8WEsA8VCGJeVHCcAal6Ga
 QQyA==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7R7aWdxj7pix3GR49BCJzWJQBXAcz/2r2H6AUecYQ=="
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a01:598:d004:7372:4a2:45e4:277f:9c2]
 by smtp.strato.de (RZmta 46.9.1 AUTH) with ESMTPSA id w06ffew54Fkk9BK
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 4 Jun 2020 17:46:46 +0200 (CEST)
Content-Type: multipart/alternative;
 boundary=Apple-Mail-1156D365-6498-4C05-BC42-EE2A5DCAA06C
Content-Transfer-Encoding: 7bit
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Mime-Version: 1.0 (1.0)
Subject: Re: Boot issue with the latest Git kernel
Date: Thu, 4 Jun 2020 17:46:45 +0200
Message-Id: <E5F27F7E-A3C0-4ED5-97C7-B9F2FBA118D2@xenosoft.de>
References: <f7f1b233-6101-2316-7996-4654586b7d24@csgroup.eu>
In-Reply-To: <f7f1b233-6101-2316-7996-4654586b7d24@csgroup.eu>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
X-Mailer: iPhone Mail (17E262)
X-Mailman-Approved-At: Fri, 05 Jun 2020 07:01:19 +1000
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
Cc: Darren Stevens <darren@stevens-zone.net>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christoph Hellwig <hch@lst.de>,
 "R.T.Dickinson" <rtd2@xtra.co.nz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--Apple-Mail-1156D365-6498-4C05-BC42-EE2A5DCAA06C
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello Christophe,

I tested it on my Nemo board with a P.A. Semi PA6T CPU [1], on my Cyrus+ boa=
rd with a FSL P5040 CPU [2] and in a virtual e5500 QEMU machine. You can fin=
d the kernel configs in the following package.

Link: http://www.xenosoft.de/linux-image-5.8-alpha1-X1000_X5000.tar.gz

Cheers,
Christian

[1] https://en.m.wikipedia.org/wiki/AmigaOne_X1000
[2] https://www.amigaos.net/hardware/133/amigaone-x5000


> On 4. Jun 2020, at 16:29, Christophe Leroy <christophe.leroy@csgroup.eu> w=
rote:
>=20
> =EF=BB=BF
>=20
>> Le 04/06/2020 =C3=A0 16:26, Christophe Leroy a =C3=A9crit :
>> Hi,
>>> Le 04/06/2020 =C3=A0 16:16, Christian Zigotzky a =C3=A9crit :
>>> Hi All,
>>>=20
>>> I tested the latest Git kernel today. [1]. Unfortunately it doesn't boot=
 on my PowerPC machines.
>>>=20
>>> Could you please test the latest Git kernel with your PowerPC machine?
>>>=20
>>> BTW, it doesn't boot in a virtual QEMU PowerPC machine either.
>>>=20
>> Which machine/platform ? Which defconfig are you using ?
>=20
>=20
> And are you able to perform a 'git bisect' to identify the guilty commit ?=

>=20
> Thanks
> Christophe

--Apple-Mail-1156D365-6498-4C05-BC42-EE2A5DCAA06C
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto">Hello Christophe,<div><br></div><div>I test=
ed it on my Nemo board with a P.A. Semi PA6T CPU [1], on my Cyrus+ board wit=
h a FSL P5040 CPU [2] and in a virtual e5500 QEMU machine. You can find the k=
ernel configs in the following package.</div><div><br></div><div>Link:&nbsp;=
<a href=3D"http://www.xenosoft.de/linux-image-5.8-alpha1-X1000_X5000.tar.gz"=
>http://www.xenosoft.de/linux-image-5.8-alpha1-X1000_X5000.tar.gz</a></div><=
div><br></div><div>Cheers,</div><div>Christian</div><div><br></div><div>[1]&=
nbsp;<a href=3D"https://en.m.wikipedia.org/wiki/AmigaOne_X1000">https://en.m=
.wikipedia.org/wiki/AmigaOne_X1000</a></div><div>[2]&nbsp;<a href=3D"https:/=
/www.amigaos.net/hardware/133/amigaone-x5000">https://www.amigaos.net/hardwa=
re/133/amigaone-x5000</a><br><br><div dir=3D"ltr"><br><blockquote type=3D"ci=
te">On 4. Jun 2020, at 16:29, Christophe Leroy &lt;christophe.leroy@csgroup.=
eu&gt; wrote:<br><br></blockquote></div><blockquote type=3D"cite"><div dir=3D=
"ltr">=EF=BB=BF<span></span><br><span></span><br><span>Le 04/06/2020 =C3=A0 1=
6:26, Christophe Leroy a =C3=A9crit&nbsp;:</span><br><blockquote type=3D"cit=
e"><span>Hi,</span><br></blockquote><blockquote type=3D"cite"><span>Le 04/06=
/2020 =C3=A0 16:16, Christian Zigotzky a =C3=A9crit&nbsp;:</span><br></block=
quote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>Hi All,</spa=
n><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span></span><br></blockquote></blockquote><blockquote type=3D"cite">=
<blockquote type=3D"cite"><span>I tested the latest Git kernel today. [1]. U=
nfortunately it doesn't boot on my PowerPC machines.</span><br></blockquote>=
</blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span></spa=
n><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span>Could you please test the latest Git kernel with your PowerPC m=
achine?</span><br></blockquote></blockquote><blockquote type=3D"cite"><block=
quote type=3D"cite"><span></span><br></blockquote></blockquote><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><span>BTW, it doesn't boot in a virtu=
al QEMU PowerPC machine either.</span><br></blockquote></blockquote><blockqu=
ote type=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquote></=
blockquote><blockquote type=3D"cite"><span>Which machine/platform ? Which de=
fconfig are you using ?</span><br></blockquote><span></span><br><span></span=
><br><span>And are you able to perform a 'git bisect' to identify the guilty=
 commit ?</span><br><span></span><br><span>Thanks</span><br><span>Christophe=
</span><br></div></blockquote></div></body></html>=

--Apple-Mail-1156D365-6498-4C05-BC42-EE2A5DCAA06C--
