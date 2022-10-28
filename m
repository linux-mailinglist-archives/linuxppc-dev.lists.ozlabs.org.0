Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA8E611C82
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Oct 2022 23:41:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MzbbB0JdVz3cLh
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Oct 2022 08:41:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DDqlitA/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com; envelope-from=21cnbao@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DDqlitA/;
	dkim-atps=neutral
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MzbZC0mCyz3bhg
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Oct 2022 08:40:33 +1100 (AEDT)
Received: by mail-ed1-x52a.google.com with SMTP id r14so9703130edc.7
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Oct 2022 14:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=F9RrxUZJauba3tX3ZE6+TwL/IhjYDGu0yvNBASjmvvg=;
        b=DDqlitA/aZVBQxso46/Iv2q/qaCkZ5lo3I8GWq1a8re4mIEroveoDgzrRxpMlppt9u
         0KVqnFkXh59kEX6GswJHjBKN6I/iBoKjQUt8v2cQc22yymdzv7rCq4PYKUk0rkmHvySs
         VB0dqoVUFiWfCZpbLiSIySOUfp7O4BPAXS42ILfvdsUEMDFViM+qOE08A7vEhIPdZGGS
         fEyj4speB2Yk69V2CD2MN9IE5/dU7lHv7Z7Gvh3tzYP21dZke6ipgNWt7ndcMxeZIsER
         FcDNzWfC8ydsRNLz0i/dUDDu+ZNKpy+cZuN88qNTy2T0wRzqeDY9F0bCcgcENkhZ7389
         PyjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F9RrxUZJauba3tX3ZE6+TwL/IhjYDGu0yvNBASjmvvg=;
        b=3JSsBYzXRB8PekbA7XpuC0SkhpbyxdVjwRlHTDGu+B+LfyFJ6VL+MhZf3E0qW05Nhh
         eX/nBwDW89oG2iItjYh6nd6BobkENZ9/2d4mD/1gY8yiiY+V0m6T+Lxp5vPNeA+7jluH
         1vZkCblZ4ELDnmvitRT8FUTmjGTTZLoSqHTNYv8tEGZkOQZrnjSGj8tzeen3Ykfiec9U
         MRXptBhjn4YXG6Dt2DEe/RBwvYkCqsE1ia+2koqt/7SHhwAdU1TXSexjyS97Dm4hECdB
         zXshnAds/FReAV8ZKRlKbYwWrrx7o4DulVU624rAACDqz0Bkh42CFmW58kAVvjEKbXSd
         6E/Q==
X-Gm-Message-State: ACrzQf1ZJQ+FiQzMShFKCPkKyLBHvcZFGlSf+LxJhiDMlx12FgCCoY80
	4ZafmWjq8OUoKDRRNxooI3m/qNlnMrf6CPWySFU=
X-Google-Smtp-Source: AMsMyM6UDRzIvlNjYKY0c4hyt+nkhmalBHjieXw4tVuo5TgPqmtCi4sFsVHsHu+LH6Z1/MXVj9DUPehnJMCJxo9Pco4=
X-Received: by 2002:aa7:d744:0:b0:45c:e353:e891 with SMTP id
 a4-20020aa7d744000000b0045ce353e891mr1485536eds.36.1666993223904; Fri, 28 Oct
 2022 14:40:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220921084302.43631-1-yangyicong@huawei.com> <20220921084302.43631-3-yangyicong@huawei.com>
 <168eac93-a6ee-0b2e-12bb-4222eff24561@arm.com> <8e391962-4e3a-5a56-64b4-78e8637e3b8c@huawei.com>
 <CAGsJ_4z=dZbrAUD9jczT08S3qi_ep-h+EK35UfayVk1S+Cnp2A@mail.gmail.com>
 <ecd161db-b290-7997-a81e-a0a00bd1c599@arm.com> <87o7tx5oyx.fsf@stealth>
 <bc44cf85-aee9-03ca-9911-dbd904a43cc8@huawei.com> <87bkpw5bzm.fsf@stealth>
In-Reply-To: <87bkpw5bzm.fsf@stealth>
From: Barry Song <21cnbao@gmail.com>
Date: Sat, 29 Oct 2022 10:40:11 +1300
Message-ID: <CAGsJ_4xj2fKLOEHYC46P8ZhUPX8rw=yTNv3Zs=CPxLON6Xxvqw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] arm64: support batched/deferred tlb shootdown
 during page reclamation
To: Punit Agrawal <punit.agrawal@bytedance.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: wangkefeng.wang@huawei.com, prime.zeng@hisilicon.com, Anshuman Khandual <anshuman.khandual@arm.com>, linux-doc@vger.kernel.org, peterz@infradead.org, catalin.marinas@arm.com, yangyicong@hisilicon.com, linux-mm@kvack.org, Nadav Amit <namit@vmware.com>, guojian@oppo.com, linux-riscv@lists.infradead.org, will@kernel.org, linux-s390@vger.kernel.org, zhangshiming@oppo.com, lipeifeng@oppo.com, corbet@lwn.net, x86@kernel.org, Mel Gorman <mgorman@suse.de>, linux-mips@vger.kernel.org, arnd@arndb.de, realmz6@gmail.com, Barry Song <v-songbaohua@oppo.com>, openrisc@lists.librecores.org, darren@os.amperecomputing.com, linux-arm-kernel@lists.infradead.org, xhao@linux.alibaba.com, linux-kernel@vger.kernel.org, huzhanyuan@oppo.com, Yicong Yang <yangyicong@huawei.com>, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Oct 29, 2022 at 2:11 AM Punit Agrawal
<punit.agrawal@bytedance.com> wrote:
>
> Yicong Yang <yangyicong@huawei.com> writes:
>
> > On 2022/10/27 22:19, Punit Agrawal wrote:
> >>
> >> [ Apologies for chiming in late in the conversation ]
> >>
> >> Anshuman Khandual <anshuman.khandual@arm.com> writes:
> >>
> >>> On 9/28/22 05:53, Barry Song wrote:
> >>>> On Tue, Sep 27, 2022 at 10:15 PM Yicong Yang <yangyicong@huawei.com> wrote:
> >>>>>
> >>>>> On 2022/9/27 14:16, Anshuman Khandual wrote:
> >>>>>> [...]
> >>>>>>
> >>>>>> On 9/21/22 14:13, Yicong Yang wrote:
> >>>>>>> +static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
> >>>>>>> +{
> >>>>>>> +    /* for small systems with small number of CPUs, TLB shootdown is cheap */
> >>>>>>> +    if (num_online_cpus() <= 4)
> >>>>>>
> >>>>>> It would be great to have some more inputs from others, whether 4 (which should
> >>>>>> to be codified into a macro e.g ARM64_NR_CPU_DEFERRED_TLB, or something similar)
> >>>>>> is optimal for an wide range of arm64 platforms.
> >>>>>>
> >>>>
> >>>> I have tested it on a 4-cpus and 8-cpus machine. but i have no machine
> >>>> with 5,6,7
> >>>> cores.
> >>>> I saw improvement on 8-cpus machines and I found 4-cpus machines don't need
> >>>> this patch.
> >>>>
> >>>> so it seems safe to have
> >>>> if (num_online_cpus()  < 8)
> >>>>
> >>>>>
> >>>>> Do you prefer this macro to be static or make it configurable through kconfig then
> >>>>> different platforms can make choice based on their own situations? It maybe hard to
> >>>>> test on all the arm64 platforms.
> >>>>
> >>>> Maybe we can have this default enabled on machines with 8 and more cpus and
> >>>> provide a tlbflush_batched = on or off to allow users enable or
> >>>> disable it according
> >>>> to their hardware and products. Similar example: rodata=on or off.
> >>>
> >>> No, sounds bit excessive. Kernel command line options should not be added
> >>> for every possible run time switch options.
> >>>
> >>>>
> >>>> Hi Anshuman, Will,  Catalin, Andrew,
> >>>> what do you think about this approach?
> >>>>
> >>>> BTW, haoxin mentioned another important user scenarios for tlb bach on arm64:
> >>>> https://lore.kernel.org/lkml/393d6318-aa38-01ed-6ad8-f9eac89bf0fc@linux.alibaba.com/
> >>>>
> >>>> I do believe we need it based on the expensive cost of tlb shootdown in arm64
> >>>> even by hardware broadcast.
> >>>
> >>> Alright, for now could we enable ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH selectively
> >>> with CONFIG_EXPERT and for num_online_cpus()  > 8 ?
> >>
> >> When running the test program in the commit in a VM, I saw benefits from
> >> the patches at all sizes from 2, 4, 8, 32 vcpus. On the test machine,
> >> ptep_clear_flush() went from ~1% in the unpatched version to not showing
> >> up.
> >>
> >
> > Maybe you're booting VM on a server with more than 32 cores and Barry tested
> > on his 4 CPUs embedded platform. I guess a 4 CPU VM is not fully equivalent to
> > a 4 CPU real machine as the tbli and dsb in the VM may influence the host
> > as well.
>
> Yeah, I also wondered about this.
>
> I was able to test on a 6-core RK3399 based system - there the
> ptep_clear_flush() was only 0.10% of the overall execution time. The
> hardware seems to do a pretty good job of keeping the TLB flushing
> overhead low.

RK3399 has Dual-core ARM Cortex-A72 MPCore processor and
Quad-core ARM Cortex-A53 MPCore processor. you are probably
going to see different overhead of ptep_clear_flush() when you
bind the micro-benchmark on different cores.

>
> [...]
>

Thanks
Barry
