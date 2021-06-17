Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B66F43AB809
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 17:58:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5RY839Ggz3d5T
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 01:58:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=hO58kFfA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631;
 helo=mail-pl1-x631.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=hO58kFfA; dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5RPs2f71z3c5d
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 01:52:01 +1000 (AEST)
Received: by mail-pl1-x631.google.com with SMTP id 11so3146783plk.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 08:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Pw6F26s4ZC4nFStjL48zmOQfXQqls8+WJfLKS4tTvgQ=;
 b=hO58kFfA+5zZcS+rmSbwRxTq4uPnnFKMgB7kh2gsAg3PPAsJCkYu+2OaPkUIVyVbzn
 lnXB7PRELYA0L8BeTpnUeapRr6z5Xz8bDAUfAiubeG7mynQZjzh+GDsz+7WHl5VEEgcc
 Uuc0IhsUtMwCAOES3LvTvKwhtHa98l+SdP6ZVz5hbwcr8PjpVwuNjFQWTSfwUZKdUedP
 sKVLGce48mS5UWYtD08+CNbWiodQ3F9DhjhyyJbMFywObGYYoHBetWNU+WcsCFG19lAv
 O9iK52bO7Q4aQADqbbqumjFgy8AbU+c3ZQaoT5MOojMCfpU0Oc5RGfnM4mviTECSvOdN
 PcWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Pw6F26s4ZC4nFStjL48zmOQfXQqls8+WJfLKS4tTvgQ=;
 b=ndVerGNF8pcJcZEwHmLGvG4KWdiQF4V6vXWGiEPmIjrR8jPJjAhv53ET3z93a4gVJd
 AxDUS5RA/eKYKKLCVz0V+tAU7+lcK/Qezf08udIUfBHlarByzSpGJ5eSWFSDenl4+GYx
 AaAvuyIFg5laiRtQVUZ0txZ/3xLO/ui26cEOD7rL+IWACtzFO7549tjkj+MXVncSHSHD
 BM+UfjT1UpIpCEHouZrju5Wb7YA+kM5jHp4KtlAR1Y3spionHM6TBtazd/z5rsZEjtsr
 IRfmNACQMBcdFfQMS9VBaCtobDmKOYVrOV+N3yEHK8zQ3f/U83eIuWKcXwn+wUlUT3B2
 XNLg==
X-Gm-Message-State: AOAM531dyxKSz3knbpppxhkkI4wS4MqMJ8qaWP/WnOivt/DfZeWJiiJO
 ddhX1NVCC0QoHjoMBgOHkCwQ5T9Oqbc=
X-Google-Smtp-Source: ABdhPJxi2QZB6LA2piOt6PzWy07tLlEygBaQ+ZW9v1Z6XrEawyLd/5o5gpB1DLMZ88XGtJlNUQvecg==
X-Received: by 2002:a17:902:ee06:b029:11f:f229:1a5d with SMTP id
 z6-20020a170902ee06b029011ff2291a5dmr491569plb.61.1623945118060; 
 Thu, 17 Jun 2021 08:51:58 -0700 (PDT)
Received: from bobo.ibm.com (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id a15sm5749733pfl.100.2021.06.17.08.51.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 08:51:57 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 15/17] powerpc/interrupt: Interchange
 prep_irq_for_{kernel_enabled/user}_exit()
Date: Fri, 18 Jun 2021 01:51:14 +1000
Message-Id: <20210617155116.2167984-16-npiggin@gmail.com>
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
prep_irq_for_kernel_enabled_exit(). In order to allow refactoring in
following patch, interchange the two. This will allow
prep_irq_for_user_exit() to call a renamed version of
prep_irq_for_kernel_enabled_exit().

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/interrupt.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index e946084d4906..6ba693f99e5a 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -46,27 +46,28 @@ static inline bool exit_must_hard_disable(void)
  * This should be called with local irqs disabled, but if they were previously
  * enabled when the interrupt handler returns (indicating a process-context /
  * synchronous interrupt) then irqs_enabled should be true.
+ *
+ * restartable is true then EE/RI can be left on because interrupts are handled
+ * with a restart sequence.
  */
-static notrace __always_inline bool prep_irq_for_user_exit(void)
+static notrace __always_inline bool prep_irq_for_kernel_enabled_exit(bool restartable)
 {
-	user_enter_irqoff();
 	/* This must be done with RI=1 because tracing may touch vmaps */
 	trace_hardirqs_on();
 
 #ifdef CONFIG_PPC32
 	__hard_EE_RI_disable();
 #else
-	if (exit_must_hard_disable())
+	if (exit_must_hard_disable() || !restartable)
 		__hard_EE_RI_disable();
 
 	/* This pattern matches prep_irq_for_idle */
 	if (unlikely(lazy_irq_pending_nocheck())) {
-		if (exit_must_hard_disable()) {
+		if (exit_must_hard_disable() || !restartable) {
 			local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
 			__hard_RI_enable();
 		}
 		trace_hardirqs_off();
-		user_exit_irqoff();
 
 		return false;
 	}
@@ -74,28 +75,26 @@ static notrace __always_inline bool prep_irq_for_user_exit(void)
 	return true;
 }
 
-/*
- * restartable is true then EE/RI can be left on because interrupts are handled
- * with a restart sequence.
- */
-static notrace __always_inline bool prep_irq_for_kernel_enabled_exit(bool restartable)
+static notrace __always_inline bool prep_irq_for_user_exit(void)
 {
+	user_enter_irqoff();
 	/* This must be done with RI=1 because tracing may touch vmaps */
 	trace_hardirqs_on();
 
 #ifdef CONFIG_PPC32
 	__hard_EE_RI_disable();
 #else
-	if (exit_must_hard_disable() || !restartable)
+	if (exit_must_hard_disable())
 		__hard_EE_RI_disable();
 
 	/* This pattern matches prep_irq_for_idle */
 	if (unlikely(lazy_irq_pending_nocheck())) {
-		if (exit_must_hard_disable() || !restartable) {
+		if (exit_must_hard_disable()) {
 			local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
 			__hard_RI_enable();
 		}
 		trace_hardirqs_off();
+		user_exit_irqoff();
 
 		return false;
 	}
-- 
2.23.0

