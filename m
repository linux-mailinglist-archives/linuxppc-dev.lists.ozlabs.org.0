Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 685E975FB6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jul 2019 09:22:47 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45w0sc5YKBzDqFv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jul 2019 17:22:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=huawei.com
 (client-ip=45.249.212.190; helo=huawei.com; envelope-from=yanaijie@huawei.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45w0qJ01yJzDqDS
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2019 17:20:41 +1000 (AEST)
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 93A3A94F2B2BF5405892;
 Fri, 26 Jul 2019 15:20:34 +0800 (CST)
Received: from [127.0.0.1] (10.177.96.203) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.439.0; Fri, 26 Jul 2019
 15:20:28 +0800
Subject: Re: [RFC PATCH 00/10] implement KASLR for powerpc/fsl_booke/32
To: Kees Cook <keescook@chromium.org>
References: <20190717080621.40424-1-yanaijie@huawei.com>
 <e6ad41bc-5d5a-cf3f-b308-e1863b4fef99@huawei.com>
 <201907251252.0C58037@keescook>
From: Jason Yan <yanaijie@huawei.com>
Message-ID: <877d818d-b3ec-1cea-d024-4ad6aea7af60@huawei.com>
Date: Fri, 26 Jul 2019 15:20:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <201907251252.0C58037@keescook>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: wangkefeng.wang@huawei.com, kernel-hardening@lists.openwall.com,
 thunder.leizhen@huawei.com, linux-kernel@vger.kernel.org, npiggin@gmail.com,
 jingxiangfeng@huawei.com, diana.craciun@nxp.com, paulus@samba.org,
 fanchengyang@huawei.com, linuxppc-dev@lists.ozlabs.org, yebin10@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2019/7/26 3:58, Kees Cook wrote:
> On Thu, Jul 25, 2019 at 03:16:28PM +0800, Jason Yan wrote:
>> Hi all, any comments?
> 
> I'm a fan of it, but I don't know ppc internals well enough to sanely
> review the code. :) Some comments below on design...
> 

Hi Kees, Thanks for your comments.

>>
>>
>> On 2019/7/17 16:06, Jason Yan wrote:
>>> This series implements KASLR for powerpc/fsl_booke/32, as a security
>>> feature that deters exploit attempts relying on knowledge of the location
>>> of kernel internals.
>>>
>>> Since CONFIG_RELOCATABLE has already supported, what we need to do is
>>> map or copy kernel to a proper place and relocate. Freescale Book-E
>>> parts expect lowmem to be mapped by fixed TLB entries(TLB1). The TLB1
>>> entries are not suitable to map the kernel directly in a randomized
>>> region, so we chose to copy the kernel to a proper place and restart to
>>> relocate.
>>>
>>> Entropy is derived from the banner and timer base, which will change every
>>> build and boot. This not so much safe so additionally the bootloader may
>>> pass entropy via the /chosen/kaslr-seed node in device tree.
> 
> Good: adding kaslr-seed is a good step here. Are there any x86-like
> RDRAND or RDTSC to use? (Or maybe timer base here is similar to x86
> RDTSC here?)
> 

Yes, time base is similar to RDTSC here.

>>>
>>> We will use the first 512M of the low memory to randomize the kernel
>>> image. The memory will be split in 64M zones. We will use the lower 8
>>> bit of the entropy to decide the index of the 64M zone. Then we chose a
>>> 16K aligned offset inside the 64M zone to put the kernel in.
> 
> Does this 16K granularity have any page table performance impact? My
> understanding was that x86 needed to have 2M granularity due to its page
> table layouts.
> 

The fsl booke TLB1 covers the whole low memeory. AFAIK, there is no page 
table performance impact. But if anyone knows there is any regressions, 
please let me know.

> Why the 64M zones instead of just 16K granularity across the entire low
> 512M?
> 

The boot code only maps one 64M zone at early start. If the kernel 
crosses two 64M zones, we need to map two 64M zones. Keep the kernel in 
one 64M saves a lot of complex codes.

>>>
>>>       KERNELBASE
>>>
>>>           |-->   64M   <--|
>>>           |               |
>>>           +---------------+    +----------------+---------------+
>>>           |               |....|    |kernel|    |               |
>>>           +---------------+    +----------------+---------------+
>>>           |                         |
>>>           |----->   offset    <-----|
>>>
>>>                                 kimage_vaddr
>>>
>>> We also check if we will overlap with some areas like the dtb area, the
>>> initrd area or the crashkernel area. If we cannot find a proper area,
>>> kaslr will be disabled and boot from the original kernel.
>>>
>>> Jason Yan (10):
>>>     powerpc: unify definition of M_IF_NEEDED
>>>     powerpc: move memstart_addr and kernstart_addr to init-common.c
>>>     powerpc: introduce kimage_vaddr to store the kernel base
>>>     powerpc/fsl_booke/32: introduce create_tlb_entry() helper
>>>     powerpc/fsl_booke/32: introduce reloc_kernel_entry() helper
>>>     powerpc/fsl_booke/32: implement KASLR infrastructure
>>>     powerpc/fsl_booke/32: randomize the kernel image offset
>>>     powerpc/fsl_booke/kaslr: clear the original kernel if randomized
>>>     powerpc/fsl_booke/kaslr: support nokaslr cmdline parameter
>>>     powerpc/fsl_booke/kaslr: dump out kernel offset information on panic
> 
> Is there anything planned for other fixed-location things, like x86's
> CONFIG_RANDOMIZE_MEMORY?
> 

Yes, if this feature can be accepted, I will start to work with 
powerpc64 KASLR and other things like CONFIG_RANDOMIZE_MEMORY.

