Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B28187E35
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 11:23:22 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hTlX1zwKzDqZj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 21:23:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=r6bHxF/W; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hTjk2ppxzDqN6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 21:21:46 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48hTjd3RN6z9txwD;
 Tue, 17 Mar 2020 11:21:41 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=r6bHxF/W; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id cInAQWt2ad5N; Tue, 17 Mar 2020 11:21:41 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48hTjd1pTxz9txwB;
 Tue, 17 Mar 2020 11:21:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1584440501; bh=2jUrj5how/qIcyswp/jsSc5DSLSCzuAiitNOs6nA2cc=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=r6bHxF/W0/FF1Dz1JnGGy2CRjaCrjSbwvrzxpo/yqh0HbCE3afQQ6SqwJHhqDtCs7
 1WWyS4J32GDu4yy19Ty8FCuPdb17vOPJGrLYfrtVDf9o3gX9dcZmQ+iorS/Jo26bTj
 zks+SH9FZMuTdbxPr2tlkCXn1fJGut0ithXZMwT4=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 34F3D8B7B7;
 Tue, 17 Mar 2020 11:21:42 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 18C91U-Lml5b; Tue, 17 Mar 2020 11:21:42 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 710748B785;
 Tue, 17 Mar 2020 11:21:40 +0100 (CET)
Subject: Re: [PATCH 03/15] powerpc/watchpoint: Introduce function to get nr
 watchpoints dynamically
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, mpe@ellerman.id.au,
 mikey@neuling.org
References: <20200309085806.155823-1-ravi.bangoria@linux.ibm.com>
 <20200309085806.155823-4-ravi.bangoria@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <53b8bf54-200f-6f37-5870-e641b35f373c@c-s.fr>
Date: Tue, 17 Mar 2020 11:21:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200309085806.155823-4-ravi.bangoria@linux.ibm.com>
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
Cc: apopple@linux.ibm.com, peterz@infradead.org, fweisbec@gmail.com,
 oleg@redhat.com, npiggin@gmail.com, linux-kernel@vger.kernel.org,
 paulus@samba.org, jolsa@kernel.org, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, mingo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 09/03/2020 à 09:57, Ravi Bangoria a écrit :
> So far we had only one watchpoint, so we have hardcoded HBP_NUM to 1.
> But future Power architecture is introducing 2nd DAWR and thus kernel
> should be able to dynamically find actual number of watchpoints
> supported by hw it's running on. Introduce function for the same.
> Also convert HBP_NUM macro to HBP_NUM_MAX, which will now represent
> maximum number of watchpoints supported by Powerpc.
> 
> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
> ---
>   arch/powerpc/include/asm/cputable.h      | 6 +++++-
>   arch/powerpc/include/asm/hw_breakpoint.h | 2 ++
>   arch/powerpc/include/asm/processor.h     | 2 +-
>   arch/powerpc/kernel/hw_breakpoint.c      | 2 +-
>   arch/powerpc/kernel/process.c            | 6 ++++++
>   5 files changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/cputable.h b/arch/powerpc/include/asm/cputable.h
> index 40a4d3c6fd99..c67b94f3334c 100644
> --- a/arch/powerpc/include/asm/cputable.h
> +++ b/arch/powerpc/include/asm/cputable.h
> @@ -614,7 +614,11 @@ enum {
>   };
>   #endif /* __powerpc64__ */
>   
> -#define HBP_NUM 1
> +/*
> + * Maximum number of hw breakpoint supported on powerpc. Number of
> + * breakpoints supported by actual hw might be less than this.
> + */
> +#define HBP_NUM_MAX	1
>   
>   #endif /* !__ASSEMBLY__ */
>   
> diff --git a/arch/powerpc/include/asm/hw_breakpoint.h b/arch/powerpc/include/asm/hw_breakpoint.h
> index f2f8d8aa8e3b..741c4f7573c4 100644
> --- a/arch/powerpc/include/asm/hw_breakpoint.h
> +++ b/arch/powerpc/include/asm/hw_breakpoint.h
> @@ -43,6 +43,8 @@ struct arch_hw_breakpoint {
>   #define DABR_MAX_LEN	8
>   #define DAWR_MAX_LEN	512
>   
> +extern int nr_wp_slots(void);

'extern' keyword is unneeded and irrelevant here. Please remove it. Even 
checkpatch is unhappy 
(https://openpower.xyz/job/snowpatch/job/snowpatch-linux-checkpatch/12172//artifact/linux/checkpatch.log)


> +
>   #ifdef CONFIG_HAVE_HW_BREAKPOINT
>   #include <linux/kdebug.h>
>   #include <asm/reg.h>
> diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
> index 8387698bd5b6..666b2825278c 100644
> --- a/arch/powerpc/include/asm/processor.h
> +++ b/arch/powerpc/include/asm/processor.h
> @@ -176,7 +176,7 @@ struct thread_struct {
>   	int		fpexc_mode;	/* floating-point exception mode */
>   	unsigned int	align_ctl;	/* alignment handling control */
>   #ifdef CONFIG_HAVE_HW_BREAKPOINT
> -	struct perf_event *ptrace_bps[HBP_NUM];
> +	struct perf_event *ptrace_bps[HBP_NUM_MAX];
>   	/*
>   	 * Helps identify source of single-step exception and subsequent
>   	 * hw-breakpoint enablement
> diff --git a/arch/powerpc/kernel/hw_breakpoint.c b/arch/powerpc/kernel/hw_breakpoint.c
> index d0854320bb50..e68798cee3fa 100644
> --- a/arch/powerpc/kernel/hw_breakpoint.c
> +++ b/arch/powerpc/kernel/hw_breakpoint.c
> @@ -38,7 +38,7 @@ static DEFINE_PER_CPU(struct perf_event *, bp_per_reg);
>   int hw_breakpoint_slots(int type)
>   {
>   	if (type == TYPE_DATA)
> -		return HBP_NUM;
> +		return nr_wp_slots();
>   	return 0;		/* no instruction breakpoints available */
>   }
>   
> diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
> index 110db94cdf3c..6d4b029532e2 100644
> --- a/arch/powerpc/kernel/process.c
> +++ b/arch/powerpc/kernel/process.c
> @@ -835,6 +835,12 @@ static inline bool hw_brk_match(struct arch_hw_breakpoint *a,
>   	return true;
>   }
>   
> +/* Returns total number of data breakpoints available. */
> +int nr_wp_slots(void)
> +{
> +	return HBP_NUM_MAX;
> +}
> +

This is not worth a global function. At least it should be a static 
function located in hw_breakpoint.c. But it would be even better to have 
it as a static inline in asm/hw_breakpoint.h

Christophe
