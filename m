Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D97F4B9EA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 15:27:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TQj31jByzDqpg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 23:27:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="ZVMdWNxB"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45TQWX36jPzDqlQ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 23:18:47 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45TQWM4qfLzB09ZK;
 Wed, 19 Jun 2019 15:18:39 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=ZVMdWNxB; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 1-J7oHQEb5oB; Wed, 19 Jun 2019 15:18:39 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45TQWM3kz4zB09ZJ;
 Wed, 19 Jun 2019 15:18:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1560950319; bh=k5b84zQkH4mxZUcdgRG9azGWYvRhQwWD/Z4y0POu3M4=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=ZVMdWNxBPo8fOPOrTBG60GaQZH3NkMj4o/In0Uhr4WRN1LRCetm2fQXTjvAV7j1C4
 6FEftMC9jTXpB65QoUncilVt44Lt02LEuzJ/1J1CT3Z7aOC+bdi8UqTYDMElhfpmfY
 h+ZineNGiLLs2y3YL2PGZ6+M1dW3fSaC6ObkyfIY=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D24DE8B93C;
 Wed, 19 Jun 2019 15:18:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 3JXBJ0BM-m1V; Wed, 19 Jun 2019 15:18:41 +0200 (CEST)
Received: from PO15451 (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7E93E8B92B;
 Wed, 19 Jun 2019 15:18:41 +0200 (CEST)
Subject: Re: [PATCH 2/3] powerpc/64s/radix: ioremap use ioremap_page_range
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20190610030818.17965-1-npiggin@gmail.com>
 <20190610030818.17965-2-npiggin@gmail.com>
 <1a9a36aa-f2bb-1ce8-78d5-ddf24e336078@c-s.fr>
 <1560915874.eudrz3r20a.astroid@bobo.none>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <d4e026c5-d0cd-df5f-56d3-1cf62c3a18bd@c-s.fr>
Date: Wed, 19 Jun 2019 14:49:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <1560915874.eudrz3r20a.astroid@bobo.none>
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



Le 19/06/2019 à 05:59, Nicholas Piggin a écrit :
> Christophe Leroy's on June 11, 2019 4:46 pm:
>>
>>
>> Le 10/06/2019 à 05:08, Nicholas Piggin a écrit :

[snip]

>>> diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
>>> index c9bcf428dd2b..db993bc1aef3 100644
>>> --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
>>> +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
>>> @@ -11,6 +11,7 @@
>>>    
>>>    #define pr_fmt(fmt) "radix-mmu: " fmt
>>>    
>>> +#include <linux/io.h>
>>>    #include <linux/kernel.h>
>>>    #include <linux/sched/mm.h>
>>>    #include <linux/memblock.h>
>>> @@ -1122,3 +1123,23 @@ void radix__ptep_modify_prot_commit(struct vm_area_struct *vma,
>>>    
>>>    	set_pte_at(mm, addr, ptep, pte);
>>>    }
>>> +
>>> +int radix__ioremap_range(unsigned long ea, phys_addr_t pa, unsigned long size,
>>> +			pgprot_t prot, int nid)
>>> +{
>>> +	if (likely(slab_is_available())) {
>>> +		int err = ioremap_page_range(ea, ea + size, pa, prot);
>>> +		if (err)
>>> +			unmap_kernel_range(ea, size);
>>> +		return err;
>>> +	} else {
>>> +		unsigned long i;
>>> +
>>> +		for (i = 0; i < size; i += PAGE_SIZE) {
>>> +			int err = map_kernel_page(ea + i, pa + i, prot);
>>> +			if (WARN_ON_ONCE(err)) /* Should clean up */
>>> +				return err;
>>> +		}
>>
>> Same loop again.
>>
>> What about not doing a radix specific function and just putting
>> something like below in the core ioremap_range() function ?
>>
>> 	if (likely(slab_is_available()) && radix_enabled()) {
>> 		int err = ioremap_page_range(ea, ea + size, pa, prot);
>>
>> 		if (err)
>> 			unmap_kernel_range(ea, size);
>> 		return err;
>> 	}
>>
>> Because I'm pretty sure will more and more use ioremap_page_range().
> 
> Well I agree the duplication is not so nice, but it's convenient
> to see what is going on for each MMU type.
> 
> There is a significant amount of churn that needs to be done in
> this layer so I prefer to make it a bit simpler despite duplication.
> 
> I would like to remove the early ioremap or make it into its own
> function. Re-implement map_kernel_page with ioremap_page_range,
> allow page tables that don't use slab to avoid the early check,
> unbolt the hptes mapped in early boot, etc.
> 
> I just wanted to escape out the 64s and hash/radix implementations
> completely until that settles.

I can understand the benefit in some situations but here I just can't. 
And code duplication should be avoided as much as possible as it makes 
code maintenance more difficult.

Here you have:

+static int ioremap_range(unsigned long ea, phys_addr_t pa, unsigned 
long size, pgprot_t prot, int nid)
+{
+	unsigned long i;
+
+	for (i = 0; i < size; i += PAGE_SIZE) {
+		int err = map_kernel_page(ea + i, pa + i, prot);
+		if (err) {
+			if (slab_is_available())
+				unmap_kernel_range(ea, size);
+			else
+				WARN_ON_ONCE(1); /* Should clean up */
+			return err;
+		}
+	}
+
+	return 0;
+}

You now create a new one in another file, that is almost identical:

+int ioremap_range(unsigned long ea, phys_addr_t pa, unsigned long size, 
pgprot_t prot, int nid)
+{
+	unsigned long i;
+
+	if (radix_enabled())
+		return radix__ioremap_range(ea, pa, size, prot, nid);
+
+	for (i = 0; i < size; i += PAGE_SIZE) {
+		int err = map_kernel_page(ea + i, pa + i, prot);
+		if (err) {
+			if (slab_is_available())
+				unmap_kernel_range(ea, size);
+			else
+				WARN_ON_ONCE(1); /* Should clean up */
+			return err;
+		}
+	}
+
+	return 0;
+}

Then you have to make the original one __weak.

Sorry I'm still having difficulties understanding what the benefit is.

radix_enabled() is defined for every platforms so could just add the 
following on top of the existing ioremap_range() and voila.

+	if (radix_enabled())
+		return radix__ioremap_range(ea, pa, size, prot, nid);


And with that you wouldn't have the __weak stuff to handle.

> 
>>> -static int ioremap_range(unsigned long ea, phys_addr_t pa, unsigned long size, pgprot_t prot, int nid)
>>> +int __weak ioremap_range(unsigned long ea, phys_addr_t pa, unsigned long size, pgprot_t prot, int nid)
>>
>> Hum. Weak functions remain in unused in vmlinux unless
>> CONFIG_LD_DEAD_CODE_DATA_ELIMINATION is selected.
>>
>> Also, they are some how dangerous because people might change them
>> without seeing that it is overridden for some particular configuration.
> 
> Well you shouldn't assume that when you see a weak function, but
> what's the preferred alternative? A config option?

Yes you are right, nobody should assume that, but ...

But I think if the fonctions were really different, the preferred 
alternative would be to move the original function into a file dedicated 
to nohash64.

Christophe
