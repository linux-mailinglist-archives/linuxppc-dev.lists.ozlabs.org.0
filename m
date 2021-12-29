Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A87A4811D6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Dec 2021 12:02:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JP7lF0wdfz3c5V
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Dec 2021 22:02:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com;
 envelope-from=wangkefeng.wang@huawei.com; receiver=<UNKNOWN>)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JP7kk2HK9z2ywm
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Dec 2021 22:01:31 +1100 (AEDT)
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4JP7jM6zDdz9rvr;
 Wed, 29 Dec 2021 19:00:23 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 29 Dec 2021 19:01:20 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.20; Wed, 29 Dec 2021 19:01:19 +0800
Message-ID: <6cd5deb3-b71d-1058-f992-1c2f93c16ea4@huawei.com>
Date: Wed, 29 Dec 2021 19:01:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 3/3] x86: Support huge vmalloc mappings
Content-Language: en-US
To: Dave Hansen <dave.hansen@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Andrew Morton <akpm@linux-foundation.org>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mm@kvack.org>, <x86@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>
References: <20211227145903.187152-1-wangkefeng.wang@huawei.com>
 <20211227145903.187152-4-wangkefeng.wang@huawei.com>
 <70ff58bc-3a92-55c2-2da8-c5877af72e44@intel.com>
 <3858de1f-cdbc-ff52-2890-4254d0f48b0a@huawei.com>
 <31a75f95-6e6e-b640-2d95-08a95ea8cf51@intel.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <31a75f95-6e6e-b640-2d95-08a95ea8cf51@intel.com>
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
Cc: Matthew Wilcox <willy@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Nicholas Piggin <npiggin@gmail.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, Paul Mackerras <paulus@samba.org>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 2021/12/29 0:14, Dave Hansen wrote:
> On 12/28/21 2:26 AM, Kefeng Wang wrote:
>>>> There are some disadvantages about this feature[2], one of the main
>>>> concerns is the possible memory fragmentation/waste in some scenarios,
>>>> also archs must ensure that any arch specific vmalloc allocations that
>>>> require PAGE_SIZE mappings(eg, module alloc with STRICT_MODULE_RWX)
>>>> use the VM_NO_HUGE_VMAP flag to inhibit larger mappings.
>>> That just says that x86 *needs* PAGE_SIZE allocations.  But, what
>>> happens if VM_NO_HUGE_VMAP is not passed (like it was in v1)?  Will the
>>> subsequent permission changes just fragment the 2M mapping?
>> Yes, without VM_NO_HUGE_VMAP, it could fragment the 2M mapping.
>>
>> When module alloc with STRICT_MODULE_RWX on x86, it calls
>> __change_page_attr()
>>
>> from set_memory_ro/rw/nx which will split large page, so there is no
>> need to make
>>
>> module alloc with HUGE_VMALLOC.
> This all sounds very fragile to me.  Every time a new architecture would
> get added for huge vmalloc() support, the developer needs to know to go
> find that architecture's module_alloc() and add this flag.  They next
> guy is going to forget, just like you did.
>
> Considering that this is not a hot path, a weak function would be a nice
> choice:
>
> /* vmalloc() flags used for all module allocations. */
> unsigned long __weak arch_module_vm_flags()
> {
> 	/*
> 	 * Modules use a single, large vmalloc().  Different
> 	 * permissions are applied later and will fragment
> 	 * huge mappings.  Avoid using huge pages for modules.
> 	 */
> 	return VM_NO_HUGE_VMAP;

For x86, it only fragment, but for arm64, due to apply_to_page_range() in

set_memory_*, without this flag maybe crash. Whatever, we need this

flag for module.

> }
>
> Stick that in some the common module code, next to:
>
>> void * __weak module_alloc(unsigned long size)
>> {
>>          return __vmalloc_node_range(size, 1, VMALLOC_START, VMALLOC_END,
> ...
>
> Then, put arch_module_vm_flags() in *all* of the module_alloc()
> implementations, including the generic one.  That way (even with a new
> architecture) whoever copies-and-pastes their module_alloc()
> implementation is likely to get it right.  The next guy who just does a
> "select HAVE_ARCH_HUGE_VMALLOC" will hopefully just work.

OK， Let me check the VM_FLUSH_RESET_PERMS and try about this way.

Thanks.

>
> VM_FLUSH_RESET_PERMS could probably be dealt with in the same way.
> .
