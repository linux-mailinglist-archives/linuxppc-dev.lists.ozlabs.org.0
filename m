Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A1A2F0A70
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jan 2021 00:36:07 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DDYBD5jQ5zDqS8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jan 2021 10:36:04 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DDXns0wZSzDqPv
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Jan 2021 10:18:22 +1100 (AEDT)
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr
 [86.202.109.140])
 (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 91A7760005;
 Sun, 10 Jan 2021 23:18:15 +0000 (UTC)
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 05/17] rtc: mv: remove mv_rtc_alarm_ops
Date: Mon, 11 Jan 2021 00:17:40 +0100
Message-Id: <20210110231752.1418816-6-alexandre.belloni@bootlin.com>
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

Move the alarm callbacks in mv_rtc_ops and clear RTC_FEATURE_ALARM to
signal that alarms are not available instead of having a supplementary
struct rtc_class_ops.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-mv.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/rtc/rtc-mv.c b/drivers/rtc/rtc-mv.c
index f8e2ecea1d8d..6c526e2ec56d 100644
--- a/drivers/rtc/rtc-mv.c
+++ b/drivers/rtc/rtc-mv.c
@@ -200,11 +200,6 @@ static irqreturn_t mv_rtc_interrupt(int irq, void *data)
 static const struct rtc_class_ops mv_rtc_ops = {
 	.read_time	= mv_rtc_read_time,
 	.set_time	= mv_rtc_set_time,
-};
-
-static const struct rtc_class_ops mv_rtc_alarm_ops = {
-	.read_time	= mv_rtc_read_time,
-	.set_time	= mv_rtc_set_time,
 	.read_alarm	= mv_rtc_read_alarm,
 	.set_alarm	= mv_rtc_set_alarm,
 	.alarm_irq_enable = mv_rtc_alarm_irq_enable,
@@ -268,13 +263,12 @@ static int __init mv_rtc_probe(struct platform_device *pdev)
 		}
 	}
 
-	if (pdata->irq >= 0) {
+	if (pdata->irq >= 0)
 		device_init_wakeup(&pdev->dev, 1);
-		pdata->rtc->ops = &mv_rtc_alarm_ops;
-	} else {
-		pdata->rtc->ops = &mv_rtc_ops;
-	}
+	else
+		clear_bit(RTC_FEATURE_ALARM, pdata->rtc->features);
 
+	pdata->rtc->ops = &mv_rtc_ops;
 	pdata->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
 	pdata->rtc->range_max = RTC_TIMESTAMP_END_2099;
 
-- 
2.29.2

