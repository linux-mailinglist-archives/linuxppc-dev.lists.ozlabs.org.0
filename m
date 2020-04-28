Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3151BB3F2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 04:26:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49B59x6GZ1zDqnn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 12:26:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=kZ4r70QC; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49B4by6kYdzDqTN
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 12:00:30 +1000 (AEST)
Received: by mail-pj1-x1044.google.com with SMTP id e6so429158pjt.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Apr 2020 19:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=JltlrdTLEAECZsUHJcaFus+8bSERm43SZCmj5hm+c54=;
 b=kZ4r70QCZkfAxs+JYLfzLmYdpBD5fBNB7Fvz0jYGdyb8timIYdxskJY/gPHp4N38Pj
 K6cf1hse5b4RtnrOJ7KcQW6iPczNl8qPMEwXNMI/DmHe0DO2By+6GvNkD843ZAc4ED+u
 SFY+IuER45V6NwSsqbFabYVoubi8hc0Ua9iwpqZbrwhz5Fg4//3Hgsre2625v7twaj/m
 V217qGGZeUyRChtlnak2sZ9wjtbYjMSDKvT9hpWSIOvybdwotqyWju5Y1l8oYxjJLDMF
 TRdFqqGTBZbDmdvD+v6IiMZauqaF8q4qq0uTBZs8nxTv8AmBqG+e4PuNFyXNk3GFZEXN
 /qug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=JltlrdTLEAECZsUHJcaFus+8bSERm43SZCmj5hm+c54=;
 b=nbmjiM9JfcdT2ydwpohENVgaP2VlN901AsF6/3Cte7L6qGcMMRUrayTUh7SEqDk9jb
 m2i/PW3Y0KaKwN63G2y7oryHz3JcvXsK9Ul2KXo6BV4RKFJ8k0E8YXOQ0y2wcpZe/qRQ
 bc1DXrhoz0UQL/B5S0EFZm3YNUh4/xLm+/DorXJfY0t6ttrtHa3v16okQpdkZEwbF+qH
 Q5z59t73itWTu3Y4lBzWsSew2ca8Xa56uNEGWkUBl1/ysIXet7QpkQ+9UlFteTceyXwp
 iZxlPeUfcG8MLppQmMZo4kWQVrwgyQbS/6XB8X5mFH0k0e38q4yMrZGkP+eaNsliEiYD
 bELA==
X-Gm-Message-State: AGi0PubTQgStWG3vOmoo5zRUNj9apOO5bkDtXNCG0h4CuU/JaeiJubN6
 rkYTIJeGdUwlO4QvpoQEsut/IyLyzCo=
X-Google-Smtp-Source: APiQypImgiv9tjha8t8z93gOnl7gFe15RNitBDYhgba6fZtNXWN1r4nfwJxzTVL8t7YNPweGjfqp0A==
X-Received: by 2002:a17:90a:ea07:: with SMTP id
 w7mr2022048pjy.172.1588039227782; 
 Mon, 27 Apr 2020 19:00:27 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id o68sm13666642pfb.206.2020.04.27.19.00.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 19:00:27 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 12/28] powerpc: Use a function for reading instructions
Date: Tue, 28 Apr 2020 11:57:58 +1000
Message-Id: <20200428015814.15380-13-jniethe5@gmail.com>
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

Prefixed instructions will mean there are instructions of different
length. As a result dereferencing a pointer to an instruction will not
necessarily give the desired result. Introduce a function for reading
instructions from memory into the instruction data type.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v4: New to series
v5: - Rename read_inst() -> probe_kernel_read_inst()
    - No longer modify uprobe probe type in this patch
v6: - feature-fixups.c: do_final_fixups(): Use here
    - arch_prepare_kprobe(): patch_instruction(): no longer part of this
      patch
    - Move probe_kernel_read_inst() out of this patch
    - Use in uprobes
---
 arch/powerpc/include/asm/inst.h    |  5 +++++
 arch/powerpc/kernel/kprobes.c      |  6 +++---
 arch/powerpc/kernel/mce_power.c    |  2 +-
 arch/powerpc/kernel/optprobes.c    |  4 ++--
 arch/powerpc/kernel/trace/ftrace.c |  4 ++--
 arch/powerpc/kernel/uprobes.c      |  2 +-
 arch/powerpc/lib/code-patching.c   | 23 +++++++++++------------
 arch/powerpc/lib/feature-fixups.c  |  4 ++--
 arch/powerpc/xmon/xmon.c           |  6 +++---
 9 files changed, 30 insertions(+), 26 deletions(-)

diff --git a/arch/powerpc/include/asm/inst.h b/arch/powerpc/include/asm/inst.h
index 19d8bb7a1c2b..552e953bf04f 100644
--- a/arch/powerpc/include/asm/inst.h
+++ b/arch/powerpc/include/asm/inst.h
@@ -27,6 +27,11 @@ static inline struct ppc_inst ppc_inst_swab(struct ppc_inst x)
 	return ppc_inst(swab32(ppc_inst_val(x)));
 }
 
+static inline struct ppc_inst ppc_inst_read(const struct ppc_inst *ptr)
+{
+	return *ptr;
+}
+
 static inline bool ppc_inst_equal(struct ppc_inst x, struct ppc_inst y)
 {
 	return ppc_inst_val(x) == ppc_inst_val(y);
diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
index 9ed996cb0589..17ad844e24f5 100644
--- a/arch/powerpc/kernel/kprobes.c
+++ b/arch/powerpc/kernel/kprobes.c
@@ -106,7 +106,7 @@ kprobe_opcode_t *kprobe_lookup_name(const char *name, unsigned int offset)
 int arch_prepare_kprobe(struct kprobe *p)
 {
 	int ret = 0;
-	struct ppc_inst insn = *(struct ppc_inst *)p->addr;
+	struct ppc_inst insn = ppc_inst_read((struct ppc_inst *)p->addr);
 
 	if ((unsigned long)p->addr & 0x03) {
 		printk("Attempt to register kprobe at an unaligned address\n");
@@ -127,7 +127,7 @@ int arch_prepare_kprobe(struct kprobe *p)
 	if (!ret) {
 		memcpy(p->ainsn.insn, p->addr,
 				MAX_INSN_SIZE * sizeof(kprobe_opcode_t));
-		p->opcode = *p->addr;
+		p->opcode = ppc_inst_val(insn);
 		flush_icache_range((unsigned long)p->ainsn.insn,
 			(unsigned long)p->ainsn.insn + sizeof(kprobe_opcode_t));
 	}
@@ -217,7 +217,7 @@ NOKPROBE_SYMBOL(arch_prepare_kretprobe);
 static int try_to_emulate(struct kprobe *p, struct pt_regs *regs)
 {
 	int ret;
-	struct ppc_inst insn = *(struct ppc_inst *)p->ainsn.insn;
+	struct ppc_inst insn = ppc_inst_read((struct ppc_inst *)p->ainsn.insn);
 
 	/* regs->nip is also adjusted if emulate_step returns 1 */
 	ret = emulate_step(regs, insn);
diff --git a/arch/powerpc/kernel/mce_power.c b/arch/powerpc/kernel/mce_power.c
index 7118b46a6543..859b602fa270 100644
--- a/arch/powerpc/kernel/mce_power.c
+++ b/arch/powerpc/kernel/mce_power.c
@@ -374,7 +374,7 @@ static int mce_find_instr_ea_and_phys(struct pt_regs *regs, uint64_t *addr,
 	pfn = addr_to_pfn(regs, regs->nip);
 	if (pfn != ULONG_MAX) {
 		instr_addr = (pfn << PAGE_SHIFT) + (regs->nip & ~PAGE_MASK);
-		instr = *(struct ppc_inst *)(instr_addr);
+		instr = ppc_inst_read((struct ppc_inst *)instr_addr);
 		if (!analyse_instr(&op, &tmp, instr)) {
 			pfn = addr_to_pfn(regs, op.ea);
 			*addr = op.ea;
diff --git a/arch/powerpc/kernel/optprobes.c b/arch/powerpc/kernel/optprobes.c
index dfeb317a58ad..d704f9598f48 100644
--- a/arch/powerpc/kernel/optprobes.c
+++ b/arch/powerpc/kernel/optprobes.c
@@ -100,8 +100,8 @@ static unsigned long can_optimize(struct kprobe *p)
 	 * Ensure that the instruction is not a conditional branch,
 	 * and that can be emulated.
 	 */
-	if (!is_conditional_branch(*(struct ppc_inst *)p->ainsn.insn) &&
-			analyse_instr(&op, &regs, *(struct ppc_inst *)p->ainsn.insn) == 1) {
+	if (!is_conditional_branch(ppc_inst_read((struct ppc_inst *)p->ainsn.insn)) &&
+			analyse_instr(&op, &regs, ppc_inst_read((struct ppc_inst *)p->ainsn.insn)) == 1) {
 		emulate_update_regs(&regs, &op);
 		nip = regs.nip;
 	}
diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index 2c70d1854b5c..63228e0e8cfc 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -846,7 +846,7 @@ int ftrace_update_ftrace_func(ftrace_func_t func)
 	struct ppc_inst old, new;
 	int ret;
 
-	old = *(struct ppc_inst *)&ftrace_call;
+	old = ppc_inst_read((struct ppc_inst *)&ftrace_call);
 	new = ftrace_call_replace(ip, (unsigned long)func, 1);
 	ret = ftrace_modify_code(ip, old, new);
 
@@ -854,7 +854,7 @@ int ftrace_update_ftrace_func(ftrace_func_t func)
 	/* Also update the regs callback function */
 	if (!ret) {
 		ip = (unsigned long)(&ftrace_regs_call);
-		old = *(struct ppc_inst *)&ftrace_regs_call;
+		old = ppc_inst_read((struct ppc_inst *)&ftrace_regs_call);
 		new = ftrace_call_replace(ip, (unsigned long)func, 1);
 		ret = ftrace_modify_code(ip, old, new);
 	}
diff --git a/arch/powerpc/kernel/uprobes.c b/arch/powerpc/kernel/uprobes.c
index 31c870287f2b..6893d40a48c5 100644
--- a/arch/powerpc/kernel/uprobes.c
+++ b/arch/powerpc/kernel/uprobes.c
@@ -174,7 +174,7 @@ bool arch_uprobe_skip_sstep(struct arch_uprobe *auprobe, struct pt_regs *regs)
 	 * emulate_step() returns 1 if the insn was successfully emulated.
 	 * For all other cases, we need to single-step in hardware.
 	 */
-	ret = emulate_step(regs, auprobe->insn);
+	ret = emulate_step(regs, ppc_inst_read(&auprobe->insn));
 	if (ret > 0)
 		return true;
 
diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index 1cc5120c2c9d..85ad61aa0304 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -349,9 +349,9 @@ static unsigned long branch_bform_target(const struct ppc_inst *instr)
 
 unsigned long branch_target(const struct ppc_inst *instr)
 {
-	if (instr_is_branch_iform(*instr))
+	if (instr_is_branch_iform(ppc_inst_read(instr)))
 		return branch_iform_target(instr);
-	else if (instr_is_branch_bform(*instr))
+	else if (instr_is_branch_bform(ppc_inst_read(instr)))
 		return branch_bform_target(instr);
 
 	return 0;
@@ -359,7 +359,7 @@ unsigned long branch_target(const struct ppc_inst *instr)
 
 int instr_is_branch_to_addr(const struct ppc_inst *instr, unsigned long addr)
 {
-	if (instr_is_branch_iform(*instr) || instr_is_branch_bform(*instr))
+	if (instr_is_branch_iform(ppc_inst_read(instr)) || instr_is_branch_bform(ppc_inst_read(instr)))
 		return branch_target(instr) == addr;
 
 	return 0;
@@ -369,13 +369,12 @@ int translate_branch(struct ppc_inst *instr, const struct ppc_inst *dest,
 		     const struct ppc_inst *src)
 {
 	unsigned long target;
-
 	target = branch_target(src);
 
-	if (instr_is_branch_iform(*src))
-		return create_branch(instr, dest, target, ppc_inst_val(*src));
-	else if (instr_is_branch_bform(*src))
-		return create_cond_branch(instr, dest, target, ppc_inst_val(*src));
+	if (instr_is_branch_iform(ppc_inst_read(src)))
+		return create_branch(instr, dest, target, ppc_inst_val(ppc_inst_read(src)));
+	else if (instr_is_branch_bform(ppc_inst_read(src)))
+		return create_cond_branch(instr, dest, target, ppc_inst_val(ppc_inst_read(src)));
 
 	return 1;
 }
@@ -599,7 +598,7 @@ static void __init test_translate_branch(void)
 	patch_instruction(q, instr);
 	check(instr_is_branch_to_addr(p, addr));
 	check(instr_is_branch_to_addr(q, addr));
-	check(ppc_inst_equal(*q, ppc_inst(0x4a000000)));
+	check(ppc_inst_equal(ppc_inst_read(q), ppc_inst(0x4a000000)));
 
 	/* Maximum positive case, move x to x - 32 MB + 4 */
 	p = buf + 0x2000000;
@@ -610,7 +609,7 @@ static void __init test_translate_branch(void)
 	patch_instruction(q, instr);
 	check(instr_is_branch_to_addr(p, addr));
 	check(instr_is_branch_to_addr(q, addr));
-	check(ppc_inst_equal(*q, ppc_inst(0x49fffffc)));
+	check(ppc_inst_equal(ppc_inst_read(q), ppc_inst(0x49fffffc)));
 
 	/* Jump to x + 16 MB moved to x + 20 MB */
 	p = buf;
@@ -656,7 +655,7 @@ static void __init test_translate_branch(void)
 	patch_instruction(q, instr);
 	check(instr_is_branch_to_addr(p, addr));
 	check(instr_is_branch_to_addr(q, addr));
-	check(ppc_inst_equal(*q, ppc_inst(0x43ff8000)));
+	check(ppc_inst_equal(ppc_inst_read(q), ppc_inst(0x43ff8000)));
 
 	/* Maximum positive case, move x to x - 32 KB + 4 */
 	p = buf + 0x8000;
@@ -668,7 +667,7 @@ static void __init test_translate_branch(void)
 	patch_instruction(q, instr);
 	check(instr_is_branch_to_addr(p, addr));
 	check(instr_is_branch_to_addr(q, addr));
-	check(ppc_inst_equal(*q, ppc_inst(0x43ff7ffc)));
+	check(ppc_inst_equal(ppc_inst_read(q), ppc_inst(0x43ff7ffc)));
 
 	/* Jump to x + 12 KB moved to x + 20 KB */
 	p = buf;
diff --git a/arch/powerpc/lib/feature-fixups.c b/arch/powerpc/lib/feature-fixups.c
index 05be435959fb..13ec3264a565 100644
--- a/arch/powerpc/lib/feature-fixups.c
+++ b/arch/powerpc/lib/feature-fixups.c
@@ -48,7 +48,7 @@ static int patch_alt_instruction(struct ppc_inst *src, struct ppc_inst *dest,
 	int err;
 	struct ppc_inst instr;
 
-	instr = *src;
+	instr = ppc_inst_read(src);
 
 	if (instr_is_relative_branch(*src)) {
 		struct ppc_inst *target = (struct ppc_inst *)branch_target(src);
@@ -401,7 +401,7 @@ static void do_final_fixups(void)
 	length = (__end_interrupts - _stext) / sizeof(struct ppc_inst);
 
 	while (length--) {
-		raw_patch_instruction(dest, *src);
+		raw_patch_instruction(dest, ppc_inst_read(src));
 		src++;
 		dest++;
 	}
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index cb624fe789ec..65abae7a0103 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -701,13 +701,13 @@ static int xmon_core(struct pt_regs *regs, int fromipi)
 	if ((regs->msr & (MSR_IR|MSR_PR|MSR_64BIT)) == (MSR_IR|MSR_64BIT)) {
 		bp = at_breakpoint(regs->nip);
 		if (bp != NULL) {
-			int stepped = emulate_step(regs, bp->instr[0]);
+			int stepped = emulate_step(regs, ppc_inst_read(bp->instr));
 			if (stepped == 0) {
 				regs->nip = (unsigned long) &bp->instr[0];
 				atomic_inc(&bp->ref_count);
 			} else if (stepped < 0) {
 				printf("Couldn't single-step %s instruction\n",
-				    (IS_RFID(bp->instr[0])? "rfid": "mtmsrd"));
+				    IS_RFID(ppc_inst_read(bp->instr))? "rfid": "mtmsrd");
 			}
 		}
 	}
@@ -948,7 +948,7 @@ static void remove_bpts(void)
 		if (mread(bp->address, &instr, 4) == 4
 		    && ppc_inst_equal(instr, ppc_inst(bpinstr))
 		    && patch_instruction(
-			(struct ppc_inst *)bp->address, bp->instr[0]) != 0)
+			(struct ppc_inst *)bp->address, ppc_inst_read(bp->instr)) != 0)
 			printf("Couldn't remove breakpoint at %lx\n",
 			       bp->address);
 	}
-- 
2.17.1

