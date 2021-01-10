Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BCFB92F0A7A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jan 2021 00:44:12 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DDYMX1pFSzDqwC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jan 2021 10:44:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bootlin.com (client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=alexandre.belloni@bootlin.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=bootlin.com
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DDXnz37G0zDqP3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Jan 2021 10:18:30 +1100 (AEDT)
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr
 [86.202.109.140])
 (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id A9EAE240003;
 Sun, 10 Jan 2021 23:18:25 +0000 (UTC)
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 13/17] rtc: rv3028: constify rv3028_rtc_ops
Date: Mon, 11 Jan 2021 00:17:48 +0100
Message-Id: <20210110231752.1418816-14-alexandre.belloni@bootlin.com>
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
 drivers/rtc/rtc-rv3028.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-rv3028.c b/drivers/rtc/rtc-rv3028.c
index 979407a51c7a..2004f8c5397f 100644
--- a/drivers/rtc/rtc-rv3028.c
+++ b/drivers/rtc/rtc-rv3028.c
@@ -770,9 +770,12 @@ static int rv3028_clkout_register_clk(struct rv3028_data *rv3028,
 }
 #endif
 
-static struct rtc_class_ops rv3028_rtc_ops = {
+static const struct rtc_class_ops rv3028_rtc_ops = {
 	.read_time = rv3028_get_time,
 	.set_time = rv3028_set_time,
+	.read_alarm = rv3028_get_alarm,
+	.set_alarm = rv3028_set_alarm,
+	.alarm_irq_enable = rv3028_alarm_irq_enable,
 	.read_offset = rv3028_read_offset,
 	.set_offset = rv3028_set_offset,
 	.ioctl = rv3028_ioctl,
@@ -841,12 +844,10 @@ static int rv3028_probe(struct i2c_client *client)
 		if (ret) {
 			dev_warn(&client->dev, "unable to request IRQ, alarms disabled\n");
 			client->irq = 0;
-		} else {
-			rv3028_rtc_ops.read_alarm = rv3028_get_alarm;
-			rv3028_rtc_ops.set_alarm = rv3028_set_alarm;
-			rv3028_rtc_ops.alarm_irq_enable = rv3028_alarm_irq_enable;
 		}
 	}
+	if (!client->irq)
+		clear_bit(RTC_FEATURE_ALARM, rv3028->rtc->features);
 
 	ret = regmap_update_bits(rv3028->regmap, RV3028_CTRL1,
 				 RV3028_CTRL1_WADA, RV3028_CTRL1_WADA);
-- 
2.29.2

