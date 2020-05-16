Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B77C91D63A8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 May 2020 20:41:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49PYyB6kyyzDqcv
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 May 2020 04:41:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49PYwQ2y5HzDqZp
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 May 2020 04:39:29 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49PYwB3DWBz9v1QL;
 Sat, 16 May 2020 20:39:22 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id kXuRH9Duxr76; Sat, 16 May 2020 20:39:22 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49PYwB1hJ1z9v1QH;
 Sat, 16 May 2020 20:39:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B06E28B787;
 Sat, 16 May 2020 20:39:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id cIkO6j-PdJmQ; Sat, 16 May 2020 20:39:24 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 943788B75B;
 Sat, 16 May 2020 20:39:23 +0200 (CEST)
Subject: Re: [PATCH v8 12/30] powerpc: Use a function for reading instructions
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200506034050.24806-1-jniethe5@gmail.com>
 <20200506034050.24806-13-jniethe5@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <a7005edf-cdda-4aec-b7b0-fd9f45776147@csgroup.eu>
Date: Sat, 16 May 2020 20:39:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200506034050.24806-13-jniethe5@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
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
Cc: christophe.leroy@c-s.fr, alistair@popple.id.au, npiggin@gmail.com,
 bala24@linux.ibm.com, naveen.n.rao@linux.vnet.ibm.com, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 06/05/2020 à 05:40, Jordan Niethe a écrit :
> Prefixed instructions will mean there are instructions of different
> length. As a result dereferencing a pointer to an instruction will not
> necessarily give the desired result. Introduce a function for reading
> instructions from memory into the instruction data type.


Shouldn't this function be used in mmu_patch_addis() in mm/nohash/8xx.c ?

Christophe

> 
> Reviewed-by: Alistair Popple <alistair@popple.id.au>
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
> v4: New to series
> v5: - Rename read_inst() -> probe_kernel_read_inst()
>      - No longer modify uprobe probe type in this patch
> v6: - feature-fixups.c: do_final_fixups(): Use here
>      - arch_prepare_kprobe(): patch_instruction(): no longer part of this
>        patch
>      - Move probe_kernel_read_inst() out of this patch
>      - Use in uprobes
> v8: style
> ---
>   arch/powerpc/include/asm/inst.h    |  5 +++++
>   arch/powerpc/kernel/kprobes.c      |  6 +++---
>   arch/powerpc/kernel/mce_power.c    |  2 +-
>   arch/powerpc/kernel/optprobes.c    |  4 ++--
>   arch/powerpc/kernel/trace/ftrace.c |  4 ++--
>   arch/powerpc/kernel/uprobes.c      |  2 +-
>   arch/powerpc/lib/code-patching.c   | 26 ++++++++++++++------------
>   arch/powerpc/lib/feature-fixups.c  |  4 ++--
>   arch/powerpc/xmon/xmon.c           |  6 +++---
>   9 files changed, 33 insertions(+), 26 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/inst.h b/arch/powerpc/include/asm/inst.h
> index 19d8bb7a1c2b..552e953bf04f 100644
> --- a/arch/powerpc/include/asm/inst.h
> +++ b/arch/powerpc/include/asm/inst.h
> @@ -27,6 +27,11 @@ static inline struct ppc_inst ppc_inst_swab(struct ppc_inst x)
>   	return ppc_inst(swab32(ppc_inst_val(x)));
>   }
>   
> +static inline struct ppc_inst ppc_inst_read(const struct ppc_inst *ptr)
> +{
> +	return *ptr;
> +}
> +
>   static inline bool ppc_inst_equal(struct ppc_inst x, struct ppc_inst y)
>   {
>   	return ppc_inst_val(x) == ppc_inst_val(y);
> diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
> index a08ae5803622..f64312dca84f 100644
> --- a/arch/powerpc/kernel/kprobes.c
> +++ b/arch/powerpc/kernel/kprobes.c
> @@ -106,7 +106,7 @@ kprobe_opcode_t *kprobe_lookup_name(const char *name, unsigned int offset)
>   int arch_prepare_kprobe(struct kprobe *p)
>   {
>   	int ret = 0;
> -	struct ppc_inst insn = *(struct ppc_inst *)p->addr;
> +	struct ppc_inst insn = ppc_inst_read((struct ppc_inst *)p->addr);
>   
>   	if ((unsigned long)p->addr & 0x03) {
>   		printk("Attempt to register kprobe at an unaligned address\n");
> @@ -127,7 +127,7 @@ int arch_prepare_kprobe(struct kprobe *p)
>   	if (!ret) {
>   		memcpy(p->ainsn.insn, p->addr,
>   				MAX_INSN_SIZE * sizeof(kprobe_opcode_t));
> -		p->opcode = *p->addr;
> +		p->opcode = ppc_inst_val(insn);
>   		flush_icache_range((unsigned long)p->ainsn.insn,
>   			(unsigned long)p->ainsn.insn + sizeof(kprobe_opcode_t));
>   	}
> @@ -217,7 +217,7 @@ NOKPROBE_SYMBOL(arch_prepare_kretprobe);
>   static int try_to_emulate(struct kprobe *p, struct pt_regs *regs)
>   {
>   	int ret;
> -	struct ppc_inst insn = *(struct ppc_inst *)p->ainsn.insn;
> +	struct ppc_inst insn = ppc_inst_read((struct ppc_inst *)p->ainsn.insn);
>   
>   	/* regs->nip is also adjusted if emulate_step returns 1 */
>   	ret = emulate_step(regs, insn);
> diff --git a/arch/powerpc/kernel/mce_power.c b/arch/powerpc/kernel/mce_power.c
> index cd23218c60bb..45c51ba0071b 100644
> --- a/arch/powerpc/kernel/mce_power.c
> +++ b/arch/powerpc/kernel/mce_power.c
> @@ -374,7 +374,7 @@ static int mce_find_instr_ea_and_phys(struct pt_regs *regs, uint64_t *addr,
>   	pfn = addr_to_pfn(regs, regs->nip);
>   	if (pfn != ULONG_MAX) {
>   		instr_addr = (pfn << PAGE_SHIFT) + (regs->nip & ~PAGE_MASK);
> -		instr = *(struct ppc_inst *)(instr_addr);
> +		instr = ppc_inst_read((struct ppc_inst *)instr_addr);
>   		if (!analyse_instr(&op, &tmp, instr)) {
>   			pfn = addr_to_pfn(regs, op.ea);
>   			*addr = op.ea;
> diff --git a/arch/powerpc/kernel/optprobes.c b/arch/powerpc/kernel/optprobes.c
> index 5a71fef71c22..52c1ab3f85aa 100644
> --- a/arch/powerpc/kernel/optprobes.c
> +++ b/arch/powerpc/kernel/optprobes.c
> @@ -100,9 +100,9 @@ static unsigned long can_optimize(struct kprobe *p)
>   	 * Ensure that the instruction is not a conditional branch,
>   	 * and that can be emulated.
>   	 */
> -	if (!is_conditional_branch(*(struct ppc_inst *)p->ainsn.insn) &&
> +	if (!is_conditional_branch(ppc_inst_read((struct ppc_inst *)p->ainsn.insn)) &&
>   	    analyse_instr(&op, &regs,
> -			  *(struct ppc_inst *)p->ainsn.insn) == 1) {
> +			  ppc_inst_read((struct ppc_inst *)p->ainsn.insn)) == 1) {
>   		emulate_update_regs(&regs, &op);
>   		nip = regs.nip;
>   	}
> diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
> index 3117ed675735..acd5b889815f 100644
> --- a/arch/powerpc/kernel/trace/ftrace.c
> +++ b/arch/powerpc/kernel/trace/ftrace.c
> @@ -848,7 +848,7 @@ int ftrace_update_ftrace_func(ftrace_func_t func)
>   	struct ppc_inst old, new;
>   	int ret;
>   
> -	old = *(struct ppc_inst *)&ftrace_call;
> +	old = ppc_inst_read((struct ppc_inst *)&ftrace_call);
>   	new = ftrace_call_replace(ip, (unsigned long)func, 1);
>   	ret = ftrace_modify_code(ip, old, new);
>   
> @@ -856,7 +856,7 @@ int ftrace_update_ftrace_func(ftrace_func_t func)
>   	/* Also update the regs callback function */
>   	if (!ret) {
>   		ip = (unsigned long)(&ftrace_regs_call);
> -		old = *(struct ppc_inst *)&ftrace_regs_call;
> +		old = ppc_inst_read((struct ppc_inst *)&ftrace_regs_call);
>   		new = ftrace_call_replace(ip, (unsigned long)func, 1);
>   		ret = ftrace_modify_code(ip, old, new);
>   	}
> diff --git a/arch/powerpc/kernel/uprobes.c b/arch/powerpc/kernel/uprobes.c
> index 31c870287f2b..6893d40a48c5 100644
> --- a/arch/powerpc/kernel/uprobes.c
> +++ b/arch/powerpc/kernel/uprobes.c
> @@ -174,7 +174,7 @@ bool arch_uprobe_skip_sstep(struct arch_uprobe *auprobe, struct pt_regs *regs)
>   	 * emulate_step() returns 1 if the insn was successfully emulated.
>   	 * For all other cases, we need to single-step in hardware.
>   	 */
> -	ret = emulate_step(regs, auprobe->insn);
> +	ret = emulate_step(regs, ppc_inst_read(&auprobe->insn));
>   	if (ret > 0)
>   		return true;
>   
> diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
> index 1dff9d9d6645..435fc8e9f45d 100644
> --- a/arch/powerpc/lib/code-patching.c
> +++ b/arch/powerpc/lib/code-patching.c
> @@ -348,9 +348,9 @@ static unsigned long branch_bform_target(const struct ppc_inst *instr)
>   
>   unsigned long branch_target(const struct ppc_inst *instr)
>   {
> -	if (instr_is_branch_iform(*instr))
> +	if (instr_is_branch_iform(ppc_inst_read(instr)))
>   		return branch_iform_target(instr);
> -	else if (instr_is_branch_bform(*instr))
> +	else if (instr_is_branch_bform(ppc_inst_read(instr)))
>   		return branch_bform_target(instr);
>   
>   	return 0;
> @@ -358,7 +358,8 @@ unsigned long branch_target(const struct ppc_inst *instr)
>   
>   int instr_is_branch_to_addr(const struct ppc_inst *instr, unsigned long addr)
>   {
> -	if (instr_is_branch_iform(*instr) || instr_is_branch_bform(*instr))
> +	if (instr_is_branch_iform(ppc_inst_read(instr)) ||
> +	    instr_is_branch_bform(ppc_inst_read(instr)))
>   		return branch_target(instr) == addr;
>   
>   	return 0;
> @@ -368,13 +369,14 @@ int translate_branch(struct ppc_inst *instr, const struct ppc_inst *dest,
>   		     const struct ppc_inst *src)
>   {
>   	unsigned long target;
> -
>   	target = branch_target(src);
>   
> -	if (instr_is_branch_iform(*src))
> -		return create_branch(instr, dest, target, ppc_inst_val(*src));
> -	else if (instr_is_branch_bform(*src))
> -		return create_cond_branch(instr, dest, target, ppc_inst_val(*src));
> +	if (instr_is_branch_iform(ppc_inst_read(src)))
> +		return create_branch(instr, dest, target,
> +				     ppc_inst_val(ppc_inst_read(src)));
> +	else if (instr_is_branch_bform(ppc_inst_read(src)))
> +		return create_cond_branch(instr, dest, target,
> +					  ppc_inst_val(ppc_inst_read(src)));
>   
>   	return 1;
>   }
> @@ -598,7 +600,7 @@ static void __init test_translate_branch(void)
>   	patch_instruction(q, instr);
>   	check(instr_is_branch_to_addr(p, addr));
>   	check(instr_is_branch_to_addr(q, addr));
> -	check(ppc_inst_equal(*q, ppc_inst(0x4a000000)));
> +	check(ppc_inst_equal(ppc_inst_read(q), ppc_inst(0x4a000000)));
>   
>   	/* Maximum positive case, move x to x - 32 MB + 4 */
>   	p = buf + 0x2000000;
> @@ -609,7 +611,7 @@ static void __init test_translate_branch(void)
>   	patch_instruction(q, instr);
>   	check(instr_is_branch_to_addr(p, addr));
>   	check(instr_is_branch_to_addr(q, addr));
> -	check(ppc_inst_equal(*q, ppc_inst(0x49fffffc)));
> +	check(ppc_inst_equal(ppc_inst_read(q), ppc_inst(0x49fffffc)));
>   
>   	/* Jump to x + 16 MB moved to x + 20 MB */
>   	p = buf;
> @@ -655,7 +657,7 @@ static void __init test_translate_branch(void)
>   	patch_instruction(q, instr);
>   	check(instr_is_branch_to_addr(p, addr));
>   	check(instr_is_branch_to_addr(q, addr));
> -	check(ppc_inst_equal(*q, ppc_inst(0x43ff8000)));
> +	check(ppc_inst_equal(ppc_inst_read(q), ppc_inst(0x43ff8000)));
>   
>   	/* Maximum positive case, move x to x - 32 KB + 4 */
>   	p = buf + 0x8000;
> @@ -667,7 +669,7 @@ static void __init test_translate_branch(void)
>   	patch_instruction(q, instr);
>   	check(instr_is_branch_to_addr(p, addr));
>   	check(instr_is_branch_to_addr(q, addr));
> -	check(ppc_inst_equal(*q, ppc_inst(0x43ff7ffc)));
> +	check(ppc_inst_equal(ppc_inst_read(q), ppc_inst(0x43ff7ffc)));
>   
>   	/* Jump to x + 12 KB moved to x + 20 KB */
>   	p = buf;
> diff --git a/arch/powerpc/lib/feature-fixups.c b/arch/powerpc/lib/feature-fixups.c
> index fb6e8e8abf4e..c0d3ed4efb7e 100644
> --- a/arch/powerpc/lib/feature-fixups.c
> +++ b/arch/powerpc/lib/feature-fixups.c
> @@ -48,7 +48,7 @@ static int patch_alt_instruction(struct ppc_inst *src, struct ppc_inst *dest,
>   	int err;
>   	struct ppc_inst instr;
>   
> -	instr = *src;
> +	instr = ppc_inst_read(src);
>   
>   	if (instr_is_relative_branch(*src)) {
>   		struct ppc_inst *target = (struct ppc_inst *)branch_target(src);
> @@ -403,7 +403,7 @@ static void do_final_fixups(void)
>   	length = (__end_interrupts - _stext) / sizeof(struct ppc_inst);
>   
>   	while (length--) {
> -		raw_patch_instruction(dest, *src);
> +		raw_patch_instruction(dest, ppc_inst_read(src));
>   		src++;
>   		dest++;
>   	}
> diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
> index e0132d6d24d0..68e0b05d9226 100644
> --- a/arch/powerpc/xmon/xmon.c
> +++ b/arch/powerpc/xmon/xmon.c
> @@ -702,13 +702,13 @@ static int xmon_core(struct pt_regs *regs, int fromipi)
>   	if ((regs->msr & (MSR_IR|MSR_PR|MSR_64BIT)) == (MSR_IR|MSR_64BIT)) {
>   		bp = at_breakpoint(regs->nip);
>   		if (bp != NULL) {
> -			int stepped = emulate_step(regs, bp->instr[0]);
> +			int stepped = emulate_step(regs, ppc_inst_read(bp->instr));
>   			if (stepped == 0) {
>   				regs->nip = (unsigned long) &bp->instr[0];
>   				atomic_inc(&bp->ref_count);
>   			} else if (stepped < 0) {
>   				printf("Couldn't single-step %s instruction\n",
> -				    (IS_RFID(bp->instr[0])? "rfid": "mtmsrd"));
> +				    IS_RFID(ppc_inst_read(bp->instr))? "rfid": "mtmsrd");
>   			}
>   		}
>   	}
> @@ -949,7 +949,7 @@ static void remove_bpts(void)
>   		if (mread(bp->address, &instr, 4) == 4
>   		    && ppc_inst_equal(instr, ppc_inst(bpinstr))
>   		    && patch_instruction(
> -			(struct ppc_inst *)bp->address, bp->instr[0]) != 0)
> +			(struct ppc_inst *)bp->address, ppc_inst_read(bp->instr)) != 0)
>   			printf("Couldn't remove breakpoint at %lx\n",
>   			       bp->address);
>   	}
> 
