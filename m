Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E14262F0A0D
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Jan 2021 23:48:19 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DDX743qYlzDqMy
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jan 2021 09:48:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bootlin.com (client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=alexandre.belloni@bootlin.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=bootlin.com
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DDX5C2lTSzDqMB
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Jan 2021 09:46:24 +1100 (AEDT)
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr
 [86.202.109.140])
 (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 1D1D7C0003;
 Sun, 10 Jan 2021 22:46:18 +0000 (UTC)
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH] rtc: opal: set range
Date: Sun, 10 Jan 2021 23:46:06 +0100
Message-Id: <20210110224606.1414307-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.29.2
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
Cc: linux-rtc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

It is a BCD RTC with 4 digits for the year.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-opal.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-opal.c b/drivers/rtc/rtc-opal.c
index 7b9f8bcf86fe..c586f695bdc9 100644
--- a/drivers/rtc/rtc-opal.c
+++ b/drivers/rtc/rtc-opal.c
@@ -233,6 +233,10 @@ static int opal_rtc_probe(struct platform_device *pdev)
 {
 	struct rtc_device *rtc;
 
+	rtc = devm_rtc_allocate_device(&pdev->dev);
+	if (IS_ERR(rtc))
+		return PTR_ERR(rtc);
+
 	if (pdev->dev.of_node &&
 	    (of_property_read_bool(pdev->dev.of_node, "wakeup-source") ||
 	     of_property_read_bool(pdev->dev.of_node, "has-tpo")/* legacy */)) {
@@ -242,14 +246,12 @@ static int opal_rtc_probe(struct platform_device *pdev)
 		opal_rtc_ops.alarm_irq_enable = opal_tpo_alarm_irq_enable;
 	}
 
-	rtc = devm_rtc_device_register(&pdev->dev, DRVNAME, &opal_rtc_ops,
-				       THIS_MODULE);
-	if (IS_ERR(rtc))
-		return PTR_ERR(rtc);
-
+	rtc->ops = &opal_rtc_ops;
+	rtc->range_min = RTC_TIMESTAMP_BEGIN_0000;
+	rtc->range_max = RTC_TIMESTAMP_END_9999;
 	rtc->uie_unsupported = 1;
 
-	return 0;
+	return devm_rtc_register_device(rtc);
 }
 
 static const struct of_device_id opal_rtc_match[] = {
-- 
2.29.2

