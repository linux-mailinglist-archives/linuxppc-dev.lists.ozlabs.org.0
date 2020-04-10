Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8AC1A3DE3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Apr 2020 03:59:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48z1RH23F8zDrL2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Apr 2020 11:59:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=cmss.chinamobile.com (client-ip=221.176.66.79;
 helo=cmccmta1.chinamobile.com; envelope-from=tangbin@cmss.chinamobile.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=cmss.chinamobile.com
Received: from cmccmta1.chinamobile.com (cmccmta1.chinamobile.com
 [221.176.66.79])
 by lists.ozlabs.org (Postfix) with ESMTP id 48z1PZ6HSvzDrJf
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Apr 2020 11:58:00 +1000 (AEST)
Received: from spf.mail.chinamobile.com (unknown[172.16.121.5]) by
 rmmx-syy-dmz-app03-12003 (RichMail) with SMTP id 2ee35e8fd268f7e-f51a5;
 Fri, 10 Apr 2020 09:56:56 +0800 (CST)
X-RM-TRANSID: 2ee35e8fd268f7e-f51a5
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[112.25.154.146])
 by rmsmtp-syy-appsvr03-12003 (RichMail) with SMTP id 2ee35e8fd2650fe-770f4;
 Fri, 10 Apr 2020 09:56:56 +0800 (CST)
X-RM-TRANSID: 2ee35e8fd2650fe-770f4
From: Tang Bin <tangbin@cmss.chinamobile.com>
To: leoyang.li@nxp.com,
	balbi@kernel.org,
	gregkh@linuxfoundation.org
Subject: [PATCH] usb: gadget: fsl: Fix a wrong judgment in fsl_udc_probe()
Date: Fri, 10 Apr 2020 09:58:32 +0800
Message-Id: <20200410015832.8012-1-tangbin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.20.1.windows.1
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
Cc: Tang Bin <tangbin@cmss.chinamobile.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Markus.Elfring@web.de,
 linuxppc-dev@lists.ozlabs.org,
 Shengju Zhang <zhangshengju@cmss.chinamobile.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If the function "platform_get_irq()" failed, the negative value
returned will not be detected here, including "-EPROBE_DEFER", which
causes the application to fail to get the correct error message.
Thus it must be fixed.

Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
Signed-off-by: Shengju Zhang <zhangshengju@cmss.chinamobile.com>
---
 drivers/usb/gadget/udc/fsl_udc_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/udc/fsl_udc_core.c b/drivers/usb/gadget/udc/fsl_udc_core.c
index ec6eda426..60853ad10 100644
--- a/drivers/usb/gadget/udc/fsl_udc_core.c
+++ b/drivers/usb/gadget/udc/fsl_udc_core.c
@@ -2441,8 +2441,8 @@ static int fsl_udc_probe(struct platform_device *pdev)
 	udc_controller->max_ep = (dccparams & DCCPARAMS_DEN_MASK) * 2;
 
 	udc_controller->irq = platform_get_irq(pdev, 0);
-	if (!udc_controller->irq) {
-		ret = -ENODEV;
+	if (udc_controller->irq <= 0) {
+		ret = udc_controller->irq ? : -ENODEV;
 		goto err_iounmap;
 	}
 
-- 
2.20.1.windows.1



