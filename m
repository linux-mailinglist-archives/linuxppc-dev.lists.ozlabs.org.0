Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0AD2F0A75
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jan 2021 00:41:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DDYHt0gdDzDqNW
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jan 2021 10:40:58 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DDXnw2WHszDqNX
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Jan 2021 10:18:27 +1100 (AEDT)
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr
 [86.202.109.140])
 (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id DC80260008;
 Sun, 10 Jan 2021 23:18:23 +0000 (UTC)
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-rtc@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 12/17] rtc: opal: constify opal_rtc_ops
Date: Mon, 11 Jan 2021 00:17:47 +0100
Message-Id: <20210110231752.1418816-13-alexandre.belloni@bootlin.com>
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
 drivers/rtc/rtc-opal.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-opal.c b/drivers/rtc/rtc-opal.c
index c586f695bdc9..f8f49a969c23 100644
--- a/drivers/rtc/rtc-opal.c
+++ b/drivers/rtc/rtc-opal.c
@@ -224,9 +224,12 @@ static int opal_tpo_alarm_irq_enable(struct device *dev, unsigned int enabled)
 	return enabled ? 0 : opal_set_tpo_time(dev, &alarm);
 }
 
-static struct rtc_class_ops opal_rtc_ops = {
+static const struct rtc_class_ops opal_rtc_ops = {
 	.read_time	= opal_get_rtc_time,
 	.set_time	= opal_set_rtc_time,
+	.read_alarm	= opal_get_tpo_time,
+	.set_alarm	= opal_set_tpo_time,
+	.alarm_irq_enable = opal_tpo_alarm_irq_enable,
 };
 
 static int opal_rtc_probe(struct platform_device *pdev)
@@ -239,12 +242,10 @@ static int opal_rtc_probe(struct platform_device *pdev)
 
 	if (pdev->dev.of_node &&
 	    (of_property_read_bool(pdev->dev.of_node, "wakeup-source") ||
-	     of_property_read_bool(pdev->dev.of_node, "has-tpo")/* legacy */)) {
+	     of_property_read_bool(pdev->dev.of_node, "has-tpo")/* legacy */))
 		device_set_wakeup_capable(&pdev->dev, true);
-		opal_rtc_ops.read_alarm	= opal_get_tpo_time;
-		opal_rtc_ops.set_alarm = opal_set_tpo_time;
-		opal_rtc_ops.alarm_irq_enable = opal_tpo_alarm_irq_enable;
-	}
+	else
+		clear_bit(RTC_FEATURE_ALARM, rtc->features);
 
 	rtc->ops = &opal_rtc_ops;
 	rtc->range_min = RTC_TIMESTAMP_BEGIN_0000;
-- 
2.29.2

