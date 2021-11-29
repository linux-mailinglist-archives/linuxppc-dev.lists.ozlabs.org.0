Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5912461460
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 12:55:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2kLb4g7wz3cFh
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 22:55:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2kJd3BdPz3cTN
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Nov 2021 22:53:37 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4J2kJH4sQqz9sSp;
 Mon, 29 Nov 2021 12:53:19 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pfZEB-RbuGeT; Mon, 29 Nov 2021 12:53:19 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4J2kJC49y0z9sSk;
 Mon, 29 Nov 2021 12:53:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 742E28B783;
 Mon, 29 Nov 2021 12:53:15 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id IBll4T6srd3H; Mon, 29 Nov 2021 12:53:15 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 44DC38B774;
 Mon, 29 Nov 2021 12:53:15 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 1ATBr7Be895117
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 29 Nov 2021 12:53:07 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 1ATBr6TA895116;
 Mon, 29 Nov 2021 12:53:06 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v4 2/5] powerpc/inst: Define ppc_inst_t
Date: Mon, 29 Nov 2021 12:53:02 +0100
Message-Id: <a2896cceb0adad6721c5dacecae613fc72ea9798.1638186774.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <97a171efd8c582e2bae82c31f2a9519823a20d3f.1638186773.git.christophe.leroy@csgroup.eu>
References: <97a171efd8c582e2bae82c31f2a9519823a20d3f.1638186773.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1638186784; l=35489; s=20211009;
 h=from:subject:message-id; bh=krtf0jHY7pEEtsOwMKpHk0lKdhUnSqMJgVcoRTvg2O8=;
 b=0zWS2QPO7PuPeB8vOJPey0N7fZvMF/TcRpBFNOWg3PldZpZTw9I0nunINSuCH30f8NWvA0mq+M9+
 tN+kgZe6D7UYsPrgEJ9D6hjHZjFIqU+g4tM/O6tmDTuX7UqwFmPO
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519;
 pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In order to stop using 'struct ppc_inst' on PPC32,
define a ppc_inst_t typedef.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v3: Rebased and resolved conflicts

v2: Anonymise the structure so that only the typedef can be used
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/code-patching.h      | 18 +++----
 arch/powerpc/include/asm/hw_breakpoint.h      |  4 +-
 arch/powerpc/include/asm/inst.h               | 36 ++++++-------
 arch/powerpc/include/asm/sstep.h              |  4 +-
 arch/powerpc/kernel/align.c                   |  4 +-
 arch/powerpc/kernel/epapr_paravirt.c          |  2 +-
 arch/powerpc/kernel/hw_breakpoint.c           |  4 +-
 .../kernel/hw_breakpoint_constraints.c        |  4 +-
 arch/powerpc/kernel/kprobes.c                 |  4 +-
 arch/powerpc/kernel/mce_power.c               |  2 +-
 arch/powerpc/kernel/optprobes.c               |  4 +-
 arch/powerpc/kernel/process.c                 |  2 +-
 arch/powerpc/kernel/setup_32.c                |  2 +-
 arch/powerpc/kernel/trace/ftrace.c            | 54 +++++++++----------
 arch/powerpc/kernel/vecemu.c                  |  2 +-
 arch/powerpc/lib/code-patching.c              | 38 ++++++-------
 arch/powerpc/lib/feature-fixups.c             |  4 +-
 arch/powerpc/lib/sstep.c                      |  4 +-
 arch/powerpc/lib/test_emulate_step.c          | 10 ++--
 arch/powerpc/mm/maccess.c                     |  2 +-
 arch/powerpc/perf/8xx-pmu.c                   |  2 +-
 arch/powerpc/xmon/xmon.c                      | 14 ++---
 arch/powerpc/xmon/xmon_bpts.h                 |  4 +-
 23 files changed, 112 insertions(+), 112 deletions(-)

diff --git a/arch/powerpc/include/asm/code-patching.h b/arch/powerpc/include/asm/code-patching.h
index 4ba834599c4d..46e8c5a8ce51 100644
--- a/arch/powerpc/include/asm/code-patching.h
+++ b/arch/powerpc/include/asm/code-patching.h
@@ -24,20 +24,20 @@
 
 bool is_offset_in_branch_range(long offset);
 bool is_offset_in_cond_branch_range(long offset);
-int create_branch(struct ppc_inst *instr, const u32 *addr,
+int create_branch(ppc_inst_t *instr, const u32 *addr,
 		  unsigned long target, int flags);
-int create_cond_branch(struct ppc_inst *instr, const u32 *addr,
+int create_cond_branch(ppc_inst_t *instr, const u32 *addr,
 		       unsigned long target, int flags);
 int patch_branch(u32 *addr, unsigned long target, int flags);
-int patch_instruction(u32 *addr, struct ppc_inst instr);
-int raw_patch_instruction(u32 *addr, struct ppc_inst instr);
+int patch_instruction(u32 *addr, ppc_inst_t instr);
+int raw_patch_instruction(u32 *addr, ppc_inst_t instr);
 
 static inline unsigned long patch_site_addr(s32 *site)
 {
 	return (unsigned long)site + *site;
 }
 
-static inline int patch_instruction_site(s32 *site, struct ppc_inst instr)
+static inline int patch_instruction_site(s32 *site, ppc_inst_t instr)
 {
 	return patch_instruction((u32 *)patch_site_addr(site), instr);
 }
@@ -58,11 +58,11 @@ static inline int modify_instruction_site(s32 *site, unsigned int clr, unsigned
 	return modify_instruction((unsigned int *)patch_site_addr(site), clr, set);
 }
 
-int instr_is_relative_branch(struct ppc_inst instr);
-int instr_is_relative_link_branch(struct ppc_inst instr);
+int instr_is_relative_branch(ppc_inst_t instr);
+int instr_is_relative_link_branch(ppc_inst_t instr);
 unsigned long branch_target(const u32 *instr);
-int translate_branch(struct ppc_inst *instr, const u32 *dest, const u32 *src);
-extern bool is_conditional_branch(struct ppc_inst instr);
+int translate_branch(ppc_inst_t *instr, const u32 *dest, const u32 *src);
+bool is_conditional_branch(ppc_inst_t instr);
 #ifdef CONFIG_PPC_BOOK3E_64
 void __patch_exception(int exc, unsigned long addr);
 #define patch_exception(exc, name) do { \
diff --git a/arch/powerpc/include/asm/hw_breakpoint.h b/arch/powerpc/include/asm/hw_breakpoint.h
index abebfbee5b1c..88053d3c68e6 100644
--- a/arch/powerpc/include/asm/hw_breakpoint.h
+++ b/arch/powerpc/include/asm/hw_breakpoint.h
@@ -56,11 +56,11 @@ static inline int nr_wp_slots(void)
 	return cpu_has_feature(CPU_FTR_DAWR1) ? 2 : 1;
 }
 
-bool wp_check_constraints(struct pt_regs *regs, struct ppc_inst instr,
+bool wp_check_constraints(struct pt_regs *regs, ppc_inst_t instr,
 			  unsigned long ea, int type, int size,
 			  struct arch_hw_breakpoint *info);
 
-void wp_get_instr_detail(struct pt_regs *regs, struct ppc_inst *instr,
+void wp_get_instr_detail(struct pt_regs *regs, ppc_inst_t *instr,
 			 int *type, int *size, unsigned long *ea);
 
 #ifdef CONFIG_HAVE_HW_BREAKPOINT
diff --git a/arch/powerpc/include/asm/inst.h b/arch/powerpc/include/asm/inst.h
index fea4d46155a9..055de1fa5d46 100644
--- a/arch/powerpc/include/asm/inst.h
+++ b/arch/powerpc/include/asm/inst.h
@@ -8,7 +8,7 @@
 ({									\
 	long __gui_ret;							\
 	u32 __user *__gui_ptr = (u32 __user *)ptr;			\
-	struct ppc_inst __gui_inst;					\
+	ppc_inst_t __gui_inst;						\
 	unsigned int __prefix, __suffix;				\
 									\
 	__chk_user_ptr(ptr);						\
@@ -34,29 +34,29 @@
  * Instruction data type for POWER
  */
 
-struct ppc_inst {
+typedef struct {
 	u32 val;
 #ifdef CONFIG_PPC64
 	u32 suffix;
 #endif
-} __packed;
+} __packed ppc_inst_t;
 
-static inline u32 ppc_inst_val(struct ppc_inst x)
+static inline u32 ppc_inst_val(ppc_inst_t x)
 {
 	return x.val;
 }
 
-static inline int ppc_inst_primary_opcode(struct ppc_inst x)
+static inline int ppc_inst_primary_opcode(ppc_inst_t x)
 {
 	return ppc_inst_val(x) >> 26;
 }
 
-#define ppc_inst(x) ((struct ppc_inst){ .val = (x) })
+#define ppc_inst(x) ((ppc_inst_t){ .val = (x) })
 
 #ifdef CONFIG_PPC64
-#define ppc_inst_prefix(x, y) ((struct ppc_inst){ .val = (x), .suffix = (y) })
+#define ppc_inst_prefix(x, y) ((ppc_inst_t){ .val = (x), .suffix = (y) })
 
-static inline u32 ppc_inst_suffix(struct ppc_inst x)
+static inline u32 ppc_inst_suffix(ppc_inst_t x)
 {
 	return x.suffix;
 }
@@ -64,14 +64,14 @@ static inline u32 ppc_inst_suffix(struct ppc_inst x)
 #else
 #define ppc_inst_prefix(x, y) ppc_inst(x)
 
-static inline u32 ppc_inst_suffix(struct ppc_inst x)
+static inline u32 ppc_inst_suffix(ppc_inst_t x)
 {
 	return 0;
 }
 
 #endif /* CONFIG_PPC64 */
 
-static inline struct ppc_inst ppc_inst_read(const u32 *ptr)
+static inline ppc_inst_t ppc_inst_read(const u32 *ptr)
 {
 	if (IS_ENABLED(CONFIG_PPC64) && (*ptr >> 26) == OP_PREFIX)
 		return ppc_inst_prefix(*ptr, *(ptr + 1));
@@ -79,17 +79,17 @@ static inline struct ppc_inst ppc_inst_read(const u32 *ptr)
 		return ppc_inst(*ptr);
 }
 
-static inline bool ppc_inst_prefixed(struct ppc_inst x)
+static inline bool ppc_inst_prefixed(ppc_inst_t x)
 {
 	return IS_ENABLED(CONFIG_PPC64) && ppc_inst_primary_opcode(x) == OP_PREFIX;
 }
 
-static inline struct ppc_inst ppc_inst_swab(struct ppc_inst x)
+static inline ppc_inst_t ppc_inst_swab(ppc_inst_t x)
 {
 	return ppc_inst_prefix(swab32(ppc_inst_val(x)), swab32(ppc_inst_suffix(x)));
 }
 
-static inline bool ppc_inst_equal(struct ppc_inst x, struct ppc_inst y)
+static inline bool ppc_inst_equal(ppc_inst_t x, ppc_inst_t y)
 {
 	if (ppc_inst_val(x) != ppc_inst_val(y))
 		return false;
@@ -98,7 +98,7 @@ static inline bool ppc_inst_equal(struct ppc_inst x, struct ppc_inst y)
 	return ppc_inst_suffix(x) == ppc_inst_suffix(y);
 }
 
-static inline int ppc_inst_len(struct ppc_inst x)
+static inline int ppc_inst_len(ppc_inst_t x)
 {
 	return ppc_inst_prefixed(x) ? 8 : 4;
 }
@@ -109,14 +109,14 @@ static inline int ppc_inst_len(struct ppc_inst x)
  */
 static inline u32 *ppc_inst_next(u32 *location, u32 *value)
 {
-	struct ppc_inst tmp;
+	ppc_inst_t tmp;
 
 	tmp = ppc_inst_read(value);
 
 	return (void *)location + ppc_inst_len(tmp);
 }
 
-static inline unsigned long ppc_inst_as_ulong(struct ppc_inst x)
+static inline unsigned long ppc_inst_as_ulong(ppc_inst_t x)
 {
 	if (IS_ENABLED(CONFIG_PPC32))
 		return ppc_inst_val(x);
@@ -128,7 +128,7 @@ static inline unsigned long ppc_inst_as_ulong(struct ppc_inst x)
 
 #define PPC_INST_STR_LEN sizeof("00000000 00000000")
 
-static inline char *__ppc_inst_as_str(char str[PPC_INST_STR_LEN], struct ppc_inst x)
+static inline char *__ppc_inst_as_str(char str[PPC_INST_STR_LEN], ppc_inst_t x)
 {
 	if (ppc_inst_prefixed(x))
 		sprintf(str, "%08x %08x", ppc_inst_val(x), ppc_inst_suffix(x));
@@ -145,6 +145,6 @@ static inline char *__ppc_inst_as_str(char str[PPC_INST_STR_LEN], struct ppc_ins
 	__str;				\
 })
 
-int copy_inst_from_kernel_nofault(struct ppc_inst *inst, u32 *src);
+int copy_inst_from_kernel_nofault(ppc_inst_t *inst, u32 *src);
 
 #endif /* _ASM_POWERPC_INST_H */
diff --git a/arch/powerpc/include/asm/sstep.h b/arch/powerpc/include/asm/sstep.h
index 1df867c2e054..50950deedb87 100644
--- a/arch/powerpc/include/asm/sstep.h
+++ b/arch/powerpc/include/asm/sstep.h
@@ -145,7 +145,7 @@ union vsx_reg {
  * otherwise.
  */
 extern int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
-			 struct ppc_inst instr);
+			 ppc_inst_t instr);
 
 /*
  * Emulate an instruction that can be executed just by updating
@@ -162,7 +162,7 @@ void emulate_update_regs(struct pt_regs *reg, struct instruction_op *op);
  * 0 if it could not be emulated, or -1 for an instruction that
  * should not be emulated (rfid, mtmsrd clearing MSR_RI, etc.).
  */
-extern int emulate_step(struct pt_regs *regs, struct ppc_inst instr);
+int emulate_step(struct pt_regs *regs, ppc_inst_t instr);
 
 /*
  * Emulate a load or store instruction by reading/writing the
diff --git a/arch/powerpc/kernel/align.c b/arch/powerpc/kernel/align.c
index bf96b954a4eb..3e37ece06739 100644
--- a/arch/powerpc/kernel/align.c
+++ b/arch/powerpc/kernel/align.c
@@ -105,7 +105,7 @@ static struct aligninfo spe_aligninfo[32] = {
  * so we don't need the address swizzling.
  */
 static int emulate_spe(struct pt_regs *regs, unsigned int reg,
-		       struct ppc_inst ppc_instr)
+		       ppc_inst_t ppc_instr)
 {
 	union {
 		u64 ll;
@@ -300,7 +300,7 @@ static int emulate_spe(struct pt_regs *regs, unsigned int reg,
 
 int fix_alignment(struct pt_regs *regs)
 {
-	struct ppc_inst instr;
+	ppc_inst_t instr;
 	struct instruction_op op;
 	int r, type;
 
diff --git a/arch/powerpc/kernel/epapr_paravirt.c b/arch/powerpc/kernel/epapr_paravirt.c
index 93b0f3ec8fb0..d4b8aff20815 100644
--- a/arch/powerpc/kernel/epapr_paravirt.c
+++ b/arch/powerpc/kernel/epapr_paravirt.c
@@ -37,7 +37,7 @@ static int __init early_init_dt_scan_epapr(unsigned long node,
 		return -1;
 
 	for (i = 0; i < (len / 4); i++) {
-		struct ppc_inst inst = ppc_inst(be32_to_cpu(insts[i]));
+		ppc_inst_t inst = ppc_inst(be32_to_cpu(insts[i]));
 		patch_instruction(epapr_hypercall_start + i, inst);
 #if !defined(CONFIG_64BIT) || defined(CONFIG_PPC_BOOK3E_64)
 		patch_instruction(epapr_ev_idle_start + i, inst);
diff --git a/arch/powerpc/kernel/hw_breakpoint.c b/arch/powerpc/kernel/hw_breakpoint.c
index 91a3be14808b..2669f80b3a49 100644
--- a/arch/powerpc/kernel/hw_breakpoint.c
+++ b/arch/powerpc/kernel/hw_breakpoint.c
@@ -523,7 +523,7 @@ static void larx_stcx_err(struct perf_event *bp, struct arch_hw_breakpoint *info
 
 static bool stepping_handler(struct pt_regs *regs, struct perf_event **bp,
 			     struct arch_hw_breakpoint **info, int *hit,
-			     struct ppc_inst instr)
+			     ppc_inst_t instr)
 {
 	int i;
 	int stepped;
@@ -616,7 +616,7 @@ int hw_breakpoint_handler(struct die_args *args)
 	int hit[HBP_NUM_MAX] = {0};
 	int nr_hit = 0;
 	bool ptrace_bp = false;
-	struct ppc_inst instr = ppc_inst(0);
+	ppc_inst_t instr = ppc_inst(0);
 	int type = 0;
 	int size = 0;
 	unsigned long ea;
diff --git a/arch/powerpc/kernel/hw_breakpoint_constraints.c b/arch/powerpc/kernel/hw_breakpoint_constraints.c
index 42b967e3d85c..a74623025f3a 100644
--- a/arch/powerpc/kernel/hw_breakpoint_constraints.c
+++ b/arch/powerpc/kernel/hw_breakpoint_constraints.c
@@ -80,7 +80,7 @@ static bool check_dawrx_constraints(struct pt_regs *regs, int type,
  * Return true if the event is valid wrt dawr configuration,
  * including extraneous exception. Otherwise return false.
  */
-bool wp_check_constraints(struct pt_regs *regs, struct ppc_inst instr,
+bool wp_check_constraints(struct pt_regs *regs, ppc_inst_t instr,
 			  unsigned long ea, int type, int size,
 			  struct arch_hw_breakpoint *info)
 {
@@ -127,7 +127,7 @@ bool wp_check_constraints(struct pt_regs *regs, struct ppc_inst instr,
 	return false;
 }
 
-void wp_get_instr_detail(struct pt_regs *regs, struct ppc_inst *instr,
+void wp_get_instr_detail(struct pt_regs *regs, ppc_inst_t *instr,
 			 int *type, int *size, unsigned long *ea)
 {
 	struct instruction_op op;
diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
index 86d77ff056a6..9a492fdec1df 100644
--- a/arch/powerpc/kernel/kprobes.c
+++ b/arch/powerpc/kernel/kprobes.c
@@ -124,7 +124,7 @@ int arch_prepare_kprobe(struct kprobe *p)
 {
 	int ret = 0;
 	struct kprobe *prev;
-	struct ppc_inst insn = ppc_inst_read(p->addr);
+	ppc_inst_t insn = ppc_inst_read(p->addr);
 
 	if ((unsigned long)p->addr & 0x03) {
 		printk("Attempt to register kprobe at an unaligned address\n");
@@ -244,7 +244,7 @@ NOKPROBE_SYMBOL(arch_prepare_kretprobe);
 static int try_to_emulate(struct kprobe *p, struct pt_regs *regs)
 {
 	int ret;
-	struct ppc_inst insn = ppc_inst_read(p->ainsn.insn);
+	ppc_inst_t insn = ppc_inst_read(p->ainsn.insn);
 
 	/* regs->nip is also adjusted if emulate_step returns 1 */
 	ret = emulate_step(regs, insn);
diff --git a/arch/powerpc/kernel/mce_power.c b/arch/powerpc/kernel/mce_power.c
index c2f55fe7092d..f2dd4daeddf8 100644
--- a/arch/powerpc/kernel/mce_power.c
+++ b/arch/powerpc/kernel/mce_power.c
@@ -455,7 +455,7 @@ static int mce_find_instr_ea_and_phys(struct pt_regs *regs, uint64_t *addr,
 	 * in real-mode is tricky and can lead to recursive
 	 * faults
 	 */
-	struct ppc_inst instr;
+	ppc_inst_t instr;
 	unsigned long pfn, instr_addr;
 	struct instruction_op op;
 	struct pt_regs tmp = *regs;
diff --git a/arch/powerpc/kernel/optprobes.c b/arch/powerpc/kernel/optprobes.c
index ce1903064031..378db980ded3 100644
--- a/arch/powerpc/kernel/optprobes.c
+++ b/arch/powerpc/kernel/optprobes.c
@@ -153,7 +153,7 @@ static void patch_imm_load_insns(unsigned long val, int reg, kprobe_opcode_t *ad
 
 int arch_prepare_optimized_kprobe(struct optimized_kprobe *op, struct kprobe *p)
 {
-	struct ppc_inst branch_op_callback, branch_emulate_step, temp;
+	ppc_inst_t branch_op_callback, branch_emulate_step, temp;
 	unsigned long op_callback_addr, emulate_step_addr;
 	kprobe_opcode_t *buff;
 	long b_offset;
@@ -269,7 +269,7 @@ int arch_check_optimized_kprobe(struct optimized_kprobe *op)
 
 void arch_optimize_kprobes(struct list_head *oplist)
 {
-	struct ppc_inst instr;
+	ppc_inst_t instr;
 	struct optimized_kprobe *op;
 	struct optimized_kprobe *tmp;
 
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 5d2333d2a283..c60abfc397a5 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -628,7 +628,7 @@ static void do_break_handler(struct pt_regs *regs)
 {
 	struct arch_hw_breakpoint null_brk = {0};
 	struct arch_hw_breakpoint *info;
-	struct ppc_inst instr = ppc_inst(0);
+	ppc_inst_t instr = ppc_inst(0);
 	int type = 0;
 	int size = 0;
 	unsigned long ea;
diff --git a/arch/powerpc/kernel/setup_32.c b/arch/powerpc/kernel/setup_32.c
index 7ec5c47fce0e..4017b05ef643 100644
--- a/arch/powerpc/kernel/setup_32.c
+++ b/arch/powerpc/kernel/setup_32.c
@@ -75,7 +75,7 @@ EXPORT_SYMBOL(DMA_MODE_WRITE);
 notrace void __init machine_init(u64 dt_ptr)
 {
 	u32 *addr = (u32 *)patch_site_addr(&patch__memset_nocache);
-	struct ppc_inst insn;
+	ppc_inst_t insn;
 
 	/* Configure static keys first, now that we're relocated. */
 	setup_feature_keys();
diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index d89c5df4f206..f293294ef5da 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -41,10 +41,10 @@
 #define	NUM_FTRACE_TRAMPS	8
 static unsigned long ftrace_tramps[NUM_FTRACE_TRAMPS];
 
-static struct ppc_inst
+static ppc_inst_t
 ftrace_call_replace(unsigned long ip, unsigned long addr, int link)
 {
-	struct ppc_inst op;
+	ppc_inst_t op;
 
 	addr = ppc_function_entry((void *)addr);
 
@@ -55,9 +55,9 @@ ftrace_call_replace(unsigned long ip, unsigned long addr, int link)
 }
 
 static int
-ftrace_modify_code(unsigned long ip, struct ppc_inst old, struct ppc_inst new)
+ftrace_modify_code(unsigned long ip, ppc_inst_t old, ppc_inst_t new)
 {
-	struct ppc_inst replaced;
+	ppc_inst_t replaced;
 
 	/*
 	 * Note:
@@ -90,24 +90,24 @@ ftrace_modify_code(unsigned long ip, struct ppc_inst old, struct ppc_inst new)
  */
 static int test_24bit_addr(unsigned long ip, unsigned long addr)
 {
-	struct ppc_inst op;
+	ppc_inst_t op;
 	addr = ppc_function_entry((void *)addr);
 
 	/* use the create_branch to verify that this offset can be branched */
 	return create_branch(&op, (u32 *)ip, addr, 0) == 0;
 }
 
-static int is_bl_op(struct ppc_inst op)
+static int is_bl_op(ppc_inst_t op)
 {
 	return (ppc_inst_val(op) & 0xfc000003) == 0x48000001;
 }
 
-static int is_b_op(struct ppc_inst op)
+static int is_b_op(ppc_inst_t op)
 {
 	return (ppc_inst_val(op) & 0xfc000003) == 0x48000000;
 }
 
-static unsigned long find_bl_target(unsigned long ip, struct ppc_inst op)
+static unsigned long find_bl_target(unsigned long ip, ppc_inst_t op)
 {
 	int offset;
 
@@ -127,7 +127,7 @@ __ftrace_make_nop(struct module *mod,
 {
 	unsigned long entry, ptr, tramp;
 	unsigned long ip = rec->ip;
-	struct ppc_inst op, pop;
+	ppc_inst_t op, pop;
 
 	/* read where this goes */
 	if (copy_inst_from_kernel_nofault(&op, (void *)ip)) {
@@ -221,7 +221,7 @@ static int
 __ftrace_make_nop(struct module *mod,
 		  struct dyn_ftrace *rec, unsigned long addr)
 {
-	struct ppc_inst op;
+	ppc_inst_t op;
 	unsigned int jmp[4];
 	unsigned long ip = rec->ip;
 	unsigned long tramp;
@@ -291,7 +291,7 @@ __ftrace_make_nop(struct module *mod,
 static unsigned long find_ftrace_tramp(unsigned long ip)
 {
 	int i;
-	struct ppc_inst instr;
+	ppc_inst_t instr;
 
 	/*
 	 * We have the compiler generated long_branch tramps at the end
@@ -329,9 +329,9 @@ static int add_ftrace_tramp(unsigned long tramp)
 static int setup_mcount_compiler_tramp(unsigned long tramp)
 {
 	int i;
-	struct ppc_inst op;
+	ppc_inst_t op;
 	unsigned long ptr;
-	struct ppc_inst instr;
+	ppc_inst_t instr;
 	static unsigned long ftrace_plt_tramps[NUM_FTRACE_TRAMPS];
 
 	/* Is this a known long jump tramp? */
@@ -396,7 +396,7 @@ static int setup_mcount_compiler_tramp(unsigned long tramp)
 static int __ftrace_make_nop_kernel(struct dyn_ftrace *rec, unsigned long addr)
 {
 	unsigned long tramp, ip = rec->ip;
-	struct ppc_inst op;
+	ppc_inst_t op;
 
 	/* Read where this goes */
 	if (copy_inst_from_kernel_nofault(&op, (void *)ip)) {
@@ -436,7 +436,7 @@ int ftrace_make_nop(struct module *mod,
 		    struct dyn_ftrace *rec, unsigned long addr)
 {
 	unsigned long ip = rec->ip;
-	struct ppc_inst old, new;
+	ppc_inst_t old, new;
 
 	/*
 	 * If the calling address is more that 24 bits away,
@@ -489,7 +489,7 @@ int ftrace_make_nop(struct module *mod,
  */
 #ifndef CONFIG_MPROFILE_KERNEL
 static int
-expected_nop_sequence(void *ip, struct ppc_inst op0, struct ppc_inst op1)
+expected_nop_sequence(void *ip, ppc_inst_t op0, ppc_inst_t op1)
 {
 	/*
 	 * We expect to see:
@@ -507,7 +507,7 @@ expected_nop_sequence(void *ip, struct ppc_inst op0, struct ppc_inst op1)
 }
 #else
 static int
-expected_nop_sequence(void *ip, struct ppc_inst op0, struct ppc_inst op1)
+expected_nop_sequence(void *ip, ppc_inst_t op0, ppc_inst_t op1)
 {
 	/* look for patched "NOP" on ppc64 with -mprofile-kernel */
 	if (!ppc_inst_equal(op0, ppc_inst(PPC_RAW_NOP())))
@@ -519,8 +519,8 @@ expected_nop_sequence(void *ip, struct ppc_inst op0, struct ppc_inst op1)
 static int
 __ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 {
-	struct ppc_inst op[2];
-	struct ppc_inst instr;
+	ppc_inst_t op[2];
+	ppc_inst_t instr;
 	void *ip = (void *)rec->ip;
 	unsigned long entry, ptr, tramp;
 	struct module *mod = rec->arch.mod;
@@ -588,7 +588,7 @@ static int
 __ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 {
 	int err;
-	struct ppc_inst op;
+	ppc_inst_t op;
 	u32 *ip = (u32 *)rec->ip;
 
 	/* read where this goes */
@@ -626,7 +626,7 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 
 static int __ftrace_make_call_kernel(struct dyn_ftrace *rec, unsigned long addr)
 {
-	struct ppc_inst op;
+	ppc_inst_t op;
 	void *ip = (void *)rec->ip;
 	unsigned long tramp, entry, ptr;
 
@@ -674,7 +674,7 @@ static int __ftrace_make_call_kernel(struct dyn_ftrace *rec, unsigned long addr)
 int ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 {
 	unsigned long ip = rec->ip;
-	struct ppc_inst old, new;
+	ppc_inst_t old, new;
 
 	/*
 	 * If the calling address is more that 24 bits away,
@@ -713,7 +713,7 @@ static int
 __ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
 					unsigned long addr)
 {
-	struct ppc_inst op;
+	ppc_inst_t op;
 	unsigned long ip = rec->ip;
 	unsigned long entry, ptr, tramp;
 	struct module *mod = rec->arch.mod;
@@ -807,7 +807,7 @@ int ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
 			unsigned long addr)
 {
 	unsigned long ip = rec->ip;
-	struct ppc_inst old, new;
+	ppc_inst_t old, new;
 
 	/*
 	 * If the calling address is more that 24 bits away,
@@ -847,7 +847,7 @@ int ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
 int ftrace_update_ftrace_func(ftrace_func_t func)
 {
 	unsigned long ip = (unsigned long)(&ftrace_call);
-	struct ppc_inst old, new;
+	ppc_inst_t old, new;
 	int ret;
 
 	old = ppc_inst_read((u32 *)&ftrace_call);
@@ -932,7 +932,7 @@ int ftrace_enable_ftrace_graph_caller(void)
 	unsigned long ip = (unsigned long)(&ftrace_graph_call);
 	unsigned long addr = (unsigned long)(&ftrace_graph_caller);
 	unsigned long stub = (unsigned long)(&ftrace_graph_stub);
-	struct ppc_inst old, new;
+	ppc_inst_t old, new;
 
 	old = ftrace_call_replace(ip, stub, 0);
 	new = ftrace_call_replace(ip, addr, 0);
@@ -945,7 +945,7 @@ int ftrace_disable_ftrace_graph_caller(void)
 	unsigned long ip = (unsigned long)(&ftrace_graph_call);
 	unsigned long addr = (unsigned long)(&ftrace_graph_caller);
 	unsigned long stub = (unsigned long)(&ftrace_graph_stub);
-	struct ppc_inst old, new;
+	ppc_inst_t old, new;
 
 	old = ftrace_call_replace(ip, addr, 0);
 	new = ftrace_call_replace(ip, stub, 0);
diff --git a/arch/powerpc/kernel/vecemu.c b/arch/powerpc/kernel/vecemu.c
index ae632569446f..fd9432875ebc 100644
--- a/arch/powerpc/kernel/vecemu.c
+++ b/arch/powerpc/kernel/vecemu.c
@@ -261,7 +261,7 @@ static unsigned int rfin(unsigned int x)
 
 int emulate_altivec(struct pt_regs *regs)
 {
-	struct ppc_inst instr;
+	ppc_inst_t instr;
 	unsigned int i, word;
 	unsigned int va, vb, vc, vd;
 	vector128 *vrs;
diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index 5e2fe133639e..3a1e64441358 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -18,7 +18,7 @@
 #include <asm/setup.h>
 #include <asm/inst.h>
 
-static int __patch_instruction(u32 *exec_addr, struct ppc_inst instr, u32 *patch_addr)
+static int __patch_instruction(u32 *exec_addr, ppc_inst_t instr, u32 *patch_addr)
 {
 	if (!ppc_inst_prefixed(instr)) {
 		u32 val = ppc_inst_val(instr);
@@ -39,7 +39,7 @@ static int __patch_instruction(u32 *exec_addr, struct ppc_inst instr, u32 *patch
 	return -EFAULT;
 }
 
-int raw_patch_instruction(u32 *addr, struct ppc_inst instr)
+int raw_patch_instruction(u32 *addr, ppc_inst_t instr)
 {
 	return __patch_instruction(addr, instr, addr);
 }
@@ -141,7 +141,7 @@ static inline int unmap_patch_area(unsigned long addr)
 	return 0;
 }
 
-static int do_patch_instruction(u32 *addr, struct ppc_inst instr)
+static int do_patch_instruction(u32 *addr, ppc_inst_t instr)
 {
 	int err;
 	u32 *patch_addr = NULL;
@@ -180,14 +180,14 @@ static int do_patch_instruction(u32 *addr, struct ppc_inst instr)
 }
 #else /* !CONFIG_STRICT_KERNEL_RWX */
 
-static int do_patch_instruction(u32 *addr, struct ppc_inst instr)
+static int do_patch_instruction(u32 *addr, ppc_inst_t instr)
 {
 	return raw_patch_instruction(addr, instr);
 }
 
 #endif /* CONFIG_STRICT_KERNEL_RWX */
 
-int patch_instruction(u32 *addr, struct ppc_inst instr)
+int patch_instruction(u32 *addr, ppc_inst_t instr)
 {
 	/* Make sure we aren't patching a freed init section */
 	if (!kernel_text_address((unsigned long)addr))
@@ -199,7 +199,7 @@ NOKPROBE_SYMBOL(patch_instruction);
 
 int patch_branch(u32 *addr, unsigned long target, int flags)
 {
-	struct ppc_inst instr;
+	ppc_inst_t instr;
 
 	create_branch(&instr, addr, target, flags);
 	return patch_instruction(addr, instr);
@@ -236,7 +236,7 @@ bool is_offset_in_cond_branch_range(long offset)
  * Helper to check if a given instruction is a conditional branch
  * Derived from the conditional checks in analyse_instr()
  */
-bool is_conditional_branch(struct ppc_inst instr)
+bool is_conditional_branch(ppc_inst_t instr)
 {
 	unsigned int opcode = ppc_inst_primary_opcode(instr);
 
@@ -254,7 +254,7 @@ bool is_conditional_branch(struct ppc_inst instr)
 }
 NOKPROBE_SYMBOL(is_conditional_branch);
 
-int create_branch(struct ppc_inst *instr, const u32 *addr,
+int create_branch(ppc_inst_t *instr, const u32 *addr,
 		  unsigned long target, int flags)
 {
 	long offset;
@@ -274,7 +274,7 @@ int create_branch(struct ppc_inst *instr, const u32 *addr,
 	return 0;
 }
 
-int create_cond_branch(struct ppc_inst *instr, const u32 *addr,
+int create_cond_branch(ppc_inst_t *instr, const u32 *addr,
 		       unsigned long target, int flags)
 {
 	long offset;
@@ -293,22 +293,22 @@ int create_cond_branch(struct ppc_inst *instr, const u32 *addr,
 	return 0;
 }
 
-static unsigned int branch_opcode(struct ppc_inst instr)
+static unsigned int branch_opcode(ppc_inst_t instr)
 {
 	return ppc_inst_primary_opcode(instr) & 0x3F;
 }
 
-static int instr_is_branch_iform(struct ppc_inst instr)
+static int instr_is_branch_iform(ppc_inst_t instr)
 {
 	return branch_opcode(instr) == 18;
 }
 
-static int instr_is_branch_bform(struct ppc_inst instr)
+static int instr_is_branch_bform(ppc_inst_t instr)
 {
 	return branch_opcode(instr) == 16;
 }
 
-int instr_is_relative_branch(struct ppc_inst instr)
+int instr_is_relative_branch(ppc_inst_t instr)
 {
 	if (ppc_inst_val(instr) & BRANCH_ABSOLUTE)
 		return 0;
@@ -316,7 +316,7 @@ int instr_is_relative_branch(struct ppc_inst instr)
 	return instr_is_branch_iform(instr) || instr_is_branch_bform(instr);
 }
 
-int instr_is_relative_link_branch(struct ppc_inst instr)
+int instr_is_relative_link_branch(ppc_inst_t instr)
 {
 	return instr_is_relative_branch(instr) && (ppc_inst_val(instr) & BRANCH_SET_LINK);
 }
@@ -363,7 +363,7 @@ unsigned long branch_target(const u32 *instr)
 	return 0;
 }
 
-int translate_branch(struct ppc_inst *instr, const u32 *dest, const u32 *src)
+int translate_branch(ppc_inst_t *instr, const u32 *dest, const u32 *src)
 {
 	unsigned long target;
 	target = branch_target(src);
@@ -416,7 +416,7 @@ static void __init test_trampoline(void)
 static void __init test_branch_iform(void)
 {
 	int err;
-	struct ppc_inst instr;
+	ppc_inst_t instr;
 	u32 tmp[2];
 	u32 *iptr = tmp;
 	unsigned long addr = (unsigned long)tmp;
@@ -498,7 +498,7 @@ static void __init test_create_function_call(void)
 {
 	u32 *iptr;
 	unsigned long dest;
-	struct ppc_inst instr;
+	ppc_inst_t instr;
 
 	/* Check we can create a function call */
 	iptr = (u32 *)ppc_function_entry(test_trampoline);
@@ -512,7 +512,7 @@ static void __init test_branch_bform(void)
 {
 	int err;
 	unsigned long addr;
-	struct ppc_inst instr;
+	ppc_inst_t instr;
 	u32 tmp[2];
 	u32 *iptr = tmp;
 	unsigned int flags;
@@ -590,7 +590,7 @@ static void __init test_translate_branch(void)
 {
 	unsigned long addr;
 	void *p, *q;
-	struct ppc_inst instr;
+	ppc_inst_t instr;
 	void *buf;
 
 	buf = vmalloc(PAGE_ALIGN(0x2000000 + 1));
diff --git a/arch/powerpc/lib/feature-fixups.c b/arch/powerpc/lib/feature-fixups.c
index c3e06922468b..57c6bb802f6c 100644
--- a/arch/powerpc/lib/feature-fixups.c
+++ b/arch/powerpc/lib/feature-fixups.c
@@ -47,7 +47,7 @@ static u32 *calc_addr(struct fixup_entry *fcur, long offset)
 static int patch_alt_instruction(u32 *src, u32 *dest, u32 *alt_start, u32 *alt_end)
 {
 	int err;
-	struct ppc_inst instr;
+	ppc_inst_t instr;
 
 	instr = ppc_inst_read(src);
 
@@ -624,7 +624,7 @@ void do_lwsync_fixups(unsigned long value, void *fixup_start, void *fixup_end)
 static void do_final_fixups(void)
 {
 #if defined(CONFIG_PPC64) && defined(CONFIG_RELOCATABLE)
-	struct ppc_inst inst;
+	ppc_inst_t inst;
 	u32 *src, *dest, *end;
 
 	if (PHYSICAL_START == 0)
diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index 86f49e3e7cf5..a94b0cd0bdc5 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -1354,7 +1354,7 @@ static nokprobe_inline int trap_compare(long v1, long v2)
  * otherwise.
  */
 int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
-		  struct ppc_inst instr)
+		  ppc_inst_t instr)
 {
 #ifdef CONFIG_PPC64
 	unsigned int suffixopcode, prefixtype, prefix_r;
@@ -3578,7 +3578,7 @@ NOKPROBE_SYMBOL(emulate_loadstore);
  * or -1 if the instruction is one that should not be stepped,
  * such as an rfid, or a mtmsrd that would clear MSR_RI.
  */
-int emulate_step(struct pt_regs *regs, struct ppc_inst instr)
+int emulate_step(struct pt_regs *regs, ppc_inst_t instr)
 {
 	struct instruction_op op;
 	int r, err, type;
diff --git a/arch/powerpc/lib/test_emulate_step.c b/arch/powerpc/lib/test_emulate_step.c
index 8b4f6b3e96c4..4f141daafcff 100644
--- a/arch/powerpc/lib/test_emulate_step.c
+++ b/arch/powerpc/lib/test_emulate_step.c
@@ -792,7 +792,7 @@ static void __init test_lxvpx_stxvpx(void)
 #ifdef CONFIG_VSX
 static void __init test_plxvp_pstxvp(void)
 {
-	struct ppc_inst instr;
+	ppc_inst_t instr;
 	struct pt_regs regs;
 	union {
 		vector128 a;
@@ -906,7 +906,7 @@ struct compute_test {
 	struct {
 		char *descr;
 		unsigned long flags;
-		struct ppc_inst instr;
+		ppc_inst_t instr;
 		struct pt_regs regs;
 	} subtests[MAX_SUBTESTS + 1];
 };
@@ -1600,7 +1600,7 @@ static struct compute_test compute_tests[] = {
 };
 
 static int __init emulate_compute_instr(struct pt_regs *regs,
-					struct ppc_inst instr,
+					ppc_inst_t instr,
 					bool negative)
 {
 	int analysed;
@@ -1627,7 +1627,7 @@ static int __init emulate_compute_instr(struct pt_regs *regs,
 }
 
 static int __init execute_compute_instr(struct pt_regs *regs,
-					struct ppc_inst instr)
+					ppc_inst_t instr)
 {
 	extern int exec_instr(struct pt_regs *regs);
 
@@ -1658,7 +1658,7 @@ static void __init run_tests_compute(void)
 	struct compute_test *test;
 	struct pt_regs *regs, exp, got;
 	unsigned int i, j, k;
-	struct ppc_inst instr;
+	ppc_inst_t instr;
 	bool ignore_gpr, ignore_xer, ignore_ccr, passed, rc, negative;
 
 	for (i = 0; i < ARRAY_SIZE(compute_tests); i++) {
diff --git a/arch/powerpc/mm/maccess.c b/arch/powerpc/mm/maccess.c
index aad7c47e0030..5abae96b2b46 100644
--- a/arch/powerpc/mm/maccess.c
+++ b/arch/powerpc/mm/maccess.c
@@ -12,7 +12,7 @@ bool copy_from_kernel_nofault_allowed(const void *unsafe_src, size_t size)
 	return is_kernel_addr((unsigned long)unsafe_src);
 }
 
-int copy_inst_from_kernel_nofault(struct ppc_inst *inst, u32 *src)
+int copy_inst_from_kernel_nofault(ppc_inst_t *inst, u32 *src)
 {
 	unsigned int val, suffix;
 	int err;
diff --git a/arch/powerpc/perf/8xx-pmu.c b/arch/powerpc/perf/8xx-pmu.c
index f970d1510d3d..4738c4dbf567 100644
--- a/arch/powerpc/perf/8xx-pmu.c
+++ b/arch/powerpc/perf/8xx-pmu.c
@@ -153,7 +153,7 @@ static void mpc8xx_pmu_read(struct perf_event *event)
 
 static void mpc8xx_pmu_del(struct perf_event *event, int flags)
 {
-	struct ppc_inst insn = ppc_inst(PPC_RAW_MFSPR(10, SPRN_SPRG_SCRATCH2));
+	ppc_inst_t insn = ppc_inst(PPC_RAW_MFSPR(10, SPRN_SPRG_SCRATCH2));
 
 	mpc8xx_pmu_read(event);
 
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 83100c6524cc..eac2957c6614 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -125,7 +125,7 @@ static unsigned bpinstr = 0x7fe00008;	/* trap */
 static int cmds(struct pt_regs *);
 static int mread(unsigned long, void *, int);
 static int mwrite(unsigned long, void *, int);
-static int mread_instr(unsigned long, struct ppc_inst *);
+static int mread_instr(unsigned long, ppc_inst_t *);
 static int handle_fault(struct pt_regs *);
 static void byterev(unsigned char *, int);
 static void memex(void);
@@ -908,7 +908,7 @@ static struct bpt *new_breakpoint(unsigned long a)
 static void insert_bpts(void)
 {
 	int i;
-	struct ppc_inst instr, instr2;
+	ppc_inst_t instr, instr2;
 	struct bpt *bp, *bp2;
 
 	bp = bpts;
@@ -988,7 +988,7 @@ static void remove_bpts(void)
 {
 	int i;
 	struct bpt *bp;
-	struct ppc_inst instr;
+	ppc_inst_t instr;
 
 	bp = bpts;
 	for (i = 0; i < NBPTS; ++i, ++bp) {
@@ -1204,7 +1204,7 @@ static int do_step(struct pt_regs *regs)
  */
 static int do_step(struct pt_regs *regs)
 {
-	struct ppc_inst instr;
+	ppc_inst_t instr;
 	int stepped;
 
 	force_enable_xmon();
@@ -1459,7 +1459,7 @@ csum(void)
  */
 static long check_bp_loc(unsigned long addr)
 {
-	struct ppc_inst instr;
+	ppc_inst_t instr;
 
 	addr &= ~3;
 	if (!is_kernel_addr(addr)) {
@@ -2306,7 +2306,7 @@ mwrite(unsigned long adrs, void *buf, int size)
 }
 
 static int
-mread_instr(unsigned long adrs, struct ppc_inst *instr)
+mread_instr(unsigned long adrs, ppc_inst_t *instr)
 {
 	volatile int n;
 
@@ -3026,7 +3026,7 @@ generic_inst_dump(unsigned long adr, long count, int praddr,
 {
 	int nr, dotted;
 	unsigned long first_adr;
-	struct ppc_inst inst, last_inst = ppc_inst(0);
+	ppc_inst_t inst, last_inst = ppc_inst(0);
 
 	dotted = 0;
 	for (first_adr = adr; count > 0; --count, adr += ppc_inst_len(inst)) {
diff --git a/arch/powerpc/xmon/xmon_bpts.h b/arch/powerpc/xmon/xmon_bpts.h
index 57e6fb03de48..377068f52edb 100644
--- a/arch/powerpc/xmon/xmon_bpts.h
+++ b/arch/powerpc/xmon/xmon_bpts.h
@@ -5,8 +5,8 @@
 #define NBPTS	256
 #ifndef __ASSEMBLY__
 #include <asm/inst.h>
-#define BPT_SIZE	(sizeof(struct ppc_inst) * 2)
-#define BPT_WORDS	(BPT_SIZE / sizeof(struct ppc_inst))
+#define BPT_SIZE	(sizeof(ppc_inst_t) * 2)
+#define BPT_WORDS	(BPT_SIZE / sizeof(ppc_inst_t))
 
 extern unsigned int bpt_table[NBPTS * BPT_WORDS];
 #endif /* __ASSEMBLY__ */
-- 
2.33.1

