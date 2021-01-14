Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9163E2F62D5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jan 2021 15:14:44 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DGmXd5KbqzDsf8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 01:14:41 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DGmV94K6szDsd6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 01:12:25 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DGmTw0sCmz9txf3;
 Thu, 14 Jan 2021 15:12:20 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id lPv3X_f-NIRU; Thu, 14 Jan 2021 15:12:20 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DGmTv6LYHz9v2DR;
 Thu, 14 Jan 2021 15:12:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 657DC8B808;
 Thu, 14 Jan 2021 15:12:21 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id iLMhUMCUUSmg; Thu, 14 Jan 2021 15:12:21 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CF3A48B807;
 Thu, 14 Jan 2021 15:12:20 +0100 (CET)
Subject: Re: [PATCH v5 03/21] powerpc: remove arguments from fault handler
 functions
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20210113073215.516986-1-npiggin@gmail.com>
 <20210113073215.516986-4-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <29e0e34e-43a6-6dac-6428-5f982a76c3ce@csgroup.eu>
Date: Thu, 14 Jan 2021 15:12:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210113073215.516986-4-npiggin@gmail.com>
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



Le 13/01/2021 à 08:31, Nicholas Piggin a écrit :
> Make mm fault handlers all just take the pt_regs * argument and load
> DAR/DSISR from that. Make those that return a value return long.
> 
> This is done to make the function signatures match other handlers, which
> will help with a future patch to add wrappers. Explicit arguments could
> be added for performance but that would require more wrapper macro
> variants.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/include/asm/asm-prototypes.h     |  4 ++--
>   arch/powerpc/include/asm/book3s/64/mmu-hash.h |  2 +-
>   arch/powerpc/include/asm/bug.h                |  2 +-
>   arch/powerpc/kernel/entry_32.S                |  6 +-----
>   arch/powerpc/kernel/exceptions-64e.S          |  2 --
>   arch/powerpc/kernel/exceptions-64s.S          | 14 ++------------
>   arch/powerpc/kernel/head_40x.S                | 10 +++++-----
>   arch/powerpc/kernel/head_8xx.S                |  6 +++---
>   arch/powerpc/kernel/head_book3s_32.S          |  5 ++---
>   arch/powerpc/kernel/head_booke.h              |  4 +---
>   arch/powerpc/mm/book3s64/hash_utils.c         |  8 +++++---
>   arch/powerpc/mm/book3s64/slb.c                | 11 +++++++----
>   arch/powerpc/mm/fault.c                       |  7 ++++---
>   13 files changed, 34 insertions(+), 47 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
> index 238eacfda7b0..a32157ce0551 100644
> --- a/arch/powerpc/kernel/entry_32.S
> +++ b/arch/powerpc/kernel/entry_32.S
> @@ -277,7 +277,7 @@ reenable_mmu:
>   	 * r3 can be different from GPR3(r1) at this point, r9 and r11
>   	 * contains the old MSR and handler address respectively,
>   	 * r4 & r5 can contain page fault arguments that need to be passed

The line above should be dropped as well (its end on the line below is dropped already)


> -	 * along as well. r0, r6-r8, r12, CCR, CTR, XER etc... are left
> +	 * r0, r4-r8, r12, CCR, CTR, XER etc... are left
>   	 * clobbered as they aren't useful past this point.
>   	 */
>   

Christophe
