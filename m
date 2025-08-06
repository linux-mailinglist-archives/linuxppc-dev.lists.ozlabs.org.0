Return-Path: <linuxppc-dev+bounces-10693-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B836B1C775
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Aug 2025 16:15:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bxskz5VVvz30W5;
	Thu,  7 Aug 2025 00:15:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::135"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754489723;
	cv=none; b=i/Fze36tIkIPVY7zP+xcz3oD2dKYQdL5ZhLWT9BoihToaHshmTSpvgHedX5j35XoCp4n2gsB8vaYw9mCMy2D7L3neWU9XhkY0nThjx5I9Z8cJtufaf0SZ4PAs5L3YVdBp6lv11/ynvjWqNL4vxJURD1Ze53x+HN2HbUXa6yriYp/LE1joXJJ+mn8Ljizy2GrtI570m7cmHoX/VMpqKg1X9O65XZIh0NXz/LnDGX4sCSF33icGx6cUR5D045Ck0pmDm/7L8WJA76iUnHJH9mL1U4smwbgX9Dx/FHNAa60enDky47NOAoTOwgnMRRL386EejX0piSguBDfaHs82A2SgA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754489723; c=relaxed/relaxed;
	bh=HHHtXBq5WO+vvcc0f+jtGoFoRXRDF9tjNLE6vwGhp98=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mz5xW5fOo9CJNuZpPPewmsFJCYi8Avc871R9NIHTqTDs0qAvp3YucOVT6eLygLxBxqOFgSC+WwYwS+V3eSYPbitjgtdxiSfveitqySq1tGb5AAbUGX30BpuWwH5zrZwZnaz0ZLgoiiAR97z/YQHXlsSmfNnmE+e1fq0SYw/J13LMe2gjmDBpDqhbErNlRxrWYl8HbT8bCRNZ5VzhkSqymvhYkmmNaLrJNyODZtY4Viadrh7bzx/fGVNyN1sbOfa2PkLt/fxKhRhWC7+I++HSylPVpVolFQ4tQvIQDWu63WhP5kL3EvLg5fbSuzH3yjykiaH08roIQO1LWuSXWWpdWw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ZUveDQ0/; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ZUveDQ0/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bxsky3028z2ygJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Aug 2025 00:15:21 +1000 (AEST)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-55b88369530so8351415e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Aug 2025 07:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754489718; x=1755094518; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HHHtXBq5WO+vvcc0f+jtGoFoRXRDF9tjNLE6vwGhp98=;
        b=ZUveDQ0//1hCSl56K1O68dyeAkgFptdsaeOy7qW9Ry3DWIGaQHtWR32pgKUkKFdpxL
         ENFsFplFV+88vTDJR8IwvYtrszILt/8dO2vGRLtImkCb4dhf0aSXZGSTgZe9Yi+A2Bde
         Ah9oQMHmtWBukb87zuazC88YcCA30gc1U7JTiG/N0gILlcexZBfjvdSH5NZ0Xxr+qwUy
         CZAWkhFidSW3NXRawUmo2b6KHUB5rFuzpC78GeuqkDYAh9AuOfaowwv9GjvKhwimyH3e
         Y6td2DhIGeEEbiHKu/WWX/8VFHh/F/DvJ9rCrcmar66U8WQyldDCsmsAaLOB1pvPRSB8
         FWSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754489718; x=1755094518;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HHHtXBq5WO+vvcc0f+jtGoFoRXRDF9tjNLE6vwGhp98=;
        b=LaULgiS/RWNrakUOgU8zJZIkhExMZghPCM+lDAOcgweZUbQT1wQovOIdmX51R0mEFx
         uozHqpYhHVWqyu4KIAZzVDUTo5yJFyfrJugP98PX2d59ANPGiZQ+AKOl8ceDxF6qbVSH
         ElFn5bzUfg7rzVV9quVNItYSlugQiXQ0T/kJ1ZOpjOga1ogfyv3EuZ7S2IlGNruLqE4n
         qgR3t00ZpwwPgWVNwHvohmN9d1qirIZGoaxlxoB/fOWDLWlo8Q19+NV13aGcbqgD8uMZ
         5gpRhWWa82eKW1OXL3Mh5OtRTTr6w7NI8oc+RvyRUldlRa8ygz+u9JLuXc3Vweq5ISi4
         G2Vw==
X-Forwarded-Encrypted: i=1; AJvYcCUnk9QqXE6Y20STszhSpc3Dm49qyZTYEmR4jtre1XjaqwsaJJdtqmm5pteMqeueXUuzNELwV8AYqySML1U=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy1m+G/VM+Aeyv230BDnSQbCKWeLElR3Da3S0mA/CRu/PiUtiyk
	qB+zV95/1vmlKyLE7Os89K6k3mtBRtwu7S4lcgsaQULQ+U9woSjBEHq9ZwUsPCMnhi+OIkK1B0c
	xkWfItck+M8Y4af/QqF6fBTIzFm8ua94=
X-Gm-Gg: ASbGncvTbaX+uQ64JcoM40msre/20manVkQaCuukh31m3NL3uK2L74BspIp08GXTZ8c
	58oH8Iag2B/QwjLyJtaE0mHc+Sce04AmlkngoQshXE36DQCLdanhCw/PrZGf5yilafiyjHz0xQ5
	QEA5jISu6UWwjy4236ta9wwgOq1/cRhntjufKTMGRHSint5W8QViq4v6NZe50eV24SE6Z3BgDK9
	7tJFs+bd2nJwJYOgg==
X-Google-Smtp-Source: AGHT+IGJIXTvnACCtHBTy4xxxFNjsKAhes5Wv7IRo3RcAz7+56gG6smaMf7pNYbDbu4cgI3F5Fzl+OIwDZB8GhsMAoI=
X-Received: by 2002:a05:6512:144c:10b0:55a:90b:7a37 with SMTP id
 2adb3069b0e04-55caf3b36c2mr652245e87.50.1754489718011; Wed, 06 Aug 2025
 07:15:18 -0700 (PDT)
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
Precedence: list
MIME-Version: 1.0
References: <20250805142622.560992-1-snovitoll@gmail.com> <20250805142622.560992-2-snovitoll@gmail.com>
 <5a73e633-a374-47f2-a1e1-680e24d9f260@gmail.com>
In-Reply-To: <5a73e633-a374-47f2-a1e1-680e24d9f260@gmail.com>
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Date: Wed, 6 Aug 2025 19:15:01 +0500
X-Gm-Features: Ac12FXyPyQ2NShErRdFgyvw5rZUg2mPvtAtIHmw2QjkFVe_vIUdzA6ST_4dfZTU
Message-ID: <CACzwLxg=zC-82sY6f-z0VOnmbpN2E8tQxe7RyOnynpbJEFP+NA@mail.gmail.com>
Subject: Re: [PATCH v4 1/9] kasan: introduce ARCH_DEFER_KASAN and unify static
 key across modes
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: hca@linux.ibm.com, christophe.leroy@csgroup.eu, andreyknvl@gmail.com, 
	agordeev@linux.ibm.com, akpm@linux-foundation.org, zhangqing@loongson.cn, 
	chenhuacai@loongson.cn, trishalfonso@google.com, davidgow@google.com, 
	glider@google.com, dvyukov@google.com, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-um@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Aug 6, 2025 at 6:35=E2=80=AFPM Andrey Ryabinin <ryabinin.a.a@gmail.=
com> wrote:
>
>
>
> On 8/5/25 4:26 PM, Sabyrzhan Tasbolatov wrote:
> > Introduce CONFIG_ARCH_DEFER_KASAN to identify architectures that need
> > to defer KASAN initialization until shadow memory is properly set up,
> > and unify the static key infrastructure across all KASAN modes.
> >
> > Some architectures (like PowerPC with radix MMU) need to set up their
> > shadow memory mappings before KASAN can be safely enabled, while others
> > (like s390, x86, arm) can enable KASAN much earlier or even from the
> > beginning.
> >
> > Historically, the runtime static key kasan_flag_enabled existed only fo=
r
> > CONFIG_KASAN_HW_TAGS mode. Generic and SW_TAGS modes either relied on
> > architecture-specific kasan_arch_is_ready() implementations or evaluate=
d
> > KASAN checks unconditionally, leading to code duplication.
> >
> > Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D217049
> > Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
> > ---
> > Changes in v4:
> > - Fixed HW_TAGS static key functionality (was broken in v3)
>
> I don't think it fixed. Before you patch kasan_enabled() esentially
> worked like this:
>
>  if (IS_ENABLED(CONFIG_KASAN_HW_TAGS))
>         return static_branch_likely(&kasan_flag_enabled);
>  else
>         return IS_ENABLED(CONFIG_KASAN);
>
> Now it's just IS_ENABLED(CONFIG_KASAN);

In v4 it is:

        #if defined(CONFIG_ARCH_DEFER_KASAN) || defined(CONFIG_KASAN_HW_TAG=
S)
        static __always_inline bool kasan_shadow_initialized(void)
        {
                return static_branch_likely(&kasan_flag_enabled);
        }
        #else
        static __always_inline bool kasan_shadow_initialized(void)
        {
                return kasan_enabled(); // which is IS_ENABLED(CONFIG_KASAN=
);
        }
        #endif

So for HW_TAGS, KASAN is enabled in kasan_init_hw_tags().

>
> And there are bunch of kasan_enabled() calls left whose behavior changed =
for
> no reason.

By having in v5 the only check kasan_enabled() and used in current mainline=
 code
should be right. I've addressed this comment below. Thanks!

>
>
> > - Merged configuration and implementation for atomicity
> > ---
> >  include/linux/kasan-enabled.h | 36 +++++++++++++++++++++++-------
> >  include/linux/kasan.h         | 42 +++++++++++++++++++++++++++--------
> >  lib/Kconfig.kasan             |  8 +++++++
> >  mm/kasan/common.c             | 18 ++++++++++-----
> >  mm/kasan/generic.c            | 23 +++++++++++--------
> >  mm/kasan/hw_tags.c            |  9 +-------
> >  mm/kasan/kasan.h              | 36 +++++++++++++++++++++---------
> >  mm/kasan/shadow.c             | 32 ++++++--------------------
> >  mm/kasan/sw_tags.c            |  4 +++-
> >  mm/kasan/tags.c               |  2 +-
> >  10 files changed, 133 insertions(+), 77 deletions(-)
> >
> > diff --git a/include/linux/kasan-enabled.h b/include/linux/kasan-enable=
d.h
> > index 6f612d69ea0..52a3909f032 100644
> > --- a/include/linux/kasan-enabled.h
> > +++ b/include/linux/kasan-enabled.h
> > @@ -4,32 +4,52 @@
> >
> >  #include <linux/static_key.h>
> >
> > -#ifdef CONFIG_KASAN_HW_TAGS
> > +/* Controls whether KASAN is enabled at all (compile-time check). */
> > +static __always_inline bool kasan_enabled(void)
> > +{
> > +     return IS_ENABLED(CONFIG_KASAN);
> > +}
> >
> > +#if defined(CONFIG_ARCH_DEFER_KASAN) || defined(CONFIG_KASAN_HW_TAGS)
> > +/*
> > + * Global runtime flag for KASAN modes that need runtime control.
> > + * Used by ARCH_DEFER_KASAN architectures and HW_TAGS mode.
> > + */
> >  DECLARE_STATIC_KEY_FALSE(kasan_flag_enabled);
> >
> > -static __always_inline bool kasan_enabled(void)
> > +/*
> > + * Runtime control for shadow memory initialization or HW_TAGS mode.
> > + * Uses static key for architectures that need deferred KASAN or HW_TA=
GS.
> > + */
> > +static __always_inline bool kasan_shadow_initialized(void)
>
> Don't rename it, just leave as is - kasan_enabled().
> It's better name, shorter and you don't need to convert call sites, so
> there is less chance of mistakes due to unchanged kasan_enabled() -> kasa=
n_shadow_initialized().

I actually had the only check "kasan_enabled()" in v2, but went to
double check approach in v3
after this comment:
https://lore.kernel.org/all/CA+fCnZcGyTECP15VMSPh+duLmxNe=3DApHfOnbAY3NqtFH=
ZvceZw@mail.gmail.com/

Ok, we will have the **only** check kasan_enabled() then in
kasan-enabled.h which

        #if defined(CONFIG_ARCH_DEFER_KASAN) || defined(CONFIG_KASAN_HW_TAG=
S)
        static __always_inline bool kasan_enabled(void)
        {
                return static_branch_likely(&kasan_flag_enabled);
        }
        #else
        static inline bool kasan_enabled(void)
        {
                return IS_ENABLED(CONFIG_KASAN);
        }

And will remove kasan_arch_is_ready (current kasan_shadow_initialized in v4=
).

So it is the single place to check if KASAN is enabled for all arch
and internal KASAN code.
Same behavior is in the current mainline code but only for HW_TAGS.

Is this correct?

>
>
> >  {
> >       return static_branch_likely(&kasan_flag_enabled);
> >  }
> >
> > -static inline bool kasan_hw_tags_enabled(void)
> > +static inline void kasan_enable(void)
> > +{
> > +     static_branch_enable(&kasan_flag_enabled);
> > +}
> > +#else
> > +/* For architectures that can enable KASAN early, use compile-time che=
ck. */
> > +static __always_inline bool kasan_shadow_initialized(void)
> >  {
> >       return kasan_enabled();
> >  }
> >
>
> ...
>
> >
> >  void kasan_populate_early_vm_area_shadow(void *start, unsigned long si=
ze);
> > -int kasan_populate_vmalloc(unsigned long addr, unsigned long size);
> > -void kasan_release_vmalloc(unsigned long start, unsigned long end,
> > +
> > +int __kasan_populate_vmalloc(unsigned long addr, unsigned long size);
> > +static inline int kasan_populate_vmalloc(unsigned long addr, unsigned =
long size)
> > +{
> > +     if (!kasan_shadow_initialized())
> > +             return 0;
>
>
> What's the point of moving these checks to header?
> Leave it in C, it's easier to grep and navigate code this way.

Andrey Konovalov had comments [1] to avoid checks in C
by moving them to headers under __wrappers.

: 1. Avoid spraying kasan_arch_is_ready() throughout the KASAN
: implementation and move these checks into include/linux/kasan.h (and
: add __wrappers when required).

[1] https://lore.kernel.org/all/CA+fCnZcGyTECP15VMSPh+duLmxNe=3DApHfOnbAY3N=
qtFHZvceZw@mail.gmail.com/

>
>
> > +     return __kasan_populate_vmalloc(addr, size);
> > +}
> > +
> > +void __kasan_release_vmalloc(unsigned long start, unsigned long end,
> >                          unsigned long free_region_start,
> >                          unsigned long free_region_end,
> >                          unsigned long flags);
> > +static inline void kasan_release_vmalloc(unsigned long start,
> > +                        unsigned long end,
> > +                        unsigned long free_region_start,
> > +                        unsigned long free_region_end,
> > +                        unsigned long flags)
> > +{
> > +     if (kasan_shadow_initialized())
> > +             __kasan_release_vmalloc(start, end, free_region_start,
> > +                        free_region_end, flags);
> > +}
> >
>
> ...> @@ -250,7 +259,7 @@ static inline void poison_slab_object(struct kme=
m_cache *cache, void *object,
> >  bool __kasan_slab_pre_free(struct kmem_cache *cache, void *object,
> >                               unsigned long ip)
> >  {
> > -     if (!kasan_arch_is_ready() || is_kfence_address(object))
> > +     if (is_kfence_address(object))
> >               return false;
> >       return check_slab_allocation(cache, object, ip);
> >  }
> > @@ -258,7 +267,7 @@ bool __kasan_slab_pre_free(struct kmem_cache *cache=
, void *object,
> >  bool __kasan_slab_free(struct kmem_cache *cache, void *object, bool in=
it,
> >                      bool still_accessible)
> >  {
> > -     if (!kasan_arch_is_ready() || is_kfence_address(object))
> > +     if (is_kfence_address(object))
> >               return false;
> >
> >       poison_slab_object(cache, object, init, still_accessible);
> > @@ -282,9 +291,6 @@ bool __kasan_slab_free(struct kmem_cache *cache, vo=
id *object, bool init,
> >
> >  static inline bool check_page_allocation(void *ptr, unsigned long ip)
> >  {
> > -     if (!kasan_arch_is_ready())
> > -             return false;
> > -
>
>
> Well, you can't do this yet, because no arch using ARCH_DEFER_KASAN yet, =
so this breaks
> bisectability.
> Leave it, and remove with separate patch only when there are no users lef=
t.

Will do in v5 at the end of patch series.

>
> >       if (ptr !=3D page_address(virt_to_head_page(ptr))) {
> >               kasan_report_invalid_free(ptr, ip, KASAN_REPORT_INVALID_F=
REE);
> >               return true;
> > @@ -511,7 +517,7 @@ bool __kasan_mempool_poison_object(void *ptr, unsig=
ned long ip)
> >               return true;
> >       }
> >
> > -     if (is_kfence_address(ptr) || !kasan_arch_is_ready())
> > +     if (is_kfence_address(ptr))
> >               return true;
> >
> >       slab =3D folio_slab(folio);
>
>

