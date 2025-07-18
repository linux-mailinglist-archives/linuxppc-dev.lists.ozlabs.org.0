Return-Path: <linuxppc-dev+bounces-10316-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 24862B09D61
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jul 2025 10:06:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bk2RT66PZz30RK;
	Fri, 18 Jul 2025 18:05:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::22f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752825957;
	cv=none; b=LPJWfZYOtWS4Klx2P6ANFYIOGVIj0t9hbbELP3zD8r7ZhQ+KtAPVIgwRZXeM4A1Yb05QnDXGX5tzNAGuIsDQSD1tZIArnexUC79l5KsnNmFHl5Xkdxyg0YIwy5G55nUgRYDpVZW4HO5m2DOpihgKELsFq9T3cRYwt+dc4n57NspEiLR2szLsDqu3/pEXa1Q3ZUVC6OzOBTpdpDfmNDNkJwCuNJQoLx9GiljhfLhhXIJfnIrAq4k7wHtNq2GEFaAC2flbxrPrUX8qSq4TkFKIgaLv5xGucYQ5fXQrwjwIc6hK2HViabpQAXbnG5X1zLQpcC+EArhxCLfljQY4/jU5aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752825957; c=relaxed/relaxed;
	bh=mE5OlSABnLgWhYl6SAq4PjOG8cGD+M3libfM2kaqTAg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kCeU9cjIEtY9c/gk+mOCRqVCD++geVe0jW3oecD0hpFVWMVLGNyh3zz9Jq6q9N2gwwt4C9yzSnKoM2FCeKl3oi32rxCswHnqV8dVkCUSxbhTbdmmr0u+oreJeZsEoZ/0+cIWzYGM4UC165cdfgOGfyLFGJB6Ps1s3HQbDOJLQ7nZ+myrFQznWZGxWJu9coGYaqwywT8mQdVhLEaZzzyDwNhEVI6nEQsf8jfmfCZx05CHKY9IS/seq9Qc6P5i099+CnCAbD8smn7dckPHcOkpUitK0KpF06nUXx99h8cP2Tbvw1GcSYSUjXaexk3lsM+XAqauGcnqeK+mjb1ykacFfg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QN8os2rt; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QN8os2rt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bk2RS2dGGz30RJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jul 2025 18:05:56 +1000 (AEST)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-32b5931037eso13738661fa.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jul 2025 01:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752825950; x=1753430750; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mE5OlSABnLgWhYl6SAq4PjOG8cGD+M3libfM2kaqTAg=;
        b=QN8os2rtVGslObskSqZ5UONq81BTLrktz+uAHUrWl2NNuHtghiOrKEe+/LjbPuBGS2
         DS9MDs763Kc/6CJAWox04eWhOphWWnYR60N8q2D/mY4uNtFnElm1I4SbeNITjHVBMuup
         9OZc6uDrM+7VsGadZEtzAFLKSjfjSOXfd0n+/yF3W+9l/gJPspLRf7b+hfPB8a7R+5Dp
         U27ynZYhGaofoVvEMcQ6FV9apq5V89S5051iJJelCyyYL/hIz/OtbRq6VQFM8pKwVW4X
         caih4lyzosEMLUYw72Dmb6N7YhrjBw2Ucgj/YThhUOiyxad5YXBBV8C/rNxL4frNwvTy
         6lHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752825950; x=1753430750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mE5OlSABnLgWhYl6SAq4PjOG8cGD+M3libfM2kaqTAg=;
        b=WBSoBnDoj4Oje8Rm43GvLs8+qUlY7/jpKpl5hvs30dZa845QKaeRJvibM6FqX9IIL9
         8835dI4xBFdO3lYj5pc+rIoGRaqw7qUa2kc2WIrgXH0iUBtHsZtZ/M1gXFLQe4qVqRKX
         2Vta2Eqxs8gKbGWatwIzHldFw+DbNcGCWrsCa3RKG/IAo7evkKB9sfinKSMBBGgPSfMU
         DdtuTK1mKLNIFFctBEdbj6/0GxlGygxwNTYXoysJkzAgm66YxW3wgqwKDFvJhgwCG8kn
         rZay2HfjPA8GS1kpGnAiXd0ufn+e/PJ1c7TqqQK/uP9WLFUzDxTEyWGVZMCrE73FwxUJ
         fifg==
X-Forwarded-Encrypted: i=1; AJvYcCUlNBXGP0NfnzMk5cq2UJg+RK24qLqoD/bVh9DGxTKcMCBLdxHwmWw6wzSJuQjiCLexsFFpVyN3/gqa1L0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyzSHlBA+DrDyvoKxDJ1B2kNkgrSk7An3X/vyj+DtPs4CVOiq5I
	hbK+Bipbiez3gVCJtMW7GEazExwbGBL/IXdi1Ukgzkl1Cpefd5cj2ZPGaXCe5zp++lQ7aprZmV4
	0ykR+2YY6Vd2udKW4t8R6rCrHIpjw808=
X-Gm-Gg: ASbGncv1mWdzI6vqe9OIb+vDv388jP0M8/SUvXWz74hIKUjlLfxwfKCYE9p0gN2jo8A
	yvJSWn51NLYgaAw1ytP4Uzi0mJp7qRhv2o3yFTr6BtQI6ru7QNqlRdzLr4p84Mb8zChcfHa+2h2
	FkLWEmnG18kpqFRMXmIAwzu8gL5DxU6IX2NeGIeeaN9Wr/0lK9EbfK3iCAihySS7wq7hBAE6ukU
	rzAlog=
X-Google-Smtp-Source: AGHT+IHyLMKDBrDr7Srvy/Ikd0HaWMaoK7ylFo11Rc1uD9JBuJ8oBsq1gin5zNroA8IEeJqMbuI/vDPTs3/MNmSKtdw=
X-Received: by 2002:a2e:80d4:0:b0:32b:755e:6cd7 with SMTP id
 38308e7fff4ca-3308e56e179mr28488571fa.32.1752825949700; Fri, 18 Jul 2025
 01:05:49 -0700 (PDT)
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
References: <20250717142732.292822-1-snovitoll@gmail.com> <20250717142732.292822-2-snovitoll@gmail.com>
 <20250717151048.bb6124bea54a31cd2b41faaf@linux-foundation.org>
In-Reply-To: <20250717151048.bb6124bea54a31cd2b41faaf@linux-foundation.org>
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Date: Fri, 18 Jul 2025 13:05:32 +0500
X-Gm-Features: Ac12FXz9YqNA1eFVik-g2DCaFm9kQISkxpcsj01QS2Zo6EkvjPY09aiUDIQMxqs
Message-ID: <CACzwLxgyd9yd3ah=LK93Bn7SwAy7H1Hhi=ncFzZYUs+6YGEqvg@mail.gmail.com>
Subject: Re: [PATCH v3 01/12] lib/kasan: introduce CONFIG_ARCH_DEFER_KASAN option
To: Andrew Morton <akpm@linux-foundation.org>
Cc: hca@linux.ibm.com, christophe.leroy@csgroup.eu, andreyknvl@gmail.com, 
	agordeev@linux.ibm.com, ryabinin.a.a@gmail.com, glider@google.com, 
	dvyukov@google.com, kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-mm@kvack.org, 
	Peter Zijlstra <peterz@infradead.org>, Johannes Berg <johannes@sipsolutions.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Jul 18, 2025 at 3:10=E2=80=AFAM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Thu, 17 Jul 2025 19:27:21 +0500 Sabyrzhan Tasbolatov <snovitoll@gmail.=
com> wrote:
>
> > Introduce CONFIG_ARCH_DEFER_KASAN to identify architectures that need
> > to defer KASAN initialization until shadow memory is properly set up.
> >
> > Some architectures (like PowerPC with radix MMU) need to set up their
> > shadow memory mappings before KASAN can be safely enabled, while others
> > (like s390, x86, arm) can enable KASAN much earlier or even from the
> > beginning.
> >
> > This option allows us to:
> > 1. Use static keys only where needed (avoiding overhead)
> > 2. Use compile-time constants for arch that don't need runtime checks
> > 3. Maintain optimal performance for both scenarios
> >
> > Architectures that need deferred KASAN should select this option.
> > Architectures that can enable KASAN early will get compile-time
> > optimizations instead of runtime checks.
>
> Looks nice and appears quite mature.  I'm reluctant to add it to mm.git
> during -rc6, especially given the lack of formal review and ack tags.
>
> But but but, that's what the mm-new branch is for.  I guess I'll add it
> to get some additional exposure, but whether I'll advance it into
> mm-unstable/linux-next for this cycle is unclear.
>
> What do you (and others) think?

Thanks for the positive feedback!
Adding it to mm-new for additional exposure would be great.
Given the complexity of this cross-architecture change,
I think of taking the conservative approach of:
1. mm-new branch for exposure and review collection
2. Advancing to mm-unstable/linux-next only after we get proper acks from
    KASAN maintainers/reviewers, at least.

The series has been thoroughly tested by me - compiled all affected arch an=
d
ran QEMU on arm64, x86 with KUnits.

+ Forgot to add in CC Johannes Berg, Peter Zijlstra who commented in v1.
https://lore.kernel.org/all/20250625095224.118679-1-snovitoll@gmail.com/

