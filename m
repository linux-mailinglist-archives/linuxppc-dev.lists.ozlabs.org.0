Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACA21098F1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 06:44:21 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47MXsG2FX3zDqgX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 16:44:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="O056qh9L"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47MXNV34YfzDqc8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Nov 2019 16:22:50 +1100 (AEDT)
Received: by mail-pl1-x642.google.com with SMTP id az9so7568019plb.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Nov 2019 21:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OO+dvVBEt/5Fe71GNmz7N6djxChkGxAE90CLhvwJfHc=;
 b=O056qh9LfAZ6Rtd2FmZmtv+4MnI8LtYjqq1Rvzg6fOODCiujug0w8LVb9cC/9CpT7D
 b8B97UlxfXUcoj2v9umLHufeb4X2tyWN0IRytt1zK+oJuo2BTAXGyodFH1fvVuqewyKF
 Lm2Upwk5TxsNNO3nv+kiYF6D9l5u19IwI1tllcOGVjBbEpDNMqp6p3XzWObTlL2+7qaJ
 xwgalvDfYFAeNmRJHJRhyQ/XGW5KhZB8NhZXd0nVPjwdiN5m5ZFo9DTtKSDmYNtPD+2g
 iMmTaJW5NM5q+ghKDAb39fqaq1YTwy0kwNCz7FkINfLqKupUKuL8C78N2ARKt2LUTo3U
 G7Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OO+dvVBEt/5Fe71GNmz7N6djxChkGxAE90CLhvwJfHc=;
 b=Rvdlps8yIxbhI0AzOeg19AjgqOzfejKO85Tj6e0U86HnmzQed6YaPBl7qqMQo8I0cL
 0EZ9+UpaadBT4M9Cj+VDciiSaZ1g3vQJwBNR7RGcokp1Yp2djVKCzQ37dGCpzSi+SNNx
 IMWA7Xs/wqqIPPDzG1ztQ0rBa5uBQrd2Tf5hGC5Jpxv7KXCfUkvHLX99ko2UTNnv1qwG
 iI/L8Eo7P0EqnBBu27fUwdnOJKYjjdyNG3nI8TSVQ3wGXPauddaKxw2usUil3sEbqE5+
 UJ+hCCpP8RQoUUv53IiynqwuDv0yeBA+u4zjpamRWKJiTW6SxTPlHeKgWR0qjEy8KMEx
 w5Ew==
X-Gm-Message-State: APjAAAVsyDMtIYhR5tainIMaq8jr4sNZK/SKe8yi9T+q7AUscBycmSfY
 RPdmbMuA3aVLipZzVGXO1h6oHpVN
X-Google-Smtp-Source: APXvYqwyd2D4W8m8xtA2muM3KNn2ZAEJWhoNvwv65gaur+OlxfqADs8CgjIxTzAWYArjU7kgPFz7Bg==
X-Received: by 2002:a17:902:8502:: with SMTP id
 bj2mr32984952plb.303.1574745768101; 
 Mon, 25 Nov 2019 21:22:48 -0800 (PST)
Received: from sol.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id t27sm10657920pfq.169.2019.11.25.21.22.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2019 21:22:47 -0800 (PST)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 10/18] powerpc: Support prefixed instructions in alignment
 handler
Date: Tue, 26 Nov 2019 16:21:33 +1100
Message-Id: <20191126052141.28009-11-jniethe5@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191126052141.28009-1-jniethe5@gmail.com>
References: <20191126052141.28009-1-jniethe5@gmail.com>
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
Cc: alistair@popple.id.au, Jordan Niethe <jniethe5@gmail.com>
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
 arch/powerpc/kernel/align.c |  8 +++++---
 arch/powerpc/kernel/traps.c | 17 ++++++++++++++++-
 2 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/align.c b/arch/powerpc/kernel/align.c
index 245e79792a01..53493404c25c 100644
--- a/arch/powerpc/kernel/align.c
+++ b/arch/powerpc/kernel/align.c
@@ -293,7 +293,7 @@ static int emulate_spe(struct pt_regs *regs, unsigned int reg,
 
 int fix_alignment(struct pt_regs *regs)
 {
-	unsigned int instr;
+	unsigned int instr, sufx;
 	struct instruction_op op;
 	int r, type;
 
@@ -303,13 +303,15 @@ int fix_alignment(struct pt_regs *regs)
 	 */
 	CHECK_FULL_REGS(regs);
 
-	if (unlikely(__get_user(instr, (unsigned int __user *)regs->nip)))
+	if (unlikely(__get_user_instr(instr, sufx,
+				 (unsigned int __user *)regs->nip)))
 		return -EFAULT;
 	if ((regs->msr & MSR_LE) != (MSR_KERNEL & MSR_LE)) {
 		/* We don't handle PPC little-endian any more... */
 		if (cpu_has_feature(CPU_FTR_PPC_LE))
 			return -EIO;
 		instr = swab32(instr);
+		sufx = swab32(sufx);
 	}
 
 #ifdef CONFIG_SPE
@@ -334,7 +336,7 @@ int fix_alignment(struct pt_regs *regs)
 	if ((instr & 0xfc0006fe) == (PPC_INST_COPY & 0xfc0006fe))
 		return -EIO;
 
-	r = analyse_instr(&op, regs, instr, 0);
+	r = analyse_instr(&op, regs, instr, sufx);
 	if (r < 0)
 		return -EINVAL;
 
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index 014ff0701f24..8e262222f464 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -583,6 +583,8 @@ static inline int check_io_access(struct pt_regs *regs)
 #define REASON_ILLEGAL		(ESR_PIL | ESR_PUO)
 #define REASON_PRIVILEGED	ESR_PPR
 #define REASON_TRAP		ESR_PTR
+#define REASON_PREFIXED		0
+#define REASON_BOUNDARY		0
 
 /* single-step stuff */
 #define single_stepping(regs)	(current->thread.debug.dbcr0 & DBCR0_IC)
@@ -597,6 +599,8 @@ static inline int check_io_access(struct pt_regs *regs)
 #define REASON_ILLEGAL		SRR1_PROGILL
 #define REASON_PRIVILEGED	SRR1_PROGPRIV
 #define REASON_TRAP		SRR1_PROGTRAP
+#define REASON_PREFIXED		SRR1_PREFIXED
+#define REASON_BOUNDARY		SRR1_BOUNDARY
 
 #define single_stepping(regs)	((regs)->msr & MSR_SE)
 #define clear_single_step(regs)	((regs)->msr &= ~MSR_SE)
@@ -1593,11 +1597,20 @@ void alignment_exception(struct pt_regs *regs)
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
 
@@ -1606,7 +1619,8 @@ void alignment_exception(struct pt_regs *regs)
 		fixed = fix_alignment(regs);
 
 	if (fixed == 1) {
-		regs->nip += 4;	/* skip over emulated instruction */
+		/* skip over emulated instruction */
+		regs->nip += (reason & REASON_PREFIXED) ? 8 : 4;
 		emulate_single_step(regs);
 		goto bail;
 	}
@@ -1619,6 +1633,7 @@ void alignment_exception(struct pt_regs *regs)
 		sig = SIGBUS;
 		code = BUS_ADRALN;
 	}
+bad:
 	if (user_mode(regs))
 		_exception(sig, regs, code, regs->dar);
 	else
-- 
2.20.1

