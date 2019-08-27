Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6E49DD6E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 08:08:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HdjP0mSJzDqmf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 16:08:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="r7ud9xcF"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Hdgc6HKnzDqSr
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 16:07:07 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46HdgT70yPz9tyNV;
 Tue, 27 Aug 2019 08:07:01 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=r7ud9xcF; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id fcXh_w1O-45j; Tue, 27 Aug 2019 08:07:01 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46HdgT5zwsz9tyNT;
 Tue, 27 Aug 2019 08:07:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1566886021; bh=YXWuTQXLpY9m1wfSw8BJGeQbcK0zCTZkwSZzmzbM6Cc=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=r7ud9xcFmhSraMbnD6dG6sStwG4fuzs3FX60UHuDXk+QT6pWxAFQbjgZX1Q0ZnxiK
 jr5h9nErN1sVXyhUe9ISW5AkxvRnAz5zr1T/yD2bS/wvL5YPzr9dsYn4WPZczcF0is
 +EO9NUIUg3hVa43FCJrfe4/T9G7v4i3F7idF+Em4=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B4AFD8B793;
 Tue, 27 Aug 2019 08:07:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id RDi4S5MXj5Uq; Tue, 27 Aug 2019 08:07:02 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 795158B74C;
 Tue, 27 Aug 2019 08:07:02 +0200 (CEST)
Subject: Re: [PATCH 1/4] powerpc: convert to copy_thread_tls
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20190827033010.28090-1-npiggin@gmail.com>
 <20190827033010.28090-2-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <70171357-45e3-3fde-9713-d93b95cc1beb@c-s.fr>
Date: Tue, 27 Aug 2019 08:07:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190827033010.28090-2-npiggin@gmail.com>
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



Le 27/08/2019 à 05:30, Nicholas Piggin a écrit :
> Commit 3033f14ab78c3 ("clone: support passing tls argument via C rather
> than pt_regs magic") introduced the HAVE_COPY_THREAD_TLS option. Use it
> to avoid a subtle assumption about the argument ordering of clone type
> syscalls.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/Kconfig          | 1 +
>   arch/powerpc/kernel/process.c | 9 +++++----
>   2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index d8dcd8820369..7477a3263225 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -182,6 +182,7 @@ config PPC
>   	select HAVE_STACKPROTECTOR		if PPC64 && $(cc-option,-mstack-protector-guard=tls -mstack-protector-guard-reg=r13)
>   	select HAVE_STACKPROTECTOR		if PPC32 && $(cc-option,-mstack-protector-guard=tls -mstack-protector-guard-reg=r2)
>   	select HAVE_CONTEXT_TRACKING		if PPC64
> +	select HAVE_COPY_THREAD_TLS
>   	select HAVE_DEBUG_KMEMLEAK
>   	select HAVE_DEBUG_STACKOVERFLOW
>   	select HAVE_DYNAMIC_FTRACE
> diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
> index 8fc4de0d22b4..24621e7e5033 100644
> --- a/arch/powerpc/kernel/process.c
> +++ b/arch/powerpc/kernel/process.c
> @@ -1600,8 +1600,9 @@ static void setup_ksp_vsid(struct task_struct *p, unsigned long sp)
>   /*
>    * Copy architecture-specific thread state
>    */
> -int copy_thread(unsigned long clone_flags, unsigned long usp,
> -		unsigned long kthread_arg, struct task_struct *p)
> +int copy_thread_tls(unsigned long clone_flags, unsigned long usp,
> +		unsigned long kthread_arg, struct task_struct *p,
> +		unsigned long tls)
>   {
>   	struct pt_regs *childregs, *kregs;
>   	extern void ret_from_fork(void);
> @@ -1642,10 +1643,10 @@ int copy_thread(unsigned long clone_flags, unsigned long usp,
>   		if (clone_flags & CLONE_SETTLS) {
>   #ifdef CONFIG_PPC64

is_32bit_task() exists and always returns 1 on PPC32 so this gross ifdef 
in the middle of an if/else is pointless, it should be dropped.

>   			if (!is_32bit_task())
> -				childregs->gpr[13] = childregs->gpr[6];
> +				childregs->gpr[13] = tls;
>   			else
>   #endif
> -				childregs->gpr[2] = childregs->gpr[6];
> +				childregs->gpr[2] = tls;
>   		}
>   
>   		f = ret_from_fork;
> 

Christophe
