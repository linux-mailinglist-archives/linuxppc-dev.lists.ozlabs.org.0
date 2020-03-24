Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3DB1915E6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 17:14:50 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mxCq6K1PzDqFH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 03:14:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48mx6j4chczDqbw
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 03:10:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=ErgPvoh+; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 48mx6h4y76z9BMm
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 03:10:20 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 48mx6g0Rsvz9sRf; Wed, 25 Mar 2020 03:10:19 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=ErgPvoh+; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 48mx6f1PXKz9sQt
 for <linuxppc-dev@ozlabs.org>; Wed, 25 Mar 2020 03:10:18 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48mx6Y40n3z9tycq;
 Tue, 24 Mar 2020 17:10:13 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=ErgPvoh+; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id bWYJ4V8PfP00; Tue, 24 Mar 2020 17:10:13 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48mx6Y2ylnz9tyd8;
 Tue, 24 Mar 2020 17:10:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1585066213; bh=jUrNKxPmfjih9pJf0Cvd143EIQjuKb1EZKEAAUKuFj4=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=ErgPvoh+U/O4r//d0PZIoIyM39q00SvFE/d4sQ2Kes2yBIN2B3rXuTU69wwF8IoOG
 hADG2PQN0eijwj+MmJcq6f7u4KAsrbecgRiFuzqGmWMP3o92ifcwftQ0M1HzDbYMgS
 AmvnBcpNsTrkV9sfu5WkTBcrMX1f1cJbSk2SrKjo=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EAC9E8B7A8;
 Tue, 24 Mar 2020 17:10:14 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 1pQJEuT8JnNC; Tue, 24 Mar 2020 17:10:14 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 876C18B786;
 Tue, 24 Mar 2020 17:10:14 +0100 (CET)
Subject: Re: [RFC PATCH 2/3] powerpc/lib: Initialize a temporary mm for code
 patching
To: "Christopher M. Riedl" <cmr@informatik.wtf>, linuxppc-dev@ozlabs.org
References: <20200323045205.20314-1-cmr@informatik.wtf>
 <20200323045205.20314-3-cmr@informatik.wtf>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <ecccbeb2-731b-f9a3-1039-f2a662e3a9a5@c-s.fr>
Date: Tue, 24 Mar 2020 17:10:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200323045205.20314-3-cmr@informatik.wtf>
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



Le 23/03/2020 à 05:52, Christopher M. Riedl a écrit :
> When code patching a STRICT_KERNEL_RWX kernel the page containing the
> address to be patched is temporarily mapped with permissive memory
> protections. Currently, a per-cpu vmalloc patch area is used for this
> purpose. While the patch area is per-cpu, the temporary page mapping is
> inserted into the kernel page tables for the duration of the patching.
> The mapping is exposed to CPUs other than the patching CPU - this is
> undesirable from a hardening perspective.
> 
> Use the `poking_init` init hook to prepare a temporary mm and patching
> address. Initialize the temporary mm by copying the init mm. Choose a
> randomized patching address inside the temporary mm userspace address
> portion. The next patch uses the temporary mm and patching address for
> code patching.
> 
> Based on x86 implementation:
> 
> commit 4fc19708b165
> ("x86/alternatives: Initialize temporary mm for patching")
> 
> Signed-off-by: Christopher M. Riedl <cmr@informatik.wtf>
> ---
>   arch/powerpc/lib/code-patching.c | 26 ++++++++++++++++++++++++++
>   1 file changed, 26 insertions(+)
> 
> diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
> index 3345f039a876..18b88ecfc5a8 100644
> --- a/arch/powerpc/lib/code-patching.c
> +++ b/arch/powerpc/lib/code-patching.c
> @@ -11,6 +11,8 @@
>   #include <linux/cpuhotplug.h>
>   #include <linux/slab.h>
>   #include <linux/uaccess.h>
> +#include <linux/sched/task.h>
> +#include <linux/random.h>
>   
>   #include <asm/pgtable.h>
>   #include <asm/tlbflush.h>
> @@ -39,6 +41,30 @@ int raw_patch_instruction(unsigned int *addr, unsigned int instr)
>   }
>   
>   #ifdef CONFIG_STRICT_KERNEL_RWX
> +
> +__ro_after_init struct mm_struct *patching_mm;
> +__ro_after_init unsigned long patching_addr;

Can we make those those static ?

> +
> +void __init poking_init(void)
> +{
> +	spinlock_t *ptl; /* for protecting pte table */
> +	pte_t *ptep;
> +
> +	patching_mm = copy_init_mm();
> +	BUG_ON(!patching_mm);

Does it needs to be a BUG_ON() ? Can't we fail gracefully with just a 
WARN_ON ?

> +
> +	/*
> +	 * In hash we cannot go above DEFAULT_MAP_WINDOW easily.
> +	 * XXX: Do we want additional bits of entropy for radix?
> +	 */
> +	patching_addr = (get_random_long() & PAGE_MASK) %
> +		(DEFAULT_MAP_WINDOW - PAGE_SIZE);
> +
> +	ptep = get_locked_pte(patching_mm, patching_addr, &ptl);
> +	BUG_ON(!ptep);

Same here, can we fail gracefully instead ?

> +	pte_unmap_unlock(ptep, ptl);
> +}
> +
>   static DEFINE_PER_CPU(struct vm_struct *, text_poke_area);
>   
>   static int text_area_cpu_up(unsigned int cpu)
> 

Christophe
