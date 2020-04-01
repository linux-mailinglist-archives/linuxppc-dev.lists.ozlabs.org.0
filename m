Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 867B019A5AC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 08:52:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48scMb0xbxzDqtp
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 17:52:43 +1100 (AEDT)
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
 header.s=mail header.b=VMgRxmrr; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sbrW3k92zDr7G
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Apr 2020 17:29:15 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48sbrQ6k0Pz9v4Wc;
 Wed,  1 Apr 2020 08:29:10 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=VMgRxmrr; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id IUeepUrka4z9; Wed,  1 Apr 2020 08:29:10 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48sbrQ5Hxbz9v4Wb;
 Wed,  1 Apr 2020 08:29:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1585722550; bh=tmOjSOx33NjOvLhEuMissXLJmAtblDDLNTgncKDEn0I=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=VMgRxmrrGaIV45JDyoXsQm7d4lnQt8Hadf7g66OqtApuIVNnOQK0+lJXm27wxdshF
 aZd+gNoPuUK0vGCGtXyyvP7ZlD6Ox/8oQZfcyz1tRnIpm5r48cOOlQBDQA/1WIbBgc
 lETdFpwIriDOoOdbr4wNbtHWM9RUWINYd/Vcck6w=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8DF6C8B7B3;
 Wed,  1 Apr 2020 08:29:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id DSGSukzGn8Gp; Wed,  1 Apr 2020 08:29:11 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 18D5F8B778;
 Wed,  1 Apr 2020 08:29:09 +0200 (CEST)
Subject: Re: [PATCH v2 03/16] powerpc/watchpoint: Introduce function to get nr
 watchpoints dynamically
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, mpe@ellerman.id.au,
 mikey@neuling.org
References: <20200401061309.92442-1-ravi.bangoria@linux.ibm.com>
 <20200401061309.92442-4-ravi.bangoria@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <7851b702-8a93-11a8-6553-e0a51967dfc0@c-s.fr>
Date: Wed, 1 Apr 2020 08:29:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200401061309.92442-4-ravi.bangoria@linux.ibm.com>
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



Le 01/04/2020 à 08:12, Ravi Bangoria a écrit :
> So far we had only one watchpoint, so we have hardcoded HBP_NUM to 1.
> But future Power architecture is introducing 2nd DAWR and thus kernel
> should be able to dynamically find actual number of watchpoints
> supported by hw it's running on. Introduce function for the same.
> Also convert HBP_NUM macro to HBP_NUM_MAX, which will now represent
> maximum number of watchpoints supported by Powerpc.


Everywhere else in the code, it is called 'breakpoint', not 'watchpoint'.

Wouldn't it be more consistent to call the function nr_bp_slots() 
instead of nr_wp_slots() ?

Especially as we are likely going to extend your changes to support 
DABR2 in addition to DABR on BOOK3S/32.

Christophe

> 
> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
> ---
>   arch/powerpc/include/asm/cputable.h      | 6 +++++-
>   arch/powerpc/include/asm/hw_breakpoint.h | 5 +++++
>   arch/powerpc/include/asm/processor.h     | 2 +-
>   arch/powerpc/kernel/hw_breakpoint.c      | 2 +-
>   4 files changed, 12 insertions(+), 3 deletions(-)
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
> index f2f8d8aa8e3b..518b41eef924 100644
> --- a/arch/powerpc/include/asm/hw_breakpoint.h
> +++ b/arch/powerpc/include/asm/hw_breakpoint.h
> @@ -43,6 +43,11 @@ struct arch_hw_breakpoint {
>   #define DABR_MAX_LEN	8
>   #define DAWR_MAX_LEN	512
>   
> +static inline int nr_wp_slots(void)
> +{
> +	return HBP_NUM_MAX;
> +}
> +
>   #ifdef CONFIG_HAVE_HW_BREAKPOINT
>   #include <linux/kdebug.h>
>   #include <asm/reg.h>
> diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
> index eedcbfb9a6ff..90f6dbc7ff00 100644
> --- a/arch/powerpc/include/asm/processor.h
> +++ b/arch/powerpc/include/asm/processor.h
> @@ -180,7 +180,7 @@ struct thread_struct {
>   	int		fpexc_mode;	/* floating-point exception mode */
>   	unsigned int	align_ctl;	/* alignment handling control */
>   #ifdef CONFIG_HAVE_HW_BREAKPOINT
> -	struct perf_event *ptrace_bps[HBP_NUM];
> +	struct perf_event *ptrace_bps[HBP_NUM_MAX];
>   	/*
>   	 * Helps identify source of single-step exception and subsequent
>   	 * hw-breakpoint enablement
> diff --git a/arch/powerpc/kernel/hw_breakpoint.c b/arch/powerpc/kernel/hw_breakpoint.c
> index 72f461bd70fb..4120349e2abe 100644
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
> 
