Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D7A6415D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2019 08:29:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45k8RX5NpMzDqKg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2019 16:29:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="iMEF+SDR"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45k8PT2mlMzDqGt
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jul 2019 16:27:40 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45k8PL3n6LzB09ZJ;
 Wed, 10 Jul 2019 08:27:34 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=iMEF+SDR; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id kZJ0oZwqf6QV; Wed, 10 Jul 2019 08:27:34 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45k8PL2KCZzB09ZH;
 Wed, 10 Jul 2019 08:27:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1562740054; bh=5TKgHRk+ZhXPsN436WT7n5/+4+4dtwAsOBIgxcM04Oc=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=iMEF+SDR/JTZbuCdrjKLQHwP439R9Zt2pXbklgTaNevchf62aJgEuqher1yOA20gs
 epxjVHwTlhR+2ViWSCvd8Cq3G56ke4RYjALs7SuFgGMBFTLaHhhgLHQ7ZwaRzln6vx
 vobsQHfXQ5reY/sFqyE+G7DFj8yFLGd1HYrwySYE=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3DEA58B7F2;
 Wed, 10 Jul 2019 08:27:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 1kiCeoAIjYgE; Wed, 10 Jul 2019 08:27:35 +0200 (CEST)
Received: from [172.25.230.101] (po15451.idsi0.si.c-s.fr [172.25.230.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9DF2D8B7EE;
 Wed, 10 Jul 2019 08:27:34 +0200 (CEST)
Subject: Re: [PATCH v3 2/3] Powerpc64/Watchpoint: Don't ignore extraneous
 exceptions
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, mpe@ellerman.id.au,
 mikey@neuling.org
References: <20190710045445.31037-1-ravi.bangoria@linux.ibm.com>
 <20190710045445.31037-3-ravi.bangoria@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <1f3fd425-3d2f-8d18-eff1-01ca5b605ba0@c-s.fr>
Date: Wed, 10 Jul 2019 08:27:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190710045445.31037-3-ravi.bangoria@linux.ibm.com>
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
Cc: linux-kernel@vger.kernel.org, npiggin@gmail.com, paulus@samba.org,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 10/07/2019 à 06:54, Ravi Bangoria a écrit :
> On Powerpc64, watchpoint match range is double-word granular. On
> a watchpoint hit, DAR is set to the first byte of overlap between
> actual access and watched range. And thus it's quite possible that
> DAR does not point inside user specified range. Ex, say user creates
> a watchpoint with address range 0x1004 to 0x1007. So hw would be
> configured to watch from 0x1000 to 0x1007. If there is a 4 byte
> access from 0x1002 to 0x1005, DAR will point to 0x1002 and thus
> interrupt handler considers it as extraneous, but it's actually not,
> because part of the access belongs to what user has asked. So, let
> kernel pass it on to user and let user decide what to do with it
> instead of silently ignoring it. The drawback is, it can generate
> false positive events.

Why adding some #ifdefs based on CONFIG_8xx ?

I see your commit log mentions 'Powerpc64'. What about BOOK3S/32 ?

Christophe

> 
> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
> ---
>   arch/powerpc/kernel/hw_breakpoint.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/hw_breakpoint.c b/arch/powerpc/kernel/hw_breakpoint.c
> index 5c876e986c18..c457d52778e3 100644
> --- a/arch/powerpc/kernel/hw_breakpoint.c
> +++ b/arch/powerpc/kernel/hw_breakpoint.c
> @@ -204,9 +204,10 @@ int hw_breakpoint_handler(struct die_args *args)
>   #ifndef CONFIG_PPC_8xx
>   	int stepped = 1;
>   	unsigned int instr;
> +#else
> +	unsigned long dar = regs->dar;
>   #endif
>   	struct arch_hw_breakpoint *info;
> -	unsigned long dar = regs->dar;
>   
>   	/* Disable breakpoints during exception handling */
>   	hw_breakpoint_disable();
> @@ -240,14 +241,14 @@ int hw_breakpoint_handler(struct die_args *args)
>   
>   	/*
>   	 * Verify if dar lies within the address range occupied by the symbol
> -	 * being watched to filter extraneous exceptions.  If it doesn't,
> -	 * we still need to single-step the instruction, but we don't
> -	 * generate an event.
> +	 * being watched to filter extraneous exceptions.
>   	 */
>   	info->type &= ~HW_BRK_TYPE_EXTRANEOUS_IRQ;
> +#ifdef CONFIG_PPC_8xx
>   	if (!((bp->attr.bp_addr <= dar) &&
>   	      (dar - bp->attr.bp_addr < bp->attr.bp_len)))
>   		info->type |= HW_BRK_TYPE_EXTRANEOUS_IRQ;
> +#endif
>   
>   #ifndef CONFIG_PPC_8xx
>   	/* Do not emulate user-space instructions, instead single-step them */
> 
