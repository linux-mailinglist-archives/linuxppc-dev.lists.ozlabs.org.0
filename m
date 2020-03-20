Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9139218D314
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 16:39:06 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48kScR6QxzzDrTY
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Mar 2020 02:39:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=nF3Rlbzb; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48kSR63fvRzDqWk
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Mar 2020 02:30:57 +1100 (AEDT)
Received: by mail-pj1-x1042.google.com with SMTP id nu11so2605590pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 08:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OhmoqL/BoUVOpmNRbw/FyFNU6on9qjyGWe9T3X2Iods=;
 b=nF3RlbzbshcVSfb6GoqZIDhlylLK97En/nLhclRfLDj6eed+wy24mJgsJerVo9QReS
 K9BhEqRJ/08/bgILlewRQg+oD9kKTpEamvKmWf4wBrdrCnNUZ1fc069S/pPBXzO/jIzj
 Z17U3DMaxVNML995gyNYBGOn04098aUskln1v6rUwQGwgMW66G0FysLUlL6LdHkUBfmj
 94JmtjAXT/aSW5ERHP5EEkUkotlVG9OtqLPQFivUQIMONitoIyQJRDseDsSY5c4mU8GI
 FFYxIjD4hqrcNqRd02jR4yPZd+ajN80PTOUjnn6sv9YiBbB7DZsw2iroPPnJaguNPWpr
 0DCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OhmoqL/BoUVOpmNRbw/FyFNU6on9qjyGWe9T3X2Iods=;
 b=BHyEsi259OprCrqCKEnR7ozHhzjcHwvVP7KEjTp9EFX1g3b4i3LFsrEJyaYg1mNJAa
 a3FdhsJT8vh/q22rQnAcqwvZymlAgzuzPQ7wgYgwrEhgX2A9E+10VruQG9MDQ3VGUOKY
 HCum5f4SXsqYsg+O6xo8w6QKvyLBP2JcK8SUSCI6hOw41YBvryk8nFWW+byqsFIEHOlm
 xKvhJBQmmjxgEgPj8gMCZ3gQIRUxtSoEP1121i4CpojD16TB9WYudVDofFzFQbmrZgda
 J77UQI24+nxZlHTd2wY+tvewe3VNtKwLl7lLS8BQCSgeOWn6SBVfJWrztHNm7q3/tNHF
 Nipg==
X-Gm-Message-State: ANhLgQ1E9h9aZ9c3r/HeGjEKAm5y0qi9zbTdD2awcZlpFkAum07Kc5Yp
 X5hhExRl7IRJobhqKe4ZPUMU4RCB
X-Google-Smtp-Source: ADFU+vskPNzrJz/yrs8U4CVqnAz5I07yD4DRX8dNx0uZhhRexYqo5AOukyu9g+skv0pHk5GbG/NAkw==
X-Received: by 2002:a17:90a:ad92:: with SMTP id
 s18mr10185502pjq.140.1584718253591; 
 Fri, 20 Mar 2020 08:30:53 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (14-202-190-183.tpgi.com.au.
 [14.202.190.183])
 by smtp.gmail.com with ESMTPSA id g11sm5836801pfm.4.2020.03.20.08.30.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2020 08:30:53 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/64: allow rtas to be called in real-mode,
 use this in machine check
Date: Sat, 21 Mar 2020 01:28:16 +1000
Message-Id: <20200320152816.1469657-1-npiggin@gmail.com>
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
Cc: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

rtas_call allocates and uses memory in failure paths, which is
not safe for RMA. It also calls local_irq_save() which may not be safe
in all real mode contexts.

Particularly machine check may run with interrupts not "reconciled",
and it may have hit while it was in tracing code that should not be
rentered.

Create minimal rtas call that should be usable by guest machine check
code, use it there to call "ibm,nmi-interlock".

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/rtas.h      |  1 +
 arch/powerpc/kernel/entry_64.S       | 12 ++++++--
 arch/powerpc/kernel/rtas.c           | 43 ++++++++++++++++++++++++++++
 arch/powerpc/platforms/pseries/ras.c |  2 +-
 4 files changed, 54 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
index 3c1887351c71..4ffc499ce1ac 100644
--- a/arch/powerpc/include/asm/rtas.h
+++ b/arch/powerpc/include/asm/rtas.h
@@ -352,6 +352,7 @@ extern struct rtas_t rtas;
 extern int rtas_token(const char *service);
 extern int rtas_service_present(const char *service);
 extern int rtas_call(int token, int, int, int *, ...);
+extern int raw_rtas_call(int token, int, int, int *, ...);
 void rtas_call_unlocked(struct rtas_args *args, int token, int nargs,
 			int nret, ...);
 extern void __noreturn rtas_restart(char *cmd);
diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
index 51c5b681f70c..309abb677788 100644
--- a/arch/powerpc/kernel/entry_64.S
+++ b/arch/powerpc/kernel/entry_64.S
@@ -759,6 +759,13 @@ _GLOBAL(enter_rtas)
 	li	r0,0
 	mtcr	r0
 
+	/* enter_rtas called from real-mode may not have irqs reconciled
+	 * but will always have interrupts disabled.
+	 */
+	mfmsr	r6
+	andi.	r7,r6,(MSR_IR|MSR_DR)
+	beq	2f
+
 #ifdef CONFIG_BUG
 	/* There is no way it is acceptable to get here with interrupts enabled,
 	 * check it with the asm equivalent of WARN_ON
@@ -769,10 +776,10 @@ _GLOBAL(enter_rtas)
 #endif
 
 	/* Hard-disable interrupts */
-	mfmsr	r6
 	rldicl	r7,r6,48,1
 	rotldi	r7,r7,16
 	mtmsrd	r7,1
+2:
 
 	/* Unfortunately, the stack pointer and the MSR are also clobbered,
 	 * so they are saved in the PACA which allows us to restore
@@ -795,7 +802,6 @@ _GLOBAL(enter_rtas)
 	ori	r9,r9,MSR_IR|MSR_DR|MSR_FE0|MSR_FE1|MSR_FP|MSR_RI|MSR_LE
 	andc	r6,r0,r9
 
-__enter_rtas:
 	sync				/* disable interrupts so SRR0/1 */
 	mtmsrd	r0			/* don't get trashed */
 
@@ -837,7 +843,7 @@ rtas_return_loc:
 	mtspr	SPRN_SRR1,r4
 	RFI_TO_KERNEL
 	b	.	/* prevent speculative execution */
-_ASM_NOKPROBE_SYMBOL(__enter_rtas)
+_ASM_NOKPROBE_SYMBOL(enter_rtas)
 _ASM_NOKPROBE_SYMBOL(rtas_return_loc)
 
 	.align	3
diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index c5fa251b8950..a058dcfb6726 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -450,6 +450,8 @@ int rtas_call(int token, int nargs, int nret, int *outputs, ...)
 	char *buff_copy = NULL;
 	int ret;
 
+	WARN_ON_ONCE((mfmsr() & (MSR_IR|MSR_DR)) != (MSR_IR|MSR_DR));
+
 	if (!rtas.entry || token == RTAS_UNKNOWN_SERVICE)
 		return -1;
 
@@ -483,6 +485,47 @@ int rtas_call(int token, int nargs, int nret, int *outputs, ...)
 }
 EXPORT_SYMBOL(rtas_call);
 
+/*
+ * Like rtas_call but no kmalloc or printk etc in error handling, so
+ * error won't go through log_error. No tracing, may be called in real mode.
+ */
+int notrace raw_rtas_call(int token, int nargs, int nret, int *outputs, ...)
+{
+	va_list list;
+	int i;
+	struct rtas_args *rtas_args;
+	int ret;
+
+	WARN_ON_ONCE((mfmsr() & MSR_EE));
+
+	if (!rtas.entry || token == RTAS_UNKNOWN_SERVICE)
+		return -1;
+
+	/*
+	 * Real mode must have MSR[EE]=0 and we prefer not to touch any
+	 * irq or preempt state (this may be called in machine check).
+	 */
+	preempt_disable_notrace();
+	arch_spin_lock(&rtas.lock);
+
+	/* We use the global rtas args buffer */
+	rtas_args = &rtas.args;
+
+	va_start(list, outputs);
+	va_rtas_call_unlocked(rtas_args, token, nargs, nret, list);
+	va_end(list);
+
+	if (nret > 1 && outputs != NULL)
+		for (i = 0; i < nret-1; ++i)
+			outputs[i] = be32_to_cpu(rtas_args->rets[i+1]);
+	ret = (nret > 0)? be32_to_cpu(rtas_args->rets[0]): 0;
+
+	arch_spin_unlock(&rtas.lock);
+	preempt_enable_notrace();
+
+	return ret;
+}
+
 /* For RTAS_BUSY (-2), delay for 1 millisecond.  For an extended busy status
  * code of 990n, perform the hinted delay of 10^n (last digit) milliseconds.
  */
diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platforms/pseries/ras.c
index c74d5e740922..e87f86f02569 100644
--- a/arch/powerpc/platforms/pseries/ras.c
+++ b/arch/powerpc/platforms/pseries/ras.c
@@ -458,7 +458,7 @@ static struct rtas_error_log *fwnmi_get_errinfo(struct pt_regs *regs)
  */
 static void fwnmi_release_errinfo(void)
 {
-	int ret = rtas_call(ibm_nmi_interlock_token, 0, 1, NULL);
+	int ret = raw_rtas_call(ibm_nmi_interlock_token, 0, 1, NULL);
 	if (ret != 0)
 		printk(KERN_ERR "FWNMI: nmi-interlock failed: %d\n", ret);
 }
-- 
2.23.0

