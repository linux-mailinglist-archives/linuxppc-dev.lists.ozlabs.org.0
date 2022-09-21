Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA4B5BF326
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 03:52:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXLy86BlHz3c7D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 11:52:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=prR2d7IC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com; envelope-from=21cnbao@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=prR2d7IC;
	dkim-atps=neutral
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXLxY68s0z308B
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 11:51:45 +1000 (AEST)
Received: by mail-ed1-x533.google.com with SMTP id a41so6515551edf.4
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 18:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=exktuqp3Yz0O7DTOQAZcnS95GYeriR3HpkAUKtRfC9k=;
        b=prR2d7IC8d3KTQfnrJuC6umcuUbOTsTHYnt/TN+mB7C0ksEVF09+y5pzwSr5hUcgfQ
         3S6TNC1vUWzt0CWTWTgxvQjIa+srt85URQX7boT8YzDwD04EMRwBIQ5wnmBXQh5ojZFP
         mb5cXtroEJ1QUj5aQRtcZ2eSbRkZJBKgrfwSP3a1AOX3PzhiPJyWAxUHhPNM+zljeEdC
         RPEj/BOnWcjjlJYt0fOi284UWlelcdxkXKEvCjZSCzcEsRYi4gcGLSaSfe1/qg6igU91
         8UMCYOG2BCz3q0FrpJnwDfEEW2sdvH6TIn+LqzqIaLzJkw4LJ5e/RUB96Vy1z5+wyzxa
         40yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=exktuqp3Yz0O7DTOQAZcnS95GYeriR3HpkAUKtRfC9k=;
        b=GRULbXz9CwhoinfrSBzYJzL/uDZhdkdhWjr89lFUCq1J+9Nhs8TLjTTR9lWxdkS0OE
         lJzOzHRqSW+fUZiE+PjaHArYZTxWJFJCfb/qNNo19mce8yROnkYugz45S0p63jFIPIBT
         GzgALjzP8Ojqx9GDFdzEQuCtXhMW+akPjgEUnASb/9/rqyn+vivUIVqKhpposS1n6g+6
         x7QRjfA2+dlXmn22hPg0EcfuXnDblFiONuIfpHBbn4WGW+OH5pbtmBV5WurHMeZTB9YP
         lqU/fR1tc3JFYM0PGLm7+sACpjpiZDeiGOsSr7oCP9VOyp59AxHU5BrYOTI/+b8DLrG+
         K5/g==
X-Gm-Message-State: ACrzQf3C3Qzlr9qdkf4XgcBGF8Eqc/AcG6A//AzUa+JL9h1MQ3l1uuCM
	NbFBqHr/YpORy7I5+7c0V2y+XjmJ2b/dSncWteA=
X-Google-Smtp-Source: AMsMyM5v9dTlzaqMHbzByB0iQp6q4d17pnEGAvmmK5ZnmNrYfXTWs2nOXnV+B27bLIMXIY5zqA4ppXvLi5hsTQlRwTY=
X-Received: by 2002:a05:6402:184:b0:442:fd54:2a21 with SMTP id
 r4-20020a056402018400b00442fd542a21mr22357803edv.129.1663725101717; Tue, 20
 Sep 2022 18:51:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220822082120.8347-1-yangyicong@huawei.com> <20220822082120.8347-5-yangyicong@huawei.com>
 <302febae-508c-d73e-8676-d51752946645@arm.com> <CAGsJ_4ywwFJFi+q3Ra5UE3twzS9eExtvuXgoGK-8u4c1ZdXCBw@mail.gmail.com>
 <8c4f103b-8f04-d0ad-b30a-2db7e52b36a3@arm.com> <CAGsJ_4xCpSFneh7dPriGeM2_z5njB71cXKGfrarc8Kq0CA37CQ@mail.gmail.com>
In-Reply-To: <CAGsJ_4xCpSFneh7dPriGeM2_z5njB71cXKGfrarc8Kq0CA37CQ@mail.gmail.com>
From: Barry Song <21cnbao@gmail.com>
Date: Wed, 21 Sep 2022 13:51:30 +1200
Message-ID: <CAGsJ_4y0HrWd90ApAn=eDpYrkCigM6MyH=3cYnSuunZ5QpsD3w@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] arm64: support batched/deferred tlb shootdown
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

On Wed, Sep 21, 2022 at 1:50 PM Barry Song <21cnbao@gmail.com> wrote:
>
> On Tue, Sep 20, 2022 at 8:45 PM Anshuman Khandual
> <anshuman.khandual@arm.com> wrote:
> >
> >
> >
> > On 9/20/22 09:09, Barry Song wrote:
> > > On Tue, Sep 20, 2022 at 3:00 PM Anshuman Khandual
> > > <anshuman.khandual@arm.com> wrote:
> > >>
> > >>
> > >> On 8/22/22 13:51, Yicong Yang wrote:
> > >>> +static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
> > >>> +{
> > >>> +     return true;
> > >>> +}
> > >>
> > >> This needs to be conditional on systems, where there will be performance
> > >> improvements, and should not just be enabled all the time on all systems.
> > >> num_online_cpus() > X, which does not hold any cpu hotplug lock would be
> > >> a good metric ?
> > >
> > > for a small system, i don't see how this patch will help, e.g. cpus <= 4;
> > > so we can actually disable tlb-batch on small systems.
> >
> > Do not subscribe ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH based on NR_CPUS ?
> > That might not help much as the default value is 256 for NR_CPUS.
> >
> > OR
> >
> > arch_tlbbatch_should_defer() checks on
> >
> > 1. online cpus                  (dont enable batched TLB if <= X)
> > 2. ARM64_WORKAROUND_REPEAT_TLBI (dont enable batched TLB)
> >
> > > just need to check if we will have any race condition since hotplug will
> > > make the condition true and false dynamically.
> >
> > If should_defer_flush() evaluate to be false, then ptep_clear_flush()
> > clears and flushes the entry right away. This should not race with other
> > queued up TLBI requests, which will be flushed separately. Wondering how
> > there can be a race here !
>
> Right. How about we make something as below?
>
> static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
> {
>     /* for a small system very small number of CPUs, TLB shootdown is cheap */
>     if (num_online_cpus() <= 4 ||
> unlikely(this_cpu_has_cap(ARM64_WORKAROUND_REPEAT_TLBI)))
>           return false;
>
> #ifdef CONFIG_ARM64_WORKAROUND_REPEAT_TLBI
>     if (unlikely(this_cpu_has_cap(ARM64_WORKAROUND_REPEAT_TLBI)))
>          return false;
> #endif
>
>     return true;
> }

sorry, i mean

static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
{
    /* for a small system very small number of CPUs, TLB shootdown is cheap */
    if (num_online_cpus() <= 4)
            return false;

#ifdef CONFIG_ARM64_WORKAROUND_REPEAT_TLBI
    if (unlikely(this_cpu_has_cap(ARM64_WORKAROUND_REPEAT_TLBI)))
            return false;
#endif

    return true;
}

>
> Thanks
> Barry
