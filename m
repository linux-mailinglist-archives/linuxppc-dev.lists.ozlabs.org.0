Return-Path: <linuxppc-dev+bounces-3575-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A0F9D98A4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2024 14:37:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XyNt61T0Jz2ymg;
	Wed, 27 Nov 2024 00:37:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732628254;
	cv=none; b=J84JTpixrUwyR/CozMWf7q7Aw6mJyAz6EqBWU8wBciGlk/jCPJCD63QeiENcOTWJ5hQWVb8ERy802e/+N6DG0uH7Z+CpXJZ18sUGdY6TLVlYOBofUTPfpR0qDIHhbGeY7RmWY5SFISjxLlEmYGlQltgNNO2J7CWHlSeXylqo5m54RalHFZgJ3E5l8tKJaCBxHA2h0S0+clwFoynNNj0AMWA4GfqCVR3v0+ko2WraynRdtwQrJqXha/4rKDA8+X/yVetmWljK+Lov+TpE23DDSZNSxudBEcqWw4HT/c21q5va0otggn/fTBYz2AOEbzV0z+lXozcRzFRDIo72k/ptDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732628254; c=relaxed/relaxed;
	bh=oiXbITsLCe2bx0/XgrRiW1wUsR7XEEgeEi7rOR+AArc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JOKl+/NxFcmtTeahobnjHpsEdBjPDA5JiKZvZ8gI6NIhL01J3GnCDXI9Dqd4/CckquAEj0d+GD9aRuahG+18FP2BQQUlXLfAb8n3HRDNPqWUfBwGyuMrBECFXY+Vy6Q1WKcLZomMruHq5AySlAD0F7/cEW7wEJZd3+Ehu8M9uAEXEAvhaGNo7TNKAD0QZPUV62wwMG4P9NqnuFJd/qxDfk/IUmDZC5LQIAc3hHZ76GOCGAEPJ8Xc6Lxu/udwULGn7DJXk+3UaEgO28ckEZ8rnO4A6S9tRWXjlJF4Tz7dOY8FRT0OHsm4dsHwjzj0JUeMDHtJG8tgENb9UJleDk8nnA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tWNooiF1; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tWNooiF1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XyNt50J66z2ymc
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov 2024 00:37:32 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 034FC5C5038
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Nov 2024 13:36:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21D52C4CED0
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Nov 2024 13:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732628250;
	bh=VbOkG7UxlyHWlguAL2j5KGuPIwyUxslVDdZfokzx/f0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tWNooiF16pOSDmb1iMlDJG01LKQojiwCvtI97+t8rc31hnW1mqLconLH2q1DZiEdT
	 pHv6PFGvgVLx4syDuoJu8xJrqjnybRngr1i0zBeOFHuYenp2y9XeR/dI7EZEmRw+cm
	 Zzy4BEf2WxuGT3wACU+VHjLVcgmloEfTdKTxLSKHSUIXNtUemBQFf6DelxO5XEFlom
	 WLkGw9d8GK2tzjd6Ulnb/87zBq5khVWxoLDk33nQj7cKH2MEcVozwE/zZeS1/Yw1aY
	 waTMoaLK+g5xrawAGmbQdPfmnsgf6XJ8NmIKMhKaNABKnCrDMmzHzheUBoemTGpOe0
	 9+vISiy2Z3TmQ==
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6ee79e82361so55407177b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Nov 2024 05:37:30 -0800 (PST)
X-Gm-Message-State: AOJu0YzxHH71/GZDmdY5fWgkFSmM3uEgd3ybn8JYg57H5MtybnOgT4PL
	8SUMgRzUKEGTl+yLDy0Oi4x63BCEIzoKLJ+sgnkuqG8BDEqzM0QHXZ7nhpruZSri0qM1sJzo19z
	qPIuQAdVsSJJgZ2kkkkJNk6WaRg==
X-Google-Smtp-Source: AGHT+IEnXFbOa9aXTSk7jlPCIgSVpFPdSMelXI3aGNVoBWCaVRayUlLEtrcRuuQMm6/x5KJIU4FdbHA5bt4fqU7rYtE=
X-Received: by 2002:a05:690c:968e:b0:6ea:6644:ddf8 with SMTP id
 00721157ae682-6ef23a65d69mr27243007b3.0.1732628249338; Tue, 26 Nov 2024
 05:37:29 -0800 (PST)
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
References: <20241126025710.591683-1-mpe@ellerman.id.au>
In-Reply-To: <20241126025710.591683-1-mpe@ellerman.id.au>
From: Rob Herring <robh@kernel.org>
Date: Tue, 26 Nov 2024 07:37:17 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKJzAoxFQ30rJbH7D7zmGtZ+jNpw2BL45dqjOUe2fFbwA@mail.gmail.com>
Message-ID: <CAL_JsqKJzAoxFQ30rJbH7D7zmGtZ+jNpw2BL45dqjOUe2fFbwA@mail.gmail.com>
Subject: Re: [PATCH] powerpc/prom_init: Fixup missing powermac #size-cells
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org, saravanak@google.com, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Nov 25, 2024 at 8:57=E2=80=AFPM Michael Ellerman <mpe@ellerman.id.a=
u> wrote:
>
> On some powermacs `escc` nodes are missing `#size-cells` properties,
> which is deprecated and now triggers a warning at boot since commit
> 045b14ca5c36 ("of: WARN on deprecated #address-cells/#size-cells
> handling").
>
> For example:
>
>   Missing '#size-cells' in /pci@f2000000/mac-io@c/escc@13000
>   WARNING: CPU: 0 PID: 0 at drivers/of/base.c:133 of_bus_n_size_cells+0x9=
8/0x108
>   Hardware name: PowerMac3,1 7400 0xc0209 PowerMac
>   ...
>   Call Trace:
>     of_bus_n_size_cells+0x98/0x108 (unreliable)
>     of_bus_default_count_cells+0x40/0x60
>     __of_get_address+0xc8/0x21c
>     __of_address_to_resource+0x5c/0x228
>     pmz_init_port+0x5c/0x2ec
>     pmz_probe.isra.0+0x144/0x1e4
>     pmz_console_init+0x10/0x48
>     console_init+0xcc/0x138
>     start_kernel+0x5c4/0x694
>
> As powermacs boot via prom_init it's possible to add the missing
> properties to the device tree during boot, avoiding the warning. Note
> that `escc-legacy` nodes are also missing `#size-cells` properties, but
> they are skipped by the macio driver, so leave them alone.
>
> Depends-on: 045b14ca5c36 ("of: WARN on deprecated #address-cells/#size-ce=
lls handling")
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  arch/powerpc/kernel/prom_init.c | 29 +++++++++++++++++++++++++++--
>  1 file changed, 27 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_i=
nit.c
> index 73210e5bcfa7..8e776ba39497 100644
> --- a/arch/powerpc/kernel/prom_init.c
> +++ b/arch/powerpc/kernel/prom_init.c
> @@ -2848,7 +2848,7 @@ static void __init fixup_device_tree_chrp(void)
>  #endif
>
>  #if defined(CONFIG_PPC64) && defined(CONFIG_PPC_PMAC)
> -static void __init fixup_device_tree_pmac(void)
> +static void __init fixup_device_tree_pmac64(void)
>  {
>         phandle u3, i2c, mpic;
>         u32 u3_rev;
> @@ -2888,7 +2888,31 @@ static void __init fixup_device_tree_pmac(void)
>                      &parent, sizeof(parent));
>  }
>  #else
> -#define fixup_device_tree_pmac()
> +#define fixup_device_tree_pmac64()
> +#endif
> +
> +#ifdef CONFIG_PPC_PMAC
> +static void __init fixup_device_tree_pmac(void)
> +{
> +       __be32 val =3D 1;
> +       char type[8];
> +       phandle node;

I suppose you are keeping the existing style, but you could use
IS_ENABLED() here instead of #ifdef.

Either way,

Reviewed-by: Rob Herring <robh@kernel.org>

