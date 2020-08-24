Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 918F524F53C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Aug 2020 10:46:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BZm1h4QxJzDqQS
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Aug 2020 18:46:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.35; helo=huawei.com;
 envelope-from=yebin10@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BZlS00NhDzDqDD
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Aug 2020 18:20:27 +1000 (AEST)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 2D530FF44ED5593B640C;
 Mon, 24 Aug 2020 16:05:03 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.487.0; Mon, 24 Aug 2020
 16:04:53 +0800
From: Ye Bin <yebin10@huawei.com>
To: <leoyang.li@nxp.com>, <linux-usb@vger.kernel.org>,
 <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] usb: gadget: fsl: Fix unsigned expression compared with zero
 in fsl_udc_probe
Date: Mon, 24 Aug 2020 16:04:37 +0800
Message-ID: <20200824080437.229826-1-yebin10@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 24 Aug 2020 18:43:34 +1000
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
Cc: Ye Bin <yebin10@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Signed-off-by: Ye Bin <yebin10@huawei.com>
---
 drivers/usb/gadget/udc/fsl_udc_core.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/udc/fsl_udc_core.c b/drivers/usb/gadget/udc/fsl_udc_core.c
index a6f7b2594c09..3e98740b8cfc 100644
--- a/drivers/usb/gadget/udc/fsl_udc_core.c
+++ b/drivers/usb/gadget/udc/fsl_udc_core.c
@@ -2439,11 +2439,12 @@ static int fsl_udc_probe(struct platform_device *pdev)
 	/* DEN is bidirectional ep number, max_ep doubles the number */
 	udc_controller->max_ep = (dccparams & DCCPARAMS_DEN_MASK) * 2;
 
-	udc_controller->irq = platform_get_irq(pdev, 0);
-	if (udc_controller->irq <= 0) {
-		ret = udc_controller->irq ? : -ENODEV;
+	ret = platform_get_irq(pdev, 0);
+	if (ret <= 0) {
+		ret = ret ? : -ENODEV;
 		goto err_iounmap;
 	}
+	udc_controller->irq = ret;
 
 	ret = request_irq(udc_controller->irq, fsl_udc_irq, IRQF_SHARED,
 			driver_name, udc_controller);
-- 
2.25.4

