Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 826083AB80F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 17:58:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5RYb1dHCz3fLR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 01:58:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=VZzD9zag;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634;
 helo=mail-pl1-x634.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=VZzD9zag; dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5RPv6DBtz3bwS
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 01:52:03 +1000 (AEST)
Received: by mail-pl1-x634.google.com with SMTP id o21so3158465pll.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 08:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P3z0jmvjmuLBwq4H/IDqtYc9zPtK0r3LILpX+h5DMJA=;
 b=VZzD9zag2GiUnAu8KtxrC/UOzRCBcrLNci96HL+KGBzRcOlRZbTQ5YreIeWnVPvaIQ
 QOFUZl4SOIC/pwQUMpSSWFGejYIHnmUJ+/S38ShtEDMyZqZ41LrlXLD1qTHTMGDNSP9c
 cpG/h1Lg7ISR3xFt0U3srZ9G4WZL2SICzaZMr9uSSIQwDAHb6VR5ZOBicSJt10y+qIy4
 qIdfk015MIv6zfN4B8f9I2c+aomEZuSbpFHehuX+z0rHN0A6ZACiSjnjMnPPhBxrfux8
 ARVisSMYuEer+XWgac9mNFgqr/teEwZqdJHhwgETy0ydTyWJGHvcAn09H2KyxEzojPG2
 0A8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P3z0jmvjmuLBwq4H/IDqtYc9zPtK0r3LILpX+h5DMJA=;
 b=eJnrt8jfc2GeFpSH1jUkBN7B+Bc5RhrrsFnwU+Xt1FcyhN8Vvgfmrs9+vRoH+V5Sha
 FDkvEMxTPrw+NI4TYo5pALFEPSYwrp2h+La7w8DDiV7WxGvRS7BjujOxC9qyR+aUn3a3
 peSw4+VYyOVlXNmXG5hY2iL3FGwsQCyWDAvGcRjyJNykUlnCH6ZtEPnQFShbyugKcVCu
 KeVVM7l3slCZCt0zAYNTIETicpoLQikUqDQB/+fA11uO+l3DfgaK25bF+I2FTe8G1wNZ
 YmF94F/vk8p1k5C8AR18irbBZMQYjjWLIlyiFtmU1lWkxhKEs23xlJXnViTwSg59BjKc
 iECw==
X-Gm-Message-State: AOAM530UZSHuTGGGs198usk/b40Q9ubkAcaYxIFR4lLbOJ3qSeGioutU
 SLDswf9H0TZHc6Q3rs3kS4YGZSPb22c=
X-Google-Smtp-Source: ABdhPJysChn63FyCLVFvv8y3R/vObep2SQ5GTwCwOFED3fY/MOvx1WMTvN1JXTXYJ0SXsNMXoU4/aA==
X-Received: by 2002:a17:902:9008:b029:119:25dd:8646 with SMTP id
 a8-20020a1709029008b029011925dd8646mr578157plp.41.1623945120484; 
 Thu, 17 Jun 2021 08:52:00 -0700 (PDT)
Received: from bobo.ibm.com (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id a15sm5749733pfl.100.2021.06.17.08.51.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 08:52:00 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 16/17] powerpc/interrupt: Refactor
 prep_irq_for_{user/kernel_enabled}_exit()
Date: Fri, 18 Jun 2021 01:51:15 +1000
Message-Id: <20210617155116.2167984-17-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210617155116.2167984-1-npiggin@gmail.com>
References: <20210617155116.2167984-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Christophe Leroy <christophe.leroy@csgroup.eu>

prep_irq_for_user_exit() is a superset of
prep_irq_for_kernel_enabled_exit().

Rename prep_irq_for_kernel_enabled_exit() as prep_irq_for_enabled_exit()
and have prep_irq_for_user_exit() use it.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/interrupt.c | 29 +++++++----------------------
 1 file changed, 7 insertions(+), 22 deletions(-)

diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index 6ba693f99e5a..138c450b01bd 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -50,7 +50,7 @@ static inline bool exit_must_hard_disable(void)
  * restartable is true then EE/RI can be left on because interrupts are handled
  * with a restart sequence.
  */
-static notrace __always_inline bool prep_irq_for_kernel_enabled_exit(bool restartable)
+static notrace __always_inline bool prep_irq_for_enabled_exit(bool restartable)
 {
 	/* This must be done with RI=1 because tracing may touch vmaps */
 	trace_hardirqs_on();
@@ -77,29 +77,14 @@ static notrace __always_inline bool prep_irq_for_kernel_enabled_exit(bool restar
 
 static notrace __always_inline bool prep_irq_for_user_exit(void)
 {
-	user_enter_irqoff();
-	/* This must be done with RI=1 because tracing may touch vmaps */
-	trace_hardirqs_on();
-
-#ifdef CONFIG_PPC32
-	__hard_EE_RI_disable();
-#else
-	if (exit_must_hard_disable())
-		__hard_EE_RI_disable();
+	bool ret;
 
-	/* This pattern matches prep_irq_for_idle */
-	if (unlikely(lazy_irq_pending_nocheck())) {
-		if (exit_must_hard_disable()) {
-			local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
-			__hard_RI_enable();
-		}
-		trace_hardirqs_off();
+	user_enter_irqoff();
+	ret = prep_irq_for_enabled_exit(true);
+	if (!ret)
 		user_exit_irqoff();
 
-		return false;
-	}
-#endif
-	return true;
+	return ret;
 }
 
 /* Has to run notrace because it is entered not completely "reconciled" */
@@ -469,7 +454,7 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs)
 		 * Stack store exit can't be restarted because the interrupt
 		 * stack frame might have been clobbered.
 		 */
-		if (!prep_irq_for_kernel_enabled_exit(unlikely(stack_store))) {
+		if (!prep_irq_for_enabled_exit(unlikely(stack_store))) {
 			/*
 			 * Replay pending soft-masked interrupts now. Don't
 			 * just local_irq_enabe(); local_irq_disable(); because
-- 
2.23.0

