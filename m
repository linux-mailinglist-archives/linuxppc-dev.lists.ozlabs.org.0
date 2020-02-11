Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F911589C4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Feb 2020 06:48:57 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48GsK14LpQzDqMN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Feb 2020 16:48:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=WRyyh5OI; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Gs2432mGzDqKN
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Feb 2020 16:35:56 +1100 (AEDT)
Received: by mail-pf1-x444.google.com with SMTP id 2so4885655pfg.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Feb 2020 21:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=PJeruCGvBMmdGetAXO8kTJubVnU33dpbMfJxBYFkvLw=;
 b=WRyyh5OIAlC0Q+tsyatAFK1qqTa+ajTN4PjjgAXC1EZ9aeI4H0LBRakMn8nHI8J/MB
 OqThAbH3ZNq5c6BJE5AlCIObTQWYcx7wFFXJjkYzlJl7enffLKNyorU89zCoYgyJ1ch4
 WlSiFGxcb4zYrHyK5REYwsq6z4r0NnQR3S1VuB4set+9pKj5AGTqiuhdP/R/opPyDcEh
 Gl2WE3AXzTxJyZo4k5jNlWP/zXbQ4yiRZ2b4EQY2LNVnzyuNsB1QrrFb6d8d34nXVyGP
 uRcm4k21ocm4LKxawt1fVoWxdCm784dvm8St2C6emKJXXxBioPsusGvE25ywCmrnhn5q
 L0mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=PJeruCGvBMmdGetAXO8kTJubVnU33dpbMfJxBYFkvLw=;
 b=syEfg5wd2P14GizPUVOHLP6jxUTulmljbx/4cXG7tEzdrsirkCuUhNe+r7rtxpVfaa
 5vsiPzA4kTytDkzFQUA1LcsrWtYNLYuHdbzAXFKV5PC+JGAKeX3P41zdVVZufwBxfTUf
 9/0bLV3uAaJQtIgkEoyusElQUyPZFM/VHPFmfRMQL4gjuHgqvftSNQUXQwJhI4CIoqBD
 IltUq2HwJ5EmeS0QwbJTnnlGBUWQWp0lZk1+vAwmL0OJOTn1QoaCoN4akh7XkvizpQzA
 cSFcn979NU6YCnFC3uqPnxLLN0N2jvNwko1qQai0uhKt3y2DxHat4nd6AiHq6k+680h/
 q8rQ==
X-Gm-Message-State: APjAAAX48VezHduyKlngd/YbcTLjgumHtRvzWd4y/OAnHWVdtnHnDU1U
 HwOXDZPueyPMku5Un3IsJMdb0Ic19f4/2Q==
X-Google-Smtp-Source: APXvYqwqnVKB586hGBjxR0ZBq0JKAEMmPOQ4t7lrAB9q62BTu81C4hssb7RDMLaYsK3o//S8apZEWQ==
X-Received: by 2002:a63:34b:: with SMTP id 72mr5026653pgd.278.1581399352394;
 Mon, 10 Feb 2020 21:35:52 -0800 (PST)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id a19sm1189025pju.11.2020.02.10.21.35.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2020 21:35:52 -0800 (PST)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 06/13] powerpc: Support prefixed instructions in alignment
 handler
Date: Tue, 11 Feb 2020 16:33:48 +1100
Message-Id: <20200211053355.21574-7-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200211053355.21574-1-jniethe5@gmail.com>
References: <20200211053355.21574-1-jniethe5@gmail.com>
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
Cc: alistair@popple.id.au, mpe@ellerman.id.a,
 Jordan Niethe <jniethe5@gmail.com>, dja@axtens.net, bala24@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Alignment interrupts can be caused by prefixed instructions accessing
memory. In the alignment handler the instruction that caused the
exception is loaded and attempted emulate. If the instruction is a
prefixed instruction load the prefix and suffix to emulate. After
emulating increment the NIP by 8.

Prefixed instructions are not permitted to cross 64-byte boundaries. If
they do the alignment interrupt is invoked with SRR1 BOUNDARY bit set.
If this occurs send a SIGBUS to the offending process if in user mode.
If in kernel mode call bad_page_fault().

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v2: - Move __get_user_instr() and __get_user_instr_inatomic() to this
commit (previously in "powerpc sstep: Prepare to support prefixed
instructions").
    - Rename sufx to suffix
    - Use a macro for calculating instruction length
---
 arch/powerpc/include/asm/uaccess.h | 30 ++++++++++++++++++++++++++++++
 arch/powerpc/kernel/align.c        |  8 +++++---
 arch/powerpc/kernel/traps.c        | 21 ++++++++++++++++++++-
 3 files changed, 55 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index 2f500debae21..30f63a81c8d8 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -474,4 +474,34 @@ static __must_check inline bool user_access_begin(const void __user *ptr, size_t
 #define unsafe_copy_to_user(d, s, l, e) \
 	unsafe_op_wrap(raw_copy_to_user_allowed(d, s, l), e)
 
+/*
+ * When reading an instruction iff it is a prefix, the suffix needs to be also
+ * loaded.
+ */
+#define __get_user_instr(x, y, ptr)			\
+({							\
+	long __gui_ret = 0;				\
+	y = 0;						\
+	__gui_ret = __get_user(x, ptr);			\
+	if (!__gui_ret) {				\
+		if (IS_PREFIX(x))			\
+			__gui_ret = __get_user(y, ptr + 1);	\
+	}						\
+							\
+	__gui_ret;					\
+})
+
+#define __get_user_instr_inatomic(x, y, ptr)		\
+({							\
+	long __gui_ret = 0;				\
+	y = 0;						\
+	__gui_ret = __get_user_inatomic(x, ptr);	\
+	if (!__gui_ret) {				\
+		if (IS_PREFIX(x))			\
+			__gui_ret = __get_user_inatomic(y, ptr + 1);	\
+	}						\
+							\
+	__gui_ret;					\
+})
+
 #endif	/* _ARCH_POWERPC_UACCESS_H */
diff --git a/arch/powerpc/kernel/align.c b/arch/powerpc/kernel/align.c
index ba3bf5c3ab62..e42cfaa616d3 100644
--- a/arch/powerpc/kernel/align.c
+++ b/arch/powerpc/kernel/align.c
@@ -293,7 +293,7 @@ static int emulate_spe(struct pt_regs *regs, unsigned int reg,
 
 int fix_alignment(struct pt_regs *regs)
 {
-	unsigned int instr;
+	unsigned int instr, suffix;
 	struct instruction_op op;
 	int r, type;
 
@@ -303,13 +303,15 @@ int fix_alignment(struct pt_regs *regs)
 	 */
 	CHECK_FULL_REGS(regs);
 
-	if (unlikely(__get_user(instr, (unsigned int __user *)regs->nip)))
+	if (unlikely(__get_user_instr(instr, suffix,
+				 (unsigned int __user *)regs->nip)))
 		return -EFAULT;
 	if ((regs->msr & MSR_LE) != (MSR_KERNEL & MSR_LE)) {
 		/* We don't handle PPC little-endian any more... */
 		if (cpu_has_feature(CPU_FTR_PPC_LE))
 			return -EIO;
 		instr = swab32(instr);
+		suffix = swab32(suffix);
 	}
 
 #ifdef CONFIG_SPE
@@ -334,7 +336,7 @@ int fix_alignment(struct pt_regs *regs)
 	if ((instr & 0xfc0006fe) == (PPC_INST_COPY & 0xfc0006fe))
 		return -EIO;
 
-	r = analyse_instr(&op, regs, instr, PPC_NO_SUFFIX);
+	r = analyse_instr(&op, regs, instr, suffix);
 	if (r < 0)
 		return -EINVAL;
 
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index 82a3438300fd..d80b82fc1ae3 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -583,6 +583,10 @@ static inline int check_io_access(struct pt_regs *regs)
 #define REASON_ILLEGAL		(ESR_PIL | ESR_PUO)
 #define REASON_PRIVILEGED	ESR_PPR
 #define REASON_TRAP		ESR_PTR
+#define REASON_PREFIXED		0
+#define REASON_BOUNDARY		0
+
+#define inst_length(reason)	4
 
 /* single-step stuff */
 #define single_stepping(regs)	(current->thread.debug.dbcr0 & DBCR0_IC)
@@ -597,6 +601,10 @@ static inline int check_io_access(struct pt_regs *regs)
 #define REASON_ILLEGAL		SRR1_PROGILL
 #define REASON_PRIVILEGED	SRR1_PROGPRIV
 #define REASON_TRAP		SRR1_PROGTRAP
+#define REASON_PREFIXED		SRR1_PREFIXED
+#define REASON_BOUNDARY		SRR1_BOUNDARY
+
+#define inst_length(reason)	(((reason) & REASON_PREFIXED) ? 8 : 4)
 
 #define single_stepping(regs)	((regs)->msr & MSR_SE)
 #define clear_single_step(regs)	((regs)->msr &= ~MSR_SE)
@@ -1593,11 +1601,20 @@ void alignment_exception(struct pt_regs *regs)
 {
 	enum ctx_state prev_state = exception_enter();
 	int sig, code, fixed = 0;
+	unsigned long  reason;
 
 	/* We restore the interrupt state now */
 	if (!arch_irq_disabled_regs(regs))
 		local_irq_enable();
 
+	reason = get_reason(regs);
+
+	if (reason & REASON_BOUNDARY) {
+		sig = SIGBUS;
+		code = BUS_ADRALN;
+		goto bad;
+	}
+
 	if (tm_abort_check(regs, TM_CAUSE_ALIGNMENT | TM_CAUSE_PERSISTENT))
 		goto bail;
 
@@ -1606,7 +1623,8 @@ void alignment_exception(struct pt_regs *regs)
 		fixed = fix_alignment(regs);
 
 	if (fixed == 1) {
-		regs->nip += 4;	/* skip over emulated instruction */
+		/* skip over emulated instruction */
+		regs->nip += inst_length(reason);
 		emulate_single_step(regs);
 		goto bail;
 	}
@@ -1619,6 +1637,7 @@ void alignment_exception(struct pt_regs *regs)
 		sig = SIGBUS;
 		code = BUS_ADRALN;
 	}
+bad:
 	if (user_mode(regs))
 		_exception(sig, regs, code, regs->dar);
 	else
-- 
2.17.1

