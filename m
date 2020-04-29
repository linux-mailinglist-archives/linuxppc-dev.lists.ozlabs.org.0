Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DE56E1BE752
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 21:27:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49C7my2cLMzDrBf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Apr 2020 05:26:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo6-p01-ob.smtp.rzone.de (client-ip=2a01:238:20a:202:5301::2;
 helo=mo6-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=RPXQvZCR; 
 dkim-atps=neutral
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5301::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49C0Qh6FpbzDr2r
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 23:55:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1588168531;
 s=strato-dkim-0002; d=xenosoft.de;
 h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=sRM9IW6qbifN2jy58etkeSC0Giaq0ddRS/7YsNzt/WA=;
 b=RPXQvZCRn1NeD23xZPDl8HWe/W/xINC9uhaXheKgEPCKQkAfML0InnvPPkKQ3L8yRh
 WpWi7DZ5oL8k75l1EllCeNncz+NUChJ2zuVbWcdLKdbHPG0PSvqy20WxUudYSnMM3P1A
 1Zua7huSIZRXF2zzC8QJumwAuQpT5ul42Rb40O5Vf8AhiXcCXZyLhlSQfYSiS7jzbsin
 OJBVKp++zu4FCTyHNZsRFoI+XAlaOMmU3SKdBFRm2J69nWMvCOttsqnNyRAAtEZyX54i
 ueJg34QputjGTkxGnJMKBoz6aVs+TS9ZOE5MPJt5Gyq8eJVFt5et+RtJeYVPOtv6rat1
 5SSw==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7R7aWdxgrpix3BNtxgZMkdjmAvA9mUCF0wx8fHT1jD6"
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a01:598:d009:736a:6836:44ca:f3aa:4c6a]
 by smtp.strato.de (RZmta 46.6.2 AUTH) with ESMTPSA id I01247w3TDtSagJ
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 29 Apr 2020 15:55:28 +0200 (CEST)
Content-Type: multipart/alternative;
 boundary=Apple-Mail-A08CC779-CEB6-46E8-A6EF-C98E3530669B
Content-Transfer-Encoding: 7bit
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Mime-Version: 1.0 (1.0)
Subject: Re: [RFC PATCH dpss_eth] Don't initialise ports with no PHY
Date: Wed, 29 Apr 2020 15:55:28 +0200
Message-Id: <77E4A243-F90A-45A9-B8D3-0F7785C158C7@xenosoft.de>
References: <20200429131253.GG30459@lunn.ch>
In-Reply-To: <20200429131253.GG30459@lunn.ch>
To: Andrew Lunn <andrew@lunn.ch>
X-Mailer: iPhone Mail (17D50)
X-Mailman-Approved-At: Thu, 30 Apr 2020 05:24:34 +1000
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
Cc: madalin.bacur@nxp.com, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 netdev@vger.kernel.org, oss@buserror.net,
 Darren Stevens <darren@stevens-zone.net>,
 "contact@a-eon.com" <contact@a-eon.com>, mad skateman <madskateman@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--Apple-Mail-A08CC779-CEB6-46E8-A6EF-C98E3530669B
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

You can find some dtb and source files in our kernel package.

Download: http://www.xenosoft.de/linux-image-5.7-rc3-X1000_X5000.tar.gz

Thanks,
Christian

> On 29. Apr 2020, at 15:13, Andrew Lunn <andrew@lunn.ch> wrote:
>=20
> =EF=BB=BF
>>=20
>> Maybe we have to modify the dtb file.
>=20
> Hi Christian
>=20
> Could you point me at the DT file.
>=20
>      Thanks
>    Andrew

--Apple-Mail-A08CC779-CEB6-46E8-A6EF-C98E3530669B
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto">Hi Andrew,<div><br></div><div>You can find s=
ome dtb and source files in our kernel package.</div><div><br></div><div>Dow=
nload:&nbsp;<a href=3D"http://www.xenosoft.de/linux-image-5.7-rc3-X1000_X500=
0.tar.gz">http://www.xenosoft.de/linux-image-5.7-rc3-X1000_X5000.tar.gz</a><=
/div><div><br></div><div>Thanks,</div><div>Christian<br><div dir=3D"ltr"><br=
><blockquote type=3D"cite">On 29. Apr 2020, at 15:13, Andrew Lunn &lt;andrew=
@lunn.ch&gt; wrote:<br><br></blockquote></div><blockquote type=3D"cite"><div=
 dir=3D"ltr">=EF=BB=BF<blockquote type=3D"cite"><span>Maybe we have to modif=
y the dtb file.</span><br></blockquote><span></span><br><span>Hi Christian</=
span><br><span></span><br><span>Could you point me at the DT file.</span><br=
><span></span><br><span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Thanks</span><br><spa=
n> &nbsp; &nbsp;Andrew</span><br></div></blockquote></div></body></html>=

--Apple-Mail-A08CC779-CEB6-46E8-A6EF-C98E3530669B--
