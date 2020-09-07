Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC9725F660
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Sep 2020 11:22:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BlN8b5p1qzDqQv
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Sep 2020 19:22:07 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BlN6l5n8vzDqNX
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Sep 2020 19:20:26 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BlN6S5CmRz9v1yg;
 Mon,  7 Sep 2020 11:20:16 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id YZqYQtxKLKUp; Mon,  7 Sep 2020 11:20:16 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BlN6S4BC1z9v1yf;
 Mon,  7 Sep 2020 11:20:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A17EC8B787;
 Mon,  7 Sep 2020 11:20:21 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id m77zp6yWEsRx; Mon,  7 Sep 2020 11:20:21 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 561E98B77F;
 Mon,  7 Sep 2020 11:20:21 +0200 (CEST)
Subject: Re: [RFC PATCH 02/12] powerpc: remove arguments from interrupt
 handler functions
To: Nicholas Piggin <npiggin@gmail.com>
References: <20200905174335.3161229-1-npiggin@gmail.com>
 <20200905174335.3161229-3-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <e34fead9-a356-3ae6-aa33-544380230bd5@csgroup.eu>
Date: Mon, 7 Sep 2020 11:20:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200905174335.3161229-3-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 05/09/2020 à 19:43, Nicholas Piggin a écrit :
> Make interrupt handlers all just take the pt_regs * argument and load
> DAR/DSISR etc from that. Make those that return a value return long.

I like this, it will likely simplify a bit the VMAP_STACK mess.

Not sure it is that easy. My board is stuck after the start of init.


On the 8xx, on Instruction TLB Error exception, we do

	andis.	r5,r9,DSISR_SRR1_MATCH_32S@h /* Filter relevant SRR1 bits */

On book3s/32, on ISI exception we do:
	andis.	r5,r9,DSISR_SRR1_MATCH_32S@h /* Filter relevant SRR1 bits */

On 40x and bookE, on ISI exception we do:
	li	r5,0			/* Pass zero as arg3 */


And regs->dsisr will just contain nothing

So it means we should at least write back r5 into regs->dsisr from there 
? The performance impact should be minimal as we already write _DAR so 
the cache line should already be in the cache.

A hacky 'stw r5, _DSISR(r1)' in handle_page_fault() does the trick, 
allthough we don't want to do it for both ISI and DSI at the end, so 
you'll have to do it in every head_xxx.S


While you are at it, it would probably also make sense to do remove the 
address param of bad_page_fault(), there is no point in loading back 
regs->dar in handle_page_fault() and machine_check_8xx() and 
alignment_exception(), just read regs->dar in bad_page_fault()

The case of do_break() should also be looked at.

Why changing return code from int to long ?

Christophe

> 
> This is done to make the function signatures match more closely, which
> will help with a future patch to add wrappers. Explicit arguments could
> be re-added for performance in future but that would require more
> complex wrapper macros.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/include/asm/asm-prototypes.h |  4 ++--
>   arch/powerpc/include/asm/bug.h            |  4 ++--
>   arch/powerpc/kernel/exceptions-64e.S      |  2 --
>   arch/powerpc/kernel/exceptions-64s.S      | 14 ++------------
>   arch/powerpc/mm/book3s64/hash_utils.c     |  8 +++++---
>   arch/powerpc/mm/book3s64/slb.c            | 11 +++++++----
>   arch/powerpc/mm/fault.c                   | 16 +++++++++-------
>   7 files changed, 27 insertions(+), 32 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
> index d714d83bbc7c..2fa0cf6c6011 100644
> --- a/arch/powerpc/include/asm/bug.h
> +++ b/arch/powerpc/include/asm/bug.h
> @@ -111,8 +111,8 @@
>   #ifndef __ASSEMBLY__
>   
>   struct pt_regs;
> -extern int do_page_fault(struct pt_regs *, unsigned long, unsigned long);
> -extern int hash__do_page_fault(struct pt_regs *, unsigned long, unsigned long);
> +extern long do_page_fault(struct pt_regs *);
> +extern long hash__do_page_fault(struct pt_regs *);

no extern

>   extern void bad_page_fault(struct pt_regs *, unsigned long, int);
>   extern void _exception(int, struct pt_regs *, int, unsigned long);
>   extern void _exception_pkey(struct pt_regs *, unsigned long, int);

Christophe
