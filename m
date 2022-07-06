Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C18C25688AD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jul 2022 14:50:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LdKCW5VGfz3c6N
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jul 2022 22:50:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LdKC344YRz3bd6
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Jul 2022 22:50:17 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4LdKBr4B1gz9tWm;
	Wed,  6 Jul 2022 14:50:12 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3b1Tk15YVX3m; Wed,  6 Jul 2022 14:50:12 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4LdKBr3R4fz9sfl;
	Wed,  6 Jul 2022 14:50:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 664748B790;
	Wed,  6 Jul 2022 14:50:12 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id sDQLrrIO2R3b; Wed,  6 Jul 2022 14:50:12 +0200 (CEST)
Received: from [172.25.230.108] (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 456B28B764;
	Wed,  6 Jul 2022 14:50:12 +0200 (CEST)
Message-ID: <fe96f510-4a4e-f044-c815-489b8f6d0564@csgroup.eu>
Date: Wed, 6 Jul 2022 14:50:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] powerpc/mm: Use is_vmalloc_addr to validate addr
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "mpe@ellerman.id.au" <mpe@ellerman.id.au>
References: <20220704063909.295546-1-aneesh.kumar@linux.ibm.com>
 <2daa07c5-db5f-a6c9-82a7-7b6f1524135b@csgroup.eu>
 <91684e3f-c60c-e70f-4c04-fab40c2214b7@linux.ibm.com>
 <d42e1e82-ffc3-7cf8-7de0-52a24f3f2d83@csgroup.eu>
In-Reply-To: <d42e1e82-ffc3-7cf8-7de0-52a24f3f2d83@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 04/07/2022 à 09:55, Christophe Leroy a écrit :
> 
> 
> Le 04/07/2022 à 09:45, Aneesh Kumar K V a écrit :
>> On 7/4/22 12:43 PM, Christophe Leroy wrote:
>>>
>>>
>>> Le 04/07/2022 à 08:39, Aneesh Kumar K.V a écrit :
>>>> Instead of high_memory use is_vmalloc_addr to validate that the 
>>>> address is
>>>> not in the vmalloc range.
>>>
>>>
>>> Do we really need even more extra checks, and a function that is not
>>> inlined anymore ?
>>>
>>> virt_addr_valid() used to be pretty simple. Some extra tests were added
>>> by commit ffa0b64e3be5 ("powerpc: Fix virt_addr_valid() for 64-bit
>>> Book3E & 32-bit") in order to work around some corner cases, and the
>>> commit message say they are temporary.
>>>
>>> virt_addr_valid() is there to check that an address is a valid linear
>>> mapping, not that an address IS NOT a vmalloc address. What will happen
>>> with your check if you pass an address that is from an ioremap done
>>> prior to the start of the vmalloc system ?
>>>
>>
>> I was expecting the io range to be handled by pfn_valid(). IS there a 
>> memory layout
>> ascii diagram of book3e/64 like asm/book3s/64/radix.h:51 ? My goal 
>> with the
>> change was to make it more explicit what is it being validated.
> 
> 
> Yes you are right it should be handled by pfn_valid(), just like the 
> entire VMALLOC range indeed. But on PPC32 a valid pfn might hit above 
> vmalloc space as well.
> 
> You can find the new layout here : 
> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commit/?id=c7b9ed7c34a9f5dbf8222d63e3e313cef9f3150b 
> 
> 
> The only problem we have with pfn_valid() is for PPC32 because 
> pfn_valid() also include highmem memory. That's the reason why we need 
> to check that the address is below high_memory in addition.
> 
> For everything else, pfn_valid() should be enough.
> 
> For PPC64, we may want to add a verification that we are in the 0xc.... 
> range, because of the way __pa/__va work. On PPC32 that's not needed.
> 

So, I would do something like that:

static __always_inline bool __virt_addr_valid(unsigned long addr)
{
	if (IS_ENABLED(CONFIG_PPC64) && lm_alias(addr) != addr)
		return false;
	if (IS_ENABLED(CONFIG_HIGHMEM) && addr >= (unsigned long)high_memory)
		return false;
	return pfn_valid(virt_to_pfn(addr));
}

#define virt_addr_valid(kaddr)	__virt_addr_valid((unsigned long) (kaddr))
