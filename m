Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDC625F4BF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Sep 2020 10:13:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BlLct1rrjzDqRd
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Sep 2020 18:13:02 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BlLb43YxfzDqPc
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Sep 2020 18:11:22 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BlLZg2H9Mz9v0xg;
 Mon,  7 Sep 2020 10:11:07 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id QumHwXbMT3sE; Mon,  7 Sep 2020 10:11:06 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BlLZf6Z4mz9v0xb;
 Mon,  7 Sep 2020 10:11:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DFDE98B77F;
 Mon,  7 Sep 2020 10:11:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id fm4wLaGXinXK; Mon,  7 Sep 2020 10:11:11 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 812A08B787;
 Mon,  7 Sep 2020 10:11:11 +0200 (CEST)
Subject: Re: [PATCH -next] powerpc/book3s64: fix link error with
 CONFIG_PPC_RADIX_MMU=n
To: Yang Yingliang <yangyingliang@huawei.com>, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org
References: <20200905112548.3265530-1-yangyingliang@huawei.com>
 <39a976b8-896c-e878-bac7-50bbf3ccbc4f@csgroup.eu>
 <af37c513-6232-c35c-33e3-f6d8d82c8175@huawei.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <88101db4-a1bb-6a6d-521e-84dcec8b44d0@csgroup.eu>
Date: Mon, 7 Sep 2020 10:11:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <af37c513-6232-c35c-33e3-f6d8d82c8175@huawei.com>
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



Le 07/09/2020 à 03:51, Yang Yingliang a écrit :
> 
> On 2020/9/6 14:50, Christophe Leroy wrote:
>>
>>
>> Le 05/09/2020 à 13:25, Yang Yingliang a écrit :
>>> Fix link error when CONFIG_PPC_RADIX_MMU is disabled:
>>> powerpc64-linux-gnu-ld: 
>>> arch/powerpc/platforms/pseries/lpar.o:(.toc+0x0): undefined reference 
>>> to `mmu_pid_bits'
>>>
>>> Reported-by: Hulk Robot <hulkci@huawei.com>
>>> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
>>> ---
>>>   arch/powerpc/mm/book3s64/mmu_context.c | 4 ++++
>>
>> In your commit log, you are just mentionning 
>> arch/powerpc/platforms/pseries/lpar.o, which is right.
>>
>> You shouldn't need to modify arch/powerpc/mm/book3s64/mmu_context.c at 
>> all, see below.
>>
>>>   arch/powerpc/platforms/pseries/lpar.c  | 2 ++
>>>   2 files changed, 6 insertions(+)
>>>
>>> diff --git a/arch/powerpc/mm/book3s64/mmu_context.c 
>>> b/arch/powerpc/mm/book3s64/mmu_context.c
>>> index 0ba30b8b935b..a8e292cd88f0 100644
>>> --- a/arch/powerpc/mm/book3s64/mmu_context.c
>>> +++ b/arch/powerpc/mm/book3s64/mmu_context.c
>>> @@ -152,6 +152,7 @@ void hash__setup_new_exec(void)
>>>     static int radix__init_new_context(struct mm_struct *mm)
>>>   {
>>> +#ifdef CONFIG_PPC_RADIX_MMU
>>
>> This shouldn't be required. radix__init_new_context() is only called 
>> when radix_enabled() returns true.
>> As it is a static function, when it is not called it gets optimised 
>> away, so you will never get an undefined reference to `mmu_pid_bits` 
>> there.
> powerpc64-linux-gnu-ld: 
> arch/powerpc/mm/book3s64/mmu_context.o:(.toc+0x0): undefined reference 
> to `mmu_pid_bits'
> powerpc64-linux-gnu-ld: 
> arch/powerpc/mm/book3s64/mmu_context.o:(.toc+0x8): undefined reference 
> to `mmu_base_pid'
> 
> 
> mmu_context.c is always compiled, it uses mmu_pid_bits and mmu_base_pid.

Yes, mmu_context.c is always compiled, but as I explained, 
radix__init_new_context() is defined as 'static' so it is optimised out 
when radix_enabled() returns false because there is no caller in that case.

I just made the test with ppc64_defconfig + CONFIG_PPC_RADIX_MMU=n (GCC 8.1)

The only failure I got was on lpar.c, which I fixed by enclosing the 
entire radix_init_pseries() in an #ifdef.

Once this is fixed, the build is OK, without any modification to 
mmu_context.c

powerpc64-linux-objdump -x arch/powerpc/mm/book3s64/mmu_context.o shows 
only the following objects in the .toc:

RELOCATION RECORDS FOR [.toc]:
OFFSET           TYPE              VALUE
0000000000000000 R_PPC64_ADDR64    kmalloc_caches
0000000000000008 R_PPC64_ADDR64    vmemmap
0000000000000010 R_PPC64_ADDR64    __pmd_frag_nr
0000000000000018 R_PPC64_ADDR64    __pmd_frag_size_shift

mmu_pid_bits and mmu_base_pid are not part of the undefined objetcs:

0000000000000000         *UND*	0000000000000000 vmemmap
0000000000000000         *UND*	0000000000000000 .mm_iommu_init
0000000000000000         *UND*	0000000000000000 __pmd_frag_nr
0000000000000000         *UND*	0000000000000000 .ida_alloc_range
0000000000000000         *UND*	0000000000000000 .slb_setup_new_exec
0000000000000000         *UND*	0000000000000000 mmu_feature_keys
0000000000000000         *UND*	0000000000000000 .memset
0000000000000000         *UND*	0000000000000000 .memcpy
0000000000000000         *UND*	0000000000000000 .slice_init_new_context_exec
0000000000000000         *UND*	0000000000000000 ._mcount
0000000000000000         *UND*	0000000000000000 .__free_pages
0000000000000000         *UND*	0000000000000000 __pmd_frag_size_shift
0000000000000000         *UND*	0000000000000000 .slice_setup_new_exec
0000000000000000         *UND*	0000000000000000 .ida_free
0000000000000000         *UND*	0000000000000000 .pte_frag_destroy
0000000000000000         *UND*	0000000000000000 .kfree
0000000000000000         *UND*	0000000000000000 .pkey_mm_init
0000000000000000         *UND*	0000000000000000 .kmem_cache_alloc_trace
0000000000000000         *UND*	0000000000000000 .__warn_printk
0000000000000000         *UND*	0000000000000000 _mcount
0000000000000000         *UND*	0000000000000000 kmalloc_caches

Christophe
