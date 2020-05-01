Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB2D1C0D6E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 06:36:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Czw14hxKzDrWN
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 14:36:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=XMv8NsRe; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Cyvc16V5zDr9C
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 May 2020 13:50:35 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id t16so3236754plo.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Apr 2020 20:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=HR2Q93IHFamm/+Rq2dVc3rw6swQ2uyQgFr6tB0PO+vc=;
 b=XMv8NsRexbi1QXhO94pXZAX3y6cOhqEhrsbA2jNvfyR336seTip5CbOsGdtPpjVvdd
 +dlayLLklMEluJu5t8NYenva0o9I/tWa2RK1G45nxi/fW53cPDHNQCKuGVjYw2NZ5ldR
 dbhzkB4Eq15+8NheZouJFWiiEjG/tub3Ib8bOPU0694Y3PjeWRMAKJL1x1HXVDhrc9s8
 68M8H6+eN0njZXLcW/vtAUn8M3WBfSu5SM2ORJkC9ueT/P3vTI5TqClOrZsouCz+Da3z
 tqXQjvskMJDChPo0ci3O0sC8JmwIYWO6079VtWf8lpTjrlOrJVoKVlQVP9WzAzaEUHVS
 a8NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=HR2Q93IHFamm/+Rq2dVc3rw6swQ2uyQgFr6tB0PO+vc=;
 b=en8a8Ug/TW+EYc+LiCpka6ISwQGo8gQ799sBHJqfbJsBrGNwrLHXRDf9Nr1dYrZPuK
 cN4FYvkQ3yxKymKBmujnElW5zFQGxNnOrdK7NDowTNKz5IlYFA/s3T/W/HbUJUD6kCP4
 DZXT+U17uTEsI3d3gdzdhTO8luQv4wIIRKn0fmh1lYDvNAqKJPhqzjf+0eWx33SnZ7Ou
 JSDd3IyHGv0r25eTaqibpQQ5akfdIQj8uertctu1TEd7wRQvy/rQaHbhOslNfjaayu/E
 pZcZp/OUlR7HKV9R1zGTE9Ps9kwk2QPUQ4f3QL/OKuoIeQ9dTyGA6foct5dWYyZAMo3V
 bQlA==
X-Gm-Message-State: AGi0PuZDh1ttlCEc+WVm/uiSXAvNDVj/jh5Gcd3RlJNB5EvG7kmxjrHd
 VlauAmscAuEKcurGpG8f7sXlE/O0pdVyuQ==
X-Google-Smtp-Source: APiQypIob41UGzZWVrv9Y0r6zet7jU/uOpc+5OhXVFEpJED5nY7sLc0fZeNUObWMFE1SWHkcy7VEnA==
X-Received: by 2002:a17:90a:a484:: with SMTP id
 z4mr2359952pjp.40.1588305033798; 
 Thu, 30 Apr 2020 20:50:33 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id w28sm940082pgc.26.2020.04.30.20.50.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 20:50:33 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 26/28] powerpc: Support prefixed instructions in alignment
 handler
Date: Fri,  1 May 2020 13:42:18 +1000
Message-Id: <20200501034220.8982-27-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200501034220.8982-1-jniethe5@gmail.com>
References: <20200501034220.8982-1-jniethe5@gmail.com>
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

