Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E449D1BE32A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 17:54:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49C3405wMfzDqKg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Apr 2020 01:54:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo6-p01-ob.smtp.rzone.de (client-ip=2a01:238:20a:202:5301::6;
 helo=mo6-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=hXnNLFtI; 
 dkim-atps=neutral
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5301::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49C2ph3TRpzDr9Q
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Apr 2020 01:42:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1588174969;
 s=strato-dkim-0002; d=xenosoft.de;
 h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=IbyYYlnr5FtSGNAz7JbGE3sOZMyIiGOk4MJ33ilaEMM=;
 b=hXnNLFtItX20FCFltNGpobzkcLeSmfgBh3ZDidg2XutsuRUyVPzoz27TjuQzSZ1R0X
 DpURjBIXqfANpG5dAm0jQ0kVyz0tkqq+1VXzQ9rL1Te/Fkd2TXTFqJt4nHmBOM/mdPfd
 uLycjmfxDdW0RnAYEOxBm6va0hTnj/bgB84rV4MR+eAaERsgZ1fWmZ5VXxdaMCsDeKRB
 UslHG51189EX3qkUi1T14Yavfk/c10M1ndvfERl8pKeDs3hvN2JVOu9p4+LyFn9Q5Igq
 EFvwNjAvmnsvTKx4Nz4uOqq04fGlDwd4TiGlQHPQzfjhFsMdHmmw5NhVI+HQkFLeW3Nu
 3uow==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr4tFIFSaQ9BwcJz1cfHs="
X-RZG-CLASS-ID: mo00
Received: from [10.39.49.245] by smtp.strato.de (RZmta 46.6.2 DYNA|AUTH)
 with ESMTPSA id I01247w3TFglbIR
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 29 Apr 2020 17:42:47 +0200 (CEST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Mime-Version: 1.0 (1.0)
Subject: Re: [RFC PATCH dpss_eth] Don't initialise ports with no PHY
Date: Wed, 29 Apr 2020 17:42:46 +0200
Message-Id: <68BEA58A-DF1D-44B8-91DD-B90BAAB738BE@xenosoft.de>
References: <20200429152224.GA66424@lunn.ch>
In-Reply-To: <20200429152224.GA66424@lunn.ch>
To: Andrew Lunn <andrew@lunn.ch>
X-Mailer: iPhone Mail (17D50)
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



> On 29. Apr 2020, at 17:22, Andrew Lunn <andrew@lunn.ch> wrote:
>=20
> =EF=BB=BFOn Wed, Apr 29, 2020 at 03:55:28PM +0200, Christian Zigotzky wrot=
e:
>> Hi Andrew,
>>=20
>> You can find some dtb and source files in our kernel package.
>>=20
>> Download: http://www.xenosoft.de/linux-image-5.7-rc3-X1000_X5000.tar.gz
>=20
> I have the tarball. Are we talking about
> linux-image-5.7-rc3-X1000_X5000/X5000_and_QEMU_e5500/dtbs/X5000_20/cyrus.e=
th.dtb
>=20
> I don't see any status =3D "disabled"; in the blob. So i would expect
> the driver to probe.
>=20
>    Andrew
>=20
>=20

Yes, that=E2=80=99s correct but maybe Darren uses another dtb file.

@Darren
Which dtb file do you use?=
