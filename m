Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DBEE9404
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 01:12:28 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 472pmm71QnzF3gd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 11:12:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo6-p01-ob.smtp.rzone.de (client-ip=2a01:238:20a:202:5301::8;
 helo=mo6-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.b="Bmt/AS9l"; 
 dkim-atps=neutral
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5301::8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 472pkg6VSKzF3fX
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2019 11:10:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1572394225;
 s=strato-dkim-0002; d=xenosoft.de;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=9w2M999oKTgVaxK863zDZaUH6kMZAbvqBMlnFKRXyzY=;
 b=Bmt/AS9lEZ0sqsgvr+hCE6HYrtgRQh7r/ZfRPejOutySYUI5deX+s8auHx9lulxuC6
 j4hxxFZ0kmtZyM0Zc5fqwCc6BB3tbpWjgn6uGIkpRBjzG4x22iFeVsoMO1+WfmyT7Z1X
 MPT1NUfCjpHJA25xQ/J+Aam1H+3BtF0TBNVh3idGncFVCBg+rl1arEVsyjFqLKvCmAZU
 PFdN8o700qz5zK+nPKozAbP0uMeFcc9PjvycI0ezsXsvjaKnGdfU2UyQBNOR52M0ETqP
 Tq396XyBX0/vFM3VPOyOtA6duaZZmVZyPRtjgWa/OuLC87vTMIHG5DsNQIxGygGQnPLl
 wrlw==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7R7NWcgi7oxlifN3bG+LssBWsE24/9C4qgEq7kGV2jv"
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a01:598:80a0:dba6:d1ee:3b55:ab90:55d1]
 by smtp.strato.de (RZmta 44.29.0 AUTH)
 with ESMTPSA id q007c8v9U0AK2ZY
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Wed, 30 Oct 2019 01:10:20 +0100 (CET)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (1.0)
Subject: Re: Bug 205201 - Booting halts if Dawicontrol DC-2976 UW SCSI board
 installed, unless RAM size limited to 3500M
From: Christian Zigotzky <chzigotzky@xenosoft.de>
X-Mailer: iPhone Mail (16G102)
In-Reply-To: <3582233D-3889-4D5B-87DF-1DBCEC853F07@xenosoft.de>
Date: Wed, 30 Oct 2019 01:10:19 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <3527D7A4-5EC3-4102-8F77-A96F3BDDA97F@xenosoft.de>
References: <3582233D-3889-4D5B-87DF-1DBCEC853F07@xenosoft.de>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
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
Cc: "R.T.Dickinson" <rtd2@xtra.co.nz>, Christoph Hellwig <hch@infradead.org>,
 "contact@a-eon.com" <contact@a-eon.com>, mad skateman <madskateman@gmail.com>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,
Kernel 5.4-rc5: Error message without limitation to 3.5G RAM:=20
[ 25.654852] bttv 1000:04:05.0: overflow 0x00000000fe077000+4096 of DMA mask=
 ffffffff bus mask df000000
The kernel configured the bttv card for DMA in the upper region of RAM but t=
he device believes that it only supports 32-bit addressing.
The TV card works without the limitation to 3.5G RAM with the kernel 4.20.17=
. The issue has started with the PowerPC updates 4.21-1 [1]
Cheers,
Christian
[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commi=
t/?id=3D8d6973327ee84c2f40dd9efd8928d4a1186c96e2


> On 29. Oct 2019, at 05:49, Christian Zigotzky <chzigotzky@xenosoft.de> wro=
te:
>=20
> Hello,
>=20
> The bug with some PCI devices if you have more than 3.5G installed still e=
xist in the RC5. Could you please look in the following bug report.
>=20
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D205201
>=20
> Thanks,
> Christian
