Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC551C0D6A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 06:30:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Cznh5spmzDrBl
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 14:30:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=WJ6O+R0j; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Cytd006szDr9K
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 May 2020 13:49:44 +1000 (AEST)
Received: by mail-pj1-x1043.google.com with SMTP id h12so4298136pjz.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Apr 2020 20:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=mXVAOfGPL0XiL4GEDtj3yQ2fY9gnP9wX17wqNVCSncc=;
 b=WJ6O+R0jK7D6cRFZzfPKWqOeniHko3/7YVBiU1IcNd4W8ir4Ymau517nnqQx9h91B+
 5JiRsc/FM0rhUjGuoDK70BWel21LIWzi7Z5ZPirE/1EYqohf4nOSSbneSVHzqxnhwx1Z
 8z3lznzQD6PiXzldXnFMhsm0LamaK6kbGgW7arkghll8QcsKRHci1Ou8xcYQBsUKeNjR
 51J3fnJYG0CzO18lCboIfMQmo6nZ09Z/sqjRx26qL/xhdEc5PogVqATjBEVD8+neo5fV
 Ft4P1x1iNdlvV2XtJqwVtiq+zknLGvLea4W/RgLvBCqqTAiZu5Nm03Bz7P2ub32cJmHL
 OaFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=mXVAOfGPL0XiL4GEDtj3yQ2fY9gnP9wX17wqNVCSncc=;
 b=BBKGcd6lsyjZYryvaUcQQSnwrdR5UTn9GA450YAi/Bewqo0HChX6BQBAe+Q2W1uB3+
 WhW+38pHXMGZpWmc8WeiQ+L+RBSyVVSE9PVQue5rrZiPUd010DPFLsLbS391cr/nRNKA
 f62GzShHnmDCTAvdokFltLsmR3jKZVKkV+1IhaVB+OULuGh2DORP8ZyY5N0qHVCcuk9d
 JkwPHh/cZ496SzyoXdFBpYw1+kNtG7yhXOs77awhX5CezglIU8QKN31XermlU/w/KY7M
 febFtKZbjN8kS10713ZBL5O6xZIfZjIU/DnlRvpM9NHrzQdWVt9brJwNVMzI/VfTKCbO
 93sQ==
X-Gm-Message-State: AGi0PuZpKxS/Ap61Gz1aZaJO0hm9T02xkI2Pra2/nUgdG9MOOxQ2fxss
 8rQmG0jCsEWHXf7bAN1qVrqKUNtZaPlISQ==
X-Google-Smtp-Source: APiQypKOuQx0p5CWv2qvJMgSJ/8MWvdPmVs1VXNAXfWZXJWR6gBUyh/4HXWblWTVet2p/jYZbe0VsQ==
X-Received: by 2002:a17:902:b682:: with SMTP id
 c2mr2529557pls.144.1588304982146; 
 Thu, 30 Apr 2020 20:49:42 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id w28sm940082pgc.26.2020.04.30.20.49.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 20:49:41 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 23/28] powerpc: Add prefixed instructions to instruction
 data type
Date: Fri,  1 May 2020 13:42:15 +1000
Message-Id: <20200501034220.8982-24-jniethe5@gmail.com>
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

For powerpc64, redefine the ppc_inst type so both word and prefixed
instructions can be represented. On powerpc32 the type will remain the
same.  Update places which had assumed instructions to be 4 bytes long.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v4: New to series
v5:  - Distinguish normal instructions from prefixed instructions with a
       0xff marker for the suffix.
     - __patch_instruction() using std for prefixed instructions
v6:  - Return false instead of 0 in ppc_inst_prefixed()
     - Fix up types for ppc32 so it compiles
     - remove ppc_inst_write()
     - __patching_instruction(): move flush out of condition
---
 arch/powerpc/include/asm/inst.h      | 68 +++++++++++++++++++++++++---
 arch/powerpc/include/asm/kprobes.h   |  2 +-
 arch/powerpc/include/asm/uaccess.h   | 32 ++++++++++++-
 arch/powerpc/include/asm/uprobes.h   |  2 +-
 arch/powerpc/kernel/optprobes.c      | 42 +++++++++--------
 arch/powerpc/kernel/optprobes_head.S |  3 ++
 arch/powerpc/lib/code-patching.c     | 13 ++++--
 arch/powerpc/lib/feature-fixups.c    |  5 +-
 arch/powerpc/lib/inst.c              | 40 ++++++++++++++++
 arch/powerpc/lib/sstep.c             |  4 +-
 arch/powerpc/xmon/xmon.c             |  4 +-
 arch/powerpc/xmon/xmon_bpts.S        |  2 +
 12 files changed, 180 insertions(+), 37 deletions(-)

diff --git a/arch/powerpc/include/asm/inst.h b/arch/powerpc/include/asm/inst.h
index 2f3c9d5bcf7c..1e743635c214 100644
--- a/arch/powerpc/include/asm/inst.h
+++ b/arch/powerpc/include/asm/inst.h
@@ -8,23 +8,72 @@
 
 struct ppc_inst {
 	u32 val;
+#ifdef __powerpc64__
+	u32 suffix;
+#endif /* __powerpc64__ */
 } __packed;
 
-#define ppc_inst(x) ((struct ppc_inst){ .val = x })
-
 static inline u32 ppc_inst_val(struct ppc_inst x)
 {
 	return x.val;
 }
 
-static inline int ppc_inst_len(struct ppc_inst x)
+static inline int ppc_inst_primary_opcode(struct ppc_inst x)
 {
-	return sizeof(struct ppc_inst);
+	return ppc_inst_val(x) >> 26;
 }
 
-static inline int ppc_inst_primary_opcode(struct ppc_inst x)
+#ifdef __powerpc64__
+#define ppc_inst(x) ((struct ppc_inst){ .val = (x), .suffix = 0xff })
+
+#define ppc_inst_prefix(x, y) ((struct ppc_inst){ .val = (x), .suffix = (y) })
+
+static inline u32 ppc_inst_suffix(struct ppc_inst x)
 {
-	return ppc_inst_val(x) >> 26;
+	return x.suffix;
+}
+
+static inline bool ppc_inst_prefixed(struct ppc_inst x)
+{
+	return (ppc_inst_primary_opcode(x) == 1) && ppc_inst_suffix(x) != 0xff;
+}
+
+static inline struct ppc_inst ppc_inst_swab(struct ppc_inst x)
+{
+	return ppc_inst_prefix(swab32(ppc_inst_val(x)),
+			       swab32(ppc_inst_suffix(x)));
+}
+
+static inline struct ppc_inst ppc_inst_read(const struct ppc_inst *ptr)
+{
+	u32 val, suffix;
+
+	val = *(u32 *)ptr;
+	if ((val >> 26) == 1) {
+		suffix = *((u32 *)ptr + 1);
+		return ppc_inst_prefix(val, suffix);
+	} else {
+		return ppc_inst(val);
+	}
+}
+
+static inline bool ppc_inst_equal(struct ppc_inst x, struct ppc_inst y)
+{
+	return *(u64 *)&x == *(u64 *)&y;
+}
+
+#else
+
+#define ppc_inst(x) ((struct ppc_inst){ .val = x })
+
+static inline bool ppc_inst_prefixed(struct ppc_inst x)
+{
+	return false;
+}
+
+static inline u32 ppc_inst_suffix(struct ppc_inst x)
+{
+	return 0;
 }
 
 static inline struct ppc_inst ppc_inst_swab(struct ppc_inst x)
@@ -42,6 +91,13 @@ static inline bool ppc_inst_equal(struct ppc_inst x, struct ppc_inst y)
 	return ppc_inst_val(x) == ppc_inst_val(y);
 }
 
+#endif /* __powerpc64__ */
+
+static inline int ppc_inst_len(struct ppc_inst x)
+{
+	return (ppc_inst_prefixed(x)) ? 8  : 4;
+}
+
 int probe_user_read_inst(struct ppc_inst *inst,
 			 struct ppc_inst *nip);
 int probe_kernel_read_inst(struct ppc_inst *inst,
diff --git a/arch/powerpc/include/asm/kprobes.h b/arch/powerpc/include/asm/kprobes.h
index 66b3f2983b22..4fc0e15e23a5 100644
--- a/arch/powerpc/include/asm/kprobes.h
+++ b/arch/powerpc/include/asm/kprobes.h
@@ -43,7 +43,7 @@ extern kprobe_opcode_t optprobe_template_ret[];
 extern kprobe_opcode_t optprobe_template_end[];
 
 /* Fixed instruction size for powerpc */
-#define MAX_INSN_SIZE		1
+#define MAX_INSN_SIZE		2
 #define MAX_OPTIMIZED_LENGTH	sizeof(kprobe_opcode_t)	/* 4 bytes */
 #define MAX_OPTINSN_SIZE	(optprobe_template_end - optprobe_template_entry)
 #define RELATIVEJUMP_SIZE	sizeof(kprobe_opcode_t)	/* 4 bytes */
diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index c0a35e4586a5..12e52aa179b6 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -105,11 +105,41 @@ static inline int __access_ok(unsigned long addr, unsigned long size,
 #define __put_user_inatomic(x, ptr) \
 	__put_user_nosleep((__typeof__(*(ptr)))(x), (ptr), sizeof(*(ptr)))
 
+#ifdef __powerpc64__
+#define __get_user_instr(x, ptr)			\
+({							\
+	long __gui_ret = 0;				\
+	unsigned int prefix, suffix;			\
+	__gui_ret = __get_user(prefix, (unsigned int __user *)ptr);		\
+	if (!__gui_ret && (prefix >> 26) == 1) {	\
+		__gui_ret = __get_user(suffix, (unsigned int __user *)ptr + 1);	\
+		(x) = ppc_inst_prefix(prefix, suffix);	\
+	} else {					\
+		(x) = ppc_inst(prefix);			\
+	}						\
+	__gui_ret;					\
+})
+
+#define __get_user_instr_inatomic(x, ptr)		\
+({							\
+	long __gui_ret = 0;				\
+	unsigned int prefix, suffix;			\
+	__gui_ret = __get_user_inatomic(prefix, (unsigned int __user *)ptr);		\
+	if (!__gui_ret && (prefix >> 26) == 1) {	\
+		__gui_ret = __get_user_inatomic(suffix, (unsigned int __user *)ptr + 1);	\
+		(x) = ppc_inst_prefix(prefix, suffix);	\
+	} else {					\
+		(x) = ppc_inst(prefix);			\
+	}						\
+	__gui_ret;					\
+})
+#else
 #define __get_user_instr(x, ptr) \
 	__get_user_nocheck((x).val, (u32 *)(ptr), sizeof(u32), true)
-
 #define __get_user_instr_inatomic(x, ptr) \
 	__get_user_nosleep((x).val, (u32 *)(ptr), sizeof(u32))
+#endif
+
 extern long __put_user_bad(void);
 
 /*
diff --git a/arch/powerpc/include/asm/uprobes.h b/arch/powerpc/include/asm/uprobes.h
index 7e3b329ba2d3..5bf65f5d44a9 100644
--- a/arch/powerpc/include/asm/uprobes.h
+++ b/arch/powerpc/include/asm/uprobes.h
@@ -15,7 +15,7 @@
 
 typedef ppc_opcode_t uprobe_opcode_t;
 
-#define MAX_UINSN_BYTES		4
+#define MAX_UINSN_BYTES		8
 #define UPROBE_XOL_SLOT_BYTES	(MAX_UINSN_BYTES)
 
 /* The following alias is needed for reference from arch-agnostic code */
diff --git a/arch/powerpc/kernel/optprobes.c b/arch/powerpc/kernel/optprobes.c
index d704f9598f48..a67c5288cf50 100644
--- a/arch/powerpc/kernel/optprobes.c
+++ b/arch/powerpc/kernel/optprobes.c
@@ -159,38 +159,38 @@ void patch_imm32_load_insns(unsigned int val, kprobe_opcode_t *addr)
 
 /*
  * Generate instructions to load provided immediate 64-bit value
- * to register 'r3' and patch these instructions at 'addr'.
+ * to register 'reg' and patch these instructions at 'addr'.
  */
-void patch_imm64_load_insns(unsigned long val, kprobe_opcode_t *addr)
+void patch_imm64_load_insns(unsigned long val, int reg, kprobe_opcode_t *addr)
 {
-	/* lis r3,(op)@highest */
-	patch_instruction((struct ppc_inst *)addr, ppc_inst(PPC_INST_ADDIS | ___PPC_RT(3) |
+	/* lis reg,(op)@highest */
+	patch_instruction((struct ppc_inst *)addr, ppc_inst(PPC_INST_ADDIS | ___PPC_RT(reg) |
 			  ((val >> 48) & 0xffff)));
 	addr++;
 
-	/* ori r3,r3,(op)@higher */
-	patch_instruction((struct ppc_inst *)addr, ppc_inst(PPC_INST_ORI | ___PPC_RA(3) |
-			  ___PPC_RS(3) | ((val >> 32) & 0xffff)));
+	/* ori reg,reg,(op)@higher */
+	patch_instruction((struct ppc_inst *)addr, ppc_inst(PPC_INST_ORI | ___PPC_RA(reg) |
+			  ___PPC_RS(reg) | ((val >> 32) & 0xffff)));
 	addr++;
 
-	/* rldicr r3,r3,32,31 */
-	patch_instruction((struct ppc_inst *)addr, ppc_inst(PPC_INST_RLDICR | ___PPC_RA(3) |
-			  ___PPC_RS(3) | __PPC_SH64(32) | __PPC_ME64(31)));
+	/* rldicr reg,reg,32,31 */
+	patch_instruction((struct ppc_inst *)addr, ppc_inst(PPC_INST_RLDICR | ___PPC_RA(reg) |
+			  ___PPC_RS(reg) | __PPC_SH64(32) | __PPC_ME64(31)));
 	addr++;
 
-	/* oris r3,r3,(op)@h */
-	patch_instruction((struct ppc_inst *)addr, ppc_inst(PPC_INST_ORIS | ___PPC_RA(3) |
-			  ___PPC_RS(3) | ((val >> 16) & 0xffff)));
+	/* oris reg,reg,(op)@h */
+	patch_instruction((struct ppc_inst *)addr, ppc_inst(PPC_INST_ORIS | ___PPC_RA(reg) |
+			  ___PPC_RS(reg) | ((val >> 16) & 0xffff)));
 	addr++;
 
-	/* ori r3,r3,(op)@l */
-	patch_instruction((struct ppc_inst *)addr, ppc_inst(PPC_INST_ORI | ___PPC_RA(3) |
-			  ___PPC_RS(3) | (val & 0xffff)));
+	/* ori reg,reg,(op)@l */
+	patch_instruction((struct ppc_inst *)addr, ppc_inst(PPC_INST_ORI | ___PPC_RA(reg) |
+			  ___PPC_RS(reg) | (val & 0xffff)));
 }
 
 int arch_prepare_optimized_kprobe(struct optimized_kprobe *op, struct kprobe *p)
 {
-	struct ppc_inst branch_op_callback, branch_emulate_step;
+	struct ppc_inst branch_op_callback, branch_emulate_step, temp;
 	kprobe_opcode_t *op_callback_addr, *emulate_step_addr, *buff;
 	long b_offset;
 	unsigned long nip, size;
@@ -240,7 +240,7 @@ int arch_prepare_optimized_kprobe(struct optimized_kprobe *op, struct kprobe *p)
 	 * Fixup the template with instructions to:
 	 * 1. load the address of the actual probepoint
 	 */
-	patch_imm64_load_insns((unsigned long)op, buff + TMPL_OP_IDX);
+	patch_imm64_load_insns((unsigned long)op, 3, buff + TMPL_OP_IDX);
 
 	/*
 	 * 2. branch to optimized_callback() and emulate_step()
@@ -271,7 +271,11 @@ int arch_prepare_optimized_kprobe(struct optimized_kprobe *op, struct kprobe *p)
 	/*
 	 * 3. load instruction to be emulated into relevant register, and
 	 */
-	patch_imm32_load_insns(*p->ainsn.insn, buff + TMPL_INSN_IDX);
+	temp = ppc_inst_read((struct ppc_inst *)p->ainsn.insn);
+	patch_imm64_load_insns(ppc_inst_val(temp) |
+			       ((u64)ppc_inst_suffix(temp) << 32),
+			       4,
+			       buff + TMPL_INSN_IDX);
 
 	/*
 	 * 4. branch back from trampoline
diff --git a/arch/powerpc/kernel/optprobes_head.S b/arch/powerpc/kernel/optprobes_head.S
index cf383520843f..ff8ba4d3824d 100644
--- a/arch/powerpc/kernel/optprobes_head.S
+++ b/arch/powerpc/kernel/optprobes_head.S
@@ -94,6 +94,9 @@ optprobe_template_insn:
 	/* 2, Pass instruction to be emulated in r4 */
 	nop
 	nop
+	nop
+	nop
+	nop
 
 	.global optprobe_template_call_emulate
 optprobe_template_call_emulate:
diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index 5b2f66d06b1e..b32fa707725e 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -24,13 +24,18 @@ static int __patch_instruction(struct ppc_inst *exec_addr, struct ppc_inst instr
 {
 	int err = 0;
 
-	__put_user_asm(ppc_inst_val(instr), patch_addr, err, "stw");
-	if (err)
-		return err;
+	if (!ppc_inst_prefixed(instr)) {
+		__put_user_asm(ppc_inst_val(instr), patch_addr, err, "stw");
+		if (err)
+			return err;
+	} else {
+		__put_user_asm((u64)ppc_inst_suffix(instr) << 32 | ppc_inst_val(instr), patch_addr, err, "std");
+		if (err)
+			return err;
+	}
 
 	asm ("dcbst 0, %0; sync; icbi 0,%1; sync; isync" :: "r" (patch_addr),
 							    "r" (exec_addr));
-
 	return 0;
 }
 
diff --git a/arch/powerpc/lib/feature-fixups.c b/arch/powerpc/lib/feature-fixups.c
index f4845e740338..243011f85287 100644
--- a/arch/powerpc/lib/feature-fixups.c
+++ b/arch/powerpc/lib/feature-fixups.c
@@ -84,12 +84,13 @@ static int patch_feature_section(unsigned long value, struct fixup_entry *fcur)
 	src = alt_start;
 	dest = start;
 
-	for (; src < alt_end; src++, dest++) {
+	for (; src < alt_end; src = (void *)src + ppc_inst_len(ppc_inst_read(src)),
+	     (dest = (void *)dest + ppc_inst_len(ppc_inst_read(dest)))) {
 		if (patch_alt_instruction(src, dest, alt_start, alt_end))
 			return 1;
 	}
 
-	for (; dest < end; dest++)
+	for (; dest < end; dest = (void *)dest + ppc_inst_len(ppc_inst(PPC_INST_NOP)))
 		raw_patch_instruction(dest, ppc_inst(PPC_INST_NOP));
 
 	return 0;
diff --git a/arch/powerpc/lib/inst.c b/arch/powerpc/lib/inst.c
index 08dedd927268..71101791edcc 100644
--- a/arch/powerpc/lib/inst.c
+++ b/arch/powerpc/lib/inst.c
@@ -6,6 +6,45 @@
 #include <linux/uaccess.h>
 #include <asm/inst.h>
 
+#ifdef __powerpc64__
+int probe_user_read_inst(struct ppc_inst *inst,
+			 struct ppc_inst *nip)
+{
+	unsigned int val, suffix;
+	int err;
+
+	err = probe_user_read(&val, nip, sizeof(val));
+	if (err)
+		return err;
+	if ((val >> 26) == 1) {
+		err = probe_user_read(&suffix, (void *)nip+4,
+				      sizeof(unsigned int));
+		*inst = ppc_inst_prefix(val, suffix);
+	} else {
+		*inst = ppc_inst(val);
+	}
+	return err;
+}
+
+int probe_kernel_read_inst(struct ppc_inst *inst,
+			   struct ppc_inst *src)
+{
+	unsigned int val, suffix;
+	int err;
+
+	err = probe_kernel_read(&val, src, sizeof(val));
+	if (err)
+		return err;
+	if ((val >> 26) == 1) {
+		err = probe_kernel_read(&suffix, (void *)src+4,
+				      sizeof(unsigned int));
+		*inst = ppc_inst_prefix(val, suffix);
+	} else {
+		*inst = ppc_inst(val);
+	}
+	return err;
+}
+#else
 int probe_user_read_inst(struct ppc_inst *inst,
 			 struct ppc_inst *nip)
 {
@@ -27,3 +66,4 @@ int probe_kernel_read_inst(struct ppc_inst *inst,
 	*inst = ppc_inst(val);
 	return err;
 }
+#endif /* __powerpc64__ */
diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index 95a56bb1ba3f..ecd756c346fd 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -1169,10 +1169,12 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 	unsigned long int imm;
 	unsigned long int val, val2;
 	unsigned int mb, me, sh;
-	unsigned int word;
+	unsigned int word, suffix;
 	long ival;
 
 	word = ppc_inst_val(instr);
+	suffix = ppc_inst_suffix(instr);
+
 	op->type = COMPUTE;
 
 	opcode = ppc_inst_primary_opcode(instr);
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index fb2563079046..1d6e66eb2dab 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -758,8 +758,8 @@ static int xmon_bpt(struct pt_regs *regs)
 
 	/* Are we at the trap at bp->instr[1] for some bp? */
 	bp = in_breakpoint_table(regs->nip, &offset);
-	if (bp != NULL && offset == 4) {
-		regs->nip = bp->address + 4;
+	if (bp != NULL && (offset == 4 || offset == 8)) {
+		regs->nip = bp->address + offset;
 		atomic_dec(&bp->ref_count);
 		return 1;
 	}
diff --git a/arch/powerpc/xmon/xmon_bpts.S b/arch/powerpc/xmon/xmon_bpts.S
index f3ad0ab50854..69726814cd27 100644
--- a/arch/powerpc/xmon/xmon_bpts.S
+++ b/arch/powerpc/xmon/xmon_bpts.S
@@ -4,6 +4,8 @@
 #include <asm/asm-offsets.h>
 #include "xmon_bpts.h"
 
+/* Prefixed instructions can not cross 64 byte boundaries */
+.align 6
 .global bpt_table
 bpt_table:
 	.space NBPTS * BPT_SIZE
-- 
2.17.1

