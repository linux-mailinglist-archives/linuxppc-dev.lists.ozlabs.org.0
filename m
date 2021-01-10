Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B932F0A77
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jan 2021 00:42:37 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DDYKk0WCNzDqQQ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jan 2021 10:42:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bootlin.com (client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=alexandre.belloni@bootlin.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=bootlin.com
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DDXny3qk2zDqNX
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Jan 2021 10:18:30 +1100 (AEDT)
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr
 [86.202.109.140])
 (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 04E7CFF809;
 Sun, 10 Jan 2021 23:18:26 +0000 (UTC)
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 14/17] rtc: rv3029: constify rv3029_rtc_ops
Date: Mon, 11 Jan 2021 00:17:49 +0100
Message-Id: <20210110231752.1418816-15-alexandre.belloni@bootlin.com>
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
 drivers/rtc/rtc-rv3029c2.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-rv3029c2.c b/drivers/rtc/rtc-rv3029c2.c
index dc1bda62095e..c1f4c0bba1e5 100644
--- a/drivers/rtc/rtc-rv3029c2.c
+++ b/drivers/rtc/rtc-rv3029c2.c
@@ -694,10 +694,13 @@ static void rv3029_hwmon_register(struct device *dev, const char *name)
 
 #endif /* CONFIG_RTC_DRV_RV3029_HWMON */
 
-static struct rtc_class_ops rv3029_rtc_ops = {
+static const struct rtc_class_ops rv3029_rtc_ops = {
 	.read_time	= rv3029_read_time,
 	.set_time	= rv3029_set_time,
 	.ioctl		= rv3029_ioctl,
+	.read_alarm	= rv3029_read_alarm,
+	.set_alarm	= rv3029_set_alarm,
+	.alarm_irq_enable = rv3029_alarm_irq_enable,
 };
 
 static int rv3029_probe(struct device *dev, struct regmap *regmap, int irq,
@@ -739,12 +742,10 @@ static int rv3029_probe(struct device *dev, struct regmap *regmap, int irq,
 		if (rc) {
 			dev_warn(dev, "unable to request IRQ, alarms disabled\n");
 			rv3029->irq = 0;
-		} else {
-			rv3029_rtc_ops.read_alarm = rv3029_read_alarm;
-			rv3029_rtc_ops.set_alarm = rv3029_set_alarm;
-			rv3029_rtc_ops.alarm_irq_enable = rv3029_alarm_irq_enable;
 		}
 	}
+	if (!rv3029->irq)
+		clear_bit(RTC_FEATURE_ALARM, rv3029->rtc->features);
 
 	rv3029->rtc->ops = &rv3029_rtc_ops;
 	rv3029->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
-- 
2.29.2

