Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2107C480582
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Dec 2021 02:37:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JNHGP0p4bz3c9D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Dec 2021 12:37:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com;
 envelope-from=wangkefeng.wang@huawei.com; receiver=<UNKNOWN>)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JNHFs2WG6z2yfb
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Dec 2021 12:37:00 +1100 (AEDT)
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4JNHDb4YjGz91ys;
 Tue, 28 Dec 2021 09:35:59 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 28 Dec 2021 09:36:54 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.20; Tue, 28 Dec 2021 09:36:53 +0800
Message-ID: <8f30057e-da61-55b4-adf7-e35d91798806@huawei.com>
Date: Tue, 28 Dec 2021 09:36:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: (No subject)
Content-Language: en-US
To: William Kucharski <william.kucharski@oracle.com>
References: <20211227145903.187152-3-wangkefeng.wang@huawei.com>
 <E2C9DE8E-F5D9-46E9-9298-B632A202B080@oracle.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <E2C9DE8E-F5D9-46E9-9298-B632A202B080@oracle.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggeme702-chm.china.huawei.com (10.1.199.98) To
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
Cc: "x86@kernel.org" <x86@kernel.org>, Will Deacon <will@kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Matthew Wilcox <willy@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 2021/12/28 1:35, William Kucharski wrote:
> You should also fix the existing typo in the documentation (inline):
>
>> On Dec 27, 2021, at 07:49, Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
>>
>> ﻿This patch select HAVE_ARCH_HUGE_VMALLOC to let arm64 support huge
>> vmalloc mappings.
>>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Will Deacon <will@kernel.org>
>> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
>> ---
>> Documentation/admin-guide/kernel-parameters.txt | 4 ++--
>> arch/arm64/Kconfig                              | 1 +
>> arch/arm64/kernel/module.c                      | 5 +++--
>> 3 files changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
>> index 7b2f900fd243..e3f9fd7ec106 100644
>> --- a/Documentation/admin-guide/kernel-parameters.txt
>> +++ b/Documentation/admin-guide/kernel-parameters.txt
>> @@ -1639,7 +1639,7 @@
>>             precedence over memory_hotplug.memmap_on_memory.
>>
>>
>> -    hugevmalloc=    [PPC] Reguires CONFIG_HAVE_ARCH_HUGE_VMALLOC
>> +    hugevmalloc=    [KNL,PPC,ARM64] Reguires CONFIG_HAVE_ARCH_HUGE_VMALLOC
>>             Format: { on | off }
>>             Default set by CONFIG_HUGE_VMALLOC_DEFAULT_ENABLED.
> "Reguires" should be "Requires."
Will fix, thanks.
>
>> @@ -3424,7 +3424,7 @@
>>
>>     nohugeiomap    [KNL,X86,PPC,ARM64] Disable kernel huge I/O mappings.
>>
>> -    nohugevmalloc    [PPC] Disable kernel huge vmalloc mappings.
>> +    nohugevmalloc    [KNL,PPC,ARM64] Disable kernel huge vmalloc mappings.
>>
>>     nosmt        [KNL,S390] Disable symmetric multithreading (SMT).
>>             Equivalent to smt=1.
>> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
>> index 3bb0b67292b5..c34bbb4482b0 100644
>> --- a/arch/arm64/Kconfig
>> +++ b/arch/arm64/Kconfig
>> @@ -142,6 +142,7 @@ config ARM64
>>     select HAVE_ARCH_AUDITSYSCALL
>>     select HAVE_ARCH_BITREVERSE
>>     select HAVE_ARCH_COMPILER_H
>> +    select HAVE_ARCH_HUGE_VMALLOC
>>     select HAVE_ARCH_HUGE_VMAP
>>     select HAVE_ARCH_JUMP_LABEL
>>     select HAVE_ARCH_JUMP_LABEL_RELATIVE
>> diff --git a/arch/arm64/kernel/module.c b/arch/arm64/kernel/module.c
>> index 309a27553c87..af7b4cbace2b 100644
>> --- a/arch/arm64/kernel/module.c
>> +++ b/arch/arm64/kernel/module.c
>> @@ -36,7 +36,8 @@ void *module_alloc(unsigned long size)
>>         module_alloc_end = MODULES_END;
>>
>>     p = __vmalloc_node_range(size, MODULE_ALIGN, module_alloc_base,
>> -                module_alloc_end, gfp_mask, PAGE_KERNEL, VM_DEFER_KMEMLEAK,
>> +                module_alloc_end, gfp_mask, PAGE_KERNEL,
>> +                VM_DEFER_KMEMLEAK | VM_NO_HUGE_VMAP,
>>                 NUMA_NO_NODE, __builtin_return_address(0));
>>
>>     if (!p && IS_ENABLED(CONFIG_ARM64_MODULE_PLTS) &&
>> @@ -55,7 +56,7 @@ void *module_alloc(unsigned long size)
>>          */
>>         p = __vmalloc_node_range(size, MODULE_ALIGN, module_alloc_base,
>>                 module_alloc_base + SZ_2G, GFP_KERNEL,
>> -                PAGE_KERNEL, 0, NUMA_NO_NODE,
>> +                PAGE_KERNEL, VM_NO_HUGE_VMAP, NUMA_NO_NODE,
>>                 __builtin_return_address(0));
>>
>>     if (p && (kasan_module_alloc(p, size, gfp_mask) < 0)) {
>> -- 
>> 2.26.2
>>
>>
