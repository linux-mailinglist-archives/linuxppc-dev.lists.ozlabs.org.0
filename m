Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E1A18C72C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 06:43:26 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48kCP72ZGhzDrDm
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 16:43:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=LNNKW5Fw; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48kBsn0nvTzDrVL
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 16:19:41 +1100 (AEDT)
Received: by mail-pl1-x642.google.com with SMTP id f16so2025425plj.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 22:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=rwpdKuT9qWHTuGfbbXHwN1t+fqx2VFbWGReeY56xnts=;
 b=LNNKW5FwXakViJy8D4H3B5sjEaBKOc4llw3TbixXvwj/vVSUgfoSclJPkhpEYvKZCC
 gRLzE2BkWI9YlvDxuo6oM05mK1Ga/RRUiXBWDZB3yVj7taUCQ/HXVbkGGlzwH5xKdm87
 IMKGX8o1PkveGbqrqa4K7e/l89tyq+0bXgCAdjSBMp9ii/+lqi8Vr/9FGOBOCjosMXuQ
 HnuAsZmxdo+PZgA/fh0oA5TrN2LgKu2U3hDd49RYUrrfHh28ln3Yht5qCLRHfOFGivHz
 uB3t7kxwoK+H0L2oUR18tGC+t5h7KQbVKA/0mkKOX5sJqoxEM7spANqs133FIA95uu+4
 WdBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=rwpdKuT9qWHTuGfbbXHwN1t+fqx2VFbWGReeY56xnts=;
 b=HTAN7URD/BbCw+oNeHY+uIc2tWXcUY3Bf7x6ixOPS8DsChbVxlyazNoyIfv3gAzj6Q
 Jr3TEZhZRhylnGYZRyJm/hnnCLSALUCklQvigoxkX61TDyCcPY6vn1DDv9++5X/jLTqD
 2BPOp7KQv1uv4Hon8w/H2w88jl3LN/mCZ9GDIuL14wu3Ggp1UzOwA7hAwtkNepACkdv+
 3ZU4vCItcerzFVteySX5ZehNA5y+OkmzNpIQD4gW6QIxbmjPJLMRc2VhkWWmetc1YTfR
 k2DBQnJ71bo+LSOqlCFiwXUlOuWcDRHnt05KIODxpRXgv41+ibCY+1JNVYoXtGFyKV5m
 cNxg==
X-Gm-Message-State: ANhLgQ2kc1IA3SXrKVJpZ37cf9N0P78BIx/OBWPDAZxuN50KywH0OOBy
 RC/DcM/CLLB4RGmff50dSdZcjdno57U=
X-Google-Smtp-Source: ADFU+vuPqz365PGhrakGSD50bLdcNg3GLIEw7Qe1y9kS6VG5IuRvLlZkvouGZFI7RzKhSQjOuxrTqA==
X-Received: by 2002:a17:90a:bd01:: with SMTP id
 y1mr7836154pjr.129.1584681578896; 
 Thu, 19 Mar 2020 22:19:38 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id c207sm3988716pfb.47.2020.03.19.22.19.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2020 22:19:38 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 13/16] powerpc: Support prefixed instructions in alignment
 handler
Date: Fri, 20 Mar 2020 16:18:06 +1100
Message-Id: <20200320051809.24332-14-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200320051809.24332-1-jniethe5@gmail.com>
References: <20200320051809.24332-1-jniethe5@gmail.com>
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
Cc: alistair@popple.id.au, npiggin@gmail.com, bala24@linux.ibm.com,
 Jordan Niethe <jniethe5@gmail.com>, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Alignment interrupts can be caused by prefixed instructions accessing
memory. Prefixed instructions are not permitted to cross 64-byte
boundaries. If they do the alignment interrupt is invoked with SRR1
BOUNDARY bit set.  If this occurs send a SIGBUS to the offending process
if in user mode.  If in kernel mode call bad_page_fault().

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v2: - Move __get_user_instr() and __get_user_instr_inatomic() to this
commit (previously in "powerpc sstep: Prepare to support prefixed
instructions").
    - Rename sufx to suffix
    - Use a macro for calculating instruction length
v3: Move __get_user_{instr(), instr_inatomic()} up with the other
get_user definitions and remove nested if.
v4: Just do the things for alignment_exception(). Other changes handled
elsewhere.
---
 arch/powerpc/kernel/traps.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index a4764b039749..cd8b3043c268 100644
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

