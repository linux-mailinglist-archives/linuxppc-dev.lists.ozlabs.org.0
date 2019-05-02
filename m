Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A7D1128E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2019 07:22:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vkD424y7zDqSv
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2019 15:22:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="RwrwSph5"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vkBl4VKvzDqPR
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 May 2019 15:21:19 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id 10so557059pfo.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 May 2019 22:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CDbIdtvG1kQrUcuU/weLxKnbEgWbhwiqX9j2S/J1p2k=;
 b=RwrwSph5WzbTQK0lMLlwpgVxPapPOMk7HqSS9HUz8sz4OkHL7Ho8on+Uw54gouZFgi
 qGzU5+6tOd/ReKDUs0N5M7RF2m7aK6tTxlxcn7AKk7xqbGyqDbg0I3g7hL7OejfYUtAT
 sAWFU3BK5rQy1LBik8glbcW9RTHVXy39UnapnHYgIXk5f8r2Ana7Z5R/llieZIxvHKbf
 LTbLHX+VttfcGSvqUXAdbAv5Es8Gqpf0vmlT1G3OII0h6togmGJ4I4142U19XJLZ7cf7
 UZT+asIreOrzxwfo0wjS7FZoWC+z0J0iWAObB8+CPYu2xJFcFBvrfXyo3NB16iVjegGU
 g0/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CDbIdtvG1kQrUcuU/weLxKnbEgWbhwiqX9j2S/J1p2k=;
 b=Tzlo6UIop6QDaXFve+ikr3HIq/0l61/DQcqjdtGGu7vY084jhimYRq4WzekULlt047
 dBnmrRCvrYmy+i703daCdESnEEkaPxbgDAHQ2lNlFY+N6gA+YLfZX3BGxlfkqK9uq1Fc
 kyK3+P7AMYKnrikl1+YyxxkAdxUsJJdy+mHHOUyOMFad6iCvl1ABO8j3y1KiOz62fem4
 3/7ACQOVHgSi0G0NPnFP2v51MyPFs4g/7zRsiVYnO3udTO03N+8h9CC/kIuNMm9BYV90
 Kkqbqjxwp+Vkf7sp4vjrWc9EgFacLWnyXwZ+AW7ab+lFVxniwZlp1+RT6kH2TVwsfoXA
 h7cQ==
X-Gm-Message-State: APjAAAVQd6O6Y0gepE9XgEt0bfNk/5FaTK9kIwn5JxuOYdD8mCDJBOmR
 gby/04DqGKryl2htCYzcI8WlzmMR
X-Google-Smtp-Source: APXvYqwri3m5U4NTedd0KErm0J/lkGTtvWzctTUuUxx3SHOWvz5zIy0Vuiifv0tF/Nqbr9mYxp4bAw==
X-Received: by 2002:aa7:8b12:: with SMTP id f18mr1968755pfd.178.1556774477124; 
 Wed, 01 May 2019 22:21:17 -0700 (PDT)
Received: from bobo.local0.net ([61.68.7.233])
 by smtp.gmail.com with ESMTPSA id g13sm14577550pgr.63.2019.05.01.22.21.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 01 May 2019 22:21:16 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/64: Don't trace code that runs with the soft irq mask
 unreconciled
Date: Thu,  2 May 2019 15:21:07 +1000
Message-Id: <20190502052107.24738-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
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

"Reconciling" in terms of interrupt handling, is to bring the soft irq
mask state in to synch with the hardware, after an interrupt causes
MSR[EE] to be cleared (while the soft mask may be enabled, and hard
irqs not marked disabled).

General kernel code should not be called while unreconciled, because
local_irq_disable, etc. manipulations can cause surprising irq traces,
and it's fragile because the soft irq code does not really expect to
be called in this situation.

When exiting from an interrupt, MSR[EE] is cleared to prevent races,
but soft irq state is enabled for the returned-to context, so this is
now an unreconciled state. restore_math is called in this state, and
that can be ftraced, and the ftrace subsystem disables local irqs.

Mark restore_math and its callees as notrace. Restore a sanity check
in the soft irq code that had to be disabled for this case, by commit
4da1f79227ad4 ("powerpc/64: Disable irq restore warning for now").

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/fpu.S     |  1 +
 arch/powerpc/kernel/irq.c     | 13 +++----------
 arch/powerpc/kernel/process.c | 18 +++++++++++++++---
 arch/powerpc/kernel/vector.S  |  1 +
 4 files changed, 20 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/kernel/fpu.S b/arch/powerpc/kernel/fpu.S
index 529dcc21c3f9..cecd57e1d046 100644
--- a/arch/powerpc/kernel/fpu.S
+++ b/arch/powerpc/kernel/fpu.S
@@ -63,6 +63,7 @@ _GLOBAL(load_fp_state)
 	REST_32FPVSRS(0, R4, R3)
 	blr
 EXPORT_SYMBOL(load_fp_state)
+_ASM_NOKPROBE_SYMBOL(load_fp_state); /* used by restore_math */
 
 /*
  * Store FP state into memory, including FPSCR
diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index 8a936723c791..083934ecabb2 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -261,16 +261,9 @@ notrace void arch_local_irq_restore(unsigned long mask)
 	 */
 	irq_happened = get_irq_happened();
 	if (!irq_happened) {
-		/*
-		 * FIXME. Here we'd like to be able to do:
-		 *
-		 * #ifdef CONFIG_PPC_IRQ_SOFT_MASK_DEBUG
-		 *   WARN_ON(!(mfmsr() & MSR_EE));
-		 * #endif
-		 *
-		 * But currently it hits in a few paths, we should fix those and
-		 * enable the warning.
-		 */
+#ifdef CONFIG_PPC_IRQ_SOFT_MASK_DEBUG
+		WARN_ON(!(mfmsr() & MSR_EE));
+#endif
 		return;
 	}
 
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index f7b2e3b3db28..c4279e1a4a38 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -133,7 +133,8 @@ static int __init enable_strict_msr_control(char *str)
 }
 early_param("ppc_strict_facility_enable", enable_strict_msr_control);
 
-unsigned long msr_check_and_set(unsigned long bits)
+/* notrace because it's called by restore_math */
+unsigned long notrace msr_check_and_set(unsigned long bits)
 {
 	unsigned long oldmsr = mfmsr();
 	unsigned long newmsr;
@@ -152,7 +153,8 @@ unsigned long msr_check_and_set(unsigned long bits)
 }
 EXPORT_SYMBOL_GPL(msr_check_and_set);
 
-void __msr_check_and_clear(unsigned long bits)
+/* notrace because it's called by restore_math */
+void notrace __msr_check_and_clear(unsigned long bits)
 {
 	unsigned long oldmsr = mfmsr();
 	unsigned long newmsr;
@@ -525,7 +527,17 @@ void giveup_all(struct task_struct *tsk)
 }
 EXPORT_SYMBOL(giveup_all);
 
-void restore_math(struct pt_regs *regs)
+/*
+ * The exception exit path calls restore_math() with interrupts hard disabled
+ * but the soft irq state not "reconciled". ftrace code that calls
+ * local_irq_save/restore causes warnings.
+ *
+ * Rather than complicate the exit path, just don't trace restore_math. This
+ * could be done by having ftrace entry code check for this un-reconciled
+ * condition where MSR[EE]=0 and PACA_IRQ_HARD_DIS is not set, and
+ * temporarily fix it up for the duration of the ftrace call.
+ */
+void notrace restore_math(struct pt_regs *regs)
 {
 	unsigned long msr;
 
diff --git a/arch/powerpc/kernel/vector.S b/arch/powerpc/kernel/vector.S
index 21165da0052d..8eb867dbad5f 100644
--- a/arch/powerpc/kernel/vector.S
+++ b/arch/powerpc/kernel/vector.S
@@ -21,6 +21,7 @@ _GLOBAL(load_vr_state)
 	REST_32VRS(0,r4,r3)
 	blr
 EXPORT_SYMBOL(load_vr_state)
+_ASM_NOKPROBE_SYMBOL(load_vr_state); /* used by restore_math */
 
 /*
  * Store VMX state into memory, including VSCR.
-- 
2.20.1

