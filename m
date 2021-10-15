Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB7B42F7E9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 18:16:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HWBGd3hjwz3c9V
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Oct 2021 03:16:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fUxjpQpK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh+dt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=fUxjpQpK; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HWBFx5tRBz2yNY
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Oct 2021 03:15:49 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7296261181
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Oct 2021 16:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634314546;
 bh=J6lMIRppIQQR2yDU8HEFtiobkHUlT4L+X3PXR/XHp8k=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=fUxjpQpKZEMfW+RRIp60SX1iX/UwmX2w7X5lIZEpj7biPSsFXPDMUQafV+MRGFMmQ
 EL8HPMjTiB8NjmWVoshAD7lta4yw5ks7FQ5A97AWaT6RIcAyKWEtDQ6UK7wHLXbbG3
 Z1ztXj9KpCB5OMJzlWulfrEP66XP61txqi1cOfM0ryOvkLKJse4YDrrC9cAeT803ZX
 I1dRqcI6sM7uBu908E4buE0sgeJjzPDGbl1FQ9Mcim+RVQCz+xQivYjOcEswbqaOuG
 3L1+rjNW2B0Xd0lB3zf/uOnVZtTN0eV7Al82PBbYtkmb3ud3BZvtdUS/bkKYpz+Va3
 4TlkTUzrYEe4g==
Received: by mail-ed1-f49.google.com with SMTP id y12so41789782eda.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Oct 2021 09:15:46 -0700 (PDT)
X-Gm-Message-State: AOAM533AeVWCHlifvGXzO+qahDcSmaxNGD0gNBndUwbPvDg1vUiZtbal
 aQTXWH+xhoTi77K5hd+s71zVrYLtDF9bmQSuDA==
X-Google-Smtp-Source: ABdhPJwsRQPmyqCZEJ2EspO5jNkdQ+LeDKtD0EmxJMsNFClADPbMWi8f8wb8874t+JF0p3aYra/8VjChk0VBCZZRh6M=
X-Received: by 2002:a05:6402:84d:: with SMTP id
 b13mr19328337edz.6.1634314544839; 
 Fri, 15 Oct 2021 09:15:44 -0700 (PDT)
MIME-Version: 1.0
References: <20211014224201.24027-1-agust@denx.de>
In-Reply-To: <20211014224201.24027-1-agust@denx.de>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 15 Oct 2021 11:15:32 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+_K9X010eKz0uwGH33h3vwwEE-+f=z9YWEdhji4yHxWg@mail.gmail.com>
Message-ID: <CAL_Jsq+_K9X010eKz0uwGH33h3vwwEE-+f=z9YWEdhji4yHxWg@mail.gmail.com>
Subject: Re: [PATCH v2] powerpc/mpc512x: dts: fix PSC node warnings
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

On Thu, Oct 14, 2021 at 5:42 PM Anatolij Gustschin <agust@denx.de> wrote:
>
> Rework PSC node description to fix build warnings like:
> mpc5121.dtsi:397.13-406.5: Warning (spi_bus_bridge): /soc@80000000/psc@11400: node name for SPI buses should be 'spi'
> mpc5121.dtsi:409.13-418.5: Warning (spi_bus_bridge): /soc@80000000/psc@11500: node name for SPI buses should be 'spi'
> mpc5121.dtsi:457.13-466.5: Warning (spi_bus_bridge): /soc@80000000/psc@11900: node name for SPI buses should be 'spi'

Okay, I now see the block supports either spi or serial modes. I would
handle this a bit differently that doesn't create a bunch of new .dtsi
files.

>
> Signed-off-by: Anatolij Gustschin <agust@denx.de>
> ---
> Changes in v2:
>  - extract PSC nodes to files which can be included
>    separately and extended as needed
>
>  arch/powerpc/boot/dts/ac14xx.dts            | 118 ++++++++--------
>  arch/powerpc/boot/dts/mpc5121-psc0.dtsi     |  16 +++
>  arch/powerpc/boot/dts/mpc5121-psc1.dtsi     |  15 ++
>  arch/powerpc/boot/dts/mpc5121-psc10.dtsi    |  15 ++
>  arch/powerpc/boot/dts/mpc5121-psc11.dtsi    |  15 ++
>  arch/powerpc/boot/dts/mpc5121-psc2.dtsi     |  15 ++
>  arch/powerpc/boot/dts/mpc5121-psc3.dtsi     |  15 ++
>  arch/powerpc/boot/dts/mpc5121-psc4-spi.dtsi |  17 +++
>  arch/powerpc/boot/dts/mpc5121-psc4.dtsi     |  15 ++
>  arch/powerpc/boot/dts/mpc5121-psc5-spi.dtsi |  17 +++
>  arch/powerpc/boot/dts/mpc5121-psc5.dtsi     |  15 ++
>  arch/powerpc/boot/dts/mpc5121-psc6.dtsi     |  15 ++
>  arch/powerpc/boot/dts/mpc5121-psc7.dtsi     |  15 ++
>  arch/powerpc/boot/dts/mpc5121-psc8.dtsi     |  15 ++
>  arch/powerpc/boot/dts/mpc5121-psc9-spi.dtsi |  17 +++
>  arch/powerpc/boot/dts/mpc5121-psc9.dtsi     |  15 ++
>  arch/powerpc/boot/dts/mpc5121.dtsi          | 148 +-------------------
>  arch/powerpc/boot/dts/mpc5121ads.dts        |  42 +++---
>  arch/powerpc/boot/dts/pdm360ng.dts          | 104 +++++++-------
>  19 files changed, 371 insertions(+), 273 deletions(-)
>  create mode 100644 arch/powerpc/boot/dts/mpc5121-psc0.dtsi
>  create mode 100644 arch/powerpc/boot/dts/mpc5121-psc1.dtsi
>  create mode 100644 arch/powerpc/boot/dts/mpc5121-psc10.dtsi
>  create mode 100644 arch/powerpc/boot/dts/mpc5121-psc11.dtsi
>  create mode 100644 arch/powerpc/boot/dts/mpc5121-psc2.dtsi
>  create mode 100644 arch/powerpc/boot/dts/mpc5121-psc3.dtsi
>  create mode 100644 arch/powerpc/boot/dts/mpc5121-psc4-spi.dtsi
>  create mode 100644 arch/powerpc/boot/dts/mpc5121-psc4.dtsi
>  create mode 100644 arch/powerpc/boot/dts/mpc5121-psc5-spi.dtsi
>  create mode 100644 arch/powerpc/boot/dts/mpc5121-psc5.dtsi
>  create mode 100644 arch/powerpc/boot/dts/mpc5121-psc6.dtsi
>  create mode 100644 arch/powerpc/boot/dts/mpc5121-psc7.dtsi
>  create mode 100644 arch/powerpc/boot/dts/mpc5121-psc8.dtsi
>  create mode 100644 arch/powerpc/boot/dts/mpc5121-psc9-spi.dtsi
>  create mode 100644 arch/powerpc/boot/dts/mpc5121-psc9.dtsi

[...]

> diff --git a/arch/powerpc/boot/dts/mpc5121.dtsi b/arch/powerpc/boot/dts/mpc5121.dtsi
> index 3f66b91a8e3c..21674da8beb1 100644
> --- a/arch/powerpc/boot/dts/mpc5121.dtsi
> +++ b/arch/powerpc/boot/dts/mpc5121.dtsi
> @@ -87,7 +87,7 @@
>                 };
>         };
>
> -       soc@80000000 {
> +       soc: soc@80000000 {
>                 compatible = "fsl,mpc5121-immr";
>                 #address-cells = <1>;
>                 #size-cells = <1>;
> @@ -343,152 +343,6 @@
>                         clock-names = "ipg";
>                 };
>
> -               /* 512x PSCs are not 52xx PSC compatible */
> -
> -               /* PSC0 */
> -               psc@11000 {

I would just put here 'serial@11000' and 'spi@11000' nodes with both
nodes set to disabled. Then the board dts just has to change status of
the the nodes it wants to enable (and add child nodes for spi).
Overlapping addresses are okay if nodes are disabled.

> -                       compatible = "fsl,mpc5121-psc";
> -                       reg = <0x11000 0x100>;
> -                       interrupts = <40 0x8>;
> -                       fsl,rx-fifo-size = <16>;
> -                       fsl,tx-fifo-size = <16>;
> -                       clocks = <&clks MPC512x_CLK_PSC0>,
> -                                <&clks MPC512x_CLK_PSC0_MCLK>;
> -                       clock-names = "ipg", "mclk";
> -               };
