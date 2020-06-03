Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B89751ED1F6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jun 2020 16:19:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49cWJK20KSzDqcP
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 00:19:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=collabora.com (client-ip=2a00:1098:0:82:1000:25:2eeb:e3e3;
 helo=bhuna.collabora.co.uk; envelope-from=boris.brezillon@collabora.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=collabora.com
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49cVnK3B7fzDqSW
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jun 2020 23:56:20 +1000 (AEST)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id ED7812A00BB;
 Wed,  3 Jun 2020 14:49:25 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Anton Vorontsov <anton@enomsg.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Subject: [PATCH 00/10] mtd: rawnand: fsl_upm: Convert to exec_op() (and more)
Date: Wed,  3 Jun 2020 15:49:12 +0200
Message-Id: <20200603134922.1352340-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

A bit of context to explain the motivation behind those conversions
I've been sending for the last few weeks. The raw NAND subsystem
carries a lot of history which makes any rework not only painful, but
also subject to regressions which we only detect when someone dares to
update its kernel on one of those ancient HW. While carrying drivers
for old HW is not a problem per se, carrying ancient and unmaintained
drivers that are not converted to new APIs is a maintenance burden,
hence this massive conversion attempt I'm conducting here.

So here is a series converting the FSM UPM NAND controller driver to
exec_op(), plus a bunch of minor improvements done along the way.
I hope I'll find someone to test those changes, but if there's no one
still having access to this HW or no interest in keeping it supported
in recent kernel versions, we should definitely consider removing the
driver instead.

Regards,

Boris

Boris Brezillon (10):
  mtd: rawnand: fsl_upm: Remove unused mtd var
  mtd: rawnand: fsl_upm: Get rid of the unused fsl_upm_nand.parts field
  mtd: rawnand: fsl_upm: Allocate the fsl_upm_nand object using
    devm_kzalloc()
  mtd: rawnand: fsl_upm: Use devm_kasprintf() to allocate the MTD name
  mtd: rawnand: fsl_upm: Use platform_get_resource() +
    devm_ioremap_resource()
  mtd: rawnand: fsl_upm: Use gpio descriptors
  mtd: rawnand: fsl_upm: Inherit from nand_controller
  mtd: rawnand: fsl_upm: Implement exec_op()
  mtd: rawnand: fsl_upm: Get rid of the legacy interface implementation
  dt-bindings: mtd: fsl-upm-nand: Deprecate chip-delay and
    fsl,upm-wait-flags

 .../devicetree/bindings/mtd/fsl-upm-nand.txt  |  10 +-
 drivers/mtd/nand/raw/fsl_upm.c                | 311 +++++++-----------
 2 files changed, 117 insertions(+), 204 deletions(-)

-- 
2.25.4

