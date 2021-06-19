Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A516C3AD6F2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Jun 2021 05:16:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G6LYS2kWSz3c5g
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Jun 2021 13:16:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=FyZZ9H9q;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=srs0=aoo4=ln=gmail.com=npiggin@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=FyZZ9H9q; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G6LY262THz2xYf
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Jun 2021 13:16:22 +1000 (AEST)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by ozlabs.org (Postfix) with ESMTP id 4G6LY155QRz9sWk
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Jun 2021 13:16:21 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4G6LY13rzkz9sWM; Sat, 19 Jun 2021 13:16:21 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f;
 helo=mail-pl1-x62f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=FyZZ9H9q; dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4G6LY06nR1z9sRf;
 Sat, 19 Jun 2021 13:16:20 +1000 (AEST)
Received: by mail-pl1-x62f.google.com with SMTP id c15so5575930pls.13;
 Fri, 18 Jun 2021 20:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=MRbO2ZwY7DNzo0HQIQt90UXM/F6/FHbr/s05/w3zWg4=;
 b=FyZZ9H9qWSmniiguUwpshTvt0vEnpLXC505Cectfi3e5xtKocwGxWW1oKZh6560M09
 ulecvCN78phBhIzjBEbMCQfkVz3R1qW8tHs1a52QCekV3kY8qnyGpGMClFf61ckChUuD
 wxwHM9RztK13+oehicfNj0Pb2FDnAogGf896xqNh7YUhDXg0C0S8hW69gYXovKmhA24k
 4TKRa3qMqZGd8s48z7YyMxTlPvPlaz44uScHLE2+yCiJQaursSsUTZxEOMxYIT0MtvJM
 CjMJG7s/3pBVrqIdHHPErX0R2a0SVwXouPtntgHrU/uMC7AAdZXdydpEpWP5PY7rehop
 ASbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=MRbO2ZwY7DNzo0HQIQt90UXM/F6/FHbr/s05/w3zWg4=;
 b=Wku399n85GlA8smz1zbv9NOXEUMTNcvhmlAfP8MUOHTV9UEc66/JF6zsWSKTHEybEp
 W0thnyk7EgUaKOsnUoH3YMm6DEDT9t8Q1kZzyTkoFs+/fPeL2+e1JLDvjY+ae1eb/f8p
 GQ1R4HvUNtGhp6p7UIlZ9lCwvplGsGcnnOcaFXHHvA7fWUp1/u4BnbdPxqm6YJ6DmYcd
 qYo6LONsqqNAS+qeRDsjM0GKejggYiGkszHheKO8hZlgUsgccGiIiNX9WvBsT2j319ls
 oy3198GvNlAwB3DksOwf5lZvqkSGqU9+LkSPkeczovq70BQ0LCY80+/3qemrASaWNUgI
 Zyrw==
X-Gm-Message-State: AOAM531LB+RawYQksua4ctBXWbd4D97eMo89vZtYmTNNJtixvcBZCFq+
 VVcv0NXmoYeflRxeka0O/dD6uzHYwwU=
X-Google-Smtp-Source: ABdhPJw1Cu8Njwf0W0ypC0xpzBJUPaPtQhg0C4K5v1OtWLlP8qL9m7vYOMtxdLb6xnJwU/9nEafA1A==
X-Received: by 2002:a17:902:da91:b029:116:864e:893b with SMTP id
 j17-20020a170902da91b0290116864e893bmr7533661plx.26.1624072577669; 
 Fri, 18 Jun 2021 20:16:17 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id nv1sm8916574pjb.43.2021.06.18.20.16.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 20:16:17 -0700 (PDT)
Date: Sat, 19 Jun 2021 13:16:11 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 9/9] powerpc/boot: Add a boot wrapper for Microwatt
To: linuxppc-dev@ozlabs.org, Paul Mackerras <paulus@ozlabs.org>
References: <YMwWPcsaWzMlDPqQ@thinks.paulus.ozlabs.org>
 <YMwX19wym3kQ7guu@thinks.paulus.ozlabs.org>
In-Reply-To: <YMwX19wym3kQ7guu@thinks.paulus.ozlabs.org>
MIME-Version: 1.0
Message-Id: <1624072480.muwpegowoa.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Paul Mackerras's message of June 18, 2021 1:49 pm:
> From: Joel Stanley <joel@jms.id.au>
>=20
> This allows microwatt's kernel to be built with an embedded device tree.
>=20
> Load to arch/powerpc/boot/dtbImage.microwatt to 0x500000:
>=20
>  mw_debug -b fpga stop load arch/powerpc/boot/dtbImage.microwatt 500000 s=
tart
>=20
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Paul Mackerras <paulus@ozlabs.org>

Thanks for folding and commenting that change. Ack for this and the rest=20
of the platform and dt and interrupt handling patches FWIW, but I don't=20
know much about any of these areas to give an informed review.

Thanks,
Nick

> ---
>  arch/powerpc/boot/Makefile    |  4 ++++
>  arch/powerpc/boot/microwatt.c | 24 ++++++++++++++++++++++++
>  arch/powerpc/boot/wrapper     |  5 +++++
>  3 files changed, 33 insertions(+)
>  create mode 100644 arch/powerpc/boot/microwatt.c
>=20
> diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
> index 2b8da923ceca..dfaa4094fcae 100644
> --- a/arch/powerpc/boot/Makefile
> +++ b/arch/powerpc/boot/Makefile
> @@ -163,6 +163,8 @@ src-plat-$(CONFIG_PPC_POWERNV) +=3D pseries-head.S
>  src-plat-$(CONFIG_PPC_IBM_CELL_BLADE) +=3D pseries-head.S
>  src-plat-$(CONFIG_MVME7100) +=3D motload-head.S mvme7100.c
> =20
> +src-plat-$(CONFIG_PPC_MICROWATT) +=3D fixed-head.S microwatt.c
> +
>  src-wlib :=3D $(sort $(src-wlib-y))
>  src-plat :=3D $(sort $(src-plat-y))
>  src-boot :=3D $(src-wlib) $(src-plat) empty.c
> @@ -355,6 +357,8 @@ image-$(CONFIG_MVME5100)		+=3D dtbImage.mvme5100
>  # Board port in arch/powerpc/platform/amigaone/Kconfig
>  image-$(CONFIG_AMIGAONE)		+=3D cuImage.amigaone
> =20
> +image-$(CONFIG_PPC_MICROWATT)		+=3D dtbImage.microwatt
> +
>  # For 32-bit powermacs, build the COFF and miboot images
>  # as well as the ELF images.
>  ifdef CONFIG_PPC32
> diff --git a/arch/powerpc/boot/microwatt.c b/arch/powerpc/boot/microwatt.=
c
> new file mode 100644
> index 000000000000..ca9d83617fc1
> --- /dev/null
> +++ b/arch/powerpc/boot/microwatt.c
> @@ -0,0 +1,24 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +
> +#include <stddef.h>
> +#include "stdio.h"
> +#include "types.h"
> +#include "io.h"
> +#include "ops.h"
> +
> +BSS_STACK(8192);
> +
> +void platform_init(unsigned long r3, unsigned long r4, unsigned long r5)
> +{
> +	unsigned long heapsize =3D 16*1024*1024 - (unsigned long)_end;
> +
> +	/*
> +	 * Disable interrupts and turn off MSR_RI, since we'll
> +	 * shortly be overwriting the interrupt vectors.
> +	 */
> +	__asm__ volatile("mtmsrd %0,1" : : "r" (0));
> +
> +	simple_alloc_init(_end, heapsize, 32, 64);
> +	fdt_init(_dtb_start);
> +	serial_console_init();
> +}
> diff --git a/arch/powerpc/boot/wrapper b/arch/powerpc/boot/wrapper
> index 41fa0a8715e3..ae48fffa1e13 100755
> --- a/arch/powerpc/boot/wrapper
> +++ b/arch/powerpc/boot/wrapper
> @@ -342,6 +342,11 @@ gamecube|wii)
>      link_address=3D'0x600000'
>      platformo=3D"$object/$platform-head.o $object/$platform.o"
>      ;;
> +microwatt)
> +    link_address=3D'0x500000'
> +    platformo=3D"$object/fixed-head.o $object/$platform.o"
> +    binary=3Dy
> +    ;;
>  treeboot-currituck)
>      link_address=3D'0x1000000'
>      ;;
> --=20
> 2.31.1
>=20
>=20
