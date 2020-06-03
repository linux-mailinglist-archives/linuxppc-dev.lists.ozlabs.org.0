Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 641BB1ED24A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jun 2020 16:44:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49cWrk4xH6zDqdZ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 00:44:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=collabora.com (client-ip=46.235.227.227;
 helo=bhuna.collabora.co.uk; envelope-from=boris.brezillon@collabora.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=collabora.com
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49cVnR2zz2zDqSY
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jun 2020 23:56:26 +1000 (AEST)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 787DA2A3D6A;
 Wed,  3 Jun 2020 14:49:27 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Anton Vorontsov <anton@enomsg.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Subject: [PATCH 04/10] mtd: rawnand: fsl_upm: Use devm_kasprintf() to allocate
 the MTD name
Date: Wed,  3 Jun 2020 15:49:16 +0200
Message-Id: <20200603134922.1352340-5-boris.brezillon@collabora.com>
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

This simplifies the init() error path and the remove() handler.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/mtd/nand/raw/fsl_upm.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsl_upm.c b/drivers/mtd/nand/raw/fsl_upm.c
index 9cf79c62ef22..a3e3a968891d 100644
--- a/drivers/mtd/nand/raw/fsl_upm.c
+++ b/drivers/mtd/nand/raw/fsl_upm.c
@@ -176,8 +176,9 @@ static int fun_chip_init(struct fsl_upm_nand *fun,
 		return -ENODEV;
 
 	nand_set_flash_node(&fun->chip, flash_np);
-	mtd->name = kasprintf(GFP_KERNEL, "0x%llx.%pOFn", (u64)io_res->start,
-			      flash_np);
+	mtd->name = devm_kasprintf(fun->dev, GFP_KERNEL, "0x%llx.%pOFn",
+				   (u64)io_res->start,
+				   flash_np);
 	if (!mtd->name) {
 		ret = -ENOMEM;
 		goto err;
@@ -190,8 +191,6 @@ static int fun_chip_init(struct fsl_upm_nand *fun,
 	ret = mtd_device_register(mtd, NULL, 0);
 err:
 	of_node_put(flash_np);
-	if (ret)
-		kfree(mtd->name);
 	return ret;
 }
 
@@ -318,7 +317,6 @@ static int fun_remove(struct platform_device *ofdev)
 	ret = mtd_device_unregister(mtd);
 	WARN_ON(ret);
 	nand_cleanup(chip);
-	kfree(mtd->name);
 
 	for (i = 0; i < fun->mchip_count; i++) {
 		if (fun->rnb_gpio[i] < 0)
-- 
2.25.4

