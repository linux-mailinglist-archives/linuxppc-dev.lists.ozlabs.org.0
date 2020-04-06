Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF1919F1C7
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 10:47:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wkh44PzPzDqcn
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 18:47:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=IbGEMP46; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wjsk6m3xzDqsG
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 18:11:06 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id d17so7195469pgo.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Apr 2020 01:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=IMm3yLaxfptXxCuG3g4CUmafNqnMtCP+8ADv+1wXe1M=;
 b=IbGEMP466rzu8ov+n4S2kBOBuGS3V4Ro8P78W9CTC+oidMLZ1//wyLiYQONa6JOGLt
 D0yBGhhGaafybOmY1TXM2jdEHyUPt0ID5cJL6/NWh9bjCrWtyONyoIA5ZvfXiKAPflkh
 OqzrFgKiNQhymu5LLJCzYHor57DQVsMQJ42gzDVRhHSWKHJ3a2XS9Q9paLigKIQ1GsVv
 Bf14QgvGeC5+H1ECX04OZ0OfjeAYdTBV8R+PnQ4B67uIXjWvqTPaI+orul7ImByzGQz8
 Zle6aJkU0RZfuKmYH5q3ukD/WS2jp9ErmxclDqHaB+11gIxqOvUpcd+1cvp4pp77VuFI
 tXGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=IMm3yLaxfptXxCuG3g4CUmafNqnMtCP+8ADv+1wXe1M=;
 b=ajHeeQR4pTWBDcMJH8uEW77LhV2nruVU7CuLah2oqM09sWbDLAjIMpv78dTR/wEc/+
 USA2arVl2It/8KAH9Nm9ZSSXEgbhbd7a2xdVNsCVBdE4xqt5snO9g9Fh/TqUs83DqxE4
 YfASqBHuGxdQdAy66KGdc79cyT55o4vdSfjOc3UZz9+ztTN6CEM9PUiJ5mgwBQdbdVSL
 1wPutrng45X1/LTOerhwMZNuERSu/kBtf9wIGf1Hhv9FNc2TuxB9jbmIYy8+RgkXA9gI
 x+A83vr7c+cvgb9q3mJNwJ3b7YCf57Xwl+045C0/CDERQVv6YNap/c6YIVgRqy+dNHL9
 Dz8w==
X-Gm-Message-State: AGi0PualN139leQRIkveOoHF5kSVzoLtMq1JwUcICe3r2JEbuY8t+VzM
 DxCEQehQNxWHxn2O20/UX5eOfurdGdY=
X-Google-Smtp-Source: APiQypJJJAWafMYguuCNEx4ebluJdoLGOvX0wbeVHZpi/C0T1Znp1NHlvWGrBt6Jrsh0Rp+LtVBQ9Q==
X-Received: by 2002:a63:3141:: with SMTP id x62mr20383813pgx.275.1586160664797; 
 Mon, 06 Apr 2020 01:11:04 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id m2sm11460406pjk.4.2020.04.06.01.11.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 01:11:04 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 19/21] powerpc: Support prefixed instructions in alignment
 handler
Date: Mon,  6 Apr 2020 18:09:34 +1000
Message-Id: <20200406080936.7180-20-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200406080936.7180-1-jniethe5@gmail.com>
References: <20200406080936.7180-1-jniethe5@gmail.com>
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

If a prefixed instruction results in an alignment exception, the
SRR1_PREFIXED bit is set. The handler attempts to emulate the
responsible instruction and then increment the NIP past it. Use
SRR1_PREFIXED to determine by how much the NIP should be incremented.

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
v4: Rolled into "Add prefixed instructions to instruction data type"
v5: Only one definition of inst_length()
---
 arch/powerpc/kernel/traps.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index a4764b039749..9b97d2e6055a 100644
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

