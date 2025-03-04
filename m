Return-Path: <linuxppc-dev+bounces-6688-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C7EC7A4E04D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Mar 2025 15:11:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z6czX0jsQz3bm3;
	Wed,  5 Mar 2025 01:11:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.191
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741097464;
	cv=none; b=Kp6nTBg6bato+YoIVv4C+1rl1hxbdTuEm3djBXAEjuE2QQiiXlD7O8FM4K7yv22QE+dxT6pPpscy5LrdAzrTgF+SaQweIsA7ZRkd/oM7uiGoxsSlXOlERzj0xcgzIE4LwoXn/sjOfS4xRCnTC4X/4R0rTSZpgl1nSsMZ2dsd1k7pkqyxzL9gC7gmH0qm4UvKn61De1WrUk5i1k4R8jmYfOZ/BXAW8X6sXrS28geAu12SOP4PTvQkL5F0sSKd2MlbHY/pTazILiCd6XrHlbbvu0GmSE/WYGNmAuySv0btFj6u+RUjTQ9G065mdxJ9u9XTbr5anHueROTIDSrnxT1/4w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741097464; c=relaxed/relaxed;
	bh=Cz7IA69OFA9tHcBAPSVOCjGmnTTL7mvde1OZORF4svs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=DlGUYTxuqf4VQSNYORZC8qLwR7UBvQVJpn/gUFJrs50KxfFzjHK21/ayoUK7S57bOb6iNU3lqgvxVBUB4dAk3bhgNpPqW8CsV6NLRIokO9NWd45TcEtmoB8VUxbvkQcURCRSTjYIaTkiqmeGlMBAH7RSVB8Ub+E2YVQB6qP3GnkT6BNHGfN+q6PEWgOjNJ4uzHX3xQquaEmHvwSq/9CuLoSkj9XTqvUdql0sxDAf7fV/XZDmXtPmoRYpGGvdMHJL+VUduLoEYUBEOQz8P5R6n0d4CyrPoQZJKnzNpqcqyHQ45O0PtChdefW1qPTLRrFJrM8uHP3/ibp8KD9zEGKZ9A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.191; helo=szxga05-in.huawei.com; envelope-from=tongtiangen@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.191; helo=szxga05-in.huawei.com; envelope-from=tongtiangen@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z6czV3B96z30Vq
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Mar 2025 01:10:59 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Z6ctR2c3Gz1ltZw;
	Tue,  4 Mar 2025 22:06:39 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id B226C1A0188;
	Tue,  4 Mar 2025 22:10:50 +0800 (CST)
Received: from [10.174.179.234] (10.174.179.234) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 4 Mar 2025 22:10:48 +0800
Message-ID: <2c1fa758-c292-aefb-f6e2-cab41f592568@huawei.com>
Date: Tue, 4 Mar 2025 22:10:47 +0800
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
 <69955002-c3b1-459d-9b42-8d07475c3fd3@huawei.com> <Z698SFVqHjpGeGC0@arm.com>
 <e1d2affb-5c6b-00b5-8209-34bbca36f96b@huawei.com> <Z7NN5Pa-c5PtIbcF@arm.com>
 <3b181285-2ff3-b77a-867b-725f38ea86d3@huawei.com> <Z7TisqB5qCIF5nYI@arm.com>
From: Tong Tiangen <tongtiangen@huawei.com>
In-Reply-To: <Z7TisqB5qCIF5nYI@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.234]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-Spam-Status: No, score=-2.4 required=5.0 tests=NICE_REPLY_A,
	RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi,Catalin:

Kindly ping ...

Thanks.:)

在 2025/2/19 3:42, Catalin Marinas 写道:
> On Tue, Feb 18, 2025 at 07:51:10PM +0800, Tong Tiangen wrote:
>>>>>> 在 2025/2/13 1:11, Catalin Marinas 写道:
>>>>>>> On Mon, Dec 09, 2024 at 10:42:56AM +0800, Tong Tiangen wrote:
>>>>>>>> Currently, many scenarios that can tolerate memory errors when copying page
>>>>>>>> have been supported in the kernel[1~5], all of which are implemented by
>>>>>>>> copy_mc_[user]_highpage(). arm64 should also support this mechanism.
>>>>>>>>
>>>>>>>> Due to mte, arm64 needs to have its own copy_mc_[user]_highpage()
>>>>>>>> architecture implementation, macros __HAVE_ARCH_COPY_MC_HIGHPAGE and
>>>>>>>> __HAVE_ARCH_COPY_MC_USER_HIGHPAGE have been added to control it.
>>>>>>>>
>>>>>>>> Add new helper copy_mc_page() which provide a page copy implementation with
>>>>>>>> hardware memory error safe. The code logic of copy_mc_page() is the same as
>>>>>>>> copy_page(), the main difference is that the ldp insn of copy_mc_page()
>>>>>>>> contains the fixup type EX_TYPE_KACCESS_ERR_ZERO_MEM_ERR, therefore, the
>>>>>>>> main logic is extracted to copy_page_template.S. In addition, the fixup of
>>>>>>>> MOPS insn is not considered at present.
>>>>>>>
>>>>>>> Could we not add the exception table entry permanently but ignore the
>>>>>>> exception table entry if it's not on the do_sea() path? That would save
>>>>>>> some code duplication.
> [...]
>> So we need another way to distinguish the different processing of the
>> same exception type on SEA and non-SEA path.
> 
> Distinguishing whether the fault is SEA or non-SEA is already done by
> the exception handling you are adding. What we don't have though is
> information about whether the caller invoked copy_highpage() or
> copy_mc_highpage(). That's where the code duplication comes in handy.
> 
> It's a shame we need to duplicate identical functions just to have
> different addresses to look up in the exception table. We are also short
> of caller saved registers to track this information (e.g. an extra
> argument to those functions that the exception handler interprets).
> 
> I need to think a bit more, we could in theory get the arm64 memcpy_mc()
> to return an error code depending on what type of fault it got (e.g.
> -EHWPOISON for SEA, -EFAULT for non-SEA). copy_mc_highpage() would
> interpret this one and panic if -EFAULT. But we lose some fault details
> we normally get on a faulty access like some of the registers.
> 
> Well, maybe the simples is still to keep the function duplication. I'll
> have another look at the series tomorrow.
> 

