Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F07111939A8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Mar 2020 08:32:05 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48nxWk6pp2zDqBK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Mar 2020 18:32:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.190; helo=huawei.com;
 envelope-from=yuehaibing@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48nx7p3xk1zDqht
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Mar 2020 18:14:45 +1100 (AEDT)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id B8AB893BEE20643D0650;
 Thu, 26 Mar 2020 15:14:32 +0800 (CST)
Received: from localhost (10.173.223.234) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.487.0; Thu, 26 Mar 2020
 15:14:23 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <leoyang.li@nxp.com>, <balbi@kernel.org>, <gregkh@linuxfoundation.org>
Subject: [PATCH -next] usb: gadget: fsl: remove unused variable 'driver_desc'
Date: Thu, 26 Mar 2020 15:14:19 +0800
Message-ID: <20200326071419.19240-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.173.223.234]
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
Cc: YueHaibing <yuehaibing@huawei.com>, linux-usb@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

drivers/usb/gadget/udc/fsl_udc_core.c:56:19:
 warning: 'driver_desc' defined but not used [-Wunused-const-variable=]

It is never used, so remove it.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/usb/gadget/udc/fsl_udc_core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/fsl_udc_core.c b/drivers/usb/gadget/udc/fsl_udc_core.c
index ec6eda426223..febabde62f71 100644
--- a/drivers/usb/gadget/udc/fsl_udc_core.c
+++ b/drivers/usb/gadget/udc/fsl_udc_core.c
@@ -53,7 +53,6 @@
 #define	DMA_ADDR_INVALID	(~(dma_addr_t)0)
 
 static const char driver_name[] = "fsl-usb2-udc";
-static const char driver_desc[] = DRIVER_DESC;
 
 static struct usb_dr_device __iomem *dr_regs;
 
-- 
2.17.1


