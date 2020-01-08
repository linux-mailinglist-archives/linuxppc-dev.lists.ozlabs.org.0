Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F1213438A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2020 14:12:55 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47t8mz6xNWzDqV6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2020 00:12:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.32; helo=huawei.com;
 envelope-from=yuehaibing@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47t8jx3xQLzDqPc
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jan 2020 00:10:07 +1100 (AEDT)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 1BAD161D0060090647B7;
 Wed,  8 Jan 2020 21:09:57 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.439.0; Wed, 8 Jan 2020
 21:09:46 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <qiang.zhao@nxp.com>, <leoyang.li@nxp.com>
Subject: [PATCH -next] soc: fsl: qe: remove set but not used variable 'mm_gc'
Date: Wed, 8 Jan 2020 21:09:26 +0800
Message-ID: <20200108130926.45808-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
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
Cc: YueHaibing <yuehaibing@huawei.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

drivers/soc/fsl/qe/gpio.c: In function qe_pin_request:
drivers/soc/fsl/qe/gpio.c:163:26: warning: variable mm_gc set but not used [-Wunused-but-set-variable]

commit 1e714e54b5ca ("powerpc: qe_lib-gpio: use gpiochip data pointer")
left behind this unused variable.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/soc/fsl/qe/gpio.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/soc/fsl/qe/gpio.c b/drivers/soc/fsl/qe/gpio.c
index 12bdfd9..ed75198 100644
--- a/drivers/soc/fsl/qe/gpio.c
+++ b/drivers/soc/fsl/qe/gpio.c
@@ -160,7 +160,6 @@ struct qe_pin *qe_pin_request(struct device_node *np, int index)
 {
 	struct qe_pin *qe_pin;
 	struct gpio_chip *gc;
-	struct of_mm_gpio_chip *mm_gc;
 	struct qe_gpio_chip *qe_gc;
 	int err;
 	unsigned long flags;
@@ -186,7 +185,6 @@ struct qe_pin *qe_pin_request(struct device_node *np, int index)
 		goto err0;
 	}
 
-	mm_gc = to_of_mm_gpio_chip(gc);
 	qe_gc = gpiochip_get_data(gc);
 
 	spin_lock_irqsave(&qe_gc->lock, flags);
-- 
2.7.4


