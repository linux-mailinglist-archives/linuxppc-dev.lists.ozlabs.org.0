Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 766E51C66EF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 06:26:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49H3SQ2nPYzDrRL
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 14:26:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e;
 helo=mail-pj1-x102e.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=eiT+vJJE; dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49H2cV1GplzDqpL
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 May 2020 13:48:10 +1000 (AEST)
Received: by mail-pj1-x102e.google.com with SMTP id hi11so210186pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 May 2020 20:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=jQduyZWReak/BWjeTGZrjL19hrqAl8laW58YSiGSCFk=;
 b=eiT+vJJELhmCYt4im6o77Fv8PFaxgyh0fZAgVcJlPe1EekT3Rg/huUsB1M5MYcNWdk
 cq+wyFzPl2mCYbmSnqXUAiWU8xEJbDQLxEmCPO5GIhkkUq3KAxTFz9bpAvHCy/qR6LUT
 m+AS505L2B18lIGdYxr8pskwKHa/quWiKgmeF2BltTHUQoxiYGzIqeBO8tB9oQrCurnA
 wYsBCvJzz2D6pkDK5JBMSIZBjDGTjDtWr/slOz8+oBxukymPVRU9ewNskgk4bXFAc/kw
 WbfA210WtGahiQcApvAo1W2vbZESkCoA2TG5itBRfJx6dBLw/urVBXT0inp4iQIbQBkS
 S7Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=jQduyZWReak/BWjeTGZrjL19hrqAl8laW58YSiGSCFk=;
 b=JEH1z/tuk8nLitO5wXDHZNJIel73QP2TeuBlQun7OIGsRmcGYwikyjLsHcavi9Tm4a
 myudrj7MqwlihleTpOMAIm69EBqJJZXcZCtexLJFgjXEQbt0ImCcVBcdvDqDoS1TZ6Bo
 7eTKP3FgHWJXT1ScN+5Reg/Ap/7d5dVYT10ycQSuLb0PEjhVDYYyIAVIADUY6TppT05t
 uen2f5bg8LKU/e06LDrzDZA7gXrKduOMCIm1L0kOxW0McrSXY84ZkrChzUmENPdzcflO
 eagTNLI0zbOr4SHl10y4Ve+sVXBwueuK/+jHR5LzyaVmVc4kTPZPZtb7L4bescYUAvk0
 qEJQ==
X-Gm-Message-State: AGi0PuZ0JCjgpZ/1A5OgGwytnKYMrllbhDrIWe4XK+vSimktrdP0RrQh
 fQfmzUlAm+F9Ug9NarEICkim3b1dDThu7A==
X-Google-Smtp-Source: APiQypItrbvHLgwI77C7lhfgfE8vqyCJ/Sd+CV4Dwu37KwUmAeuc8UjTCOgA6g44yuOigMRkiiD/mg==
X-Received: by 2002:a17:902:d216:: with SMTP id
 t22mr5877146ply.186.1588736886235; 
 Tue, 05 May 2020 20:48:06 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id k4sm465676pgg.88.2020.05.05.20.47.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2020 20:48:05 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v8 23/30] powerpc: Add prefixed instructions to instruction
 data type
Date: Wed,  6 May 2020 13:40:43 +1000
Message-Id: <20200506034050.24806-24-jniethe5@gmail.com>
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

For powerpc64, redefine the ppc_inst type so both word and prefixed
instructions can be represented. On powerpc32 the type will remain the
same.  Update places which had assumed instructions to be 4 bytes long.

Reviewed-by: Alistair Popple <alistair@popple.id.au>
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
v8:  - style
     - Define and use OP_PREFIX instead of '1' (back from v3)
     - __patch_instruction() fix for big endian
---
 arch/powerpc/include/asm/inst.h       | 69 ++++++++++++++++++++++++---
 arch/powerpc/include/asm/kprobes.h    |  2 +-
 arch/powerpc/include/asm/ppc-opcode.h |  3 ++
 arch/powerpc/include/asm/uaccess.h    | 40 +++++++++++++++-
 arch/powerpc/include/asm/uprobes.h    |  2 +-
 arch/powerpc/kernel/crash_dump.c      |  2 +-
 arch/powerpc/kernel/optprobes.c       | 42 ++++++++--------
 arch/powerpc/kernel/optprobes_head.S  |  3 ++
 arch/powerpc/lib/code-patching.c      | 19 ++++++--
 arch/powerpc/lib/feature-fixups.c     |  5 +-
 arch/powerpc/lib/inst.c               | 41 ++++++++++++++++
 arch/powerpc/lib/sstep.c              |  4 +-
 arch/powerpc/xmon/xmon.c              |  4 +-
 arch/powerpc/xmon/xmon_bpts.S         |  2 +
 14 files changed, 200 insertions(+), 38 deletions(-)

diff --git a/arch/powerpc/include/asm/inst.h b/arch/powerpc/include/asm/inst.h
index 2f3c9d5bcf7c..7868b80b610e 100644
--- a/arch/powerpc/include/asm/inst.h
+++ b/arch/powerpc/include/asm/inst.h
@@ -2,29 +2,79 @@
 #ifndef _ASM_INST_H
 #define _ASM_INST_H
 
+#include <asm/ppc-opcode.h>
 /*
  * Instruction data type for POWER
  */
 
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
@@ -42,6 +92,13 @@ static inline bool ppc_inst_equal(struct ppc_inst x, struct ppc_inst y)
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
diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/asm/ppc-opcode.h
index c1df75edde44..2a39c716c343 100644
--- a/arch/powerpc/include/asm/ppc-opcode.h
+++ b/arch/powerpc/include/asm/ppc-opcode.h
@@ -158,6 +158,9 @@
 /* VMX Vector Store Instructions */
 #define OP_31_XOP_STVX          231
 
+/* Prefixed Instructions */
+#define OP_PREFIX		1
+
 #define OP_31   31
 #define OP_LWZ  32
 #define OP_STFS 52
diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index c0a35e4586a5..217897927926 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -105,11 +105,49 @@ static inline int __access_ok(unsigned long addr, unsigned long size,
 #define __put_user_inatomic(x, ptr) \
 	__put_user_nosleep((__typeof__(*(ptr)))(x), (ptr), sizeof(*(ptr)))
 
+#ifdef __powerpc64__
+#define __get_user_instr(x, ptr)			\
+({							\
+	long __gui_ret = 0;				\
+	unsigned long __gui_ptr = (unsigned long)ptr;	\
+	struct ppc_inst __gui_inst;			\
+	unsigned int prefix, suffix;			\
+	__gui_ret = __get_user(prefix, (unsigned int __user *)__gui_ptr);	\
+	if (!__gui_ret && (prefix >> 26) == OP_PREFIX) {	\
+		__gui_ret = __get_user(suffix,		\
+				       (unsigned int __user *)__gui_ptr + 1);	\
+		__gui_inst = ppc_inst_prefix(prefix, suffix);	\
+	} else {					\
+		__gui_inst = ppc_inst(prefix);		\
+	}						\
+	(x) = __gui_inst;				\
+	__gui_ret;					\
+})
+
+#define __get_user_instr_inatomic(x, ptr)		\
+({							\
+	long __gui_ret = 0;				\
+	unsigned long __gui_ptr = (unsigned long)ptr;	\
+	struct ppc_inst __gui_inst;			\
+	unsigned int prefix, suffix;			\
+	__gui_ret = __get_user_inatomic(prefix, (unsigned int __user *)__gui_ptr);	\
+	if (!__gui_ret && (prefix >> 26) == OP_PREFIX) {	\
+		__gui_ret = __get_user_inatomic(suffix,	\
+						(unsigned int __user *)__gui_ptr + 1);	\
+		__gui_inst = ppc_inst_prefix(prefix, suffix);	\
+	} else {					\
+		__gui_inst = ppc_inst(prefix);		\
+	}						\
+	(x) = __gui_inst;				\
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
diff --git a/arch/powerpc/kernel/crash_dump.c b/arch/powerpc/kernel/crash_dump.c
index 72bafb47e757..735e89337398 100644
--- a/arch/powerpc/kernel/crash_dump.c
+++ b/arch/powerpc/kernel/crash_dump.c
@@ -46,7 +46,7 @@ static void __init create_trampoline(unsigned long addr)
 	 * two instructions it doesn't require any registers.
 	 */
 	patch_instruction(p, ppc_inst(PPC_INST_NOP));
-	patch_branch(++p, addr + PHYSICAL_START, 0);
+	patch_branch((void *)p + 4, addr + PHYSICAL_START, 0);
 }
 
 void __init setup_kdump_trampoline(void)
diff --git a/arch/powerpc/kernel/optprobes.c b/arch/powerpc/kernel/optprobes.c
index 52c1ab3f85aa..a8e66603d12b 100644
--- a/arch/powerpc/kernel/optprobes.c
+++ b/arch/powerpc/kernel/optprobes.c
@@ -162,43 +162,43 @@ void patch_imm32_load_insns(unsigned int val, kprobe_opcode_t *addr)
 
 /*
  * Generate instructions to load provided immediate 64-bit value
- * to register 'r3' and patch these instructions at 'addr'.
+ * to register 'reg' and patch these instructions at 'addr'.
  */
-void patch_imm64_load_insns(unsigned long val, kprobe_opcode_t *addr)
+void patch_imm64_load_insns(unsigned long val, int reg, kprobe_opcode_t *addr)
 {
-	/* lis r3,(op)@highest */
+	/* lis reg,(op)@highest */
 	patch_instruction((struct ppc_inst *)addr,
-			  ppc_inst(PPC_INST_ADDIS | ___PPC_RT(3) |
+			  ppc_inst(PPC_INST_ADDIS | ___PPC_RT(reg) |
 				   ((val >> 48) & 0xffff)));
 	addr++;
 
-	/* ori r3,r3,(op)@higher */
+	/* ori reg,reg,(op)@higher */
 	patch_instruction((struct ppc_inst *)addr,
-			  ppc_inst(PPC_INST_ORI | ___PPC_RA(3) |
-				   ___PPC_RS(3) | ((val >> 32) & 0xffff)));
+			  ppc_inst(PPC_INST_ORI | ___PPC_RA(reg) |
+				   ___PPC_RS(reg) | ((val >> 32) & 0xffff)));
 	addr++;
 
-	/* rldicr r3,r3,32,31 */
+	/* rldicr reg,reg,32,31 */
 	patch_instruction((struct ppc_inst *)addr,
-			  ppc_inst(PPC_INST_RLDICR | ___PPC_RA(3) |
-				   ___PPC_RS(3) | __PPC_SH64(32) | __PPC_ME64(31)));
+			  ppc_inst(PPC_INST_RLDICR | ___PPC_RA(reg) |
+				   ___PPC_RS(reg) | __PPC_SH64(32) | __PPC_ME64(31)));
 	addr++;
 
-	/* oris r3,r3,(op)@h */
+	/* oris reg,reg,(op)@h */
 	patch_instruction((struct ppc_inst *)addr,
-			  ppc_inst(PPC_INST_ORIS | ___PPC_RA(3) |
-				   ___PPC_RS(3) | ((val >> 16) & 0xffff)));
+			  ppc_inst(PPC_INST_ORIS | ___PPC_RA(reg) |
+				   ___PPC_RS(reg) | ((val >> 16) & 0xffff)));
 	addr++;
 
-	/* ori r3,r3,(op)@l */
+	/* ori reg,reg,(op)@l */
 	patch_instruction((struct ppc_inst *)addr,
-			  ppc_inst(PPC_INST_ORI | ___PPC_RA(3) |
-				   ___PPC_RS(3) | (val & 0xffff)));
+			  ppc_inst(PPC_INST_ORI | ___PPC_RA(reg) |
+				   ___PPC_RS(reg) | (val & 0xffff)));
 }
 
 int arch_prepare_optimized_kprobe(struct optimized_kprobe *op, struct kprobe *p)
 {
-	struct ppc_inst branch_op_callback, branch_emulate_step;
+	struct ppc_inst branch_op_callback, branch_emulate_step, temp;
 	kprobe_opcode_t *op_callback_addr, *emulate_step_addr, *buff;
 	long b_offset;
 	unsigned long nip, size;
@@ -249,7 +249,7 @@ int arch_prepare_optimized_kprobe(struct optimized_kprobe *op, struct kprobe *p)
 	 * Fixup the template with instructions to:
 	 * 1. load the address of the actual probepoint
 	 */
-	patch_imm64_load_insns((unsigned long)op, buff + TMPL_OP_IDX);
+	patch_imm64_load_insns((unsigned long)op, 3, buff + TMPL_OP_IDX);
 
 	/*
 	 * 2. branch to optimized_callback() and emulate_step()
@@ -282,7 +282,11 @@ int arch_prepare_optimized_kprobe(struct optimized_kprobe *op, struct kprobe *p)
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
index d946f7d6bb32..58b67b62d5d3 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -24,13 +24,24 @@ static int __patch_instruction(struct ppc_inst *exec_addr, struct ppc_inst instr
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
+#ifdef CONFIG_CPU_LITTLE_ENDIAN
+		__put_user_asm((u64)ppc_inst_suffix(instr) << 32 |
+			       ppc_inst_val(instr), patch_addr, err, "std");
+#else
+		__put_user_asm((u64)ppc_inst_val(instr) << 32 |
+			       ppc_inst_suffix(instr), patch_addr, err, "std");
+#endif /* CONFIG_CPU_LITTLE_ENDIAN */
+		if (err)
+			return err;
+	}
 
 	asm ("dcbst 0, %0; sync; icbi 0,%1; sync; isync" :: "r" (patch_addr),
 							    "r" (exec_addr));
-
 	return 0;
 }
 
diff --git a/arch/powerpc/lib/feature-fixups.c b/arch/powerpc/lib/feature-fixups.c
index 2bd2b752de4f..a8238eff3a31 100644
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
index 08dedd927268..eb6f9ee28ac6 100644
--- a/arch/powerpc/lib/inst.c
+++ b/arch/powerpc/lib/inst.c
@@ -3,9 +3,49 @@
  *  Copyright 2020, IBM Corporation.
  */
 
+#include <asm/ppc-opcode.h>
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
+	if ((val >> 26) == OP_PREFIX) {
+		err = probe_user_read(&suffix, (void *)nip + 4,
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
+	if ((val >> 26) == OP_PREFIX) {
+		err = probe_kernel_read(&suffix, (void *)src + 4,
+					sizeof(unsigned int));
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
@@ -27,3 +67,4 @@ int probe_kernel_read_inst(struct ppc_inst *inst,
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
index 4d6980d51456..647b3829c4eb 100644
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

