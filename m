Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6AC1A087A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 09:39:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48xK6n0wW3zDr8p
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 17:39:29 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48xK4z47lHzDqgP
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Apr 2020 17:37:54 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0377Xntc086192
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 7 Apr 2020 03:37:52 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0b-001b2d01.pphosted.com with ESMTP id 306kuw7wst-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Apr 2020 03:37:51 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bala24@linux.ibm.com>;
 Tue, 7 Apr 2020 08:37:26 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 7 Apr 2020 08:37:22 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0377bjrB30146808
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Apr 2020 07:37:45 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ED2CB4C040;
 Tue,  7 Apr 2020 07:37:44 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B4D0C4C052;
 Tue,  7 Apr 2020 07:37:43 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.199.51.145])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  7 Apr 2020 07:37:43 +0000 (GMT)
Subject: Re: [PATCH v5 08/21] powerpc: Introduce functions for instruction
 equality
From: Balamuruhan S <bala24@linux.ibm.com>
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
Date: Tue, 07 Apr 2020 13:07:42 +0530
In-Reply-To: <20200406080936.7180-9-jniethe5@gmail.com>
References: <20200406080936.7180-1-jniethe5@gmail.com>
 <20200406080936.7180-9-jniethe5@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20040707-0016-0000-0000-000002FFDEE0
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20040707-0017-0000-0000-00003363B858
Message-Id: <1a99be1860ca76bf48a6eac8687488b6c41d2c87.camel@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-07_01:2020-04-07,
 2020-04-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 spamscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004070059
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
> In preparation for an instruction data type that can not be directly
> used with the '==' operator use functions for checking equality.

LGTM except one comment below, otherwise

Reviewed-by: Balamuruhan S <bala24@linux.ibm.com>

> 
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
> v5: Remove ppc_inst_null()
> ---
>  arch/powerpc/include/asm/inst.h      |  5 +++++
>  arch/powerpc/kernel/trace/ftrace.c   | 15 ++++++++-------
>  arch/powerpc/lib/code-patching.c     | 12 ++++++------
>  arch/powerpc/lib/test_emulate_step.c |  2 +-
>  arch/powerpc/xmon/xmon.c             |  4 ++--
>  5 files changed, 22 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/inst.h
> b/arch/powerpc/include/asm/inst.h
> index 78eb1481f1f6..54ee46b0a7c9 100644
> --- a/arch/powerpc/include/asm/inst.h
> +++ b/arch/powerpc/include/asm/inst.h
> @@ -23,4 +23,9 @@ static inline u32 ppc_inst_swab(u32 x)
>  	return ppc_inst(swab32(ppc_inst_val(x)));
>  }
>  
> +static inline bool ppc_inst_equal(u32 x, u32 y)
> +{
> +	return x == y;
> +}
> +
>  #endif /* _ASM_INST_H */
> diff --git a/arch/powerpc/kernel/trace/ftrace.c
> b/arch/powerpc/kernel/trace/ftrace.c
> index 62ff429bddc4..784b5746cc55 100644
> --- a/arch/powerpc/kernel/trace/ftrace.c
> +++ b/arch/powerpc/kernel/trace/ftrace.c
> @@ -72,7 +72,7 @@ ftrace_modify_code(unsigned long ip, unsigned int old,
> unsigned int new)
>  		return -EFAULT;
>  
>  	/* Make sure it is what we expect it to be */
> -	if (replaced != old) {
> +	if (!ppc_inst_equal(replaced, old)) {
>  		pr_err("%p: replaced (%#x) != old (%#x)",
>  		(void *)ip, ppc_inst_val(replaced), ppc_inst_val(old));
>  		return -EINVAL;
> @@ -170,7 +170,8 @@ __ftrace_make_nop(struct module *mod,
>  	}
>  
>  	/* We expect either a mflr r0, or a std r0, LRSAVE(r1) */
> -	if (op != ppc_inst(PPC_INST_MFLR) && op != ppc_inst(PPC_INST_STD_LR)) {
> +	if (!ppc_inst_equal(op, ppc_inst(PPC_INST_MFLR)) &&
> +	    !ppc_inst_equal(op, ppc_inst(PPC_INST_STD_LR))) {
>  		pr_err("Unexpected instruction %08x around bl _mcount\n",
> ppc_inst_val(op));
>  		return -EINVAL;
>  	}
> @@ -200,7 +201,7 @@ __ftrace_make_nop(struct module *mod,
>  		return -EFAULT;
>  	}
>  
> -	if (op != ppc_inst(PPC_INST_LD_TOC)) {
> +	if (!ppc_inst_equal(op,  ppc_inst(PPC_INST_LD_TOC))) {
>  		pr_err("Expected %08x found %08x\n", PPC_INST_LD_TOC,
> ppc_inst_val(op));
>  		return -EINVAL;
>  	}
> @@ -497,7 +498,7 @@ expected_nop_sequence(void *ip, unsigned int op0,
> unsigned int op1)
>  	 * The load offset is different depending on the ABI. For simplicity
>  	 * just mask it out when doing the compare.
>  	 */
> -	if ((op0 != ppc_inst(0x48000008)) || (ppc_inst_val(op1) & 0xffff0000)
> != 0xe8410000)
> +	if ((!ppc_inst_equal(op0), ppc_inst(0x48000008)) || (ppc_inst_val(op1)
> & 0xffff0000) != 0xe8410000)
>  		return 0;
>  	return 1;
>  }
> @@ -506,7 +507,7 @@ static int
>  expected_nop_sequence(void *ip, unsigned int op0, unsigned int op1)
>  {
>  	/* look for patched "NOP" on ppc64 with -mprofile-kernel */
> -	if (op0 != ppc_inst(PPC_INST_NOP))
> +	if (!ppc_inst_equal(op0, ppc_inst(PPC_INST_NOP)))
>  		return 0;
>  	return 1;
>  }
> @@ -589,7 +590,7 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned long
> addr)
>  		return -EFAULT;
>  
>  	/* It should be pointing to a nop */
> -	if (op != ppc_inst(PPC_INST_NOP)) {
> +	if (!ppc_inst_equal(op,  ppc_inst(PPC_INST_NOP))) {
>  		pr_err("Expected NOP but have %x\n", op);
>  		return -EINVAL;
>  	}
> @@ -646,7 +647,7 @@ static int __ftrace_make_call_kernel(struct dyn_ftrace
> *rec, unsigned long addr)
>  		return -EFAULT;
>  	}
>  
> -	if (op != ppc_inst(PPC_INST_NOP)) {
> +	if (!ppc_inst_equal(op, ppc_inst(PPC_INST_NOP))) {
>  		pr_err("Unexpected call sequence at %p: %x\n", ip,
> ppc_inst_val(op));
>  		return -EINVAL;
>  	}
> diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-
> patching.c
> index 3f88d2a4400c..33654c6334a9 100644
> --- a/arch/powerpc/lib/code-patching.c
> +++ b/arch/powerpc/lib/code-patching.c
> @@ -478,7 +478,7 @@ static void __init test_branch_iform(void)
>  	/* Check flags are masked correctly */
>  	err = create_branch(&instr, &instr, addr, 0xFFFFFFFC);
>  	check(instr_is_branch_to_addr(&instr, addr));
> -	check(instr == ppc_inst(0x48000000));
> +	check(ppc_inst_equal(instr, ppc_inst(0x48000000)));
>  }
>  
>  static void __init test_create_function_call(void)
> @@ -563,7 +563,7 @@ static void __init test_branch_bform(void)
>  	/* Check flags are masked correctly */
>  	err = create_cond_branch(&instr, iptr, addr, 0xFFFFFFFC);
>  	check(instr_is_branch_to_addr(&instr, addr));
> -	check(instr == ppc_inst(0x43FF0000));
> +	check(ppc_inst_equal(instr, ppc_inst(0x43FF0000)));
>  }
>  
>  static void __init test_translate_branch(void)
> @@ -597,7 +597,7 @@ static void __init test_translate_branch(void)
>  	patch_instruction(q, instr);
>  	check(instr_is_branch_to_addr(p, addr));
>  	check(instr_is_branch_to_addr(q, addr));
> -	check(*q == ppc_inst(0x4a000000));
> +	check(ppc_inst_equal(*q, ppc_inst(0x4a000000)));
>  
>  	/* Maximum positive case, move x to x - 32 MB + 4 */
>  	p = buf + 0x2000000;
> @@ -608,7 +608,7 @@ static void __init test_translate_branch(void)
>  	patch_instruction(q, instr);
>  	check(instr_is_branch_to_addr(p, addr));
>  	check(instr_is_branch_to_addr(q, addr));
> -	check(*q == ppc_inst(0x49fffffc));
> +	check(ppc_inst_equal(*q, ppc_inst(0x49fffffc)));
>  
>  	/* Jump to x + 16 MB moved to x + 20 MB */
>  	p = buf;
> @@ -654,7 +654,7 @@ static void __init test_translate_branch(void)
>  	patch_instruction(q, instr);
>  	check(instr_is_branch_to_addr(p, addr));
>  	check(instr_is_branch_to_addr(q, addr));
> -	check(*q == ppc_inst(0x43ff8000));
> +	check(ppc_inst_equal(*q, ppc_inst(0x43ff8000)));
>  
>  	/* Maximum positive case, move x to x - 32 KB + 4 */
>  	p = buf + 0x8000;
> @@ -666,7 +666,7 @@ static void __init test_translate_branch(void)
>  	patch_instruction(q, instr);
>  	check(instr_is_branch_to_addr(p, addr));
>  	check(instr_is_branch_to_addr(q, addr));
> -	check(*q == ppc_inst(0x43ff7ffc));
> +	check(ppc_inst_equal(*q, ppc_inst(0x43ff7ffc)));
>  
>  	/* Jump to x + 12 KB moved to x + 20 KB */
>  	p = buf;
> diff --git a/arch/powerpc/lib/test_emulate_step.c
> b/arch/powerpc/lib/test_emulate_step.c
> index 60f7eb24d742..16387a9bfda0 100644
> --- a/arch/powerpc/lib/test_emulate_step.c
> +++ b/arch/powerpc/lib/test_emulate_step.c
> @@ -865,7 +865,7 @@ static int __init execute_compute_instr(struct pt_regs
> *regs,
>  	extern int exec_instr(struct pt_regs *regs);
>  	extern s32 patch__exec_instr;
>  
> -	if (!regs || !instr)
> +	if (!regs || !ppc_inst_val(instr))


This change should go in to below patch,

[PATCH v5 06/21] powerpc: Use an accessor for instructions

-- Bala


>  		return -EINVAL;
>  
>  	/* Patch the NOP with the actual instruction */
> diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
> index 3c1fb46bfacf..f6c87d3d53ea 100644
> --- a/arch/powerpc/xmon/xmon.c
> +++ b/arch/powerpc/xmon/xmon.c
> @@ -950,7 +950,7 @@ static void remove_bpts(void)
>  		if ((bp->enabled & (BP_TRAP|BP_CIABR)) != BP_TRAP)
>  			continue;
>  		if (mread(bp->address, &instr, 4) == 4
> -		    && instr == ppc_inst(bpinstr)
> +		    && ppc_inst_equal(instr, ppc_inst(bpinstr))
>  		    && patch_instruction(
>  			(unsigned int *)bp->address, bp->instr[0]) != 0)
>  			printf("Couldn't remove breakpoint at %lx\n",
> @@ -2860,7 +2860,7 @@ generic_inst_dump(unsigned long adr, long count, int
> praddr,
>  			break;
>  		}
>  		inst = ppc_inst(GETWORD(val));
> -		if (adr > first_adr && inst == last_inst) {
> +		if (adr > first_adr && ppc_inst_equal(inst, last_inst)) {
>  			if (!dotted) {
>  				printf(" ...\n");
>  				dotted = 1;

