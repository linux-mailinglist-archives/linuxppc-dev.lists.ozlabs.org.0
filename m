Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B6861126A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Oct 2022 15:12:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MzNJF35Cfz3cK0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Oct 2022 00:12:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=EFIo+tct;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com; envelope-from=punit.agrawal@bytedance.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=EFIo+tct;
	dkim-atps=neutral
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MzNHF6DF7z3cCd
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Oct 2022 00:11:51 +1100 (AEDT)
Received: by mail-wr1-x429.google.com with SMTP id k8so6576750wrh.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Oct 2022 06:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+Aj7lCoa9R32lr+KR5EAOPwdoRP9ej39sPKRFvXXmKo=;
        b=EFIo+tctRNuBHWwWw1xOq1kEixfm3foZR690FRJu3AM3x8PYD0ZDLFys0bq0GHDw0q
         D+MTVPyEG1mTG0ZgdOgJq8+gjfvXKbovWD8hGjcbI7wWrksCjPBNiTntRvERjSr3G2+k
         Lu7JNnRQmZ6+8v+2wFsOY4k1EMCtFfmzGGyaZDJW+zI6dotPwQ2SHNssHmq5yH6XrLvw
         xSqtVUxuIWlv47NuYTEMe31KwKyXtoj47d/WfUsTDmeHSsavPPN1aNy232z2FiDj7IE2
         kdVuMjIFXr8rqIXxZZe02eKvfiUGYKO5h8nAQjogNLBpf+5ZCJOnzUUb++YTPAQ3vG+E
         aVQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Aj7lCoa9R32lr+KR5EAOPwdoRP9ej39sPKRFvXXmKo=;
        b=WOtYoNmdu9+RrI5lCw/5ZTTvL+X5wNKsKk/VC2324uMxgqYdMreYp0qBmL5KbXZp13
         YOjINaTcRZ3t8nj2kCQyzh3cwKfFyDm3zJ7DRlcEp1u5I2tt+FWXaygZsDrQ8BVFsEHv
         lLsErejo2WMwguwIka4nGT8USrv4Jq8OKW1p4Tcq/35OpNq0IF8147Wy7ZXteJ3TTY+d
         Oa+NEZhIuIzqqgZ8FO7QdycfeMxUD/tmTK4o/GHdXxcVHNEB3mp620kml+IqKh7gn6L/
         ZcbTq7hi8L5egSMW1X7hCDo5qL5KhHKM7IZJ3nFXtDhSsslz3gNbM4mCXm4xGq/ZvDur
         wLSg==
X-Gm-Message-State: ACrzQf0I7H2P0a0XsosFQIWESVZS/f16otVYSA2bqJ/pOJqHadhdU9dy
	+EbcBc6VB+NNoLWI/4EjWu7ZBQ==
X-Google-Smtp-Source: AMsMyM6YDLGx8tddVpugpJgNDAZlKMyecbRnjlokKyPGo/AAsO2SU74UqqxLLYtDEOG4bOxEAgjUZA==
X-Received: by 2002:adf:df83:0:b0:236:6d5d:ff8b with SMTP id z3-20020adfdf83000000b002366d5dff8bmr18336437wrl.315.1666962704559;
        Fri, 28 Oct 2022 06:11:44 -0700 (PDT)
Received: from localhost ([95.148.15.66])
        by smtp.gmail.com with ESMTPSA id k21-20020a05600c1c9500b003bfaba19a8fsm4641180wms.35.2022.10.28.06.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 06:11:43 -0700 (PDT)
From: Punit Agrawal <punit.agrawal@bytedance.com>
To: Yicong Yang <yangyicong@huawei.com>
Subject: Re: [PATCH v4 2/2] arm64: support batched/deferred tlb shootdown
 during page reclamation
References: <20220921084302.43631-1-yangyicong@huawei.com>
	<20220921084302.43631-3-yangyicong@huawei.com>
	<168eac93-a6ee-0b2e-12bb-4222eff24561@arm.com>
	<8e391962-4e3a-5a56-64b4-78e8637e3b8c@huawei.com>
	<CAGsJ_4z=dZbrAUD9jczT08S3qi_ep-h+EK35UfayVk1S+Cnp2A@mail.gmail.com>
	<ecd161db-b290-7997-a81e-a0a00bd1c599@arm.com>
	<87o7tx5oyx.fsf@stealth>
	<bc44cf85-aee9-03ca-9911-dbd904a43cc8@huawei.com>
Date: Fri, 28 Oct 2022 14:11:41 +0100
In-Reply-To: <bc44cf85-aee9-03ca-9911-dbd904a43cc8@huawei.com> (Yicong Yang's
	message of "Fri, 28 Oct 2022 09:20:08 +0800")
Message-ID: <87bkpw5bzm.fsf@stealth>
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
Cc: wangkefeng.wang@huawei.com, prime.zeng@hisilicon.com, Anshuman Khandual <anshuman.khandual@arm.com>, linux-doc@vger.kernel.org, peterz@infradead.org, catalin.marinas@arm.com, yangyicong@hisilicon.com, linux-mm@kvack.org, Nadav Amit <namit@vmware.com>, guojian@oppo.com, linux-riscv@lists.infradead.org, will@kernel.org, linux-s390@vger.kernel.org, zhangshiming@oppo.com, lipeifeng@oppo.com, corbet@lwn.net, x86@kernel.org, Barry Song <21cnbao@gmail.com>, Mel Gorman <mgorman@suse.de>, linux-mips@vger.kernel.org, arnd@arndb.de, realmz6@gmail.com, Barry Song <v-songbaohua@oppo.com>, openrisc@lists.librecores.org, darren@os.amperecomputing.com, Punit Agrawal <punit.agrawal@bytedance.com>, linux-arm-kernel@lists.infradead.org, xhao@linux.alibaba.com, linux-kernel@vger.kernel.org, huzhanyuan@oppo.com, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Yicong Yang <yangyicong@huawei.com> writes:

> On 2022/10/27 22:19, Punit Agrawal wrote:
>> 
>> [ Apologies for chiming in late in the conversation ]
>> 
>> Anshuman Khandual <anshuman.khandual@arm.com> writes:
>> 
>>> On 9/28/22 05:53, Barry Song wrote:
>>>> On Tue, Sep 27, 2022 at 10:15 PM Yicong Yang <yangyicong@huawei.com> wrote:
>>>>>
>>>>> On 2022/9/27 14:16, Anshuman Khandual wrote:
>>>>>> [...]
>>>>>>
>>>>>> On 9/21/22 14:13, Yicong Yang wrote:
>>>>>>> +static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
>>>>>>> +{
>>>>>>> +    /* for small systems with small number of CPUs, TLB shootdown is cheap */
>>>>>>> +    if (num_online_cpus() <= 4)
>>>>>>
>>>>>> It would be great to have some more inputs from others, whether 4 (which should
>>>>>> to be codified into a macro e.g ARM64_NR_CPU_DEFERRED_TLB, or something similar)
>>>>>> is optimal for an wide range of arm64 platforms.
>>>>>>
>>>>
>>>> I have tested it on a 4-cpus and 8-cpus machine. but i have no machine
>>>> with 5,6,7
>>>> cores.
>>>> I saw improvement on 8-cpus machines and I found 4-cpus machines don't need
>>>> this patch.
>>>>
>>>> so it seems safe to have
>>>> if (num_online_cpus()  < 8)
>>>>
>>>>>
>>>>> Do you prefer this macro to be static or make it configurable through kconfig then
>>>>> different platforms can make choice based on their own situations? It maybe hard to
>>>>> test on all the arm64 platforms.
>>>>
>>>> Maybe we can have this default enabled on machines with 8 and more cpus and
>>>> provide a tlbflush_batched = on or off to allow users enable or
>>>> disable it according
>>>> to their hardware and products. Similar example: rodata=on or off.
>>>
>>> No, sounds bit excessive. Kernel command line options should not be added
>>> for every possible run time switch options.
>>>
>>>>
>>>> Hi Anshuman, Will,  Catalin, Andrew,
>>>> what do you think about this approach?
>>>>
>>>> BTW, haoxin mentioned another important user scenarios for tlb bach on arm64:
>>>> https://lore.kernel.org/lkml/393d6318-aa38-01ed-6ad8-f9eac89bf0fc@linux.alibaba.com/
>>>>
>>>> I do believe we need it based on the expensive cost of tlb shootdown in arm64
>>>> even by hardware broadcast.
>>>
>>> Alright, for now could we enable ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH selectively
>>> with CONFIG_EXPERT and for num_online_cpus()  > 8 ?
>> 
>> When running the test program in the commit in a VM, I saw benefits from
>> the patches at all sizes from 2, 4, 8, 32 vcpus. On the test machine,
>> ptep_clear_flush() went from ~1% in the unpatched version to not showing
>> up.
>> 
>
> Maybe you're booting VM on a server with more than 32 cores and Barry tested
> on his 4 CPUs embedded platform. I guess a 4 CPU VM is not fully equivalent to
> a 4 CPU real machine as the tbli and dsb in the VM may influence the host
> as well.

Yeah, I also wondered about this.

I was able to test on a 6-core RK3399 based system - there the
ptep_clear_flush() was only 0.10% of the overall execution time. The
hardware seems to do a pretty good job of keeping the TLB flushing
overhead low.

[...]

