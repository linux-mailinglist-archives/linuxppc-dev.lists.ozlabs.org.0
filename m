Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A01CB26DCF5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 15:39:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BsdPP703WzDqgp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 23:39:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=rcardoso@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=U9BaAeej; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bsd5V74PrzDqNH
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Sep 2020 23:26:06 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08HDJhOu107007; Thu, 17 Sep 2020 09:25:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=6tiVtpObG1jc9y3j7QUgB4f6VYVXThdByx1D34/MMJY=;
 b=U9BaAeejVyKvhcV5+90Bb6UTcyBd9o404DS374TK8zcNdRhpmiR1bNWSachMFDv+6gA7
 TiZD/CVN0YSEuvQqQ2F/rLCpyPUWZk/AWUgu3dcVCfQwlVw3jTthQU5Sz7m4xOn+4HFP
 Wq1QEPy99VSV4tn6QWnpjXdrDe+1gnAnrV6kJbmBt9BcAFa1qziQE+GZhjCQxVJafmvE
 kQg/giTpv6zDinHRF2dmgwDzMQRS8sbn899bI/Vmzp5zLQBTbE/pt94XnIHo5qaWpKdk
 4lgqF5JyNDtjIVZQ2xNXYYJQt07bG9EuUI9QnSk3DulBLdqRaX1fcrdltkewYv2uE4+8 kA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33m8k2r52s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Sep 2020 09:25:58 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 08HDLAS5110180;
 Thu, 17 Sep 2020 09:25:57 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33m8k2r526-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Sep 2020 09:25:57 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08HDNEdC029011;
 Thu, 17 Sep 2020 13:25:57 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma01dal.us.ibm.com with ESMTP id 33k6591e0x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Sep 2020 13:25:57 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08HDPurx56623564
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Sep 2020 13:25:56 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 544E7AE060;
 Thu, 17 Sep 2020 13:25:56 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E4287AE05C;
 Thu, 17 Sep 2020 13:25:52 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.211.95.89])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 17 Sep 2020 13:25:52 +0000 (GMT)
Subject: Re: [PATCH v6 5/8] powerpc/watchpoint: Fix exception handling for
 CONFIG_HAVE_HW_BREAKPOINT=N
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, mpe@ellerman.id.au,
 christophe.leroy@c-s.fr
References: <20200902042945.129369-1-ravi.bangoria@linux.ibm.com>
 <20200902042945.129369-6-ravi.bangoria@linux.ibm.com>
From: Rogerio Alves <rcardoso@linux.ibm.com>
Message-ID: <7632bf52-3a0c-66d7-a236-7f896b1ce13e@linux.ibm.com>
Date: Thu, 17 Sep 2020 10:25:51 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200902042945.129369-6-ravi.bangoria@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-17_09:2020-09-16,
 2020-09-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009170098
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
Cc: mikey@neuling.org, jniethe5@gmail.com, pedromfc@linux.ibm.com,
 linux-kernel@vger.kernel.org, paulus@samba.org, rogealve@linux.ibm.com,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 9/2/20 1:29 AM, Ravi Bangoria wrote:
> On powerpc, ptrace watchpoint works in one-shot mode. i.e. kernel
> disables event every time it fires and user has to re-enable it.
> Also, in case of ptrace watchpoint, kernel notifies ptrace user
> before executing instruction.
> 
> With CONFIG_HAVE_HW_BREAKPOINT=N, kernel is missing to disable
> ptrace event and thus it's causing infinite loop of exceptions.
> This is especially harmful when user watches on a data which is
> also read/written by kernel, eg syscall parameters. In such case,
> infinite exceptions happens in kernel mode which causes soft-lockup.
> 
> Fixes: 9422de3e953d ("powerpc: Hardware breakpoints rewrite to handle non DABR breakpoint registers")
> Reported-by: Pedro Miraglia Franco de Carvalho <pedromfc@linux.ibm.com>
> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Tested-by: Rogerio Alves <rcardoso@linux.ibm.com>
> ---
>   arch/powerpc/include/asm/hw_breakpoint.h  |  3 ++
>   arch/powerpc/kernel/process.c             | 48 +++++++++++++++++++++++
>   arch/powerpc/kernel/ptrace/ptrace-noadv.c |  4 +-
>   3 files changed, 54 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/include/asm/hw_breakpoint.h b/arch/powerpc/include/asm/hw_breakpoint.h
> index 81872c420476..abebfbee5b1c 100644
> --- a/arch/powerpc/include/asm/hw_breakpoint.h
> +++ b/arch/powerpc/include/asm/hw_breakpoint.h
> @@ -18,6 +18,7 @@ struct arch_hw_breakpoint {
>   	u16		type;
>   	u16		len; /* length of the target data symbol */
>   	u16		hw_len; /* length programmed in hw */
> +	u8		flags;
>   };
>   
>   /* Note: Don't change the first 6 bits below as they are in the same order
> @@ -37,6 +38,8 @@ struct arch_hw_breakpoint {
>   #define HW_BRK_TYPE_PRIV_ALL	(HW_BRK_TYPE_USER | HW_BRK_TYPE_KERNEL | \
>   				 HW_BRK_TYPE_HYP)
>   
> +#define HW_BRK_FLAG_DISABLED	0x1
> +
>   /* Minimum granularity */
>   #ifdef CONFIG_PPC_8xx
>   #define HW_BREAKPOINT_SIZE  0x4
> diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
> index 016bd831908e..160fbbf41d40 100644
> --- a/arch/powerpc/kernel/process.c
> +++ b/arch/powerpc/kernel/process.c
> @@ -636,6 +636,44 @@ void do_send_trap(struct pt_regs *regs, unsigned long address,
>   				    (void __user *)address);
>   }
>   #else	/* !CONFIG_PPC_ADV_DEBUG_REGS */
> +
> +static void do_break_handler(struct pt_regs *regs)
> +{
> +	struct arch_hw_breakpoint null_brk = {0};
> +	struct arch_hw_breakpoint *info;
> +	struct ppc_inst instr = ppc_inst(0);
> +	int type = 0;
> +	int size = 0;
> +	unsigned long ea;
> +	int i;
> +
> +	/*
> +	 * If underneath hw supports only one watchpoint, we know it
> +	 * caused exception. 8xx also falls into this category.
> +	 */
> +	if (nr_wp_slots() == 1) {
> +		__set_breakpoint(0, &null_brk);
> +		current->thread.hw_brk[0] = null_brk;
> +		current->thread.hw_brk[0].flags |= HW_BRK_FLAG_DISABLED;
> +		return;
> +	}
> +
> +	/* Otherwise findout which DAWR caused exception and disable it. */
> +	wp_get_instr_detail(regs, &instr, &type, &size, &ea);
> +
> +	for (i = 0; i < nr_wp_slots(); i++) {
> +		info = &current->thread.hw_brk[i];
> +		if (!info->address)
> +			continue;
> +
> +		if (wp_check_constraints(regs, instr, ea, type, size, info)) {
> +			__set_breakpoint(i, &null_brk);
> +			current->thread.hw_brk[i] = null_brk;
> +			current->thread.hw_brk[i].flags |= HW_BRK_FLAG_DISABLED;
> +		}
> +	}
> +}
> +
>   void do_break (struct pt_regs *regs, unsigned long address,
>   		    unsigned long error_code)
>   {
> @@ -647,6 +685,16 @@ void do_break (struct pt_regs *regs, unsigned long address,
>   	if (debugger_break_match(regs))
>   		return;
>   
> +	/*
> +	 * We reach here only when watchpoint exception is generated by ptrace
> +	 * event (or hw is buggy!). Now if CONFIG_HAVE_HW_BREAKPOINT is set,
> +	 * watchpoint is already handled by hw_breakpoint_handler() so we don't
> +	 * have to do anything. But when CONFIG_HAVE_HW_BREAKPOINT is not set,
> +	 * we need to manually handle the watchpoint here.
> +	 */
> +	if (!IS_ENABLED(CONFIG_HAVE_HW_BREAKPOINT))
> +		do_break_handler(regs);
> +
>   	/* Deliver the signal to userspace */
>   	force_sig_fault(SIGTRAP, TRAP_HWBKPT, (void __user *)address);
>   }
> diff --git a/arch/powerpc/kernel/ptrace/ptrace-noadv.c b/arch/powerpc/kernel/ptrace/ptrace-noadv.c
> index 57a0ab822334..c9122ed91340 100644
> --- a/arch/powerpc/kernel/ptrace/ptrace-noadv.c
> +++ b/arch/powerpc/kernel/ptrace/ptrace-noadv.c
> @@ -286,11 +286,13 @@ long ppc_del_hwdebug(struct task_struct *child, long data)
>   	}
>   	return ret;
>   #else /* CONFIG_HAVE_HW_BREAKPOINT */
> -	if (child->thread.hw_brk[data - 1].address == 0)
> +	if (!(child->thread.hw_brk[data - 1].flags & HW_BRK_FLAG_DISABLED) &&
> +	    child->thread.hw_brk[data - 1].address == 0)
>   		return -ENOENT;
>   
>   	child->thread.hw_brk[data - 1].address = 0;
>   	child->thread.hw_brk[data - 1].type = 0;
> +	child->thread.hw_brk[data - 1].flags = 0;
>   #endif /* CONFIG_HAVE_HW_BREAKPOINT */
>   
>   	return 0;
> 
