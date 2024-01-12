Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BF882C5FC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jan 2024 20:43:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=d39F6l+K;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TBX5q5bZRz3bqV
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Jan 2024 06:43:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=d39F6l+K;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d30; helo=mail-io1-xd30.google.com; envelope-from=nphamcs@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TBX4y2nCfz3bbt
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Jan 2024 06:42:56 +1100 (AEDT)
Received: by mail-io1-xd30.google.com with SMTP id ca18e2360f4ac-7baa8da5692so301283639f.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jan 2024 11:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705088573; x=1705693373; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7jBwE7Jt9seeB7l4z11oYjZwnUcDEcCEvTkM2Ir2NMI=;
        b=d39F6l+KeTnn8BUWsq6n8oyI24HxZyMqD8DJIZKJYYpUAFHhTtyHezYpXovQjdhWoA
         DYXIMeJKErEI1rWCmxf9jofFSpn+FRj9ju1kd2Vmi/iR7XG8q81pgV8S794wtz1hzWmI
         6pJ00wKjmMZQ5IZ89hUZ/fwvnRsHn5ov+nvHfXeyC/Ddab5/5NjyvPosG7dwNJ1KY2Hx
         EIDbOq7GsqyPQYWaK8PizWg0P05EWo9C0RoVfc4wZBmaT9MoEIOxnRoL7yXsa6FiT2HA
         tGOJQFrX9ikxyA4RttnU+kRfD390/GDmjLME1U6lOqFZMKiqJQGTfrCcQzact6AzKIE1
         sDag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705088573; x=1705693373;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7jBwE7Jt9seeB7l4z11oYjZwnUcDEcCEvTkM2Ir2NMI=;
        b=MBhUsUNGnavGiIgozr5LI4mB+JIspr/+VNG8eNFBlgPHlKtvDrT29x1KaIXX1xfLVD
         wc5itRzhoK/qAs528DisvN2VH5KrjNLiuDVqFF51jcs2zh/QnMpIlGvt0x4B4qSTcvYn
         tyePqaAbL8LOm9M2zqmbIzKWa+ZiPpcxUspMEvQozwWSiorwjxwSJ0OVMTpIMWLal40Q
         yRsoB2EIi7nAls43ARp/ZyQ/uCmXWOVbcNAwl24pW4O2op6hFOrkV+Nc3viyQIJCjsn5
         /y20Frat0bI7ELvSL1nTw4ka5yXE/0HuUWwrqB1OHGiSnDtl3kQME3TWkz3VYX7XoELZ
         RAHg==
X-Gm-Message-State: AOJu0Yxrte08CKMdrIYyFfKzAYU7lEdk011JSENRzIFOKGl6eOfAYp6a
	fffuPjQQVu7/zMYe+u9IcyjHERWCQKmLG+LRsWQ=
X-Google-Smtp-Source: AGHT+IHfCfBeIKefE1pIXMRHJc5enwSKf3AqqH1Q2r68AUAgrpkc5+s5bMgmxMzoF9BtYalbpQtcdFcbOtmlcSPYcNU=
X-Received: by 2002:a5e:dd09:0:b0:7be:f53e:4dbc with SMTP id
 t9-20020a5edd09000000b007bef53e4dbcmr2169399iop.28.1705088573558; Fri, 12 Jan
 2024 11:42:53 -0800 (PST)
MIME-Version: 1.0
References: <20240112193103.3798287-1-yosryahmed@google.com>
In-Reply-To: <20240112193103.3798287-1-yosryahmed@google.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Fri, 12 Jan 2024 11:42:42 -0800
Message-ID: <CAKEwX=PXfZssERxeMS3FpMP7H0psMzC72C2ga3fqr_Qh88M75A@mail.gmail.com>
Subject: Re: [RFC PATCH] mm: z3fold: rename CONFIG_Z3FOLD to CONFIG_Z3FOLD_DEPRECATED
To: Yosry Ahmed <yosryahmed@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, Huacai Chen <chenhuacai@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, linux-mm@kvack.org, loongarch@lists.linux.dev, Johannes Weiner <hannes@cmpxchg.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, WANG Xuerui <kernel@xen0n.name>, Vitaly Wool <vitaly.wool@konsulko.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jan 12, 2024 at 11:31=E2=80=AFAM Yosry Ahmed <yosryahmed@google.com=
> wrote:
>
> The z3fold compressed pages allocator is not widely used, most users use
> zsmalloc. The only disadvantage of zsmalloc in comparison is the
> dependency on MMU, and zbud is a more common option for !MMU as it was
> the default zswap allocator for a long time.

Johannes and I were chatting about this the other day. We might be
able to disable certain zsmalloc behavior in the case of !MMU, making
it available there too. Once that's happened, we can outright remove
z3fold and zbud, and have one allocator to rule them all? :)

>
> In hopes of having a single compressed pages allocator at some point,
> and following in the footsteps of SLAB, deprecate z3fold. Rename the
> user-visible option so that users with CONFIG_Z3FOLD=3Dy get a new prompt
> with explanation during make oldconfig. Remove CONFIG_Z3FOLD=3Dy from
> defconfigs.
>
> Existing users, if any, should voice their objections. Otherwise, we can
> remove z3fold in a few releases.
>
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
