Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 356B01C66FC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 06:35:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49H3ff4G9jzDrRG
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 14:35:06 +1000 (AEST)
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
 header.s=20161025 header.b=fmU+VSLV; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49H2dy1h3RzDqsR
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 May 2020 13:49:26 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id u22so1710545plq.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 May 2020 20:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=npUo2Uipm8Z0JuRVgk3AOFAwNBAMmQv8RHkcELSZdE0=;
 b=fmU+VSLVWy6HvOVUzL/UnKeP0kIbe6KNom5s05TODO8yKflFgcQ9M3tAwfcQqg1B9N
 SGIzp3CxXR+cltDdBNIGMSo08R0uj4Gb9QzRhIG580yQ6vsgdeQbgfnEKOPOxf/smrtn
 N3cGDaCl5XVsz+tyQwfT2SZbjW9isOMxZ/gGPGukGDoXuEZgXgVlZwYMrELbaTSwarT9
 r+3gfHu9AuO/ipqVC9X+cSX795KAy67uoPzU1c6NhxkfH/cZPhzVi4WJNPtFzjxJF5Fn
 4oBB1GY2RYAsZWmoNJ5iSnyVKnR9FMDfGM8EJahxgcei/VNTDYuk3Rs45kd5rU4kXsjz
 iXpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=npUo2Uipm8Z0JuRVgk3AOFAwNBAMmQv8RHkcELSZdE0=;
 b=bcQ/FOzMd9Sg/od/qcqBUlxnWS/qsmsIiXv8oLFifFuVqhUKfG1svnVBLxduX9OguM
 4qNYG8mWu/9NfNmRe+nlp78GptNKQ678r2pikNTAkvC+QfJIka79nEsVzba1wVyhuWqb
 WffsgYRvTTRbjRGskGZ2NPweZBs1ryospZx4kiHcsIyL7xMwqinrsSuzLki1dhibV05L
 snACQ+8VqXN4BGCKHZA5oBAnpMsGKLWBPRv+EzV1kvGSOduNh5rfdvhCdVBcXrhgTP6d
 slUQmDVcEejdyJV7jKRfc0A/ZVgITjd6pf0nEPWBMPUFhNUkeP8nHwbPDfL7/eD1SwMU
 LoJw==
X-Gm-Message-State: AGi0PuZyfa7dXU42DSFyJFYzuuDcBy0o9Byl4+hmTpsOLs9zKJmvaHZ0
 V4D8VazPt/XxnrzdyXU7TbmKYauZiLQ7Fw==
X-Google-Smtp-Source: APiQypIbL8q31mZK6bj4DJYujD+D4m4z+UutUvQIv+dLqO/BeMy/JPvXO+KszB112QJNjB6LX/e+nw==
X-Received: by 2002:a17:902:70c6:: with SMTP id
 l6mr5568421plt.31.1588736963973; 
 Tue, 05 May 2020 20:49:23 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id k4sm465676pgg.88.2020.05.05.20.49.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2020 20:49:23 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v8 28/30] powerpc: Support prefixed instructions in alignment
 handler
Date: Wed,  6 May 2020 13:40:48 +1000
Message-Id: <20200506034050.24806-29-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200506034050.24806-1-jniethe5@gmail.com>
References: <20200506034050.24806-1-jniethe5@gmail.com>
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
 naveen.n.rao@linux.vnet.ibm.com, Jordan Niethe <jniethe5@gmail.com>,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If a prefixed instruction results in an alignment exception, the
SRR1_PREFIXED bit is set. The handler attempts to emulate the
responsible instruction and then increment the NIP past it. Use
SRR1_PREFIXED to determine by how much the NIP should be incremented.

Prefixed instructions are not permitted to cross 64-byte boundaries. If
they do the alignment interrupt is invoked with SRR1 BOUNDARY bit set.
If this occurs send a SIGBUS to the offending process if in user mode.
If in kernel mode call bad_page_fault().

Reviewed-by: Alistair Popple <alistair@popple.id.au>
Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v2: - Move __get_user_instr() and __get_user_instr_inatomic() to this
commit (previously in "powerpc sstep: Prepare to support prefixed
instructions").
    - Rename sufx to suffix
    - Use a macro for calculating instruction length
v3: Move __get_user_{instr(), instr_inatomic()} up with the other
get_user definitions and remove nested if.
v4: Rolled into "Add prefixed instructions to instruction data type"
v5: Only one definition of inst_length()
---
 arch/powerpc/kernel/traps.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index 493a3fa0ac1a..105242cc2f28 100644
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
@@ -597,12 +599,16 @@ static inline int check_io_access(struct pt_regs *regs)
 #define REASON_ILLEGAL		SRR1_PROGILL
 #define REASON_PRIVILEGED	SRR1_PROGPRIV
 #define REASON_TRAP		SRR1_PROGTRAP
+#define REASON_PREFIXED		SRR1_PREFIXED
+#define REASON_BOUNDARY		SRR1_BOUNDARY
 
 #define single_stepping(regs)	((regs)->msr & MSR_SE)
 #define clear_single_step(regs)	((regs)->msr &= ~MSR_SE)
 #define clear_br_trace(regs)	((regs)->msr &= ~MSR_BE)
 #endif
 
+#define inst_length(reason)	(((reason) & REASON_PREFIXED) ? 8 : 4)
+
 #if defined(CONFIG_E500)
 int machine_check_e500mc(struct pt_regs *regs)
 {
@@ -1593,11 +1599,20 @@ void alignment_exception(struct pt_regs *regs)
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
 
@@ -1606,7 +1621,8 @@ void alignment_exception(struct pt_regs *regs)
 		fixed = fix_alignment(regs);
 
 	if (fixed == 1) {
-		regs->nip += 4;	/* skip over emulated instruction */
+		/* skip over emulated instruction */
+		regs->nip += inst_length(reason);
 		emulate_single_step(regs);
 		goto bail;
 	}
@@ -1619,6 +1635,7 @@ void alignment_exception(struct pt_regs *regs)
 		sig = SIGBUS;
 		code = BUS_ADRALN;
 	}
+bad:
 	if (user_mode(regs))
 		_exception(sig, regs, code, regs->dar);
 	else
-- 
2.17.1

