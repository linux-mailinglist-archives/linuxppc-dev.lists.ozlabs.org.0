Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4542906DF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Oct 2020 16:12:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CCSlk3r0lzDqnk
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Oct 2020 01:12:34 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CCSfD06fzzDqQF
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Oct 2020 01:07:47 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CCSf61x3dz9vCyG;
 Fri, 16 Oct 2020 16:07:42 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 8zCHNsA4_7By; Fri, 16 Oct 2020 16:07:42 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CCSf60RPdz9vCyD;
 Fri, 16 Oct 2020 16:07:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 41C5C8B84F;
 Fri, 16 Oct 2020 16:07:43 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id uMzlrgJg_x-s; Fri, 16 Oct 2020 16:07:43 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6F7108B83E;
 Fri, 16 Oct 2020 16:07:42 +0200 (CEST)
Subject: Re: [PATCH 8/8] powerpc/signal64: Rewrite rt_sigreturn() to minimise
 uaccess switches
To: linuxppc-dev@lists.ozlabs.org, "Christopher M. Riedl" <cmr@codefail.de>
References: <20201015150159.28933-1-cmr@codefail.de>
 <20201015150159.28933-9-cmr@codefail.de>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <bdc30b81-65bd-1cc0-b31a-61300e8c010a@csgroup.eu>
Date: Fri, 16 Oct 2020 16:07:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201015150159.28933-9-cmr@codefail.de>
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



Le 15/10/2020 à 17:01, Christopher M. Riedl a écrit :
> From: Daniel Axtens <dja@axtens.net>
> 
> Add uaccess blocks and use the 'unsafe' versions of functions doing user
> access where possible to reduce the number of times uaccess has to be
> opened/closed.
> 
> Signed-off-by: Daniel Axtens <dja@axtens.net>
> Signed-off-by: Christopher M. Riedl <cmr@codefail.de>
> ---
>   arch/powerpc/kernel/signal_64.c | 23 +++++++++++++++--------
>   1 file changed, 15 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signal_64.c
> index 3b97e3681a8f..0f4ff7a5bfc1 100644
> --- a/arch/powerpc/kernel/signal_64.c
> +++ b/arch/powerpc/kernel/signal_64.c
> @@ -779,18 +779,22 @@ SYSCALL_DEFINE0(rt_sigreturn)
>   	 */
>   	regs->msr &= ~MSR_TS_MASK;
>   
> -	if (__get_user(msr, &uc->uc_mcontext.gp_regs[PT_MSR]))
> +	if (!user_read_access_begin(uc, sizeof(*uc)))
>   		goto badframe;
> +
> +	unsafe_get_user(msr, &uc->uc_mcontext.gp_regs[PT_MSR], badframe_block);
> +
>   	if (MSR_TM_ACTIVE(msr)) {
>   		/* We recheckpoint on return. */
>   		struct ucontext __user *uc_transact;
>   
>   		/* Trying to start TM on non TM system */
>   		if (!cpu_has_feature(CPU_FTR_TM))
> -			goto badframe;
> +			goto badframe_block;
> +
> +		unsafe_get_user(uc_transact, &uc->uc_link, badframe_block);
> +		user_read_access_end();

user_access_end() only in the if branch ?

>   
> -		if (__get_user(uc_transact, &uc->uc_link))
> -			goto badframe;
>   		if (restore_tm_sigcontexts(current, &uc->uc_mcontext,
>   					   &uc_transact->uc_mcontext))
>   			goto badframe;
> @@ -810,12 +814,13 @@ SYSCALL_DEFINE0(rt_sigreturn)
>   		 * causing a TM bad thing.
>   		 */
>   		current->thread.regs->msr &= ~MSR_TS_MASK;
> +
> +#ifndef CONFIG_PPC_TRANSACTIONAL_MEM
>   		if (!user_read_access_begin(uc, sizeof(*uc)))

The matching user_read_access_end() is not in the same #ifndef ? That's dirty and hard to follow. 
Can you re-organise the code to avoid all those nesting ?

> -			return -EFAULT;
> -		if (__unsafe_restore_sigcontext(current, NULL, 1, &uc->uc_mcontext)) {
> -			user_read_access_end();
>   			goto badframe;
> -		}
> +#endif
> +		unsafe_restore_sigcontext(current, NULL, 1, &uc->uc_mcontext,
> +					  badframe_block);
>   		user_read_access_end();
>   	}
>   
> @@ -825,6 +830,8 @@ SYSCALL_DEFINE0(rt_sigreturn)
>   	set_thread_flag(TIF_RESTOREALL);
>   	return 0;
>   
> +badframe_block:
> +	user_read_access_end();
>   badframe:
>   	signal_fault(current, regs, "rt_sigreturn", uc);
>   
> 

Christophe
