Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEE7217BDA
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 01:47:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1fH9583rzDqHS
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 09:47:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1WJ86hF0zDqM0
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jul 2020 04:32:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=r/qT4vPk; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4B1WJ832MKz8tX8
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jul 2020 04:32:24 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4B1WJ826sgz9sRN; Wed,  8 Jul 2020 04:32:24 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.54;
 helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=r/qT4vPk; 
 dkim-atps=neutral
X-Greylist: delayed 179 seconds by postgrey-1.36 at bilbo;
 Wed, 08 Jul 2020 04:32:19 AEST
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.54])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4B1WJ34PwRz9sRK
 for <linuxppc-dev@ozlabs.org>; Wed,  8 Jul 2020 04:32:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1594146735;
 s=strato-dkim-0002; d=xenosoft.de;
 h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=bS9U1Nrm0g7+0tRpE03SJz9Xi4GhynZinSSlNOlFmhY=;
 b=r/qT4vPkTRkWvDdsr+CaUi641xpMIwEFdZcChXau7uSx2DqDUmqgfLlyMymElzXi0W
 KiMfYoj8clTvaqDJ3L1X/mOJWWPMz+Jt8VuQm4q7SKWOO74Mwq6CdqybymlaG0WxTh4s
 JHIPYud94DLkbydx9c5cWCpL9xvppOn6gFrd72gYxB4FPjpF4nCcHqXKX09mIv4OSevA
 7xUnKMTlqmUP2MDdQNS5Q9Cjh0FNkFrTyaxnGnKaF3IGfhtD/nSmGv0HMF3AfDMHlXUC
 zWEOLcVsgaYn8ATBTwCK5Pds4w1eFgxyAkzoJrk2bRuBdlnTT2oz31KtRwe/w3I6igPf
 AA7w==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7R7b2Zxiro3lnCbQO1HZlTeoCr8RmiKfTl4x5qgNBFC"
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a01:598:b101:bb6c:c11d:a086:f393:fea3]
 by smtp.strato.de (RZmta 46.10.5 AUTH)
 with ESMTPSA id 60686ew67IQDpKd
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 7 Jul 2020 20:26:13 +0200 (CEST)
Content-Type: multipart/alternative;
 boundary=Apple-Mail-03BD6120-3C68-485A-AA65-407215FA2D0D
Content-Transfer-Encoding: 7bit
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Mime-Version: 1.0 (1.0)
Subject: Re: FSL P5020/P5040: DPAA Ethernet issue with the latest Git kernel
Date: Tue, 7 Jul 2020 20:26:12 +0200
Message-Id: <4E3069C3-B777-4460-A781-84214C4539DA@xenosoft.de>
References: <AM6PR04MB3976584920CFDC269D859DBBEC660@AM6PR04MB3976.eurprd04.prod.outlook.com>
In-Reply-To: <AM6PR04MB3976584920CFDC269D859DBBEC660@AM6PR04MB3976.eurprd04.prod.outlook.com>
To: "Madalin Bucur (OSS)" <madalin.bucur@oss.nxp.com>
X-Mailer: iPhone Mail (17E262)
X-Mailman-Approved-At: Wed, 08 Jul 2020 09:43:35 +1000
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
 mad skateman <madskateman@gmail.com>, netdev@vger.kernel.org,
 linuxppc-dev@ozlabs.org, Camelia Alexandra Groza <camelia.groza@nxp.com>,
 "R.T.Dickinson" <rtd2@xtra.co.nz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--Apple-Mail-03BD6120-3C68-485A-AA65-407215FA2D0D
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On 7. Jul 2020, at 17:53, Madalin Bucur (OSS) <madalin.bucur@oss.nxp.com> w=
rote:
>=20
> Was DPAA functional before commit A?
> How about after commit A and before commit B?

The DPAA Ethernet works from  the kernel 5.6-rc4 [1] till the Git kernel fro=
m the 11 of June [2]. It doesn=E2=80=99t work since the commit =E2=80=9Cfix b=
itmap_parse=E2=80=9D [3].

[1] https://forum.hyperion-entertainment.com/viewtopic.php?p=3D49936#p49936
[2] https://forum.hyperion-entertainment.com/viewtopic.php?p=3D50848#p50848
[3] https://forum.hyperion-entertainment.com/viewtopic.php?p=3D50980#p50980


--Apple-Mail-03BD6120-3C68-485A-AA65-407215FA2D0D
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><br><div dir=3D"ltr"><blockquote type=3D"ci=
te">On 7. Jul 2020, at 17:53, Madalin Bucur (OSS) &lt;madalin.bucur@oss.nxp.=
com&gt; wrote:<br><br></blockquote></div><blockquote type=3D"cite"><div dir=3D=
"ltr"><span>Was DPAA functional before commit A?</span><br><span>How about a=
fter commit A and before commit B?</span><br></div></blockquote><div><br></d=
iv>The DPAA Ethernet works from &nbsp;the kernel 5.6-rc4 [1] till the Git ke=
rnel from the 11 of June [2]. It doesn=E2=80=99t work since the commit =E2=80=
=9Cfix bitmap_parse=E2=80=9D [3].<div><br></div><div>[1]&nbsp;<a href=3D"htt=
ps://forum.hyperion-entertainment.com/viewtopic.php?p=3D49936#p49936">https:=
//forum.hyperion-entertainment.com/viewtopic.php?p=3D49936#p49936</a></div><=
div>[2]&nbsp;<a href=3D"https://forum.hyperion-entertainment.com/viewtopic.p=
hp?p=3D50848#p50848">https://forum.hyperion-entertainment.com/viewtopic.php?=
p=3D50848#p50848</a></div><div>[3]&nbsp;<a href=3D"https://forum.hyperion-en=
tertainment.com/viewtopic.php?p=3D50980#p50980">https://forum.hyperion-enter=
tainment.com/viewtopic.php?p=3D50980#p50980</a><br><div><br></div></div></bo=
dy></html>=

--Apple-Mail-03BD6120-3C68-485A-AA65-407215FA2D0D--
