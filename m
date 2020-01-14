Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D6213A197
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2020 08:21:29 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47xhhj4jG5zDqDt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2020 18:21:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bala24@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47xhfj6VhrzDqDq
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2020 18:19:41 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00E7H5lf137569
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2020 02:19:38 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xfavynx0d-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2020 02:19:38 -0500
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bala24@linux.ibm.com>;
 Tue, 14 Jan 2020 07:19:34 -0000
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 14 Jan 2020 07:19:31 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 00E7JUdZ43516392
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Jan 2020 07:19:30 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C1FD05204F;
 Tue, 14 Jan 2020 07:19:30 +0000 (GMT)
Received: from dhcp-9-109-246-161.in.ibm.com (unknown [9.124.35.118])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 0C1AF52054;
 Tue, 14 Jan 2020 07:19:29 +0000 (GMT)
Date: Tue, 14 Jan 2020 12:49:27 +0530
From: Balamuruhan S <bala24@linux.ibm.com>
To: Jordan Niethe <jniethe5@gmail.com>
Subject: Re: [PATCH 14/18] powerpc/kprobes: Support kprobes on prefixed
 instructions
References: <20191126052141.28009-1-jniethe5@gmail.com>
 <20191126052141.28009-15-jniethe5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191126052141.28009-15-jniethe5@gmail.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-TM-AS-GCONF: 00
x-cbid: 20011407-0020-0000-0000-000003A076C3
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20011407-0021-0000-0000-000021F7E962
Message-Id: <20200114071927.GA8713@dhcp-9-109-246-161.in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-14_01:2020-01-13,
 2020-01-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 suspectscore=3 adultscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 phishscore=0 mlxlogscore=862 bulkscore=0 mlxscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001140063
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
Cc: alistair@popple.id.au, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Nov 26, 2019 at 04:21:37PM +1100, Jordan Niethe wrote:
> A prefixed instruction is composed of a word prefix followed by a word
> suffix. It does not make sense to be able to have a kprobe on the suffix
> of a prefixed instruction, so make this impossible.
> 
> Kprobes work by replacing an instruction with a trap and saving that
> instruction to be single stepped out of place later. Currently there is
> not enough space allocated to keep a prefixed instruction for single
> stepping. Increase the amount of space allocated for holding the
> instruction copy.
> 
> kprobe_post_handler() expects all instructions to be 4 bytes long which
> means that it does not function correctly for prefixed instructions.
> Add checks for prefixed instructions which will use a length of 8 bytes
> instead.
> 
> For optprobes we normally patch in loading the instruction we put a
> probe on into r4 before calling emulate_step(). We now make space and
> patch in loading the suffix into r5 as well.
> 
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
>  arch/powerpc/include/asm/kprobes.h   |  5 +--
>  arch/powerpc/kernel/kprobes.c        | 46 +++++++++++++++++++++-------
>  arch/powerpc/kernel/optprobes.c      | 31 +++++++++++--------
>  arch/powerpc/kernel/optprobes_head.S |  6 ++++
>  4 files changed, 62 insertions(+), 26 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/kprobes.h b/arch/powerpc/include/asm/kprobes.h
> index 66b3f2983b22..1f03a1cacb1e 100644
> --- a/arch/powerpc/include/asm/kprobes.h
> +++ b/arch/powerpc/include/asm/kprobes.h
> @@ -38,12 +38,13 @@ extern kprobe_opcode_t optprobe_template_entry[];
>  extern kprobe_opcode_t optprobe_template_op_address[];
>  extern kprobe_opcode_t optprobe_template_call_handler[];
>  extern kprobe_opcode_t optprobe_template_insn[];
> +extern kprobe_opcode_t optprobe_template_sufx[];
>  extern kprobe_opcode_t optprobe_template_call_emulate[];
>  extern kprobe_opcode_t optprobe_template_ret[];
>  extern kprobe_opcode_t optprobe_template_end[];
>  
> -/* Fixed instruction size for powerpc */
> -#define MAX_INSN_SIZE		1
> +/* Prefixed instructions are two words */
> +#define MAX_INSN_SIZE		2
>  #define MAX_OPTIMIZED_LENGTH	sizeof(kprobe_opcode_t)	/* 4 bytes */
>  #define MAX_OPTINSN_SIZE	(optprobe_template_end - optprobe_template_entry)
>  #define RELATIVEJUMP_SIZE	sizeof(kprobe_opcode_t)	/* 4 bytes */
> diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
> index 7303fe3856cc..aa15b3480385 100644
> --- a/arch/powerpc/kernel/kprobes.c
> +++ b/arch/powerpc/kernel/kprobes.c
> @@ -104,17 +104,30 @@ kprobe_opcode_t *kprobe_lookup_name(const char *name, unsigned int offset)
>  
>  int arch_prepare_kprobe(struct kprobe *p)
>  {
> +	int len;
>  	int ret = 0;
> +	struct kprobe *prev;
>  	kprobe_opcode_t insn = *p->addr;
> +	kprobe_opcode_t prfx = *(p->addr - 1);
>  
> +	preempt_disable();
>  	if ((unsigned long)p->addr & 0x03) {
>  		printk("Attempt to register kprobe at an unaligned address\n");
>  		ret = -EINVAL;
>  	} else if (IS_MTMSRD(insn) || IS_RFID(insn) || IS_RFI(insn)) {
>  		printk("Cannot register a kprobe on rfi/rfid or mtmsr[d]\n");
>  		ret = -EINVAL;
> +	} else if (IS_PREFIX(prfx)) {
> +		printk("Cannot register a kprobe on the second word of prefixed instruction\n");

Let's have line with in 80 columns length.

> +		ret = -EINVAL;
> +	}
> +	prev = get_kprobe(p->addr - 1);
> +	if (prev && IS_PREFIX(*prev->ainsn.insn)) {
> +		printk("Cannot register a kprobe on the second word of prefixed instruction\n");

same here.

-- Bala
> +		ret = -EINVAL;
>  	}
>  
> +
>  	/* insn must be on a special executable page on ppc64.  This is
>  	 * not explicitly required on ppc32 (right now), but it doesn't hurt */
>  	if (!ret) {
> @@ -124,14 +137,18 @@ int arch_prepare_kprobe(struct kprobe *p)
>  	}
>  
>  	if (!ret) {
> -		memcpy(p->ainsn.insn, p->addr,
> -				MAX_INSN_SIZE * sizeof(kprobe_opcode_t));
> +		if (IS_PREFIX(insn))
> +			len = MAX_INSN_SIZE * sizeof(kprobe_opcode_t);
> +		else
> +			len = sizeof(kprobe_opcode_t);
> +		memcpy(p->ainsn.insn, p->addr, len);
>  		p->opcode = *p->addr;
>  		flush_icache_range((unsigned long)p->ainsn.insn,
>  			(unsigned long)p->ainsn.insn + sizeof(kprobe_opcode_t));
>  	}
>  
>  	p->ainsn.boostable = 0;
> +	preempt_enable_no_resched();
>  	return ret;
>  }
>  NOKPROBE_SYMBOL(arch_prepare_kprobe);
> @@ -216,10 +233,11 @@ NOKPROBE_SYMBOL(arch_prepare_kretprobe);
>  static int try_to_emulate(struct kprobe *p, struct pt_regs *regs)
>  {
>  	int ret;
> -	unsigned int insn = *p->ainsn.insn;
> +	unsigned int insn = p->ainsn.insn[0];
> +	unsigned int sufx = p->ainsn.insn[1];
>  
>  	/* regs->nip is also adjusted if emulate_step returns 1 */
> -	ret = emulate_step(regs, insn, 0);
> +	ret = emulate_step(regs, insn, sufx);
>  	if (ret > 0) {
>  		/*
>  		 * Once this instruction has been boosted
> @@ -233,7 +251,10 @@ static int try_to_emulate(struct kprobe *p, struct pt_regs *regs)
>  		 * So, we should never get here... but, its still
>  		 * good to catch them, just in case...
>  		 */
> -		printk("Can't step on instruction %x\n", insn);
> +		if (!IS_PREFIX(insn))
> +			printk("Can't step on instruction %x\n", insn);
> +		else
> +			printk("Can't step on instruction %x %x\n", insn, sufx);
>  		BUG();
>  	} else {
>  		/*
> @@ -275,7 +296,7 @@ int kprobe_handler(struct pt_regs *regs)
>  	if (kprobe_running()) {
>  		p = get_kprobe(addr);
>  		if (p) {
> -			kprobe_opcode_t insn = *p->ainsn.insn;
> +			kprobe_opcode_t insn = p->ainsn.insn[0];
>  			if (kcb->kprobe_status == KPROBE_HIT_SS &&
>  					is_trap(insn)) {
>  				/* Turn off 'trace' bits */
> @@ -448,9 +469,10 @@ static int trampoline_probe_handler(struct kprobe *p, struct pt_regs *regs)
>  	 * the link register properly so that the subsequent 'blr' in
>  	 * kretprobe_trampoline jumps back to the right instruction.
>  	 *
> -	 * For nip, we should set the address to the previous instruction since
> -	 * we end up emulating it in kprobe_handler(), which increments the nip
> -	 * again.
> +	 * To keep the nip at the correct address we need to counter the
> +	 * increment that happens when we emulate the kretprobe_trampoline noop
> +	 * in kprobe_handler(). We do this by decrementing the address by the
> +	 * length of the noop which is always 4 bytes.
>  	 */
>  	regs->nip = orig_ret_address - 4;
>  	regs->link = orig_ret_address;
> @@ -478,12 +500,14 @@ int kprobe_post_handler(struct pt_regs *regs)
>  {
>  	struct kprobe *cur = kprobe_running();
>  	struct kprobe_ctlblk *kcb = get_kprobe_ctlblk();
> +	kprobe_opcode_t insn;
>  
>  	if (!cur || user_mode(regs))
>  		return 0;
>  
> +	insn = *cur->ainsn.insn;
>  	/* make sure we got here for instruction we have a kprobe on */
> -	if (((unsigned long)cur->ainsn.insn + 4) != regs->nip)
> +	if (((unsigned long)cur->ainsn.insn + (IS_PREFIX(insn) ? 8 : 4)) != regs->nip)
>  		return 0;
>  
>  	if ((kcb->kprobe_status != KPROBE_REENTER) && cur->post_handler) {
> @@ -492,7 +516,7 @@ int kprobe_post_handler(struct pt_regs *regs)
>  	}
>  
>  	/* Adjust nip to after the single-stepped instruction */
> -	regs->nip = (unsigned long)cur->addr + 4;
> +	regs->nip = (unsigned long)cur->addr + (IS_PREFIX(insn) ? 8 : 4);
>  	regs->msr |= kcb->kprobe_saved_msr;
>  
>  	/*Restore back the original saved kprobes variables and continue. */
> diff --git a/arch/powerpc/kernel/optprobes.c b/arch/powerpc/kernel/optprobes.c
> index 82dc8a589c87..b2aef27bac27 100644
> --- a/arch/powerpc/kernel/optprobes.c
> +++ b/arch/powerpc/kernel/optprobes.c
> @@ -27,6 +27,8 @@
>  	(optprobe_template_op_address - optprobe_template_entry)
>  #define TMPL_INSN_IDX		\
>  	(optprobe_template_insn - optprobe_template_entry)
> +#define TMPL_SUFX_IDX		\
> +	(optprobe_template_sufx - optprobe_template_entry)
>  #define TMPL_END_IDX		\
>  	(optprobe_template_end - optprobe_template_entry)
>  
> @@ -100,7 +102,8 @@ static unsigned long can_optimize(struct kprobe *p)
>  	 * and that can be emulated.
>  	 */
>  	if (!is_conditional_branch(*p->ainsn.insn) &&
> -			analyse_instr(&op, &regs, *p->ainsn.insn, 0) == 1) {
> +			analyse_instr(&op, &regs, p->ainsn.insn[0],
> +				      p->ainsn.insn[1]) == 1) {
>  		emulate_update_regs(&regs, &op);
>  		nip = regs.nip;
>  	}
> @@ -140,27 +143,27 @@ void arch_remove_optimized_kprobe(struct optimized_kprobe *op)
>  }
>  
>  /*
> - * emulate_step() requires insn to be emulated as
> - * second parameter. Load register 'r4' with the
> - * instruction.
> + * emulate_step() requires insn to be emulated as second parameter, and the
> + * suffix as the third parameter. Load these into registers.
>   */
> -void patch_imm32_load_insns(unsigned int val, kprobe_opcode_t *addr)
> +static void patch_imm32_load_insns(int reg, unsigned int val,
> +				   kprobe_opcode_t *addr)
>  {
> -	/* addis r4,0,(insn)@h */
> -	patch_instruction(addr, PPC_INST_ADDIS | ___PPC_RT(4) |
> +	/* addis reg,0,(insn)@h */
> +	patch_instruction(addr, PPC_INST_ADDIS | ___PPC_RT(reg) |
>  			  ((val >> 16) & 0xffff));
>  	addr++;
>  
> -	/* ori r4,r4,(insn)@l */
> -	patch_instruction(addr, PPC_INST_ORI | ___PPC_RA(4) |
> -			  ___PPC_RS(4) | (val & 0xffff));
> +	/* ori reg,reg,(insn)@l */
> +	patch_instruction(addr, PPC_INST_ORI | ___PPC_RA(reg) |
> +			  ___PPC_RS(reg) | (val & 0xffff));
>  }
>  
>  /*
>   * Generate instructions to load provided immediate 64-bit value
>   * to register 'r3' and patch these instructions at 'addr'.
>   */
> -void patch_imm64_load_insns(unsigned long val, kprobe_opcode_t *addr)
> +static void patch_imm64_load_insns(unsigned long val, kprobe_opcode_t *addr)
>  {
>  	/* lis r3,(op)@highest */
>  	patch_instruction(addr, PPC_INST_ADDIS | ___PPC_RT(3) |
> @@ -266,9 +269,11 @@ int arch_prepare_optimized_kprobe(struct optimized_kprobe *op, struct kprobe *p)
>  	patch_instruction(buff + TMPL_EMULATE_IDX, branch_emulate_step);
>  
>  	/*
> -	 * 3. load instruction to be emulated into relevant register, and
> +	 * 3. load instruction and suffix to be emulated into the relevant
> +	 * registers, and
>  	 */
> -	patch_imm32_load_insns(*p->ainsn.insn, buff + TMPL_INSN_IDX);
> +	patch_imm32_load_insns(4, p->ainsn.insn[0], buff + TMPL_INSN_IDX);
> +	patch_imm32_load_insns(5, p->ainsn.insn[1], buff + TMPL_SUFX_IDX);
>  
>  	/*
>  	 * 4. branch back from trampoline
> diff --git a/arch/powerpc/kernel/optprobes_head.S b/arch/powerpc/kernel/optprobes_head.S
> index cf383520843f..998359ae44ec 100644
> --- a/arch/powerpc/kernel/optprobes_head.S
> +++ b/arch/powerpc/kernel/optprobes_head.S
> @@ -95,6 +95,12 @@ optprobe_template_insn:
>  	nop
>  	nop
>  
> +	.global optprobe_template_sufx
> +optprobe_template_sufx:
> +	/* Pass suffix to be emulated in r5 */
> +	nop
> +	nop
> +
>  	.global optprobe_template_call_emulate
>  optprobe_template_call_emulate:
>  	/* Branch to emulate_step()  */
> -- 
> 2.20.1
> 

