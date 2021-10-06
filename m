Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF604235B9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Oct 2021 04:12:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HPHzL4MrMz2yyj
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Oct 2021 13:12:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=hv2oKxRG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HPHyl1pK4z2xr4
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Oct 2021 13:12:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=hv2oKxRG; dkim-atps=neutral
Received: by gandalf.ozlabs.org (Postfix, from userid 1010)
 id 4HPHyl0jzWz4xbP; Wed,  6 Oct 2021 13:12:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
 s=201707; t=1633486335;
 bh=Y8EIfZGeynOigqULIjhBSM4nEZDVsGoKGIQz5Y8SVYU=;
 h=From:To:Cc:Subject:Date:From;
 b=hv2oKxRGbo22pkulj9Lc7eJNhkvhc+j3abZBWZ8nA1SmNlkA8Q8dTz8LFW7gM0dOB
 Bt4kK382P4pzBkFAOhGs0la2MftWlMNce6E3wwkmUZ+6oOl4LiuuMHkA0wgj8eD6EK
 gytB4UjQQ3sQYzaU7H0ViEFZVCgdfqeI3QEfocSh4MC6I8Gsz36T9YO6uKEOs0ww7Z
 AbyJ62g09meuFxzmmNiDJHu0KToeVZ1EjULRJrZDG3U4wyFRLFb48q1r5ECmGvqljl
 7cVZKzct9JlwmLOIpa0xdi8RE359sSk7vlbmHoxDW1/mjInkM5R8KSvEAtqU4Ncpdo
 X2kU6BbtMp3Rw==
From: Anton Blanchard <anton@ozlabs.org>
To: alistair@popple.id.au, joel@jms.id.au, andrew@aj.id.au, clg@kaod.org,
 mikey@neuling.org, jk@codeconstruct.com.au
Subject: [RFC 1/5] ipmi:bt-bmc: Separate out ASPEED specific bits
Date: Wed,  6 Oct 2021 13:12:01 +1100
Message-Id: <20211006021205.2579057-1-anton@ozlabs.org>
X-Mailer: git-send-email 2.31.1
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Most of the IPMI BT BMC driver is architecture agnostic - it deals with
architected registers and behaviour in the IPMI specification.

Separate out the few ASPEED specific bits into their own functions
so we can use this driver on other architectures.

Signed-off-by: Anton Blanchard <anton@ozlabs.org>
---
 drivers/char/ipmi/bt-bmc.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/char/ipmi/bt-bmc.c b/drivers/char/ipmi/bt-bmc.c
index 6e3d247b55d1..f85fafc96ef6 100644
--- a/drivers/char/ipmi/bt-bmc.c
+++ b/drivers/char/ipmi/bt-bmc.c
@@ -39,6 +39,7 @@
 #define   BT_CR2_IRQ_H2B	0x01
 #define   BT_CR2_IRQ_HBUSY	0x40
 #define BT_CR3		0xc
+
 #define BT_CTRL		0x10
 #define   BT_CTRL_B_BUSY		0x80
 #define   BT_CTRL_H_BUSY		0x40
@@ -372,7 +373,7 @@ static void poll_timer(struct timer_list *t)
 	add_timer(&bt_bmc->poll_timer);
 }
 
-static irqreturn_t bt_bmc_irq(int irq, void *arg)
+static irqreturn_t aspeed_bt_bmc_irq(int irq, void *arg)
 {
 	struct bt_bmc *bt_bmc = arg;
 	u32 reg;
@@ -393,7 +394,7 @@ static irqreturn_t bt_bmc_irq(int irq, void *arg)
 	return IRQ_HANDLED;
 }
 
-static int bt_bmc_config_irq(struct bt_bmc *bt_bmc,
+static int aspeed_bt_bmc_config_irq(struct bt_bmc *bt_bmc,
 			     struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -403,7 +404,7 @@ static int bt_bmc_config_irq(struct bt_bmc *bt_bmc,
 	if (bt_bmc->irq < 0)
 		return bt_bmc->irq;
 
-	rc = devm_request_irq(dev, bt_bmc->irq, bt_bmc_irq, IRQF_SHARED,
+	rc = devm_request_irq(dev, bt_bmc->irq, aspeed_bt_bmc_irq, IRQF_SHARED,
 			      DEVICE_NAME, bt_bmc);
 	if (rc < 0) {
 		dev_warn(dev, "Unable to request IRQ %d\n", bt_bmc->irq);
@@ -424,6 +425,16 @@ static int bt_bmc_config_irq(struct bt_bmc *bt_bmc,
 	return rc;
 }
 
+static void aspeed_enable_bt(struct bt_bmc *bt_bmc)
+{
+	regmap_write(bt_bmc->map, bt_bmc->offset + BT_CR0,
+		     (BT_IO_BASE << BT_CR0_IO_BASE) |
+		     (BT_IRQ << BT_CR0_IRQ) |
+		     BT_CR0_EN_CLR_SLV_RDP |
+		     BT_CR0_EN_CLR_SLV_WRP |
+		     BT_CR0_ENABLE_IBT);
+}
+
 static int bt_bmc_probe(struct platform_device *pdev)
 {
 	struct bt_bmc *bt_bmc;
@@ -472,7 +483,7 @@ static int bt_bmc_probe(struct platform_device *pdev)
 		return rc;
 	}
 
-	bt_bmc_config_irq(bt_bmc, pdev);
+	aspeed_bt_bmc_config_irq(bt_bmc, pdev);
 
 	if (bt_bmc->irq >= 0) {
 		dev_info(dev, "Using IRQ %d\n", bt_bmc->irq);
@@ -483,12 +494,7 @@ static int bt_bmc_probe(struct platform_device *pdev)
 		add_timer(&bt_bmc->poll_timer);
 	}
 
-	regmap_write(bt_bmc->map, bt_bmc->offset + BT_CR0,
-		     (BT_IO_BASE << BT_CR0_IO_BASE) |
-		     (BT_IRQ << BT_CR0_IRQ) |
-		     BT_CR0_EN_CLR_SLV_RDP |
-		     BT_CR0_EN_CLR_SLV_WRP |
-		     BT_CR0_ENABLE_IBT);
+	aspeed_enable_bt(bt_bmc);
 
 	clr_b_busy(bt_bmc);
 
-- 
2.31.1

