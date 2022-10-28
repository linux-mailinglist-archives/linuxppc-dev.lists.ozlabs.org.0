Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D65611271
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Oct 2022 15:13:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MzNKP1ngPz3dsd
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Oct 2022 00:13:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=czSDanOW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com; envelope-from=punit.agrawal@bytedance.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=czSDanOW;
	dkim-atps=neutral
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MzNJQ24swz3cKb
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Oct 2022 00:12:54 +1100 (AEDT)
Received: by mail-wr1-x429.google.com with SMTP id z14so6538593wrn.7
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Oct 2022 06:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o3XkdRF1alR2hBxhKv7+KC2xEVL/mNE1pCUslh91CNk=;
        b=czSDanOWkaznNFvfzkhI+RldJ79y0lOKTXLazE2INVObzdIpuA02fnxmTp4HXTRQTi
         IvuTylcXIq/Sg1jCgh9FzcPYK6wCnCgisN2SPpD2hY2iM3U6UJQJMLePIaRYzRfU+2Wh
         y9qb6oEWb7kSxsaXWIlY4Dkr2UM2TLk7qXYPH5mBMLvwd3vtyLYpmiqZDG3Zxj0+CARd
         L8/aJqqA6LprQ5Pk4/015K7SAUBuZTJBf3EKbWQG93N7hmK53CJDPw0U9whLdkPu5vWz
         3ELADVGMWSrtaYcGW48cTX8dbadiAO+awqSfgOoWpeoUTHQ8/pHHrLwFT/4AdLUkI1S8
         O7bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o3XkdRF1alR2hBxhKv7+KC2xEVL/mNE1pCUslh91CNk=;
        b=ISWqjX7n5F4QgElP/eeTsF2XhO87eA6PEyWPjSZ4riy9Dw/bTuLL8srx/HGJ3SQkyO
         hHkIrEQseiFsH3hUpWkdyH+UZRthYxwObg0tj4ClPb4Q2OrF4GeIxFeGb+qI0ZlL2qAw
         rizeJ/2o+TagUf22J//CyaaRnVXAD2WqP7grvupmWZx9DouFdjrzSQR5r6HT4CKMAhYx
         A8wc0ceu4c5l525M4YNy7QyRThcoHpAL8Q1RtOHXH8fL2W6pgr8f0ApZBkdd38+rp6pV
         2hz+wsteCtx/tqoBgk0ewQhWKJQuzA//dqIDtE+TXDmQmz671UnTwGwq9Pq3NgQ4aI7Q
         +ATw==
X-Gm-Message-State: ACrzQf1tDhIXBQe9YLANIhAtwWVOevkeF7U6CkCw86sI39E06x5d+Onq
	KyWrg3GaHyWJLfDCAgjbuDpyDw==
X-Google-Smtp-Source: AMsMyM6F7+GscrQBfN0kqw1I2NMyhLF2BzgPRHQOCPO+qKjjp7P6MaY7wew3G5OT+7MX9xpYkZlRUQ==
X-Received: by 2002:a05:6000:18c7:b0:22e:5503:9c46 with SMTP id w7-20020a05600018c700b0022e55039c46mr33561930wrq.668.1666962771104;
        Fri, 28 Oct 2022 06:12:51 -0700 (PDT)
Received: from localhost ([95.148.15.66])
        by smtp.gmail.com with ESMTPSA id n17-20020a05600c501100b003b4fdbb6319sm5926108wmr.21.2022.10.28.06.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 06:12:50 -0700 (PDT)
From: Punit Agrawal <punit.agrawal@bytedance.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH v4 2/2] arm64: support batched/deferred tlb shootdown
 during page reclamation
References: <20220921084302.43631-1-yangyicong@huawei.com>
	<20220921084302.43631-3-yangyicong@huawei.com>
	<168eac93-a6ee-0b2e-12bb-4222eff24561@arm.com>
	<8e391962-4e3a-5a56-64b4-78e8637e3b8c@huawei.com>
	<CAGsJ_4z=dZbrAUD9jczT08S3qi_ep-h+EK35UfayVk1S+Cnp2A@mail.gmail.com>
	<ecd161db-b290-7997-a81e-a0a00bd1c599@arm.com>
	<87o7tx5oyx.fsf@stealth>
	<CAGsJ_4zrGfPYAXGW0g3Z-GF4vT7GD0xDjZn1dv-qruztEQTghg@mail.gmail.com>
	<8a3ade4c-1714-5ffd-ed57-02ab0509725b@arm.com>
Date: Fri, 28 Oct 2022 14:12:49 +0100
In-Reply-To: <8a3ade4c-1714-5ffd-ed57-02ab0509725b@arm.com> (Anshuman
	Khandual's message of "Fri, 28 Oct 2022 07:44:29 +0530")
Message-ID: <877d0k5bxq.fsf@stealth>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: wangkefeng.wang@huawei.com, prime.zeng@hisilicon.com, linux-doc@vger.kernel.org, peterz@infradead.org, catalin.marinas@arm.com, yangyicong@hisilicon.com, linux-mm@kvack.org, Nadav Amit <namit@vmware.com>, guojian@oppo.com, linux-riscv@lists.infradead.org, will@kernel.org, linux-s390@vger.kernel.org, zhangshiming@oppo.com, lipeifeng@oppo.com, corbet@lwn.net, x86@kernel.org, Barry Song <21cnbao@gmail.com>, Mel Gorman <mgorman@suse.de>, linux-mips@vger.kernel.org, arnd@arndb.de, realmz6@gmail.com, Barry Song <v-songbaohua@oppo.com>, openrisc@lists.librecores.org, darren@os.amperecomputing.com, Punit Agrawal <punit.agrawal@bytedance.com>, linux-arm-kernel@lists.infradead.org, xhao@linux.alibaba.com, linux-kernel@vger.kernel.org, huzhanyuan@oppo.com, Yicong Yang <yangyicong@huawei.com>, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Anshuman Khandual <anshuman.khandual@arm.com> writes:

> On 10/28/22 03:25, Barry Song wrote:
>> On Fri, Oct 28, 2022 at 3:19 AM Punit Agrawal
>> <punit.agrawal@bytedance.com> wrote:
>>>
>>> [ Apologies for chiming in late in the conversation ]
>>>
>>> Anshuman Khandual <anshuman.khandual@arm.com> writes:
>>>
>>>> On 9/28/22 05:53, Barry Song wrote:
>>>>> On Tue, Sep 27, 2022 at 10:15 PM Yicong Yang <yangyicong@huawei.com> wrote:
>>>>>> On 2022/9/27 14:16, Anshuman Khandual wrote:
>>>>>>> [...]
>>>>>>>
>>>>>>> On 9/21/22 14:13, Yicong Yang wrote:
>>>>>>>> +static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
>>>>>>>> +{
>>>>>>>> +    /* for small systems with small number of CPUs, TLB shootdown is cheap */
>>>>>>>> +    if (num_online_cpus() <= 4)
>>>>>>> It would be great to have some more inputs from others, whether 4 (which should
>>>>>>> to be codified into a macro e.g ARM64_NR_CPU_DEFERRED_TLB, or something similar)
>>>>>>> is optimal for an wide range of arm64 platforms.
>>>>>>>
>>>>> I have tested it on a 4-cpus and 8-cpus machine. but i have no machine
>>>>> with 5,6,7
>>>>> cores.
>>>>> I saw improvement on 8-cpus machines and I found 4-cpus machines don't need
>>>>> this patch.
>>>>>
>>>>> so it seems safe to have
>>>>> if (num_online_cpus()  < 8)
>>>>>
>>>>>> Do you prefer this macro to be static or make it configurable through kconfig then
>>>>>> different platforms can make choice based on their own situations? It maybe hard to
>>>>>> test on all the arm64 platforms.
>>>>> Maybe we can have this default enabled on machines with 8 and more cpus and
>>>>> provide a tlbflush_batched = on or off to allow users enable or
>>>>> disable it according
>>>>> to their hardware and products. Similar example: rodata=on or off.
>>>> No, sounds bit excessive. Kernel command line options should not be added
>>>> for every possible run time switch options.
>>>>
>>>>> Hi Anshuman, Will,  Catalin, Andrew,
>>>>> what do you think about this approach?
>>>>>
>>>>> BTW, haoxin mentioned another important user scenarios for tlb bach on arm64:
>>>>> https://lore.kernel.org/lkml/393d6318-aa38-01ed-6ad8-f9eac89bf0fc@linux.alibaba.com/
>>>>>
>>>>> I do believe we need it based on the expensive cost of tlb shootdown in arm64
>>>>> even by hardware broadcast.
>>>> Alright, for now could we enable ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH selectively
>>>> with CONFIG_EXPERT and for num_online_cpus()  > 8 ?
>>> When running the test program in the commit in a VM, I saw benefits from
>>> the patches at all sizes from 2, 4, 8, 32 vcpus. On the test machine,
>>> ptep_clear_flush() went from ~1% in the unpatched version to not showing
>>> up.
>>>
>>> Yicong mentioned that he didn't see any benefit for <= 4 CPUs but is
>>> there any overhead? I am wondering what are the downsides of enabling
>>> the config by default.
>> As we are deferring tlb flush, but sometimes while we are modifying the vma
>> which are deferred, we need to do a sync by flush_tlb_batched_pending() in
>> mprotect() , madvise() to make sure they can see the flushed result. if nobody
>> is doing mprotect(), madvise() etc in the deferred period, the overhead is zero.
>
> Right, it is difficult to justify this overhead for smaller systems,
> which for sure would not benefit from this batched TLB framework.

Thank you for the pointers to the overhead.

Having looked at this more closely, I also see that
flush_tlb_batched_pending() discards the entire mm vs just flushing the
page being unmapped (as is done with ptep_clear_flush()).
