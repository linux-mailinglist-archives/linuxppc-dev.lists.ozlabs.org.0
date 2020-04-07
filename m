Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7541A077D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 08:42:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48xHsR3qJdzDqwm
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 16:42:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bala24@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48xHq44y10zDqw9
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Apr 2020 16:40:47 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0376YiDd048744
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 7 Apr 2020 02:40:44 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3082hxwksf-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Apr 2020 02:40:44 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bala24@linux.ibm.com>;
 Tue, 7 Apr 2020 07:40:30 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 7 Apr 2020 07:40:28 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0376edhf49938650
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Apr 2020 06:40:39 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E9E985205A;
 Tue,  7 Apr 2020 06:40:38 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.199.51.145])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id B9C5452057;
 Tue,  7 Apr 2020 06:40:37 +0000 (GMT)
Subject: Re: [PATCH v5 04/21] powerpc: Use a macro for creating instructions
 from u32s
From: Balamuruhan S <bala24@linux.ibm.com>
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
Date: Tue, 07 Apr 2020 12:10:36 +0530
In-Reply-To: <20200406080936.7180-5-jniethe5@gmail.com>
References: <20200406080936.7180-1-jniethe5@gmail.com>
 <20200406080936.7180-5-jniethe5@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20040706-0012-0000-0000-0000039FCD5A
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20040706-0013-0000-0000-000021DCED73
Message-Id: <8e725ed4e48011261a171c0160966d0c2c670f9a.camel@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-07_01:2020-04-07,
 2020-04-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004070051
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
Cc: alistair@popple.id.au, npiggin@gmail.com, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2020-04-06 at 18:09 +1000, Jordan Niethe wrote:
> In preparation for instructions having a more complex data type start
> using a macro, ppc_inst(), for making an instruction out of a u32.  A
> macro is used so that instructions can be used as initializer elements.
> Currently this does nothing, but it will allow for creating a data type
> that can represent prefixed instructions.
> 
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
> v4: New to series
> v5: - Rename PPC_INST() -> ppc_inst().
>     - Use on epapr_paravirt.c, kgdb.c
> ---
>  arch/powerpc/include/asm/code-patching.h |  3 +-
>  arch/powerpc/include/asm/inst.h          | 11 +++++
>  arch/powerpc/kernel/align.c              |  1 +
>  arch/powerpc/kernel/epapr_paravirt.c     |  5 ++-
>  arch/powerpc/kernel/hw_breakpoint.c      |  3 +-
>  arch/powerpc/kernel/jump_label.c         |  3 +-
>  arch/powerpc/kernel/kgdb.c               |  5 ++-
>  arch/powerpc/kernel/kprobes.c            |  5 ++-
>  arch/powerpc/kernel/module_64.c          |  3 +-
>  arch/powerpc/kernel/optprobes.c          | 31 ++++++-------
>  arch/powerpc/kernel/security.c           |  9 ++--
>  arch/powerpc/kernel/trace/ftrace.c       | 25 ++++++-----
>  arch/powerpc/kernel/uprobes.c            |  1 +
>  arch/powerpc/kvm/emulate_loadstore.c     |  2 +-
>  arch/powerpc/lib/code-patching.c         | 57 ++++++++++++------------
>  arch/powerpc/lib/feature-fixups.c        | 39 ++++++++--------
>  arch/powerpc/lib/test_emulate_step.c     | 39 ++++++++--------
>  arch/powerpc/xmon/xmon.c                 |  7 +--
>  18 files changed, 138 insertions(+), 111 deletions(-)
>  create mode 100644 arch/powerpc/include/asm/inst.h
> 
> diff --git a/arch/powerpc/include/asm/code-patching.h
> b/arch/powerpc/include/asm/code-patching.h
> index 351dda7215b6..48e021957ee5 100644
> --- a/arch/powerpc/include/asm/code-patching.h
> +++ b/arch/powerpc/include/asm/code-patching.h
> @@ -11,6 +11,7 @@
>  #include <linux/string.h>
>  #include <linux/kallsyms.h>
>  #include <asm/asm-compat.h>
> +#include <asm/inst.h>
>  
>  /* Flags for create_branch:
>   * "b"   == create_branch(addr, target, 0);
> @@ -48,7 +49,7 @@ static inline int patch_branch_site(s32 *site, unsigned
> long target, int flags)
>  static inline int modify_instruction(unsigned int *addr, unsigned int clr,
>  				     unsigned int set)
>  {
> -	return patch_instruction(addr, (*addr & ~clr) | set);
> +	return patch_instruction(addr, ppc_inst((*addr & ~clr) | set));
>  }
>  
>  static inline int modify_instruction_site(s32 *site, unsigned int clr,
> unsigned int set)
> diff --git a/arch/powerpc/include/asm/inst.h
> b/arch/powerpc/include/asm/inst.h
> new file mode 100644
> index 000000000000..5298ba33b6e5
> --- /dev/null
> +++ b/arch/powerpc/include/asm/inst.h
> @@ -0,0 +1,11 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +#ifndef _ASM_INST_H
> +#define _ASM_INST_H
> +
> +/*
> + * Instruction data type for POWER
> + */
> +
> +#define ppc_inst(x) (x)
> +
> +#endif /* _ASM_INST_H */
> diff --git a/arch/powerpc/kernel/align.c b/arch/powerpc/kernel/align.c
> index 92045ed64976..86e9bf62f18c 100644
> --- a/arch/powerpc/kernel/align.c
> +++ b/arch/powerpc/kernel/align.c
> @@ -24,6 +24,7 @@
>  #include <asm/disassemble.h>
>  #include <asm/cpu_has_feature.h>
>  #include <asm/sstep.h>
> +#include <asm/inst.h>
>  
>  struct aligninfo {
>  	unsigned char len;
> diff --git a/arch/powerpc/kernel/epapr_paravirt.c
> b/arch/powerpc/kernel/epapr_paravirt.c
> index 9d32158ce36f..c53e863fb484 100644
> --- a/arch/powerpc/kernel/epapr_paravirt.c
> +++ b/arch/powerpc/kernel/epapr_paravirt.c
> @@ -11,6 +11,7 @@
>  #include <asm/cacheflush.h>
>  #include <asm/code-patching.h>
>  #include <asm/machdep.h>
> +#include <asm/inst.h>
>  
>  #if !defined(CONFIG_64BIT) || defined(CONFIG_PPC_BOOK3E_64)
>  extern void epapr_ev_idle(void);
> @@ -37,9 +38,9 @@ static int __init early_init_dt_scan_epapr(unsigned long
> node,
>  
>  	for (i = 0; i < (len / 4); i++) {
>  		u32 inst = be32_to_cpu(insts[i]);
> -		patch_instruction(epapr_hypercall_start + i, inst);
> +		patch_instruction(epapr_hypercall_start + i, ppc_inst(inst));
>  #if !defined(CONFIG_64BIT) || defined(CONFIG_PPC_BOOK3E_64)
> -		patch_instruction(epapr_ev_idle_start + i, inst);
> +		patch_instruction(epapr_ev_idle_start + i, ppc_inst(inst));


can we do it once while assigning inst ?

u32 inst = ppc_inst(be32_to_cpu(insts[i]));

-- Bala

>  #endif
>  	}
>  
> diff --git a/arch/powerpc/kernel/hw_breakpoint.c
> b/arch/powerpc/kernel/hw_breakpoint.c
> index 2462cd7c565c..79f51f182a83 100644
> --- a/arch/powerpc/kernel/hw_breakpoint.c
> +++ b/arch/powerpc/kernel/hw_breakpoint.c
> @@ -24,6 +24,7 @@
>  #include <asm/debug.h>
>  #include <asm/debugfs.h>
>  #include <asm/hvcall.h>
> +#include <asm/inst.h>
>  #include <linux/uaccess.h>
>  
>  /*
> @@ -243,7 +244,7 @@ dar_range_overlaps(unsigned long dar, int size, struct
> arch_hw_breakpoint *info)
>  static bool stepping_handler(struct pt_regs *regs, struct perf_event *bp,
>  			     struct arch_hw_breakpoint *info)
>  {
> -	unsigned int instr = 0;
> +	unsigned int instr = ppc_inst(0);
>  	int ret, type, size;
>  	struct instruction_op op;
>  	unsigned long addr = info->address;
> diff --git a/arch/powerpc/kernel/jump_label.c
> b/arch/powerpc/kernel/jump_label.c
> index ca37702bde97..daa4afce7ec8 100644
> --- a/arch/powerpc/kernel/jump_label.c
> +++ b/arch/powerpc/kernel/jump_label.c
> @@ -6,6 +6,7 @@
>  #include <linux/kernel.h>
>  #include <linux/jump_label.h>
>  #include <asm/code-patching.h>
> +#include <asm/inst.h>
>  
>  void arch_jump_label_transform(struct jump_entry *entry,
>  			       enum jump_label_type type)
> @@ -15,5 +16,5 @@ void arch_jump_label_transform(struct jump_entry *entry,
>  	if (type == JUMP_LABEL_JMP)
>  		patch_branch(addr, entry->target, 0);
>  	else
> -		patch_instruction(addr, PPC_INST_NOP);
> +		patch_instruction(addr, ppc_inst(PPC_INST_NOP));
>  }
> diff --git a/arch/powerpc/kernel/kgdb.c b/arch/powerpc/kernel/kgdb.c
> index 7dd55eb1259d..a6b38a19133f 100644
> --- a/arch/powerpc/kernel/kgdb.c
> +++ b/arch/powerpc/kernel/kgdb.c
> @@ -26,6 +26,7 @@
>  #include <asm/debug.h>
>  #include <asm/code-patching.h>
>  #include <linux/slab.h>
> +#include <asm/inst.h>
>  
>  /*
>   * This table contains the mapping between PowerPC hardware trap types, and
> @@ -424,7 +425,7 @@ int kgdb_arch_set_breakpoint(struct kgdb_bkpt *bpt)
>  	if (err)
>  		return err;
>  
> -	err = patch_instruction(addr, BREAK_INSTR);
> +	err = patch_instruction(addr, ppc_inst(BREAK_INSTR));
>  	if (err)
>  		return -EFAULT;
>  
> @@ -439,7 +440,7 @@ int kgdb_arch_remove_breakpoint(struct kgdb_bkpt *bpt)
>  	unsigned int instr = *(unsigned int *)bpt->saved_instr;
>  	unsigned int *addr = (unsigned int *)bpt->bpt_addr;
>  
> -	err = patch_instruction(addr, instr);
> +	err = patch_instruction(addr, ppc_inst(instr));
>  	if (err)
>  		return -EFAULT;
>  
> diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
> index 2d27ec4feee4..a1a3686f41c6 100644
> --- a/arch/powerpc/kernel/kprobes.c
> +++ b/arch/powerpc/kernel/kprobes.c
> @@ -23,6 +23,7 @@
>  #include <asm/cacheflush.h>
>  #include <asm/sstep.h>
>  #include <asm/sections.h>
> +#include <asm/inst.h>
>  #include <linux/uaccess.h>
>  
>  DEFINE_PER_CPU(struct kprobe *, current_kprobe) = NULL;
> @@ -138,13 +139,13 @@ NOKPROBE_SYMBOL(arch_prepare_kprobe);
>  
>  void arch_arm_kprobe(struct kprobe *p)
>  {
> -	patch_instruction(p->addr, BREAKPOINT_INSTRUCTION);
> +	patch_instruction(p->addr, ppc_inst(BREAKPOINT_INSTRUCTION));
>  }
>  NOKPROBE_SYMBOL(arch_arm_kprobe);
>  
>  void arch_disarm_kprobe(struct kprobe *p)
>  {
> -	patch_instruction(p->addr, p->opcode);
> +	patch_instruction(p->addr, ppc_inst(p->opcode));
>  }
>  NOKPROBE_SYMBOL(arch_disarm_kprobe);
>  
> diff --git a/arch/powerpc/kernel/module_64.c
> b/arch/powerpc/kernel/module_64.c
> index 007606a48fd9..7fd6b29edcb2 100644
> --- a/arch/powerpc/kernel/module_64.c
> +++ b/arch/powerpc/kernel/module_64.c
> @@ -20,6 +20,7 @@
>  #include <linux/sort.h>
>  #include <asm/setup.h>
>  #include <asm/sections.h>
> +#include <asm/inst.h>
>  
>  /* FIXME: We don't do .init separately.  To do this, we'd need to have
>     a separate r2 value in the init and core section, and stub between
> @@ -506,7 +507,7 @@ static int restore_r2(const char *name, u32 *instruction,
> struct module *me)
>  	 * "link" branches and they don't return, so they don't need the r2
>  	 * restore afterwards.
>  	 */
> -	if (!instr_is_relative_link_branch(*prev_insn))
> +	if (!instr_is_relative_link_branch(ppc_inst(*prev_insn)))
>  		return 1;
>  
>  	if (*instruction != PPC_INST_NOP) {
> diff --git a/arch/powerpc/kernel/optprobes.c
> b/arch/powerpc/kernel/optprobes.c
> index 445b3dad82dc..3b33ebf18859 100644
> --- a/arch/powerpc/kernel/optprobes.c
> +++ b/arch/powerpc/kernel/optprobes.c
> @@ -16,6 +16,7 @@
>  #include <asm/code-patching.h>
>  #include <asm/sstep.h>
>  #include <asm/ppc-opcode.h>
> +#include <asm/inst.h>
>  
>  #define TMPL_CALL_HDLR_IDX	\
>  	(optprobe_template_call_handler - optprobe_template_entry)
> @@ -147,13 +148,13 @@ void arch_remove_optimized_kprobe(struct
> optimized_kprobe *op)
>  void patch_imm32_load_insns(unsigned int val, kprobe_opcode_t *addr)
>  {
>  	/* addis r4,0,(insn)@h */
> -	patch_instruction(addr, PPC_INST_ADDIS | ___PPC_RT(4) |
> -			  ((val >> 16) & 0xffff));
> +	patch_instruction(addr, ppc_inst(PPC_INST_ADDIS | ___PPC_RT(4) |
> +			  ((val >> 16) & 0xffff)));
>  	addr++;
>  
>  	/* ori r4,r4,(insn)@l */
> -	patch_instruction(addr, PPC_INST_ORI | ___PPC_RA(4) |
> -			  ___PPC_RS(4) | (val & 0xffff));
> +	patch_instruction(addr, ppc_inst(PPC_INST_ORI | ___PPC_RA(4) |
> +			  ___PPC_RS(4) | (val & 0xffff)));
>  }
>  
>  /*
> @@ -163,28 +164,28 @@ void patch_imm32_load_insns(unsigned int val,
> kprobe_opcode_t *addr)
>  void patch_imm64_load_insns(unsigned long val, kprobe_opcode_t *addr)
>  {
>  	/* lis r3,(op)@highest */
> -	patch_instruction(addr, PPC_INST_ADDIS | ___PPC_RT(3) |
> -			  ((val >> 48) & 0xffff));
> +	patch_instruction(addr, ppc_inst(PPC_INST_ADDIS | ___PPC_RT(3) |
> +			  ((val >> 48) & 0xffff)));
>  	addr++;
>  
>  	/* ori r3,r3,(op)@higher */
> -	patch_instruction(addr, PPC_INST_ORI | ___PPC_RA(3) |
> -			  ___PPC_RS(3) | ((val >> 32) & 0xffff));
> +	patch_instruction(addr, ppc_inst(PPC_INST_ORI | ___PPC_RA(3) |
> +			  ___PPC_RS(3) | ((val >> 32) & 0xffff)));
>  	addr++;
>  
>  	/* rldicr r3,r3,32,31 */
> -	patch_instruction(addr, PPC_INST_RLDICR | ___PPC_RA(3) |
> -			  ___PPC_RS(3) | __PPC_SH64(32) | __PPC_ME64(31));
> +	patch_instruction(addr, ppc_inst(PPC_INST_RLDICR | ___PPC_RA(3) |
> +			  ___PPC_RS(3) | __PPC_SH64(32) | __PPC_ME64(31)));
>  	addr++;
>  
>  	/* oris r3,r3,(op)@h */
> -	patch_instruction(addr, PPC_INST_ORIS | ___PPC_RA(3) |
> -			  ___PPC_RS(3) | ((val >> 16) & 0xffff));
> +	patch_instruction(addr, ppc_inst(PPC_INST_ORIS | ___PPC_RA(3) |
> +			  ___PPC_RS(3) | ((val >> 16) & 0xffff)));
>  	addr++;
>  
>  	/* ori r3,r3,(op)@l */
> -	patch_instruction(addr, PPC_INST_ORI | ___PPC_RA(3) |
> -			  ___PPC_RS(3) | (val & 0xffff));
> +	patch_instruction(addr, ppc_inst(PPC_INST_ORI | ___PPC_RA(3) |
> +			  ___PPC_RS(3) | (val & 0xffff)));
>  }
>  
>  int arch_prepare_optimized_kprobe(struct optimized_kprobe *op, struct kprobe
> *p)
> @@ -230,7 +231,7 @@ int arch_prepare_optimized_kprobe(struct optimized_kprobe
> *op, struct kprobe *p)
>  	size = (TMPL_END_IDX * sizeof(kprobe_opcode_t)) / sizeof(int);
>  	pr_devel("Copying template to %p, size %lu\n", buff, size);
>  	for (i = 0; i < size; i++) {
> -		rc = patch_instruction(buff + i, *(optprobe_template_entry +
> i));
> +		rc = patch_instruction(buff + i,
> ppc_inst(*(optprobe_template_entry + i)));
>  		if (rc < 0)
>  			goto error;
>  	}
> diff --git a/arch/powerpc/kernel/security.c b/arch/powerpc/kernel/security.c
> index bd70f5be1c27..81a288b1a603 100644
> --- a/arch/powerpc/kernel/security.c
> +++ b/arch/powerpc/kernel/security.c
> @@ -14,6 +14,7 @@
>  #include <asm/debugfs.h>
>  #include <asm/security_features.h>
>  #include <asm/setup.h>
> +#include <asm/inst.h>
>  
>  
>  u64 powerpc_security_features __read_mostly = SEC_FTR_DEFAULT;
> @@ -403,9 +404,9 @@ static void toggle_count_cache_flush(bool enable)
>  		enable = false;
>  
>  	if (!enable) {
> -		patch_instruction_site(&patch__call_flush_count_cache,
> PPC_INST_NOP);
> +		patch_instruction_site(&patch__call_flush_count_cache,
> ppc_inst(PPC_INST_NOP));
>  #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
> -		patch_instruction_site(&patch__call_kvm_flush_link_stack,
> PPC_INST_NOP);
> +		patch_instruction_site(&patch__call_kvm_flush_link_stack,
> ppc_inst(PPC_INST_NOP));
>  #endif
>  		pr_info("link-stack-flush: software flush disabled.\n");
>  		link_stack_flush_enabled = false;
> @@ -428,7 +429,7 @@ static void toggle_count_cache_flush(bool enable)
>  
>  	// If we just need to flush the link stack, patch an early return
>  	if (!security_ftr_enabled(SEC_FTR_FLUSH_COUNT_CACHE)) {
> -		patch_instruction_site(&patch__flush_link_stack_return,
> PPC_INST_BLR);
> +		patch_instruction_site(&patch__flush_link_stack_return,
> ppc_inst(PPC_INST_BLR));
>  		no_count_cache_flush();
>  		return;
>  	}
> @@ -439,7 +440,7 @@ static void toggle_count_cache_flush(bool enable)
>  		return;
>  	}
>  
> -	patch_instruction_site(&patch__flush_count_cache_return, PPC_INST_BLR);
> +	patch_instruction_site(&patch__flush_count_cache_return,
> ppc_inst(PPC_INST_BLR));
>  	count_cache_flush_type = COUNT_CACHE_FLUSH_HW;
>  	pr_info("count-cache-flush: hardware assisted flush sequence
> enabled\n");
>  }
> diff --git a/arch/powerpc/kernel/trace/ftrace.c
> b/arch/powerpc/kernel/trace/ftrace.c
> index 4dcb379133f8..47233e671c18 100644
> --- a/arch/powerpc/kernel/trace/ftrace.c
> +++ b/arch/powerpc/kernel/trace/ftrace.c
> @@ -27,6 +27,7 @@
>  #include <asm/code-patching.h>
>  #include <asm/ftrace.h>
>  #include <asm/syscall.h>
> +#include <asm/inst.h>
>  
>  
>  #ifdef CONFIG_DYNAMIC_FTRACE
> @@ -161,7 +162,7 @@ __ftrace_make_nop(struct module *mod,
>  
>  #ifdef CONFIG_MPROFILE_KERNEL
>  	/* When using -mkernel_profile there is no load to jump over */
> -	pop = PPC_INST_NOP;
> +	pop = ppc_inst(PPC_INST_NOP);
>  
>  	if (probe_kernel_read(&op, (void *)(ip - 4), 4)) {
>  		pr_err("Fetching instruction at %lx failed.\n", ip - 4);
> @@ -169,7 +170,7 @@ __ftrace_make_nop(struct module *mod,
>  	}
>  
>  	/* We expect either a mflr r0, or a std r0, LRSAVE(r1) */
> -	if (op != PPC_INST_MFLR && op != PPC_INST_STD_LR) {
> +	if (op != ppc_inst(PPC_INST_MFLR) && op != ppc_inst(PPC_INST_STD_LR)) {
>  		pr_err("Unexpected instruction %08x around bl _mcount\n", op);
>  		return -EINVAL;
>  	}
> @@ -188,7 +189,7 @@ __ftrace_make_nop(struct module *mod,
>  	 * Use a b +8 to jump over the load.
>  	 */
>  
> -	pop = PPC_INST_BRANCH | 8;	/* b +8 */
> +	pop = ppc_inst(PPC_INST_BRANCH | 8);	/* b +8 */
>  
>  	/*
>  	 * Check what is in the next instruction. We can see ld r2,40(r1), but
> @@ -199,7 +200,7 @@ __ftrace_make_nop(struct module *mod,
>  		return -EFAULT;
>  	}
>  
> -	if (op != PPC_INST_LD_TOC) {
> +	if (op != ppc_inst(PPC_INST_LD_TOC)) {
>  		pr_err("Expected %08x found %08x\n", PPC_INST_LD_TOC, op);
>  		return -EINVAL;
>  	}
> @@ -275,7 +276,7 @@ __ftrace_make_nop(struct module *mod,
>  		return -EINVAL;
>  	}
>  
> -	op = PPC_INST_NOP;
> +	op = ppc_inst(PPC_INST_NOP);
>  
>  	if (patch_instruction((unsigned int *)ip, op))
>  		return -EPERM;
> @@ -420,7 +421,7 @@ static int __ftrace_make_nop_kernel(struct dyn_ftrace
> *rec, unsigned long addr)
>  		}
>  	}
>  
> -	if (patch_instruction((unsigned int *)ip, PPC_INST_NOP)) {
> +	if (patch_instruction((unsigned int *)ip, ppc_inst(PPC_INST_NOP))) {
>  		pr_err("Patching NOP failed.\n");
>  		return -EPERM;
>  	}
> @@ -442,7 +443,7 @@ int ftrace_make_nop(struct module *mod,
>  	if (test_24bit_addr(ip, addr)) {
>  		/* within range */
>  		old = ftrace_call_replace(ip, addr, 1);
> -		new = PPC_INST_NOP;
> +		new = ppc_inst(PPC_INST_NOP);
>  		return ftrace_modify_code(ip, old, new);
>  	} else if (core_kernel_text(ip))
>  		return __ftrace_make_nop_kernel(rec, addr);
> @@ -496,7 +497,7 @@ expected_nop_sequence(void *ip, unsigned int op0,
> unsigned int op1)
>  	 * The load offset is different depending on the ABI. For simplicity
>  	 * just mask it out when doing the compare.
>  	 */
> -	if ((op0 != 0x48000008) || ((op1 & 0xffff0000) != 0xe8410000))
> +	if ((op0 != ppc_inst(0x48000008)) || ((op1 & 0xffff0000) !=
> 0xe8410000))
>  		return 0;
>  	return 1;
>  }
> @@ -505,7 +506,7 @@ static int
>  expected_nop_sequence(void *ip, unsigned int op0, unsigned int op1)
>  {
>  	/* look for patched "NOP" on ppc64 with -mprofile-kernel */
> -	if (op0 != PPC_INST_NOP)
> +	if (op0 != ppc_inst(PPC_INST_NOP))
>  		return 0;
>  	return 1;
>  }
> @@ -588,7 +589,7 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned long
> addr)
>  		return -EFAULT;
>  
>  	/* It should be pointing to a nop */
> -	if (op != PPC_INST_NOP) {
> +	if (op != ppc_inst(PPC_INST_NOP)) {
>  		pr_err("Expected NOP but have %x\n", op);
>  		return -EINVAL;
>  	}
> @@ -645,7 +646,7 @@ static int __ftrace_make_call_kernel(struct dyn_ftrace
> *rec, unsigned long addr)
>  		return -EFAULT;
>  	}
>  
> -	if (op != PPC_INST_NOP) {
> +	if (op != ppc_inst(PPC_INST_NOP)) {
>  		pr_err("Unexpected call sequence at %p: %x\n", ip, op);
>  		return -EINVAL;
>  	}
> @@ -676,7 +677,7 @@ int ftrace_make_call(struct dyn_ftrace *rec, unsigned
> long addr)
>  	 */
>  	if (test_24bit_addr(ip, addr)) {
>  		/* within range */
> -		old = PPC_INST_NOP;
> +		old = ppc_inst(PPC_INST_NOP);
>  		new = ftrace_call_replace(ip, addr, 1);
>  		return ftrace_modify_code(ip, old, new);
>  	} else if (core_kernel_text(ip))
> diff --git a/arch/powerpc/kernel/uprobes.c b/arch/powerpc/kernel/uprobes.c
> index 1cfef0e5fec5..31c870287f2b 100644
> --- a/arch/powerpc/kernel/uprobes.c
> +++ b/arch/powerpc/kernel/uprobes.c
> @@ -14,6 +14,7 @@
>  #include <linux/kdebug.h>
>  
>  #include <asm/sstep.h>
> +#include <asm/inst.h>
>  
>  #define UPROBE_TRAP_NR	UINT_MAX
>  
> diff --git a/arch/powerpc/kvm/emulate_loadstore.c
> b/arch/powerpc/kvm/emulate_loadstore.c
> index 1139bc56e004..135d0e686622 100644
> --- a/arch/powerpc/kvm/emulate_loadstore.c
> +++ b/arch/powerpc/kvm/emulate_loadstore.c
> @@ -95,7 +95,7 @@ int kvmppc_emulate_loadstore(struct kvm_vcpu *vcpu)
>  
>  	emulated = EMULATE_FAIL;
>  	vcpu->arch.regs.msr = vcpu->arch.shared->msr;
> -	if (analyse_instr(&op, &vcpu->arch.regs, inst) == 0) {
> +	if (analyse_instr(&op, &vcpu->arch.regs, ppc_inst(inst)) == 0) {
>  		int type = op.type & INSTR_TYPE_MASK;
>  		int size = GETSIZE(op.type);
>  
> diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-
> patching.c
> index 4af564aeedf1..fdf0d6ea3575 100644
> --- a/arch/powerpc/lib/code-patching.c
> +++ b/arch/powerpc/lib/code-patching.c
> @@ -17,6 +17,7 @@
>  #include <asm/page.h>
>  #include <asm/code-patching.h>
>  #include <asm/setup.h>
> +#include <asm/inst.h>
>  
>  static int __patch_instruction(unsigned int *exec_addr, unsigned int instr,
>  			       unsigned int *patch_addr)
> @@ -413,37 +414,37 @@ static void __init test_branch_iform(void)
>  	addr = (unsigned long)&instr;
>  
>  	/* The simplest case, branch to self, no flags */
> -	check(instr_is_branch_iform(0x48000000));
> +	check(instr_is_branch_iform(ppc_inst(0x48000000)));
>  	/* All bits of target set, and flags */
> -	check(instr_is_branch_iform(0x4bffffff));
> +	check(instr_is_branch_iform(ppc_inst(0x4bffffff)));
>  	/* High bit of opcode set, which is wrong */
> -	check(!instr_is_branch_iform(0xcbffffff));
> +	check(!instr_is_branch_iform(ppc_inst(0xcbffffff)));
>  	/* Middle bits of opcode set, which is wrong */
> -	check(!instr_is_branch_iform(0x7bffffff));
> +	check(!instr_is_branch_iform(ppc_inst(0x7bffffff)));
>  
>  	/* Simplest case, branch to self with link */
> -	check(instr_is_branch_iform(0x48000001));
> +	check(instr_is_branch_iform(ppc_inst(0x48000001)));
>  	/* All bits of targets set */
> -	check(instr_is_branch_iform(0x4bfffffd));
> +	check(instr_is_branch_iform(ppc_inst(0x4bfffffd)));
>  	/* Some bits of targets set */
> -	check(instr_is_branch_iform(0x4bff00fd));
> +	check(instr_is_branch_iform(ppc_inst(0x4bff00fd)));
>  	/* Must be a valid branch to start with */
> -	check(!instr_is_branch_iform(0x7bfffffd));
> +	check(!instr_is_branch_iform(ppc_inst(0x7bfffffd)));
>  
>  	/* Absolute branch to 0x100 */
> -	instr = 0x48000103;
> +	instr = ppc_inst(0x48000103);
>  	check(instr_is_branch_to_addr(&instr, 0x100));
>  	/* Absolute branch to 0x420fc */
> -	instr = 0x480420ff;
> +	instr = ppc_inst(0x480420ff);
>  	check(instr_is_branch_to_addr(&instr, 0x420fc));
>  	/* Maximum positive relative branch, + 20MB - 4B */
> -	instr = 0x49fffffc;
> +	instr = ppc_inst(0x49fffffc);
>  	check(instr_is_branch_to_addr(&instr, addr + 0x1FFFFFC));
>  	/* Smallest negative relative branch, - 4B */
> -	instr = 0x4bfffffc;
> +	instr = ppc_inst(0x4bfffffc);
>  	check(instr_is_branch_to_addr(&instr, addr - 4));
>  	/* Largest negative relative branch, - 32 MB */
> -	instr = 0x4a000000;
> +	instr = ppc_inst(0x4a000000);
>  	check(instr_is_branch_to_addr(&instr, addr - 0x2000000));
>  
>  	/* Branch to self, with link */
> @@ -477,7 +478,7 @@ static void __init test_branch_iform(void)
>  	/* Check flags are masked correctly */
>  	err = create_branch(&instr, &instr, addr, 0xFFFFFFFC);
>  	check(instr_is_branch_to_addr(&instr, addr));
> -	check(instr == 0x48000000);
> +	check(instr == ppc_inst(0x48000000));
>  }
>  
>  static void __init test_create_function_call(void)
> @@ -504,28 +505,28 @@ static void __init test_branch_bform(void)
>  	addr = (unsigned long)iptr;
>  
>  	/* The simplest case, branch to self, no flags */
> -	check(instr_is_branch_bform(0x40000000));
> +	check(instr_is_branch_bform(ppc_inst(0x40000000)));
>  	/* All bits of target set, and flags */
> -	check(instr_is_branch_bform(0x43ffffff));
> +	check(instr_is_branch_bform(ppc_inst(0x43ffffff)));
>  	/* High bit of opcode set, which is wrong */
> -	check(!instr_is_branch_bform(0xc3ffffff));
> +	check(!instr_is_branch_bform(ppc_inst(0xc3ffffff)));
>  	/* Middle bits of opcode set, which is wrong */
> -	check(!instr_is_branch_bform(0x7bffffff));
> +	check(!instr_is_branch_bform(ppc_inst(0x7bffffff)));
>  
>  	/* Absolute conditional branch to 0x100 */
> -	instr = 0x43ff0103;
> +	instr = ppc_inst(0x43ff0103);
>  	check(instr_is_branch_to_addr(&instr, 0x100));
>  	/* Absolute conditional branch to 0x20fc */
> -	instr = 0x43ff20ff;
> +	instr = ppc_inst(0x43ff20ff);
>  	check(instr_is_branch_to_addr(&instr, 0x20fc));
>  	/* Maximum positive relative conditional branch, + 32 KB - 4B */
> -	instr = 0x43ff7ffc;
> +	instr = ppc_inst(0x43ff7ffc);
>  	check(instr_is_branch_to_addr(&instr, addr + 0x7FFC));
>  	/* Smallest negative relative conditional branch, - 4B */
> -	instr = 0x43fffffc;
> +	instr = ppc_inst(0x43fffffc);
>  	check(instr_is_branch_to_addr(&instr, addr - 4));
>  	/* Largest negative relative conditional branch, - 32 KB */
> -	instr = 0x43ff8000;
> +	instr = ppc_inst(0x43ff8000);
>  	check(instr_is_branch_to_addr(&instr, addr - 0x8000));
>  
>  	/* All condition code bits set & link */
> @@ -562,7 +563,7 @@ static void __init test_branch_bform(void)
>  	/* Check flags are masked correctly */
>  	err = create_cond_branch(&instr, iptr, addr, 0xFFFFFFFC);
>  	check(instr_is_branch_to_addr(&instr, addr));
> -	check(instr == 0x43FF0000);
> +	check(instr == ppc_inst(0x43FF0000));
>  }
>  
>  static void __init test_translate_branch(void)
> @@ -596,7 +597,7 @@ static void __init test_translate_branch(void)
>  	patch_instruction(q, instr);
>  	check(instr_is_branch_to_addr(p, addr));
>  	check(instr_is_branch_to_addr(q, addr));
> -	check(*q == 0x4a000000);
> +	check(*q == ppc_inst(0x4a000000));
>  
>  	/* Maximum positive case, move x to x - 32 MB + 4 */
>  	p = buf + 0x2000000;
> @@ -607,7 +608,7 @@ static void __init test_translate_branch(void)
>  	patch_instruction(q, instr);
>  	check(instr_is_branch_to_addr(p, addr));
>  	check(instr_is_branch_to_addr(q, addr));
> -	check(*q == 0x49fffffc);
> +	check(*q == ppc_inst(0x49fffffc));
>  
>  	/* Jump to x + 16 MB moved to x + 20 MB */
>  	p = buf;
> @@ -653,7 +654,7 @@ static void __init test_translate_branch(void)
>  	patch_instruction(q, instr);
>  	check(instr_is_branch_to_addr(p, addr));
>  	check(instr_is_branch_to_addr(q, addr));
> -	check(*q == 0x43ff8000);
> +	check(*q == ppc_inst(0x43ff8000));
>  
>  	/* Maximum positive case, move x to x - 32 KB + 4 */
>  	p = buf + 0x8000;
> @@ -665,7 +666,7 @@ static void __init test_translate_branch(void)
>  	patch_instruction(q, instr);
>  	check(instr_is_branch_to_addr(p, addr));
>  	check(instr_is_branch_to_addr(q, addr));
> -	check(*q == 0x43ff7ffc);
> +	check(*q == ppc_inst(0x43ff7ffc));
>  
>  	/* Jump to x + 12 KB moved to x + 20 KB */
>  	p = buf;
> diff --git a/arch/powerpc/lib/feature-fixups.c b/arch/powerpc/lib/feature-
> fixups.c
> index b129d7b4e7dd..6e7479b8887a 100644
> --- a/arch/powerpc/lib/feature-fixups.c
> +++ b/arch/powerpc/lib/feature-fixups.c
> @@ -21,6 +21,7 @@
>  #include <asm/setup.h>
>  #include <asm/security_features.h>
>  #include <asm/firmware.h>
> +#include <asm/inst.h>
>  
>  struct fixup_entry {
>  	unsigned long	mask;
> @@ -89,7 +90,7 @@ static int patch_feature_section(unsigned long value,
> struct fixup_entry *fcur)
>  	}
>  
>  	for (; dest < end; dest++)
> -		raw_patch_instruction(dest, PPC_INST_NOP);
> +		raw_patch_instruction(dest, ppc_inst(PPC_INST_NOP));
>  
>  	return 0;
>  }
> @@ -146,15 +147,15 @@ static void do_stf_entry_barrier_fixups(enum
> stf_barrier_type types)
>  
>  		pr_devel("patching dest %lx\n", (unsigned long)dest);
>  
> -		patch_instruction(dest, instrs[0]);
> +		patch_instruction(dest, ppc_inst(instrs[0]));
>  
>  		if (types & STF_BARRIER_FALLBACK)
>  			patch_branch(dest + 1, (unsigned
> long)&stf_barrier_fallback,
>  				     BRANCH_SET_LINK);
>  		else
> -			patch_instruction(dest + 1, instrs[1]);
> +			patch_instruction(dest + 1, ppc_inst(instrs[1]));
>  
> -		patch_instruction(dest + 2, instrs[2]);
> +		patch_instruction(dest + 2, ppc_inst(instrs[2]));
>  	}
>  
>  	printk(KERN_DEBUG "stf-barrier: patched %d entry locations (%s
> barrier)\n", i,
> @@ -207,12 +208,12 @@ static void do_stf_exit_barrier_fixups(enum
> stf_barrier_type types)
>  
>  		pr_devel("patching dest %lx\n", (unsigned long)dest);
>  
> -		patch_instruction(dest, instrs[0]);
> -		patch_instruction(dest + 1, instrs[1]);
> -		patch_instruction(dest + 2, instrs[2]);
> -		patch_instruction(dest + 3, instrs[3]);
> -		patch_instruction(dest + 4, instrs[4]);
> -		patch_instruction(dest + 5, instrs[5]);
> +		patch_instruction(dest, ppc_inst(instrs[0]));
> +		patch_instruction(dest + 1, ppc_inst(instrs[1]));
> +		patch_instruction(dest + 2, ppc_inst(instrs[2]));
> +		patch_instruction(dest + 3, ppc_inst(instrs[3]));
> +		patch_instruction(dest + 4, ppc_inst(instrs[4]));
> +		patch_instruction(dest + 5, ppc_inst(instrs[5]));
>  	}
>  	printk(KERN_DEBUG "stf-barrier: patched %d exit locations (%s
> barrier)\n", i,
>  		(types == STF_BARRIER_NONE)                  ? "no" :
> @@ -260,9 +261,9 @@ void do_rfi_flush_fixups(enum l1d_flush_type types)
>  
>  		pr_devel("patching dest %lx\n", (unsigned long)dest);
>  
> -		patch_instruction(dest, instrs[0]);
> -		patch_instruction(dest + 1, instrs[1]);
> -		patch_instruction(dest + 2, instrs[2]);
> +		patch_instruction(dest, ppc_inst(instrs[0]));
> +		patch_instruction(dest + 1, ppc_inst(instrs[1]));
> +		patch_instruction(dest + 2, ppc_inst(instrs[2]));
>  	}
>  
>  	printk(KERN_DEBUG "rfi-flush: patched %d locations (%s flush)\n", i,
> @@ -295,7 +296,7 @@ void do_barrier_nospec_fixups_range(bool enable, void
> *fixup_start, void *fixup_
>  		dest = (void *)start + *start;
>  
>  		pr_devel("patching dest %lx\n", (unsigned long)dest);
> -		patch_instruction(dest, instr);
> +		patch_instruction(dest, ppc_inst(instr));
>  	}
>  
>  	printk(KERN_DEBUG "barrier-nospec: patched %d locations\n", i);
> @@ -338,8 +339,8 @@ void do_barrier_nospec_fixups_range(bool enable, void
> *fixup_start, void *fixup_
>  		dest = (void *)start + *start;
>  
>  		pr_devel("patching dest %lx\n", (unsigned long)dest);
> -		patch_instruction(dest, instr[0]);
> -		patch_instruction(dest + 1, instr[1]);
> +		patch_instruction(dest, ppc_inst(instr[0]));
> +		patch_instruction(dest + 1, ppc_inst(instr[1]));
>  	}
>  
>  	printk(KERN_DEBUG "barrier-nospec: patched %d locations\n", i);
> @@ -353,7 +354,7 @@ static void patch_btb_flush_section(long *curr)
>  	end = (void *)curr + *(curr + 1);
>  	for (; start < end; start++) {
>  		pr_devel("patching dest %lx\n", (unsigned long)start);
> -		patch_instruction(start, PPC_INST_NOP);
> +		patch_instruction(start, ppc_inst(PPC_INST_NOP));
>  	}
>  }
>  
> @@ -382,7 +383,7 @@ void do_lwsync_fixups(unsigned long value, void
> *fixup_start, void *fixup_end)
>  
>  	for (; start < end; start++) {
>  		dest = (void *)start + *start;
> -		raw_patch_instruction(dest, PPC_INST_LWSYNC);
> +		raw_patch_instruction(dest, ppc_inst(PPC_INST_LWSYNC));
>  	}
>  }
>  
> @@ -400,7 +401,7 @@ static void do_final_fixups(void)
>  	length = (__end_interrupts - _stext) / sizeof(int);
>  
>  	while (length--) {
> -		raw_patch_instruction(dest, *src);
> +		raw_patch_instruction(dest, ppc_inst(*src));
>  		src++;
>  		dest++;
>  	}
> diff --git a/arch/powerpc/lib/test_emulate_step.c
> b/arch/powerpc/lib/test_emulate_step.c
> index 42347067739c..88b17226a493 100644
> --- a/arch/powerpc/lib/test_emulate_step.c
> +++ b/arch/powerpc/lib/test_emulate_step.c
> @@ -11,6 +11,7 @@
>  #include <asm/sstep.h>
>  #include <asm/ppc-opcode.h>
>  #include <asm/code-patching.h>
> +#include <asm/inst.h>
>  
>  #define IMM_L(i)		((uintptr_t)(i) & 0xffff)
>  
> @@ -18,40 +19,40 @@
>   * Defined with TEST_ prefix so it does not conflict with other
>   * definitions.
>   */
> -#define TEST_LD(r, base, i)	(PPC_INST_LD | ___PPC_RT(r) |		\
> +#define TEST_LD(r, base, i)	ppc_inst(PPC_INST_LD | ___PPC_RT(r) |		
> \
>  					___PPC_RA(base) | IMM_L(i))
> -#define TEST_LWZ(r, base, i)	(PPC_INST_LWZ | ___PPC_RT(r) |		\
> +#define TEST_LWZ(r, base, i)	ppc_inst(PPC_INST_LWZ | ___PPC_RT(r) |		
> \
>  					___PPC_RA(base) | IMM_L(i))
> -#define TEST_LWZX(t, a, b)	(PPC_INST_LWZX | ___PPC_RT(t) |		\
> +#define TEST_LWZX(t, a, b)	ppc_inst(PPC_INST_LWZX | ___PPC_RT(t) |		
> \
>  					___PPC_RA(a) | ___PPC_RB(b))
> -#define TEST_STD(r, base, i)	(PPC_INST_STD | ___PPC_RS(r) |		\
> +#define TEST_STD(r, base, i)	ppc_inst(PPC_INST_STD | ___PPC_RS(r) |		
> \
>  					___PPC_RA(base) | ((i) & 0xfffc))
> -#define TEST_LDARX(t, a, b, eh)	(PPC_INST_LDARX | ___PPC_RT(t) |	\
> +#define TEST_LDARX(t, a, b, eh)	ppc_inst(PPC_INST_LDARX | ___PPC_RT(t)
> |	\
>  					___PPC_RA(a) | ___PPC_RB(b) |	\
>  					__PPC_EH(eh))
> -#define TEST_STDCX(s, a, b)	(PPC_INST_STDCX | ___PPC_RS(s) |	\
> +#define TEST_STDCX(s, a, b)	ppc_inst(PPC_INST_STDCX | ___PPC_RS(s) |	\
>  					___PPC_RA(a) | ___PPC_RB(b))
> -#define TEST_LFSX(t, a, b)	(PPC_INST_LFSX | ___PPC_RT(t) |		\
> +#define TEST_LFSX(t, a, b)	ppc_inst(PPC_INST_LFSX | ___PPC_RT(t) |		
> \
>  					___PPC_RA(a) | ___PPC_RB(b))
> -#define TEST_STFSX(s, a, b)	(PPC_INST_STFSX | ___PPC_RS(s) |	\
> +#define TEST_STFSX(s, a, b)	ppc_inst(PPC_INST_STFSX | ___PPC_RS(s) |	\
>  					___PPC_RA(a) | ___PPC_RB(b))
> -#define TEST_LFDX(t, a, b)	(PPC_INST_LFDX | ___PPC_RT(t) |		\
> +#define TEST_LFDX(t, a, b)	ppc_inst(PPC_INST_LFDX | ___PPC_RT(t) |		
> \
>  					___PPC_RA(a) | ___PPC_RB(b))
> -#define TEST_STFDX(s, a, b)	(PPC_INST_STFDX | ___PPC_RS(s) |	\
> +#define TEST_STFDX(s, a, b)	ppc_inst(PPC_INST_STFDX | ___PPC_RS(s) |	\
>  					___PPC_RA(a) | ___PPC_RB(b))
> -#define TEST_LVX(t, a, b)	(PPC_INST_LVX | ___PPC_RT(t) |		\
> +#define TEST_LVX(t, a, b)	ppc_inst(PPC_INST_LVX | ___PPC_RT(t) |		
> \
>  					___PPC_RA(a) | ___PPC_RB(b))
> -#define TEST_STVX(s, a, b)	(PPC_INST_STVX | ___PPC_RS(s) |		\
> +#define TEST_STVX(s, a, b)	ppc_inst(PPC_INST_STVX | ___PPC_RS(s) |		
> \
>  					___PPC_RA(a) | ___PPC_RB(b))
> -#define TEST_LXVD2X(s, a, b)	(PPC_INST_LXVD2X | VSX_XX1((s), R##a, R##b))
> -#define TEST_STXVD2X(s, a, b)	(PPC_INST_STXVD2X | VSX_XX1((s), R##a,
> R##b))
> -#define TEST_ADD(t, a, b)	(PPC_INST_ADD | ___PPC_RT(t) |		\
> +#define TEST_LXVD2X(s, a, b)	ppc_inst(PPC_INST_LXVD2X | VSX_XX1((s), R##a,
> R##b))
> +#define TEST_STXVD2X(s, a, b)	ppc_inst(PPC_INST_STXVD2X |
> VSX_XX1((s), R##a, R##b))
> +#define TEST_ADD(t, a, b)	ppc_inst(PPC_INST_ADD | ___PPC_RT(t) |		
> \
>  					___PPC_RA(a) | ___PPC_RB(b))
> -#define TEST_ADD_DOT(t, a, b)	(PPC_INST_ADD | ___PPC_RT(t) |		
> \
> +#define TEST_ADD_DOT(t, a, b)	ppc_inst(PPC_INST_ADD | ___PPC_RT(t) |	
> 	\
>  					___PPC_RA(a) | ___PPC_RB(b) | 0x1)
> -#define TEST_ADDC(t, a, b)	(PPC_INST_ADDC | ___PPC_RT(t) |		\
> +#define TEST_ADDC(t, a, b)	ppc_inst(PPC_INST_ADDC | ___PPC_RT(t) |		
> \
>  					___PPC_RA(a) | ___PPC_RB(b))
> -#define TEST_ADDC_DOT(t, a, b)	(PPC_INST_ADDC | ___PPC_RT(t) |		
> \
> +#define TEST_ADDC_DOT(t, a, b)	ppc_inst(PPC_INST_ADDC | ___PPC_RT(t) |
> 		\
>  					___PPC_RA(a) | ___PPC_RB(b) | 0x1)
>  
>  #define MAX_SUBTESTS	16
> @@ -471,7 +472,7 @@ static struct compute_test compute_tests[] = {
>  		.subtests = {
>  			{
>  				.descr = "R0 = LONG_MAX",
> -				.instr = PPC_INST_NOP,
> +				.instr = ppc_inst(PPC_INST_NOP),
>  				.regs = {
>  					.gpr[0] = LONG_MAX,
>  				}
> diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
> index 049375206510..68ecb39dd9cc 100644
> --- a/arch/powerpc/xmon/xmon.c
> +++ b/arch/powerpc/xmon/xmon.c
> @@ -54,6 +54,7 @@
>  #include <asm/firmware.h>
>  #include <asm/code-patching.h>
>  #include <asm/sections.h>
> +#include <asm/inst.h>
>  
>  #ifdef CONFIG_PPC64
>  #include <asm/hvcall.h>
> @@ -949,7 +950,7 @@ static void remove_bpts(void)
>  		if ((bp->enabled & (BP_TRAP|BP_CIABR)) != BP_TRAP)
>  			continue;
>  		if (mread(bp->address, &instr, 4) == 4
> -		    && instr == bpinstr
> +		    && instr == ppc_inst(bpinstr)
>  		    && patch_instruction(
>  			(unsigned int *)bp->address, bp->instr[0]) != 0)
>  			printf("Couldn't remove breakpoint at %lx\n",
> @@ -2845,7 +2846,7 @@ generic_inst_dump(unsigned long adr, long count, int
> praddr,
>  {
>  	int nr, dotted;
>  	unsigned long first_adr;
> -	unsigned int inst, last_inst = 0;
> +	unsigned int inst, last_inst = ppc_inst(0);
>  	unsigned char val[4];
>  
>  	dotted = 0;
> @@ -2858,7 +2859,7 @@ generic_inst_dump(unsigned long adr, long count, int
> praddr,
>  			}
>  			break;
>  		}
> -		inst = GETWORD(val);
> +		inst = ppc_inst(GETWORD(val));
>  		if (adr > first_adr && inst == last_inst) {
>  			if (!dotted) {
>  				printf(" ...\n");

