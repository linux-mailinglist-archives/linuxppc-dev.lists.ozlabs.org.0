Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C5EEF1A9747
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 10:48:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492GGJ37JLzDr2N
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 18:48:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492GCj11jkzDr1q
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Apr 2020 18:45:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=kpA+//n4; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 492GCh3NPwz8sxV
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Apr 2020 18:45:52 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 492GCh2c8Vz9sSk; Wed, 15 Apr 2020 18:45:52 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=kpA+//n4; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 492GCc6N2yz9sSc
 for <linuxppc-dev@ozlabs.org>; Wed, 15 Apr 2020 18:45:45 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 492GCQ4byjz9tygm;
 Wed, 15 Apr 2020 10:45:38 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=kpA+//n4; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Dh675Xm1ascb; Wed, 15 Apr 2020 10:45:38 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 492GCQ39Mlz9tygl;
 Wed, 15 Apr 2020 10:45:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1586940338; bh=kkjKN+gmB8cPcQ7f4eQW1s9ynbVHnXrSAzuKXtnV6tM=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=kpA+//n4B/dZvEJLwKwyvKwBnH4AJ9pFCRjfHUNPKiyBDxaDQVzfcqGvaeso5UbqB
 BE1BYOyh6E8C8r81gyFRH8CAOB6fRnGZYJXMvofvWmzbami10x0o0Pe3wHQQtSiuRT
 19YiVHDAeCglrBKIqV2qJIHdNDttP/uqTEC6lu+8=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 867218B922;
 Wed, 15 Apr 2020 10:45:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Olq-45R1Smry; Wed, 15 Apr 2020 10:45:39 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 24C9B8B91F;
 Wed, 15 Apr 2020 10:45:39 +0200 (CEST)
Subject: Re: [RFC PATCH 3/3] powerpc/lib: Use a temporary mm for code patching
To: Christopher M Riedl <cmr@informatik.wtf>, linuxppc-dev@ozlabs.org
References: <20200323045205.20314-1-cmr@informatik.wtf>
 <20200323045205.20314-4-cmr@informatik.wtf>
 <db40ec6a-1d81-91e3-00d8-cd86fd5262d5@c-s.fr>
 <32766971.188162.1586927476788@privateemail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <ee1c177c-a751-29c3-2a36-0d35aa891741@c-s.fr>
Date: Wed, 15 Apr 2020 10:45:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <32766971.188162.1586927476788@privateemail.com>
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



Le 15/04/2020 à 07:11, Christopher M Riedl a écrit :
>> On March 24, 2020 11:25 AM Christophe Leroy <christophe.leroy@c-s.fr> wrote:
>>
>>   
>> Le 23/03/2020 à 05:52, Christopher M. Riedl a écrit :
>>> Currently, code patching a STRICT_KERNEL_RWX exposes the temporary
>>> mappings to other CPUs. These mappings should be kept local to the CPU
>>> doing the patching. Use the pre-initialized temporary mm and patching
>>> address for this purpose. Also add a check after patching to ensure the
>>> patch succeeded.
>>>
>>> Based on x86 implementation:
>>>
>>> commit b3fd8e83ada0
>>> ("x86/alternatives: Use temporary mm for text poking")
>>>
>>> Signed-off-by: Christopher M. Riedl <cmr@informatik.wtf>
>>> ---
>>>    arch/powerpc/lib/code-patching.c | 128 ++++++++++++++-----------------
>>>    1 file changed, 57 insertions(+), 71 deletions(-)
>>>
>>> diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
>>> index 18b88ecfc5a8..f156132e8975 100644
>>> --- a/arch/powerpc/lib/code-patching.c
>>> +++ b/arch/powerpc/lib/code-patching.c
>>> @@ -19,6 +19,7 @@
>>>    #include <asm/page.h>
>>>    #include <asm/code-patching.h>
>>>    #include <asm/setup.h>
>>> +#include <asm/mmu_context.h>
>>>    
>>>    static int __patch_instruction(unsigned int *exec_addr, unsigned int instr,
>>>    			       unsigned int *patch_addr)
>>> @@ -65,99 +66,79 @@ void __init poking_init(void)
>>>    	pte_unmap_unlock(ptep, ptl);
>>>    }
>>>    
>>> -static DEFINE_PER_CPU(struct vm_struct *, text_poke_area);
>>> -
>>> -static int text_area_cpu_up(unsigned int cpu)
>>> -{
>>> -	struct vm_struct *area;
>>> -
>>> -	area = get_vm_area(PAGE_SIZE, VM_ALLOC);
>>> -	if (!area) {
>>> -		WARN_ONCE(1, "Failed to create text area for cpu %d\n",
>>> -			cpu);
>>> -		return -1;
>>> -	}
>>> -	this_cpu_write(text_poke_area, area);
>>> -
>>> -	return 0;
>>> -}
>>> -
>>> -static int text_area_cpu_down(unsigned int cpu)
>>> -{
>>> -	free_vm_area(this_cpu_read(text_poke_area));
>>> -	return 0;
>>> -}
>>> -
>>> -/*
>>> - * Run as a late init call. This allows all the boot time patching to be done
>>> - * simply by patching the code, and then we're called here prior to
>>> - * mark_rodata_ro(), which happens after all init calls are run. Although
>>> - * BUG_ON() is rude, in this case it should only happen if ENOMEM, and we judge
>>> - * it as being preferable to a kernel that will crash later when someone tries
>>> - * to use patch_instruction().
>>> - */
>>> -static int __init setup_text_poke_area(void)
>>> -{
>>> -	BUG_ON(!cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
>>> -		"powerpc/text_poke:online", text_area_cpu_up,
>>> -		text_area_cpu_down));
>>> -
>>> -	return 0;
>>> -}
>>> -late_initcall(setup_text_poke_area);
>>> +struct patch_mapping {
>>> +	spinlock_t *ptl; /* for protecting pte table */
>>> +	struct temp_mm temp_mm;
>>> +};
>>>    
>>>    /*
>>>     * This can be called for kernel text or a module.
>>>     */
>>> -static int map_patch_area(void *addr, unsigned long text_poke_addr)
>>> +static int map_patch(const void *addr, struct patch_mapping *patch_mapping)
>>
>> Why change the name ?
>>
> 
> It's not really an "area" anymore.
> 
>>>    {
>>> -	unsigned long pfn;
>>> -	int err;
>>> +	struct page *page;
>>> +	pte_t pte, *ptep;
>>> +	pgprot_t pgprot;
>>>    
>>>    	if (is_vmalloc_addr(addr))
>>> -		pfn = vmalloc_to_pfn(addr);
>>> +		page = vmalloc_to_page(addr);
>>>    	else
>>> -		pfn = __pa_symbol(addr) >> PAGE_SHIFT;
>>> +		page = virt_to_page(addr);
>>>    
>>> -	err = map_kernel_page(text_poke_addr, (pfn << PAGE_SHIFT), PAGE_KERNEL);
>>> +	if (radix_enabled())
>>> +		pgprot = __pgprot(pgprot_val(PAGE_KERNEL));
>>> +	else
>>> +		pgprot = PAGE_SHARED;
>>
>> Can you explain the difference between radix and non radix ?
>>
>> Why PAGE_KERNEL for a page that is mapped in userspace ?
>>
>> Why do you need to do __pgprot(pgprot_val(PAGE_KERNEL)) instead of just
>> using PAGE_KERNEL ?
>>
> 
> On hash there is a manual check which prevents setting _PAGE_PRIVILEGED for
> kernel to userspace access in __hash_page - hence we cannot access the mapping
> if the page is mapped PAGE_KERNEL on hash. However, I would like to use
> PAGE_KERNEL here as well and am working on understanding why this check is
> done in hash and if this can change. On radix this works just fine.
> 
> The page is mapped PAGE_KERNEL because the address is technically a userspace
> address - but only to keep the mapping local to this CPU doing the patching.
> PAGE_KERNEL makes it clear both in intent and protection that this is a kernel
> mapping.
> 
> I think the correct way is pgprot_val(PAGE_KERNEL) since PAGE_KERNEL is defined
> as:
> 
> #define PAGE_KERNEL	__pgprot(_PAGE_BASE | _PAGE_KERNEL_RW)
> 
> and __pgprot() is defined as:
> 
> typedef struct { unsigned long pgprot; } pgprot_t;
> #define pgprot_val(x)   ((x).pgprot)
> #define __pgprot(x)     ((pgprot_t) { (x) })


Yes, so:
	pgprot_val(__pgprot(x)) == x


You do:

	pgprot = __pgprot(pgprot_val(PAGE_KERNEL));

Which is:

	pgprot = __pgprot(pgprot_val(__pgprot(_PAGE_BASE | _PAGE_KERNEL_RW)));

Which is equivalent to:

	pgprot = __pgprot(_PAGE_BASE | _PAGE_KERNEL_RW);

So at the end it should simply be:

	pgprot = PAGE_KERNEL;




Christophe
