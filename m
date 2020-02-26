Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8F116F669
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 05:23:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48S2jT02PxzDqR3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 15:23:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=JwygzaF8; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48S2NH11kPzDqQy
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 15:08:30 +1100 (AEDT)
Received: by mail-pf1-x442.google.com with SMTP id b185so736447pfb.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 20:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=3iWSuSLFsYl5iS1EOAnn1n0Q/mJaw2inqqhBv1PrO2o=;
 b=JwygzaF8mfn3HSW1QKXGmop/Fg4taVot7tNhVTUSywJVK2YrKjWr2/YjkLVp1Lqa81
 QUm8jnrcX33kdYCTMjOZOvpBz6nYQXuL+ziX9cqINOeCiOlNDAWZLnOGerpjQd4QaM2p
 FGdo0QBFDDTM1f199RSsZ38362h9OEalTHXZY5pc2TFPTALvJ5UirHY2sib/A6nXliwe
 ZOmpcxXU/tjJT8P8zb0Opt4Me9Qznj2VKcpwJBIu4L0CQ3mISPpmTKPf5LDJVWuxoJLS
 9k4I020UPFnfmEn4TTgr7YiuvXPV6ZPfw7/dDu4U4ImDSbQ0NHi86N8knVLQFHOWfovy
 e5iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=3iWSuSLFsYl5iS1EOAnn1n0Q/mJaw2inqqhBv1PrO2o=;
 b=PyU0UX6jgOoTGgg/yv34ai8xaEfoRkeAd/R3apDI0dfMuGU8UnLsBfuTM2cxhBr5Fg
 BJp1LSCHQQjMoxde47sEMw6QDnkZmjQPUman71HXP3KrIJC9KPUH/A6RCI45v+N16PJ3
 6eyish4LzB3SinGeA/iUZZAmnKsVTS3qZHPzvQ9Qxj/TGhad+Om0EsbUEuDida80DBc9
 BeiCTyI1C29p6rFDoKDLPocSlrNFe/+ep1+0/3e6fWJIusmyRB9VLLSPJrmiH5XCDwY+
 c+fNqtG+Fmisye9D3+ij/nqyLx3PFUcqrh83M1PdCKLMvEioJEwMnic6dKl9lnemQ3Xj
 JW/w==
X-Gm-Message-State: APjAAAVLiv9kQP4YFE2thgU6fxeTzSppqs6owFG+0quQQPh8zKC1XRIZ
 GyWCJkylQG+hvVNr/No6stM5Hs6isKg=
X-Google-Smtp-Source: APXvYqzVPn+UkzkWjb3cwr5LIdLg2c/KyBgC0VVQ3IZMlC/l071mHQrMBWLso51KJ1et9kTihpzgnQ==
X-Received: by 2002:a62:5bc3:: with SMTP id p186mr2305307pfb.162.1582690108278; 
 Tue, 25 Feb 2020 20:08:28 -0800 (PST)
Received: from tee480.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id d4sm604681pjg.19.2020.02.25.20.08.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 20:08:27 -0800 (PST)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 06/14] powerpc: Support prefixed instructions in alignment
 handler
Date: Wed, 26 Feb 2020 15:07:08 +1100
Message-Id: <20200226040716.32395-7-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200226040716.32395-1-jniethe5@gmail.com>
References: <20200226040716.32395-1-jniethe5@gmail.com>
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
Cc: alistair@popple.id.au, bala24@linux.ibm.com,
 Jordan Niethe <jniethe5@gmail.com>, dja@axtens.net
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
v3: Move __get_user_{instr(), instr_inatomic()} up with the other
get_user definitions and remove nested if.
---
 arch/powerpc/include/asm/uaccess.h | 25 +++++++++++++++++++++++++
 arch/powerpc/kernel/align.c        |  8 +++++---
 arch/powerpc/kernel/traps.c        | 21 ++++++++++++++++++++-
 3 files changed, 50 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index 2f500debae21..8903a96cbb4b 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -105,6 +105,31 @@ static inline int __access_ok(unsigned long addr, unsigned long size,
 #define __put_user_inatomic(x, ptr) \
 	__put_user_nosleep((__typeof__(*(ptr)))(x), (ptr), sizeof(*(ptr)))
 
+/*
+ * When reading an instruction iff it is a prefix, the suffix needs to be also
+ * loaded.
+ */
+#define __get_user_instr(x, y, ptr)			\
+({							\
+	long __gui_ret = 0;				\
+	y = 0;						\
+	__gui_ret = __get_user(x, ptr);			\
+	if (!__gui_ret && IS_PREFIX(x))			\
+		__gui_ret = __get_user(y, ptr + 1);	\
+	__gui_ret;					\
+})
+
+#define __get_user_instr_inatomic(x, y, ptr)		\
+({							\
+	long __gui_ret = 0;				\
+	y = 0;						\
+	__gui_ret = __get_user_inatomic(x, ptr);	\
+	if (!__gui_ret && IS_PREFIX(x))			\
+		__gui_ret = __get_user_inatomic(y, ptr + 1);	\
+	__gui_ret;					\
+})
+
+
 extern long __put_user_bad(void);
 
 /*
diff --git a/arch/powerpc/kernel/align.c b/arch/powerpc/kernel/align.c
index ba3bf5c3ab62..4984cf681215 100644
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
+				      (unsigned int __user *)regs->nip)))
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

