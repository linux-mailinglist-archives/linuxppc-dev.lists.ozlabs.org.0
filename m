Return-Path: <linuxppc-dev+bounces-7270-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D108A6BF67
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Mar 2025 17:14:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZK6wJ0HjKz30RN;
	Sat, 22 Mar 2025 03:14:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::82b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742573679;
	cv=none; b=WjylpZrpGH8eaQBEUIjZB1oVW52Old3nl3XofrlkgjbdIPXuDlbBsjgm2jPnUsE1FlpkPpEkfwEP5igwUbAmAY3EbmOhAMxHf7rs7ehpEvyA+U330qF4K/KMqSi11gCJoZgFxt7g7X3oYmfEbokLS4NzWLtUrm7iEzj1falNvDLoL/gK6NN+b3/G31fQeCCGL0SqXYpmQOkIWKE7/HKHe5w+JVwIfiPxQB1llGos8lYr3wUPgHCwGtSlGzS7Lfr8cKef0IQAyybqmLEC9HRrYssy6tOqnB3mzsQBHrbIGdb240urdSyPNR2clJ+DdthBZI2Yox5WmTPx1P3jMBsisg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742573679; c=relaxed/relaxed;
	bh=Lr1NpamvodEP6MFP3VgS0Dk87IubpsnKUE/+euMf6QU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yr13ZwZ/hVfaLXQMrBOXDsLD0K+sNVk/iTnDQ8TKtrr4yYILx1acsbwXXoIsm+wGzLKMs7GC0MCYJVAdOFCLY9BuTYw3xBWp9o54/VNEPkzdalWrcLYjCMHCrbTRsw0DkZlrM748M9wY87WY0wpZn7KPNh10zrZ159OVhvn4RIyY69YCybWjECENDNnZB66ePzxV1ixhWdmTggJVIGZwHC41nNJ+rXO4eWtN176yMw8JvkYldbro1EoIj0L95ZF1xrcSlxxmirpxNQTJ2MP/gEeJt7+dfG1WWwH+S06tvnTAy1XXgCHQS6mPhLcawIE/6snuQF4OL+08p+jtcaVUtA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=VTVHpbas; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::82b; helo=mail-qt1-x82b.google.com; envelope-from=surenb@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=VTVHpbas;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::82b; helo=mail-qt1-x82b.google.com; envelope-from=surenb@google.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZK6wH1Dvxz30RK
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Mar 2025 03:14:39 +1100 (AEDT)
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-47666573242so492921cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Mar 2025 09:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742573677; x=1743178477; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lr1NpamvodEP6MFP3VgS0Dk87IubpsnKUE/+euMf6QU=;
        b=VTVHpbas3LzL9NESnlAkp7j0IM7rGNLSh9OwvRMgFmXB8BnyyVNuo/BGKSgTe9cm0q
         O5Fc+WftRJsalTnG2NY2tev/qHJhZT+6uGvdpzbEidmC508wZ7tHJLvquJnZLDzBMKDy
         ADNQXqRD/rfdwDtgkavvqslXekHDqP5prpyVj8TrmooDVLAm20z7sNDjN1t09WMxm0hC
         pVJINk/Qa/s3mcq3w26K3GVBgnKGdYSiV2ninwSOXcVI/qmpP5FeokzMGmYeV6hdMUWJ
         T4+jHasoDanOX+vmpkJ/2ZthNXxhneHzKnXBtxqYLZCmNnqr9ijxJd1B1f8nWLpT2LJU
         tSkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742573677; x=1743178477;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lr1NpamvodEP6MFP3VgS0Dk87IubpsnKUE/+euMf6QU=;
        b=piPFCg+XMEw+Rx9gwTQw3VC0LmilcTilYUK8dy+sieQ517lDxi5Z+3vxHXgcCylnYx
         n2jOc5IlmyN7AZWTiqJYw75cYZVCkJ2i9YxyJ+QkE/BgaO17rKUs0EPKgskb69z3Pjir
         cIL8HWv49AAG0M+IJd5K2v5XctZv+meHrwftMszNlQjuTG7NKdHr0qNywXZjn02FwzTZ
         ETsXhXIKyOGfqzrSu7xSudMaaHkmnql3QZunb/0j9szc2mnQ/y5Hi0gJl0bxNn4ncGcI
         wPEChS74mS/I0k+G03P/r6d5M/2O1uOI2oFblOit9exuSt8wXdzcBF3xGGIt2U6kKg7A
         KzBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXxkOCNLSEK+P61V6/GgsLNivhgq0K1G29hWX1per4+VT7A58SZ3u8MAXSuKZ250wVz53l3IB/wZO1zsk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw5WrxlKS/IyYoLIHKKKATuSqjb8q3053hdYsHSWF5u+Ep0xDK7
	T1Xdhgatfl3TmmIgiiDL6wRZFGY61FHh1TVv1e5krtdLTTL7lTW/NbMvijCcF8T5wd2zQyu7jr2
	tGotUc+teWdATYuzbZ1PR/B9cunJWq6zj38Zr
X-Gm-Gg: ASbGnctZu4ZtRT6Og3hlU7DHt5FS8wGbF5//MZ9powZMS48bXT6JB4NbpoX6/bgwgkQ
	d2mD7tipUhfkqjUbrHUidRoW4qIsdI4fy6yB/m8hWkHsXGn2VBUNw9/JZG+DPWfZjeN+6TA9wla
	wGXNlWShKNDvoPa/D5e7b63/A/NA==
X-Google-Smtp-Source: AGHT+IFtRdtnxmYqCiNGozdyiDRgbS5XVd2/jJNIMYaa9ildizNYGE8X3N7zH+w9Lm6oeOkoQXAJJ6yRGhxNC/i547Y=
X-Received: by 2002:a05:622a:1c10:b0:476:77be:9102 with SMTP id
 d75a77b69052e-4771f510a8amr3527931cf.7.1742573676464; Fri, 21 Mar 2025
 09:14:36 -0700 (PDT)
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
References: <20250320173931.1583800-1-surenb@google.com> <20250320173931.1583800-4-surenb@google.com>
 <20250321-unhelpful-doze-791895ca5b01@spud>
In-Reply-To: <20250321-unhelpful-doze-791895ca5b01@spud>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 21 Mar 2025 09:14:24 -0700
X-Gm-Features: AQ5f1Jp8UfxX8WOnw9385d8J0NeQgt0g6OSnoez6cTxiRd2n5Bydr6rryoZB6As
Message-ID: <CAJuCfpEujbaSrk5+mR=+vWqwSu-t52fVmbPf5msnpduSB6AT2Q@mail.gmail.com>
Subject: Re: [RFC 3/3] mm: integrate GCMA with CMA using dt-bindings
To: Conor Dooley <conor@kernel.org>
Cc: akpm@linux-foundation.org, willy@infradead.org, david@redhat.com, 
	vbabka@suse.cz, lorenzo.stoakes@oracle.com, liam.howlett@oracle.com, 
	alexandru.elisei@arm.com, peterx@redhat.com, hannes@cmpxchg.org, 
	mhocko@kernel.org, m.szyprowski@samsung.com, iamjoonsoo.kim@lge.com, 
	mina86@mina86.com, axboe@kernel.dk, viro@zeniv.linux.org.uk, 
	brauner@kernel.org, hch@infradead.org, jack@suse.cz, hbathini@linux.ibm.com, 
	sourabhjain@linux.ibm.com, ritesh.list@gmail.com, aneesh.kumar@kernel.org, 
	bhelgaas@google.com, sj@kernel.org, fvdl@google.com, ziy@nvidia.com, 
	yuzhao@google.com, minchan@kernel.org, linux-mm@kvack.org, 
	linuxppc-dev@lists.ozlabs.org, linux-block@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Minchan Kim <minchan@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-16.7 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Mar 21, 2025 at 7:06=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Thu, Mar 20, 2025 at 10:39:31AM -0700, Suren Baghdasaryan wrote:
> > This patch introduces a new "guarantee" property for shared-dma-pool.
> > With this property, admin can create specific memory pool as
> > GCMA-based CMA if they care about allocation success rate and latency.
> > The downside of GCMA is that it can host only clean file-backed pages
> > since it's using cleancache as its secondary user.
> >
> > Signed-off-by: Minchan Kim <minchan@google.com>
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > ---
> >  arch/powerpc/kernel/fadump.c |  2 +-
> >  include/linux/cma.h          |  2 +-
> >  kernel/dma/contiguous.c      | 11 ++++++++++-
> >  mm/cma.c                     | 33 ++++++++++++++++++++++++++-------
> >  mm/cma.h                     |  1 +
> >  mm/cma_sysfs.c               | 10 ++++++++++
> >  6 files changed, 49 insertions(+), 10 deletions(-)
> >
> > diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.=
c
> > index 4b371c738213..4eb7be0cdcdb 100644
> > --- a/arch/powerpc/kernel/fadump.c
> > +++ b/arch/powerpc/kernel/fadump.c
> > @@ -111,7 +111,7 @@ void __init fadump_cma_init(void)
> >               return;
> >       }
> >
> > -     rc =3D cma_init_reserved_mem(base, size, 0, "fadump_cma", &fadump=
_cma);
> > +     rc =3D cma_init_reserved_mem(base, size, 0, "fadump_cma", &fadump=
_cma, false);
> >       if (rc) {
> >               pr_err("Failed to init cma area for firmware-assisted dum=
p,%d\n", rc);
> >               /*
> > diff --git a/include/linux/cma.h b/include/linux/cma.h
> > index 62d9c1cf6326..3207db979e94 100644
> > --- a/include/linux/cma.h
> > +++ b/include/linux/cma.h
> > @@ -46,7 +46,7 @@ extern int __init cma_declare_contiguous_multi(phys_a=
ddr_t size,
> >  extern int cma_init_reserved_mem(phys_addr_t base, phys_addr_t size,
> >                                       unsigned int order_per_bit,
> >                                       const char *name,
> > -                                     struct cma **res_cma);
> > +                                     struct cma **res_cma, bool gcma);
> >  extern struct page *cma_alloc(struct cma *cma, unsigned long count, un=
signed int align,
> >                             bool no_warn);
> >  extern bool cma_pages_valid(struct cma *cma, const struct page *pages,=
 unsigned long count);
> > diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
> > index 055da410ac71..a68b3123438c 100644
> > --- a/kernel/dma/contiguous.c
> > +++ b/kernel/dma/contiguous.c
> > @@ -459,6 +459,7 @@ static int __init rmem_cma_setup(struct reserved_me=
m *rmem)
> >       unsigned long node =3D rmem->fdt_node;
> >       bool default_cma =3D of_get_flat_dt_prop(node, "linux,cma-default=
", NULL);
> >       struct cma *cma;
> > +     bool gcma;
> >       int err;
> >
> >       if (size_cmdline !=3D -1 && default_cma) {
> > @@ -476,7 +477,15 @@ static int __init rmem_cma_setup(struct reserved_m=
em *rmem)
> >               return -EINVAL;
> >       }
> >
> > -     err =3D cma_init_reserved_mem(rmem->base, rmem->size, 0, rmem->na=
me, &cma);
> > +     gcma =3D !!of_get_flat_dt_prop(node, "guarantee", NULL);
>
> When this (or if I guess) this goes !RFC, you will need to document this
> new property that you're adding.

Definitely. I'll document the cleancache and GCMA as well.
Thanks!

