Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FF61501DA
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Feb 2020 08:08:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 489zSX2PkTzDqLp
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Feb 2020 18:08:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=IqgNPnJz; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 489zQt4jq0zDqLB
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Feb 2020 18:07:02 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 489zQk6WxMz9tyJn;
 Mon,  3 Feb 2020 08:06:54 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=IqgNPnJz; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id MlfiiwrqS1CJ; Mon,  3 Feb 2020 08:06:54 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 489zQk5NSGz9tyJm;
 Mon,  3 Feb 2020 08:06:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1580713614; bh=smrKpIHjFvgNU1nY+YX2OWlGMfhRIgdamHvzNUhVLVg=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=IqgNPnJzQokcayKUyec8eVwm/PCXeJ9wuAZ3C027ZMmxzRzPJudSm2cGpYnowyuC2
 q7/KV4/7w7wzKa4FrQinYFr+MgOysUneExIAp9Jq/VZ5P/g/6VhhgsnR/FI5+hN9h5
 WsXbN4D7oe/tUwwjQyyoyeRsIAwQEvIUutUOjooE=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3BA148B791;
 Mon,  3 Feb 2020 08:06:59 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id GwpP5yhDHf9J; Mon,  3 Feb 2020 08:06:59 +0100 (CET)
Received: from [172.25.230.102] (po15451.idsi0.si.c-s.fr [172.25.230.102])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DAE178B752;
 Mon,  3 Feb 2020 08:06:58 +0100 (CET)
Subject: Re: [PATCH v6 1/5] powerpc/mm: Implement set_memory() routines
To: Russell Currey <ruscur@russell.cc>, linuxppc-dev@lists.ozlabs.org
References: <20191224055545.178462-1-ruscur@russell.cc>
 <20191224055545.178462-2-ruscur@russell.cc>
 <8f8940e2-c6ab-fca2-ab8a-61b80b2edd22@c-s.fr>
 <8675c11631ac027a78e00d4fe2c20736496b1e97.camel@russell.cc>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <59c7ce33-b61b-e008-f3fc-730ae1dd2ba7@c-s.fr>
Date: Mon, 3 Feb 2020 08:06:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <8675c11631ac027a78e00d4fe2c20736496b1e97.camel@russell.cc>
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
Cc: ajd@linux.ibm.com, kernel-hardening@lists.openwall.com, npiggin@gmail.com,
 joel@jms.id.au, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 03/02/2020 à 01:46, Russell Currey a écrit :
> On Wed, 2020-01-08 at 13:52 +0100, Christophe Leroy wrote:
>>
>> Le 24/12/2019 à 06:55, Russell Currey a écrit :
>>> diff --git a/arch/powerpc/mm/Makefile b/arch/powerpc/mm/Makefile
>>> index 5e147986400d..d0a0bcbc9289 100644
>>> --- a/arch/powerpc/mm/Makefile
>>> +++ b/arch/powerpc/mm/Makefile
>>> @@ -20,3 +20,4 @@ obj-$(CONFIG_HIGHMEM)		+= highmem.o
>>>    obj-$(CONFIG_PPC_COPRO_BASE)	+= copro_fault.o
>>>    obj-$(CONFIG_PPC_PTDUMP)	+= ptdump/
>>>    obj-$(CONFIG_KASAN)		+= kasan/
>>> +obj-$(CONFIG_ARCH_HAS_SET_MEMORY) += pageattr.o
>>
>> CONFIG_ARCH_HAS_SET_MEMORY is set inconditionnally, I think you
>> should
>> add pageattr.o to obj-y instead. CONFIG_ARCH_HAS_XXX are almost
>> never
>> used in Makefiles
> 
> Fair enough, will keep that in mind

I forgot I commented that. I'll do it in v3.

>>> +	pte_t pte_val;
>>> +
>>> +	// invalidate the PTE so it's safe to modify
>>> +	pte_val = ptep_get_and_clear(&init_mm, addr, ptep);
>>> +	flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
>>
>> Why flush a range for a single page ? On most targets this will do a
>> tlbia which is heavy, while a tlbie would suffice.
>>
>> I think flush_tlb_kernel_range() should be replaced by something
>> flushing only a single page.
> 
> You might be able to help me out here, I wanted to do that but the only
> functions I could find that flushed single pages needed a
> vm_area_struct, which I can't get.

I sent out two patches for that, one for book3s/32 and one for nohash:
https://patchwork.ozlabs.org/patch/1231983/
https://patchwork.ozlabs.org/patch/1232223/

Maybe one for book3s/64 would be needed as well ? Can you do it if needed ?


> 
>>
>>> +
>>> +	// modify the PTE bits as desired, then apply
>>> +	switch (action) {
>>> +	case SET_MEMORY_RO:
>>> +		pte_val = pte_wrprotect(pte_val);
>>> +		break;
>>> +	case SET_MEMORY_RW:
>>> +		pte_val = pte_mkwrite(pte_val);
>>> +		break;
>>> +	case SET_MEMORY_NX:
>>> +		pte_val = pte_exprotect(pte_val);
>>> +		break;
>>> +	case SET_MEMORY_X:
>>> +		pte_val = pte_mkexec(pte_val);
>>> +		break;
>>> +	default:
>>> +		WARN_ON(true);
>>> +		return -EINVAL;
>>
>> Is it worth checking that the action is valid for each page ? I
>> think
>> validity of action should be checked in change_memory_attr(). All
>> other
>> functions are static so you know they won't be called from outside.
>>
>> Once done, you can squash __change_page_attr() into
>> change_page_attr(),
>> remove the ret var and return 0 all the time.
> 
> Makes sense to fold things into a single function, but in terms of
> performance it shouldn't make a difference, right?  I still have to
> check the action to determine what to change (unless I replace passing
> SET_MEMORY_RO into apply_to_page_range() with a function pointer to
> pte_wrprotect() for example).

pte_wrprotect() is a static inline.

> 
>>
>>> +	}
>>> +
>>> +	set_pte_at(&init_mm, addr, ptep, pte_val);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int change_page_attr(pte_t *ptep, unsigned long addr, void
>>> *data)
>>> +{
>>> +	int ret;
>>> +
>>> +	spin_lock(&init_mm.page_table_lock);
>>> +	ret = __change_page_attr(ptep, addr, data);
>>> +	spin_unlock(&init_mm.page_table_lock);
>>> +
>>> +	return ret;
>>> +}
>>> +
>>> +int change_memory_attr(unsigned long addr, int numpages, int
>>> action)
>>> +{
>>> +	unsigned long start = ALIGN_DOWN(addr, PAGE_SIZE);
>>> +	unsigned long size = numpages * PAGE_SIZE;
>>> +
>>> +	if (!numpages)
>>> +		return 0;
>>> +
>>> +	return apply_to_page_range(&init_mm, start, size,
>>> change_page_attr, &action);
>>
>> Use (void*)action instead of &action (see upper comment)
> 
> To get this to work I had to use (void *)(size_t)action to stop the
> compiler from complaining about casting an int to a void*, is there a
> better way to go about it?  Works fine, just looks gross.

Yes, use long instead (see my v3)

Christophe
