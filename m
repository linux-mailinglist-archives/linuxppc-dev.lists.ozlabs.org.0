Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD6A1ED1B6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jun 2020 16:09:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49cW4H56GGzDqNn
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 00:09:19 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49cVnJ1JgMzDqSR
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jun 2020 23:56:19 +1000 (AEST)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D1C272A3D70;
 Wed,  3 Jun 2020 14:49:27 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Anton Vorontsov <anton@enomsg.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Subject: [PATCH 05/10] mtd: rawnand: fsl_upm: Use platform_get_resource() +
 devm_ioremap_resource()
Date: Wed,  3 Jun 2020 15:49:17 +0200
Message-Id: <20200603134922.1352340-6-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200603134922.1352340-1-boris.brezillon@collabora.com>
References: <20200603134922.1352340-1-boris.brezillon@collabora.com>
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

Replace the of_address_to_resource() + devm_ioremap() calls by
platform_get_resource() + devm_ioremap_resource() ones which allows us
to get rid of one error message since devm_ioremap_resource() already
takes care of that.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/mtd/nand/raw/fsl_upm.c | 23 +++++++----------------
 1 file changed, 7 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsl_upm.c b/drivers/mtd/nand/raw/fsl_upm.c
index a3e3a968891d..54851e9ea784 100644
--- a/drivers/mtd/nand/raw/fsl_upm.c
+++ b/drivers/mtd/nand/raw/fsl_upm.c
@@ -14,7 +14,6 @@
 #include <linux/mtd/nand_ecc.h>
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/mtd.h>
-#include <linux/of_address.h>
 #include <linux/of_platform.h>
 #include <linux/of_gpio.h>
 #include <linux/io.h>
@@ -197,7 +196,7 @@ static int fun_chip_init(struct fsl_upm_nand *fun,
 static int fun_probe(struct platform_device *ofdev)
 {
 	struct fsl_upm_nand *fun;
-	struct resource io_res;
+	struct resource *io_res;
 	const __be32 *prop;
 	int rnb_gpio;
 	int ret;
@@ -208,13 +207,12 @@ static int fun_probe(struct platform_device *ofdev)
 	if (!fun)
 		return -ENOMEM;
 
-	ret = of_address_to_resource(ofdev->dev.of_node, 0, &io_res);
-	if (ret) {
-		dev_err(&ofdev->dev, "can't get IO base\n");
-		return ret;
-	}
+	io_res = platform_get_resource(ofdev, IORESOURCE_MEM, 0);
+	fun->io_base = devm_ioremap_resource(&ofdev->dev, io_res);
+	if (IS_ERR(fun->io_base))
+		return PTR_ERR(fun->io_base);
 
-	ret = fsl_upm_find(io_res.start, &fun->upm);
+	ret = fsl_upm_find(io_res->start, &fun->upm);
 	if (ret) {
 		dev_err(&ofdev->dev, "can't find UPM\n");
 		return ret;
@@ -280,17 +278,10 @@ static int fun_probe(struct platform_device *ofdev)
 		fun->wait_flags = FSL_UPM_WAIT_RUN_PATTERN |
 				  FSL_UPM_WAIT_WRITE_BYTE;
 
-	fun->io_base = devm_ioremap(&ofdev->dev, io_res.start,
-					    resource_size(&io_res));
-	if (!fun->io_base) {
-		ret = -ENOMEM;
-		goto err2;
-	}
-
 	fun->dev = &ofdev->dev;
 	fun->last_ctrl = NAND_CLE;
 
-	ret = fun_chip_init(fun, ofdev->dev.of_node, &io_res);
+	ret = fun_chip_init(fun, ofdev->dev.of_node, io_res);
 	if (ret)
 		goto err2;
 
-- 
2.25.4

