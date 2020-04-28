Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A391BB408
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 04:35:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49B5NS6SzrzDqnp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 12:35:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=jcyMWAlo; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49B4cb5GpSzDqVv
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 12:01:03 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id h11so7704927plr.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Apr 2020 19:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=35109UhBu02F3mEoSaaWnIYKwTKrmRdciocvLoaL0ek=;
 b=jcyMWAloh3bs4VjsZjZUhWQUSNZqypPtasTPgDq06tL5MUV/9akTNDE5vw/3uVHNA8
 eBuhmQhaj5yEZCKSpjWjuVlN/lmHyX4NNY7zzjngQ+k8OhpGR0Gqq6FjRAhgPAhD8UJD
 tO0n7jQcFwZnvh/u8c4TxVbcMpOSTsq7Dy0qHvAusFfqjBEu80ThgKfVh2VCjIYr0H2f
 eaXAulhzFb9hgiF/qMXG9zmMdBOcYuLm24ose1Ovm2lEWy9wzKzAN3orNW1v8I0YB6ce
 71O1M9FIbMMD4NvoJ665/+dbFN/0+enU8NA5JYobX1USAaozfEFE8pGKd5yQJ4cBGHQx
 yWJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=35109UhBu02F3mEoSaaWnIYKwTKrmRdciocvLoaL0ek=;
 b=EQJ8iQGxHkz+Kn0vAf8/Z3RbolUkQZsP0OCY4wfVb/LqrV7LtRW0LYP5bopqn/0dNH
 +v94aq8OzP+DLaFWiv1mSkdb9Fv5X9lVyfIG+Y5v6OuSKaEu5ItsF7yWaM+/QDrX+Qm1
 XzegmALp5KzUFWGXm1jATa5lX5rBEK6Z0GK8wFv3qWFYoGxATHptxrlGDLXnxBbs9WAR
 3gtOzNVmudSu2gr6Va61OOzWwFZSv2w9pFI7Puo+X4tANSHNVkGUCnVabkD11d2jwCGN
 iK4fe5wqPc00bvw7fLUnWZk9W8V8PyV9t8dfiUwR78hTtbDsU7xTRCkmzJ3zKdptEVrc
 0Jww==
X-Gm-Message-State: AGi0PuZZeB2wlrvqDhS7rvlfyK7Q9zqGSkTBsK3Ik7USaCXChF+YwHIP
 G5df8uW8kFsJF3AqVDa//eH9EiaB344=
X-Google-Smtp-Source: APiQypIAIR+aL43g7ukQCk+T1dg/8OD5Y6Z9jInU6fS4SZbkQVeAX4xqYiBZM0vYAg9dBqmSfoEWqg==
X-Received: by 2002:a17:902:142:: with SMTP id
 60mr26139186plb.40.1588039261237; 
 Mon, 27 Apr 2020 19:01:01 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id o68sm13666642pfb.206.2020.04.27.19.00.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 19:01:00 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 17/28] powerpc: Introduce a function for reporting
 instruction length
Date: Tue, 28 Apr 2020 11:58:03 +1000
Message-Id: <20200428015814.15380-18-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200428015814.15380-1-jniethe5@gmail.com>
References: <20200428015814.15380-1-jniethe5@gmail.com>
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

Currently all instructions have the same length, but in preparation for
prefixed instructions introduce a function for returning instruction
length.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v6: - feature-fixups.c: do_final_fixups(): use here
    - ppc_inst_len(): change return type from bool to int
    - uprobes: Use ppc_inst_read() before calling ppc_inst_len()
---
 arch/powerpc/include/asm/inst.h   |  5 +++++
 arch/powerpc/kernel/kprobes.c     |  6 ++++--
 arch/powerpc/kernel/uprobes.c     |  2 +-
 arch/powerpc/lib/feature-fixups.c | 14 +++++++-------
 4 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/include/asm/inst.h b/arch/powerpc/include/asm/inst.h
index 0d581b332c20..2f3c9d5bcf7c 100644
--- a/arch/powerpc/include/asm/inst.h
+++ b/arch/powerpc/include/asm/inst.h
@@ -17,6 +17,11 @@ static inline u32 ppc_inst_val(struct ppc_inst x)
 	return x.val;
 }
 
+static inline int ppc_inst_len(struct ppc_inst x)
+{
+	return sizeof(struct ppc_inst);
+}
+
 static inline int ppc_inst_primary_opcode(struct ppc_inst x)
 {
 	return ppc_inst_val(x) >> 26;
diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
index ff53e5ef7e40..8d17cfdcdc54 100644
--- a/arch/powerpc/kernel/kprobes.c
+++ b/arch/powerpc/kernel/kprobes.c
@@ -474,14 +474,16 @@ NOKPROBE_SYMBOL(trampoline_probe_handler);
  */
 int kprobe_post_handler(struct pt_regs *regs)
 {
+	int len;
 	struct kprobe *cur = kprobe_running();
 	struct kprobe_ctlblk *kcb = get_kprobe_ctlblk();
 
 	if (!cur || user_mode(regs))
 		return 0;
 
+	len = ppc_inst_len(ppc_inst_read((struct ppc_inst *)cur->ainsn.insn));
 	/* make sure we got here for instruction we have a kprobe on */
-	if (((unsigned long)cur->ainsn.insn + 4) != regs->nip)
+	if (((unsigned long)cur->ainsn.insn + len) != regs->nip)
 		return 0;
 
 	if ((kcb->kprobe_status != KPROBE_REENTER) && cur->post_handler) {
@@ -490,7 +492,7 @@ int kprobe_post_handler(struct pt_regs *regs)
 	}
 
 	/* Adjust nip to after the single-stepped instruction */
-	regs->nip = (unsigned long)cur->addr + 4;
+	regs->nip = (unsigned long)cur->addr + len;
 	regs->msr |= kcb->kprobe_saved_msr;
 
 	/*Restore back the original saved kprobes variables and continue. */
diff --git a/arch/powerpc/kernel/uprobes.c b/arch/powerpc/kernel/uprobes.c
index 6893d40a48c5..83e883e1a42d 100644
--- a/arch/powerpc/kernel/uprobes.c
+++ b/arch/powerpc/kernel/uprobes.c
@@ -112,7 +112,7 @@ int arch_uprobe_post_xol(struct arch_uprobe *auprobe, struct pt_regs *regs)
 	 * support doesn't exist and have to fix-up the next instruction
 	 * to be executed.
 	 */
-	regs->nip = utask->vaddr + MAX_UINSN_BYTES;
+	regs->nip = utask->vaddr + ppc_inst_len(ppc_inst_read(&auprobe->insn));
 
 	user_disable_single_step(current);
 	return 0;
diff --git a/arch/powerpc/lib/feature-fixups.c b/arch/powerpc/lib/feature-fixups.c
index 13ec3264a565..f4845e740338 100644
--- a/arch/powerpc/lib/feature-fixups.c
+++ b/arch/powerpc/lib/feature-fixups.c
@@ -390,20 +390,20 @@ void do_lwsync_fixups(unsigned long value, void *fixup_start, void *fixup_end)
 static void do_final_fixups(void)
 {
 #if defined(CONFIG_PPC64) && defined(CONFIG_RELOCATABLE)
-	struct ppc_inst *src, *dest;
-	unsigned long length;
+	struct ppc_inst inst, *src, *dest, *end;
 
 	if (PHYSICAL_START == 0)
 		return;
 
 	src = (struct ppc_inst *)(KERNELBASE + PHYSICAL_START);
 	dest = (struct ppc_inst *)KERNELBASE;
-	length = (__end_interrupts - _stext) / sizeof(struct ppc_inst);
+	end = (void *)src + (__end_interrupts - _stext);
 
-	while (length--) {
-		raw_patch_instruction(dest, ppc_inst_read(src));
-		src++;
-		dest++;
+	while (src < end) {
+		inst = ppc_inst_read(src);
+		raw_patch_instruction(dest, inst);
+		src = (void *)src + ppc_inst_len(inst);
+		dest = (void *)dest + ppc_inst_len(inst);
 	}
 #endif
 }
-- 
2.17.1

