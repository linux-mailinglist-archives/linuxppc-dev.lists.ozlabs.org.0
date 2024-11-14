Return-Path: <linuxppc-dev+bounces-3194-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A5A9C8B28
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2024 13:53:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xq0QY4jRRz30RK;
	Thu, 14 Nov 2024 23:51:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731588693;
	cv=none; b=ngR9n3CjP3KXV1rZXOoDqMvhi223R1+gnUyJM91IqPXxF3kjSdRmLkWgBdekaKciF9MuAIGHsInAsdtkqo5gdv1xERu2MhStDgYo87kgsOjVfDOMkekCTMqUlMCPxNhOTH5+Z06Lwu6m6ZIkXoHV0W7sqi9Y3w+zYPk94FRoan6lxZD1bSLNmOwmMs0p8nDecffxfWuidBwriaZkrlUAkpJHBUN445xZl/43xQxDLVfkwRquI4WML6h59mQbuIZgagSFC4cygdDT93cN2NVmMPPIxWP8UAX6sagr+q1bAbRqus0CFVR2SmZUPjh6kW2apKsE0tx+ZdgPMBeCsnWuoA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731588693; c=relaxed/relaxed;
	bh=TVrPuN62TirQi3n8J4yEY6pFFvqH5BlXogNdJxJWTvA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ezidmtKgLvsPxvC1urVd6YviaupXQWn8vkfwRJ3jV7hA58fjHekQD1uyarXYg/2lkcZW+DLHy0YABmJWpa7MNYxrO7z9XW26JPV/uiybQDoR8D1tmlZzvImrcIdWMkvSDFiA1NyrpSAc7mYQQfuq0V0H+CGdlwZOYYR5Jx34UYrIc2pHWm74fE/NfYL7uFL2473KGwCgHCDZBJYsm9G3VhWc01yls7Te7fLAPJgaNYbC+73QxZj/dk00+Wu5+kMcnodf4x5hG2B+LZRRU+g36QPSczaTPot/NSM8VHg5pGuuurPCG4bY5zPUzcMJvbnodIe7InhWbfcFornrymr39Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=QMTGCInV; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=QMTGCInV;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xq0QT51rZz30CD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2024 23:51:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1731588686;
	bh=TVrPuN62TirQi3n8J4yEY6pFFvqH5BlXogNdJxJWTvA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QMTGCInVzFrOCynOneQRsCuZJ+NfX58DNoQzN5bCOgh1cfaxP92XRMRFoV+Ojh0R4
	 i6nnahJcJEyT0BjMQ59SpaJ47hRXEhRf2zUjC8ywhiVJxV3mbjF5wc0bOD1IO7sjfj
	 p/MHLovo7xeT1s1VeLOQzO/IjirIa3ZACYsfNwT8NSQQE7qB35tJCeCpMBSuJ6LNeV
	 kiohkY+5LF1D2KdkM6SSY0CVQ9UlzXp6gvvVdP9UKMWaHitj+kLnJQWrJoESU1872s
	 AkSXqPx17mA/fx53ADrhXbqkV+5/L/cSq0/0s3uCrVZ24gTjWycfqSro36EBENTM42
	 iTBJHfFApVAJg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xq0QQ3s3Mz4xcd;
	Thu, 14 Nov 2024 23:51:26 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Cc: <linux-kernel@vger.kernel.org>,
	<jk@ozlabs.org>,
	<arnd@arndb.de>,
	<geoff@infradead.org>
Subject: [RFC PATCH 20/20] genirq: Remove IRQ_EDGE_EOI_HANDLER
Date: Thu, 14 Nov 2024 23:51:09 +1100
Message-ID: <20241114125111.599093-20-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241114125111.599093-1-mpe@ellerman.id.au>
References: <20241114125111.599093-1-mpe@ellerman.id.au>
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
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The powerpc Cell blade support, now removed, was the only user of
IRQ_EDGE_EOI_HANDLER, so remove it.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
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
2.47.0


