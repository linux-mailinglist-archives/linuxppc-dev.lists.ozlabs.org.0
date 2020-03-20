Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A1218C732
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 06:44:57 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48kCQt6hwKzDrRL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 16:44:54 +1100 (AEDT)
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
 header.s=20161025 header.b=MovF7N+w; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48kBst2dZkzDrS2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 16:19:46 +1100 (AEDT)
Received: by mail-pl1-x644.google.com with SMTP id h11so2009407plr.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 22:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=elVhSeM7Rq7+/taveabK8kDZfKJLto7i3lUZ5L8caIE=;
 b=MovF7N+wj52ncNukz5OlHTxAVOcFiNkMaXFuDtnpTdu2SqqWG3+ZkU+gTzKCxFC4l8
 /6524CObus712hSAJv7WdF9NZLpLpS3DkIYwMzU0kzgI31ZcT9p00EjaEljGO+ZdN5Fd
 7PUFIKqH0paw5Af3sFn3Lzm78Y2NbaQ8JCre4ufM5GupL7p9hZOKHPNmopP6VzRdN9gk
 Vcykdeah1Brp7vjKa/ddwsCJQvzaR/X7uKqo9HsQS+4wmTmLpWksdsu/+wXks6r2AFf/
 qWJqvqTHzyZkGlY6Jagh0UD1pSv/7aZ6/vmxVO9f5Mv0H/PoYOznnQXLBNAIWocqU1uX
 nQbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=elVhSeM7Rq7+/taveabK8kDZfKJLto7i3lUZ5L8caIE=;
 b=ipiIJnRFUNLV6sJ0Zd4sd02WJzVrdT0pX5k2clKPMf1l2qOb3GjHxA1XMUPlPDHCmz
 Rgb0KSYQBw10WxV1hEWJSdH4dENSR4NbsAvIWFjUZVU3EHUIg/oAhGzUFoWIB9VGKwau
 pVb9nPiwSBFeLdFvjoUbJoY7ssUqVWVE4jBS+bLvkKNj8gbU79YA1ETRI/OBgXeAGiEp
 FzAVtYa8cJ+df/VNwx82xBpaHiBTusKjuOx4BBwoLLF2Jkr64raHG9zsd9mtK32XgOzi
 5OMH+0C9OBIdoAPeVav5Vtk9Lfg+aKZAYrW7WuhnncCAvChdZ5/vg8yc6HZCWiO3DlYP
 kUxA==
X-Gm-Message-State: ANhLgQ3XT85TV6i7iXHs76glNklqk/k5z4af1vSN+id17ikh+tHf+/vy
 zr3o4WXoz1mdbynZfc8Xb6ZJcYHxl78=
X-Google-Smtp-Source: ADFU+vthPeHueF19wH9nxRK5A+zXc5Lh0Fn/ROPYSdo9YFmubA6fhLUhpbqUyENCtUev1wZHy1OqqA==
X-Received: by 2002:a17:90a:d156:: with SMTP id
 t22mr7421433pjw.138.1584681583142; 
 Thu, 19 Mar 2020 22:19:43 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id c207sm3988716pfb.47.2020.03.19.22.19.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2020 22:19:42 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 14/16] powerpc64: Add prefixed instructions to instruction
 data type
Date: Fri, 20 Mar 2020 16:18:07 +1100
Message-Id: <20200320051809.24332-15-jniethe5@gmail.com>
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

For powerpc64, redefine the ppc_inst type so both word and prefixed
instructions can be represented. On powerpc32 the type will remain the
same.  Update places which had assumed instructions to be 4 bytes long.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v4: New to series
---
 arch/powerpc/include/asm/code-patching.h | 10 +--
 arch/powerpc/include/asm/inst.h          | 90 ++++++++++++++++++++++++
 arch/powerpc/include/asm/kprobes.h       |  2 +-
 arch/powerpc/include/asm/sstep.h         |  4 ++
 arch/powerpc/include/asm/uaccess.h       | 22 ++++++
 arch/powerpc/include/asm/uprobes.h       |  2 +-
 arch/powerpc/kernel/align.c              |  5 +-
 arch/powerpc/kernel/hw_breakpoint.c      |  2 +-
 arch/powerpc/kernel/kprobes.c            |  7 +-
 arch/powerpc/kernel/optprobes.c          | 42 ++++++-----
 arch/powerpc/kernel/optprobes_head.S     |  3 +
 arch/powerpc/kernel/trace/ftrace.c       | 19 ++++-
 arch/powerpc/kernel/uprobes.c            |  2 +-
 arch/powerpc/lib/code-patching.c         | 22 ++++--
 arch/powerpc/lib/sstep.c                 |  4 +-
 arch/powerpc/xmon/xmon.c                 | 38 +++++++---
 16 files changed, 221 insertions(+), 53 deletions(-)

diff --git a/arch/powerpc/include/asm/code-patching.h b/arch/powerpc/include/asm/code-patching.h
index 68bd9db334bd..bd41e1558707 100644
--- a/arch/powerpc/include/asm/code-patching.h
+++ b/arch/powerpc/include/asm/code-patching.h
@@ -25,11 +25,11 @@
 bool is_offset_in_branch_range(long offset);
 ppc_inst create_branch(const ppc_inst *addr,
 			   unsigned long target, int flags);
-unsigned int create_cond_branch(const ppc_inst *addr,
+ppc_inst create_cond_branch(const void *addr,
 				unsigned long target, int flags);
-int patch_branch(ppc_inst *addr, unsigned long target, int flags);
-int patch_instruction(ppc_inst *addr, ppc_inst instr);
-int raw_patch_instruction(ppc_inst *addr, ppc_inst instr);
+int patch_branch(void *addr, unsigned long target, int flags);
+int patch_instruction(void *addr, ppc_inst instr);
+int raw_patch_instruction(void *addr, ppc_inst instr);
 
 static inline unsigned long patch_site_addr(s32 *site)
 {
@@ -60,7 +60,7 @@ static inline int modify_instruction_site(s32 *site, unsigned int clr, unsigned
 int instr_is_relative_branch(ppc_inst instr);
 int instr_is_relative_link_branch(ppc_inst instr);
 int instr_is_branch_to_addr(const ppc_inst *instr, unsigned long addr);
-unsigned long branch_target(const ppc_inst *instr);
+unsigned long branch_target(const void *instr);
 ppc_inst translate_branch(const ppc_inst *dest,
 			      const ppc_inst *src);
 extern bool is_conditional_branch(ppc_inst instr);
diff --git a/arch/powerpc/include/asm/inst.h b/arch/powerpc/include/asm/inst.h
index 7c8596ee411e..1a40b0a71128 100644
--- a/arch/powerpc/include/asm/inst.h
+++ b/arch/powerpc/include/asm/inst.h
@@ -6,6 +6,95 @@
  * Instruction data type for POWER
  */
 
+#ifdef __powerpc64__
+
+typedef struct ppc_inst {
+	union {
+		struct {
+			u32 word;
+			u32 pad;
+		} __packed;
+		struct {
+			u32 prefix;
+			u32 suffix;
+		} __packed;
+	};
+} ppc_inst;
+
+#define PPC_INST(x) ((ppc_inst) { .word = (x), .pad = 0 })
+#define PPC_INST_PREFIXED(x, y) ((ppc_inst) { .prefix = (x), .suffix = (y) })
+
+static inline int ppc_inst_opcode(ppc_inst x)
+{
+	return x.word >> 26;
+}
+
+static inline bool ppc_inst_prefixed(ppc_inst x) {
+	return ppc_inst_opcode(x) == 1;
+}
+
+static inline int ppc_inst_len(ppc_inst x)
+{
+	if (ppc_inst_prefixed(x))
+		return 8;
+	else
+		return 4;
+}
+
+static inline u32 ppc_inst_word(ppc_inst x)
+{
+	return x.word;
+}
+
+static inline u32 ppc_inst_prefix(ppc_inst x)
+{
+	return x.prefix;
+}
+
+static inline u32 ppc_inst_suffix(ppc_inst x)
+{
+	return x.suffix;
+}
+
+
+static inline ppc_inst ppc_inst_read(const void *ptr)
+{
+	ppc_inst inst;
+	inst.word = *(u32 *)ptr;
+	if (ppc_inst_prefixed(inst))
+		inst.suffix = *((u32 *)ptr + 1);
+	else
+		inst.pad = 0;
+	return inst;
+}
+
+static inline void ppc_inst_write(ppc_inst *ptr, ppc_inst x)
+{
+	if (ppc_inst_prefixed(x)) {
+		*(u32 *)ptr = x.prefix;
+		*((u32 *)ptr + 1) = x.suffix;
+	} else {
+		*(u32 *)ptr = x.word;
+	}
+}
+
+static inline bool ppc_inst_equal(ppc_inst x, ppc_inst y)
+{
+	return !memcmp(&x, &y, sizeof(struct ppc_inst));
+}
+
+static inline bool ppc_inst_null(ppc_inst x)
+{
+	return x.word == 0 && x.pad == 0;
+}
+
+static inline u32 ppc_inst_mask(ppc_inst x, u32 mask)
+{
+	return ppc_inst_word(x) & mask;
+}
+
+#else /* !__powerpc64__ */
+
 typedef u32 ppc_inst;
 
 #define PPC_INST(x) (x)
@@ -50,4 +139,5 @@ static inline u32 ppc_inst_mask(ppc_inst x, u32 mask)
 	return ppc_inst_word(x) & mask;
 }
 
+#endif /* __powerpc64__ */
 #endif /* _ASM_INST_H */
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
diff --git a/arch/powerpc/include/asm/sstep.h b/arch/powerpc/include/asm/sstep.h
index ef5483288920..5eb825fb77cd 100644
--- a/arch/powerpc/include/asm/sstep.h
+++ b/arch/powerpc/include/asm/sstep.h
@@ -90,11 +90,15 @@ enum instruction_type {
 #define VSX_LDLEFT	4	/* load VSX register from left */
 #define VSX_CHECK_VEC	8	/* check MSR_VEC not MSR_VSX for reg >= 32 */
 
+/* Prefixed flag, ORed in with type */
+#define PREFIXED       0x800
+
 /* Size field in type word */
 #define SIZE(n)		((n) << 12)
 #define GETSIZE(w)	((w) >> 12)
 
 #define GETTYPE(t)	((t) & INSTR_TYPE_MASK)
+#define GETLENGTH(t)   (((t) & PREFIXED) ? 8 : 4)
 
 #define MKOP(t, f, s)	((t) | (f) | SIZE(s))
 
diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index 2f500debae21..dee4fa1cd3ec 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -105,6 +105,28 @@ static inline int __access_ok(unsigned long addr, unsigned long size,
 #define __put_user_inatomic(x, ptr) \
 	__put_user_nosleep((__typeof__(*(ptr)))(x), (ptr), sizeof(*(ptr)))
 
+/*
+ * When reading an instruction iff it is a prefix, the suffix needs to be also
+ * loaded.
+ */
+#define __get_user_instr(x, ptr)			\
+({							\
+	long __gui_ret = 0;				\
+	__gui_ret = __get_user(x.prefix, (unsigned int __user *)ptr);		\
+	if (!__gui_ret && ppc_inst_prefixed(x))		\
+		__gui_ret = __get_user(x.suffix, (unsigned int __user *)ptr + 1);	\
+	__gui_ret;					\
+})
+
+#define __get_user_instr_inatomic(x, ptr)		\
+({							\
+	long __gui_ret = 0;				\
+	__gui_ret = __get_user_inatomic(x.prefix, (unsigned int __user *)ptr);		\
+	if (!__gui_ret && ppc_inst_prefixed(x))		\
+		__gui_ret = __get_user_inatomic(x.suffix, (unsigned int __user *)ptr + 1);	\
+	__gui_ret;					\
+})
+
 extern long __put_user_bad(void);
 
 /*
diff --git a/arch/powerpc/include/asm/uprobes.h b/arch/powerpc/include/asm/uprobes.h
index fff3c5fc90b5..7896a7125fa9 100644
--- a/arch/powerpc/include/asm/uprobes.h
+++ b/arch/powerpc/include/asm/uprobes.h
@@ -14,7 +14,7 @@
 
 typedef ppc_opcode_t uprobe_opcode_t;
 
-#define MAX_UINSN_BYTES		4
+#define MAX_UINSN_BYTES		8
 #define UPROBE_XOL_SLOT_BYTES	(MAX_UINSN_BYTES)
 
 /* The following alias is needed for reference from arch-agnostic code */
diff --git a/arch/powerpc/kernel/align.c b/arch/powerpc/kernel/align.c
index b246ca124931..110eadd85c58 100644
--- a/arch/powerpc/kernel/align.c
+++ b/arch/powerpc/kernel/align.c
@@ -303,13 +303,14 @@ int fix_alignment(struct pt_regs *regs)
 	 */
 	CHECK_FULL_REGS(regs);
 
-	if (unlikely(__get_user(instr, (unsigned int __user *)regs->nip)))
+	if (unlikely(__get_user_instr(instr, (void __user *)regs->nip)))
 		return -EFAULT;
 	if ((regs->msr & MSR_LE) != (MSR_KERNEL & MSR_LE)) {
 		/* We don't handle PPC little-endian any more... */
 		if (cpu_has_feature(CPU_FTR_PPC_LE))
 			return -EIO;
-		instr = PPC_INST(swab32(ppc_inst_word(instr)));
+		instr = PPC_INST_PREFIXED(swab32(ppc_inst_word(instr)),
+					  swab32(ppc_inst_suffix(instr)));
 	}
 
 #ifdef CONFIG_SPE
diff --git a/arch/powerpc/kernel/hw_breakpoint.c b/arch/powerpc/kernel/hw_breakpoint.c
index f001de471b98..212e0abfda43 100644
--- a/arch/powerpc/kernel/hw_breakpoint.c
+++ b/arch/powerpc/kernel/hw_breakpoint.c
@@ -249,7 +249,7 @@ static bool stepping_handler(struct pt_regs *regs, struct perf_event *bp,
 	struct instruction_op op;
 	unsigned long addr = info->address;
 
-	if (__get_user_inatomic(instr, (unsigned int *)regs->nip))
+	if (__get_user_instr_inatomic(instr, (void __user*)regs->nip))
 		goto fail;
 
 	ret = analyse_instr(&op, regs, instr);
diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
index f142d11d7b48..1a5370a3c7c8 100644
--- a/arch/powerpc/kernel/kprobes.c
+++ b/arch/powerpc/kernel/kprobes.c
@@ -153,7 +153,7 @@ NOKPROBE_SYMBOL(arch_arm_kprobe);
 
 void arch_disarm_kprobe(struct kprobe *p)
 {
-	patch_instruction(p->addr, PPC_INST(p->opcode));
+	patch_instruction(p->addr, ppc_inst_read(p->ainsn.insn));
 }
 NOKPROBE_SYMBOL(arch_disarm_kprobe);
 
@@ -487,12 +487,13 @@ int kprobe_post_handler(struct pt_regs *regs)
 {
 	struct kprobe *cur = kprobe_running();
 	struct kprobe_ctlblk *kcb = get_kprobe_ctlblk();
+	int len = ppc_inst_len(ppc_inst_read(cur->ainsn.insn));
 
 	if (!cur || user_mode(regs))
 		return 0;
 
 	/* make sure we got here for instruction we have a kprobe on */
-	if (((unsigned long)cur->ainsn.insn + 4) != regs->nip)
+	if ((unsigned long)cur->ainsn.insn + len != regs->nip)
 		return 0;
 
 	if ((kcb->kprobe_status != KPROBE_REENTER) && cur->post_handler) {
@@ -501,7 +502,7 @@ int kprobe_post_handler(struct pt_regs *regs)
 	}
 
 	/* Adjust nip to after the single-stepped instruction */
-	regs->nip = (unsigned long)cur->addr + 4;
+	regs->nip = (unsigned long)cur->addr + len;
 	regs->msr |= kcb->kprobe_saved_msr;
 
 	/*Restore back the original saved kprobes variables and continue. */
diff --git a/arch/powerpc/kernel/optprobes.c b/arch/powerpc/kernel/optprobes.c
index 5b53c373373b..af6761859fba 100644
--- a/arch/powerpc/kernel/optprobes.c
+++ b/arch/powerpc/kernel/optprobes.c
@@ -158,38 +158,38 @@ void patch_imm32_load_insns(unsigned int val, kprobe_opcode_t *addr)
 
 /*
  * Generate instructions to load provided immediate 64-bit value
- * to register 'r3' and patch these instructions at 'addr'.
+ * to register 'reg' and patch these instructions at 'addr'.
  */
-void patch_imm64_load_insns(unsigned long val, kprobe_opcode_t *addr)
+void patch_imm64_load_insns(unsigned long val, int reg, kprobe_opcode_t *addr)
 {
-	/* lis r3,(op)@highest */
-	patch_instruction(addr, PPC_INST(PPC_INST_ADDIS | ___PPC_RT(3) |
+	/* lis reg,(op)@highest */
+	patch_instruction(addr, PPC_INST(PPC_INST_ADDIS | ___PPC_RT(reg) |
 			  ((val >> 48) & 0xffff)));
 	addr++;
 
-	/* ori r3,r3,(op)@higher */
-	patch_instruction(addr, PPC_INST(PPC_INST_ORI | ___PPC_RA(3) |
-			  ___PPC_RS(3) | ((val >> 32) & 0xffff)));
+	/* ori reg,reg,(op)@higher */
+	patch_instruction(addr, PPC_INST(PPC_INST_ORI | ___PPC_RA(reg) |
+			  ___PPC_RS(reg) | ((val >> 32) & 0xffff)));
 	addr++;
 
-	/* rldicr r3,r3,32,31 */
-	patch_instruction(addr, PPC_INST(PPC_INST_RLDICR | ___PPC_RA(3) |
-			  ___PPC_RS(3) | __PPC_SH64(32) | __PPC_ME64(31)));
+	/* rldicr reg,reg,32,31 */
+	patch_instruction(addr, PPC_INST(PPC_INST_RLDICR | ___PPC_RA(reg) |
+			  ___PPC_RS(reg) | __PPC_SH64(32) | __PPC_ME64(31)));
 	addr++;
 
-	/* oris r3,r3,(op)@h */
-	patch_instruction(addr, PPC_INST(PPC_INST_ORIS | ___PPC_RA(3) |
-			  ___PPC_RS(3) | ((val >> 16) & 0xffff)));
+	/* oris reg,reg,(op)@h */
+	patch_instruction(addr, PPC_INST(PPC_INST_ORIS | ___PPC_RA(reg) |
+			  ___PPC_RS(reg) | ((val >> 16) & 0xffff)));
 	addr++;
 
-	/* ori r3,r3,(op)@l */
-	patch_instruction(addr, PPC_INST(PPC_INST_ORI | ___PPC_RA(3) |
-			  ___PPC_RS(3) | (val & 0xffff)));
+	/* ori reg,reg,(op)@l */
+	patch_instruction(addr, PPC_INST(PPC_INST_ORI | ___PPC_RA(reg) |
+			  ___PPC_RS(reg) | (val & 0xffff)));
 }
 
 int arch_prepare_optimized_kprobe(struct optimized_kprobe *op, struct kprobe *p)
 {
-	ppc_inst branch_op_callback, branch_emulate_step;
+	ppc_inst branch_op_callback, branch_emulate_step, temp;
 	kprobe_opcode_t *op_callback_addr, *emulate_step_addr, *buff;
 	long b_offset;
 	unsigned long nip, size;
@@ -239,7 +239,7 @@ int arch_prepare_optimized_kprobe(struct optimized_kprobe *op, struct kprobe *p)
 	 * Fixup the template with instructions to:
 	 * 1. load the address of the actual probepoint
 	 */
-	patch_imm64_load_insns((unsigned long)op, buff + TMPL_OP_IDX);
+	patch_imm64_load_insns((unsigned long)op, 3, buff + TMPL_OP_IDX);
 
 	/*
 	 * 2. branch to optimized_callback() and emulate_step()
@@ -268,7 +268,11 @@ int arch_prepare_optimized_kprobe(struct optimized_kprobe *op, struct kprobe *p)
 	/*
 	 * 3. load instruction to be emulated into relevant register, and
 	 */
-	patch_imm32_load_insns(*(unsigned int *)p->ainsn.insn, buff + TMPL_INSN_IDX);
+	temp = ppc_inst_read(p->ainsn.insn);
+	patch_imm64_load_insns(ppc_inst_word(temp) |
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
diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index ad451205f268..3b8655f57b4a 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -42,9 +42,24 @@
 static unsigned long ftrace_tramps[NUM_FTRACE_TRAMPS];
 
 static long
-read_inst(ppc_inst *inst, const void *src)
+read_inst(ppc_inst *p, const void *src)
 {
-	return probe_kernel_read((void *)inst, src, MCOUNT_INSN_SIZE);
+	ppc_inst inst;
+	long err;
+
+	err = probe_kernel_read((void *)&inst.prefix,
+				src, MCOUNT_INSN_SIZE);
+	if (err)
+		return err;
+
+	if (ppc_inst_prefixed(inst))
+		err = probe_kernel_read((void *)&inst.suffix,
+					src + 4, MCOUNT_INSN_SIZE);
+	if (err)
+		return err;
+
+	ppc_inst_write(p, inst);
+	return 0;
 }
 
 static ppc_inst
diff --git a/arch/powerpc/kernel/uprobes.c b/arch/powerpc/kernel/uprobes.c
index d1dff1dc3a11..3e4fbb5c1b1e 100644
--- a/arch/powerpc/kernel/uprobes.c
+++ b/arch/powerpc/kernel/uprobes.c
@@ -111,7 +111,7 @@ int arch_uprobe_post_xol(struct arch_uprobe *auprobe, struct pt_regs *regs)
 	 * support doesn't exist and have to fix-up the next instruction
 	 * to be executed.
 	 */
-	regs->nip = utask->vaddr + MAX_UINSN_BYTES;
+	regs->nip = utask->vaddr + ppc_inst_len(ppc_inst_read(auprobe->insn));
 
 	user_disable_single_step(current);
 	return 0;
diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index fa7f32adf029..3b8277a64b8f 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -24,17 +24,27 @@ static int __patch_instruction(ppc_inst *exec_addr, ppc_inst instr,
 {
 	int err = 0;
 
-	__put_user_asm(instr, patch_addr, err, "stw");
+	__put_user_asm(ppc_inst_word(instr), patch_addr, err, "stw");
 	if (err)
 		return err;
 
 	asm ("dcbst 0, %0; sync; icbi 0,%1; sync; isync" :: "r" (patch_addr),
 							    "r" (exec_addr));
 
+	if (!ppc_inst_prefixed(instr))
+		return 0;
+
+	__put_user_asm(ppc_inst_suffix(instr), patch_addr + 4, err, "stw");
+	if (err)
+		return err;
+
+	asm ("dcbst 0, %0; sync; icbi 0,%1; sync; isync" :: "r" (patch_addr + 4),
+							    "r" (exec_addr + 4));
+
 	return 0;
 }
 
-int raw_patch_instruction(ppc_inst *addr, ppc_inst instr)
+int raw_patch_instruction(void *addr, ppc_inst instr)
 {
 	return __patch_instruction(addr, instr, addr);
 }
@@ -184,7 +194,7 @@ static int do_patch_instruction(ppc_inst *addr, ppc_inst instr)
 
 #endif /* CONFIG_STRICT_KERNEL_RWX */
 
-int patch_instruction(unsigned int *addr, unsigned int instr)
+int patch_instruction(void *addr, ppc_inst instr)
 {
 	/* Make sure we aren't patching a freed init section */
 	if (init_mem_is_free && init_section_contains(addr, 4)) {
@@ -195,7 +205,7 @@ int patch_instruction(unsigned int *addr, unsigned int instr)
 }
 NOKPROBE_SYMBOL(patch_instruction);
 
-int patch_branch(ppc_inst *addr, unsigned long target, int flags)
+int patch_branch(void *addr, unsigned long target, int flags)
 {
 	return patch_instruction(addr, create_branch(addr, target, flags));
 }
@@ -264,7 +274,7 @@ ppc_inst create_branch(const ppc_inst *addr,
 	return instruction;
 }
 
-unsigned int create_cond_branch(const unsigned int *addr,
+ppc_inst create_cond_branch(const void *addr,
 				unsigned long target, int flags)
 {
 	ppc_inst instruction;
@@ -344,7 +354,7 @@ static unsigned long branch_bform_target(const ppc_inst *instr)
 	return (unsigned long)imm;
 }
 
-unsigned long branch_target(const ppc_inst *instr)
+unsigned long branch_target(const void *instr)
 {
 	if (instr_is_branch_iform(ppc_inst_read(instr)))
 		return branch_iform_target(instr);
diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index bae878a83fa5..ab4c71c43c8c 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -1169,10 +1169,12 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 	unsigned long int imm;
 	unsigned long int val, val2;
 	unsigned int mb, me, sh;
-	unsigned int word;
+	unsigned int word, suffix;
 	long ival;
 
 	word = ppc_inst_word(instr);
+	suffix = ppc_inst_suffix(instr);
+
 	op->type = COMPUTE;
 
 	opcode = word >> 26;
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index ee084411f2f5..c5536e1a3356 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -110,7 +110,7 @@ struct bpt {
 #define BP_DABR		4
 
 #define NBPTS	256
-#define BPT_WORDS	2
+#define BPT_WORDS	4
 static struct bpt bpts[NBPTS];
 static struct bpt dabr;
 static struct bpt *iabr;
@@ -118,12 +118,13 @@ static unsigned bpinstr = 0x7fe00008;	/* trap */
 
 #define BP_NUM(bp)	((bp) - bpts + 1)
 
-static unsigned int __section(.text.xmon_bpts) bpt_table[NBPTS * BPT_WORDS];
+static unsigned int __section(.text.xmon_bpts) bpt_table[NBPTS * BPT_WORDS] __aligned(64);
 
 /* Prototypes */
 static int cmds(struct pt_regs *);
 static int mread(unsigned long, void *, int);
 static int mwrite(unsigned long, void *, int);
+static int mread_instr(unsigned long, ppc_inst *);
 static int handle_fault(struct pt_regs *);
 static void byterev(unsigned char *, int);
 static void memex(void);
@@ -759,8 +760,8 @@ static int xmon_bpt(struct pt_regs *regs)
 
 	/* Are we at the trap at bp->instr[1] for some bp? */
 	bp = in_breakpoint_table(regs->nip, &offset);
-	if (bp != NULL && offset == 4) {
-		regs->nip = bp->address + 4;
+	if (bp != NULL && (offset == 4 || offset == 8)) {
+		regs->nip = bp->address + offset;
 		atomic_dec(&bp->ref_count);
 		return 1;
 	}
@@ -862,7 +863,7 @@ static struct bpt *in_breakpoint_table(unsigned long nip, unsigned long *offp)
 	if (off >= sizeof(bpt_table))
 		return NULL;
 	bp_off = off % (sizeof(unsigned int) * BPT_WORDS);
-	if (bp_off != 0 && bp_off != 4)
+	if (bp_off != 0 && bp_off != 4 && bp_off != 8)
 		return NULL;
 	*offp = bp_off;
 	return bpts + ((off - bp_off) / (sizeof(unsigned int) * BPT_WORDS));
@@ -881,7 +882,6 @@ static struct bpt *new_breakpoint(unsigned long a)
 		if (!bp->enabled && atomic_read(&bp->ref_count) == 0) {
 			bp->address = a;
 			bp->instr = bpt_table + ((bp - bpts) * BPT_WORDS);
-			patch_instruction(bp->instr + 1, PPC_INST(bpinstr));
 			return bp;
 		}
 	}
@@ -900,7 +900,7 @@ static void insert_bpts(void)
 	for (i = 0; i < NBPTS; ++i, ++bp) {
 		if ((bp->enabled & (BP_TRAP|BP_CIABR)) == 0)
 			continue;
-		if (mread(bp->address, &instr, 4) != 4) {
+		if (!mread_instr(bp->address, &instr)) {
 			printf("Couldn't read instruction at %lx, "
 			       "disabling breakpoint there\n", bp->address);
 			bp->enabled = 0;
@@ -913,9 +913,10 @@ static void insert_bpts(void)
 			continue;
 		}
 		patch_instruction(bp->instr, instr);
+		patch_instruction(bp->instr + ppc_inst_len(instr), PPC_INST(bpinstr));
 		if (bp->enabled & BP_CIABR)
 			continue;
-		if (patch_instruction((ppc_inst *)bp->address,
+		if (patch_instruction((void *)bp->address,
 							PPC_INST(bpinstr)) != 0) {
 			printf("Couldn't write instruction at %lx, "
 			       "disabling breakpoint there\n", bp->address);
@@ -950,7 +951,7 @@ static void remove_bpts(void)
 	for (i = 0; i < NBPTS; ++i, ++bp) {
 		if ((bp->enabled & (BP_TRAP|BP_CIABR)) != BP_TRAP)
 			continue;
-		if (mread(bp->address, &instr, 4) == 4
+		if (mread_instr(bp->address, &instr)
 		    && ppc_inst_equal(instr, PPC_INST(bpinstr))
 		    && patch_instruction(
 			(ppc_inst *)bp->address, ppc_inst_read(bp->instr)) != 0)
@@ -1166,7 +1167,7 @@ static int do_step(struct pt_regs *regs)
 	force_enable_xmon();
 	/* check we are in 64-bit kernel mode, translation enabled */
 	if ((regs->msr & (MSR_64BIT|MSR_PR|MSR_IR)) == (MSR_64BIT|MSR_IR)) {
-		if (mread(regs->nip, &instr, 4) == 4) {
+		if (mread_instr(regs->nip, &instr)) {
 			stepped = emulate_step(regs, instr);
 			if (stepped < 0) {
 				printf("Couldn't single-step %s instruction\n",
@@ -1333,7 +1334,7 @@ static long check_bp_loc(unsigned long addr)
 		printf("Breakpoints may only be placed at kernel addresses\n");
 		return 0;
 	}
-	if (!mread(addr, &instr, sizeof(instr))) {
+	if (!mread_instr(addr, &instr)) {
 		printf("Can't read instruction at address %lx\n", addr);
 		return 0;
 	}
@@ -2126,6 +2127,21 @@ mwrite(unsigned long adrs, void *buf, int size)
 	return n;
 }
 
+static int
+mread_instr(unsigned long adrs, ppc_inst *instr)
+{
+	if (setjmp(bus_error_jmp) == 0) {
+		catch_memory_errors = 1;
+		sync();
+		*instr = ppc_inst_read((void *)adrs);
+		sync();
+		/* wait a little while to see if we get a machine check */
+		__delay(200);
+	}
+	catch_memory_errors = 0;
+	return ppc_inst_len(*instr);
+}
+
 static int fault_type;
 static int fault_except;
 static char *fault_chars[] = { "--", "**", "##" };
-- 
2.17.1

