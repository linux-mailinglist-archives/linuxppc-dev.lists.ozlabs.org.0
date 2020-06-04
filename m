Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4181EE810
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 17:55:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49d9N85jTqzDqsR
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jun 2020 01:55:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=81.169.146.166;
 helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=RtoFHqcJ; 
 dkim-atps=neutral
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [81.169.146.166])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49d9L54jz9zDqp7
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Jun 2020 01:53:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1591286008;
 s=strato-dkim-0002; d=xenosoft.de;
 h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=bmF7Q09ZEZgc4EAYr840XQj5+n23SvNFQD9x/Yixytw=;
 b=RtoFHqcJImC5G0/j4F0KToqa5o73ANXT7x/aREIe6bDqEWkCm4umHRNrk6BB5hlYjt
 QJIZDE/497TYB0vAOrk8Y0mHirDInwdnPLCJGmD9hWF5vMU9sP7W1N4gLzaKaJXbk72+
 jdv4wMlDMt6I4fHxf9wfF3+VWBP8yX/0hOEdtKwvBu7M5ZTGzXN5daRV7vbZ042+eQM6
 HHqbShSgZkB2mkE6ehM6dCGci4eUQ20nv6Tntq0XzcYCJKFV/ltwam47LrUnv0IaW9IP
 98C758Pjgy8pOgwWlxmvd9uhTN8R3pnKr/kBvVoAkQ8ZqJBWx+uIUyLF9wtJS9ykFYhT
 IGTQ==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7R7aWdxj7pix3GR49BCJzWJQBXAcz/2r2H6AUecYQ=="
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a01:598:d004:7372:4a2:45e4:277f:9c2]
 by smtp.strato.de (RZmta 46.9.1 AUTH) with ESMTPSA id w06ffew54FrN9DR
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 4 Jun 2020 17:53:23 +0200 (CEST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Mime-Version: 1.0 (1.0)
Subject: Re: Boot issue with the latest Git kernel
Date: Thu, 4 Jun 2020 17:53:22 +0200
Message-Id: <067BBAB3-19B6-42C6-AA9F-B9F14314255C@xenosoft.de>
References: <f7f1b233-6101-2316-7996-4654586b7d24@csgroup.eu>
In-Reply-To: <f7f1b233-6101-2316-7996-4654586b7d24@csgroup.eu>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
X-Mailer: iPhone Mail (17E262)
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



> On 4. Jun 2020, at 16:29, Christophe Leroy <christophe.leroy@csgroup.eu> w=
rote:
>=20
> And are you able to perform a 'git bisect' to identify the guilty commit ?=

>=20
> Thanks
> Christophe

Hello Christophe,

Unfortunately I haven=E2=80=99t had time to bisect the latest Git kernel. Do=
es it boot on your PowerPC machine?

Thanks,
Christian=
