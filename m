Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DBA1A0711
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 08:13:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48xHCk3fvZzDrB1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 16:13:38 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48xH8H1Vy1zDqXt
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Apr 2020 16:10:38 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03765t3b061774
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 7 Apr 2020 02:10:36 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3082mq4eja-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Apr 2020 02:10:36 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bala24@linux.ibm.com>;
 Tue, 7 Apr 2020 07:10:31 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 7 Apr 2020 07:10:27 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 03769PZp26542390
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Apr 2020 06:09:25 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6BAE4A404D;
 Tue,  7 Apr 2020 06:10:29 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CAE59A4055;
 Tue,  7 Apr 2020 06:10:27 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.79.180.203])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  7 Apr 2020 06:10:27 +0000 (GMT)
Subject: Re: [PATCH v5 03/21] powerpc: Change calling convention for
 create_branch() et. al.
From: Balamuruhan S <bala24@linux.ibm.com>
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
Date: Tue, 07 Apr 2020 11:40:26 +0530
In-Reply-To: <20200406080936.7180-4-jniethe5@gmail.com>
References: <20200406080936.7180-1-jniethe5@gmail.com>
 <20200406080936.7180-4-jniethe5@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20040706-0028-0000-0000-000003F38668
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20040706-0029-0000-0000-000024B91C80
Message-Id: <a0bfb808a0fe815ffbf7ad655d32ed837426943f.camel@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-07_01:2020-04-07,
 2020-04-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 mlxscore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004070046
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
Cc: alistair@popple.id.au, dja@axtens.net, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2020-04-06 at 18:09 +1000, Jordan Niethe wrote:
> create_branch(), create_cond_branch() and translate_branch() return the
> instruction that they create, or return 0 to signal an error. Seperate

s/seperate/separate

> these concerns in preparation for an instruction type that is not just
> an unsigned int.  Fill the created instruction to a pointer passed as
> the first parameter to the function and use a non-zero return value to
> signify an error.
> 
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
> v5: New to series
> ---
>  arch/powerpc/include/asm/code-patching.h |  12 +-
>  arch/powerpc/kernel/optprobes.c          |  24 ++--
>  arch/powerpc/kernel/setup_32.c           |   2 +-
>  arch/powerpc/kernel/trace/ftrace.c       |  24 ++--
>  arch/powerpc/lib/code-patching.c         | 133 +++++++++++++----------
>  arch/powerpc/lib/feature-fixups.c        |   5 +-
>  6 files changed, 117 insertions(+), 83 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/code-patching.h
> b/arch/powerpc/include/asm/code-patching.h
> index 898b54262881..351dda7215b6 100644
> --- a/arch/powerpc/include/asm/code-patching.h
> +++ b/arch/powerpc/include/asm/code-patching.h
> @@ -22,10 +22,10 @@
>  #define BRANCH_ABSOLUTE	0x2
>  
>  bool is_offset_in_branch_range(long offset);
> -unsigned int create_branch(const unsigned int *addr,
> -			   unsigned long target, int flags);
> -unsigned int create_cond_branch(const unsigned int *addr,
> -				unsigned long target, int flags);
> +int create_branch(unsigned int *instr, const unsigned int *addr,
> +		  unsigned long target, int flags);
> +int create_cond_branch(unsigned int *instr, const unsigned int *addr,
> +		       unsigned long target, int flags);
>  int patch_branch(unsigned int *addr, unsigned long target, int flags);
>  int patch_instruction(unsigned int *addr, unsigned int instr);
>  int raw_patch_instruction(unsigned int *addr, unsigned int instr);
> @@ -60,8 +60,8 @@ int instr_is_relative_branch(unsigned int instr);
>  int instr_is_relative_link_branch(unsigned int instr);
>  int instr_is_branch_to_addr(const unsigned int *instr, unsigned long addr);
>  unsigned long branch_target(const unsigned int *instr);
> -unsigned int translate_branch(const unsigned int *dest,
> -			      const unsigned int *src);
> +int translate_branch(unsigned int *instr, const unsigned int *dest,
> +		     const unsigned int *src);
>  extern bool is_conditional_branch(unsigned int instr);
>  #ifdef CONFIG_PPC_BOOK3E_64
>  void __patch_exception(int exc, unsigned long addr);
> diff --git a/arch/powerpc/kernel/optprobes.c
> b/arch/powerpc/kernel/optprobes.c
> index 024f7aad1952..445b3dad82dc 100644
> --- a/arch/powerpc/kernel/optprobes.c
> +++ b/arch/powerpc/kernel/optprobes.c
> @@ -251,15 +251,17 @@ int arch_prepare_optimized_kprobe(struct
> optimized_kprobe *op, struct kprobe *p)
>  		goto error;
>  	}
>  
> -	branch_op_callback = create_branch((unsigned int *)buff +
> TMPL_CALL_HDLR_IDX,
> -				(unsigned long)op_callback_addr,
> -				BRANCH_SET_LINK);
> +	rc = create_branch(&branch_op_callback,
> +			   (unsigned int *)buff + TMPL_CALL_HDLR_IDX,
> +			   (unsigned long)op_callback_addr,
> +			   BRANCH_SET_LINK);
>  
> -	branch_emulate_step = create_branch((unsigned int *)buff +
> TMPL_EMULATE_IDX,
> -				(unsigned long)emulate_step_addr,
> -				BRANCH_SET_LINK);
> +	rc |= create_branch(&branch_emulate_step,
> +			    (unsigned int *)buff + TMPL_EMULATE_IDX,
> +			    (unsigned long)emulate_step_addr,
> +			    BRANCH_SET_LINK);
>  
> -	if (!branch_op_callback || !branch_emulate_step)
> +	if (rc)
>  		goto error;
>  
>  	patch_instruction(buff + TMPL_CALL_HDLR_IDX, branch_op_callback);
> @@ -305,6 +307,7 @@ int arch_check_optimized_kprobe(struct optimized_kprobe
> *op)
>  
>  void arch_optimize_kprobes(struct list_head *oplist)
>  {
> +	unsigned int instr;
>  	struct optimized_kprobe *op;
>  	struct optimized_kprobe *tmp;
>  
> @@ -315,9 +318,10 @@ void arch_optimize_kprobes(struct list_head *oplist)
>  		 */
>  		memcpy(op->optinsn.copied_insn, op->kp.addr,
>  					       RELATIVEJUMP_SIZE);
> -		patch_instruction(op->kp.addr,
> -			create_branch((unsigned int *)op->kp.addr,
> -				      (unsigned long)op->optinsn.insn, 0));
> +		create_branch(&instr,
> +			      (unsigned int *)op->kp.addr,
> +			      (unsigned long)op->optinsn.insn, 0);
> +		patch_instruction(op->kp.addr, instr);
>  		list_del_init(&op->list);
>  	}
>  }
> diff --git a/arch/powerpc/kernel/setup_32.c b/arch/powerpc/kernel/setup_32.c
> index 5b49b26eb154..c1bdd462c5c0 100644
> --- a/arch/powerpc/kernel/setup_32.c
> +++ b/arch/powerpc/kernel/setup_32.c
> @@ -88,7 +88,7 @@ notrace void __init machine_init(u64 dt_ptr)
>  
>  	patch_instruction_site(&patch__memcpy_nocache, PPC_INST_NOP);
>  
> -	insn = create_cond_branch(addr, branch_target(addr), 0x820000);
> +	create_cond_branch(&insn, addr, branch_target(addr), 0x820000);
>  	patch_instruction(addr, insn);	/* replace b by bne cr0 */
>  
>  	/* Do some early initialization based on the flat device tree */
> diff --git a/arch/powerpc/kernel/trace/ftrace.c
> b/arch/powerpc/kernel/trace/ftrace.c
> index 7ea0ca044b65..4dcb379133f8 100644
> --- a/arch/powerpc/kernel/trace/ftrace.c
> +++ b/arch/powerpc/kernel/trace/ftrace.c
> @@ -48,7 +48,7 @@ ftrace_call_replace(unsigned long ip, unsigned long addr,
> int link)
>  	addr = ppc_function_entry((void *)addr);
>  
>  	/* if (link) set op to 'bl' else 'b' */
> -	op = create_branch((unsigned int *)ip, addr, link ? 1 : 0);
> +	create_branch(&op, (unsigned int *)ip, addr, link ? 1 : 0);
>  
>  	return op;
>  }
> @@ -89,10 +89,11 @@ ftrace_modify_code(unsigned long ip, unsigned int old,
> unsigned int new)
>   */
>  static int test_24bit_addr(unsigned long ip, unsigned long addr)
>  {
> +	unsigned int op;
>  	addr = ppc_function_entry((void *)addr);
>  
>  	/* use the create_branch to verify that this offset can be branched */
> -	return create_branch((unsigned int *)ip, addr, 0);
> +	return create_branch(&op, (unsigned int *)ip, addr, 0) == 0;
>  }
>  
>  static int is_bl_op(unsigned int op)
> @@ -287,6 +288,7 @@ __ftrace_make_nop(struct module *mod,
>  static unsigned long find_ftrace_tramp(unsigned long ip)
>  {
>  	int i;
> +	unsigned int instr;
>  
>  	/*
>  	 * We have the compiler generated long_branch tramps at the end
> @@ -295,7 +297,8 @@ static unsigned long find_ftrace_tramp(unsigned long ip)
>  	for (i = NUM_FTRACE_TRAMPS - 1; i >= 0; i--)
>  		if (!ftrace_tramps[i])
>  			continue;
> -		else if (create_branch((void *)ip, ftrace_tramps[i], 0))
> +		else if (create_branch(&instr, (void *)ip,
> +				  ftrace_tramps[i], 0) == 0)
>  			return ftrace_tramps[i];
>  
>  	return 0;
> @@ -324,6 +327,7 @@ static int setup_mcount_compiler_tramp(unsigned long
> tramp)
>  {
>  	int i, op;
>  	unsigned long ptr;
> +	unsigned int instr;
>  	static unsigned long ftrace_plt_tramps[NUM_FTRACE_TRAMPS];
>  
>  	/* Is this a known long jump tramp? */
> @@ -366,7 +370,7 @@ static int setup_mcount_compiler_tramp(unsigned long
> tramp)
>  #else
>  	ptr = ppc_global_function_entry((void *)ftrace_caller);
>  #endif
> -	if (!create_branch((void *)tramp, ptr, 0)) {
> +	if (create_branch(&instr, (void *)tramp, ptr, 0)) {
>  		pr_debug("%ps is not reachable from existing mcount tramp\n",
>  				(void *)ptr);
>  		return -1;
> @@ -511,6 +515,7 @@ static int
>  __ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
>  {
>  	unsigned int op[2];
> +	unsigned int instr;
>  	void *ip = (void *)rec->ip;
>  	unsigned long entry, ptr, tramp;
>  	struct module *mod = rec->arch.mod;
> @@ -557,7 +562,7 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned long
> addr)
>  	}
>  
>  	/* Ensure branch is within 24 bits */
> -	if (!create_branch(ip, tramp, BRANCH_SET_LINK)) {
> +	if (create_branch(&instr, ip, tramp, BRANCH_SET_LINK)) {
>  		pr_err("Branch out of range\n");
>  		return -EINVAL;
>  	}
> @@ -574,6 +579,7 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned long
> addr)
>  static int
>  __ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
>  {
> +	int err;
>  	unsigned int op;
>  	unsigned long ip = rec->ip;
>  
> @@ -594,9 +600,9 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned long
> addr)
>  	}
>  
>  	/* create the branch to the trampoline */
> -	op = create_branch((unsigned int *)ip,
> -			   rec->arch.mod->arch.tramp, BRANCH_SET_LINK);
> -	if (!op) {
> +	err = create_branch(&op, (unsigned int *)ip,
> +			    rec->arch.mod->arch.tramp, BRANCH_SET_LINK);
> +	if (!err) {


should this be `if (err)` as per your new changes ?


>  		pr_err("REL24 out of range!\n");
>  		return -EINVAL;
>  	}
> @@ -776,7 +782,7 @@ __ftrace_modify_call(struct dyn_ftrace *rec, unsigned
> long old_addr,
>  	}
>  
>  	/* Ensure branch is within 24 bits */
> -	if (!create_branch((unsigned int *)ip, tramp, BRANCH_SET_LINK)) {
> +	if (create_branch(&op, (unsigned int *)ip, tramp, BRANCH_SET_LINK)) {
>  		pr_err("Branch out of range\n");
>  		return -EINVAL;
>  	}
> diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-
> patching.c
> index 3345f039a876..4af564aeedf1 100644
> --- a/arch/powerpc/lib/code-patching.c
> +++ b/arch/powerpc/lib/code-patching.c
> @@ -196,7 +196,10 @@ NOKPROBE_SYMBOL(patch_instruction);
>  
>  int patch_branch(unsigned int *addr, unsigned long target, int flags)
>  {
> -	return patch_instruction(addr, create_branch(addr, target, flags));
> +	unsigned int instr;
> +
> +	create_branch(&instr, addr, target, flags);
> +	return patch_instruction(addr, instr);
>  }
>  
>  bool is_offset_in_branch_range(long offset)
> @@ -243,30 +246,30 @@ bool is_conditional_branch(unsigned int instr)
>  }
>  NOKPROBE_SYMBOL(is_conditional_branch);
>  
> -unsigned int create_branch(const unsigned int *addr,
> -			   unsigned long target, int flags)
> +int create_branch(unsigned int *instr,
> +		  const unsigned int *addr,
> +		  unsigned long target, int flags)
>  {
> -	unsigned int instruction;
>  	long offset;
>  
> +	*instr = 0;
>  	offset = target;
>  	if (! (flags & BRANCH_ABSOLUTE))
>  		offset = offset - (unsigned long)addr;
>  
>  	/* Check we can represent the target in the instruction format */
>  	if (!is_offset_in_branch_range(offset))
> -		return 0;
> +		return 1;
>  
>  	/* Mask out the flags and target, so they don't step on each other. */
> -	instruction = 0x48000000 | (flags & 0x3) | (offset & 0x03FFFFFC);
> +	*instr = 0x48000000 | (flags & 0x3) | (offset & 0x03FFFFFC);
>  
> -	return instruction;
> +	return 0;
>  }
>  
> -unsigned int create_cond_branch(const unsigned int *addr,
> -				unsigned long target, int flags)
> +int create_cond_branch(unsigned int *instr, const unsigned int *addr,
> +		       unsigned long target, int flags)
>  {
> -	unsigned int instruction;
>  	long offset;
>  
>  	offset = target;
> @@ -275,12 +278,12 @@ unsigned int create_cond_branch(const unsigned int
> *addr,
>  
>  	/* Check we can represent the target in the instruction format */
>  	if (offset < -0x8000 || offset > 0x7FFF || offset & 0x3)
> -		return 0;
> +		return 1;
>  
>  	/* Mask out the flags and target, so they don't step on each other. */
> -	instruction = 0x40000000 | (flags & 0x3FF0003) | (offset & 0xFFFC);
> +	*instr = 0x40000000 | (flags & 0x3FF0003) | (offset & 0xFFFC);
>  
> -	return instruction;
> +	return 0;
>  }
>  
>  static unsigned int branch_opcode(unsigned int instr)
> @@ -361,18 +364,18 @@ int instr_is_branch_to_addr(const unsigned int *instr,
> unsigned long addr)
>  	return 0;
>  }
>  
> -unsigned int translate_branch(const unsigned int *dest, const unsigned int
> *src)
> +int translate_branch(unsigned int *instr, const unsigned int *dest, const
> unsigned int *src)
>  {
>  	unsigned long target;
>  
>  	target = branch_target(src);
>  
>  	if (instr_is_branch_iform(*src))
> -		return create_branch(dest, target, *src);
> +		return create_branch(instr, dest, target, *src);
>  	else if (instr_is_branch_bform(*src))
> -		return create_cond_branch(dest, target, *src);
> +		return create_cond_branch(instr, dest, target, *src);
>  
> -	return 0;
> +	return 1;
>  }
>  
>  #ifdef CONFIG_PPC_BOOK3E_64
> @@ -403,6 +406,7 @@ static void __init test_trampoline(void)
>  
>  static void __init test_branch_iform(void)
>  {
> +	int err;
>  	unsigned int instr;
>  	unsigned long addr;
>  
> @@ -443,35 +447,35 @@ static void __init test_branch_iform(void)
>  	check(instr_is_branch_to_addr(&instr, addr - 0x2000000));
>  
>  	/* Branch to self, with link */
> -	instr = create_branch(&instr, addr, BRANCH_SET_LINK);
> +	err = create_branch(&instr, &instr, addr, BRANCH_SET_LINK);
>  	check(instr_is_branch_to_addr(&instr, addr));
>  
>  	/* Branch to self - 0x100, with link */
> -	instr = create_branch(&instr, addr - 0x100, BRANCH_SET_LINK);
> +	err = create_branch(&instr, &instr, addr - 0x100, BRANCH_SET_LINK);
>  	check(instr_is_branch_to_addr(&instr, addr - 0x100));
>  
>  	/* Branch to self + 0x100, no link */
> -	instr = create_branch(&instr, addr + 0x100, 0);
> +	err = create_branch(&instr, &instr, addr + 0x100, 0);
>  	check(instr_is_branch_to_addr(&instr, addr + 0x100));
>  
>  	/* Maximum relative negative offset, - 32 MB */
> -	instr = create_branch(&instr, addr - 0x2000000, BRANCH_SET_LINK);
> +	err = create_branch(&instr, &instr, addr - 0x2000000, BRANCH_SET_LINK);
>  	check(instr_is_branch_to_addr(&instr, addr - 0x2000000));
>  
>  	/* Out of range relative negative offset, - 32 MB + 4*/
> -	instr = create_branch(&instr, addr - 0x2000004, BRANCH_SET_LINK);
> -	check(instr == 0);
> +	err = create_branch(&instr, &instr, addr - 0x2000004, BRANCH_SET_LINK);
> +	check(err);
>  
>  	/* Out of range relative positive offset, + 32 MB */
> -	instr = create_branch(&instr, addr + 0x2000000, BRANCH_SET_LINK);
> -	check(instr == 0);
> +	err = create_branch(&instr, &instr, addr + 0x2000000, BRANCH_SET_LINK);
> +	check(err);
>  
>  	/* Unaligned target */
> -	instr = create_branch(&instr, addr + 3, BRANCH_SET_LINK);
> -	check(instr == 0);
> +	err = create_branch(&instr, &instr, addr + 3, BRANCH_SET_LINK);
> +	check(err);
>  
>  	/* Check flags are masked correctly */
> -	instr = create_branch(&instr, addr, 0xFFFFFFFC);
> +	err = create_branch(&instr, &instr, addr, 0xFFFFFFFC);
>  	check(instr_is_branch_to_addr(&instr, addr));
>  	check(instr == 0x48000000);
>  }
> @@ -480,16 +484,19 @@ static void __init test_create_function_call(void)
>  {
>  	unsigned int *iptr;
>  	unsigned long dest;
> +	unsigned int instr;
>  
>  	/* Check we can create a function call */
>  	iptr = (unsigned int *)ppc_function_entry(test_trampoline);
>  	dest = ppc_function_entry(test_create_function_call);
> -	patch_instruction(iptr, create_branch(iptr, dest, BRANCH_SET_LINK));
> +	create_branch(&instr, iptr, dest, BRANCH_SET_LINK);
> +	patch_instruction(iptr, instr);


Are we sure that `create_branch()` would always succeed here to do
patch_instruction() ?


>  	check(instr_is_branch_to_addr(iptr, dest));
>  }
>  
>  static void __init test_branch_bform(void)
>  {
> +	int err;
>  	unsigned long addr;
>  	unsigned int *iptr, instr, flags;
>  
> @@ -525,35 +532,35 @@ static void __init test_branch_bform(void)
>  	flags = 0x3ff000 | BRANCH_SET_LINK;
>  
>  	/* Branch to self */
> -	instr = create_cond_branch(iptr, addr, flags);
> +	err = create_cond_branch(&instr, iptr, addr, flags);
>  	check(instr_is_branch_to_addr(&instr, addr));
>  
>  	/* Branch to self - 0x100 */
> -	instr = create_cond_branch(iptr, addr - 0x100, flags);
> +	err = create_cond_branch(&instr, iptr, addr - 0x100, flags);
>  	check(instr_is_branch_to_addr(&instr, addr - 0x100));
>  
>  	/* Branch to self + 0x100 */
> -	instr = create_cond_branch(iptr, addr + 0x100, flags);
> +	err = create_cond_branch(&instr, iptr, addr + 0x100, flags);
>  	check(instr_is_branch_to_addr(&instr, addr + 0x100));
>  
>  	/* Maximum relative negative offset, - 32 KB */
> -	instr = create_cond_branch(iptr, addr - 0x8000, flags);
> +	err = create_cond_branch(&instr, iptr, addr - 0x8000, flags);
>  	check(instr_is_branch_to_addr(&instr, addr - 0x8000));
>  
>  	/* Out of range relative negative offset, - 32 KB + 4*/
> -	instr = create_cond_branch(iptr, addr - 0x8004, flags);
> -	check(instr == 0);
> +	err = create_cond_branch(&instr, iptr, addr - 0x8004, flags);
> +	check(err);
>  
>  	/* Out of range relative positive offset, + 32 KB */
> -	instr = create_cond_branch(iptr, addr + 0x8000, flags);
> -	check(instr == 0);
> +	err = create_cond_branch(&instr, iptr, addr + 0x8000, flags);
> +	check(err);
>  
>  	/* Unaligned target */
> -	instr = create_cond_branch(iptr, addr + 3, flags);
> -	check(instr == 0);
> +	err = create_cond_branch(&instr, iptr, addr + 3, flags);
> +	check(err);
>  
>  	/* Check flags are masked correctly */
> -	instr = create_cond_branch(iptr, addr, 0xFFFFFFFC);
> +	err = create_cond_branch(&instr, iptr, addr, 0xFFFFFFFC);
>  	check(instr_is_branch_to_addr(&instr, addr));
>  	check(instr == 0x43FF0000);
>  }
> @@ -562,6 +569,7 @@ static void __init test_translate_branch(void)
>  {
>  	unsigned long addr;
>  	unsigned int *p, *q;
> +	unsigned int instr;
>  	void *buf;
>  
>  	buf = vmalloc(PAGE_ALIGN(0x2000000 + 1));
> @@ -575,7 +583,8 @@ static void __init test_translate_branch(void)
>  	patch_branch(p, addr, 0);
>  	check(instr_is_branch_to_addr(p, addr));
>  	q = p + 1;
> -	patch_instruction(q, translate_branch(q, p));
> +	translate_branch(&instr, q, p);
> +	patch_instruction(q, instr);


same here and elsewhere in similar such places where we do patch_instruction()

-- Bala

>  	check(instr_is_branch_to_addr(q, addr));
>  
>  	/* Maximum negative case, move b . to addr + 32 MB */
> @@ -583,7 +592,8 @@ static void __init test_translate_branch(void)
>  	addr = (unsigned long)p;
>  	patch_branch(p, addr, 0);
>  	q = buf + 0x2000000;
> -	patch_instruction(q, translate_branch(q, p));
> +	translate_branch(&instr, q, p);
> +	patch_instruction(q, instr);
>  	check(instr_is_branch_to_addr(p, addr));
>  	check(instr_is_branch_to_addr(q, addr));
>  	check(*q == 0x4a000000);
> @@ -593,7 +603,8 @@ static void __init test_translate_branch(void)
>  	addr = (unsigned long)p;
>  	patch_branch(p, addr, 0);
>  	q = buf + 4;
> -	patch_instruction(q, translate_branch(q, p));
> +	translate_branch(&instr, q, p);
> +	patch_instruction(q, instr);
>  	check(instr_is_branch_to_addr(p, addr));
>  	check(instr_is_branch_to_addr(q, addr));
>  	check(*q == 0x49fffffc);
> @@ -603,7 +614,8 @@ static void __init test_translate_branch(void)
>  	addr = 0x1000000 + (unsigned long)buf;
>  	patch_branch(p, addr, BRANCH_SET_LINK);
>  	q = buf + 0x1400000;
> -	patch_instruction(q, translate_branch(q, p));
> +	translate_branch(&instr, q, p);
> +	patch_instruction(q, instr);
>  	check(instr_is_branch_to_addr(p, addr));
>  	check(instr_is_branch_to_addr(q, addr));
>  
> @@ -612,7 +624,8 @@ static void __init test_translate_branch(void)
>  	addr = 0x2000000 + (unsigned long)buf;
>  	patch_branch(p, addr, 0);
>  	q = buf + 4;
> -	patch_instruction(q, translate_branch(q, p));
> +	translate_branch(&instr, q, p);
> +	patch_instruction(q, instr);
>  	check(instr_is_branch_to_addr(p, addr));
>  	check(instr_is_branch_to_addr(q, addr));
>  
> @@ -622,18 +635,22 @@ static void __init test_translate_branch(void)
>  	/* Simple case, branch to self moved a little */
>  	p = buf;
>  	addr = (unsigned long)p;
> -	patch_instruction(p, create_cond_branch(p, addr, 0));
> +	create_cond_branch(&instr, p, addr, 0);
> +	patch_instruction(p, instr);
>  	check(instr_is_branch_to_addr(p, addr));
>  	q = p + 1;
> -	patch_instruction(q, translate_branch(q, p));
> +	translate_branch(&instr, q, p);
> +	patch_instruction(q, instr);
>  	check(instr_is_branch_to_addr(q, addr));
>  
>  	/* Maximum negative case, move b . to addr + 32 KB */
>  	p = buf;
>  	addr = (unsigned long)p;
> -	patch_instruction(p, create_cond_branch(p, addr, 0xFFFFFFFC));
> +	create_cond_branch(&instr, p, addr, 0xFFFFFFFC);
> +	patch_instruction(p, instr);
>  	q = buf + 0x8000;
> -	patch_instruction(q, translate_branch(q, p));
> +	translate_branch(&instr, q, p);
> +	patch_instruction(q, instr);
>  	check(instr_is_branch_to_addr(p, addr));
>  	check(instr_is_branch_to_addr(q, addr));
>  	check(*q == 0x43ff8000);
> @@ -641,9 +658,11 @@ static void __init test_translate_branch(void)
>  	/* Maximum positive case, move x to x - 32 KB + 4 */
>  	p = buf + 0x8000;
>  	addr = (unsigned long)p;
> -	patch_instruction(p, create_cond_branch(p, addr, 0xFFFFFFFC));
> +	create_cond_branch(&instr, p, addr, 0xFFFFFFFC);
> +	patch_instruction(p, instr);
>  	q = buf + 4;
> -	patch_instruction(q, translate_branch(q, p));
> +	translate_branch(&instr, q, p);
> +	patch_instruction(q, instr);
>  	check(instr_is_branch_to_addr(p, addr));
>  	check(instr_is_branch_to_addr(q, addr));
>  	check(*q == 0x43ff7ffc);
> @@ -651,18 +670,22 @@ static void __init test_translate_branch(void)
>  	/* Jump to x + 12 KB moved to x + 20 KB */
>  	p = buf;
>  	addr = 0x3000 + (unsigned long)buf;
> -	patch_instruction(p, create_cond_branch(p, addr, BRANCH_SET_LINK));
> +	create_cond_branch(&instr, p, addr, BRANCH_SET_LINK);
> +	patch_instruction(p, instr);
>  	q = buf + 0x5000;
> -	patch_instruction(q, translate_branch(q, p));
> +	translate_branch(&instr, q, p);
> +	patch_instruction(q, instr);
>  	check(instr_is_branch_to_addr(p, addr));
>  	check(instr_is_branch_to_addr(q, addr));
>  
>  	/* Jump to x + 8 KB moved to x - 8 KB + 4 */
>  	p = buf + 0x2000;
>  	addr = 0x4000 + (unsigned long)buf;
> -	patch_instruction(p, create_cond_branch(p, addr, 0));
> +	create_cond_branch(&instr, p, addr, 0);
> +	patch_instruction(p, instr);
>  	q = buf + 4;
> -	patch_instruction(q, translate_branch(q, p));
> +	translate_branch(&instr, q, p);
> +	patch_instruction(q, instr);
>  	check(instr_is_branch_to_addr(p, addr));
>  	check(instr_is_branch_to_addr(q, addr));
>  
> diff --git a/arch/powerpc/lib/feature-fixups.c b/arch/powerpc/lib/feature-
> fixups.c
> index 4ba634b89ce5..b129d7b4e7dd 100644
> --- a/arch/powerpc/lib/feature-fixups.c
> +++ b/arch/powerpc/lib/feature-fixups.c
> @@ -44,6 +44,7 @@ static unsigned int *calc_addr(struct fixup_entry *fcur,
> long offset)
>  static int patch_alt_instruction(unsigned int *src, unsigned int *dest,
>  				 unsigned int *alt_start, unsigned int
> *alt_end)
>  {
> +	int err;
>  	unsigned int instr;
>  
>  	instr = *src;
> @@ -53,8 +54,8 @@ static int patch_alt_instruction(unsigned int *src,
> unsigned int *dest,
>  
>  		/* Branch within the section doesn't need translating */
>  		if (target < alt_start || target > alt_end) {
> -			instr = translate_branch(dest, src);
> -			if (!instr)
> +			err = translate_branch(&instr, dest, src);
> +			if (err)
>  				return 1;
>  		}
>  	}

