Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C888EE038C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Oct 2019 14:00:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46yBsL0g3czDqMl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Oct 2019 23:00:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Q9TzElre"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46yBpc73twzDqKT
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Oct 2019 22:57:58 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id p1so9820140pgi.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Oct 2019 04:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D0rJNiMucmje9ySL+8GwfdJbCi0znN4tp5AEOTct5ek=;
 b=Q9TzElreCGBjFtmMIvyX+l8Zg7cwI5RQ42FXfyjarsoL/0K911fj8x9LG+hJ8QVKnp
 CQ6ri+INGBJLUcCPKnuR+rLgmoKB1GyzB2L2in1h89Y1D1JO7g6pyFsr0TZgBAGyGB8l
 pl3mnvXGXeDM7sAgCG2Hh9o1pv9GHSRDc9M/QQQXhMuu8f0Goosq9YJOqvvohqCx2HVh
 QX3uxSVZsTseMh3D5j6SIZzRKJCnnc+JTJqcdFom1l3FDJd485TEE5lOASufNXoE5T4F
 XSae8h+5CnV2AeeOsi9L6cVsVzPYGmfsW1D5noQLbz1SbylgNXBRnzKyv48CEkwrF9Dx
 Njng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D0rJNiMucmje9ySL+8GwfdJbCi0znN4tp5AEOTct5ek=;
 b=MVAQhtQh1ViRprBjO7p+AjNdVUi6ZhPXJgNo/A/8ja7dX4tbIJVazkOt4J8S7d6sPr
 bm7TlKbr6IVlQV9enTzvV8ifq+yRDFWG/aOeqVqWexmWSVD4QOmLT7XTwxhyxqA6moQO
 MZt/Nr60z65nIpJLaPcw3P2AT1suGLb7wx3wV+YJIAxz1ZMVP8b9tA5qIv8LE1QVVjBI
 N1sjYjb1C8HM/YdMklIX1q5DIyBAiSWTQrSLAqaAOj700WfjeUa+yJXQSpFZCwSL6phv
 mi+WaLNPv0VXMM8Ike5w8rbaflVkkvRYMZxqQbww582fe9aMSrO9ZA/yg8ieIWGVpeVx
 A/uQ==
X-Gm-Message-State: APjAAAVuDrejK0qSnzYv5ZNaixfYAO6yr+6+5yHP9YSKwaCXXBPs1OZE
 sKviLezUeWvusZsbk5vSzKAdnjY+
X-Google-Smtp-Source: APXvYqwsoYmv8CZfbd18TcOc3GN5grH1lOG4gKl/wG9+3t7tGEOSWYAIv8/fyq/t9Pxa/vPlIo5yNw==
X-Received: by 2002:a63:cd18:: with SMTP id i24mr3500513pgg.333.1571745474511; 
 Tue, 22 Oct 2019 04:57:54 -0700 (PDT)
Received: from bobo.local0.net (193-116-72-81.tpgi.com.au. [193.116.72.81])
 by smtp.gmail.com with ESMTPSA id o42sm19394556pjo.32.2019.10.22.04.57.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2019 04:57:53 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/powernv: Fix CPU idle to be called with IRQs disabled
Date: Tue, 22 Oct 2019 21:58:14 +1000
Message-Id: <20191022115814.22456-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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
Cc: Paul Mackerras <paulus@samba.org>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit e78a7614f3876 ("idle: Prevent late-arriving interrupts from
disrupting offline") changes arch_cpu_idle_dead to be called with
interrupts disabled, which triggers the WARN in pnv_smp_cpu_kill_self.

Fix this by fixing up irq_happened after hard disabling, rather than
requiring there are no pending interrupts, similarly to what was done
done until commit 2525db04d1cc5 ("powerpc/powernv: Simplify lazy IRQ
handling in CPU offline").

Fixes: e78a7614f3876 ("idle: Prevent late-arriving interrupts from disrupting offline")
Reported-by: Paul Mackerras <paulus@samba.org>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/platforms/powernv/smp.c | 50 +++++++++++++++++++---------
 1 file changed, 35 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/smp.c b/arch/powerpc/platforms/powernv/smp.c
index fbd6e6b7bbf2..241cfee744d9 100644
--- a/arch/powerpc/platforms/powernv/smp.c
+++ b/arch/powerpc/platforms/powernv/smp.c
@@ -146,6 +146,18 @@ static int pnv_smp_cpu_disable(void)
 	return 0;
 }
 
+static void pnv_flush_interrupts(void)
+{
+	if (cpu_has_feature(CPU_FTR_ARCH_300)) {
+		if (xive_enabled())
+			xive_flush_interrupt();
+		else
+			icp_opal_flush_interrupt();
+	} else {
+		icp_native_flush_interrupt();
+	}
+}
+
 static void pnv_smp_cpu_kill_self(void)
 {
 	unsigned int cpu;
@@ -153,13 +165,6 @@ static void pnv_smp_cpu_kill_self(void)
 	u64 lpcr_val;
 
 	/* Standard hot unplug procedure */
-	/*
-	 * This hard disables local interurpts, ensuring we have no lazy
-	 * irqs pending.
-	 */
-	WARN_ON(irqs_disabled());
-	hard_irq_disable();
-	WARN_ON(lazy_irq_pending());
 
 	idle_task_exit();
 	current->active_mm = NULL; /* for sanity */
@@ -172,6 +177,26 @@ static void pnv_smp_cpu_kill_self(void)
 	if (cpu_has_feature(CPU_FTR_ARCH_207S))
 		wmask = SRR1_WAKEMASK_P8;
 
+	/*
+	 * This turns the irq soft-disabled state we're called with, into a
+	 * hard-disabled state with pending irq_happened interrupts cleared.
+	 *
+	 * PACA_IRQ_DEC   - Decrementer should be ignored.
+	 * PACA_IRQ_HMI   - Can be ignored, processing is done in real mode.
+	 * PACA_IRQ_DBELL, EE, PMI - Unexpected.
+	 */
+	hard_irq_disable();
+	if (generic_check_cpu_restart(cpu))
+		goto out;
+	if (local_paca->irq_happened &
+			(PACA_IRQ_DBELL | PACA_IRQ_EE | PACA_IRQ_PMI)) {
+		if (local_paca->irq_happened & PACA_IRQ_EE)
+			pnv_flush_interrupts();
+		DBG("CPU%d Unexpected exit while offline irq_happened=%lx!\n",
+				cpu, local_paca->irq_happened);
+	}
+	local_paca->irq_happened = PACA_IRQ_HARD_DIS;
+
 	/*
 	 * We don't want to take decrementer interrupts while we are
 	 * offline, so clear LPCR:PECE1. We keep PECE2 (and
@@ -197,6 +222,7 @@ static void pnv_smp_cpu_kill_self(void)
 
 		srr1 = pnv_cpu_offline(cpu);
 
+		WARN_ON(!irqs_disabled());
 		WARN_ON(lazy_irq_pending());
 
 		/*
@@ -212,13 +238,7 @@ static void pnv_smp_cpu_kill_self(void)
 		 */
 		if (((srr1 & wmask) == SRR1_WAKEEE) ||
 		    ((srr1 & wmask) == SRR1_WAKEHVI)) {
-			if (cpu_has_feature(CPU_FTR_ARCH_300)) {
-				if (xive_enabled())
-					xive_flush_interrupt();
-				else
-					icp_opal_flush_interrupt();
-			} else
-				icp_native_flush_interrupt();
+			pnv_flush_interrupts();
 		} else if ((srr1 & wmask) == SRR1_WAKEHDBELL) {
 			unsigned long msg = PPC_DBELL_TYPE(PPC_DBELL_SERVER);
 			asm volatile(PPC_MSGCLR(%0) : : "r" (msg));
@@ -266,7 +286,7 @@ static void pnv_smp_cpu_kill_self(void)
 	 */
 	lpcr_val = mfspr(SPRN_LPCR) | (u64)LPCR_PECE1;
 	pnv_program_cpu_hotplug_lpcr(cpu, lpcr_val);
-
+out:
 	DBG("CPU%d coming online...\n", cpu);
 }
 
-- 
2.23.0

