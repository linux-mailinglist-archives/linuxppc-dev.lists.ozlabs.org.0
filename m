Return-Path: <linuxppc-dev+bounces-4312-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A589F642E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2024 11:57:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YCrFH3XcJz2ykt;
	Wed, 18 Dec 2024 21:55:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734519347;
	cv=none; b=J6Kqyc5f2PCmbkDm2+7o8ucgE9uFkD8g95Qwb9HPy+YXFVqTrnwcXdWk0QoAoguc3Mx7zqVtcPEyQlZWc5bW3sRmZdeQhzPnxUuQ93P7aTyVuVVn7bCk3eaHTkUvR1fXoPSk31uOTxvzppzNtaPmo9SXeTKl34h3ckEQvDxB+Lu4lOG3UmZF0yWjN8+550/lVpyymjGR1X6m0Yuka34y+zrZNCFYzZOIf2UsKQYTqgcQbdy76JL3lnihj1aRPu3/9mAp3+VJ8FEicbavFoZ8028ra2ypdl0dYmhVc1DStrk20e7e8+fuDkLQ9EevM4/CFHRdI82ECK0BwLCIebrxGw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734519347; c=relaxed/relaxed;
	bh=aAyFuWJoJRGXqCofl64ztcY0uEws5i1PTALx14da5GU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uk9qKSfmdyageqAokAwsjP4iDWQkGfPNgUZsqrBOqNl08WNDFOO78nGEZvAzUEjGqx++y2CxeKlHDh1BjkpMgedFddv5/3/Vc7Fw4603QNDD2fTUOz87UbuxIAMz1VHaetOeShtWGKdClSRPqET1IJJ62VIcNOnfSVez0AMTRi/zOaxPcwX0qh4fGdxTle4ZhYOcGE0NsK+Dfsvji/FFH8y9uRoEZx13Wpq8GBlAGpAkozeSIYh+0zWOZsvG+Os4Yi9gILz0hRLp3cMNyDRbO474mzdrW4nR03z5swHWYU+rUXoYc5LDoP88LBauWgAexMZMnoJwL9IFR0xF+tgA8w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=TDeDKIv8; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=TDeDKIv8;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YCrFC465wz30Wg
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2024 21:55:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1734519336;
	bh=aAyFuWJoJRGXqCofl64ztcY0uEws5i1PTALx14da5GU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TDeDKIv8Jrk45Fh8v3iV0Mh5E3uEd5FlNi2ogBS0kES99rSkke3ejo0OPTNXsoT07
	 bH2nlBEN8q5bqgXK28wxcs4hlIGVSLMfo7RDFrrZdtPvY8TLQkb4I//0eocwU2TiaN
	 pnRq0PKN+4rFGrI/3rFaWQ6L9O2P1CwgqNnfYQnDhonfmcG86n7rbgykkVXgmxVvIz
	 VlqL5wEChz0cJLwYX/Hc7KGEtUHlbxAu0jCYfagYNScZgwW/jTXlviFHB1vEn1Vosx
	 i+ACB3ZLf0ofkhNwj1Xfm0LLfSX2xWoP31aBGbcjS2Ib6hGi8ZSnWiA5mhRFnBBGw+
	 9/9XLqAbOeiXA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YCrF42sMGz4xfT;
	Wed, 18 Dec 2024 21:55:36 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Cc: <arnd@arndb.de>,
	<jk@ozlabs.org>,
	<segher@kernel.crashing.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v2 21/25] genirq: Remove IRQ_EDGE_EOI_HANDLER
Date: Wed, 18 Dec 2024 21:55:09 +1100
Message-ID: <20241218105523.416573-21-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241218105523.416573-1-mpe@ellerman.id.au>
References: <20241218105523.416573-1-mpe@ellerman.id.au>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The powerpc Cell blade support, now removed, was the only user of
IRQ_EDGE_EOI_HANDLER, so remove it.

Acked-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
v2: Unchanged.

 kernel/irq/Kconfig |  4 ----
 kernel/irq/chip.c  | 47 ----------------------------------------------
 2 files changed, 51 deletions(-)

diff --git a/kernel/irq/Kconfig b/kernel/irq/Kconfig
index 529adb1f5859..564f3d454102 100644
--- a/kernel/irq/Kconfig
+++ b/kernel/irq/Kconfig
@@ -47,10 +47,6 @@ config GENERIC_IRQ_INJECTION
 config HARDIRQS_SW_RESEND
        bool
 
-# Edge style eoi based handler (cell)
-config IRQ_EDGE_EOI_HANDLER
-       bool
-
 # Generic configurable interrupt chip implementation
 config GENERIC_IRQ_CHIP
        bool
diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
index 271e9139de77..de5866f57bd7 100644
--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -838,53 +838,6 @@ void handle_edge_irq(struct irq_desc *desc)
 }
 EXPORT_SYMBOL(handle_edge_irq);
 
-#ifdef CONFIG_IRQ_EDGE_EOI_HANDLER
-/**
- *	handle_edge_eoi_irq - edge eoi type IRQ handler
- *	@desc:	the interrupt description structure for this irq
- *
- * Similar as the above handle_edge_irq, but using eoi and w/o the
- * mask/unmask logic.
- */
-void handle_edge_eoi_irq(struct irq_desc *desc)
-{
-	struct irq_chip *chip = irq_desc_get_chip(desc);
-
-	raw_spin_lock(&desc->lock);
-
-	desc->istate &= ~(IRQS_REPLAY | IRQS_WAITING);
-
-	if (!irq_may_run(desc)) {
-		desc->istate |= IRQS_PENDING;
-		goto out_eoi;
-	}
-
-	/*
-	 * If its disabled or no action available then mask it and get
-	 * out of here.
-	 */
-	if (irqd_irq_disabled(&desc->irq_data) || !desc->action) {
-		desc->istate |= IRQS_PENDING;
-		goto out_eoi;
-	}
-
-	kstat_incr_irqs_this_cpu(desc);
-
-	do {
-		if (unlikely(!desc->action))
-			goto out_eoi;
-
-		handle_irq_event(desc);
-
-	} while ((desc->istate & IRQS_PENDING) &&
-		 !irqd_irq_disabled(&desc->irq_data));
-
-out_eoi:
-	chip->irq_eoi(&desc->irq_data);
-	raw_spin_unlock(&desc->lock);
-}
-#endif
-
 /**
  *	handle_percpu_irq - Per CPU local irq handler
  *	@desc:	the interrupt description structure for this irq
-- 
2.47.1


