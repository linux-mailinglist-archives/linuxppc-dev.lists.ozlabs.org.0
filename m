Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 339BC2C4187
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 14:58:36 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ch2Y475ntzDqTD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 00:58:32 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ch2Jb2WqTzDqcl
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Nov 2020 00:47:43 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Ch2JT626hzB09ZG;
 Wed, 25 Nov 2020 14:47:37 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id jrDWozkb9qD9; Wed, 25 Nov 2020 14:47:37 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Ch2JT50JnzB09ZC;
 Wed, 25 Nov 2020 14:47:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E490A8B7DA;
 Wed, 25 Nov 2020 14:47:38 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id JVCbCgYGzkwW; Wed, 25 Nov 2020 14:47:38 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 251858B7D3;
 Wed, 25 Nov 2020 14:47:38 +0100 (CET)
Subject: Re: [PATCH v6 09/22] powerpc/exec: Set thread.regs early during exec
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
References: <20201125051634.509286-1-aneesh.kumar@linux.ibm.com>
 <20201125051634.509286-10-aneesh.kumar@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <f5960226-f451-41ed-2992-bbe0acf9d190@csgroup.eu>
Date: Wed, 25 Nov 2020 14:47:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201125051634.509286-10-aneesh.kumar@linux.ibm.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 25/11/2020 à 06:16, Aneesh Kumar K.V a écrit :
> In later patches during exec, we would like to access default regs.amr to
> control access to the user mapping. Having thread.regs set early makes the
> code changes simpler.
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>   arch/powerpc/include/asm/thread_info.h |  2 --
>   arch/powerpc/kernel/process.c          | 37 +++++++++++++++++---------
>   2 files changed, 25 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/thread_info.h b/arch/powerpc/include/asm/thread_info.h
> index 46a210b03d2b..de4c911d9ced 100644
> --- a/arch/powerpc/include/asm/thread_info.h
> +++ b/arch/powerpc/include/asm/thread_info.h
> @@ -77,10 +77,8 @@ struct thread_info {
>   /* how to get the thread information struct from C */
>   extern int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src);
>   
> -#ifdef CONFIG_PPC_BOOK3S_64
>   void arch_setup_new_exec(void);
>   #define arch_setup_new_exec arch_setup_new_exec
> -#endif
>   
>   #endif /* __ASSEMBLY__ */
>   
> diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
> index d421a2c7f822..b6b8a845e454 100644
> --- a/arch/powerpc/kernel/process.c
> +++ b/arch/powerpc/kernel/process.c
> @@ -1530,10 +1530,32 @@ void flush_thread(void)
>   #ifdef CONFIG_PPC_BOOK3S_64
>   void arch_setup_new_exec(void)
>   {
> -	if (radix_enabled())
> -		return;
> -	hash__setup_new_exec();
> +	if (!radix_enabled())
> +		hash__setup_new_exec();
> +
> +	/*
> +	 * If we exec out of a kernel thread then thread.regs will not be
> +	 * set.  Do it now.
> +	 */
> +	if (!current->thread.regs) {
> +		struct pt_regs *regs = task_stack_page(current) + THREAD_SIZE;
> +		current->thread.regs = regs - 1;
> +	}
> +
> +}
> +#else
> +void arch_setup_new_exec(void)
> +{
> +	/*
> +	 * If we exec out of a kernel thread then thread.regs will not be
> +	 * set.  Do it now.
> +	 */
> +	if (!current->thread.regs) {
> +		struct pt_regs *regs = task_stack_page(current) + THREAD_SIZE;
> +		current->thread.regs = regs - 1;
> +	}
>   }
> +
>   #endif

No need to duplicate arch_setup_new_exec() I think. radix_enabled() is defined at all time so the 
first function should be valid at all time.

>   
>   #ifdef CONFIG_PPC64
> @@ -1765,15 +1787,6 @@ void start_thread(struct pt_regs *regs, unsigned long start, unsigned long sp)
>   		preload_new_slb_context(start, sp);
>   #endif
>   
> -	/*
> -	 * If we exec out of a kernel thread then thread.regs will not be
> -	 * set.  Do it now.
> -	 */
> -	if (!current->thread.regs) {
> -		struct pt_regs *regs = task_stack_page(current) + THREAD_SIZE;
> -		current->thread.regs = regs - 1;
> -	}
> -
>   #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
>   	/*
>   	 * Clear any transactional state, we're exec()ing. The cause is
> 
