Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 564B352D0AE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 May 2022 12:40:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L3mZm6T82z3c2h
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 May 2022 20:40:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com;
 envelope-from=tongtiangen@huawei.com; receiver=<UNKNOWN>)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L3mZG3whvz3004
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 May 2022 20:39:29 +1000 (AEST)
Received: from kwepemi100004.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4L3mWj3ZpKzgYNX;
 Thu, 19 May 2022 18:37:21 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 kwepemi100004.china.huawei.com (7.221.188.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 19 May 2022 18:38:44 +0800
Received: from [10.174.179.234] (10.174.179.234) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 19 May 2022 18:38:42 +0800
Message-ID: <151148fe-cd9d-eb81-6aeb-3aae1691b3dd@huawei.com>
Date: Thu, 19 May 2022 18:38:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH -next v4 7/7] arm64: add cow to machine check safe
To: Mark Rutland <mark.rutland@arm.com>
References: <20220420030418.3189040-1-tongtiangen@huawei.com>
 <20220420030418.3189040-8-tongtiangen@huawei.com> <Yn581SnKPGlhbgoU@lakrids>
From: Tong Tiangen <tongtiangen@huawei.com>
In-Reply-To: <Yn581SnKPGlhbgoU@lakrids>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.234]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600017.china.huawei.com (7.193.23.234)
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, Guohanjun <guohanjun@huawei.com>,
 Will Deacon <will@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>,
 x86@kernel.org, Ingo Molnar <mingo@redhat.com>, Catalin
 Marinas <catalin.marinas@arm.com>, Xie XiuQi <xiexiuqi@huawei.com>,
 Borislav Petkov <bp@alien8.de>, Alexander
 Viro <viro@zeniv.linux.org.uk>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>,
 linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



在 2022/5/13 23:44, Mark Rutland 写道:
> On Wed, Apr 20, 2022 at 03:04:18AM +0000, Tong Tiangen wrote:
>> In the cow(copy on write) processing, the data of the user process is
>> copied, when hardware memory error is encountered during copy, only the
>> relevant processes are affected, so killing the user process and isolate
>> the user page with hardware memory errors is a more reasonable choice than
>> kernel panic.
> 
> There are plenty of other places we'll access user pages via a kernel
> alias (e.g. when performing IO), so why is this special?
> 
> To be clear, I am not entirely averse to this, but it seems like this is
> being done because it's easy to do rather than necessarily being all
> that useful, and I'm not keen on having to duplicate a bunch of logic
> for this.

Yeah, There are lots of cases, COW is selected because it is more 
general. In addition, this provides the machine check safe capability of 
page copy(copy_highpage_mc), valuable cases can be based on this step by 
step[1].

[1]https://lore.kernel.org/all/20220429000947.2172219-1-jiaqiyan@google.com/T/

Thanks,
Tong.

> 
>> Add new helper copy_page_mc() which provide a page copy implementation with
>> machine check safe. At present, only used in cow. In future, we can expand
>> more scenes. As long as the consequences of page copy failure are not
>> fatal(eg: only affect user process), we can use this helper.
>>
>> The copy_page_mc() in copy_page_mc.S is largely borrows from copy_page()
>> in copy_page.S and the main difference is copy_page_mc() add extable entry
>> to every load/store insn to support machine check safe. largely to keep the
>> patch simple. If needed those optimizations can be folded in.
>>
>> Add new extable type EX_TYPE_COPY_PAGE_MC which used in copy_page_mc().
>>
>> This type only be processed in fixup_exception_mc(), The reason is that
>> copy_page_mc() is consistent with copy_page() except machine check safe is
>> considered, and copy_page() do not need to consider exception fixup.
>>
>> Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
>> ---
>>   arch/arm64/include/asm/asm-extable.h |  5 ++
>>   arch/arm64/include/asm/page.h        | 10 ++++
>>   arch/arm64/lib/Makefile              |  2 +
>>   arch/arm64/lib/copy_page_mc.S        | 86 ++++++++++++++++++++++++++++
>>   arch/arm64/mm/copypage.c             | 36 ++++++++++--
>>   arch/arm64/mm/extable.c              |  2 +
>>   include/linux/highmem.h              |  8 +++
>>   mm/memory.c                          |  2 +-
>>   8 files changed, 144 insertions(+), 7 deletions(-)
>>   create mode 100644 arch/arm64/lib/copy_page_mc.S
>>
>> diff --git a/arch/arm64/include/asm/asm-extable.h b/arch/arm64/include/asm/asm-extable.h
>> index 80410899a9ad..74c056ddae15 100644
>> --- a/arch/arm64/include/asm/asm-extable.h
>> +++ b/arch/arm64/include/asm/asm-extable.h
>> @@ -14,6 +14,7 @@
>>   /* _MC indicates that can fixup from machine check errors */
>>   #define EX_TYPE_UACCESS_MC		5
>>   #define EX_TYPE_UACCESS_MC_ERR_ZERO	6
>> +#define EX_TYPE_COPY_PAGE_MC		7
>>   
>>   #ifdef __ASSEMBLY__
>>   
>> @@ -42,6 +43,10 @@
>>   	__ASM_EXTABLE_RAW(\insn, \fixup, EX_TYPE_UACCESS_MC, 0)
>>   	.endm
>>   
>> +	.macro          _asm_extable_copy_page_mc, insn, fixup
>> +	__ASM_EXTABLE_RAW(\insn, \fixup, EX_TYPE_COPY_PAGE_MC, 0)
>> +	.endm
>> +
>>   /*
>>    * Create an exception table entry for `insn` if `fixup` is provided. Otherwise
>>    * do nothing.
>> diff --git a/arch/arm64/include/asm/page.h b/arch/arm64/include/asm/page.h
>> index 993a27ea6f54..832571a7dddb 100644
>> --- a/arch/arm64/include/asm/page.h
>> +++ b/arch/arm64/include/asm/page.h
>> @@ -29,6 +29,16 @@ void copy_user_highpage(struct page *to, struct page *from,
>>   void copy_highpage(struct page *to, struct page *from);
>>   #define __HAVE_ARCH_COPY_HIGHPAGE
>>   
>> +#ifdef CONFIG_ARCH_HAS_COPY_MC
>> +extern void copy_page_mc(void *to, const void *from);
>> +void copy_highpage_mc(struct page *to, struct page *from);
>> +#define __HAVE_ARCH_COPY_HIGHPAGE_MC
>> +
>> +void copy_user_highpage_mc(struct page *to, struct page *from,
>> +		unsigned long vaddr, struct vm_area_struct *vma);
>> +#define __HAVE_ARCH_COPY_USER_HIGHPAGE_MC
>> +#endif
>> +
>>   struct page *alloc_zeroed_user_highpage_movable(struct vm_area_struct *vma,
>>   						unsigned long vaddr);
>>   #define __HAVE_ARCH_ALLOC_ZEROED_USER_HIGHPAGE_MOVABLE
>> diff --git a/arch/arm64/lib/Makefile b/arch/arm64/lib/Makefile
>> index 29490be2546b..0d9f292ef68a 100644
>> --- a/arch/arm64/lib/Makefile
>> +++ b/arch/arm64/lib/Makefile
>> @@ -15,6 +15,8 @@ endif
>>   
>>   lib-$(CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE) += uaccess_flushcache.o
>>   
>> +lib-$(CONFIG_ARCH_HAS_COPY_MC) += copy_page_mc.o
>> +
>>   obj-$(CONFIG_CRC32) += crc32.o
>>   
>>   obj-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
>> diff --git a/arch/arm64/lib/copy_page_mc.S b/arch/arm64/lib/copy_page_mc.S
>> new file mode 100644
>> index 000000000000..655161363dcf
>> --- /dev/null
>> +++ b/arch/arm64/lib/copy_page_mc.S
>> @@ -0,0 +1,86 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (C) 2012 ARM Ltd.
>> + */
>> +
>> +#include <linux/linkage.h>
>> +#include <linux/const.h>
>> +#include <asm/assembler.h>
>> +#include <asm/page.h>
>> +#include <asm/cpufeature.h>
>> +#include <asm/alternative.h>
>> +#include <asm/asm-extable.h>
>> +
>> +#define CPY_MC(l, x...)		\
>> +9999:   x;			\
>> +	_asm_extable_copy_page_mc    9999b, l
>> +
>> +/*
>> + * Copy a page from src to dest (both are page aligned) with machine check
>> + *
>> + * Parameters:
>> + *	x0 - dest
>> + *	x1 - src
>> + */
>> +SYM_FUNC_START(__pi_copy_page_mc)
>> +alternative_if ARM64_HAS_NO_HW_PREFETCH
>> +	// Prefetch three cache lines ahead.
>> +	prfm	pldl1strm, [x1, #128]
>> +	prfm	pldl1strm, [x1, #256]
>> +	prfm	pldl1strm, [x1, #384]
>> +alternative_else_nop_endif
>> +
>> +CPY_MC(9998f, ldp	x2, x3, [x1])
>> +CPY_MC(9998f, ldp	x4, x5, [x1, #16])
>> +CPY_MC(9998f, ldp	x6, x7, [x1, #32])
>> +CPY_MC(9998f, ldp	x8, x9, [x1, #48])
>> +CPY_MC(9998f, ldp	x10, x11, [x1, #64])
>> +CPY_MC(9998f, ldp	x12, x13, [x1, #80])
>> +CPY_MC(9998f, ldp	x14, x15, [x1, #96])
>> +CPY_MC(9998f, ldp	x16, x17, [x1, #112])
>> +
>> +	add	x0, x0, #256
>> +	add	x1, x1, #128
>> +1:
>> +	tst	x0, #(PAGE_SIZE - 1)
>> +
>> +alternative_if ARM64_HAS_NO_HW_PREFETCH
>> +	prfm	pldl1strm, [x1, #384]
>> +alternative_else_nop_endif
>> +
>> +CPY_MC(9998f, stnp	x2, x3, [x0, #-256])
>> +CPY_MC(9998f, ldp	x2, x3, [x1])
>> +CPY_MC(9998f, stnp	x4, x5, [x0, #16 - 256])
>> +CPY_MC(9998f, ldp	x4, x5, [x1, #16])
>> +CPY_MC(9998f, stnp	x6, x7, [x0, #32 - 256])
>> +CPY_MC(9998f, ldp	x6, x7, [x1, #32])
>> +CPY_MC(9998f, stnp	x8, x9, [x0, #48 - 256])
>> +CPY_MC(9998f, ldp	x8, x9, [x1, #48])
>> +CPY_MC(9998f, stnp	x10, x11, [x0, #64 - 256])
>> +CPY_MC(9998f, ldp	x10, x11, [x1, #64])
>> +CPY_MC(9998f, stnp	x12, x13, [x0, #80 - 256])
>> +CPY_MC(9998f, ldp	x12, x13, [x1, #80])
>> +CPY_MC(9998f, stnp	x14, x15, [x0, #96 - 256])
>> +CPY_MC(9998f, ldp	x14, x15, [x1, #96])
>> +CPY_MC(9998f, stnp	x16, x17, [x0, #112 - 256])
>> +CPY_MC(9998f, ldp	x16, x17, [x1, #112])
>> +
>> +	add	x0, x0, #128
>> +	add	x1, x1, #128
>> +
>> +	b.ne	1b
>> +
>> +CPY_MC(9998f, stnp	x2, x3, [x0, #-256])
>> +CPY_MC(9998f, stnp	x4, x5, [x0, #16 - 256])
>> +CPY_MC(9998f, stnp	x6, x7, [x0, #32 - 256])
>> +CPY_MC(9998f, stnp	x8, x9, [x0, #48 - 256])
>> +CPY_MC(9998f, stnp	x10, x11, [x0, #64 - 256])
>> +CPY_MC(9998f, stnp	x12, x13, [x0, #80 - 256])
>> +CPY_MC(9998f, stnp	x14, x15, [x0, #96 - 256])
>> +CPY_MC(9998f, stnp	x16, x17, [x0, #112 - 256])
>> +
>> +9998:	ret
>> +
>> +SYM_FUNC_END(__pi_copy_page_mc)
>> +SYM_FUNC_ALIAS(copy_page_mc, __pi_copy_page_mc)
>> +EXPORT_SYMBOL(copy_page_mc)
>> diff --git a/arch/arm64/mm/copypage.c b/arch/arm64/mm/copypage.c
>> index 0dea80bf6de4..0f28edfcb234 100644
>> --- a/arch/arm64/mm/copypage.c
>> +++ b/arch/arm64/mm/copypage.c
>> @@ -14,13 +14,8 @@
>>   #include <asm/cpufeature.h>
>>   #include <asm/mte.h>
>>   
>> -void copy_highpage(struct page *to, struct page *from)
>> +static void do_mte(struct page *to, struct page *from, void *kto, void *kfrom)
>>   {
>> -	void *kto = page_address(to);
>> -	void *kfrom = page_address(from);
>> -
>> -	copy_page(kto, kfrom);
>> -
>>   	if (system_supports_mte() && test_bit(PG_mte_tagged, &from->flags)) {
>>   		set_bit(PG_mte_tagged, &to->flags);
>>   		page_kasan_tag_reset(to);
>> @@ -35,6 +30,15 @@ void copy_highpage(struct page *to, struct page *from)
>>   		mte_copy_page_tags(kto, kfrom);
>>   	}
>>   }
>> +
>> +void copy_highpage(struct page *to, struct page *from)
>> +{
>> +	void *kto = page_address(to);
>> +	void *kfrom = page_address(from);
>> +
>> +	copy_page(kto, kfrom);
>> +	do_mte(to, from, kto, kfrom);
>> +}
>>   EXPORT_SYMBOL(copy_highpage);
>>   
>>   void copy_user_highpage(struct page *to, struct page *from,
>> @@ -44,3 +48,23 @@ void copy_user_highpage(struct page *to, struct page *from,
>>   	flush_dcache_page(to);
>>   }
>>   EXPORT_SYMBOL_GPL(copy_user_highpage);
>> +
>> +#ifdef CONFIG_ARCH_HAS_COPY_MC
>> +void copy_highpage_mc(struct page *to, struct page *from)
>> +{
>> +	void *kto = page_address(to);
>> +	void *kfrom = page_address(from);
>> +
>> +	copy_page_mc(kto, kfrom);
>> +	do_mte(to, from, kto, kfrom);
>> +}
>> +EXPORT_SYMBOL(copy_highpage_mc);
> 
> IIUC the do_mte() portion won't handle mermoy errors, so this isn't
> actually going to recover safely.
> 
> Thanks,
> Mark.

OK, Missing that, do_mte needs to be handled.

Thanks,
Tong.

> 
>> +
>> +void copy_user_highpage_mc(struct page *to, struct page *from,
>> +			unsigned long vaddr, struct vm_area_struct *vma)
>> +{
>> +	copy_highpage_mc(to, from);
>> +	flush_dcache_page(to);
>> +}
>> +EXPORT_SYMBOL_GPL(copy_user_highpage_mc);
>> +#endif
>> diff --git a/arch/arm64/mm/extable.c b/arch/arm64/mm/extable.c
>> index 1023ccdb2f89..4c882d36dd64 100644
>> --- a/arch/arm64/mm/extable.c
>> +++ b/arch/arm64/mm/extable.c
>> @@ -110,6 +110,8 @@ bool fixup_exception_mc(struct pt_regs *regs)
>>   		return ex_handler_uaccess_type(ex, regs, FIXUP_TYPE_MC);
>>   	case EX_TYPE_UACCESS_MC_ERR_ZERO:
>>   		return ex_handler_uaccess_err_zero(ex, regs);
>> +	case EX_TYPE_COPY_PAGE_MC:
>> +		return ex_handler_fixup(ex, regs);
>>   
>>   	}
>>   
>> diff --git a/include/linux/highmem.h b/include/linux/highmem.h
>> index 39bb9b47fa9c..a9dbf331b038 100644
>> --- a/include/linux/highmem.h
>> +++ b/include/linux/highmem.h
>> @@ -283,6 +283,10 @@ static inline void copy_user_highpage(struct page *to, struct page *from,
>>   
>>   #endif
>>   
>> +#ifndef __HAVE_ARCH_COPY_USER_HIGHPAGE_MC
>> +#define copy_user_highpage_mc copy_user_highpage
>> +#endif
>> +
>>   #ifndef __HAVE_ARCH_COPY_HIGHPAGE
>>   
>>   static inline void copy_highpage(struct page *to, struct page *from)
>> @@ -298,6 +302,10 @@ static inline void copy_highpage(struct page *to, struct page *from)
>>   
>>   #endif
>>   
>> +#ifndef __HAVE_ARCH_COPY_HIGHPAGE_MC
>> +#define cop_highpage_mc copy_highpage
>> +#endif
>> +
>>   static inline void memcpy_page(struct page *dst_page, size_t dst_off,
>>   			       struct page *src_page, size_t src_off,
>>   			       size_t len)
>> diff --git a/mm/memory.c b/mm/memory.c
>> index 76e3af9639d9..d5f62234152d 100644
>> --- a/mm/memory.c
>> +++ b/mm/memory.c
>> @@ -2767,7 +2767,7 @@ static inline bool cow_user_page(struct page *dst, struct page *src,
>>   	unsigned long addr = vmf->address;
>>   
>>   	if (likely(src)) {
>> -		copy_user_highpage(dst, src, addr, vma);
>> +		copy_user_highpage_mc(dst, src, addr, vma);
>>   		return true;
>>   	}
>>   
>> -- 
>> 2.25.1
>>
> .
