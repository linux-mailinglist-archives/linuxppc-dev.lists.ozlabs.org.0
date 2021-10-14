Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6754A42D961
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Oct 2021 14:34:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HVTNv3rPHz3c4m
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Oct 2021 23:34:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mitKSkmw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh+dt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=mitKSkmw; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HVTNB3VwGz2xv8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Oct 2021 23:33:46 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id ACC04610F9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Oct 2021 12:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634214821;
 bh=RzeylZ/P8x5KQVd3L6CJnKExKqdgjhxzj85+6UhIMm8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=mitKSkmwO7I0mBydFadj8WwDCuWF6AKQkrlI/Zmy8dp0yrAuxHb6sQb5ulow+kX3J
 nXEDucY9UCi1sidz571gqyuDEJZt95BJX41TuQ8R0GCWIX2ml8dgKw+k6X47BC7Rfo
 +iotMgPaHOBrHw6VTwpzwtI8BDYOWpE8W5me3FfdfnDBQ3+e5/7wOgCV5Oi7ApKRp4
 CqEBPnay7R/suR0gi9Y1/JWuDWIAhbspEbwG7v/40aGocr/8powlPs863m9/03kuGC
 CI/zk1gto89lQmeaAmwLSghYisVKtY8HEuioTGTmUDWW3JD1Yk9JJnjWvM5PcFuZNc
 Hh7H4RahlasjQ==
Received: by mail-ed1-f44.google.com with SMTP id y30so7130749edi.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Oct 2021 05:33:41 -0700 (PDT)
X-Gm-Message-State: AOAM530K6mzIpZ+2kngmecwKWG2iesZr0oG+C2PsuUtDJaM0k8ZzFkZe
 hrF9GXYrteRCO6368l5xl/7o3iwR4Uw0f+zKaA==
X-Google-Smtp-Source: ABdhPJz9TzvElbvIznv9o6eIIhwkZkQvDvfEK/2kZapQkBCcKpS4ncnsn5muDvV6i+hmDO5BxA6TJzf2waYTwhLdyeE=
X-Received: by 2002:a17:906:9399:: with SMTP id
 l25mr3470036ejx.363.1634214819463; 
 Thu, 14 Oct 2021 05:33:39 -0700 (PDT)
MIME-Version: 1.0
References: <20211014113123.2358-1-agust@denx.de>
In-Reply-To: <20211014113123.2358-1-agust@denx.de>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 14 Oct 2021 07:33:26 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJQ8_3+pwT0a-gj5iSUSo3kYZXFraejjBGObNHpB+xcTg@mail.gmail.com>
Message-ID: <CAL_JsqJQ8_3+pwT0a-gj5iSUSo3kYZXFraejjBGObNHpB+xcTg@mail.gmail.com>
Subject: Re: [PATCH] powerpc/mpc512x: dts: fix PSC node warnings
To: Anatolij Gustschin <agust@denx.de>
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
Cc: devicetree@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 14, 2021 at 6:31 AM Anatolij Gustschin <agust@denx.de> wrote:
>
> Fix build warnings like:
> mpc5121.dtsi:397.13-406.5: Warning (spi_bus_bridge): /soc@80000000/psc@11400: node name for SPI buses should be 'spi'
> mpc5121.dtsi:409.13-418.5: Warning (spi_bus_bridge): /soc@80000000/psc@11500: node name for SPI buses should be 'spi'
> mpc5121.dtsi:457.13-466.5: Warning (spi_bus_bridge): /soc@80000000/psc@11900: node name for SPI buses should be 'spi'
>
> Signed-off-by: Anatolij Gustschin <agust@denx.de>
> ---
>  arch/powerpc/boot/dts/ac14xx.dts   | 17 +++++++++++++++--
>  arch/powerpc/boot/dts/pdm360ng.dts | 11 ++++++++++-
>  2 files changed, 25 insertions(+), 3 deletions(-)
>
> diff --git a/arch/powerpc/boot/dts/ac14xx.dts b/arch/powerpc/boot/dts/ac14xx.dts
> index 5d8877e1f4ad..662d7aa2e4e8 100644
> --- a/arch/powerpc/boot/dts/ac14xx.dts
> +++ b/arch/powerpc/boot/dts/ac14xx.dts
> @@ -301,13 +301,21 @@
>                         fsl,tx-fifo-size = <512>;
>                 };
>
> +               /delete-node/ psc@11400;
> +               /delete-node/ psc@11500;

That's an odd way to fix this, and means every user of the .dtsi file
with these nodes will have to repeat the same thing.

> +
>                 /* PSC4 in SPI mode */
> -               spi4: psc@11400 {
> +               spi4: spi@11400 {
>                         compatible = "fsl,mpc5121-psc-spi", "fsl,mpc5121-psc";
> +                       reg = <0x11400 0x100>;
>                         fsl,rx-fifo-size = <768>;
>                         fsl,tx-fifo-size = <768>;
>                         #address-cells = <1>;
>                         #size-cells = <0>;
> +                       interrupts = <40 0x8>;
> +                       clocks = <&clks MPC512x_CLK_PSC4>,
> +                                <&clks MPC512x_CLK_PSC4_MCLK>;
> +                       clock-names = "ipg", "mclk";
>                         num-cs = <1>;
>                         cs-gpios = <&gpio_pic 25 0>;
>
> @@ -326,13 +334,18 @@
>                 };
>
>                 /* PSC5 in SPI mode */
> -               spi5: psc@11500 {
> +               spi5: spi@11500 {
>                         compatible = "fsl,mpc5121-psc-spi", "fsl,mpc5121-psc";
> +                       reg = <0x11500 0x100>;
>                         fsl,mode = "spi-master";
>                         fsl,rx-fifo-size = <128>;
>                         fsl,tx-fifo-size = <128>;
>                         #address-cells = <1>;
>                         #size-cells = <0>;
> +                       interrupts = <40 0x8>;
> +                       clocks = <&clks MPC512x_CLK_PSC5>,
> +                                <&clks MPC512x_CLK_PSC5_MCLK>;
> +                       clock-names = "ipg", "mclk";
>
>                         lcd@0 {
>                                 compatible = "ilitek,ili922x";
> diff --git a/arch/powerpc/boot/dts/pdm360ng.dts b/arch/powerpc/boot/dts/pdm360ng.dts
> index 67c3b9db75d7..2733d15079a9 100644
> --- a/arch/powerpc/boot/dts/pdm360ng.dts
> +++ b/arch/powerpc/boot/dts/pdm360ng.dts
> @@ -169,10 +169,19 @@
>                         compatible = "fsl,mpc5121-psc-uart", "fsl,mpc5121-psc";
>                 };
>
> -               psc@11900 {
> +               /delete-node/ psc@11900;
> +
> +               spi@11900 {
>                         compatible = "fsl,mpc5121-psc-spi", "fsl,mpc5121-psc";
> +                       reg = <0x11900 0x100>;
>                         #address-cells = <1>;
>                         #size-cells = <0>;
> +                       interrupts = <40 0x8>;
> +                       fsl,rx-fifo-size = <16>;
> +                       fsl,tx-fifo-size = <16>;
> +                       clocks = <&clks MPC512x_CLK_PSC9>,
> +                                <&clks MPC512x_CLK_PSC9_MCLK>;
> +                       clock-names = "ipg", "mclk";
>
>                         /* ADS7845 touch screen controller */
>                         ts@0 {
> --
> 2.17.1
>
