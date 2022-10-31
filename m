Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1A8613D75
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Oct 2022 19:37:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N1MN15w2Zz3cLm
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Nov 2022 05:37:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=Mki3cqNy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com; envelope-from=punit.agrawal@bytedance.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=Mki3cqNy;
	dkim-atps=neutral
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N1MM20rGHz30NS
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Nov 2022 05:36:59 +1100 (AEDT)
Received: by mail-wr1-x433.google.com with SMTP id h9so17257343wrt.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Oct 2022 11:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sNqF1x5hFExPPQ1p8H8ZfUJkMN/LytiJFdG0FgSo0Yc=;
        b=Mki3cqNyLb6i/7bDr8xmcRoAI7MKB8Ubep7MvVdCAwvVAv/rvYzaNntbYk7evNSPOx
         iZSZj+1kqC7UTT9hY3p9QxXxVMZ7rRgmk+9DY9r7FhExeFFt1VDbTR9aAf2X+JrZ0tNY
         Tr/US88lDzmERESqdII2j74Xqtc13Nxr3puP6+gFIxszTZcUEQgT950jsRCvi08bhiKR
         jD8ZqkKvxW/CqsLaBVsSxX0va4onlR2A9GDsiypQf+pm99b/Y+UG3WiItOZJ+Li8JVOO
         +Y1i4xOLivYeF+DP4zPejP0GtpVAQoKKHaj+oeUXTWFGo9wGo7aYYFoFnonbrsyfX2Yj
         K6HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sNqF1x5hFExPPQ1p8H8ZfUJkMN/LytiJFdG0FgSo0Yc=;
        b=NjSrtcvOU43Rvmy5x2QlgzG/Dhw6hHQijvFU0b7GQ6T52HcJbZGsKKJgNIdReeJWrN
         CArS6TPcFMNKyxxF03klHlAvizAzxi5U4WA6677Nl4WwIvRnjHCtVZTJGOf/ooJGga2Q
         3Vw0NZklXN1g/j1IFbZqyMvcOGjqzhdXcnn3ErKDihiALKYxQ3pB552TxOV+o4cFli1V
         8QuZw/7jcu1B9WM06goBdNDCeL2Qycfi805307nGzROVXzqrTn1GG15epqzXJlxJm4vu
         E3/YTj67sDXNjfTMaxiuHqFCehmr8HdjOXBB1Dd9xLzJr5KblZDL4KIQKR4VJzUn5ll4
         Uhvg==
X-Gm-Message-State: ACrzQf2p0PzUaL7LetQFpeuPUmyGhRU/gP4wusdEad5uRwFFoC2HvwAG
	sVXkR4rAbTFzizREkp1TUyvpog==
X-Google-Smtp-Source: AMsMyM6L4c0mU3rV7kcQN/uxBci0PgFY6LkbseXn4PqZrB/kcujXoiDFpfGo/UsDapmtxjnBCDkTjg==
X-Received: by 2002:a5d:584e:0:b0:236:6f0f:9d8 with SMTP id i14-20020a5d584e000000b002366f0f09d8mr9048660wrf.701.1667241412938;
        Mon, 31 Oct 2022 11:36:52 -0700 (PDT)
Received: from localhost ([95.148.15.66])
        by smtp.gmail.com with ESMTPSA id b20-20020a05600c151400b003b3307fb98fsm7781722wmg.24.2022.10.31.11.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 11:36:52 -0700 (PDT)
From: Punit Agrawal <punit.agrawal@bytedance.com>
To: Barry Song <21cnbao@gmail.com>
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
	<87bkpw5bzm.fsf@stealth>
	<CAGsJ_4xj2fKLOEHYC46P8ZhUPX8rw=yTNv3Zs=CPxLON6Xxvqw@mail.gmail.com>
Date: Mon, 31 Oct 2022 18:36:51 +0000
In-Reply-To: <CAGsJ_4xj2fKLOEHYC46P8ZhUPX8rw=yTNv3Zs=CPxLON6Xxvqw@mail.gmail.com>
	(Barry Song's message of "Sat, 29 Oct 2022 10:40:11 +1300")
Message-ID: <87zgdb4z7g.fsf@stealth>
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
Cc: wangkefeng.wang@huawei.com, prime.zeng@hisilicon.com, Anshuman Khandual <anshuman.khandual@arm.com>, linux-doc@vger.kernel.org, peterz@infradead.org, catalin.marinas@arm.com, yangyicong@hisilicon.com, linux-mm@kvack.org, Nadav Amit <namit@vmware.com>, guojian@oppo.com, linux-riscv@lists.infradead.org, will@kernel.org, linux-s390@vger.kernel.org, zhangshiming@oppo.com, lipeifeng@oppo.com, corbet@lwn.net, x86@kernel.org, Mel Gorman <mgorman@suse.de>, linux-mips@vger.kernel.org, arnd@arndb.de, realmz6@gmail.com, Barry Song <v-songbaohua@oppo.com>, openrisc@lists.librecores.org, darren@os.amperecomputing.com, Punit Agrawal <punit.agrawal@bytedance.com>, linux-arm-kernel@lists.infradead.org, xhao@linux.alibaba.com, linux-kernel@vger.kernel.org, huzhanyuan@oppo.com, Yicong Yang <yangyicong@huawei.com>, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Barry Song <21cnbao@gmail.com> writes:

> On Sat, Oct 29, 2022 at 2:11 AM Punit Agrawal
> <punit.agrawal@bytedance.com> wrote:
>>
>> Yicong Yang <yangyicong@huawei.com> writes:
>>
>> > On 2022/10/27 22:19, Punit Agrawal wrote:
>> >>
>> >> [ Apologies for chiming in late in the conversation ]
>> >>
>> >> Anshuman Khandual <anshuman.khandual@arm.com> writes:
>> >>
>> >>> On 9/28/22 05:53, Barry Song wrote:
>> >>>> On Tue, Sep 27, 2022 at 10:15 PM Yicong Yang <yangyicong@huawei.com> wrote:
>> >>>>>
>> >>>>> On 2022/9/27 14:16, Anshuman Khandual wrote:
>> >>>>>> [...]
>> >>>>>>
>> >>>>>> On 9/21/22 14:13, Yicong Yang wrote:
>> >>>>>>> +static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
>> >>>>>>> +{
>> >>>>>>> +    /* for small systems with small number of CPUs, TLB shootdown is cheap */
>> >>>>>>> +    if (num_online_cpus() <= 4)
>> >>>>>>
>> >>>>>> It would be great to have some more inputs from others, whether 4 (which should
>> >>>>>> to be codified into a macro e.g ARM64_NR_CPU_DEFERRED_TLB, or something similar)
>> >>>>>> is optimal for an wide range of arm64 platforms.
>> >>>>>>
>> >>>>
>> >>>> I have tested it on a 4-cpus and 8-cpus machine. but i have no machine
>> >>>> with 5,6,7
>> >>>> cores.
>> >>>> I saw improvement on 8-cpus machines and I found 4-cpus machines don't need
>> >>>> this patch.
>> >>>>
>> >>>> so it seems safe to have
>> >>>> if (num_online_cpus()  < 8)
>> >>>>
>> >>>>>
>> >>>>> Do you prefer this macro to be static or make it configurable through kconfig then
>> >>>>> different platforms can make choice based on their own situations? It maybe hard to
>> >>>>> test on all the arm64 platforms.
>> >>>>
>> >>>> Maybe we can have this default enabled on machines with 8 and more cpus and
>> >>>> provide a tlbflush_batched = on or off to allow users enable or
>> >>>> disable it according
>> >>>> to their hardware and products. Similar example: rodata=on or off.
>> >>>
>> >>> No, sounds bit excessive. Kernel command line options should not be added
>> >>> for every possible run time switch options.
>> >>>
>> >>>>
>> >>>> Hi Anshuman, Will,  Catalin, Andrew,
>> >>>> what do you think about this approach?
>> >>>>
>> >>>> BTW, haoxin mentioned another important user scenarios for tlb bach on arm64:
>> >>>> https://lore.kernel.org/lkml/393d6318-aa38-01ed-6ad8-f9eac89bf0fc@linux.alibaba.com/
>> >>>>
>> >>>> I do believe we need it based on the expensive cost of tlb shootdown in arm64
>> >>>> even by hardware broadcast.
>> >>>
>> >>> Alright, for now could we enable ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH selectively
>> >>> with CONFIG_EXPERT and for num_online_cpus()  > 8 ?
>> >>
>> >> When running the test program in the commit in a VM, I saw benefits from
>> >> the patches at all sizes from 2, 4, 8, 32 vcpus. On the test machine,
>> >> ptep_clear_flush() went from ~1% in the unpatched version to not showing
>> >> up.
>> >>
>> >
>> > Maybe you're booting VM on a server with more than 32 cores and Barry tested
>> > on his 4 CPUs embedded platform. I guess a 4 CPU VM is not fully equivalent to
>> > a 4 CPU real machine as the tbli and dsb in the VM may influence the host
>> > as well.
>>
>> Yeah, I also wondered about this.
>>
>> I was able to test on a 6-core RK3399 based system - there the
>> ptep_clear_flush() was only 0.10% of the overall execution time. The
>> hardware seems to do a pretty good job of keeping the TLB flushing
>> overhead low.

I found a problem with my measurements (missing volatile). Correcting
that increased the overhead somewhat - more below.

> RK3399 has Dual-core ARM Cortex-A72 MPCore processor and
> Quad-core ARM Cortex-A53 MPCore processor. you are probably
> going to see different overhead of ptep_clear_flush() when you
> bind the micro-benchmark on different cores.

Indeed - binding the code on the A53 shows half the overhead from
ptep_clear_flush() compared to the A72.

On the A53 -

    $ perf report --stdio -i perf.vanilla.a53.data | grep ptep_clear_flush
         0.63%  pageout  [kernel.kallsyms]  [k] ptep_clear_flush

On the A72

    $ perf report --stdio -i perf.vanilla.a72.data | grep ptep_clear_flush
         1.34%  pageout  [kernel.kallsyms]      [k] ptep_clear_flush


[...]

