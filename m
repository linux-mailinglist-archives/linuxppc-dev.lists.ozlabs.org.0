Return-Path: <linuxppc-dev+bounces-287-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD85959F99
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2024 16:20:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WppQt6Hn8z2yP8;
	Thu, 22 Aug 2024 00:20:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.187
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=tongtiangen@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WppQq2CH0z2yNc
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2024 00:20:44 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4WppPW1s7qzcdVM;
	Wed, 21 Aug 2024 22:19:43 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (unknown [7.193.23.234])
	by mail.maildlp.com (Postfix) with ESMTPS id 0C36E18009B;
	Wed, 21 Aug 2024 22:20:06 +0800 (CST)
Received: from [10.174.179.234] (10.174.179.234) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 21 Aug 2024 22:20:03 +0800
Message-ID: <030ac65e-29cb-ea29-6728-e820bc188203@huawei.com>
Date: Wed, 21 Aug 2024 22:20:03 +0800
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
Subject: Re: [PATCH v12 4/6] arm64: support copy_mc_[user]_highpage()
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
 <20240528085915.1955987-5-tongtiangen@huawei.com>
 <20240819125601.0000687b@Huawei.com>
 <8257d76b-c700-89a6-0e29-f194d2e1cd61@huawei.com>
 <20240821122848.00004047@Huawei.com>
From: Tong Tiangen <tongtiangen@huawei.com>
In-Reply-To: <20240821122848.00004047@Huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.234]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600017.china.huawei.com (7.193.23.234)



在 2024/8/21 19:28, Jonathan Cameron 写道:
> On Tue, 20 Aug 2024 11:02:05 +0800
> Tong Tiangen <tongtiangen@huawei.com> wrote:
> 
>> 在 2024/8/19 19:56, Jonathan Cameron 写道:
>>> On Tue, 28 May 2024 16:59:13 +0800
>>> Tong Tiangen <tongtiangen@huawei.com> wrote:
>>>    
>>>> Currently, many scenarios that can tolerate memory errors when copying page
>>>> have been supported in the kernel[1~5], all of which are implemented by
>>>> copy_mc_[user]_highpage(). arm64 should also support this mechanism.
>>>>
>>>> Due to mte, arm64 needs to have its own copy_mc_[user]_highpage()
>>>> architecture implementation, macros __HAVE_ARCH_COPY_MC_HIGHPAGE and
>>>> __HAVE_ARCH_COPY_MC_USER_HIGHPAGE have been added to control it.
>>>>
>>>> Add new helper copy_mc_page() which provide a page copy implementation with
>>>> hardware memory error safe. The code logic of copy_mc_page() is the same as
>>>> copy_page(), the main difference is that the ldp insn of copy_mc_page()
>>>> contains the fixup type EX_TYPE_KACCESS_ERR_ZERO_ME_SAFE, therefore, the
>>>> main logic is extracted to copy_page_template.S.
>>>>
>>>> [1] commit d302c2398ba2 ("mm, hwpoison: when copy-on-write hits poison, take page offline")
>>>> [2] commit 1cb9dc4b475c ("mm: hwpoison: support recovery from HugePage copy-on-write faults")
>>>> [3] commit 6b970599e807 ("mm: hwpoison: support recovery from ksm_might_need_to_copy()")
>>>> [4] commit 98c76c9f1ef7 ("mm/khugepaged: recover from poisoned anonymous memory")
>>>> [5] commit 12904d953364 ("mm/khugepaged: recover from poisoned file-backed memory")
>>>>
>>>> Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
>>> Trivial stuff inline.
>>>
>>> Jonathan
>>
>> I'm sorry, I may not have understood what you meant. Where is the better
>> place to do inline? :)
> Oops. All I meant was:
> 
> My comments are inline - as in within the patch later in the email.
> 

OK, It's my fault for not getting your point :)

Thanks Jonathan.

> 
> 
> .

