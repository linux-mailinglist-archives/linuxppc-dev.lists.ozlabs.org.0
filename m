Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EC68DA11C2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 08:28:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Jt3j0yfDzDr6V
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 16:28:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=huawei.com
 (client-ip=45.249.212.32; helo=huawei.com; envelope-from=yanaijie@huawei.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Jt1h1mhMzDqnD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2019 16:27:04 +1000 (AEST)
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id B5D623BD6BCA87A6F7C9;
 Thu, 29 Aug 2019 14:26:58 +0800 (CST)
Received: from [127.0.0.1] (10.177.96.203) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.439.0; Thu, 29 Aug 2019
 14:26:49 +0800
Subject: Re: [PATCH v6 06/12] powerpc/fsl_booke/32: implement KASLR
 infrastructure
To: Christophe Leroy <christophe.leroy@c-s.fr>, Scott Wood <oss@buserror.net>
References: <20190809100800.5426-1-yanaijie@huawei.com>
 <20190809100800.5426-7-yanaijie@huawei.com>
 <20190828045454.GB17757@home.buserror.net>
 <2db76c55-df5f-5ca8-f0a6-bcee75b8edaa@c-s.fr>
From: Jason Yan <yanaijie@huawei.com>
Message-ID: <11ef88f7-e418-c48e-f96c-1256c1179bca@huawei.com>
Date: Thu, 29 Aug 2019 14:26:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <2db76c55-df5f-5ca8-f0a6-bcee75b8edaa@c-s.fr>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.177.96.203]
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
Cc: wangkefeng.wang@huawei.com, keescook@chromium.org,
 kernel-hardening@lists.openwall.com, thunder.leizhen@huawei.com,
 linux-kernel@vger.kernel.org, npiggin@gmail.com, jingxiangfeng@huawei.com,
 diana.craciun@nxp.com, paulus@samba.org, zhaohongjiang@huawei.com,
 fanchengyang@huawei.com, linuxppc-dev@lists.ozlabs.org, yebin10@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2019/8/28 13:47, Christophe Leroy wrote:
> 
> 
> Le 28/08/2019 à 06:54, Scott Wood a écrit :
>> On Fri, Aug 09, 2019 at 06:07:54PM +0800, Jason Yan wrote:
>>> This patch add support to boot kernel from places other than KERNELBASE.
>>> Since CONFIG_RELOCATABLE has already supported, what we need to do is
>>> map or copy kernel to a proper place and relocate. Freescale Book-E
>>> parts expect lowmem to be mapped by fixed TLB entries(TLB1). The TLB1
>>> entries are not suitable to map the kernel directly in a randomized
>>> region, so we chose to copy the kernel to a proper place and restart to
>>> relocate.
>>>
>>> The offset of the kernel was not randomized yet(a fixed 64M is set). We
>>> will randomize it in the next patch.
>>>
>>> Signed-off-by: Jason Yan <yanaijie@huawei.com>
>>> Cc: Diana Craciun <diana.craciun@nxp.com>
>>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>>> Cc: Christophe Leroy <christophe.leroy@c-s.fr>
>>> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>>> Cc: Paul Mackerras <paulus@samba.org>
>>> Cc: Nicholas Piggin <npiggin@gmail.com>
>>> Cc: Kees Cook <keescook@chromium.org>
>>> Tested-by: Diana Craciun <diana.craciun@nxp.com>
>>> Reviewed-by: Christophe Leroy <christophe.leroy@c-s.fr>
>>> ---
>>>   arch/powerpc/Kconfig                          | 11 ++++
>>>   arch/powerpc/kernel/Makefile                  |  1 +
>>>   arch/powerpc/kernel/early_32.c                |  2 +-
>>>   arch/powerpc/kernel/fsl_booke_entry_mapping.S | 17 +++--
>>>   arch/powerpc/kernel/head_fsl_booke.S          | 13 +++-
>>>   arch/powerpc/kernel/kaslr_booke.c             | 62 +++++++++++++++++++
>>>   arch/powerpc/mm/mmu_decl.h                    |  7 +++
>>>   arch/powerpc/mm/nohash/fsl_booke.c            |  7 ++-
>>>   8 files changed, 105 insertions(+), 15 deletions(-)
>>>   create mode 100644 arch/powerpc/kernel/kaslr_booke.c
>>>
> 
> [...]
> 
>>> diff --git a/arch/powerpc/kernel/kaslr_booke.c 
>>> b/arch/powerpc/kernel/kaslr_booke.c
>>> new file mode 100644
>>> index 000000000000..f8dc60534ac1
>>> --- /dev/null
>>> +++ b/arch/powerpc/kernel/kaslr_booke.c
>>
>> Shouldn't this go under arch/powerpc/mm/nohash?
>>
>>> +/*
>>> + * To see if we need to relocate the kernel to a random offset
>>> + * void *dt_ptr - address of the device tree
>>> + * phys_addr_t size - size of the first memory block
>>> + */
>>> +notrace void __init kaslr_early_init(void *dt_ptr, phys_addr_t size)
>>> +{
>>> +    unsigned long tlb_virt;
>>> +    phys_addr_t tlb_phys;
>>> +    unsigned long offset;
>>> +    unsigned long kernel_sz;
>>> +
>>> +    kernel_sz = (unsigned long)_end - KERNELBASE;
>>
>> Why KERNELBASE and not kernstart_addr?
>>
>>> +
>>> +    offset = kaslr_choose_location(dt_ptr, size, kernel_sz);
>>> +
>>> +    if (offset == 0)
>>> +        return;
>>> +
>>> +    kernstart_virt_addr += offset;
>>> +    kernstart_addr += offset;
>>> +
>>> +    is_second_reloc = 1;
>>> +
>>> +    if (offset >= SZ_64M) {
>>> +        tlb_virt = round_down(kernstart_virt_addr, SZ_64M);
>>> +        tlb_phys = round_down(kernstart_addr, SZ_64M);
>>
>> If kernstart_addr wasn't 64M-aligned before adding offset, then "offset
>>> = SZ_64M" is not necessarily going to detect when you've crossed a
>> mapping boundary.
>>
>>> +
>>> +        /* Create kernel map to relocate in */
>>> +        create_tlb_entry(tlb_phys, tlb_virt, 1);
>>> +    }
>>> +
>>> +    /* Copy the kernel to it's new location and run */
>>> +    memcpy((void *)kernstart_virt_addr, (void *)KERNELBASE, kernel_sz);
>>> +
>>> +    reloc_kernel_entry(dt_ptr, kernstart_virt_addr);
>>> +}
>>
>> After copying, call flush_icache_range() on the destination.
> 
> Function copy_and_flush() does the copy and the flush. I think it should 
> be used instead of memcpy() + flush_icache_range()
> 

Hi Christophe,

Thanks for the suggestion. But I think copy_and_flush() is not included 
in fsl booke code, maybe move this function to misc.S?

> Christophe
> 
> .
> 

