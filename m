Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFBD27BD51
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Sep 2020 08:48:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C0qj81SPPzDqXG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Sep 2020 16:48:28 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C0qgW4m7czDqVT
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Sep 2020 16:46:59 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4C0qgL07GPz9v2YG;
 Tue, 29 Sep 2020 08:46:54 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id YsPWlUzYnt5O; Tue, 29 Sep 2020 08:46:53 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4C0qgK6FBJz9v2FG;
 Tue, 29 Sep 2020 08:46:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 00BBF8B79F;
 Tue, 29 Sep 2020 08:46:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id TOrtpa9nxSz3; Tue, 29 Sep 2020 08:46:54 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id ECC3B8B76C;
 Tue, 29 Sep 2020 08:46:53 +0200 (CEST)
Subject: Re: [PATCH v2 1/7] powerpc: Remove SYNC on non 6xx
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
References: <27951fa6c9a8f80724d1bc81a6117ac32343a55d.1601359702.git.christophe.leroy@csgroup.eu>
Message-ID: <a5f3a957-f9e0-4bf6-1d4a-41ccfa173366@csgroup.eu>
Date: Tue, 29 Sep 2020 08:46:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <27951fa6c9a8f80724d1bc81a6117ac32343a55d.1601359702.git.christophe.leroy@csgroup.eu>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 29/09/2020 à 08:09, Christophe Leroy a écrit :
> SYNC is usefull for Powerpc 601 only. On everything else,
> SYNC is empty.
> 
> Remove it from code that is not made to run on 6xx.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Oops, the last patch of the series is missing. Will resend, sorry for the noise.

Christophe

> ---
>   arch/powerpc/kernel/head_40x.S   | 1 -
>   arch/powerpc/kernel/head_booke.h | 1 -
>   arch/powerpc/kernel/misc_64.S    | 1 -
>   3 files changed, 3 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/head_40x.S b/arch/powerpc/kernel/head_40x.S
> index 5b282d9965a5..44c9018aed1b 100644
> --- a/arch/powerpc/kernel/head_40x.S
> +++ b/arch/powerpc/kernel/head_40x.S
> @@ -72,7 +72,6 @@ turn_on_mmu:
>   	lis	r0,start_here@h
>   	ori	r0,r0,start_here@l
>   	mtspr	SPRN_SRR0,r0
> -	SYNC
>   	rfi				/* enables MMU */
>   	b	.			/* prevent prefetch past rfi */
>   
> diff --git a/arch/powerpc/kernel/head_booke.h b/arch/powerpc/kernel/head_booke.h
> index 18f87bf9e32b..71c359d438b5 100644
> --- a/arch/powerpc/kernel/head_booke.h
> +++ b/arch/powerpc/kernel/head_booke.h
> @@ -176,7 +176,6 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
>   #endif
>   	mtspr	SPRN_SRR1,r10
>   	mtspr	SPRN_SRR0,r11
> -	SYNC
>   	RFI				/* jump to handler, enable MMU */
>   99:	b	ret_from_kernel_syscall
>   .endm
> diff --git a/arch/powerpc/kernel/misc_64.S b/arch/powerpc/kernel/misc_64.S
> index 7bb46ad98207..070465825c21 100644
> --- a/arch/powerpc/kernel/misc_64.S
> +++ b/arch/powerpc/kernel/misc_64.S
> @@ -365,7 +365,6 @@ _GLOBAL(kexec_smp_wait)
>   
>   	li	r4,KEXEC_STATE_REAL_MODE
>   	stb	r4,PACAKEXECSTATE(r13)
> -	SYNC
>   
>   	b	kexec_wait
>   
> 
