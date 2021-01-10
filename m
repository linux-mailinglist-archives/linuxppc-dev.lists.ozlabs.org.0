Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6372F0A7B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jan 2021 00:45:52 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DDYPT4D0gzDqv9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jan 2021 10:45:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bootlin.com (client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=alexandre.belloni@bootlin.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=bootlin.com
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DDXp03dWtzDqLy
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Jan 2021 10:18:32 +1100 (AEDT)
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr
 [86.202.109.140])
 (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id E43EC6000B;
 Sun, 10 Jan 2021 23:18:27 +0000 (UTC)
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 15/17] rtc: rv3032: constify rv3032_rtc_ops
Date: Mon, 11 Jan 2021 00:17:50 +0100
Message-Id: <20210110231752.1418816-16-alexandre.belloni@bootlin.com>
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

Use RTC_FEATURE_ALARM to signal to the core whether alarms are available
instead of changing the global struct rtc_class_ops, allowing to make it
const.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-rv3032.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-rv3032.c b/drivers/rtc/rtc-rv3032.c
index c9bcea727757..5161016bce00 100644
--- a/drivers/rtc/rtc-rv3032.c
+++ b/drivers/rtc/rtc-rv3032.c
@@ -804,12 +804,15 @@ static void rv3032_hwmon_register(struct device *dev)
 	devm_hwmon_device_register_with_info(dev, "rv3032", rv3032, &rv3032_hwmon_chip_info, NULL);
 }
 
-static struct rtc_class_ops rv3032_rtc_ops = {
+static const struct rtc_class_ops rv3032_rtc_ops = {
 	.read_time = rv3032_get_time,
 	.set_time = rv3032_set_time,
 	.read_offset = rv3032_read_offset,
 	.set_offset = rv3032_set_offset,
 	.ioctl = rv3032_ioctl,
+	.read_alarm = rv3032_get_alarm,
+	.set_alarm = rv3032_set_alarm,
+	.alarm_irq_enable = rv3032_alarm_irq_enable,
 };
 
 static const struct regmap_config regmap_config = {
@@ -868,12 +871,10 @@ static int rv3032_probe(struct i2c_client *client)
 		if (ret) {
 			dev_warn(&client->dev, "unable to request IRQ, alarms disabled\n");
 			client->irq = 0;
-		} else {
-			rv3032_rtc_ops.read_alarm = rv3032_get_alarm;
-			rv3032_rtc_ops.set_alarm = rv3032_set_alarm;
-			rv3032_rtc_ops.alarm_irq_enable = rv3032_alarm_irq_enable;
 		}
 	}
+	if (!client->irq)
+		clear_bit(RTC_FEATURE_ALARM, rv3032->rtc->features);
 
 	ret = regmap_update_bits(rv3032->regmap, RV3032_CTRL1,
 				 RV3032_CTRL1_WADA, RV3032_CTRL1_WADA);
-- 
2.29.2

