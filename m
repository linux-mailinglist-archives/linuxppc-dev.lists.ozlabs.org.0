Return-Path: <linuxppc-dev+bounces-6161-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C539A353DF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2025 02:46:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YvFJF4kW5z30ML;
	Fri, 14 Feb 2025 12:46:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.255
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739497565;
	cv=none; b=R9+xWw2cCq9WC0v22T718MaI7jB+MOlJRznYQXBD7MBJhChytBlAI5Z/KfTbMvBYhw5x4yNNfXHs5Be1JH4FexN4uMKrDJfYx0braMI/omAEIJzyC0BhrJtNFhZg7IVvrk9QI1myKZdV2C9Ux1Qpn/cFW3tw75L5sUo9FfxQj9bE95BoCk5TRun+Sd6NerwnFI8aXticdnupt8+ScLHEtoP8ySr7FpKEo/ndrrtEIyCnNqfcgGsx3JdC4VueUsHB2yXDU900+O4NKaqiZwRTWTYQBnIWEc0yLvt/gy3/90K8WlnotKEt8L1lY+OhkpUdDV5LgBBS1A9xSk/bIiMKUA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739497565; c=relaxed/relaxed;
	bh=/xou2uZRbnImxMqVFANwRB9AlkIaAnGUiupsZKCr/kI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=mmBFN6giOXadkYm3fiMPsaaWdN+iACcVPxSGTV/x1A/OI8TG23dhP09VlP1wRM+kD2d5twF3CjI0QkxNUpjKr17pmTCbuA1klhp/1imby25ZbwaFkZuBbw+DMhXhbAziRWkL7kaDV/BkL7l44VKbU3wX18JtgJ0r5e3iNz2xZGPfI8X2Lp9AGbkuZUpFEOY5qUBdQP6/YB104oZJCshWdxHjdzVSiq+lWAMrM8N4vw09cJXo5/6iTfw08Fd079YYlYIvbFC7MdrQ6/CG4XFdJ6NrKap/JGrqlAR52tqQ8A3qMq8x0z31udeFe4ljYW2p7m2mwvOTBfaw2aZRjrqtSg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.255; helo=szxga08-in.huawei.com; envelope-from=tongtiangen@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.255; helo=szxga08-in.huawei.com; envelope-from=tongtiangen@huawei.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 81 seconds by postgrey-1.37 at boromir; Fri, 14 Feb 2025 12:46:04 AEDT
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YvFJD1Ll4z2xgv
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2025 12:46:03 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4YvFBx5FCVz1W5g8;
	Fri, 14 Feb 2025 09:41:29 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id CA0DB18032E;
	Fri, 14 Feb 2025 09:45:58 +0800 (CST)
Received: from [10.174.179.234] (10.174.179.234) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 14 Feb 2025 09:45:56 +0800
Message-ID: <6aecab97-5ba8-38dd-1df7-87e5f557017e@huawei.com>
Date: Fri, 14 Feb 2025 09:45:55 +0800
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v13 4/5] arm64: support copy_mc_[user]_highpage()
To: Catalin Marinas <catalin.marinas@arm.com>
CC: Mark Rutland <mark.rutland@arm.com>, Jonathan Cameron
	<Jonathan.Cameron@huawei.com>, Mauro Carvalho Chehab
	<mchehab+huawei@kernel.org>, Will Deacon <will@kernel.org>, Andrew Morton
	<akpm@linux-foundation.org>, James Morse <james.morse@arm.com>, Robin Murphy
	<robin.murphy@arm.com>, Andrey Konovalov <andreyknvl@gmail.com>, Dmitry
 Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko
	<glider@google.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Aneesh
 Kumar K.V <aneesh.kumar@kernel.org>, "Naveen N. Rao"
	<naveen.n.rao@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, <x86@kernel.org>, "H. Peter Anvin"
	<hpa@zytor.com>, Madhavan Srinivasan <maddy@linux.ibm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mm@kvack.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<kasan-dev@googlegroups.com>, <wangkefeng.wang@huawei.com>, Guohanjun
	<guohanjun@huawei.com>
References: <20241209024257.3618492-1-tongtiangen@huawei.com>
 <20241209024257.3618492-5-tongtiangen@huawei.com> <Z6zWSXzKctkpyH7-@arm.com>
From: Tong Tiangen <tongtiangen@huawei.com>
In-Reply-To: <Z6zWSXzKctkpyH7-@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.234]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-Spam-Status: No, score=-3.6 required=5.0 tests=NICE_REPLY_A,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



在 2025/2/13 1:11, Catalin Marinas 写道:
> On Mon, Dec 09, 2024 at 10:42:56AM +0800, Tong Tiangen wrote:
>> Currently, many scenarios that can tolerate memory errors when copying page
>> have been supported in the kernel[1~5], all of which are implemented by
>> copy_mc_[user]_highpage(). arm64 should also support this mechanism.
>>
>> Due to mte, arm64 needs to have its own copy_mc_[user]_highpage()
>> architecture implementation, macros __HAVE_ARCH_COPY_MC_HIGHPAGE and
>> __HAVE_ARCH_COPY_MC_USER_HIGHPAGE have been added to control it.
>>
>> Add new helper copy_mc_page() which provide a page copy implementation with
>> hardware memory error safe. The code logic of copy_mc_page() is the same as
>> copy_page(), the main difference is that the ldp insn of copy_mc_page()
>> contains the fixup type EX_TYPE_KACCESS_ERR_ZERO_MEM_ERR, therefore, the
>> main logic is extracted to copy_page_template.S. In addition, the fixup of
>> MOPS insn is not considered at present.
> 
> Could we not add the exception table entry permanently but ignore the
> exception table entry if it's not on the do_sea() path? That would save
> some code duplication.

The location of the added exception table entry is likely to appear on
the a path, which should not be avoided. What we can do is merge
duplicate code as much as possible, and extract common code into common
files, as we did in this patch.


> 
>> diff --git a/arch/arm64/lib/copy_mc_page.S b/arch/arm64/lib/copy_mc_page.S
>> new file mode 100644
>> index 000000000000..51564828c30c
>> --- /dev/null
>> +++ b/arch/arm64/lib/copy_mc_page.S
>> @@ -0,0 +1,37 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +
>> +#include <linux/linkage.h>
>> +#include <linux/const.h>
>> +#include <asm/assembler.h>
>> +#include <asm/page.h>
>> +#include <asm/cpufeature.h>
>> +#include <asm/alternative.h>
>> +#include <asm/asm-extable.h>
>> +#include <asm/asm-uaccess.h>
>> +
>> +/*
>> + * Copy a page from src to dest (both are page aligned) with memory error safe
>> + *
>> + * Parameters:
>> + *	x0 - dest
>> + *	x1 - src
>> + * Returns:
>> + * 	x0 - Return 0 if copy success, or -EFAULT if anything goes wrong
>> + *	     while copying.
>> + */
>> +	.macro ldp1 reg1, reg2, ptr, val
>> +	KERNEL_MEM_ERR(9998f, ldp \reg1, \reg2, [\ptr, \val])
>> +	.endm
>> +
>> +SYM_FUNC_START(__pi_copy_mc_page)
>> +#include "copy_page_template.S"
>> +
>> +	mov x0, #0
>> +	ret
>> +
>> +9998:	mov x0, #-EFAULT
>> +	ret
>> +
>> +SYM_FUNC_END(__pi_copy_mc_page)
>> +SYM_FUNC_ALIAS(copy_mc_page, __pi_copy_mc_page)
>> +EXPORT_SYMBOL(copy_mc_page)
> [...]
>> diff --git a/arch/arm64/lib/copy_page_template.S b/arch/arm64/lib/copy_page_template.S
>> new file mode 100644
>> index 000000000000..f96c7988c93d
>> --- /dev/null
>> +++ b/arch/arm64/lib/copy_page_template.S
>> @@ -0,0 +1,70 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (C) 2012 ARM Ltd.
>> + */
>> +
>> +/*
>> + * Copy a page from src to dest (both are page aligned)
>> + *
>> + * Parameters:
>> + *	x0 - dest
>> + *	x1 - src
>> + */
>> +
>> +#ifdef CONFIG_AS_HAS_MOPS
>> +	.arch_extension mops
>> +alternative_if_not ARM64_HAS_MOPS
>> +	b	.Lno_mops
>> +alternative_else_nop_endif
>> +
>> +	mov	x2, #PAGE_SIZE
>> +	cpypwn	[x0]!, [x1]!, x2!
>> +	cpymwn	[x0]!, [x1]!, x2!
>> +	cpyewn	[x0]!, [x1]!, x2!
>> +	ret
>> +.Lno_mops:
>> +#endif
> [...]
> 
> So if we have FEAT_MOPS, the machine check won't work?
> 
> Kristina is going to post MOPS support for the uaccess routines soon.
> You can see how they are wired up and do something similar here.
> 
> But I'd prefer if we had the same code, only the exception table entry
> treated differently. Similarly for the MTE tag copying.

Does MOPS also support features similar to memory error safe? I'll see
how he handles it.

> 

