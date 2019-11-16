Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 04096FEB12
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Nov 2019 08:08:10 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47FRBZ6jtYzF30c
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Nov 2019 18:08:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo6-p01-ob.smtp.rzone.de (client-ip=2a01:238:20a:202:5301::7;
 helo=mo6-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.b="EU5T8wFR"; 
 dkim-atps=neutral
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5301::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47FR8j4ystzDrnj
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Nov 2019 18:06:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1573887981;
 s=strato-dkim-0002; d=xenosoft.de;
 h=To:Cc:Message-Id:Subject:Date:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=zuFc8xULBzIlsh03+xVDOKfPqAywShuzPS+aigybEXY=;
 b=EU5T8wFRaFldRf1OQsS4WjVJFlQyazzY1pO4jEm5rplCCNBRhm7cczebMKRDQx6TEA
 3N+YkdLY638lRrBVZuNYizf2aY6X3IDzd24RZpMz95iPPF5rrz1GOfiK1o4a1CJ3bW6z
 BCClbOj9pvUHHaaBbVJuDsE4UkwMz7Z0c/uwqPnIyQE9JjCEgUoqKScBxJ4hhGwsjqOW
 vZsX+Ls6BzQ6fSNM3UjSa+OffEI/WemIh/HmQKloKdK73KGyxVrTUCYhwjvl3zNBq5Ky
 ob8Deu6b6m83jujGzbk1TIf89tKKcJ4pQB8179+FZvJRLPkwGBb1f/dqog+9F0WRu6Iy
 g3Cw==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7R7NWZ537pkxH6J+aB1+9x3aDxi+HSYc7KsUHFpLrY="
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a01:598:818d:108:b105:ba81:413a:5ece]
 by smtp.strato.de (RZmta 44.29.0 AUTH)
 with ESMTPSA id q007c8vAG7667Rt
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Sat, 16 Nov 2019 08:06:06 +0100 (CET)
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (1.0)
Date: Sat, 16 Nov 2019 08:06:05 +0100
Subject: Bug 205201 - Booting halts if Dawicontrol DC-2976 UW SCSI board
 installed, unless RAM size limited to 3500M
Message-Id: <F1EBB706-73DF-430E-9020-C214EC8ED5DA@xenosoft.de>
To: Christoph Hellwig <hch@lst.de>
X-Mailer: iPhone Mail (16G102)
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
Cc: linux-arch@vger.kernel.org, darren@stevens-zone.net,
 mad skateman <madskateman@gmail.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, paulus@samba.org, rtd2@xtra.co.nz,
 "contact@a-eon.com" <contact@a-eon.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, nsaenzjulienne@suse.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

FYI: Source files of the Dawicontrol DC 2976 UW SCSI board (PCI): https://gi=
t.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/scsi/s=
ym53c8xx_2?h=3Dv5.4-rc7

/*
 *  DMA addressing mode.
 *
 *  0 : 32 bit addressing for all chips.
 *  1 : 40 bit addressing when supported by chip.
 *  2 : 64 bit addressing when supported by chip,
 *      limited to 16 segments of 4 GB -> 64 GB max.
 */
#define   SYM_CONF_DMA_ADDRESSING_MODE CONFIG_SCSI_SYM53C8XX_DMA_ADDRESSING_=
MODE

Cyrus config:

CONFIG_SCSI_SYM53C8XX_DMA_ADDRESSING_MODE=3D1

I will configure =E2=80=9C0 : 32 bit addressing for all chips=E2=80=9D for t=
he RC8. Maybe this is the solution.

> On 13. Nov 2019, at 12:02, Christoph Hellwig <hch@lst.de> wrote:
>=20
> Interesting.  Give me some time to come up with a real fix, as drivers
> really should not mess with GFP flags for these allocations, and even
> if they did swiotlb is supposed to take care of any resulting problems.
