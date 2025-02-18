Return-Path: <linuxppc-dev+bounces-6315-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 54634A39B73
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2025 12:51:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YxyXs5qZHz2ymg;
	Tue, 18 Feb 2025 22:51:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.189
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739879485;
	cv=none; b=GDTtMojwuADLLyMWwBQmJ71BwenFzJrRcVLWjc+gDAsNnononOGqQnL/BGn0xlyY3CeDqp3HXBBdBYQR1Yoj/VIVhQzuIXC8/xd48rF0RpkmS9ges9FUSHRaut9IzSZMMEEhfx1lkckQMgrr5vy5sC+PFP0lWkPDrKpCNn+Vs2hUTZxb3Q4nUa7hQqofsjLIzwO9Jgn+KqtbUxv5M09W69ucomcBxCV15h/sUJDPtID+ldVMUkspns2Y0RS7Uy7pH2D8XtqerIgRL51tMWWnu2s3TyRmtJQPEf3a9HTF5GRw79Pz8bH4xsY6Fii0bXfwL8eRLsjjGOXqx5v90+ybcA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739879485; c=relaxed/relaxed;
	bh=QmDB2s0hgiezmOzzPHSZXy+cZE0dzTWlpWB06SQm1SU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=VepdTCrFw3FRDuygmlhF3Pz79s3EGKxPBtj8/5yp+hNI3AO0aEWsCpJCzYBEqatUQhl91Ifki7Bw9n4ZhrAojMuZPSqbhtDti1q21CoABnfjdVo8lPW+qwofwFLg4tyBrHtlH0fZQp8Cn5hlGSNPbXf5R+AHoVuMmc+xJuap9Pa6RIfmt7ErF5MPmg1mkAr+lIA9vUg0sGIVhqF/7KSNXW6q44X4Z2B9vwc/uzTEjGdwKHw1HwhmEiqTXmfSmgLoec6LnTi9MoW22er0VQazapsfWXwVdsFkS5Y5lSscIFz4m4d1zunTk4trbtiljHNsSVXcbCltj6+41kSWYFTBrw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.189; helo=szxga03-in.huawei.com; envelope-from=tongtiangen@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.189; helo=szxga03-in.huawei.com; envelope-from=tongtiangen@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YxyXr0ld7z2yVF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2025 22:51:19 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4YxyT969VDzTjWs;
	Tue, 18 Feb 2025 19:48:13 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 6C7E4140361;
	Tue, 18 Feb 2025 19:51:13 +0800 (CST)
Received: from [10.174.179.234] (10.174.179.234) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 18 Feb 2025 19:51:11 +0800
Message-ID: <3b181285-2ff3-b77a-867b-725f38ea86d3@huawei.com>
Date: Tue, 18 Feb 2025 19:51:10 +0800
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
From: Tong Tiangen <tongtiangen@huawei.com>
In-Reply-To: <Z7NN5Pa-c5PtIbcF@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.234]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-Spam-Status: No, score=-3.6 required=5.0 tests=NICE_REPLY_A,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



在 2025/2/17 22:55, Catalin Marinas 写道:
> On Mon, Feb 17, 2025 at 04:07:49PM +0800, Tong Tiangen wrote:
>> 在 2025/2/15 1:24, Catalin Marinas 写道:
>>> On Fri, Feb 14, 2025 at 10:49:01AM +0800, Tong Tiangen wrote:
>>>> 在 2025/2/13 1:11, Catalin Marinas 写道:
>>>>> On Mon, Dec 09, 2024 at 10:42:56AM +0800, Tong Tiangen wrote:
>>>>>> Currently, many scenarios that can tolerate memory errors when copying page
>>>>>> have been supported in the kernel[1~5], all of which are implemented by
>>>>>> copy_mc_[user]_highpage(). arm64 should also support this mechanism.
>>>>>>
>>>>>> Due to mte, arm64 needs to have its own copy_mc_[user]_highpage()
>>>>>> architecture implementation, macros __HAVE_ARCH_COPY_MC_HIGHPAGE and
>>>>>> __HAVE_ARCH_COPY_MC_USER_HIGHPAGE have been added to control it.
>>>>>>
>>>>>> Add new helper copy_mc_page() which provide a page copy implementation with
>>>>>> hardware memory error safe. The code logic of copy_mc_page() is the same as
>>>>>> copy_page(), the main difference is that the ldp insn of copy_mc_page()
>>>>>> contains the fixup type EX_TYPE_KACCESS_ERR_ZERO_MEM_ERR, therefore, the
>>>>>> main logic is extracted to copy_page_template.S. In addition, the fixup of
>>>>>> MOPS insn is not considered at present.
>>>>>
>>>>> Could we not add the exception table entry permanently but ignore the
>>>>> exception table entry if it's not on the do_sea() path? That would save
>>>>> some code duplication.
>>>>
>>>> I'm sorry, I didn't catch your point, that the do_sea() and non do_sea()
>>>> paths use different exception tables?
>>>
>>> No, they would have the same exception table, only that we'd interpret
>>> it differently depending on whether it's a SEA error or not. Or rather
>>> ignore the exception table altogether for non-SEA errors.
>>
>> You mean to use the same exception type (EX_TYPE_KACCESS_ERR_ZERO) and
>> then do different processing on SEA errors and non-SEA errors, right?
> 
> Right.

Ok, now we have the same understanding.

> 
>> If so, some instructions of copy_page() did not add to the exception
>> table will be added to the exception table, and the original logic will
>> be affected.
>>
>> For example, if an instruction is not added to the exception table, the
>> instruction will panic when it triggers a non-SEA error. If this
>> instruction is added to the exception table because of SEA processing,
>> and then a non-SEA error is triggered, should we fix it?
> 
> No, we shouldn't fix it. The exception table entries have a type
> associated. For a non-SEA error, we preserve the original behaviour even
> if we find a SEA-specific entry in the exception table. You already need
> such logic even if you duplicate the code for configurations where you
> have MC enabled.


So we need another way to distinguish the different processing of the
same exception type on SEA and non-SEA path.

For example, using strcut exception_table_entry.data, the disadvantage
is that it occupies the future expansion space of data.

I still think it's better to use methods like copy_from_user.S and
copy_to_user.S calling copy_template.S, and the duplicate code in
copy_template.S.

Thanks,
Tong.

> 

