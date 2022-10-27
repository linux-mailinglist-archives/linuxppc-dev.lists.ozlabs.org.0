Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 965396104E3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Oct 2022 23:56:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MyzzW3cy0z3cJw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Oct 2022 08:56:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=mDkvDqdA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com; envelope-from=21cnbao@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=mDkvDqdA;
	dkim-atps=neutral
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MyzyW0ZLXz2xbK
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Oct 2022 08:56:02 +1100 (AEDT)
Received: by mail-ej1-x636.google.com with SMTP id q9so8644677ejd.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Oct 2022 14:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NBF9nN1amKjoEJYkIjpsAIirOQycb1TH6Xv8hrGX720=;
        b=mDkvDqdAij8U7APRP9yt0MpP0X4VRBno0CXMoN30kyF44cwwyG6SWPi0RMmgixT3Bt
         gDGI3NQdLQgzAOkEJRsHlv30WGUJ2hQblLeSpwcJ5STMlX4u4j8a3tQV2KR2m0LIQzBm
         AQJ503ah+Ml5VjRZNjjXGPE/NDYPCFMXA8zgjE5t0SVsx9Hw9IWLWZ3AMAqfOZwZ+V+e
         qYuMVsdT8DFxXyS63KjEsQME+nw+FVWDILA1TQjyCKoVJwx1GB6oAfX2SEHxx6BUkppp
         FRbFNc1nFH6dDsPv8S53kFNtYm8nzlkRSUmQ01A3lEAB9LpF+C23K7NNIPQTDmTy9HCd
         Qzng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NBF9nN1amKjoEJYkIjpsAIirOQycb1TH6Xv8hrGX720=;
        b=UHuHc6k2HqjvdgJmDxIFApwVnEyKBEvKJKc7cwiCgr0/3Uim4I544PMp7a4CLXHmcJ
         wlkTROOJByRZhpGNDTg+0HJHHVss5qC00EeAfVUEEmUgpfhcpQdQevh00o6ug8tMqHmN
         qKe5rlXJZTXHfXHid5L8h5URsHLpwACyz7r0nZ2p28OiXkbCBunvuzzexYi3DHMqJZGa
         Qy/okNW3bX31/nHtPEHvGvjSE3J7l8bhcmQslIo8LOK1ZLSdrv7nvWFbCO0RzOD31AcZ
         H+QqHWH8yGIuP54NVFxp5nr5nqEi6J6P3gJ8OAg4/0iFK+nYrvUrrlbC7ABkJYFjxb/K
         twlA==
X-Gm-Message-State: ACrzQf1UGiWeKuXAVwU+4X0+xmArjE1021kKoIPJWbqd1ANq1eK0eZG2
	5vROhVKFIE+/jWO7fMznl904LLfW2YfWBExLuRU=
X-Google-Smtp-Source: AMsMyM6xp5XG883Sfz6qxUaX5+gPHPonCP4MPn0vbsj6Bzy6ERW5G8ermHkmXVNLJ97zdVUdhxlu0w7L/DMiIXxWfLY=
X-Received: by 2002:a17:906:8442:b0:7ad:960b:ef61 with SMTP id
 e2-20020a170906844200b007ad960bef61mr2610486ejy.702.1666907755828; Thu, 27
 Oct 2022 14:55:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220921084302.43631-1-yangyicong@huawei.com> <20220921084302.43631-3-yangyicong@huawei.com>
 <168eac93-a6ee-0b2e-12bb-4222eff24561@arm.com> <8e391962-4e3a-5a56-64b4-78e8637e3b8c@huawei.com>
 <CAGsJ_4z=dZbrAUD9jczT08S3qi_ep-h+EK35UfayVk1S+Cnp2A@mail.gmail.com>
 <ecd161db-b290-7997-a81e-a0a00bd1c599@arm.com> <87o7tx5oyx.fsf@stealth>
In-Reply-To: <87o7tx5oyx.fsf@stealth>
From: Barry Song <21cnbao@gmail.com>
Date: Fri, 28 Oct 2022 10:55:42 +1300
Message-ID: <CAGsJ_4zrGfPYAXGW0g3Z-GF4vT7GD0xDjZn1dv-qruztEQTghg@mail.gmail.com>
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
Cc: wangkefeng.wang@huawei.com, prime.zeng@hisilicon.com, realmz6@gmail.com, linux-doc@vger.kernel.org, peterz@infradead.org, catalin.marinas@arm.com, yangyicong@hisilicon.com, linux-mm@kvack.org, Nadav Amit <namit@vmware.com>, guojian@oppo.com, linux-riscv@lists.infradead.org, will@kernel.org, linux-s390@vger.kernel.org, zhangshiming@oppo.com, lipeifeng@oppo.com, corbet@lwn.net, x86@kernel.org, Mel Gorman <mgorman@suse.de>, linux-mips@vger.kernel.org, arnd@arndb.de, Anshuman Khandual <anshuman.khandual@arm.com>, Barry Song <v-songbaohua@oppo.com>, openrisc@lists.librecores.org, darren@os.amperecomputing.com, linux-arm-kernel@lists.infradead.org, xhao@linux.alibaba.com, linux-kernel@vger.kernel.org, huzhanyuan@oppo.com, Yicong Yang <yangyicong@huawei.com>, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 28, 2022 at 3:19 AM Punit Agrawal
<punit.agrawal@bytedance.com> wrote:
>
>
> [ Apologies for chiming in late in the conversation ]
>
> Anshuman Khandual <anshuman.khandual@arm.com> writes:
>
> > On 9/28/22 05:53, Barry Song wrote:
> >> On Tue, Sep 27, 2022 at 10:15 PM Yicong Yang <yangyicong@huawei.com> wrote:
> >>>
> >>> On 2022/9/27 14:16, Anshuman Khandual wrote:
> >>>> [...]
> >>>>
> >>>> On 9/21/22 14:13, Yicong Yang wrote:
> >>>>> +static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
> >>>>> +{
> >>>>> +    /* for small systems with small number of CPUs, TLB shootdown is cheap */
> >>>>> +    if (num_online_cpus() <= 4)
> >>>>
> >>>> It would be great to have some more inputs from others, whether 4 (which should
> >>>> to be codified into a macro e.g ARM64_NR_CPU_DEFERRED_TLB, or something similar)
> >>>> is optimal for an wide range of arm64 platforms.
> >>>>
> >>
> >> I have tested it on a 4-cpus and 8-cpus machine. but i have no machine
> >> with 5,6,7
> >> cores.
> >> I saw improvement on 8-cpus machines and I found 4-cpus machines don't need
> >> this patch.
> >>
> >> so it seems safe to have
> >> if (num_online_cpus()  < 8)
> >>
> >>>
> >>> Do you prefer this macro to be static or make it configurable through kconfig then
> >>> different platforms can make choice based on their own situations? It maybe hard to
> >>> test on all the arm64 platforms.
> >>
> >> Maybe we can have this default enabled on machines with 8 and more cpus and
> >> provide a tlbflush_batched = on or off to allow users enable or
> >> disable it according
> >> to their hardware and products. Similar example: rodata=on or off.
> >
> > No, sounds bit excessive. Kernel command line options should not be added
> > for every possible run time switch options.
> >
> >>
> >> Hi Anshuman, Will,  Catalin, Andrew,
> >> what do you think about this approach?
> >>
> >> BTW, haoxin mentioned another important user scenarios for tlb bach on arm64:
> >> https://lore.kernel.org/lkml/393d6318-aa38-01ed-6ad8-f9eac89bf0fc@linux.alibaba.com/
> >>
> >> I do believe we need it based on the expensive cost of tlb shootdown in arm64
> >> even by hardware broadcast.
> >
> > Alright, for now could we enable ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH selectively
> > with CONFIG_EXPERT and for num_online_cpus()  > 8 ?
>
> When running the test program in the commit in a VM, I saw benefits from
> the patches at all sizes from 2, 4, 8, 32 vcpus. On the test machine,
> ptep_clear_flush() went from ~1% in the unpatched version to not showing
> up.
>
> Yicong mentioned that he didn't see any benefit for <= 4 CPUs but is
> there any overhead? I am wondering what are the downsides of enabling
> the config by default.

As we are deferring tlb flush, but sometimes while we are modifying the vma
which are deferred, we need to do a sync by flush_tlb_batched_pending() in
mprotect() , madvise() to make sure they can see the flushed result. if nobody
is doing mprotect(), madvise() etc in the deferred period, the overhead is zero.

>
> Thanks,
> Punit

Thanks
Barry
