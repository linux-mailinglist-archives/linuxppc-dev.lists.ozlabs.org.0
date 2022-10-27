Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E3D61055E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Oct 2022 00:09:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mz0FZ1b3sz3cK7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Oct 2022 09:09:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JfXFlJ4w;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com; envelope-from=21cnbao@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JfXFlJ4w;
	dkim-atps=neutral
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mz0Df5kN0z3c6D
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Oct 2022 09:08:16 +1100 (AEDT)
Received: by mail-ed1-x529.google.com with SMTP id z97so5201178ede.8
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Oct 2022 15:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=r9RELUveKiUS67KqsZJxwv+GhPKYSZmmNpqGyp3KeL0=;
        b=JfXFlJ4wCnFvi9jr1lx+vzRzL6wNpHsAjP9ImZnD7o4RBGnGK2q+Hkr1AfP8BCQ9Em
         ClHUmPJP2mw+Jv3BwJXHu6/WlG1YnKxhdbpWzIIvAY5/f9Vxpo+eZyR9J2P450gcz8d1
         ZC0/nutQ/zH7Y66UzyXySNTXBIJautFH3rHTDUUKyL6h8tPUGGZe1HOupswJUrG2WXWh
         +9GBIBs7lmr8PJ9X8My5e7ss2akjSuXDKad86M5NIahpuIZGpF+4dt+j5j1ukAM1P/2k
         hXW1Ih6c/LqiyAWoQITdGwfnPwsd65hnISqhXdmzfZ1XLNvFKrTDl6KQGSY4zv9DIe2f
         JDtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r9RELUveKiUS67KqsZJxwv+GhPKYSZmmNpqGyp3KeL0=;
        b=xYpY0ZNt6jOO+LghMSK+/2Pbisl2Xu+gB7oaWqpVczseneTZAmao5vhehnpPqHrSUB
         E5YmpCzSDNMl6ihtmRZyuas83ty+GMCH+uI9+III0raLWZPHxsCkF2h+tWeUmhIIIycQ
         7Ope8wJIoNb1eOAf1kRivRchwRrbYcLBHTa9CjGbGbiGTuRFCOekCnsWumj3p0eKdxkG
         xC/Gvf0D2iy8mfWbn0OkhWxs9aHLIwXZAP4e6D5JAWTmfJGWRNMOL88wU/RQ722L2Qzf
         IqT/k4ZQQ+p9jWbH2VY9FXDEhksp81MgnvZw0PfP/K/bydNF/FlLAzGgMo5F63Ichy2h
         6TTw==
X-Gm-Message-State: ACrzQf12lrH4l6apPv9EFXBMbLZPXzew4S/WSZA/OxW+M8drlU6zAvaT
	S/W/G2dEzxqttuU18NWV7ra0WY+cukooEjFO18Y=
X-Google-Smtp-Source: AMsMyM7WF/u9jCTtkVgKvkXWMMsUAzTmGbv2jIoDElJSEwL95CQMTNB+W2XiN6KO+oglta/8KUl11BElPtkjS3OhWbc=
X-Received: by 2002:aa7:d80a:0:b0:462:2c1c:8716 with SMTP id
 v10-20020aa7d80a000000b004622c1c8716mr13941343edq.185.1666908492601; Thu, 27
 Oct 2022 15:08:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220921084302.43631-1-yangyicong@huawei.com> <20220921084302.43631-3-yangyicong@huawei.com>
 <168eac93-a6ee-0b2e-12bb-4222eff24561@arm.com> <8e391962-4e3a-5a56-64b4-78e8637e3b8c@huawei.com>
 <CAGsJ_4z=dZbrAUD9jczT08S3qi_ep-h+EK35UfayVk1S+Cnp2A@mail.gmail.com> <ecd161db-b290-7997-a81e-a0a00bd1c599@arm.com>
In-Reply-To: <ecd161db-b290-7997-a81e-a0a00bd1c599@arm.com>
From: Barry Song <21cnbao@gmail.com>
Date: Fri, 28 Oct 2022 11:07:58 +1300
Message-ID: <CAGsJ_4x0KhEjm5a9jhtS+YK1AT49u3sHnp2rHZVSuTGZp4nKzA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] arm64: support batched/deferred tlb shootdown
 during page reclamation
To: Anshuman Khandual <anshuman.khandual@arm.com>
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
Cc: wangkefeng.wang@huawei.com, prime.zeng@hisilicon.com, linux-doc@vger.kernel.org, peterz@infradead.org, catalin.marinas@arm.com, yangyicong@hisilicon.com, linux-mm@kvack.org, Nadav Amit <namit@vmware.com>, guojian@oppo.com, linux-riscv@lists.infradead.org, will@kernel.org, linux-s390@vger.kernel.org, zhangshiming@oppo.com, lipeifeng@oppo.com, corbet@lwn.net, x86@kernel.org, Mel Gorman <mgorman@suse.de>, linux-mips@vger.kernel.org, arnd@arndb.de, realmz6@gmail.com, Barry Song <v-songbaohua@oppo.com>, openrisc@lists.librecores.org, darren@os.amperecomputing.com, linux-arm-kernel@lists.infradead.org, xhao@linux.alibaba.com, linux-kernel@vger.kernel.org, huzhanyuan@oppo.com, Yicong Yang <yangyicong@huawei.com>, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 27, 2022 at 11:42 PM Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
>
>
>
> On 9/28/22 05:53, Barry Song wrote:
> > On Tue, Sep 27, 2022 at 10:15 PM Yicong Yang <yangyicong@huawei.com> wrote:
> >>
> >> On 2022/9/27 14:16, Anshuman Khandual wrote:
> >>> [...]
> >>>
> >>> On 9/21/22 14:13, Yicong Yang wrote:
> >>>> +static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
> >>>> +{
> >>>> +    /* for small systems with small number of CPUs, TLB shootdown is cheap */
> >>>> +    if (num_online_cpus() <= 4)
> >>>
> >>> It would be great to have some more inputs from others, whether 4 (which should
> >>> to be codified into a macro e.g ARM64_NR_CPU_DEFERRED_TLB, or something similar)
> >>> is optimal for an wide range of arm64 platforms.
> >>>
> >
> > I have tested it on a 4-cpus and 8-cpus machine. but i have no machine
> > with 5,6,7
> > cores.
> > I saw improvement on 8-cpus machines and I found 4-cpus machines don't need
> > this patch.
> >
> > so it seems safe to have
> > if (num_online_cpus()  < 8)
> >
> >>
> >> Do you prefer this macro to be static or make it configurable through kconfig then
> >> different platforms can make choice based on their own situations? It maybe hard to
> >> test on all the arm64 platforms.
> >
> > Maybe we can have this default enabled on machines with 8 and more cpus and
> > provide a tlbflush_batched = on or off to allow users enable or
> > disable it according
> > to their hardware and products. Similar example: rodata=on or off.
>
> No, sounds bit excessive. Kernel command line options should not be added
> for every possible run time switch options.
>
> >
> > Hi Anshuman, Will,  Catalin, Andrew,
> > what do you think about this approach?
> >
> > BTW, haoxin mentioned another important user scenarios for tlb bach on arm64:
> > https://lore.kernel.org/lkml/393d6318-aa38-01ed-6ad8-f9eac89bf0fc@linux.alibaba.com/
> >
> > I do believe we need it based on the expensive cost of tlb shootdown in arm64
> > even by hardware broadcast.
>
> Alright, for now could we enable ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH selectively
> with CONFIG_EXPERT and for num_online_cpus()  > 8 ?

Sounds good to me. It is a good start to bring up tlb batched flush in
ARM64. Later on, we
might want to see it in both memory reclamation and migration.

Thanks
Barry
