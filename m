Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB4847F1AE
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Dec 2021 03:06:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JLS381CHjz3cM5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Dec 2021 13:06:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com;
 envelope-from=wangkefeng.wang@huawei.com; receiver=<UNKNOWN>)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JLS2c2swdz2xsM
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Dec 2021 13:05:58 +1100 (AEDT)
Received: from dggpemm500020.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4JLS1J6R83zcbrD;
 Sat, 25 Dec 2021 10:04:52 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggpemm500020.china.huawei.com (7.185.36.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Sat, 25 Dec 2021 10:05:18 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.20; Sat, 25 Dec 2021 10:05:17 +0800
Message-ID: <ccf311bd-c0ed-3e42-8057-849a9c3e9a98@huawei.com>
Date: Sat, 25 Dec 2021 10:05:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] Revert "mm/usercopy: Drop extra is_vmalloc_or_module()
 check"
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Kees Cook
 <keescook@chromium.org>, Laura Abbott <labbott@redhat.com>, Mark Rutland
 <mark.rutland@arm.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "Andrew
 Morton" <akpm@linux-foundation.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>, Nick Piggin <npiggin@gmail.com>
References: <20211223102126.161848-1-wangkefeng.wang@huawei.com>
 <ffd77bcf-b9d8-956c-9f83-14b9f0b496e7@csgroup.eu>
 <96fe1826-aeaf-4ea0-9f01-03d6b3933b34@huawei.com>
 <6e2ddc83-bec3-fdd4-4d91-3ade0de0b7c8@csgroup.eu>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <6e2ddc83-bec3-fdd4-4d91-3ade0de0b7c8@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggeme706-chm.china.huawei.com (10.1.199.102) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
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


On 2021/12/24 21:18, Christophe Leroy wrote:
>
> Le 24/12/2021 à 08:06, Kefeng Wang a écrit :
>> On 2021/12/24 14:01, Christophe Leroy wrote:
>>> Le 23/12/2021 à 11:21, Kefeng Wang a écrit :
>>>> This reverts commit 517e1fbeb65f5eade8d14f46ac365db6c75aea9b.
>>>>
>>>>      usercopy: Kernel memory exposure attempt detected from SLUB
>>>> object not in SLUB page?! (offset 0, size 1048)!
>>>>      kernel BUG at mm/usercopy.c:99
>>>>      ...
>>>>      usercopy_abort+0x64/0xa0 (unreliable)
>>>>      __check_heap_object+0x168/0x190
>>>>      __check_object_size+0x1a0/0x200
>>>>      dev_ethtool+0x2494/0x2b20
>>>>      dev_ioctl+0x5d0/0x770
>>>>      sock_do_ioctl+0xf0/0x1d0
>>>>      sock_ioctl+0x3ec/0x5a0
>>>>      __se_sys_ioctl+0xf0/0x160
>>>>      system_call_exception+0xfc/0x1f0
>>>>      system_call_common+0xf8/0x200
>>>>
>>>> When run ethtool eth0, the BUG occurred, the code shows below,
>>>>
>>>>      data = vzalloc(array_size(gstrings.len, ETH_GSTRING_LEN));
>>>>      copy_to_user(useraddr, data, gstrings.len * ETH_GSTRING_LEN))
>>>>
>>>> The data is alloced by vmalloc(),  virt_addr_valid(ptr) will return true
>>>> on PowerPC64, which leads to the panic, add back the
>>>> is_vmalloc_or_module()
>>>> check to fix it.
>>> Is it expected that virt_addr_valid() returns true on PPC64 for
>>> vmalloc'ed memory ? If that's the case it also means that
>>> CONFIG_DEBUG_VIRTUAL won't work as expected either.
>> Our product reports this bug to me, after let them do some test,
>>
>> I found virt_addr_valid return true for vmalloc'ed memory on their board.
>>
>> I think DEBUG_VIRTUAL could not be work well too, but I can't test it.
>>
>>> If it is unexpected, I think you should fix PPC64 instead of adding this
>>> hack back. Maybe the ARM64 fix can be used as a starting point, see
>>> commit 68dd8ef32162 ("arm64: memory: Fix virt_addr_valid() using
>>> __is_lm_address()")
>> Yes， I check the history,  fix virt_addr_valid() on PowerPC is what I
>> firstly want to do,
>>
>> but I am not familiar with PPC, and also HARDENED_USERCOPY on other's
>> ARCHs could
>>
>> has this issue too, so I add the workaround back.
>>
>>
>> 1) PPC maintainer/expert, any suggestion ?
>>
>> 2) Maybe we could add some check to WARN this scenario.
>>
>> --- a/mm/usercopy.c
>> +++ b/mm/usercopy.c
>> @@ -229,6 +229,8 @@ static inline void check_heap_object(const void
>> *ptr, unsigned long n,
>>           if (!virt_addr_valid(ptr))
>>                   return;
>>
>> +       WARN_ON_ONCE(is_vmalloc_or_module_addr(ptr));

>>
>>> In the meantime, can you provide more information on your config,
>>> especially which memory model is used ?
>> Some useful configs,
>>
>> CONFIG_PPC64=y
>> CONFIG_PPC_BOOK3E_64=y
>> CONFIG_E5500_CPU=y
>> CONFIG_TARGET_CPU_BOOL=y
>> CONFIG_PPC_BOOK3E=y
>> CONFIG_E500=y
>> CONFIG_PPC_E500MC=y
>> CONFIG_PPC_FPU=y
>> CONFIG_FSL_EMB_PERFMON=y
>> CONFIG_FSL_EMB_PERF_EVENT=y
>> CONFIG_FSL_EMB_PERF_EVENT_E500=y
>> CONFIG_BOOKE=y
>> CONFIG_PPC_FSL_BOOK3E=y
>> CONFIG_PTE_64BIT=y
>> CONFIG_PHYS_64BIT=y
>> CONFIG_PPC_MMU_NOHASH=y
>> CONFIG_PPC_BOOK3E_MMU=y
>> CONFIG_SELECT_MEMORY_MODEL=y
>> CONFIG_FLATMEM_MANUAL=y
>> CONFIG_FLATMEM=y
>> CONFIG_FLAT_NODE_MEM_MAP=y
>> CONFIG_SPARSEMEM_VMEMMAP_ENABLE=y
>>
> OK so it is PPC64 book3e and with flatmem.
>
> The problem is virt_to_pfn() which uses __pa()
>
> __pa(x) on PPC64 is (x) & 0x0fffffffffffffffUL
>
> And on book3e/64 we have
>
> VMALLOC_START = KERN_VIRT_START = ASM_CONST(0x8000000000000000)
>
>
> It means that __pa() will return a valid PFN for VMALLOCed addresses.
>
>
> So an additional check is required in virt_addr_valid(), maybe check
> that (kaddr & PAGE_OFFSET) == PAGE_OFFSET
>
> Can you try that ?
>
> #define virt_addr_valid(kaddr)	((kaddr & PAGE_OFFSET) == PAGE_OFFSET &&
> pfn_valid(virt_to_pfn(kaddr)))

I got this commit,

commit 4dd7554a6456d124c85e0a4ad156625b71390b5c

Author: Nicholas Piggin <npiggin@gmail.com>
Date:   Wed Jul 24 18:46:37 2019 +1000

     powerpc/64: Add VIRTUAL_BUG_ON checks for __va and __pa addresses

     Ensure __va is given a physical address below PAGE_OFFSET, and __pa is
     given a virtual address above PAGE_OFFSET.

It has check the PAGE_OFFSET in __pa,  will test it and resend the 
patch(with above warning changes).

Thanks.

>
>
> Thanks
> Christophe
