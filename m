Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFCA2F0A66
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jan 2021 00:29:11 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DDY2D1YbGzDqVp
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jan 2021 10:29:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bootlin.com (client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=alexandre.belloni@bootlin.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=bootlin.com
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DDXnn6cjkzDqNw
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Jan 2021 10:18:21 +1100 (AEDT)
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr
 [86.202.109.140])
 (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 79E4F20003;
 Sun, 10 Jan 2021 23:18:18 +0000 (UTC)
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 07/17] rtc: pcf2127: remove pcf2127_rtc_alrm_ops
Date: Mon, 11 Jan 2021 00:17:42 +0100
Message-Id: <20210110231752.1418816-8-alexandre.belloni@bootlin.com>
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

Move the alarm callbacks in pcf2127_rtc_ops and use RTC_FEATURE_ALARM to
signal to the core whether alarms are available instead of having a
supplementary struct rtc_class_ops without alarm callbacks.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-pcf2127.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index 39a7b5116aa4..68160d857ac1 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -225,12 +225,6 @@ static int pcf2127_rtc_ioctl(struct device *dev,
 	}
 }
 
-static const struct rtc_class_ops pcf2127_rtc_ops = {
-	.ioctl		= pcf2127_rtc_ioctl,
-	.read_time	= pcf2127_rtc_read_time,
-	.set_time	= pcf2127_rtc_set_time,
-};
-
 static int pcf2127_nvmem_read(void *priv, unsigned int offset,
 			      void *val, size_t bytes)
 {
@@ -459,7 +453,7 @@ static irqreturn_t pcf2127_rtc_irq(int irq, void *dev)
 	return IRQ_HANDLED;
 }
 
-static const struct rtc_class_ops pcf2127_rtc_alrm_ops = {
+static const struct rtc_class_ops pcf2127_rtc_ops = {
 	.ioctl            = pcf2127_rtc_ioctl,
 	.read_time        = pcf2127_rtc_read_time,
 	.set_time         = pcf2127_rtc_set_time,
@@ -584,6 +578,7 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 	pcf2127->rtc->range_max = RTC_TIMESTAMP_END_2099;
 	pcf2127->rtc->set_start_time = true; /* Sets actual start to 1970 */
 	pcf2127->rtc->uie_unsupported = 1;
+	clear_bit(RTC_FEATURE_ALARM, pcf2127->rtc->features);
 
 	if (alarm_irq > 0) {
 		ret = devm_request_threaded_irq(dev, alarm_irq, NULL,
@@ -598,7 +593,7 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 
 	if (alarm_irq > 0 || device_property_read_bool(dev, "wakeup-source")) {
 		device_init_wakeup(dev, true);
-		pcf2127->rtc->ops = &pcf2127_rtc_alrm_ops;
+		set_bit(RTC_FEATURE_ALARM, pcf2127->rtc->features);
 	}
 
 	if (has_nvmem) {
-- 
2.29.2

