Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C05A52F0A65
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jan 2021 00:27:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DDY0P2ZfPzDqDq
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jan 2021 10:27:33 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DDXnn2lPhzDqMy
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Jan 2021 10:18:19 +1100 (AEDT)
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr
 [86.202.109.140])
 (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 1F4F0FF804;
 Sun, 10 Jan 2021 23:18:11 +0000 (UTC)
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 04/17] rtc: cmos: remove cmos_rtc_ops_no_alarm
Date: Mon, 11 Jan 2021 00:17:39 +0100
Message-Id: <20210110231752.1418816-5-alexandre.belloni@bootlin.com>
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
 drivers/rtc/rtc-cmos.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/rtc/rtc-cmos.c b/drivers/rtc/rtc-cmos.c
index 51e80bc70d42..c3746e249f5a 100644
--- a/drivers/rtc/rtc-cmos.c
+++ b/drivers/rtc/rtc-cmos.c
@@ -574,12 +574,6 @@ static const struct rtc_class_ops cmos_rtc_ops = {
 	.alarm_irq_enable	= cmos_alarm_irq_enable,
 };
 
-static const struct rtc_class_ops cmos_rtc_ops_no_alarm = {
-	.read_time		= cmos_read_time,
-	.set_time		= cmos_set_time,
-	.proc			= cmos_procfs,
-};
-
 /*----------------------------------------------------------------*/
 
 /*
@@ -857,12 +851,12 @@ cmos_do_probe(struct device *dev, struct resource *ports, int rtc_irq)
 			dev_dbg(dev, "IRQ %d is already in use\n", rtc_irq);
 			goto cleanup1;
 		}
-
-		cmos_rtc.rtc->ops = &cmos_rtc_ops;
 	} else {
-		cmos_rtc.rtc->ops = &cmos_rtc_ops_no_alarm;
+		clear_bit(RTC_FEATURE_ALARM, cmos_rtc.rtc->features);
 	}
 
+	cmos_rtc.rtc->ops = &cmos_rtc_ops;
+
 	retval = devm_rtc_register_device(cmos_rtc.rtc);
 	if (retval)
 		goto cleanup2;
-- 
2.29.2

