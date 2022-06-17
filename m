Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA8C54FA38
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 17:27:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPjZl0btzz3cBR
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jun 2022 01:27:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.219.52; helo=mail-qv1-f52.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LPjZJ5GRZz2ynh
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jun 2022 01:26:48 +1000 (AEST)
Received: by mail-qv1-f52.google.com with SMTP id o43so6911627qvo.4
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jun 2022 08:26:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nxeOkeINDpzy3OEEqm+X2I0MEyWZgikOx3MDeUuxZIA=;
        b=yVp2qR+HXGPUBB7mrgGDrjhoskHmTI/ZLpezOrmwp8xlhhyYJwkQHKkwivKGm0qoEc
         WK2xnWy43wCvM8ihNI9GIjvmpca34RiGdSTf0ZXS1YKmPFBJB8vnQTGmYbeAuoseQOdc
         7SwSlcB86CSrKBYP4B0QliSid00FK2HxrP7ra7bjDI+z4dfYkWkBsn5O18DD47Q09ou/
         wMFXzSoFTNO2PbKVhzr0r0qhW/YnhK3izbWx5uD+qCd371j7IWpHsAdBAcr35bUO44Yq
         P4rBFobuNEIAA+Rq1nX6Gz4mxrwa1Z4P5YsOGbNLqHPAbjTNANDWB7vurow6xdFZdAGK
         WlIA==
X-Gm-Message-State: AJIora9jF5/9n8PDPHYmZNec8Lao97rfK1badaa71u/Lo7/209Wyl3SJ
	XPpNycbic5c4U5xzd/J9M07RHnW9otkWWQ==
X-Google-Smtp-Source: AGRyM1tggZqq4txTsrdBP63hrIeNZ8pEc8OuhNqqzNtgTe/E8TwpaePfIsU07x6pwob6kkv05U/ElA==
X-Received: by 2002:ac8:57c3:0:b0:305:2dbd:92b3 with SMTP id w3-20020ac857c3000000b003052dbd92b3mr9048073qta.173.1655479603951;
        Fri, 17 Jun 2022 08:26:43 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id bm31-20020a05620a199f00b006a6a1e4aec2sm4297038qkb.49.2022.06.17.08.26.42
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 08:26:43 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id v22so7828761ybd.5
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jun 2022 08:26:42 -0700 (PDT)
X-Received: by 2002:a05:6902:905:b0:64a:2089:f487 with SMTP id
 bu5-20020a056902090500b0064a2089f487mr11481017ybb.202.1655479602392; Fri, 17
 Jun 2022 08:26:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220616210518.125287-1-mike.kravetz@oracle.com>
 <20220616210518.125287-2-mike.kravetz@oracle.com> <YqyMhmAjrQ4C+EyA@xz-m1.local>
In-Reply-To: <YqyMhmAjrQ4C+EyA@xz-m1.local>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 17 Jun 2022 17:26:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU-qdNMqwtpm+PMixKoicYHPokAQqWAh-Vw-sjZz_z7xA@mail.gmail.com>
Message-ID: <CAMuHMdU-qdNMqwtpm+PMixKoicYHPokAQqWAh-Vw-sjZz_z7xA@mail.gmail.com>
Subject: Re: [PATCH 1/4] hugetlb: skip to end of PT page mapping when pte not present
To: Peter Xu <peterx@redhat.com>
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
Cc: Michal Hocko <mhocko@suse.com>, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, Linux-sh list <linux-sh@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Muchun Song <songmuchun@bytedance.com>, "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, Linux MM <linux-mm@kvack.org>, James Houghton <jthoughton@google.com>, sparclinux <sparclinux@vger.kernel.org>, Will Deacon <will@kernel.org>, Mina Almasry <almasrymina@google.com>, linux-s390 <linux-s390@vger.kernel.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Paul Walmsley <paul.walmsley@sifive.com>, Naoya Horiguchi <naoya.horiguchi@linux.dev>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Parisc List <linux-parisc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Aneesh Kumar K . V" <aneesh.kumar@linux.vnet.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-d
 ev <linuxppc-dev@lists.ozlabs.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Peter,

On Fri, Jun 17, 2022 at 4:22 PM Peter Xu <peterx@redhat.com> wrote:
> On Thu, Jun 16, 2022 at 02:05:15PM -0700, Mike Kravetz wrote:
> > @@ -6877,6 +6896,39 @@ pte_t *huge_pte_offset(struct mm_struct *mm,
> >       return (pte_t *)pmd;
> >  }
> >
> > +/*
> > + * Return a mask that can be used to update an address to the last huge
> > + * page in a page table page mapping size.  Used to skip non-present
> > + * page table entries when linearly scanning address ranges.  Architectures
> > + * with unique huge page to page table relationships can define their own
> > + * version of this routine.
> > + */
> > +unsigned long hugetlb_mask_last_page(struct hstate *h)
> > +{
> > +     unsigned long hp_size = huge_page_size(h);
> > +
> > +     switch (hp_size) {
> > +     case P4D_SIZE:
> > +             return PGDIR_SIZE - P4D_SIZE;
> > +     case PUD_SIZE:
> > +             return P4D_SIZE - PUD_SIZE;
> > +     case PMD_SIZE:
> > +             return PUD_SIZE - PMD_SIZE;
> > +     default:
>
> Should we add a WARN_ON_ONCE() if it should never trigger?

And with panic_on_warn, it'll panic only once ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
