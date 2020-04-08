Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C19AF1A1F5D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Apr 2020 13:03:08 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48y1bF5vyCzDqsK
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Apr 2020 21:03:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48y1YC5LKzzDqTV
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Apr 2020 21:01:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=TOrwIhOh; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 48y1YC1ynRz8tT3
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Apr 2020 21:01:19 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 48y1YC0LqBz9sQt; Wed,  8 Apr 2020 21:01:19 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=TOrwIhOh; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 48y1Y76vyjz9sQx
 for <linuxppc-dev@ozlabs.org>; Wed,  8 Apr 2020 21:01:14 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48y1Y11WsMz9tyQk;
 Wed,  8 Apr 2020 13:01:09 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=TOrwIhOh; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 23C7RcMkWcNk; Wed,  8 Apr 2020 13:01:09 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48y1Y10TJ1z9tyQ8;
 Wed,  8 Apr 2020 13:01:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1586343669; bh=mWiVMjTWt6tQvz4AvUjIb6GzjXqIYB8oX6u6XKNvdkU=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=TOrwIhOhrHLn0kelt0iMqe4K+Hn7m0WYFQlyNSOrH3l0/IcgyRsniJsGG7IDzWRvQ
 wY5X3soVMjIbeC+UQXDWOm+ok4SmYaqWgFH1KG9YzKiKewHBzZTBk9IOotZwKryNJh
 1y24z+E5uAEJoJuhBdnOQJcVjbqYYo7CC+kUEpGM=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 505F38B82D;
 Wed,  8 Apr 2020 13:01:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id KOoQrUKB2Daa; Wed,  8 Apr 2020 13:01:10 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EA0178B829;
 Wed,  8 Apr 2020 13:01:09 +0200 (CEST)
Subject: Re: [RFC PATCH 2/3] powerpc/lib: Initialize a temporary mm for code
 patching
To: Christopher M Riedl <cmr@informatik.wtf>, linuxppc-dev@ozlabs.org
References: <20200323045205.20314-1-cmr@informatik.wtf>
 <20200323045205.20314-3-cmr@informatik.wtf>
 <ecccbeb2-731b-f9a3-1039-f2a662e3a9a5@c-s.fr>
 <1782990079.111623.1585624792778@privateemail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <8ff6d279-fdd9-4e4d-b4e0-f5c5cba480a4@c-s.fr>
Date: Wed, 8 Apr 2020 13:01:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <1782990079.111623.1585624792778@privateemail.com>
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



Le 31/03/2020 à 05:19, Christopher M Riedl a écrit :
>> On March 24, 2020 11:10 AM Christophe Leroy <christophe.leroy@c-s.fr> wrote:
>>
>>   
>> Le 23/03/2020 à 05:52, Christopher M. Riedl a écrit :
>>> When code patching a STRICT_KERNEL_RWX kernel the page containing the
>>> address to be patched is temporarily mapped with permissive memory
>>> protections. Currently, a per-cpu vmalloc patch area is used for this
>>> purpose. While the patch area is per-cpu, the temporary page mapping is
>>> inserted into the kernel page tables for the duration of the patching.
>>> The mapping is exposed to CPUs other than the patching CPU - this is
>>> undesirable from a hardening perspective.
>>>
>>> Use the `poking_init` init hook to prepare a temporary mm and patching
>>> address. Initialize the temporary mm by copying the init mm. Choose a
>>> randomized patching address inside the temporary mm userspace address
>>> portion. The next patch uses the temporary mm and patching address for
>>> code patching.
>>>
>>> Based on x86 implementation:
>>>
>>> commit 4fc19708b165
>>> ("x86/alternatives: Initialize temporary mm for patching")
>>>
>>> Signed-off-by: Christopher M. Riedl <cmr@informatik.wtf>
>>> ---
>>>    arch/powerpc/lib/code-patching.c | 26 ++++++++++++++++++++++++++
>>>    1 file changed, 26 insertions(+)
>>>
>>> diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
>>> index 3345f039a876..18b88ecfc5a8 100644
>>> --- a/arch/powerpc/lib/code-patching.c
>>> +++ b/arch/powerpc/lib/code-patching.c
>>> @@ -11,6 +11,8 @@
>>>    #include <linux/cpuhotplug.h>
>>>    #include <linux/slab.h>
>>>    #include <linux/uaccess.h>
>>> +#include <linux/sched/task.h>
>>> +#include <linux/random.h>
>>>    
>>>    #include <asm/pgtable.h>
>>>    #include <asm/tlbflush.h>
>>> @@ -39,6 +41,30 @@ int raw_patch_instruction(unsigned int *addr, unsigned int instr)
>>>    }
>>>    
>>>    #ifdef CONFIG_STRICT_KERNEL_RWX
>>> +
>>> +__ro_after_init struct mm_struct *patching_mm;
>>> +__ro_after_init unsigned long patching_addr;
>>
>> Can we make those those static ?
>>
> 
> Yes, makes sense to me.
> 
>>> +
>>> +void __init poking_init(void)
>>> +{
>>> +	spinlock_t *ptl; /* for protecting pte table */
>>> +	pte_t *ptep;
>>> +
>>> +	patching_mm = copy_init_mm();
>>> +	BUG_ON(!patching_mm);
>>
>> Does it needs to be a BUG_ON() ? Can't we fail gracefully with just a
>> WARN_ON ?
>>
> 
> I'm not sure what failing gracefully means here? The main reason this could
> fail is if there is not enough memory to allocate the patching_mm. The
> previous implementation had this justification for BUG_ON():

But the system can continue running just fine after this failure.
Only the things that make use of code patching will fail (ftrace, kgdb, ...)

Checkpatch tells: "Avoid crashing the kernel - try using WARN_ON & 
recovery code rather than BUG() or BUG_ON()"

All vital code patching has already been done previously, so I think a 
WARN_ON() should be enough, plus returning non 0 to indicate that the 
late_initcall failed.


> 
> /*
>   * Run as a late init call. This allows all the boot time patching to be done
>   * simply by patching the code, and then we're called here prior to
>   * mark_rodata_ro(), which happens after all init calls are run. Although
>   * BUG_ON() is rude, in this case it should only happen if ENOMEM, and we judge
>   * it as being preferable to a kernel that will crash later when someone tries
>   * to use patch_instruction().
>   */
> static int __init setup_text_poke_area(void)
> {
>          BUG_ON(!cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
>                  "powerpc/text_poke:online", text_area_cpu_up,
>                  text_area_cpu_down));
> 
>          return 0;
> }
> late_initcall(setup_text_poke_area);
> 
> I think the BUG_ON() is appropriate even if only to adhere to the previous
> judgement call. I can add a similar comment explaining the reasoning if
> that helps.
> 
>>> +
>>> +	/*
>>> +	 * In hash we cannot go above DEFAULT_MAP_WINDOW easily.
>>> +	 * XXX: Do we want additional bits of entropy for radix?
>>> +	 */
>>> +	patching_addr = (get_random_long() & PAGE_MASK) %
>>> +		(DEFAULT_MAP_WINDOW - PAGE_SIZE);
>>> +
>>> +	ptep = get_locked_pte(patching_mm, patching_addr, &ptl);
>>> +	BUG_ON(!ptep);
>>
>> Same here, can we fail gracefully instead ?
>>
> 
> Same reasoning as above.

Here as well, a WARN_ON() should be enough, the system will continue 
running after that.

> 
>>> +	pte_unmap_unlock(ptep, ptl);
>>> +}
>>> +
>>>    static DEFINE_PER_CPU(struct vm_struct *, text_poke_area);
>>>    
>>>    static int text_area_cpu_up(unsigned int cpu)
>>>
>>
>> Christophe

Christophe
