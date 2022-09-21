Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 909AB5BF76C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 09:16:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXV7g23Lnz3gMh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 17:15:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=UiTMai2Y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com; envelope-from=21cnbao@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=UiTMai2Y;
	dkim-atps=neutral
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXV7331Mhz3bk0
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 17:15:26 +1000 (AEST)
Received: by mail-ed1-x536.google.com with SMTP id z97so7235392ede.8
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 00:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=z9jXMKTsbXt/GY48g/wdOYArfXNGBa3cbn0t4HSGf7c=;
        b=UiTMai2YO907oZTmL2uRRBUvQZje672mf6EbZ9LgXUMIQqDtJoEU89YEJ98C1iKFq6
         6aeo1LqTpUmEdFw2CaSaL28YZg63X9PaAExd1UpR0MksLPUasxQTMUS69mrLKvm0i5tk
         e+hFnF/9spxfT0XRQ4XHRAw+QOtJoML5Vz1O2F4ZVoDwC/N5QPHI623PCIhl5qf2Uzs6
         VtL7p6OurNamkmgIdL4rb5sRfKwpRieDiY2ZiC2WZG4mXXiBevFcf0mmEL8JqIYWdM6i
         PRQdgQ5j9YvBGXmjMfUP4G3iqVPZJBS27lF04is8Z5yupn+hVJQtVn2lVCtMTZdQPasZ
         8cvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=z9jXMKTsbXt/GY48g/wdOYArfXNGBa3cbn0t4HSGf7c=;
        b=BojEa/PeT5dnPK3F19a8hJfkl9uhxhBHKSCdxJ9dSNfLwJf3xuYd1NwfE63eEC8WdM
         78XjQSOjKf0zOa4OssRfj+O34zb8eJI18kiSUGS8Fld4jtAwcgbkOljLTtOXNFuRUNcR
         kv/nbkEVER6vMVxnkD6dMueGFTm+P8JUBULcBEGydaMeDt7B7M623iCNkAHo0yQByBJA
         2AkxmvHziVeTu2vynCu5t3yHCl61e5Coz/Ji1P/IWQDiG9n9P21IcGk000tHrddEdwNs
         jAqy86EmzyHAmwBLaNWcxveoSTpEKQGaxzo3q+H9jRnfhHhef3QwoKoPX8aGkN75nkBl
         0Tlg==
X-Gm-Message-State: ACrzQf0WtYpA1GM6YtrhCROsoNaZLz9/jCnIYRWqUbtCzAVX5Y7LqsXA
	g2EhvdvUKJjJk6ZAvxZns6G11o1noGj0ea9w7/E=
X-Google-Smtp-Source: AMsMyM55Ybm0ogt2YynX5Ic5pid72Oh9X7U20E3TfVabrhaJXkQZyVhJOQK1a/CYV33WISOGkFZPMdCY+LA22ybkLZI=
X-Received: by 2002:a05:6402:1e8d:b0:441:58db:b6a2 with SMTP id
 f13-20020a0564021e8d00b0044158dbb6a2mr22952604edf.277.1663744522301; Wed, 21
 Sep 2022 00:15:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220822082120.8347-1-yangyicong@huawei.com> <20220822082120.8347-5-yangyicong@huawei.com>
 <888da5f3-104c-3929-c21e-c710922d6f1e@arm.com>
In-Reply-To: <888da5f3-104c-3929-c21e-c710922d6f1e@arm.com>
From: Barry Song <21cnbao@gmail.com>
Date: Wed, 21 Sep 2022 19:15:10 +1200
Message-ID: <CAGsJ_4wtkSfH2DTDg10qTbUkxD1QTNBD09nx_H+S6H_-tBPQBw@mail.gmail.com>
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

On Wed, Sep 21, 2022 at 6:53 PM Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
>
>
> On 8/22/22 13:51, Yicong Yang wrote:
> > +static inline void arch_tlbbatch_add_mm(struct arch_tlbflush_unmap_batch *batch,
> > +                                     struct mm_struct *mm,
> > +                                     unsigned long uaddr)
> > +{
> > +     __flush_tlb_page_nosync(mm, uaddr);
> > +}
> > +
> > +static inline void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
> > +{
> > +     dsb(ish);
> > +}
>
> Just wondering if arch_tlbbatch_add_mm() could also detect continuous mapping
> TLB invalidation requests on a given mm and try to generate a range based TLB
> invalidation such as flush_tlb_range().
>
> struct arch_tlbflush_unmap_batch via task->tlb_ubc->arch can track continuous
> ranges while being queued up via arch_tlbbatch_add_mm(), any range formed can
> later be flushed in subsequent arch_tlbbatch_flush() ?
>
> OR
>
> It might not be worth the effort and complexity, in comparison to performance
> improvement, TLB range flush brings in ?

Probably it is not worth the complexity as perf annotate shows
"
Further perf annonate shows 95% cpu time of ptep_clear_flush
is actually used by the final dsb() to wait for the completion
of tlb flush."

so any further optimization before dsb(ish) might bring some improvement
but seems minor.

Thanks
Barry
