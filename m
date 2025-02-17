Return-Path: <linuxppc-dev+bounces-6257-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E47DA37CC5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2025 09:08:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YxFdY5LGcz304l;
	Mon, 17 Feb 2025 19:08:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.190
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739779681;
	cv=none; b=OCkLjOsW1Ftm8tT/qw0txTAwsbJt+yJm/ABKFDGg3Ia5IkUH0tlhBE6+gk8KXPn/U/rOZec164HbV4Xk8wuPQGwVTg4hXA4U29rTBNiSll2PqkUZ4hmoc7LOIHp1ZkYOmsq1CbgLdJaAkWBKE6To4WF7q3Q6euF3aEH9wVM25B4ZRo7f1CTl4s9WxAC8fhP3jdRN17f+mhE53k/+6wUT/0z7kMafi+/T42ZZ3tUw/e3XWvb9vhizdnYeT2IRUWxnZ3LFlfbokcZsjEWyIFl1QDalSaovVyv+D4infvLw5kf96G+JZg+u0ETf1gE8jhukmFQ7Ya7+PbelrzRqqb4P/g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739779681; c=relaxed/relaxed;
	bh=qcLmadiNH84yKe/L4JYojk3Qejz7s9KQF2cXf3WqfYU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QUfbD7ijFGpYmQLT41PTj8nLJCIE+Wtgw/+h6zRNWMwQnrwU3/oNU70CmmKSmzxJj6Nkwce9vpHO0hQH5DKcGGubPa8crnBeytvwn6FKLzOtBAUKla8SV+d1PTyWLW2dZ2DVOuFNLAmUqyMM9CfL2uKDt5+KOv4ZINf5GUMNL5RaTrOHlj4SJflPoYD+irMudOjc5ZMQyS9JIb8mEqgssKtTTQldgCB7wUZKqLt0dCytF7OZM3rtREA8x9qM7KIJd0dvB+OLfDZZfDdjuvuCGXXajnxLm00liUq8jmCbLCXSpw0MVAoPTwaYObHyeiT4EPimRn84QxSKJynutWx3YQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.190; helo=szxga04-in.huawei.com; envelope-from=tongtiangen@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.190; helo=szxga04-in.huawei.com; envelope-from=tongtiangen@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YxFdX0Z5Gz302c
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2025 19:07:57 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4YxFXw2mFXz2JYY6;
	Mon, 17 Feb 2025 16:04:00 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 765EE1A0188;
	Mon, 17 Feb 2025 16:07:52 +0800 (CST)
Received: from [10.174.179.234] (10.174.179.234) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 17 Feb 2025 16:07:50 +0800
Message-ID: <e1d2affb-5c6b-00b5-8209-34bbca36f96b@huawei.com>
Date: Mon, 17 Feb 2025 16:07:49 +0800
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
From: Tong Tiangen <tongtiangen@huawei.com>
In-Reply-To: <Z698SFVqHjpGeGC0@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.234]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-Spam-Status: No, score=-1.3 required=5.0 tests=NICE_REPLY_A,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



在 2025/2/15 1:24, Catalin Marinas 写道:
> On Fri, Feb 14, 2025 at 10:49:01AM +0800, Tong Tiangen wrote:
>> 在 2025/2/13 1:11, Catalin Marinas 写道:
>>> On Mon, Dec 09, 2024 at 10:42:56AM +0800, Tong Tiangen wrote:
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
>>>> contains the fixup type EX_TYPE_KACCESS_ERR_ZERO_MEM_ERR, therefore, the
>>>> main logic is extracted to copy_page_template.S. In addition, the fixup of
>>>> MOPS insn is not considered at present.
>>>
>>> Could we not add the exception table entry permanently but ignore the
>>> exception table entry if it's not on the do_sea() path? That would save
>>> some code duplication.
>>
>> I'm sorry, I didn't catch your point, that the do_sea() and non do_sea()
>> paths use different exception tables?
> 
> No, they would have the same exception table, only that we'd interpret
> it differently depending on whether it's a SEA error or not. Or rather
> ignore the exception table altogether for non-SEA errors.

You mean to use the same exception type (EX_TYPE_KACCESS_ERR_ZERO) and
then do different processing on SEA errors and non-SEA errors, right?

If so, some instructions of copy_page() did not add to the exception
table will be added to the exception table, and the original logic will
be affected.

For example, if an instruction is not added to the exception table, the
instruction will panic when it triggers a non-SEA error. If this
instruction is added to the exception table because of SEA processing,
and then a non-SEA error is triggered, should we fix it?

Thanks,
Tong.

> 
>> My understanding is that the
>> exception table entry problem is fine. After all, the search is
>> performed only after a fault trigger. Code duplication can be solved by
>> extracting repeated logic to a public file.
> 
> If the new exception table entries are only taken into account for SEA
> errors, why do we need a duplicate copy_mc_page() function generated?
> Isn't the copy_page() and copy_mc_page() code identical (except for the
> additional labels to jump to for the exception)?
> 

