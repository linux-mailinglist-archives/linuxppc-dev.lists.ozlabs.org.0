Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E4D493B1E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jan 2022 14:33:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jf665205Fz3cCM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jan 2022 00:33:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com;
 envelope-from=wangkefeng.wang@huawei.com; receiver=<UNKNOWN>)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jf65c4ltGz2ynM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jan 2022 00:32:51 +1100 (AEDT)
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Jf60Y3G8kzZfHP;
 Wed, 19 Jan 2022 21:28:29 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 19 Jan 2022 21:32:15 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.21; Wed, 19 Jan 2022 21:32:14 +0800
Message-ID: <e9961fc7-30c7-1b1f-0b38-d23891c60284@huawei.com>
Date: Wed, 19 Jan 2022 21:32:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 3/3] x86: Support huge vmalloc mappings
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, Andrew Morton
 <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, Dave Hansen
 <dave.hansen@intel.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mm@kvack.org>, <linuxppc-dev@lists.ozlabs.org>, <x86@kernel.org>
References: <20211227145903.187152-1-wangkefeng.wang@huawei.com>
 <20211227145903.187152-4-wangkefeng.wang@huawei.com>
 <70ff58bc-3a92-55c2-2da8-c5877af72e44@intel.com>
 <3858de1f-cdbc-ff52-2890-4254d0f48b0a@huawei.com>
 <31a75f95-6e6e-b640-2d95-08a95ea8cf51@intel.com>
 <1642472965.lgfksp6krp.astroid@bobo.none>
 <4488d39f-0698-7bfd-b81c-1e609821818f@intel.com>
 <1642565468.c0jax91tvn.astroid@bobo.none>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <1642565468.c0jax91tvn.astroid@bobo.none>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggeme705-chm.china.huawei.com (10.1.199.101) To
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
Cc: Matthew Wilcox <willy@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H.
 Peter Anvin" <hpa@zytor.com>, Paul Mackerras <paulus@samba.org>, Thomas
 Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 2022/1/19 12:17, Nicholas Piggin wrote:
> Excerpts from Dave Hansen's message of January 19, 2022 3:28 am:
>> On 1/17/22 6:46 PM, Nicholas Piggin wrote:
>>>> This all sounds very fragile to me.  Every time a new architecture would
>>>> get added for huge vmalloc() support, the developer needs to know to go
>>>> find that architecture's module_alloc() and add this flag.
>>> This is documented in the Kconfig.
>>>
>>>   #
>>>   #  Archs that select this would be capable of PMD-sized vmaps (i.e.,
>>>   #  arch_vmap_pmd_supported() returns true), and they must make no assumptions
>>>   #  that vmalloc memory is mapped with PAGE_SIZE ptes. The VM_NO_HUGE_VMAP flag
>>>   #  can be used to prohibit arch-specific allocations from using hugepages to
>>>   #  help with this (e.g., modules may require it).
>>>   #
>>>   config HAVE_ARCH_HUGE_VMALLOC
>>>           depends on HAVE_ARCH_HUGE_VMAP
>>>           bool
>>>
>>> Is it really fair to say it's *very* fragile? Surely it's reasonable to
>>> read the (not very long) documentation ad understand the consequences for
>>> the arch code before enabling it.
>> Very fragile or not, I think folks are likely to get it wrong.  It would
>> be nice to have it default *everyone* to safe and slow and make *sure*
> It's not safe to enable though. That's the problem. If it was just
> modules then you'd have a point but it could be anything.
>
>> they go look at the architecture modules code itself before enabling
>> this for modules.
> This is required not just for modules for the whole arch code, it
> has to be looked at and decided this will work.
>
>> Just from that Kconfig text, I don't think I'd know off the top of my
>> head what do do for x86, or what code I needed to go touch.
> You have to make sure arch/x86 makes no assumptions that vmalloc memory
> is backed by PAGE_SIZE ptes. If you can't do that then you shouldn't
> enable the option. The option can not explain it any more because any
> arch could do anything with its mappings. The module code is an example,
> not the recipe.

Hi Nick, Dave and Christophe，thanks for your review,  a little 
confused,   I think,

1) for ppc/arm64 module_alloc(),  it must set VM_NO_HUGE_VMAP because the

arch's set_memory_* funcitons can only support PAGE_SIZE mapping, due to the

limit of apply_to_page_range().

2) but for x86's module_alloc(), add VM_NO_HUGE_VMAP is to avoid 
fragmentation,

x86's __change_page_attr functions will split the huge mapping. this 
flags is not a must.


and the behavior above occurred when STRICT_MODULE_RWX enabled, so

1) add a unified function to set vm flags(suggested by Dave ) or

2) add vm flags with some comments to per-arch's module_alloc()

are both acceptable, for the way of unified function ,  we could make 
this a default recipe

with STRICT_MODULE_RWX, also make two more vm flags into it, eg,

+unsigned long module_alloc_vm_flags(bool need_flush_reset_perms)
+{
+       unsigned long vm_flags = VM_DEFER_KMEMLEAK;
+
+       if (need_flush_reset_perms)
+               vm_flags |= VM_FLUSH_RESET_PERMS;
+       /*
+        * Modules use a single, large vmalloc(). Different permissions
+        * are applied later and will fragment huge mappings or even
+        * fails in set_memory_* on some architectures. Avoid using
+        * huge pages for modules.
+        */
+       if (IS_ENABLED(CONFIG_STRICT_MODULE_RWX))
+               vm_flags |= VM_NO_HUGE_VMAP;
+
+       return vm_flags;
+}

then called each arch's module_alloc().

Any suggestion, many thanks.


>
> Thanks,
> Nick
> .
