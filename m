Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CA989100567
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Nov 2019 13:15:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Gnw3039SzDqXM
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Nov 2019 23:15:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::343;
 helo=mail-wm1-x343.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="KmYgpOs0"; dkim-atps=neutral
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Gmmr6s7BzDqQg
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Nov 2019 22:23:56 +1100 (AEDT)
Received: by mail-wm1-x343.google.com with SMTP id l1so16931709wme.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Nov 2019 03:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E9MniY1Iee5HGhOe/xollIck0/KPXWyQbXSm1b3gOvo=;
 b=KmYgpOs03WlRSKWe25/tIn9VSvLYe/epSNDIYgK8wAr/FkEbkodUxcOvwDHl0iMXx1
 Q7Fz/OZcylQNKuX0kdyaWA5h5ANdUjaux3BmXbKFKLjXi+V5HXXpPUTLCp9t3I0LYFOn
 OWF2SoCtnbuXsbrG8Dms2j8Rm9M+BO+SEO8Ok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E9MniY1Iee5HGhOe/xollIck0/KPXWyQbXSm1b3gOvo=;
 b=Tp7MPzCq2xpXklib7zVaWKRCzRTSpdkjvutsnNILb/g9qUJkheNM9Jyej134fG9L/2
 RMrY9wHUOzPQVZoZMuYDNRC06wAl62OhRtfR/CxTOlPQrY6zxBphL67ogGwrt5V93sD2
 YYxEkp7Do+L6AjRzPzvrDOHc385Hz2Okul0M+tzfWENmJhSPOk/aMGvkly5Lau1NODbh
 BLsuG+yjNk26QCZ3cmojn0mxGldcJj3tjo3QtVIF4u+CBcRQ7VsgpmyaLLH2f1zLGIyg
 dqGMNe7YvZle1jVWsP+izlRVquta83uJ15DTPgPm4iTWyqDbl863dxWzUSu/ts2Un0Im
 Kaww==
X-Gm-Message-State: APjAAAX+LPYYuiJpFBH7SVmjExHyF4imCYGvv6W8RuZc9E2zTMlF6R1y
 CLTwZZqAmNcsdoZ75cRdvPnVag==
X-Google-Smtp-Source: APXvYqxZcCNNXSs5JK4j/71NfJC5T9Ojx0yMJuAKnaNO6Kk/zJ3sCMcq8gy935CfGfKPJG2JCRN2/Q==
X-Received: by 2002:a7b:ce12:: with SMTP id m18mr30519450wmc.130.1574076234050; 
 Mon, 18 Nov 2019 03:23:54 -0800 (PST)
Received: from prevas-ravi.prevas.se (ip-5-186-115-54.cgn.fibianet.dk.
 [5.186.115.54])
 by smtp.gmail.com with ESMTPSA id y2sm21140815wmy.2.2019.11.18.03.23.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 03:23:53 -0800 (PST)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v5 18/48] soc: fsl: qe: don't use NO_IRQ in qe_ic.c
Date: Mon, 18 Nov 2019 12:22:54 +0100
Message-Id: <20191118112324.22725-19-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191118112324.22725-1-linux@rasmusvillemoes.dk>
References: <20191118112324.22725-1-linux@rasmusvillemoes.dk>
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
Cc: Timur Tabi <timur@kernel.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linux-kernel@vger.kernel.org, Scott Wood <oss@buserror.net>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This driver is currently PPC-only, and on powerpc, NO_IRQ is 0, so
this doesn't change functionality. However, not every architecture
defines NO_IRQ, and some define it as -1, so the detection of a failed
irq_of_parse_and_map() (which returns 0 on failure) would be wrong on
those. So to prepare for allowing this driver to build on other
architectures, drop all references to NO_IRQ.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/soc/fsl/qe/qe_ic.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/soc/fsl/qe/qe_ic.c b/drivers/soc/fsl/qe/qe_ic.c
index 4839dcd5c5d3..8f74bc6efd5c 100644
--- a/drivers/soc/fsl/qe/qe_ic.c
+++ b/drivers/soc/fsl/qe/qe_ic.c
@@ -282,7 +282,7 @@ static const struct irq_domain_ops qe_ic_host_ops = {
 	.xlate = irq_domain_xlate_onetwocell,
 };
 
-/* Return an interrupt vector or NO_IRQ if no interrupt is pending. */
+/* Return an interrupt vector or 0 if no interrupt is pending. */
 unsigned int qe_ic_get_low_irq(struct qe_ic *qe_ic)
 {
 	int irq;
@@ -293,12 +293,12 @@ unsigned int qe_ic_get_low_irq(struct qe_ic *qe_ic)
 	irq = qe_ic_read(qe_ic->regs, QEIC_CIVEC) >> 26;
 
 	if (irq == 0)
-		return NO_IRQ;
+		return 0;
 
 	return irq_linear_revmap(qe_ic->irqhost, irq);
 }
 
-/* Return an interrupt vector or NO_IRQ if no interrupt is pending. */
+/* Return an interrupt vector or 0 if no interrupt is pending. */
 unsigned int qe_ic_get_high_irq(struct qe_ic *qe_ic)
 {
 	int irq;
@@ -309,7 +309,7 @@ unsigned int qe_ic_get_high_irq(struct qe_ic *qe_ic)
 	irq = qe_ic_read(qe_ic->regs, QEIC_CHIVEC) >> 26;
 
 	if (irq == 0)
-		return NO_IRQ;
+		return 0;
 
 	return irq_linear_revmap(qe_ic->irqhost, irq);
 }
@@ -320,7 +320,7 @@ static void qe_ic_cascade_low(struct irq_desc *desc)
 	unsigned int cascade_irq = qe_ic_get_low_irq(qe_ic);
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 
-	if (cascade_irq != NO_IRQ)
+	if (cascade_irq != 0)
 		generic_handle_irq(cascade_irq);
 
 	if (chip->irq_eoi)
@@ -333,7 +333,7 @@ static void qe_ic_cascade_high(struct irq_desc *desc)
 	unsigned int cascade_irq = qe_ic_get_high_irq(qe_ic);
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 
-	if (cascade_irq != NO_IRQ)
+	if (cascade_irq != 0)
 		generic_handle_irq(cascade_irq);
 
 	if (chip->irq_eoi)
@@ -347,10 +347,10 @@ static void qe_ic_cascade_muxed_mpic(struct irq_desc *desc)
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 
 	cascade_irq = qe_ic_get_high_irq(qe_ic);
-	if (cascade_irq == NO_IRQ)
+	if (cascade_irq == 0)
 		cascade_irq = qe_ic_get_low_irq(qe_ic);
 
-	if (cascade_irq != NO_IRQ)
+	if (cascade_irq != 0)
 		generic_handle_irq(cascade_irq);
 
 	chip->irq_eoi(&desc->irq_data);
@@ -386,7 +386,7 @@ static void __init qe_ic_init(struct device_node *node, unsigned int flags)
 	qe_ic->virq_high = irq_of_parse_and_map(node, 0);
 	qe_ic->virq_low = irq_of_parse_and_map(node, 1);
 
-	if (qe_ic->virq_low == NO_IRQ) {
+	if (!qe_ic->virq_low) {
 		printk(KERN_ERR "Failed to map QE_IC low IRQ\n");
 		kfree(qe_ic);
 		return;
@@ -423,8 +423,7 @@ static void __init qe_ic_init(struct device_node *node, unsigned int flags)
 	irq_set_handler_data(qe_ic->virq_low, qe_ic);
 	irq_set_chained_handler(qe_ic->virq_low, low_handler);
 
-	if (qe_ic->virq_high != NO_IRQ &&
-			qe_ic->virq_high != qe_ic->virq_low) {
+	if (qe_ic->virq_high && qe_ic->virq_high != qe_ic->virq_low) {
 		irq_set_handler_data(qe_ic->virq_high, qe_ic);
 		irq_set_chained_handler(qe_ic->virq_high, high_handler);
 	}
-- 
2.23.0

