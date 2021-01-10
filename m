Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BF42F0A64
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jan 2021 00:26:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DDXyY3lHCzDqLx
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jan 2021 10:25:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bootlin.com (client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=alexandre.belloni@bootlin.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=bootlin.com
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DDXnj1WyMzDqLq
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Jan 2021 10:18:14 +1100 (AEDT)
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr
 [86.202.109.140])
 (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id E8FE740006;
 Sun, 10 Jan 2021 23:18:06 +0000 (UTC)
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-rtc@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 03/17] rtc: armada38x: remove armada38x_rtc_ops_noirq
Date: Mon, 11 Jan 2021 00:17:38 +0100
Message-Id: <20210110231752.1418816-4-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210110231752.1418816-1-alexandre.belloni@bootlin.com>
References: <20210110231752.1418816-1-alexandre.belloni@bootlin.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Clear RTC_FEATURE_ALARM to signal that alarms are not available instead of
having a supplementary struct rtc_class_ops with a NULL .set_alarm.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-armada38x.c | 21 ++++-----------------
 1 file changed, 4 insertions(+), 17 deletions(-)

diff --git a/drivers/rtc/rtc-armada38x.c b/drivers/rtc/rtc-armada38x.c
index 807a79c07f08..cc542e6b1d5b 100644
--- a/drivers/rtc/rtc-armada38x.c
+++ b/drivers/rtc/rtc-armada38x.c
@@ -458,14 +458,6 @@ static const struct rtc_class_ops armada38x_rtc_ops = {
 	.set_offset = armada38x_rtc_set_offset,
 };
 
-static const struct rtc_class_ops armada38x_rtc_ops_noirq = {
-	.read_time = armada38x_rtc_read_time,
-	.set_time = armada38x_rtc_set_time,
-	.read_alarm = armada38x_rtc_read_alarm,
-	.read_offset = armada38x_rtc_read_offset,
-	.set_offset = armada38x_rtc_set_offset,
-};
-
 static const struct armada38x_rtc_data armada38x_data = {
 	.update_mbus_timing = rtc_update_38x_mbus_timing_params,
 	.read_rtc_reg = read_rtc_register_38x_wa,
@@ -540,20 +532,15 @@ static __init int armada38x_rtc_probe(struct platform_device *pdev)
 	}
 	platform_set_drvdata(pdev, rtc);
 
-	if (rtc->irq != -1) {
+	if (rtc->irq != -1)
 		device_init_wakeup(&pdev->dev, 1);
-		rtc->rtc_dev->ops = &armada38x_rtc_ops;
-	} else {
-		/*
-		 * If there is no interrupt available then we can't
-		 * use the alarm
-		 */
-		rtc->rtc_dev->ops = &armada38x_rtc_ops_noirq;
-	}
+	else
+		clear_bit(RTC_FEATURE_ALARM, rtc->rtc_dev->features);
 
 	/* Update RTC-MBUS bridge timing parameters */
 	rtc->data->update_mbus_timing(rtc);
 
+	rtc->rtc_dev->ops = &armada38x_rtc_ops;
 	rtc->rtc_dev->range_max = U32_MAX;
 
 	return devm_rtc_register_device(rtc->rtc_dev);
-- 
2.29.2

