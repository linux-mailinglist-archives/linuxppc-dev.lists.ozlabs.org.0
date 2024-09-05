Return-Path: <linuxppc-dev+bounces-1046-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E6496D62B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2024 12:34:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wzwh71Styz2ysv;
	Thu,  5 Sep 2024 20:33:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725531594;
	cv=none; b=OsSfCwDBMnkwfShYYWWUAmfpIvpEcC9+2xcAAhmF66OqixkeGs9q95F+ffuZhkBWodxsLV8yBmQzoS6DfxsyqFhGvPuqtIiWmTGmMZrJClcc6GP50SG+TAsVVQa97nezSOHkKmw04W6EbwI9Vw0b3s8RebvAuD2dFJweXIRmVe+upJU3wBZmEsZ+diyoIuFHdhruTCs5rSxMM4ZGQI8goRXYyWF28KZyxYaH/2cx6hW7c6nv3G5+e3IPlY1xC29D1eP73tfytrvcKxyECucdf2f3RxqDnofeOHyjAu613b1XgoNLn5iccb58YMLH0A+KD7vqfuulv0KVjHq6LrcrCg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725531594; c=relaxed/relaxed;
	bh=PA7JIemCyiEdqILj6UaKRiRobVb7jaWwTSUCykQJ3Wk=;
	h=DKIM-Signature:MIME-Version:References:In-Reply-To:From:Date:
	 Message-ID:Subject:To:Cc:Content-Type; b=gANGr5KgdHnu+2lCWS1fZImFH823S5wZnq00PrTNRpe2r+qOsqQvmXkXjuDC9+J+b4M9oGC+BV+XU+fUrRT3ghI+Kyh7OgC657R8JYcQkuHzFyK5AVPFyDzcAr2Q3FP/asXkhbqJi9UHZZnzhoorTs05vyjoJ3VZYg4fDj9iLK622rUE5DrJr/X90tvGQCUrf55vtiD9Hv06U/cOVeW3DzIKQYM/gX8dFB78YfNwLhri0jhSYm6SCFumqAUzeXyDFzYmPLyhhnv1QoDlcJ20ne8kPdiCHUtq5u9BNICPBW+NwVbrS3lFhfoJZxHdRyGCaaT3Yw0aybuqyDUDXQDtbA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; dkim=pass (1024-bit key; unprotected) header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256 header.s=google header.b=m0fQ51Vg; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com; envelope-from=vitaly.wool@konsulko.com; receiver=lists.ozlabs.org) smtp.mailfrom=konsulko.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256 header.s=google header.b=m0fQ51Vg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=konsulko.com (client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com; envelope-from=vitaly.wool@konsulko.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzwMt2YLnz2yn2
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2024 20:19:52 +1000 (AEST)
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2d877dab61fso408619a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Sep 2024 03:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1725531591; x=1726136391; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PA7JIemCyiEdqILj6UaKRiRobVb7jaWwTSUCykQJ3Wk=;
        b=m0fQ51VgxZEEhrUo1IPPwDShwUAaPulriKZuX5zMUfVYtg5ojIbMfYumZImn120O76
         4on0cexRULHRA031gOaWtHnkKQ3AP8mSl9mVy7Umjftv97So3kofeQ2EpMVLliuAoNsL
         w/iOgXlz/XBResP+sHKW/otJMshxrQRNhdAmU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725531591; x=1726136391;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PA7JIemCyiEdqILj6UaKRiRobVb7jaWwTSUCykQJ3Wk=;
        b=Aye/IziwRImiVcemim6+AKJdm0RL+vWfjcNwYfWMWypGsxErSY1pymf8RC7ZhSTz9P
         3WXhg99xM5lAplKCMEXwpdduyWLTjIVAC5fq68O/3oNwJz5MpiRzP5tXKGs6pQ0d3Ozi
         ALihitX+uh3tf50OP9jFSeFiUkd9QIOC4inNEMCqHhQ18Oba+Gsxa0/a2OdXDxGqbVnx
         cSP6s9UnQ5lfuuTflbuIzOX73tq5X8wyKk5t0+0tXDr7HKSIJk+dMyyI80NqxCiXfDUi
         iq9UjW6D/V9JZB7PcKsKX0YzTv6CehEmrzGaEdQ2rjrnb+VdqijHR6E1RgKwVCtTZuRr
         hs5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXswWhfIH1RWGjR+e/tlLqaDYm329h/XVqnW8Hi9K/iRAY0zWyWMKc5N6J8KlzRiNSnNANRPe4UJVAnqn0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw+Ry2VwCU1l4lXbNyaGvL21RKsIT8dYaapbyg46lKH7RIB6AfI
	mR5+wqFPE0JjocV21T8K8f1CTlZeKuEgBtgpHLasHOeIFOtW0wj41ir5/nYTRuDxPX6oyfBuL0b
	9isJiy44LDZs8ICzPHFYyhxOmymjKX7KzX0fwGw==
X-Google-Smtp-Source: AGHT+IHyTnBl3/mA7BCy8C7Mdrgi4kraU3T2YISEDkiQ+C22fRtuX7dRpdTavjnbTJxnBQ32e09vaczZ2IZyJiMaQuo=
X-Received: by 2002:a17:90a:ba94:b0:2d8:cd04:c8f0 with SMTP id
 98e67ed59e1d1-2da55a78cb0mr10646151a91.39.1725531590333; Thu, 05 Sep 2024
 03:19:50 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20240904233343.933462-1-yosryahmed@google.com>
In-Reply-To: <20240904233343.933462-1-yosryahmed@google.com>
From: Vitaly Wool <vitaly.wool@konsulko.com>
Date: Thu, 5 Sep 2024 12:19:38 +0200
Message-ID: <CAM4kBBKotR4qc3jTsp3McgDCj18FTL6VETWRkfL-FgSYkFbiXg@mail.gmail.com>
Subject: Re: [PATCH v2] mm: z3fold: deprecate CONFIG_Z3FOLD
To: Yosry Ahmed <yosryahmed@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Miaohe Lin <linmiaohe@huawei.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Nhat Pham <nphamcs@gmail.com>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Christoph Hellwig <hch@infradead.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Chris Down <chris@chrisdown.name>, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 5, 2024 at 1:33=E2=80=AFAM Yosry Ahmed <yosryahmed@google.com> =
wrote:
>
> The z3fold compressed pages allocator is rarely used, most users use
> zsmalloc. The only disadvantage of zsmalloc in comparison is the
> dependency on MMU, and zbud is a more common option for !MMU as it was
> the default zswap allocator for a long time.
>
> Historically, zsmalloc had worse latency than zbud and z3fold but
> offered better memory savings. This is no longer the case as shown by
> a simple recent analysis [1]. That analysis showed that z3fold does not
> have any advantage over zsmalloc or zbud considering both performance
> and memory usage. In a kernel build test on tmpfs in a limited cgroup,
> z3fold took 3% more time and used 1.8% more memory. The latency of
> zswap_load() was 7% higher, and that of zswap_store() was 10% higher.
> Zsmalloc is better in all metrics.
>
> Moreover, z3fold apparently has latent bugs, which was made noticeable
> by a recent soft lockup bug report with z3fold [2]. Switching to
> zsmalloc not only fixed the problem, but also reduced the swap usage
> from 6~8G to 1~2G. Other users have also reported being bitten by
> mistakenly enabling z3fold.
>
> Other than hurting users, z3fold is repeatedly causing wasted
> engineering effort. Apart from investigating the above bug, it came up
> in multiple development discussions (e.g. [3]) as something we need to
> handle, when there aren't any legit users (at least not intentionally).
>
> The natural course of action is to deprecate z3fold, and remove in a few
> cycles if no objections are raised from active users. Next on the list
> should be zbud, as it offers marginal latency gains at the cost of huge
> memory waste when compared to zsmalloc. That one will need to wait until
> zsmalloc does not depend on MMU.
>
> Rename the user-visible config option from CONFIG_Z3FOLD to
> CONFIG_Z3FOLD_DEPRECATED so that users with CONFIG_Z3FOLD=3Dy get a new
> prompt with explanation during make oldconfig. Also, remove
> CONFIG_Z3FOLD=3Dy from defconfigs.
>
> [1]https://lore.kernel.org/lkml/CAJD7tkbRF6od-2x_L8-A1QL3=3D2Ww13sCj4S3i4=
bNndqF+3+_Vg@mail.gmail.com/
> [2]https://lore.kernel.org/lkml/EF0ABD3E-A239-4111-A8AB-5C442E759CF3@gmai=
l.com/
> [3]https://lore.kernel.org/lkml/CAJD7tkbnmeVugfunffSovJf9FAgy9rhBVt_tx=3D=
nxUveLUfqVsA@mail.gmail.com/
>
> Acked-by: Chris Down <chris@chrisdown.name>
> Acked-by: Nhat Pham <nphamcs@gmail.com>
> Signed-off-by: Yosry Ahmed <yosryahmed@google.com>

Acked-by: Vitaly Wool <vitaly.wool@konsulko.com>

> ---
>
> I think it should actually be fine to remove z3fold without deprecating
> it first, but I am doing the due diligence.
>
> v1: https://lore.kernel.org/linux-mm/20240112193103.3798287-1-yosryahmed@=
google.com/
> v1 -> v2:
> - Make CONFIG_Z3FOLD_DEPRECATED a tristate option to match
>   CONFIG_Z3FOLD.
> - Update commit subject and log.
>
> ---
>  arch/loongarch/configs/loongson3_defconfig |  1 -
>  arch/powerpc/configs/ppc64_defconfig       |  1 -
>  mm/Kconfig                                 | 14 ++++++++++++--
>  3 files changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/arch/loongarch/configs/loongson3_defconfig b/arch/loongarch/=
configs/loongson3_defconfig
> index b4252c357c8e2..75b366407a60a 100644
> --- a/arch/loongarch/configs/loongson3_defconfig
> +++ b/arch/loongarch/configs/loongson3_defconfig
> @@ -96,7 +96,6 @@ CONFIG_ZPOOL=3Dy
>  CONFIG_ZSWAP=3Dy
>  CONFIG_ZSWAP_COMPRESSOR_DEFAULT_ZSTD=3Dy
>  CONFIG_ZBUD=3Dy
> -CONFIG_Z3FOLD=3Dy
>  CONFIG_ZSMALLOC=3Dm
>  # CONFIG_COMPAT_BRK is not set
>  CONFIG_MEMORY_HOTPLUG=3Dy
> diff --git a/arch/powerpc/configs/ppc64_defconfig b/arch/powerpc/configs/=
ppc64_defconfig
> index 544a65fda77bc..d39284489aa26 100644
> --- a/arch/powerpc/configs/ppc64_defconfig
> +++ b/arch/powerpc/configs/ppc64_defconfig
> @@ -81,7 +81,6 @@ CONFIG_MODULE_SIG_SHA512=3Dy
>  CONFIG_PARTITION_ADVANCED=3Dy
>  CONFIG_BINFMT_MISC=3Dm
>  CONFIG_ZSWAP=3Dy
> -CONFIG_Z3FOLD=3Dy
>  CONFIG_ZSMALLOC=3Dy
>  # CONFIG_SLAB_MERGE_DEFAULT is not set
>  CONFIG_SLAB_FREELIST_RANDOM=3Dy
> diff --git a/mm/Kconfig b/mm/Kconfig
> index b23913d4e47e2..536679d726417 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -177,15 +177,25 @@ config ZBUD
>           deterministic reclaim properties that make it preferable to a h=
igher
>           density approach when reclaim will be used.
>
> -config Z3FOLD
> -       tristate "3:1 compression allocator (z3fold)"
> +config Z3FOLD_DEPRECATED
> +       tristate "3:1 compression allocator (z3fold) (DEPRECATED)"
>         depends on ZSWAP
>         help
> +         Deprecated and scheduled for removal in a few cycles. If you ha=
ve
> +         a good reason for using Z3FOLD over ZSMALLOC, please contact
> +         linux-mm@kvack.org and the zswap maintainers.
> +
>           A special purpose allocator for storing compressed pages.
>           It is designed to store up to three compressed pages per physic=
al
>           page. It is a ZBUD derivative so the simplicity and determinism=
 are
>           still there.
>
> +config Z3FOLD
> +       tristate
> +       default y if Z3FOLD_DEPRECATED=3Dy
> +       default m if Z3FOLD_DEPRECATED=3Dm
> +       depends on Z3FOLD_DEPRECATED
> +
>  config ZSMALLOC
>         tristate
>         prompt "N:1 compression allocator (zsmalloc)" if ZSWAP
> --
> 2.46.0.469.g59c65b2a67-goog
>

