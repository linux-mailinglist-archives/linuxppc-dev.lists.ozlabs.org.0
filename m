Return-Path: <linuxppc-dev+bounces-183-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 000F39576C4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2024 23:46:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnmPV0jTSz2xKL;
	Tue, 20 Aug 2024 07:46:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.187
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=tongtiangen@huawei.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1158 seconds by postgrey-1.37 at boromir; Mon, 19 Aug 2024 23:31:25 AEST
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WnYQj4s2gz2xtb
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2024 23:31:21 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4WnXyw0xzszyQDd;
	Mon, 19 Aug 2024 21:10:48 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (unknown [7.193.23.234])
	by mail.maildlp.com (Postfix) with ESMTPS id D292C140159;
	Mon, 19 Aug 2024 21:11:24 +0800 (CST)
Received: from [10.174.179.234] (10.174.179.234) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 19 Aug 2024 21:11:22 +0800
Message-ID: <b3705724-0d5c-a08a-8703-acbcee3e7861@huawei.com>
Date: Mon, 19 Aug 2024 21:11:21 +0800
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v12 1/6] uaccess: add generic fallback version of
 copy_mc_to_user()
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
CC: Mark Rutland <mark.rutland@arm.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Andrew Morton
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
	<hpa@zytor.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mm@kvack.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <wangkefeng.wang@huawei.com>, Guohanjun
	<guohanjun@huawei.com>
References: <20240528085915.1955987-1-tongtiangen@huawei.com>
 <20240528085915.1955987-2-tongtiangen@huawei.com>
 <20240819105750.00001269@Huawei.com>
From: Tong Tiangen <tongtiangen@huawei.com>
In-Reply-To: <20240819105750.00001269@Huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.234]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600017.china.huawei.com (7.193.23.234)



在 2024/8/19 17:57, Jonathan Cameron 写道:
> On Tue, 28 May 2024 16:59:10 +0800
> Tong Tiangen <tongtiangen@huawei.com> wrote:
> 
>> x86/powerpc has it's implementation of copy_mc_to_user(), we add generic
>> fallback in include/linux/uaccess.h prepare for other architechures to
>> enable CONFIG_ARCH_HAS_COPY_MC.
>>
>> Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
>> Acked-by: Michael Ellerman <mpe@ellerman.id.au>
> Seems like a sensible approach to me given existing fallbacks in x86
> if the relevant features are disabled.
> 
> It may be worth exploring at some point if some of the special casing
> in the callers of this function can also be remove now there
> is a default version. There are some small differences but I've
> not analyzed if they matter or not.
> 
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

copy_mc_to_user() and copy_to_user() have the same logic of copying the 
memory. The main difference is that the MC version can handle the 
hardware error.

The implementation of MC version is related to the architecture. 
Therefore, when the architecture does not implement the MC version, it 
is logically correct to roll back to the no MC version.

Thanks :)

> 
>> ---
>>   arch/powerpc/include/asm/uaccess.h | 1 +
>>   arch/x86/include/asm/uaccess.h     | 1 +
>>   include/linux/uaccess.h            | 8 ++++++++
>>   3 files changed, 10 insertions(+)
>>
>> diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
>> index de10437fd206..df42e6ad647f 100644
>> --- a/arch/powerpc/include/asm/uaccess.h
>> +++ b/arch/powerpc/include/asm/uaccess.h
>> @@ -381,6 +381,7 @@ copy_mc_to_user(void __user *to, const void *from, unsigned long n)
>>   
>>   	return n;
>>   }
>> +#define copy_mc_to_user copy_mc_to_user
>>   #endif
>>   
>>   extern long __copy_from_user_flushcache(void *dst, const void __user *src,
>> diff --git a/arch/x86/include/asm/uaccess.h b/arch/x86/include/asm/uaccess.h
>> index 0f9bab92a43d..309f2439327e 100644
>> --- a/arch/x86/include/asm/uaccess.h
>> +++ b/arch/x86/include/asm/uaccess.h
>> @@ -497,6 +497,7 @@ copy_mc_to_kernel(void *to, const void *from, unsigned len);
>>   
>>   unsigned long __must_check
>>   copy_mc_to_user(void __user *to, const void *from, unsigned len);
>> +#define copy_mc_to_user copy_mc_to_user
>>   #endif
>>   
>>   /*
>> diff --git a/include/linux/uaccess.h b/include/linux/uaccess.h
>> index 3064314f4832..0dfa9241b6ee 100644
>> --- a/include/linux/uaccess.h
>> +++ b/include/linux/uaccess.h
>> @@ -205,6 +205,14 @@ copy_mc_to_kernel(void *dst, const void *src, size_t cnt)
>>   }
>>   #endif
>>   
>> +#ifndef copy_mc_to_user
>> +static inline unsigned long __must_check
>> +copy_mc_to_user(void *dst, const void *src, size_t cnt)
>> +{
>> +	return copy_to_user(dst, src, cnt);
>> +}
>> +#endif
>> +
>>   static __always_inline void pagefault_disabled_inc(void)
>>   {
>>   	current->pagefault_disabled++;
> 
> .

