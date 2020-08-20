Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B5324AD69
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Aug 2020 05:41:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BX9Rv1mRvzDr2s
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Aug 2020 13:41:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029;
 helo=mail-pj1-x1029.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=AKr210dT; dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BX9Pp1F7MzDqs3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Aug 2020 13:39:38 +1000 (AEST)
Received: by mail-pj1-x1029.google.com with SMTP id q93so650673pjq.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Aug 2020 20:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=nkp2E0L8ZCSRe5V3E0mQN/v3/J+KXE2EdjKshxmqdjI=;
 b=AKr210dTtlhkrYKPE3vc5nx56Sv0RUEkktlAz6qKQnl0G2Z21tyfClT0LJWFGlnbxT
 9vwS3CRiffiuAYEfiC6nvvEp9lhId8P5WIeqFnyJ2J/lncv5v7GgHgoxXSXNnqU7qK1U
 I1+tEGBmpA/B5Gf2r7hs/hfyp2da6X7w0HJLfVqxiNOc7/Oe4Mkd79GKt1qjsHhKHzIj
 nUCtnIZXT6Zl563jj08nUpz6wVgwnXovv+/nMtRsWGTjh+8RF/meJf6y5MxL2ewUrPWF
 lQ9VdGw8adMOcpQ1pJEewjgUWP8VgaiM+njybSUzs6mpjvJRclcxOr4K+eEd9W+LisLP
 wJMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=nkp2E0L8ZCSRe5V3E0mQN/v3/J+KXE2EdjKshxmqdjI=;
 b=R8WT7kbB4tBGUqi/rvdA2UChjvzrw4LDdjJnru1TSamUTsrFvvmVsE8/ngc4awgSEa
 phstevlt1J0Kvq7Y/qTEXHjg1DNoWVlGNV8RJrKUlAtHb/cdhHeVlwk11uzdgDmvSYQq
 enupWbQgEX8x+g/bmj7sR8TjqqNS6fn8QrCmx8YhUUIGvXrrlzaN+y7l+B1tJLxjJjvE
 lWGac0R5k9yDO5kw+GdegicbyCaqvhJZdCn5nmJ+kRzQJSBuV3GTWhLAa/mednHgQl05
 8IZZMDJI180IS/fchHws2PmFqnLuFKMZ+SE3KtsVVyLmn8mF1mAExgmtVu394QYRkrPi
 v4uQ==
X-Gm-Message-State: AOAM532CP20ZKe9mfm4Mcku1EQ/sajOymRlaAe5fyUfJwLOeO3XQZ9et
 2RGFB1FLyUMnUHF3y+4kJKE=
X-Google-Smtp-Source: ABdhPJzYvQuVoQL0PtRqMh5+dk4GqOSLsQPPbUkOW/am0NXUhdTfCIuwEJ5pl2AIdBPo/ztwHSloRw==
X-Received: by 2002:a17:902:d902:: with SMTP id
 c2mr1072375plz.71.1597894774195; 
 Wed, 19 Aug 2020 20:39:34 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id lb1sm405205pjb.26.2020.08.19.20.39.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Aug 2020 20:39:33 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: kvm-ppc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 1/2] KVM: PPC: Use the ppc_inst type
Date: Thu, 20 Aug 2020 13:39:21 +1000
Message-Id: <20200820033922.32311-1-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Jordan Niethe <jniethe5@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The ppc_inst type was added to help cope with the addition of prefixed
instructions to the ISA. Convert KVM to use this new type for dealing
wiht instructions. For now do not try to add further support for
prefixed instructions.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
 arch/powerpc/include/asm/disassemble.h    | 80 +++++++++---------
 arch/powerpc/include/asm/kvm_book3s.h     |  4 +-
 arch/powerpc/include/asm/kvm_book3s_asm.h |  3 +-
 arch/powerpc/include/asm/kvm_host.h       |  5 +-
 arch/powerpc/include/asm/kvm_ppc.h        | 14 ++--
 arch/powerpc/kernel/asm-offsets.c         |  2 +
 arch/powerpc/kernel/kvm.c                 | 99 +++++++++++------------
 arch/powerpc/kvm/book3s.c                 |  6 +-
 arch/powerpc/kvm/book3s.h                 |  2 +-
 arch/powerpc/kvm/book3s_64_mmu_hv.c       |  8 +-
 arch/powerpc/kvm/book3s_emulate.c         | 30 +++----
 arch/powerpc/kvm/book3s_hv.c              | 19 ++---
 arch/powerpc/kvm/book3s_hv_nested.c       |  4 +-
 arch/powerpc/kvm/book3s_hv_rmhandlers.S   |  5 ++
 arch/powerpc/kvm/book3s_hv_tm.c           | 17 ++--
 arch/powerpc/kvm/book3s_hv_tm_builtin.c   | 12 +--
 arch/powerpc/kvm/book3s_paired_singles.c  | 15 ++--
 arch/powerpc/kvm/book3s_pr.c              | 20 ++---
 arch/powerpc/kvm/booke.c                  | 18 ++---
 arch/powerpc/kvm/booke.h                  |  4 +-
 arch/powerpc/kvm/booke_emulate.c          |  4 +-
 arch/powerpc/kvm/e500_emulate.c           |  6 +-
 arch/powerpc/kvm/e500_mmu_host.c          |  6 +-
 arch/powerpc/kvm/emulate.c                | 15 ++--
 arch/powerpc/kvm/emulate_loadstore.c      |  8 +-
 arch/powerpc/kvm/powerpc.c                |  4 +-
 arch/powerpc/kvm/trace.h                  |  9 ++-
 arch/powerpc/kvm/trace_booke.h            |  8 +-
 arch/powerpc/kvm/trace_pr.h               |  8 +-
 arch/powerpc/lib/inst.c                   |  4 +-
 arch/powerpc/lib/sstep.c                  |  4 +-
 arch/powerpc/sysdev/fsl_pci.c             |  4 +-
 32 files changed, 237 insertions(+), 210 deletions(-)

diff --git a/arch/powerpc/include/asm/disassemble.h b/arch/powerpc/include/asm/disassemble.h
index 8d2ebc36d5e3..91dbe8e5cd13 100644
--- a/arch/powerpc/include/asm/disassemble.h
+++ b/arch/powerpc/include/asm/disassemble.h
@@ -10,75 +10,82 @@
 #define __ASM_PPC_DISASSEMBLE_H__
 
 #include <linux/types.h>
+#include <asm/inst.h>
 
-static inline unsigned int get_op(u32 inst)
+static inline unsigned int get_op(struct ppc_inst inst)
 {
-	return inst >> 26;
+	return ppc_inst_val(inst) >> 26;
 }
 
-static inline unsigned int get_xop(u32 inst)
+static inline unsigned int get_xop(struct ppc_inst inst)
 {
-	return (inst >> 1) & 0x3ff;
+	return (ppc_inst_val(inst) >> 1) & 0x3ff;
 }
 
-static inline unsigned int get_sprn(u32 inst)
+static inline unsigned int get_sprn(struct ppc_inst inst)
 {
-	return ((inst >> 16) & 0x1f) | ((inst >> 6) & 0x3e0);
+	u32 word = ppc_inst_val(inst);
+
+	return ((word >> 16) & 0x1f) | ((word >> 6) & 0x3e0);
 }
 
-static inline unsigned int get_dcrn(u32 inst)
+static inline unsigned int get_dcrn(struct ppc_inst inst)
 {
-	return ((inst >> 16) & 0x1f) | ((inst >> 6) & 0x3e0);
+	u32 word = ppc_inst_val(inst);
+
+	return ((word >> 16) & 0x1f) | ((word >> 6) & 0x3e0);
 }
 
-static inline unsigned int get_tmrn(u32 inst)
+static inline unsigned int get_tmrn(struct ppc_inst inst)
 {
-	return ((inst >> 16) & 0x1f) | ((inst >> 6) & 0x3e0);
+	u32 word = ppc_inst_val(inst);
+
+	return ((word >> 16) & 0x1f) | ((word >> 6) & 0x3e0);
 }
 
-static inline unsigned int get_rt(u32 inst)
+static inline unsigned int get_rt(struct ppc_inst inst)
 {
-	return (inst >> 21) & 0x1f;
+	return (ppc_inst_val(inst) >> 21) & 0x1f;
 }
 
-static inline unsigned int get_rs(u32 inst)
+static inline unsigned int get_rs(struct ppc_inst inst)
 {
-	return (inst >> 21) & 0x1f;
+	return (ppc_inst_val(inst) >> 21) & 0x1f;
 }
 
-static inline unsigned int get_ra(u32 inst)
+static inline unsigned int get_ra(struct ppc_inst inst)
 {
-	return (inst >> 16) & 0x1f;
+	return (ppc_inst_val(inst) >> 16) & 0x1f;
 }
 
-static inline unsigned int get_rb(u32 inst)
+static inline unsigned int get_rb(struct ppc_inst inst)
 {
-	return (inst >> 11) & 0x1f;
+	return (ppc_inst_val(inst) >> 11) & 0x1f;
 }
 
-static inline unsigned int get_rc(u32 inst)
+static inline unsigned int get_rc(struct ppc_inst inst)
 {
-	return inst & 0x1;
+	return ppc_inst_val(inst) & 0x1;
 }
 
-static inline unsigned int get_ws(u32 inst)
+static inline unsigned int get_ws(struct ppc_inst inst)
 {
-	return (inst >> 11) & 0x1f;
+	return (ppc_inst_val(inst) >> 11) & 0x1f;
 }
 
-static inline unsigned int get_d(u32 inst)
+static inline unsigned int get_d(struct ppc_inst inst)
 {
-	return inst & 0xffff;
+	return ppc_inst_val(inst) & 0xffff;
 }
 
-static inline unsigned int get_oc(u32 inst)
+static inline unsigned int get_oc(struct ppc_inst inst)
 {
-	return (inst >> 11) & 0x7fff;
+	return (ppc_inst_val(inst) >> 11) & 0x7fff;
 }
 
-static inline unsigned int get_tx_or_sx(u32 inst)
+static inline unsigned int get_tx_or_sx(struct ppc_inst inst)
 {
-	return (inst) & 0x1;
+	return (ppc_inst_val(inst)) & 0x1;
 }
 
 #define IS_XFORM(inst)	(get_op(inst)  == 31)
@@ -87,29 +94,30 @@ static inline unsigned int get_tx_or_sx(u32 inst)
 /*
  * Create a DSISR value from the instruction
  */
-static inline unsigned make_dsisr(unsigned instr)
+static inline unsigned make_dsisr(struct ppc_inst instr)
 {
 	unsigned dsisr;
+	u32 word = ppc_inst_val(instr);
 
 
 	/* bits  6:15 --> 22:31 */
-	dsisr = (instr & 0x03ff0000) >> 16;
+	dsisr = (word & 0x03ff0000) >> 16;
 
 	if (IS_XFORM(instr)) {
 		/* bits 29:30 --> 15:16 */
-		dsisr |= (instr & 0x00000006) << 14;
+		dsisr |= (word & 0x00000006) << 14;
 		/* bit     25 -->    17 */
-		dsisr |= (instr & 0x00000040) << 8;
+		dsisr |= (word & 0x00000040) << 8;
 		/* bits 21:24 --> 18:21 */
-		dsisr |= (instr & 0x00000780) << 3;
+		dsisr |= (word & 0x00000780) << 3;
 	} else {
 		/* bit      5 -->    17 */
-		dsisr |= (instr & 0x04000000) >> 12;
+		dsisr |= (word & 0x04000000) >> 12;
 		/* bits  1: 4 --> 18:21 */
-		dsisr |= (instr & 0x78000000) >> 17;
+		dsisr |= (word & 0x78000000) >> 17;
 		/* bits 30:31 --> 12:13 */
 		if (IS_DSFORM(instr))
-			dsisr |= (instr & 0x00000003) << 18;
+			dsisr |= (word & 0x00000003) << 18;
 	}
 
 	return dsisr;
diff --git a/arch/powerpc/include/asm/kvm_book3s.h b/arch/powerpc/include/asm/kvm_book3s.h
index d32ec9ae73bd..688c8ff78c7a 100644
--- a/arch/powerpc/include/asm/kvm_book3s.h
+++ b/arch/powerpc/include/asm/kvm_book3s.h
@@ -268,8 +268,8 @@ extern void kvmhv_emulate_tm_rollback(struct kvm_vcpu *vcpu);
 
 extern void kvmppc_entry_trampoline(void);
 extern void kvmppc_hv_entry_trampoline(void);
-extern u32 kvmppc_alignment_dsisr(struct kvm_vcpu *vcpu, unsigned int inst);
-extern ulong kvmppc_alignment_dar(struct kvm_vcpu *vcpu, unsigned int inst);
+extern u32 kvmppc_alignment_dsisr(struct kvm_vcpu *vcpu, struct ppc_inst inst);
+extern ulong kvmppc_alignment_dar(struct kvm_vcpu *vcpu, struct ppc_inst inst);
 extern int kvmppc_h_pr(struct kvm_vcpu *vcpu, unsigned long cmd);
 extern void kvmppc_pr_init_default_hcalls(struct kvm *kvm);
 extern int kvmppc_hcall_impl_pr(unsigned long cmd);
diff --git a/arch/powerpc/include/asm/kvm_book3s_asm.h b/arch/powerpc/include/asm/kvm_book3s_asm.h
index 078f4648ea27..da1ff6f23041 100644
--- a/arch/powerpc/include/asm/kvm_book3s_asm.h
+++ b/arch/powerpc/include/asm/kvm_book3s_asm.h
@@ -134,6 +134,7 @@ struct kvmppc_host_state {
 #endif
 };
 
+#include <asm/inst.h>
 struct kvmppc_book3s_shadow_vcpu {
 	bool in_use;
 	ulong gpr[14];
@@ -146,7 +147,7 @@ struct kvmppc_book3s_shadow_vcpu {
 	ulong shadow_srr1;
 	ulong fault_dar;
 	u32 fault_dsisr;
-	u32 last_inst;
+	struct ppc_inst last_inst;
 
 #ifdef CONFIG_PPC_BOOK3S_32
 	u32     sr[16];			/* Guest SRs */
diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
index e020d269416d..42937a600e6f 100644
--- a/arch/powerpc/include/asm/kvm_host.h
+++ b/arch/powerpc/include/asm/kvm_host.h
@@ -25,6 +25,7 @@
 #include <asm/cacheflush.h>
 #include <asm/hvcall.h>
 #include <asm/mce.h>
+#include <asm/inst.h>
 
 #define KVM_MAX_VCPUS		NR_CPUS
 #define KVM_MAX_VCORES		NR_CPUS
@@ -751,7 +752,7 @@ struct kvm_vcpu_arch {
 	u8 prodded;
 	u8 doorbell_request;
 	u8 irq_pending; /* Used by XIVE to signal pending guest irqs */
-	u32 last_inst;
+	struct ppc_inst last_inst;
 
 	struct rcuwait *waitp;
 	struct kvmppc_vcore *vcore;
@@ -810,7 +811,7 @@ struct kvm_vcpu_arch {
 	u64 busy_stolen;
 	u64 busy_preempt;
 
-	u32 emul_inst;
+	struct ppc_inst emul_inst;
 
 	u32 online;
 
diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
index 0a056c64c317..88dce8d1dfc7 100644
--- a/arch/powerpc/include/asm/kvm_ppc.h
+++ b/arch/powerpc/include/asm/kvm_ppc.h
@@ -29,6 +29,8 @@
 #include <asm/cpu_has_feature.h>
 #endif
 
+#include <asm/inst.h>
+
 /*
  * KVMPPC_INST_SW_BREAKPOINT is debug Instruction
  * for supporting software breakpoint.
@@ -84,7 +86,7 @@ extern int kvmppc_handle_vsx_store(struct kvm_vcpu *vcpu,
 				int is_default_endian);
 
 extern int kvmppc_load_last_inst(struct kvm_vcpu *vcpu,
-				 enum instruction_fetch_type type, u32 *inst);
+				 enum instruction_fetch_type type, struct ppc_inst *inst);
 
 extern int kvmppc_ld(struct kvm_vcpu *vcpu, ulong *eaddr, int size, void *ptr,
 		     bool data);
@@ -291,7 +293,7 @@ struct kvmppc_ops {
 	void (*destroy_vm)(struct kvm *kvm);
 	int (*get_smmu_info)(struct kvm *kvm, struct kvm_ppc_smmu_info *info);
 	int (*emulate_op)(struct kvm_vcpu *vcpu,
-			  unsigned int inst, int *advance);
+			  struct ppc_inst inst, int *advance);
 	int (*emulate_mtspr)(struct kvm_vcpu *vcpu, int sprn, ulong spr_val);
 	int (*emulate_mfspr)(struct kvm_vcpu *vcpu, int sprn, ulong *spr_val);
 	void (*fast_vcpu_kick)(struct kvm_vcpu *vcpu);
@@ -320,20 +322,20 @@ extern struct kvmppc_ops *kvmppc_hv_ops;
 extern struct kvmppc_ops *kvmppc_pr_ops;
 
 static inline int kvmppc_get_last_inst(struct kvm_vcpu *vcpu,
-				enum instruction_fetch_type type, u32 *inst)
+				enum instruction_fetch_type type, struct ppc_inst *inst)
 {
 	int ret = EMULATE_DONE;
-	u32 fetched_inst;
+	struct ppc_inst fetched_inst;
 
 	/* Load the instruction manually if it failed to do so in the
 	 * exit path */
-	if (vcpu->arch.last_inst == KVM_INST_FETCH_FAILED)
+	if (ppc_inst_equal(vcpu->arch.last_inst, ppc_inst(KVM_INST_FETCH_FAILED)))
 		ret = kvmppc_load_last_inst(vcpu, type, &vcpu->arch.last_inst);
 
 	/*  Write fetch_failed unswapped if the fetch failed */
 	if (ret == EMULATE_DONE)
 		fetched_inst = kvmppc_need_byteswap(vcpu) ?
-				swab32(vcpu->arch.last_inst) :
+				ppc_inst_swab(vcpu->arch.last_inst) :
 				vcpu->arch.last_inst;
 	else
 		fetched_inst = vcpu->arch.last_inst;
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index 8711c2164b45..96b77588bf71 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -73,6 +73,8 @@
 #include "../xmon/xmon_bpts.h"
 #endif
 
+#include <asm/inst.h>
+
 #define STACK_PT_REGS_OFFSET(sym, val)	\
 	DEFINE(sym, STACK_FRAME_OVERHEAD + offsetof(struct pt_regs, val))
 
diff --git a/arch/powerpc/kernel/kvm.c b/arch/powerpc/kernel/kvm.c
index 617eba82531c..7672847d4035 100644
--- a/arch/powerpc/kernel/kvm.c
+++ b/arch/powerpc/kernel/kvm.c
@@ -22,6 +22,7 @@
 #include <asm/disassemble.h>
 #include <asm/ppc-opcode.h>
 #include <asm/epapr_hcalls.h>
+#include <asm/code-patching.h>
 
 #define KVM_MAGIC_PAGE		(-4096L)
 #define magic_var(x) KVM_MAGIC_PAGE + offsetof(struct kvm_vcpu_arch_shared, x)
@@ -68,55 +69,49 @@ extern char kvm_tmp[];
 extern char kvm_tmp_end[];
 static int kvm_tmp_index;
 
-static void __init kvm_patch_ins(u32 *inst, u32 new_inst)
-{
-	*inst = new_inst;
-	flush_icache_range((ulong)inst, (ulong)inst + 4);
-}
-
-static void __init kvm_patch_ins_ll(u32 *inst, long addr, u32 rt)
+static void __init kvm_patch_ins_ll(struct ppc_inst *inst, long addr, u32 rt)
 {
 #ifdef CONFIG_64BIT
-	kvm_patch_ins(inst, KVM_INST_LD | rt | (addr & 0x0000fffc));
+	raw_patch_instruction(inst, ppc_inst(KVM_INST_LD | rt | (addr & 0x0000fffc)));
 #else
-	kvm_patch_ins(inst, KVM_INST_LWZ | rt | (addr & 0x0000fffc));
+	raw_patch_instruction(inst, ppc_inst(KVM_INST_LWZ | rt | (addr & 0x0000fffc)));
 #endif
 }
 
-static void __init kvm_patch_ins_ld(u32 *inst, long addr, u32 rt)
+static void __init kvm_patch_ins_ld(struct ppc_inst *inst, long addr, u32 rt)
 {
 #ifdef CONFIG_64BIT
-	kvm_patch_ins(inst, KVM_INST_LD | rt | (addr & 0x0000fffc));
+	raw_patch_instruction(inst, ppc_inst(KVM_INST_LD | rt | (addr & 0x0000fffc)));
 #else
-	kvm_patch_ins(inst, KVM_INST_LWZ | rt | ((addr + 4) & 0x0000fffc));
+	raw_patch_instruction(inst, ppc_inst(KVM_INST_LWZ | rt | ((addr + 4) & 0x0000fffc)));
 #endif
 }
 
-static void __init kvm_patch_ins_lwz(u32 *inst, long addr, u32 rt)
+static void __init kvm_patch_ins_lwz(struct ppc_inst *inst, long addr, u32 rt)
 {
-	kvm_patch_ins(inst, KVM_INST_LWZ | rt | (addr & 0x0000ffff));
+	raw_patch_instruction(inst, ppc_inst(KVM_INST_LWZ | rt | (addr & 0x0000ffff)));
 }
 
-static void __init kvm_patch_ins_std(u32 *inst, long addr, u32 rt)
+static void __init kvm_patch_ins_std(struct ppc_inst *inst, long addr, u32 rt)
 {
 #ifdef CONFIG_64BIT
-	kvm_patch_ins(inst, KVM_INST_STD | rt | (addr & 0x0000fffc));
+	raw_patch_instruction(inst, ppc_inst(KVM_INST_STD | rt | (addr & 0x0000fffc)));
 #else
-	kvm_patch_ins(inst, KVM_INST_STW | rt | ((addr + 4) & 0x0000fffc));
+	raw_patch_instruction(inst, ppc_inst(KVM_INST_STW | rt | ((addr + 4) & 0x0000fffc)));
 #endif
 }
 
-static void __init kvm_patch_ins_stw(u32 *inst, long addr, u32 rt)
+static void __init kvm_patch_ins_stw(struct ppc_inst *inst, long addr, u32 rt)
 {
-	kvm_patch_ins(inst, KVM_INST_STW | rt | (addr & 0x0000fffc));
+	raw_patch_instruction(inst, ppc_inst(KVM_INST_STW | rt | (addr & 0x0000fffc)));
 }
 
-static void __init kvm_patch_ins_nop(u32 *inst)
+static void __init kvm_patch_ins_nop(struct ppc_inst *inst)
 {
-	kvm_patch_ins(inst, KVM_INST_NOP);
+	raw_patch_instruction(inst, ppc_inst(KVM_INST_NOP));
 }
 
-static void __init kvm_patch_ins_b(u32 *inst, int addr)
+static void __init kvm_patch_ins_b(struct ppc_inst *inst, int addr)
 {
 #if defined(CONFIG_RELOCATABLE) && defined(CONFIG_PPC_BOOK3S)
 	/* On relocatable kernels interrupts handlers and our code
@@ -126,7 +121,7 @@ static void __init kvm_patch_ins_b(u32 *inst, int addr)
 		return;
 #endif
 
-	kvm_patch_ins(inst, KVM_INST_B | (addr & KVM_INST_B_MASK));
+	raw_patch_instruction(inst, ppc_inst(KVM_INST_B | (addr & KVM_INST_B_MASK)));
 }
 
 static u32 * __init kvm_alloc(int len)
@@ -152,7 +147,7 @@ extern u32 kvm_emulate_mtmsrd_orig_ins_offs;
 extern u32 kvm_emulate_mtmsrd_len;
 extern u32 kvm_emulate_mtmsrd[];
 
-static void __init kvm_patch_ins_mtmsrd(u32 *inst, u32 rt)
+static void __init kvm_patch_ins_mtmsrd(struct ppc_inst *inst, u32 rt)
 {
 	u32 *p;
 	int distance_start;
@@ -177,13 +172,13 @@ static void __init kvm_patch_ins_mtmsrd(u32 *inst, u32 rt)
 	/* Modify the chunk to fit the invocation */
 	memcpy(p, kvm_emulate_mtmsrd, kvm_emulate_mtmsrd_len * 4);
 	p[kvm_emulate_mtmsrd_branch_offs] |= distance_end & KVM_INST_B_MASK;
-	switch (get_rt(rt)) {
+	switch (get_rt(ppc_inst(rt))) {
 	case 30:
-		kvm_patch_ins_ll(&p[kvm_emulate_mtmsrd_reg_offs],
+		kvm_patch_ins_ll((struct ppc_inst *)&p[kvm_emulate_mtmsrd_reg_offs],
 				 magic_var(scratch2), KVM_RT_30);
 		break;
 	case 31:
-		kvm_patch_ins_ll(&p[kvm_emulate_mtmsrd_reg_offs],
+		kvm_patch_ins_ll((struct ppc_inst *)&p[kvm_emulate_mtmsrd_reg_offs],
 				 magic_var(scratch1), KVM_RT_30);
 		break;
 	default:
@@ -191,7 +186,7 @@ static void __init kvm_patch_ins_mtmsrd(u32 *inst, u32 rt)
 		break;
 	}
 
-	p[kvm_emulate_mtmsrd_orig_ins_offs] = *inst;
+	p[kvm_emulate_mtmsrd_orig_ins_offs] = ppc_inst_val(ppc_inst_read(inst));
 	flush_icache_range((ulong)p, (ulong)p + kvm_emulate_mtmsrd_len * 4);
 
 	/* Patch the invocation */
@@ -205,7 +200,7 @@ extern u32 kvm_emulate_mtmsr_orig_ins_offs;
 extern u32 kvm_emulate_mtmsr_len;
 extern u32 kvm_emulate_mtmsr[];
 
-static void __init kvm_patch_ins_mtmsr(u32 *inst, u32 rt)
+static void __init kvm_patch_ins_mtmsr(struct ppc_inst *inst, u32 rt)
 {
 	u32 *p;
 	int distance_start;
@@ -232,17 +227,17 @@ static void __init kvm_patch_ins_mtmsr(u32 *inst, u32 rt)
 	p[kvm_emulate_mtmsr_branch_offs] |= distance_end & KVM_INST_B_MASK;
 
 	/* Make clobbered registers work too */
-	switch (get_rt(rt)) {
+	switch (get_rt(ppc_inst(rt))) {
 	case 30:
-		kvm_patch_ins_ll(&p[kvm_emulate_mtmsr_reg1_offs],
+		kvm_patch_ins_ll((struct ppc_inst *)&p[kvm_emulate_mtmsr_reg1_offs],
 				 magic_var(scratch2), KVM_RT_30);
-		kvm_patch_ins_ll(&p[kvm_emulate_mtmsr_reg2_offs],
+		kvm_patch_ins_ll((struct ppc_inst *)&p[kvm_emulate_mtmsr_reg2_offs],
 				 magic_var(scratch2), KVM_RT_30);
 		break;
 	case 31:
-		kvm_patch_ins_ll(&p[kvm_emulate_mtmsr_reg1_offs],
+		kvm_patch_ins_ll((struct ppc_inst *)&p[kvm_emulate_mtmsr_reg1_offs],
 				 magic_var(scratch1), KVM_RT_30);
-		kvm_patch_ins_ll(&p[kvm_emulate_mtmsr_reg2_offs],
+		kvm_patch_ins_ll((struct ppc_inst *)&p[kvm_emulate_mtmsr_reg2_offs],
 				 magic_var(scratch1), KVM_RT_30);
 		break;
 	default:
@@ -251,7 +246,7 @@ static void __init kvm_patch_ins_mtmsr(u32 *inst, u32 rt)
 		break;
 	}
 
-	p[kvm_emulate_mtmsr_orig_ins_offs] = *inst;
+	p[kvm_emulate_mtmsr_orig_ins_offs] = ppc_inst_val(ppc_inst_read(inst));
 	flush_icache_range((ulong)p, (ulong)p + kvm_emulate_mtmsr_len * 4);
 
 	/* Patch the invocation */
@@ -266,7 +261,7 @@ extern u32 kvm_emulate_wrtee_orig_ins_offs;
 extern u32 kvm_emulate_wrtee_len;
 extern u32 kvm_emulate_wrtee[];
 
-static void __init kvm_patch_ins_wrtee(u32 *inst, u32 rt, int imm_one)
+static void __init kvm_patch_ins_wrtee(struct ppc_inst *inst, u32 rt, int imm_one)
 {
 	u32 *p;
 	int distance_start;
@@ -297,13 +292,13 @@ static void __init kvm_patch_ins_wrtee(u32 *inst, u32 rt, int imm_one)
 			KVM_INST_LI | __PPC_RT(R30) | MSR_EE;
 	} else {
 		/* Make clobbered registers work too */
-		switch (get_rt(rt)) {
+		switch (get_rt(ppc_inst(rt))) {
 		case 30:
-			kvm_patch_ins_ll(&p[kvm_emulate_wrtee_reg_offs],
+			kvm_patch_ins_ll((struct ppc_inst *)&p[kvm_emulate_wrtee_reg_offs],
 					 magic_var(scratch2), KVM_RT_30);
 			break;
 		case 31:
-			kvm_patch_ins_ll(&p[kvm_emulate_wrtee_reg_offs],
+			kvm_patch_ins_ll((struct ppc_inst *)&p[kvm_emulate_wrtee_reg_offs],
 					 magic_var(scratch1), KVM_RT_30);
 			break;
 		default:
@@ -312,7 +307,7 @@ static void __init kvm_patch_ins_wrtee(u32 *inst, u32 rt, int imm_one)
 		}
 	}
 
-	p[kvm_emulate_wrtee_orig_ins_offs] = *inst;
+	p[kvm_emulate_wrtee_orig_ins_offs] = ppc_inst_val(ppc_inst_read(inst));
 	flush_icache_range((ulong)p, (ulong)p + kvm_emulate_wrtee_len * 4);
 
 	/* Patch the invocation */
@@ -323,7 +318,7 @@ extern u32 kvm_emulate_wrteei_0_branch_offs;
 extern u32 kvm_emulate_wrteei_0_len;
 extern u32 kvm_emulate_wrteei_0[];
 
-static void __init kvm_patch_ins_wrteei_0(u32 *inst)
+static void __init kvm_patch_ins_wrteei_0(struct ppc_inst *inst)
 {
 	u32 *p;
 	int distance_start;
@@ -415,11 +410,11 @@ static void __init kvm_map_magic_page(void *data)
 	*features = out[0];
 }
 
-static void __init kvm_check_ins(u32 *inst, u32 features)
+static void __init kvm_check_ins(struct ppc_inst *inst, u32 features)
 {
-	u32 _inst = *inst;
-	u32 inst_no_rt = _inst & ~KVM_MASK_RT;
-	u32 inst_rt = _inst & KVM_MASK_RT;
+	struct ppc_inst _inst = ppc_inst_read(inst);
+	u32 inst_no_rt = ppc_inst_val(_inst) & ~KVM_MASK_RT;
+	u32 inst_rt = ppc_inst_val(_inst) & KVM_MASK_RT;
 
 	switch (inst_no_rt) {
 	/* Loads */
@@ -643,7 +638,7 @@ static void __init kvm_check_ins(u32 *inst, u32 features)
 #endif
 	}
 
-	switch (_inst) {
+	switch (ppc_inst_val(_inst)) {
 #ifdef CONFIG_BOOKE
 	case KVM_INST_WRTEEI_0:
 		kvm_patch_ins_wrteei_0(inst);
@@ -656,13 +651,13 @@ static void __init kvm_check_ins(u32 *inst, u32 features)
 	}
 }
 
-extern u32 kvm_template_start[];
-extern u32 kvm_template_end[];
+extern struct ppc_inst kvm_template_start[];
+extern struct ppc_inst kvm_template_end[];
 
 static void __init kvm_use_magic_page(void)
 {
-	u32 *p;
-	u32 *start, *end;
+	struct ppc_inst *p;
+	struct ppc_inst *start, *end;
 	u32 features;
 
 	/* Tell the host to map the magic page to -4096 on all CPUs */
@@ -685,10 +680,10 @@ static void __init kvm_use_magic_page(void)
 	 */
 	local_irq_disable();
 
-	for (p = start; p < end; p++) {
+	for (p = start; p < end; p = ppc_inst_next(p, p)) {
 		/* Avoid patching the template code */
 		if (p >= kvm_template_start && p < kvm_template_end) {
-			p = kvm_template_end - 1;
+			p = (void *)(kvm_template_end - 4);
 			continue;
 		}
 		kvm_check_ins(p, features);
diff --git a/arch/powerpc/kvm/book3s.c b/arch/powerpc/kvm/book3s.c
index 41fedec69ac3..70d8967acc9b 100644
--- a/arch/powerpc/kvm/book3s.c
+++ b/arch/powerpc/kvm/book3s.c
@@ -452,15 +452,17 @@ int kvmppc_xlate(struct kvm_vcpu *vcpu, ulong eaddr, enum xlate_instdata xlid,
 }
 
 int kvmppc_load_last_inst(struct kvm_vcpu *vcpu,
-		enum instruction_fetch_type type, u32 *inst)
+		enum instruction_fetch_type type, struct ppc_inst *inst)
 {
 	ulong pc = kvmppc_get_pc(vcpu);
+	u32 word;
 	int r;
 
 	if (type == INST_SC)
 		pc -= 4;
 
-	r = kvmppc_ld(vcpu, &pc, sizeof(u32), inst, false);
+	r = kvmppc_ld(vcpu, &pc, sizeof(u32), &word, false);
+	*inst = ppc_inst(word);
 	if (r == EMULATE_DONE)
 		return r;
 	else
diff --git a/arch/powerpc/kvm/book3s.h b/arch/powerpc/kvm/book3s.h
index 9b6323ec8e60..c0f9fbdc11c7 100644
--- a/arch/powerpc/kvm/book3s.h
+++ b/arch/powerpc/kvm/book3s.h
@@ -19,7 +19,7 @@ extern void kvm_set_spte_hva_hv(struct kvm *kvm, unsigned long hva, pte_t pte);
 extern int kvmppc_mmu_init_pr(struct kvm_vcpu *vcpu);
 extern void kvmppc_mmu_destroy_pr(struct kvm_vcpu *vcpu);
 extern int kvmppc_core_emulate_op_pr(struct kvm_vcpu *vcpu,
-				     unsigned int inst, int *advance);
+				     struct ppc_inst inst, int *advance);
 extern int kvmppc_core_emulate_mtspr_pr(struct kvm_vcpu *vcpu,
 					int sprn, ulong spr_val);
 extern int kvmppc_core_emulate_mfspr_pr(struct kvm_vcpu *vcpu,
diff --git a/arch/powerpc/kvm/book3s_64_mmu_hv.c b/arch/powerpc/kvm/book3s_64_mmu_hv.c
index 38ea396a23d6..775ce41738ce 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_hv.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_hv.c
@@ -406,20 +406,20 @@ static int kvmppc_mmu_book3s_64_hv_xlate(struct kvm_vcpu *vcpu, gva_t eaddr,
  * embodied here.)  If the instruction isn't a load or store, then
  * this doesn't return anything useful.
  */
-static int instruction_is_store(unsigned int instr)
+static int instruction_is_store(struct ppc_inst instr)
 {
 	unsigned int mask;
 
 	mask = 0x10000000;
-	if ((instr & 0xfc000000) == 0x7c000000)
+	if ((ppc_inst_val(instr) & 0xfc000000) == 0x7c000000)
 		mask = 0x100;		/* major opcode 31 */
-	return (instr & mask) != 0;
+	return (ppc_inst_val(instr) & mask) != 0;
 }
 
 int kvmppc_hv_emulate_mmio(struct kvm_vcpu *vcpu,
 			   unsigned long gpa, gva_t ea, int is_store)
 {
-	u32 last_inst;
+	struct ppc_inst last_inst;
 
 	/*
 	 * Fast path - check if the guest physical address corresponds to a
diff --git a/arch/powerpc/kvm/book3s_emulate.c b/arch/powerpc/kvm/book3s_emulate.c
index 0effd48c8f4d..9c299a742702 100644
--- a/arch/powerpc/kvm/book3s_emulate.c
+++ b/arch/powerpc/kvm/book3s_emulate.c
@@ -236,20 +236,21 @@ void kvmppc_emulate_tabort(struct kvm_vcpu *vcpu, int ra_val)
 #endif
 
 int kvmppc_core_emulate_op_pr(struct kvm_vcpu *vcpu,
-			      unsigned int inst, int *advance)
+			      struct ppc_inst inst, int *advance)
 {
 	int emulated = EMULATE_DONE;
 	int rt = get_rt(inst);
 	int rs = get_rs(inst);
 	int ra = get_ra(inst);
 	int rb = get_rb(inst);
-	u32 inst_sc = 0x44000002;
+	struct ppc_inst inst_sc = ppc_inst(0x44000002);
+	u32 word = ppc_inst_val(inst);
 
-	switch (get_op(inst)) {
+	switch (ppc_inst_primary_opcode(inst)) {
 	case 0:
 		emulated = EMULATE_FAIL;
 		if ((kvmppc_get_msr(vcpu) & MSR_LE) &&
-		    (inst == swab32(inst_sc))) {
+		    (ppc_inst_equal(inst, ppc_inst_swab(inst_sc)))) {
 			/*
 			 * This is the byte reversed syscall instruction of our
 			 * hypercall handler. Early versions of LE Linux didn't
@@ -301,7 +302,7 @@ int kvmppc_core_emulate_op_pr(struct kvm_vcpu *vcpu,
 		case OP_31_XOP_MTMSRD:
 		{
 			ulong rs_val = kvmppc_get_gpr(vcpu, rs);
-			if (inst & 0x10000) {
+			if (word & 0x10000) {
 				ulong new_msr = kvmppc_get_msr(vcpu);
 				new_msr &= ~(MSR_RI | MSR_EE);
 				new_msr |= rs_val & (MSR_RI | MSR_EE);
@@ -317,7 +318,7 @@ int kvmppc_core_emulate_op_pr(struct kvm_vcpu *vcpu,
 		{
 			int srnum;
 
-			srnum = kvmppc_get_field(inst, 12 + 32, 15 + 32);
+			srnum = kvmppc_get_field(word, 12 + 32, 15 + 32);
 			if (vcpu->arch.mmu.mfsrin) {
 				u32 sr;
 				sr = vcpu->arch.mmu.mfsrin(vcpu, srnum);
@@ -339,7 +340,7 @@ int kvmppc_core_emulate_op_pr(struct kvm_vcpu *vcpu,
 		}
 		case OP_31_XOP_MTSR:
 			vcpu->arch.mmu.mtsrin(vcpu,
-				(inst >> 16) & 0xf,
+				(word >> 16) & 0xf,
 				kvmppc_get_gpr(vcpu, rs));
 			break;
 		case OP_31_XOP_MTSRIN:
@@ -350,7 +351,7 @@ int kvmppc_core_emulate_op_pr(struct kvm_vcpu *vcpu,
 		case OP_31_XOP_TLBIE:
 		case OP_31_XOP_TLBIEL:
 		{
-			bool large = (inst & 0x00200000) ? true : false;
+			bool large = (word & 0x00200000) ? true : false;
 			ulong addr = kvmppc_get_gpr(vcpu, rb);
 			vcpu->arch.mmu.tlbie(vcpu, addr, large);
 			break;
@@ -407,7 +408,7 @@ int kvmppc_core_emulate_op_pr(struct kvm_vcpu *vcpu,
 			vcpu->arch.mmu.slbia(vcpu);
 			break;
 		case OP_31_XOP_SLBFEE:
-			if (!(inst & 1) || !vcpu->arch.mmu.slbfee) {
+			if (!(word & 1) || !vcpu->arch.mmu.slbfee) {
 				return EMULATE_FAIL;
 			} else {
 				ulong b, t;
@@ -507,7 +508,7 @@ int kvmppc_core_emulate_op_pr(struct kvm_vcpu *vcpu,
 					(((u64)(TM_CAUSE_EMULATE | TM_CAUSE_PERSISTENT))
 						 << TEXASR_FC_LG));
 
-				if ((inst >> 21) & 0x1)
+				if ((word >> 21) & 0x1)
 					vcpu->arch.texasr |= TEXASR_ROT;
 
 				if (kvmppc_get_msr(vcpu) & MSR_HV)
@@ -1029,12 +1030,12 @@ int kvmppc_core_emulate_mfspr_pr(struct kvm_vcpu *vcpu, int sprn, ulong *spr_val
 	return emulated;
 }
 
-u32 kvmppc_alignment_dsisr(struct kvm_vcpu *vcpu, unsigned int inst)
+u32 kvmppc_alignment_dsisr(struct kvm_vcpu *vcpu, struct ppc_inst inst)
 {
 	return make_dsisr(inst);
 }
 
-ulong kvmppc_alignment_dar(struct kvm_vcpu *vcpu, unsigned int inst)
+ulong kvmppc_alignment_dar(struct kvm_vcpu *vcpu, struct ppc_inst inst)
 {
 #ifdef CONFIG_PPC_BOOK3S_64
 	/*
@@ -1053,7 +1054,7 @@ ulong kvmppc_alignment_dar(struct kvm_vcpu *vcpu, unsigned int inst)
 	case OP_STFS:
 		if (ra)
 			dar = kvmppc_get_gpr(vcpu, ra);
-		dar += (s32)((s16)inst);
+		dar += (s32)((s16)ppc_inst_val(inst));
 		break;
 	case 31:
 		if (ra)
@@ -1061,7 +1062,8 @@ ulong kvmppc_alignment_dar(struct kvm_vcpu *vcpu, unsigned int inst)
 		dar += kvmppc_get_gpr(vcpu, rb);
 		break;
 	default:
-		printk(KERN_INFO "KVM: Unaligned instruction 0x%x\n", inst);
+		printk(KERN_INFO "KVM: Unaligned instruction %s\n",
+		       ppc_inst_as_str(inst));
 		break;
 	}
 
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 4ba06a2a306c..1041631c6f0d 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -432,9 +432,9 @@ static void kvmppc_dump_regs(struct kvm_vcpu *vcpu)
 	for (r = 0; r < vcpu->arch.slb_max; ++r)
 		pr_err("  ESID = %.16llx VSID = %.16llx\n",
 		       vcpu->arch.slb[r].orige, vcpu->arch.slb[r].origv);
-	pr_err("lpcr = %.16lx sdr1 = %.16lx last_inst = %.8x\n",
+	pr_err("lpcr = %.16lx sdr1 = %.16lx last_inst = %s\n",
 	       vcpu->arch.vcore->lpcr, vcpu->kvm->arch.sdr1,
-	       vcpu->arch.last_inst);
+	       ppc_inst_as_str(vcpu->arch.last_inst));
 }
 
 static struct kvm_vcpu *kvmppc_find_vcpu(struct kvm *kvm, int id)
@@ -1167,7 +1167,7 @@ static int kvmppc_hcall_impl_hv(unsigned long cmd)
 
 static int kvmppc_emulate_debug_inst(struct kvm_vcpu *vcpu)
 {
-	u32 last_inst;
+	struct ppc_inst last_inst;
 
 	if (kvmppc_get_last_inst(vcpu, INST_GENERIC, &last_inst) !=
 					EMULATE_DONE) {
@@ -1178,7 +1178,7 @@ static int kvmppc_emulate_debug_inst(struct kvm_vcpu *vcpu)
 		return RESUME_GUEST;
 	}
 
-	if (last_inst == KVMPPC_INST_SW_BREAKPOINT) {
+	if (ppc_inst_equal(last_inst, ppc_inst(KVMPPC_INST_SW_BREAKPOINT))) {
 		vcpu->run->exit_reason = KVM_EXIT_DEBUG;
 		vcpu->run->debug.arch.address = kvmppc_get_pc(vcpu);
 		return RESUME_HOST;
@@ -1227,7 +1227,8 @@ static unsigned long kvmppc_read_dpdes(struct kvm_vcpu *vcpu)
  */
 static int kvmppc_emulate_doorbell_instr(struct kvm_vcpu *vcpu)
 {
-	u32 inst, rb, thr;
+	struct ppc_inst inst;
+	u32 rb, thr;
 	unsigned long arg;
 	struct kvm *kvm = vcpu->kvm;
 	struct kvm_vcpu *tvcpu;
@@ -1414,9 +1415,9 @@ static int kvmppc_handle_exit_hv(struct kvm_vcpu *vcpu,
 	 * Accordingly return to Guest or Host.
 	 */
 	case BOOK3S_INTERRUPT_H_EMUL_ASSIST:
-		if (vcpu->arch.emul_inst != KVM_INST_FETCH_FAILED)
+		if (!ppc_inst_equal(vcpu->arch.emul_inst, ppc_inst(KVM_INST_FETCH_FAILED)))
 			vcpu->arch.last_inst = kvmppc_need_byteswap(vcpu) ?
-				swab32(vcpu->arch.emul_inst) :
+				ppc_inst_swab(vcpu->arch.emul_inst) :
 				vcpu->arch.emul_inst;
 		if (vcpu->guest_debug & KVM_GUESTDBG_USE_SW_BP) {
 			r = kvmppc_emulate_debug_inst(vcpu);
@@ -4096,7 +4097,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 	vcpu->arch.stolen_logged = vcore_stolen_time(vc, mftb());
 	vcpu->arch.state = KVMPPC_VCPU_RUNNABLE;
 	vcpu->arch.busy_preempt = TB_NIL;
-	vcpu->arch.last_inst = KVM_INST_FETCH_FAILED;
+	vcpu->arch.last_inst = ppc_inst(KVM_INST_FETCH_FAILED);
 	vc->runnable_threads[0] = vcpu;
 	vc->n_runnable = 1;
 	vc->runner = vcpu;
@@ -5024,7 +5025,7 @@ static void kvmppc_core_destroy_vm_hv(struct kvm *kvm)
 
 /* We don't need to emulate any privileged instructions or dcbz */
 static int kvmppc_core_emulate_op_hv(struct kvm_vcpu *vcpu,
-				     unsigned int inst, int *advance)
+				     struct ppc_inst inst, int *advance)
 {
 	return EMULATE_FAIL;
 }
diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
index 6822d23a2da4..9993d8337e3a 100644
--- a/arch/powerpc/kvm/book3s_hv_nested.c
+++ b/arch/powerpc/kvm/book3s_hv_nested.c
@@ -123,7 +123,7 @@ static void save_hv_return_state(struct kvm_vcpu *vcpu, int trap,
 		hr->asdr = vcpu->arch.fault_gpa;
 		break;
 	case BOOK3S_INTERRUPT_H_EMUL_ASSIST:
-		hr->heir = vcpu->arch.emul_inst;
+		hr->heir = ppc_inst_val(vcpu->arch.emul_inst);
 		break;
 	}
 }
@@ -183,7 +183,7 @@ void kvmhv_restore_hv_return_state(struct kvm_vcpu *vcpu,
 	vcpu->arch.fault_dar = hr->hdar;
 	vcpu->arch.fault_dsisr = hr->hdsisr;
 	vcpu->arch.fault_gpa = hr->asdr;
-	vcpu->arch.emul_inst = hr->heir;
+	vcpu->arch.emul_inst = ppc_inst_read((struct ppc_inst *)&hr->heir);
 	vcpu->arch.shregs.srr0 = hr->srr0;
 	vcpu->arch.shregs.srr1 = hr->srr1;
 	vcpu->arch.shregs.sprg0 = hr->sprg[0];
diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
index 799d6d0f4ead..4853b3444c5f 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -1360,10 +1360,13 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	   if this is an HEI (HV emulation interrupt, e40) */
 	li	r3,KVM_INST_FETCH_FAILED
 	stw	r3,VCPU_LAST_INST(r9)
+	li	r4,0xff
+	stw	r4,VCPU_LAST_INST+4(r9)
 	cmpwi	r12,BOOK3S_INTERRUPT_H_EMUL_ASSIST
 	bne	11f
 	mfspr	r3,SPRN_HEIR
 11:	stw	r3,VCPU_HEIR(r9)
+	stw	r4,VCPU_HEIR+4(r9)
 
 	/* these are volatile across C function calls */
 	mfctr	r3
@@ -2160,6 +2163,7 @@ fast_interrupt_c_return:
 
 	/* If this is for emulated MMIO, load the instruction word */
 2:	li	r8, KVM_INST_FETCH_FAILED	/* In case lwz faults */
+	li	r5, 0xff
 
 	/* Set guest mode to 'jump over instruction' so if lwz faults
 	 * we'll just continue at the next IP. */
@@ -2175,6 +2179,7 @@ fast_interrupt_c_return:
 
 	/* Store the result */
 	stw	r8, VCPU_LAST_INST(r9)
+	stw	r5, VCPU_LAST_INST+4(r9)
 
 	/* Unset guest mode. */
 	li	r0, KVM_GUEST_MODE_HOST_HV
diff --git a/arch/powerpc/kvm/book3s_hv_tm.c b/arch/powerpc/kvm/book3s_hv_tm.c
index cc90b8b82329..8cf5d4c9a842 100644
--- a/arch/powerpc/kvm/book3s_hv_tm.c
+++ b/arch/powerpc/kvm/book3s_hv_tm.c
@@ -41,11 +41,13 @@ static void emulate_tx_failure(struct kvm_vcpu *vcpu, u64 failure_cause)
  */
 int kvmhv_p9_tm_emulation(struct kvm_vcpu *vcpu)
 {
-	u32 instr = vcpu->arch.emul_inst;
+	struct ppc_inst instr = vcpu->arch.emul_inst;
 	u64 msr = vcpu->arch.shregs.msr;
 	u64 newmsr, bescr;
+	u32 word;
 	int ra, rs;
 
+	word = ppc_inst_val(instr);
 	/*
 	 * rfid, rfebb, and mtmsrd encode bit 31 = 0 since it's a reserved bit
 	 * in these instructions, so masking bit 31 out doesn't change these
@@ -57,7 +59,7 @@ int kvmhv_p9_tm_emulation(struct kvm_vcpu *vcpu)
 	 * bit 31 set) can generate a softpatch interrupt. Hence both forms
 	 * are handled below for these instructions so they behave the same way.
 	 */
-	switch (instr & PO_XOP_OPCODE_MASK) {
+	switch (word & PO_XOP_OPCODE_MASK) {
 	case PPC_INST_RFID:
 		/* XXX do we need to check for PR=0 here? */
 		newmsr = vcpu->arch.shregs.srr1;
@@ -95,7 +97,7 @@ int kvmhv_p9_tm_emulation(struct kvm_vcpu *vcpu)
 		WARN_ON_ONCE(!(MSR_TM_SUSPENDED(msr) &&
 			       ((bescr >> 30) & 3) == 2));
 		bescr &= ~BESCR_GE;
-		if (instr & (1 << 11))
+		if (word & (1 << 11))
 			bescr |= BESCR_GE;
 		vcpu->arch.bescr = bescr;
 		msr = (msr & ~MSR_TS_MASK) | MSR_TS_T;
@@ -106,7 +108,7 @@ int kvmhv_p9_tm_emulation(struct kvm_vcpu *vcpu)
 
 	case PPC_INST_MTMSRD:
 		/* XXX do we need to check for PR=0 here? */
-		rs = (instr >> 21) & 0x1f;
+		rs = (word >> 21) & 0x1f;
 		newmsr = kvmppc_get_gpr(vcpu, rs);
 		/* check this is a Sx -> T1 transition */
 		WARN_ON_ONCE(!(MSR_TM_SUSPENDED(msr) &&
@@ -144,7 +146,7 @@ int kvmhv_p9_tm_emulation(struct kvm_vcpu *vcpu)
 		vcpu->arch.regs.ccr = (vcpu->arch.regs.ccr & 0x0fffffff) |
 			(((msr & MSR_TS_MASK) >> MSR_TS_S_LG) << 29);
 		/* L=1 => tresume, L=0 => tsuspend */
-		if (instr & (1 << 21)) {
+		if (word & (1 << 21)) {
 			if (MSR_TM_SUSPENDED(msr))
 				msr = (msr & ~MSR_TS_MASK) | MSR_TS_T;
 		} else {
@@ -177,7 +179,7 @@ int kvmhv_p9_tm_emulation(struct kvm_vcpu *vcpu)
 		}
 		/* If failure was not previously recorded, recompute TEXASR */
 		if (!(vcpu->arch.orig_texasr & TEXASR_FS)) {
-			ra = (instr >> 16) & 0x1f;
+			ra = (word >> 16) & 0x1f;
 			if (ra)
 				ra = kvmppc_get_gpr(vcpu, ra) & 0xff;
 			emulate_tx_failure(vcpu, ra);
@@ -225,7 +227,8 @@ int kvmhv_p9_tm_emulation(struct kvm_vcpu *vcpu)
 
 	/* What should we do here? We didn't recognize the instruction */
 	kvmppc_core_queue_program(vcpu, SRR1_PROGILL);
-	pr_warn_ratelimited("Unrecognized TM-related instruction %#x for emulation", instr);
+	pr_warn_ratelimited("Unrecognized TM-related instruction %s for emulation",
+			    ppc_inst_as_str(instr));
 
 	return RESUME_GUEST;
 }
diff --git a/arch/powerpc/kvm/book3s_hv_tm_builtin.c b/arch/powerpc/kvm/book3s_hv_tm_builtin.c
index fad931f224ef..82e6e190c211 100644
--- a/arch/powerpc/kvm/book3s_hv_tm_builtin.c
+++ b/arch/powerpc/kvm/book3s_hv_tm_builtin.c
@@ -19,10 +19,12 @@
  */
 int kvmhv_p9_tm_emulation_early(struct kvm_vcpu *vcpu)
 {
-	u32 instr = vcpu->arch.emul_inst;
+	struct ppc_inst instr = vcpu->arch.emul_inst;
 	u64 newmsr, msr, bescr;
+	u32 word;
 	int rs;
 
+	word = ppc_inst_val(instr);
 	/*
 	 * rfid, rfebb, and mtmsrd encode bit 31 = 0 since it's a reserved bit
 	 * in these instructions, so masking bit 31 out doesn't change these
@@ -34,7 +36,7 @@ int kvmhv_p9_tm_emulation_early(struct kvm_vcpu *vcpu)
 	 * generate a softpatch interrupt. Hence both forms are handled below
 	 * for tsr. to make them behave the same way.
 	 */
-	switch (instr & PO_XOP_OPCODE_MASK) {
+	switch (word & PO_XOP_OPCODE_MASK) {
 	case PPC_INST_RFID:
 		/* XXX do we need to check for PR=0 here? */
 		newmsr = vcpu->arch.shregs.srr1;
@@ -61,7 +63,7 @@ int kvmhv_p9_tm_emulation_early(struct kvm_vcpu *vcpu)
 		if (((bescr >> 30) & 3) != 2)
 			return 0;
 		bescr &= ~BESCR_GE;
-		if (instr & (1 << 11))
+		if (word & (1 << 11))
 			bescr |= BESCR_GE;
 		mtspr(SPRN_BESCR, bescr);
 		msr = (msr & ~MSR_TS_MASK) | MSR_TS_T;
@@ -72,7 +74,7 @@ int kvmhv_p9_tm_emulation_early(struct kvm_vcpu *vcpu)
 
 	case PPC_INST_MTMSRD:
 		/* XXX do we need to check for PR=0 here? */
-		rs = (instr >> 21) & 0x1f;
+		rs = (word >> 21) & 0x1f;
 		newmsr = kvmppc_get_gpr(vcpu, rs);
 		msr = vcpu->arch.shregs.msr;
 		/* check this is a Sx -> T1 transition */
@@ -95,7 +97,7 @@ int kvmhv_p9_tm_emulation_early(struct kvm_vcpu *vcpu)
 		if (!(vcpu->arch.hfscr & HFSCR_TM) || !(msr & MSR_TM))
 			return 0;
 		/* L=1 => tresume => set TS to T (0b10) */
-		if (instr & (1 << 21))
+		if (word & (1 << 21))
 			vcpu->arch.shregs.msr = (msr & ~MSR_TS_MASK) | MSR_TS_T;
 		/* Set CR0 to 0b0010 */
 		vcpu->arch.regs.ccr = (vcpu->arch.regs.ccr & 0x0fffffff) |
diff --git a/arch/powerpc/kvm/book3s_paired_singles.c b/arch/powerpc/kvm/book3s_paired_singles.c
index a11436720a8c..7645e2c6ef1d 100644
--- a/arch/powerpc/kvm/book3s_paired_singles.c
+++ b/arch/powerpc/kvm/book3s_paired_singles.c
@@ -336,12 +336,12 @@ static int kvmppc_emulate_psq_store(struct kvm_vcpu *vcpu,
  * Cuts out inst bits with ordering according to spec.
  * That means the leftmost bit is zero. All given bits are included.
  */
-static inline u32 inst_get_field(u32 inst, int msb, int lsb)
+static inline u32 inst_get_field(struct ppc_inst inst, int msb, int lsb)
 {
-	return kvmppc_get_field(inst, msb + 32, lsb + 32);
+	return kvmppc_get_field(ppc_inst_val(inst), msb + 32, lsb + 32);
 }
 
-static bool kvmppc_inst_is_paired_single(struct kvm_vcpu *vcpu, u32 inst)
+static bool kvmppc_inst_is_paired_single(struct kvm_vcpu *vcpu, struct ppc_inst inst)
 {
 	if (!(vcpu->arch.hflags & BOOK3S_HFLAG_PAIRED_SINGLE))
 		return false;
@@ -477,9 +477,10 @@ static bool kvmppc_inst_is_paired_single(struct kvm_vcpu *vcpu, u32 inst)
 	return false;
 }
 
-static int get_d_signext(u32 inst)
+static int get_d_signext(struct ppc_inst inst)
 {
-	int d = inst & 0x8ff;
+	u32 word = ppc_inst_val(inst);
+	int d = word & 0x8ff;
 
 	if (d & 0x800)
 		return -(d & 0x7ff);
@@ -620,7 +621,7 @@ static int kvmppc_ps_one_in(struct kvm_vcpu *vcpu, bool rc,
 
 int kvmppc_emulate_paired_single(struct kvm_vcpu *vcpu)
 {
-	u32 inst;
+	struct ppc_inst inst;
 	enum emulation_result emulated = EMULATE_DONE;
 	int ax_rd, ax_ra, ax_rb, ax_rc;
 	short full_d;
@@ -647,7 +648,7 @@ int kvmppc_emulate_paired_single(struct kvm_vcpu *vcpu)
 	fpr_b = &VCPU_FPR(vcpu, ax_rb);
 	fpr_c = &VCPU_FPR(vcpu, ax_rc);
 
-	rcomp = (inst & 1) ? true : false;
+	rcomp = (ppc_inst_val(inst) & 1) ? true : false;
 	cr = kvmppc_get_cr(vcpu);
 
 	if (!kvmppc_inst_is_paired_single(vcpu, inst))
diff --git a/arch/powerpc/kvm/book3s_pr.c b/arch/powerpc/kvm/book3s_pr.c
index 88fac22fbf09..3a07f520b385 100644
--- a/arch/powerpc/kvm/book3s_pr.c
+++ b/arch/powerpc/kvm/book3s_pr.c
@@ -1093,7 +1093,7 @@ static int kvmppc_exit_pr_progint(struct kvm_vcpu *vcpu, unsigned int exit_nr)
 {
 	enum emulation_result er;
 	ulong flags;
-	u32 last_inst;
+	struct ppc_inst last_inst;
 	int emul, r;
 
 	/*
@@ -1113,10 +1113,10 @@ static int kvmppc_exit_pr_progint(struct kvm_vcpu *vcpu, unsigned int exit_nr)
 
 	if (kvmppc_get_msr(vcpu) & MSR_PR) {
 #ifdef EXIT_DEBUG
-		pr_info("Userspace triggered 0x700 exception at\n 0x%lx (0x%x)\n",
-			kvmppc_get_pc(vcpu), last_inst);
+		pr_info("Userspace triggered 0x700 exception at\n 0x%lx (%s)\n",
+			kvmppc_get_pc(vcpu), ppc_inst_as_str(last_inst));
 #endif
-		if ((last_inst & 0xff0007ff) != (INS_DCBZ & 0xfffffff7)) {
+		if ((ppc_inst_val(last_inst) & 0xff0007ff) != (INS_DCBZ & 0xfffffff7)) {
 			kvmppc_core_queue_program(vcpu, flags);
 			return RESUME_GUEST;
 		}
@@ -1132,8 +1132,8 @@ static int kvmppc_exit_pr_progint(struct kvm_vcpu *vcpu, unsigned int exit_nr)
 		r = RESUME_GUEST;
 		break;
 	case EMULATE_FAIL:
-		pr_crit("%s: emulation at %lx failed (%08x)\n",
-			__func__, kvmppc_get_pc(vcpu), last_inst);
+		pr_crit("%s: emulation at %lx failed (%s)\n",
+			__func__, kvmppc_get_pc(vcpu), ppc_inst_as_str(last_inst));
 		kvmppc_core_queue_program(vcpu, flags);
 		r = RESUME_GUEST;
 		break;
@@ -1295,7 +1295,7 @@ int kvmppc_handle_exit_pr(struct kvm_vcpu *vcpu, unsigned int exit_nr)
 		break;
 	case BOOK3S_INTERRUPT_SYSCALL:
 	{
-		u32 last_sc;
+		struct ppc_inst last_sc;
 		int emul;
 
 		/* Get last sc for papr */
@@ -1310,7 +1310,7 @@ int kvmppc_handle_exit_pr(struct kvm_vcpu *vcpu, unsigned int exit_nr)
 		}
 
 		if (vcpu->arch.papr_enabled &&
-		    (last_sc == 0x44000022) &&
+		    (ppc_inst_equal(last_sc, ppc_inst(0x44000022))) &&
 		    !(kvmppc_get_msr(vcpu) & MSR_PR)) {
 			/* SC 1 papr hypercalls */
 			ulong cmd = kvmppc_get_gpr(vcpu, 3);
@@ -1362,7 +1362,7 @@ int kvmppc_handle_exit_pr(struct kvm_vcpu *vcpu, unsigned int exit_nr)
 	{
 		int ext_msr = 0;
 		int emul;
-		u32 last_inst;
+		struct ppc_inst last_inst;
 
 		if (vcpu->arch.hflags & BOOK3S_HFLAG_PAIRED_SINGLE) {
 			/* Do paired single instruction emulation */
@@ -1396,7 +1396,7 @@ int kvmppc_handle_exit_pr(struct kvm_vcpu *vcpu, unsigned int exit_nr)
 	}
 	case BOOK3S_INTERRUPT_ALIGNMENT:
 	{
-		u32 last_inst;
+		struct ppc_inst last_inst;
 		int emul = kvmppc_get_last_inst(vcpu, INST_GENERIC, &last_inst);
 
 		if (emul == EMULATE_DONE) {
diff --git a/arch/powerpc/kvm/booke.c b/arch/powerpc/kvm/booke.c
index 3e1c9f08e302..e6b83d7b3a62 100644
--- a/arch/powerpc/kvm/booke.c
+++ b/arch/powerpc/kvm/booke.c
@@ -816,12 +816,12 @@ static int emulation_exit(struct kvm_vcpu *vcpu)
 		return RESUME_GUEST;
 
 	case EMULATE_FAIL:
-		printk(KERN_CRIT "%s: emulation at %lx failed (%08x)\n",
-		       __func__, vcpu->arch.regs.nip, vcpu->arch.last_inst);
+		printk(KERN_CRIT "%s: emulation at %lx failed (%s)\n",
+		       __func__, vcpu->arch.regs.nip, ppc_inst_as_str(vcpu->arch.last_inst));
 		/* For debugging, encode the failing instruction and
 		 * report it to userspace. */
-		vcpu->run->hw.hardware_exit_reason = ~0ULL << 32;
-		vcpu->run->hw.hardware_exit_reason |= vcpu->arch.last_inst;
+		run->hw.hardware_exit_reason = ~0ULL << 32;
+		run->hw.hardware_exit_reason |= ppc_inst_val(vcpu->arch.last_inst);
 		kvmppc_core_queue_program(vcpu, ESR_PIL);
 		return RESUME_HOST;
 
@@ -955,7 +955,7 @@ static void kvmppc_restart_interrupt(struct kvm_vcpu *vcpu,
 }
 
 static int kvmppc_resume_inst_load(struct kvm_vcpu *vcpu,
-				  enum emulation_result emulated, u32 last_inst)
+				  enum emulation_result emulated, struct ppc_inst last_inst)
 {
 	switch (emulated) {
 	case EMULATE_AGAIN:
@@ -966,8 +966,8 @@ static int kvmppc_resume_inst_load(struct kvm_vcpu *vcpu,
 		       __func__, vcpu->arch.regs.nip);
 		/* For debugging, encode the failing instruction and
 		 * report it to userspace. */
-		vcpu->run->hw.hardware_exit_reason = ~0ULL << 32;
-		vcpu->run->hw.hardware_exit_reason |= last_inst;
+		run->hw.hardware_exit_reason = ~0ULL << 32;
+		run->hw.hardware_exit_reason |= ppc_inst_val(last_inst);
 		kvmppc_core_queue_program(vcpu, ESR_PIL);
 		return RESUME_HOST;
 
@@ -987,7 +987,7 @@ int kvmppc_handle_exit(struct kvm_vcpu *vcpu, unsigned int exit_nr)
 	int r = RESUME_HOST;
 	int s;
 	int idx;
-	u32 last_inst = KVM_INST_FETCH_FAILED;
+	struct ppc_inst last_inst = ppc_inst(KVM_INST_FETCH_FAILED);
 	enum emulation_result emulated = EMULATE_DONE;
 
 	/* update before a new last_exit_type is rewritten */
@@ -1089,7 +1089,7 @@ int kvmppc_handle_exit(struct kvm_vcpu *vcpu, unsigned int exit_nr)
 
 	case BOOKE_INTERRUPT_PROGRAM:
 		if ((vcpu->guest_debug & KVM_GUESTDBG_USE_SW_BP) &&
-			(last_inst == KVMPPC_INST_SW_BREAKPOINT)) {
+			(ppc_inst_equal(last_inst, ppc_inst(KVMPPC_INST_SW_BREAKPOINT)))) {
 			/*
 			 * We are here because of an SW breakpoint instr,
 			 * so lets return to host to handle.
diff --git a/arch/powerpc/kvm/booke.h b/arch/powerpc/kvm/booke.h
index be9da96d9f06..66bfdd750ebf 100644
--- a/arch/powerpc/kvm/booke.h
+++ b/arch/powerpc/kvm/booke.h
@@ -71,7 +71,7 @@ void kvmppc_set_tsr_bits(struct kvm_vcpu *vcpu, u32 tsr_bits);
 void kvmppc_clr_tsr_bits(struct kvm_vcpu *vcpu, u32 tsr_bits);
 
 int kvmppc_booke_emulate_op(struct kvm_vcpu *vcpu,
-                            unsigned int inst, int *advance);
+			    struct ppc_inst inst, int *advance);
 int kvmppc_booke_emulate_mfspr(struct kvm_vcpu *vcpu, int sprn, ulong *spr_val);
 int kvmppc_booke_emulate_mtspr(struct kvm_vcpu *vcpu, int sprn, ulong spr_val);
 
@@ -95,7 +95,7 @@ enum int_class {
 void kvmppc_set_pending_interrupt(struct kvm_vcpu *vcpu, enum int_class type);
 
 extern int kvmppc_core_emulate_op_e500(struct kvm_vcpu *vcpu,
-				       unsigned int inst, int *advance);
+				       struct ppc_inst inst, int *advance);
 extern int kvmppc_core_emulate_mtspr_e500(struct kvm_vcpu *vcpu, int sprn,
 					  ulong spr_val);
 extern int kvmppc_core_emulate_mfspr_e500(struct kvm_vcpu *vcpu, int sprn,
diff --git a/arch/powerpc/kvm/booke_emulate.c b/arch/powerpc/kvm/booke_emulate.c
index d8d38aca71bd..ce3323c1e3e5 100644
--- a/arch/powerpc/kvm/booke_emulate.c
+++ b/arch/powerpc/kvm/booke_emulate.c
@@ -40,7 +40,7 @@ static void kvmppc_emul_rfci(struct kvm_vcpu *vcpu)
 }
 
 int kvmppc_booke_emulate_op(struct kvm_vcpu *vcpu,
-                            unsigned int inst, int *advance)
+			    struct ppc_inst inst, int *advance)
 {
 	int emulated = EMULATE_DONE;
 	int rs = get_rs(inst);
@@ -94,7 +94,7 @@ int kvmppc_booke_emulate_op(struct kvm_vcpu *vcpu,
 
 		case OP_31_XOP_WRTEEI:
 			vcpu->arch.shared->msr = (vcpu->arch.shared->msr & ~MSR_EE)
-							 | (inst & MSR_EE);
+							 | (ppc_inst_val(inst) & MSR_EE);
 			kvmppc_set_exit_type(vcpu, EMULATED_WRTEE_EXITS);
 			break;
 
diff --git a/arch/powerpc/kvm/e500_emulate.c b/arch/powerpc/kvm/e500_emulate.c
index 64eb833e9f02..3274b659cb55 100644
--- a/arch/powerpc/kvm/e500_emulate.c
+++ b/arch/powerpc/kvm/e500_emulate.c
@@ -84,7 +84,7 @@ static int kvmppc_e500_emul_msgsnd(struct kvm_vcpu *vcpu, int rb)
 #endif
 
 static int kvmppc_e500_emul_ehpriv(struct kvm_vcpu *vcpu,
-				   unsigned int inst, int *advance)
+				   struct ppc_inst inst, int *advance)
 {
 	int emulated = EMULATE_DONE;
 
@@ -112,7 +112,7 @@ static int kvmppc_e500_emul_dcbtls(struct kvm_vcpu *vcpu)
 	return EMULATE_DONE;
 }
 
-static int kvmppc_e500_emul_mftmr(struct kvm_vcpu *vcpu, unsigned int inst,
+static int kvmppc_e500_emul_mftmr(struct kvm_vcpu *vcpu, struct ppc_inst inst,
 				  int rt)
 {
 	/* Expose one thread per vcpu */
@@ -126,7 +126,7 @@ static int kvmppc_e500_emul_mftmr(struct kvm_vcpu *vcpu, unsigned int inst,
 }
 
 int kvmppc_core_emulate_op_e500(struct kvm_vcpu *vcpu,
-				unsigned int inst, int *advance)
+				struct ppc_inst inst, int *advance)
 {
 	int emulated = EMULATE_DONE;
 	int ra = get_ra(inst);
diff --git a/arch/powerpc/kvm/e500_mmu_host.c b/arch/powerpc/kvm/e500_mmu_host.c
index d6c1069e9954..5710ad853dc8 100644
--- a/arch/powerpc/kvm/e500_mmu_host.c
+++ b/arch/powerpc/kvm/e500_mmu_host.c
@@ -623,7 +623,7 @@ void kvmppc_mmu_map(struct kvm_vcpu *vcpu, u64 eaddr, gpa_t gpaddr,
 
 #ifdef CONFIG_KVM_BOOKE_HV
 int kvmppc_load_last_inst(struct kvm_vcpu *vcpu,
-		enum instruction_fetch_type type, u32 *instr)
+		enum instruction_fetch_type type, struct ppc_inst *instr)
 {
 	gva_t geaddr;
 	hpa_t addr;
@@ -706,14 +706,14 @@ int kvmppc_load_last_inst(struct kvm_vcpu *vcpu,
 	/* Map a page and get guest's instruction */
 	page = pfn_to_page(pfn);
 	eaddr = (unsigned long)kmap_atomic(page);
-	*instr = *(u32 *)(eaddr | (unsigned long)(addr & ~PAGE_MASK));
+	*instr = ppc_inst_read((struct ppc_inst *)(eaddr | (unsigned long)(addr & ~PAGE_MASK)));
 	kunmap_atomic((u32 *)eaddr);
 
 	return EMULATE_DONE;
 }
 #else
 int kvmppc_load_last_inst(struct kvm_vcpu *vcpu,
-		enum instruction_fetch_type type, u32 *instr)
+		enum instruction_fetch_type type, struct ppc_inst *instr)
 {
 	return EMULATE_AGAIN;
 }
diff --git a/arch/powerpc/kvm/emulate.c b/arch/powerpc/kvm/emulate.c
index ee1147c98cd8..e439012e91f1 100644
--- a/arch/powerpc/kvm/emulate.c
+++ b/arch/powerpc/kvm/emulate.c
@@ -193,7 +193,7 @@ static int kvmppc_emulate_mfspr(struct kvm_vcpu *vcpu, int sprn, int rt)
  * from opcode tables in the future. */
 int kvmppc_emulate_instruction(struct kvm_vcpu *vcpu)
 {
-	u32 inst;
+	struct ppc_inst inst;
 	int rs, rt, sprn;
 	enum emulation_result emulated;
 	int advance = 1;
@@ -211,7 +211,7 @@ int kvmppc_emulate_instruction(struct kvm_vcpu *vcpu)
 	rt = get_rt(inst);
 	sprn = get_sprn(inst);
 
-	switch (get_op(inst)) {
+	switch (ppc_inst_primary_opcode(inst)) {
 	case OP_TRAP:
 #ifdef CONFIG_PPC_BOOK3S
 	case OP_TRAP_64:
@@ -269,7 +269,7 @@ int kvmppc_emulate_instruction(struct kvm_vcpu *vcpu)
 		 * Instruction with primary opcode 0. Based on PowerISA
 		 * these are illegal instructions.
 		 */
-		if (inst == KVMPPC_INST_SW_BREAKPOINT) {
+		if (ppc_inst_equal(inst, ppc_inst(KVMPPC_INST_SW_BREAKPOINT))) {
 			vcpu->run->exit_reason = KVM_EXIT_DEBUG;
 			vcpu->run->debug.arch.status = 0;
 			vcpu->run->debug.arch.address = kvmppc_get_pc(vcpu);
@@ -291,16 +291,17 @@ int kvmppc_emulate_instruction(struct kvm_vcpu *vcpu)
 			advance = 0;
 		} else if (emulated == EMULATE_FAIL) {
 			advance = 0;
-			printk(KERN_ERR "Couldn't emulate instruction 0x%08x "
-			       "(op %d xop %d)\n", inst, get_op(inst), get_xop(inst));
+			printk(KERN_ERR "Couldn't emulate instruction %s "
+			       "(op %d xop %d)\n", ppc_inst_as_str(inst),
+			       ppc_inst_primary_opcode(inst), get_xop(inst));
 		}
 	}
 
-	trace_kvm_ppc_instr(inst, kvmppc_get_pc(vcpu), emulated);
+	trace_kvm_ppc_instr(&inst, kvmppc_get_pc(vcpu), emulated);
 
 	/* Advance past emulated instruction. */
 	if (advance)
-		kvmppc_set_pc(vcpu, kvmppc_get_pc(vcpu) + 4);
+		kvmppc_set_pc(vcpu, kvmppc_get_pc(vcpu) + ppc_inst_len(inst));
 
 	return emulated;
 }
diff --git a/arch/powerpc/kvm/emulate_loadstore.c b/arch/powerpc/kvm/emulate_loadstore.c
index 48272a9b9c30..62050c830753 100644
--- a/arch/powerpc/kvm/emulate_loadstore.c
+++ b/arch/powerpc/kvm/emulate_loadstore.c
@@ -71,7 +71,7 @@ static bool kvmppc_check_altivec_disabled(struct kvm_vcpu *vcpu)
  */
 int kvmppc_emulate_loadstore(struct kvm_vcpu *vcpu)
 {
-	u32 inst;
+	struct ppc_inst inst;
 	enum emulation_result emulated = EMULATE_FAIL;
 	int advance = 1;
 	struct instruction_op op;
@@ -94,7 +94,7 @@ int kvmppc_emulate_loadstore(struct kvm_vcpu *vcpu)
 
 	emulated = EMULATE_FAIL;
 	vcpu->arch.regs.msr = vcpu->arch.shared->msr;
-	if (analyse_instr(&op, &vcpu->arch.regs, ppc_inst(inst)) == 0) {
+	if (analyse_instr(&op, &vcpu->arch.regs, inst) == 0) {
 		int type = op.type & INSTR_TYPE_MASK;
 		int size = GETSIZE(op.type);
 
@@ -360,11 +360,11 @@ int kvmppc_emulate_loadstore(struct kvm_vcpu *vcpu)
 		kvmppc_core_queue_program(vcpu, 0);
 	}
 
-	trace_kvm_ppc_instr(inst, kvmppc_get_pc(vcpu), emulated);
+	trace_kvm_ppc_instr(&inst, kvmppc_get_pc(vcpu), emulated);
 
 	/* Advance past emulated instruction. */
 	if (advance)
-		kvmppc_set_pc(vcpu, kvmppc_get_pc(vcpu) + 4);
+		kvmppc_set_pc(vcpu, kvmppc_get_pc(vcpu) + ppc_inst_len(inst));
 
 	return emulated;
 }
diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index 13999123b735..2406e92c10bd 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -304,11 +304,11 @@ int kvmppc_emulate_mmio(struct kvm_vcpu *vcpu)
 		break;
 	case EMULATE_FAIL:
 	{
-		u32 last_inst;
+		struct ppc_inst last_inst;
 
 		kvmppc_get_last_inst(vcpu, INST_GENERIC, &last_inst);
 		/* XXX Deliver Program interrupt to guest. */
-		pr_emerg("%s: emulation failed (%08x)\n", __func__, last_inst);
+		pr_emerg("%s: emulation failed (%s)\n", __func__, ppc_inst_as_str(last_inst));
 		r = RESUME_HOST;
 		break;
 	}
diff --git a/arch/powerpc/kvm/trace.h b/arch/powerpc/kvm/trace.h
index ea1d7c808319..1bfccb9df7b1 100644
--- a/arch/powerpc/kvm/trace.h
+++ b/arch/powerpc/kvm/trace.h
@@ -3,6 +3,7 @@
 #define _TRACE_KVM_H
 
 #include <linux/tracepoint.h>
+#include <asm/inst.h>
 
 #undef TRACE_SYSTEM
 #define TRACE_SYSTEM kvm
@@ -11,11 +12,11 @@
  * Tracepoint for guest mode entry.
  */
 TRACE_EVENT(kvm_ppc_instr,
-	TP_PROTO(unsigned int inst, unsigned long _pc, unsigned int emulate),
+	TP_PROTO(struct ppc_inst *inst, unsigned long _pc, unsigned int emulate),
 	TP_ARGS(inst, _pc, emulate),
 
 	TP_STRUCT__entry(
-		__field(	unsigned int,	inst		)
+		__field(	struct ppc_inst *,	inst	)
 		__field(	unsigned long,	pc		)
 		__field(	unsigned int,	emulate		)
 	),
@@ -26,8 +27,8 @@ TRACE_EVENT(kvm_ppc_instr,
 		__entry->emulate	= emulate;
 	),
 
-	TP_printk("inst %u pc 0x%lx emulate %u\n",
-		  __entry->inst, __entry->pc, __entry->emulate)
+	TP_printk("inst %s pc 0x%lx emulate %u\n",
+		  ppc_inst_as_str(*(__entry->inst)), __entry->pc, __entry->emulate)
 );
 
 TRACE_EVENT(kvm_stlb_inval,
diff --git a/arch/powerpc/kvm/trace_booke.h b/arch/powerpc/kvm/trace_booke.h
index 3837842986aa..a59475f2d4b1 100644
--- a/arch/powerpc/kvm/trace_booke.h
+++ b/arch/powerpc/kvm/trace_booke.h
@@ -44,7 +44,7 @@ TRACE_EVENT(kvm_exit,
 		__field(	unsigned long,	pc		)
 		__field(	unsigned long,	msr		)
 		__field(	unsigned long,	dar		)
-		__field(	unsigned long,	last_inst	)
+		__field(	struct ppc_inst *,	last_inst	)
 	),
 
 	TP_fast_assign(
@@ -52,20 +52,20 @@ TRACE_EVENT(kvm_exit,
 		__entry->pc		= kvmppc_get_pc(vcpu);
 		__entry->dar		= kvmppc_get_fault_dar(vcpu);
 		__entry->msr		= vcpu->arch.shared->msr;
-		__entry->last_inst	= vcpu->arch.last_inst;
+		__entry->last_inst	= &(vcpu->arch.last_inst);
 	),
 
 	TP_printk("exit=%s"
 		" | pc=0x%lx"
 		" | msr=0x%lx"
 		" | dar=0x%lx"
-		" | last_inst=0x%lx"
+		" | last_inst=%s"
 		,
 		__print_symbolic(__entry->exit_nr, kvm_trace_symbol_exit),
 		__entry->pc,
 		__entry->msr,
 		__entry->dar,
-		__entry->last_inst
+		ppc_inst_as_str(*(__entry->last_inst))
 		)
 );
 
diff --git a/arch/powerpc/kvm/trace_pr.h b/arch/powerpc/kvm/trace_pr.h
index 46a46d328fbf..d49807afd5fd 100644
--- a/arch/powerpc/kvm/trace_pr.h
+++ b/arch/powerpc/kvm/trace_pr.h
@@ -224,7 +224,7 @@ TRACE_EVENT(kvm_exit,
 		__field(	unsigned long,	msr		)
 		__field(	unsigned long,	dar		)
 		__field(	unsigned long,	srr1		)
-		__field(	unsigned long,	last_inst	)
+		__field(	struct ppc_inst *,	last_inst	)
 	),
 
 	TP_fast_assign(
@@ -233,7 +233,7 @@ TRACE_EVENT(kvm_exit,
 		__entry->dar		= kvmppc_get_fault_dar(vcpu);
 		__entry->msr		= kvmppc_get_msr(vcpu);
 		__entry->srr1		= vcpu->arch.shadow_srr1;
-		__entry->last_inst	= vcpu->arch.last_inst;
+		__entry->last_inst	= &(vcpu->arch.last_inst);
 	),
 
 	TP_printk("exit=%s"
@@ -241,14 +241,14 @@ TRACE_EVENT(kvm_exit,
 		" | msr=0x%lx"
 		" | dar=0x%lx"
 		" | srr1=0x%lx"
-		" | last_inst=0x%lx"
+		" | last_inst=%s"
 		,
 		__print_symbolic(__entry->exit_nr, kvm_trace_symbol_exit),
 		__entry->pc,
 		__entry->msr,
 		__entry->dar,
 		__entry->srr1,
-		__entry->last_inst
+		ppc_inst_as_str(*(__entry->last_inst))
 		)
 );
 
diff --git a/arch/powerpc/lib/inst.c b/arch/powerpc/lib/inst.c
index 9cc17eb62462..7bcf3b300f42 100644
--- a/arch/powerpc/lib/inst.c
+++ b/arch/powerpc/lib/inst.c
@@ -18,7 +18,7 @@ int probe_user_read_inst(struct ppc_inst *inst,
 	err = copy_from_user_nofault(&val, nip, sizeof(val));
 	if (err)
 		return err;
-	if (get_op(val) == OP_PREFIX) {
+	if ((val >> 26) == OP_PREFIX) {
 		err = copy_from_user_nofault(&suffix, (void __user *)nip + 4, 4);
 		*inst = ppc_inst_prefix(val, suffix);
 	} else {
@@ -36,7 +36,7 @@ int probe_kernel_read_inst(struct ppc_inst *inst,
 	err = copy_from_kernel_nofault(&val, src, sizeof(val));
 	if (err)
 		return err;
-	if (get_op(val) == OP_PREFIX) {
+	if ((val >> 26) == OP_PREFIX) {
 		err = copy_from_kernel_nofault(&suffix, (void *)src + 4, 4);
 		*inst = ppc_inst_prefix(val, suffix);
 	} else {
diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index caee8cc77e19..885bcd5170af 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -1348,7 +1348,7 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 		rd = (suffix >> 21) & 0x1f;
 		op->reg = rd;
 		op->val = regs->gpr[rd];
-		suffixopcode = get_op(suffix);
+		suffixopcode = suffix >> 26;
 		prefixtype = (word >> 24) & 0x3;
 		switch (prefixtype) {
 		case 2:
@@ -2737,7 +2737,7 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 		op->reg = rd;
 		op->val = regs->gpr[rd];
 
-		suffixopcode = get_op(suffix);
+		suffixopcode = suffix >> 26;
 		prefixtype = (word >> 24) & 0x3;
 		switch (prefixtype) {
 		case 0: /* Type 00  Eight-Byte Load/Store */
diff --git a/arch/powerpc/sysdev/fsl_pci.c b/arch/powerpc/sysdev/fsl_pci.c
index 040b9d01c079..488f8c3d4d0e 100644
--- a/arch/powerpc/sysdev/fsl_pci.c
+++ b/arch/powerpc/sysdev/fsl_pci.c
@@ -930,7 +930,7 @@ u64 fsl_pci_immrbar_base(struct pci_controller *hose)
 }
 
 #ifdef CONFIG_E500
-static int mcheck_handle_load(struct pt_regs *regs, u32 inst)
+static int mcheck_handle_load(struct pt_regs *regs, struct ppc_inst inst)
 {
 	unsigned int rd, ra, rb, d;
 
@@ -1050,7 +1050,7 @@ static int is_in_pci_mem_space(phys_addr_t addr)
 
 int fsl_pci_mcheck_exception(struct pt_regs *regs)
 {
-	u32 inst;
+	struct ppc_inst inst;
 	int ret;
 	phys_addr_t addr = 0;
 
-- 
2.17.1

