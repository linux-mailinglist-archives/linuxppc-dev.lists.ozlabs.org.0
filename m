Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B3482E930
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jan 2024 06:25:09 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256 header.s=google header.b=b7quzUWx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TDcsH3vZzz3c4M
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jan 2024 16:25:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256 header.s=google header.b=b7quzUWx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=konsulko.com (client-ip=2607:f8b0:4864:20::52d; helo=mail-pg1-x52d.google.com; envelope-from=vitaly.wool@konsulko.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TDBGl4Q08z2xcp
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jan 2024 23:27:10 +1100 (AEDT)
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-5cf2306c1b4so3235343a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jan 2024 04:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1705321625; x=1705926425; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5AVaqD1kmny+a3DzzxHWWVHP6DeI42FQlUciU6OC6AY=;
        b=b7quzUWxxHPsi5FJ3TppHrtxOPc6W9svKtw0Xz/cb8HXt1mCgYITJYyJROJbeoXUOZ
         hpun8beSTtRdyY3OSmLH8eXB71LtTgncDrxZKaDhVyK0NiEPNZ+aBFgYB9Uxex79vjr3
         jr8OOZam2+YvMqrxEf8P+abQN9YPiCZcDollw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705321625; x=1705926425;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5AVaqD1kmny+a3DzzxHWWVHP6DeI42FQlUciU6OC6AY=;
        b=W4/sz7lZgARZiHFFi/vOjgS6efM8m2hjxiQt5iPC9V0TqM5fGivBKuHr0lGw9jWtN8
         Y53pEBIAf7QL/squNW8JcipepcRz/RU0S2qMQnuE+ueyUBi1ZBx5NX6BVfrZInzyBMJR
         wKgpE1/Wdits0vF7JSMxFVAJGytwQKPvLnAR1v4FPYABgKxSax6fVuI1UMnxkm5NF9Tn
         ZXUQPORzDMrgsrhYBjJdvyxZYtwsu1ISQrbLzmPnp/RC6i+vdH7MxNEXhbVCtsraa715
         OS6ivJXq0SYaTr99PQlVW5BTHkEgOEkWWQTOKDXnxaBfYoDC2gE+hafYzjPAk0lBGneQ
         0dOw==
X-Gm-Message-State: AOJu0Yy/I/9lSsMTHORAVhY9M86oGso/xFvwN8pXWMbvhz8vfdagVbIw
	Ky1H2mVtfWjcR3NuikC3mlkbVeyXYbR/nta3nQ+gHRsPeAgFbw==
X-Google-Smtp-Source: AGHT+IFPnDgL7DMkEwUE4dB1cOrEAgUyagMefPltAmMUPrI7hNPG4cAw+4d4SULhubx12ACgLhys+J9MpMdMa9fB8tI=
X-Received: by 2002:a05:6a21:3949:b0:19b:1d4a:c4bc with SMTP id
 ac9-20020a056a21394900b0019b1d4ac4bcmr347314pzc.96.1705321625515; Mon, 15 Jan
 2024 04:27:05 -0800 (PST)
MIME-Version: 1.0
References: <20240112193103.3798287-1-yosryahmed@google.com>
In-Reply-To: <20240112193103.3798287-1-yosryahmed@google.com>
From: Vitaly Wool <vitaly.wool@konsulko.com>
Date: Mon, 15 Jan 2024 13:26:54 +0100
Message-ID: <CAM4kBBKPLwwp2H37q1nBSubFwaMiwdhC78f+n_0qpAHNODTYhQ@mail.gmail.com>
Subject: Re: [RFC PATCH] mm: z3fold: rename CONFIG_Z3FOLD to CONFIG_Z3FOLD_DEPRECATED
To: Yosry Ahmed <yosryahmed@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 16 Jan 2024 16:24:27 +1100
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, Nhat Pham <nphamcs@gmail.com>, Huacai Chen <chenhuacai@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, linux-mm@kvack.org, loongarch@lists.linux.dev, Johannes Weiner <hannes@cmpxchg.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, WANG Xuerui <kernel@xen0n.name>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jan 12, 2024 at 8:31=E2=80=AFPM Yosry Ahmed <yosryahmed@google.com>=
 wrote:
>
> The z3fold compressed pages allocator is not widely used, most users use
> zsmalloc. The only disadvantage of zsmalloc in comparison is the
> dependency on MMU, and zbud is a more common option for !MMU as it was
> the default zswap allocator for a long time.
>
> In hopes of having a single compressed pages allocator at some point,
> and following in the footsteps of SLAB, deprecate z3fold. Rename the
> user-visible option so that users with CONFIG_Z3FOLD=3Dy get a new prompt
> with explanation during make oldconfig. Remove CONFIG_Z3FOLD=3Dy from
> defconfigs.

I believe that having a single compressed pages allocator is a false goal.

> Existing users, if any, should voice their objections. Otherwise, we can
> remove z3fold in a few releases.

At this point I NACK this patch. We're about to submit an allocator
which is clearly better that z3fold and is faster that zsmalloc in
most cases and that submission will mark z3fold as deprecated. But for
now this move is premature.

Best,
Vitaly

> Signed-off-by: Yosry Ahmed <yosryahmed@google.com>
> ---
> I have limited understanding of Kconfigs. I modelled this after commit
> eb07c4f39c3e ("mm/slab: rename CONFIG_SLAB to CONFIG_SLAB_DEPRECATED"),
> but one difference is that CONFIG_Z3FOLD is a tristate. I made
> CONFIG_Z3FOLD_DEPRECATED a boolean config, and CONFIG_Z3FOLD default y
> so that it is on by default if CONFIG_Z3FOLD_DEPRECATED is selected. I
> am not sure if that's the correct way to do this.
>
> ---
>  arch/loongarch/configs/loongson3_defconfig |  1 -
>  arch/powerpc/configs/ppc64_defconfig       |  1 -
>  mm/Kconfig                                 | 13 +++++++++++--
>  3 files changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/arch/loongarch/configs/loongson3_defconfig b/arch/loongarch/=
configs/loongson3_defconfig
> index 33795e4a5bd63..89b66b6c6a1d5 100644
> --- a/arch/loongarch/configs/loongson3_defconfig
> +++ b/arch/loongarch/configs/loongson3_defconfig
> @@ -85,7 +85,6 @@ CONFIG_ZPOOL=3Dy
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
> index 1902cfe4cc4f5..bc6cc97c08349 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -193,15 +193,24 @@ config ZBUD
>           deterministic reclaim properties that make it preferable to a h=
igher
>           density approach when reclaim will be used.
>
> -config Z3FOLD
> -       tristate "3:1 compression allocator (z3fold)"
> +config Z3FOLD_DEPRECATED
> +       bool "3:1 compression allocator (z3fold) (DEPRECATED)"
>         depends on ZSWAP
>         help
> +         Deprecated and scheduled for removal in a few cycles. If you ha=
ve
> +         a good reason for using Z3FOLD rather than ZSMALLOC or ZBUD, pl=
ease
> +         contact linux-mm@kvack.org and the zswap maintainers.
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
> +       default y
> +       depends on Z3FOLD_DEPRECATED
> +
>  config ZSMALLOC
>         tristate
>         prompt "N:1 compression allocator (zsmalloc)" if ZSWAP
> --
> 2.43.0.275.g3460e3d667-goog
>
