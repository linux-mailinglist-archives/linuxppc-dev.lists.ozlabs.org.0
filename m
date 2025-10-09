Return-Path: <linuxppc-dev+bounces-12753-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FBFBC9E52
	for <lists+linuxppc-dev@lfdr.de>; Thu, 09 Oct 2025 18:00:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cjF264hKLz2yr2;
	Fri, 10 Oct 2025 02:59:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::136"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760025598;
	cv=none; b=D1hfschrecJVw4pd0KmW7XZG/X9dnJhoS2Y09zq7FkXz2gViBUCPFoiK/6R9ddB/HYfyo3AsUXmJfn5ilXfEQkxvfO/TQpNGcQyyvviRvCFWyPYrmyG+z2oSvzIEI542cdvrwcm70HmVKr785Pe2asfHHYLQAUYAAnvVvl1C9e1v+PjfqiCnh3AQqPiP+/kKIyH2HFr6ILGu8P0/DhvDurJBTnmNDgnHskmOuI74Tu16QIGZfW5VjlyKyulv2yD7usbDdx7bYMgUap3M11vnF3GVb1RaE1AmrrNOG+5qTr4iVQTzlvL8Yb1rLgp5JUBSsspvBLL868kbxtk0Mj3tfw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760025598; c=relaxed/relaxed;
	bh=WQBxmURKiGaN3QIqBhTff7pEbZ70mJ9TllMgftPCUcQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JTqMWb5AVN6CAdWAkXYLiGqqTZCejtf6xKv5/Ofc7xvk1laL/p2PV3X5kbt4yoBJJZ08eBVyLQPu/IT58GgK0W641/xHv3bCFPYjob4Bhxz+ZSdHvEMo8PcqKUatCWLI59aEDgBn7TuDNZCkcT3/+eOPqaIBiDF4QUJIpODocnMk+9+5JAoEZ8UOammgKQZQQL5PZTcmLTFLjWtdi+4c1Ji8P0N8Nqi4ic0AQrPKdOavnKdTpXdXhX+t1XlDAIEap0fU4ivEZPwHvSCEyjeyUwOFAz8Mxv6Cck6JgxiBImu5E9TW8JSYOCTxVrw9aBwWvzywo7u9SUOUtxm/lHuS2A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gKQS6Co+; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gKQS6Co+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cjF246JX8z2xnt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Oct 2025 02:59:56 +1100 (AEDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-57db15eeb11so1403596e87.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Oct 2025 08:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760025590; x=1760630390; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WQBxmURKiGaN3QIqBhTff7pEbZ70mJ9TllMgftPCUcQ=;
        b=gKQS6Co+2pB/V7nDCUqzR2HDgatj6JVlgbBYIByaQ952xblX7TLIfkO0JabkEW9RDV
         zFagkzuNkpyCKwBvKDyK4qdQqt9PCfS31uyfrrGGr5z81ZiZkiphs8gKzQOm50t8rjrl
         S4JMXMdQ3Ljn3Hxs+6nYoArKT/efVOpRESl/ONP6AkxKknpJCbmJnuPDF6ETCW34nZlL
         ApdhixjXual2vVtRQpHkdfGvcgwY4knVJ7HzcFDgsXaCVAr1dbTe36EmWDZf+9poYrWe
         IgvSHnaeh/jo3ix9GX/z+ixDvnGOFMvSeq5ap6WMQ/XR4PUIoRklpNnQvPeF0cuMxbrd
         kNHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760025590; x=1760630390;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WQBxmURKiGaN3QIqBhTff7pEbZ70mJ9TllMgftPCUcQ=;
        b=C/4W7CpfiAYSzakO6EjPeKPwwCpeyKVqOfwir1R/kSy6NbMzATCys7ydySRMKWHPeU
         6GvXh04oG2eTg3kXE6E+dYYKPggJ2GOW19VaTxvSLqkhDkElqA02+aS0DBj0ZDEUiUPv
         gBPgYryRUXWEYgG//yiQMELPKm+y9sPZxFlZpgySQO7yhmfHbEifksQA5SjIgAbeT7KN
         1HCAq4f1R4fG+tXwpje8uxUoAqLujmOCk4dKNsav0IfO+PpFQhIVa9gHiGDkYAVYsVi7
         HEs7A8BZrI2IBeR4eIVdrsLvw+dCGLfW0dDWcfijaxkJFJafBoufTE4D6rrY+UeMJyWG
         PrMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVybm7nBWUFtfLgduZIbOFvNgrf6IxDD1xHXIk/cEJ/pD24Ws6yKtk3EpER7TiXMPwGDUiexeF2loqpVGo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzXZ2PF6jagsqvZMVc92eBwtF7iJIrdf3SaBSd7ctUuQswDLoPL
	2HbRkE2QiPfLWjJrRj9U/1gyO1fyXXQFet7UGYl9myafKlU7ZPIJ2CDcREfKtzvcFLp5mn6ida8
	VBEaJ2x4rUkU7bWi+MDMMME9pmLOyOk4=
X-Gm-Gg: ASbGnctz5Px9wpAxRNPYh2LqzJcptEdVxCft67Mx/nBnKvev+y4nk1fRuyfc285BguO
	zvy/9Elo4BwgzvIGJeSjY1V1qrS9rNexSPaWP4lfiphp0zdeWVIJnYF6WMRwLDY9RteJCNyO9hb
	HUli/UusaLvTiov/1DsuzzIsu+SFwMKqSe86dyurPgvlOzCsCwfsy92BaaIygKZEEufvAtL0qXi
	6Ved27tRIa+4kWLWkU9vL8eEzmYRpP31hocGJ7vLQ==
X-Google-Smtp-Source: AGHT+IFiOw5ablsLgUKfCaNuQJri4wcztl+zI4ly3LRjrgaXjzgOnqWcpR8ZMzuTHWFg5QDe7h9JoAEutSyQKhvfT4w=
X-Received: by 2002:a05:6512:1291:b0:57d:ffa4:56f4 with SMTP id
 2adb3069b0e04-5906dae5904mr2393608e87.41.1760025589415; Thu, 09 Oct 2025
 08:59:49 -0700 (PDT)
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
References: <20250810125746.1105476-1-snovitoll@gmail.com> <20250810125746.1105476-2-snovitoll@gmail.com>
 <87ldmv6p5n.ritesh.list@gmail.com>
In-Reply-To: <87ldmv6p5n.ritesh.list@gmail.com>
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Date: Thu, 9 Oct 2025 20:59:32 +0500
X-Gm-Features: AS18NWAnJdcYDP3fsUmpv8ZuZnvVnkv1zMHsU4QWH3X3orZoE8748Ur0FWZohd0
Message-ID: <CACzwLxia6xMcQ=vsYG7SE+pUO8=4DiRWD_Omq3wzRyuhDjGcPQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] kasan: introduce ARCH_DEFER_KASAN and unify static
 key across modes
To: Ritesh Harjani <ritesh.list@gmail.com>
Cc: ryabinin.a.a@gmail.com, christophe.leroy@csgroup.eu, bhe@redhat.com, 
	hca@linux.ibm.com, andreyknvl@gmail.com, akpm@linux-foundation.org, 
	zhangqing@loongson.cn, chenhuacai@loongson.cn, davidgow@google.com, 
	glider@google.com, dvyukov@google.com, alexghiti@rivosinc.com, alex@ghiti.fr, 
	agordeev@linux.ibm.com, vincenzo.frascino@arm.com, elver@google.com, 
	kasan-dev@googlegroups.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-um@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Sep 4, 2025 at 5:38=E2=80=AFAM Ritesh Harjani <ritesh.list@gmail.co=
m> wrote:
>
>
> Only book3s64 needs static keys here because of radix v/s hash mode
> selection during runtime. The changes in above for powerpc looks good to
> me. It's a nice cleanup too.
>

Hello,
Thanks for the review and sorry for the late reply. This has already
been merged.
AFAIU, in arch/powerpc/Kconfig

config PPC
...
        select ARCH_NEEDS_DEFER_KASAN if PPC_RADIX_MMU

and in arch/powerpc/platforms/Kconfig.cputype:

config PPC_RADIX_MMU
        bool "Radix MMU Support"
        depends on PPC_BOOK3S_64
        select ARCH_HAS_GIGANTIC_PAGE
        default y

So the KASAN static key is enabled only for PPC_BOOK3S_64 by this
Kconfig selection.
In other git changes like:
arch/powerpc/mm/kasan/init_32.c
arch/powerpc/mm/kasan/init_book3e_64.c

, where we call kasan_init_generic() -> kasan_enable() does nothing because
CONFIG_ARCH_DEFER_KASAN is not selected.

> So feel free to take:
> Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com> #powerpc
>
> However I have few comments below...
>
> > @@ -246,7 +255,7 @@ static inline void poison_slab_object(struct kmem_c=
ache *cache, void *object,
> >  bool __kasan_slab_pre_free(struct kmem_cache *cache, void *object,
> >                               unsigned long ip)
> >  {
> > -     if (!kasan_arch_is_ready() || is_kfence_address(object))
> > +     if (is_kfence_address(object))
>
> For changes in mm/kasan/common.c.. you have removed !kasan_enabled()
> check at few places. This seems to be partial revert of commit [1]:
>
>   b3c34245756ada "kasan: catch invalid free before SLUB reinitializes the=
 object"
>
> Can you please explain why this needs to be removed?

kasan_arch_is_ready() was removed here because in
commit 1e338f4d99e6("kasan: introduce ARCH_DEFER_KASAN and unify
static key across modes")
I've unified the check with kasan_enabled() which is already called in
the __wrapper
__kasan_slab_pre_free in include/linux/kasan.h

> Also the explaination of the same should be added in the commit msg too.
>
> [1]: https://lore.kernel.org/all/20240809-kasan-tsbrcu-v8-1-aef4593f9532@=
google.com/
>

