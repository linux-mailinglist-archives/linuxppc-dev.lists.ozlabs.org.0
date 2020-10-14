Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E96E28DEFF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Oct 2020 12:35:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CB8245q5gzDqTn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Oct 2020 21:35:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=krzk@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=P18xeYxT; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CB8076PJxzDqM3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Oct 2020 21:33:43 +1100 (AEDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DD30A2224F
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Oct 2020 10:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602671620;
 bh=YTNSXcW0k5VpGDP+ALIpIyuW3iLRTmD54rqCQ1oyiyA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=P18xeYxTPqMpemlQKPvTd5nwNgVotG/C9hUhYFrwNcoqdW1OKmWITForEr9NE9YGe
 ztHjLq5Vkt9oWxZS/7llHQJxy+88QHQLNoNMaqGwd903m9QfEQI/1Y/AaHfdx1T5ec
 WHD/ATMq1RBPTU/qjQVRFitg7PDDX2RqEDzRUdxU=
Received: by mail-lf1-f49.google.com with SMTP id 77so3139752lfl.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Oct 2020 03:33:39 -0700 (PDT)
X-Gm-Message-State: AOAM5300wyQCbBkgWgBoLAVpyDI/Id8dx2IZ9zIJiaekfm3dkE8oUh4O
 RN1Fib/hrc8qx/40UBiHZfPyYebMzQVE9KUUvEU=
X-Google-Smtp-Source: ABdhPJxZBjfPkS/DAl69mvwOwG4fxUYT0dQEW6rrgGKRXDR2yPgf5o4BRFNdNiVveb84vPHaKXSGoZA2E31iHMoZKKE=
X-Received: by 2002:a17:906:1a11:: with SMTP id
 i17mr4430823ejf.381.1602671617348; 
 Wed, 14 Oct 2020 03:33:37 -0700 (PDT)
MIME-Version: 1.0
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-21-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20201014101402.18271-21-Sergey.Semin@baikalelectronics.ru>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Wed, 14 Oct 2020 12:33:25 +0200
X-Gmail-Original-Message-ID: <CAJKOXPeErocR5-3xCDqBR3-k3w_2EQ_768d71n229cbzeo4TtQ@mail.gmail.com>
Message-ID: <CAJKOXPeErocR5-3xCDqBR3-k3w_2EQ_768d71n229cbzeo4TtQ@mail.gmail.com>
Subject: Re: [PATCH 20/20] arch: dts: Fix DWC USB3 DT nodes name
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-usb@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>, Tony Lindgren <tony@atomide.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Gregory Clement <gregory.clement@bootlin.com>, Wei Xu <xuwei5@hisilicon.com>,
 Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>,
 Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-snps-arc@lists.infradead.org,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>,
 Mathias Nyman <mathias.nyman@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Maxime Ripard <mripard@kernel.org>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Rob Herring <robh+dt@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Roger Quadros <rogerq@ti.com>, Felipe Balbi <balbi@kernel.org>,
 linux-mips@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linuxppc-dev@lists.ozlabs.org, Patrice Chotard <patrice.chotard@st.com>,
 Serge Semin <fancer.lancer@gmail.com>, Li Yang <leoyang.li@nxp.com>,
 Manu Gautam <mgautam@codeaurora.org>,
 =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 14 Oct 2020 at 12:23, Serge Semin
<Sergey.Semin@baikalelectronics.ru> wrote:
>
> In accordance with the DWC USB3 bindings the corresponding node name is
> suppose to comply with Generic USB HCD DT schema, which requires the USB
> nodes to have the name acceptable by the regexp: "^usb(@.*)?" . But a lot
> of the DWC USB3-compatible nodes defined in the ARM/ARM64 DTS files have
> name as "^dwc3@.*" or "^usb[1-3]@.*" or even "^dwusb@.*", which will cause
> the dtbs_check procedure failure. Let's fix the nodes naming to be
> compatible with the DWC USB3 DT schema to make dtbs_check happy.
>
> Note we don't change the DWC USB3-compatible nodes names of
> arch/arm64/boot/dts/apm/{apm-storm.dtsi,apm-shadowcat.dtsi} since the
> in-source comment says that the nodes name need to be preserved as
> "^dwusb@.*" for some backward compatibility.
>
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
>
> ---
>
> Please, test the patch out to make sure it doesn't brake the dependent DTS
> files. I did only a manual grepping of the possible nodes dependencies.

1. It is you who should compare the decompiled DTS, not us. For example:
$ for i in dts-old/*/*dtb dts-old/*/*/*dtb; do echo $i; crosc64
scripts/dtc/dtx_diff ${i} dts-new/${i#dts-old/} ; done

$ for i in dts-old/*/*dtb dts-old/*/*/*dtb; do echo $i; crosc64
fdtdump ${i} > ${i}.fdt ; crosc64 fdtdump dts-new/${i#dts-old/} >
dts-new/${i#dts-old/}.fdt ; diff -ubB ${i}.fdt
dts-new/${i#dts-old/}.fdt ; done

2. Split it per arm architectures (and proper subject prefix - not
"arch") and subarchitectures so maintainers can pick it up.

3. The subject title could be more accurate - there is no fix here
because there was no errors in the first place. Requirement of DWC
node names comes recently, so it is more alignment with dtschema.
Otherwise automatic-pickup-stable-bot might want to pick up... and it
should not go to stable.

Best regards,
Krzysztof

>  arch/arm/boot/dts/armada-375.dtsi              | 2 +-
>  arch/arm/boot/dts/exynos5250.dtsi              | 2 +-
>  arch/arm/boot/dts/exynos54xx.dtsi              | 4 ++--
>  arch/arm/boot/dts/keystone-k2e.dtsi            | 4 ++--
>  arch/arm/boot/dts/keystone.dtsi                | 2 +-
>  arch/arm/boot/dts/ls1021a.dtsi                 | 2 +-
>  arch/arm/boot/dts/omap5-l4.dtsi                | 2 +-
>  arch/arm/boot/dts/stih407-family.dtsi          | 2 +-
>  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi   | 2 +-
>  arch/arm64/boot/dts/exynos/exynos5433.dtsi     | 4 ++--
>  arch/arm64/boot/dts/exynos/exynos7.dtsi        | 2 +-
>  arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi | 4 ++--
>  arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi | 6 +++---
>  arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi | 4 ++--
>  arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi | 4 ++--
>  arch/arm64/boot/dts/hisilicon/hi3660.dtsi      | 2 +-
>  arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi   | 4 ++--
>  arch/arm64/boot/dts/qcom/ipq8074.dtsi          | 4 ++--
>  arch/arm64/boot/dts/qcom/msm8996.dtsi          | 4 ++--
>  arch/arm64/boot/dts/qcom/msm8998.dtsi          | 2 +-
>  arch/arm64/boot/dts/qcom/qcs404-evb.dtsi       | 2 +-
>  arch/arm64/boot/dts/qcom/qcs404.dtsi           | 4 ++--
>  arch/arm64/boot/dts/qcom/sc7180.dtsi           | 2 +-
>  arch/arm64/boot/dts/qcom/sdm845.dtsi           | 4 ++--
>  arch/arm64/boot/dts/qcom/sm8150.dtsi           | 2 +-
>  25 files changed, 38 insertions(+), 38 deletions(-)
>
