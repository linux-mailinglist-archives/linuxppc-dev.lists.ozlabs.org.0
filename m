Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C76C5610613
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Oct 2022 01:04:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mz1TP6zqqz3cKq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Oct 2022 10:04:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BIGu38xE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=sboyd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BIGu38xE;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mz1SQ3qvDz2yYj
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Oct 2022 10:03:34 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C5E106251A;
	Thu, 27 Oct 2022 23:03:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19C2FC433D6;
	Thu, 27 Oct 2022 23:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666911811;
	bh=y8WKXdHUx7ISZalqWkNRYerFR0cXvknFq74JAhzWaN4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=BIGu38xEGqsAblvOSbHZKWSTE5hACJB/2bCLXKji2IHnM21Up7IVDkDA42VPT7FP7
	 gCIIHNxrOZJimkW36e8Elah4Gu2YShTj6JbfizO4L8e8Oo5FInLsbX4myRdeSpz/V5
	 Rw9Yy+UPk4UI5XnngoOfgzvHZwBCZa+0M5CuZ1K1RVSUZjvU5PF8OP50xbTg+kozF1
	 UKKI+isUCw5QU01cIHrlxtuaFEW77THuWoq0EihZgdXgau1y4CPnkjV6EoxewIgN1H
	 vMsuY1XOxlU/d9FKZ3CSI1+gbxx7DhHJypKymSkPjSXOaUJlRE+aN+IK3zO2kP7zuU
	 zVjaBFDB2+bBg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221027191113.403712-5-sean.anderson@seco.com>
References: <20221027191113.403712-1-sean.anderson@seco.com> <20221027191113.403712-5-sean.anderson@seco.com>
Subject: Re: [PATCH v8 4/9] phy: fsl: Add Lynx 10G SerDes driver
From: Stephen Boyd <sboyd@kernel.org>
To: Kishon Vijay Abraham I <kishon@ti.com>, Sean Anderson <sean.anderson@seco.com>, Vinod Koul <vkoul@kernel.org>, linux-phy@lists.infradead.org
Date: Thu, 27 Oct 2022 16:03:28 -0700
User-Agent: alot/0.10
Message-Id: <20221027230331.19C2FC433D6@smtp.kernel.org>
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
Cc: devicetree@vger.kernel.org, Bagas Sanjaya <bagasdotme@gmail.com>, Madalin Bucur <madalin.bucur@nxp.com>, Sean Anderson <sean.anderson@seco.com>, Michael Turquette <mturquette@baylibre.com>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Quoting Sean Anderson (2022-10-27 12:11:08)
> diff --git a/drivers/phy/freescale/Kconfig b/drivers/phy/freescale/Kconfig
> index 853958fb2c06..a6ccccf9e39b 100644
> --- a/drivers/phy/freescale/Kconfig
> +++ b/drivers/phy/freescale/Kconfig
> @@ -47,3 +47,25 @@ config PHY_FSL_LYNX_28G
>           found on NXP's Layerscape platforms such as LX2160A.
>           Used to change the protocol running on SerDes lanes at runtime.
>           Only useful for a restricted set of Ethernet protocols.
> +
> +config PHY_FSL_LYNX_10G
> +       tristate "Freescale QorIQ Lynx 10G SerDes support"
> +       depends on COMMON_CLK

Does something not compile if COMMON_CLK is disabled?

> +       depends on ARCH_LAYERSCAPE || PPC || COMPILE_TEST
> +       select GENERIC_PHY
> +       select REGMAP_MMIO
> +       help
> +         This adds support for the Lynx "SerDes" devices found on variou=
s QorIQ
> +         SoCs. There may be up to four SerDes devices on each SoC, and e=
ach
> +         device supports up to eight lanes. The SerDes is configured by
> +         default by the RCW, but this module is necessary in order to su=
pport
> +         some modes (such as 2.5G SGMII or 1000BASE-KX), or clock setups=
 (as
> +         only as subset of clock configurations are supported by the RCW=
).
> +         The hardware supports a variety of protocols, including Etherne=
t,
> +         SATA, PCIe, and more exotic links such as Interlaken and Aurora=
. This
> +         driver only supports Ethernet, but it will try not to touch lan=
es
> +         configured for other protocols.
> +
> +         If you have a QorIQ processor and want to dynamically reconfigu=
re your
> +         SerDes, say Y. If this driver is compiled as a module, it will =
be
> +         named phy-fsl-lynx-10g-drv.
> diff --git a/drivers/phy/freescale/Makefile b/drivers/phy/freescale/Makef=
ile
> index cedb328bc4d2..1f18936507e0 100644
> --- a/drivers/phy/freescale/Makefile
> +++ b/drivers/phy/freescale/Makefile
> @@ -3,4 +3,7 @@ obj-$(CONFIG_PHY_FSL_IMX8MQ_USB)        +=3D phy-fsl-imx8=
mq-usb.o
>  obj-$(CONFIG_PHY_MIXEL_LVDS_PHY)       +=3D phy-fsl-imx8qm-lvds-phy.o
>  obj-$(CONFIG_PHY_MIXEL_MIPI_DPHY)      +=3D phy-fsl-imx8-mipi-dphy.o
>  obj-$(CONFIG_PHY_FSL_IMX8M_PCIE)       +=3D phy-fsl-imx8m-pcie.o
> +phy-fsl-lynx-10g-drv-y                 +=3D phy-fsl-lynx-10g.o
> +phy-fsl-lynx-10g-drv-y                 +=3D phy-fsl-lynx-10g-clk.o
> +obj-$(CONFIG_PHY_FSL_LYNX_10G)         +=3D phy-fsl-lynx-10g-drv.o
>  obj-$(CONFIG_PHY_FSL_LYNX_28G)         +=3D phy-fsl-lynx-28g.o
> diff --git a/drivers/phy/freescale/lynx-10g.h b/drivers/phy/freescale/lyn=
x-10g.h
> new file mode 100644
> index 000000000000..75d9353a867b
> --- /dev/null
> +++ b/drivers/phy/freescale/lynx-10g.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2022 Sean Anderson <sean.anderson@seco.com>
> + */
> +
> +#ifndef LYNX_10G
> +#define LYNX_10G
> +
> +struct clk;
> +struct device;
> +struct regmap;
> +
> +int lynx_clks_init(struct device *dev, struct regmap *regmap,

Can you use auxiliary bus to register this clk controller instead and
then move the clk file to drivers/clk/?

> +                  struct clk *plls[2], struct clk *ex_dlys[2]);
> +
> +#endif /* LYNX 10G */
> diff --git a/drivers/phy/freescale/phy-fsl-lynx-10g-clk.c b/drivers/phy/f=
reescale/phy-fsl-lynx-10g-clk.c
> new file mode 100644
> index 000000000000..6ec32bdfb9dd
> --- /dev/null
> +++ b/drivers/phy/freescale/phy-fsl-lynx-10g-clk.c
> @@ -0,0 +1,503 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2022 Sean Anderson <sean.anderson@seco.com>
> + *
> + * This file contains the implementation for the PLLs found on Lynx 10G =
phys.
> + *
> + * XXX: The VCO rate of the PLLs can exceed ~4GHz, which is the maximum =
rate
> + * expressable in an unsigned long. To work around this, rates are speci=
fied in
> + * kHz. This is as if there was a division by 1000 in the PLL.
> + */
> +
> +#include <linux/clk.h>

Ideally clk.h isn't included in a clk provider. This allows us to easily
identify drivers that are both a consumer (clk.h) and a provider
(clk-provider.h). A provider/consumer is rare.

> +#include <linux/clk-provider.h>
> +#include <linux/device.h>
> +#include <linux/bitfield.h>
> +#include <linux/math64.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>
> +#include <linux/units.h>
> +#include <dt-bindings/clock/fsl,lynx-10g.h>
> +
> +#include "lynx-10g.h"
> +
> +#define PLL_STRIDE     0x20
> +#define PLLa(a, off)   ((a) * PLL_STRIDE + (off))
> +#define PLLaRSTCTL(a)  PLLa(a, 0x00)
> +#define PLLaCR0(a)     PLLa(a, 0x04)
> +
> +#define PLLaRSTCTL_RSTREQ      BIT(31)
> +#define PLLaRSTCTL_RST_DONE    BIT(30)
> +#define PLLaRSTCTL_RST_ERR     BIT(29)
> +#define PLLaRSTCTL_PLLRST_B    BIT(7)
> +#define PLLaRSTCTL_SDRST_B     BIT(6)
> +#define PLLaRSTCTL_SDEN                BIT(5)
> +
> +#define PLLaRSTCTL_ENABLE_SET  (PLLaRSTCTL_RST_DONE | PLLaRSTCTL_PLLRST_=
B | \
> +                                PLLaRSTCTL_SDRST_B | PLLaRSTCTL_SDEN)
> +#define PLLaRSTCTL_ENABLE_MASK (PLLaRSTCTL_ENABLE_SET | PLLaRSTCTL_RST_E=
RR)
> +
> +#define PLLaCR0_POFF           BIT(31)
> +#define PLLaCR0_RFCLK_SEL      GENMASK(30, 28)
> +#define PLLaCR0_PLL_LCK                BIT(23)
> +#define PLLaCR0_FRATE_SEL      GENMASK(19, 16)
> +#define PLLaCR0_DLYDIV_SEL     GENMASK(1, 0)
> +
> +#define PLLaCR0_DLYDIV_SEL_16          0b01
> +
> +/**
> + * struct lynx_clk - Driver data for the PLLs
> + * @pll: The PLL clock
> + * @ex_dly: The "PLLa_ex_dly_clk" clock
> + * @ref: Our reference clock
> + * @dev: The serdes device
> + * @regmap: Our registers
> + * @idx: Which PLL this clock is for
> + */
> +struct lynx_clk {
> +       struct clk_hw pll, ex_dly;
> +       struct clk_hw *ref;
> +       struct device *dev;
> +       struct regmap *regmap;
> +       unsigned int idx;
> +};
> +
> +static u32 lynx_read(struct lynx_clk *clk, u32 reg)
> +{
> +       unsigned int ret =3D 0;
> +
> +       WARN_ON_ONCE(regmap_read(clk->regmap, reg, &ret));
> +       return ret;
> +}
> +
> +static void lynx_write(struct lynx_clk *clk, u32 val, u32 reg)
> +{
> +       WARN_ON_ONCE(regmap_write(clk->regmap, reg, val));
> +}
> +
> +static struct lynx_clk *lynx_pll_to_clk(struct clk_hw *hw)
> +{
> +       return container_of(hw, struct lynx_clk, pll);
> +}
> +
> +static struct lynx_clk *lynx_ex_dly_to_clk(struct clk_hw *hw)
> +{
> +       return container_of(hw, struct lynx_clk, ex_dly);
> +}
> +
> +static void lynx_pll_stop(struct lynx_clk *clk)
> +{
> +       u32 rstctl;
> +
> +       rstctl =3D lynx_read(clk, PLLaRSTCTL(clk->idx));
> +       rstctl &=3D ~PLLaRSTCTL_SDRST_B;
> +       lynx_write(clk, rstctl, PLLaRSTCTL(clk->idx));
> +
> +       ndelay(50);
> +
> +       rstctl =3D lynx_read(clk, PLLaRSTCTL(clk->idx));
> +       rstctl &=3D ~(PLLaRSTCTL_SDEN | PLLaRSTCTL_PLLRST_B);
> +       lynx_write(clk, rstctl, PLLaRSTCTL(clk->idx));
> +
> +       ndelay(100);
> +}
> +
> +static void lynx_pll_disable(struct clk_hw *hw)
> +{
> +       struct lynx_clk *clk =3D lynx_pll_to_clk(hw);
> +       u32 cr0;
> +
> +       dev_dbg(clk->dev, "disable pll%d\n", clk->idx);
> +
> +       lynx_pll_stop(clk);
> +
> +       cr0 =3D lynx_read(clk, PLLaCR0(clk->idx));
> +       cr0 |=3D PLLaCR0_POFF;
> +       lynx_write(clk, cr0, PLLaCR0(clk->idx));
> +}
> +
> +static int lynx_pll_reset(struct lynx_clk *clk)
> +{
> +       int ret;
> +       u32 rstctl =3D lynx_read(clk, PLLaRSTCTL(clk->idx));
> +
> +       rstctl |=3D PLLaRSTCTL_RSTREQ;
> +       lynx_write(clk, rstctl, PLLaRSTCTL(clk->idx));
> +       ret =3D read_poll_timeout(lynx_read, rstctl,
> +                               rstctl & (PLLaRSTCTL_RST_DONE | PLLaRSTCT=
L_RST_ERR),
> +                               100, 5000, true, clk, PLLaRSTCTL(clk->idx=
));
> +       if (rstctl & PLLaRSTCTL_RST_ERR)
> +               ret =3D -EIO;
> +       if (ret) {
> +               dev_err(clk->dev, "pll%d reset failed\n", clk->idx);
> +               return ret;
> +       }
> +
> +       rstctl |=3D PLLaRSTCTL_SDEN | PLLaRSTCTL_PLLRST_B | PLLaRSTCTL_SD=
RST_B;
> +       lynx_write(clk, rstctl, PLLaRSTCTL(clk->idx));
> +       return 0;
> +}
> +
> +static int lynx_pll_prepare(struct clk_hw *hw)
> +{
> +       struct lynx_clk *clk =3D lynx_pll_to_clk(hw);
> +       u32 rstctl =3D lynx_read(clk, PLLaRSTCTL(clk->idx));
> +       u32 cr0 =3D lynx_read(clk, PLLaCR0(clk->idx));
> +
> +       /*
> +        * "Enabling" the PLL involves resetting it (and all attached lan=
es).
> +        * Avoid doing this if we are already enabled.
> +        */
> +       if (!(cr0 & PLLaCR0_POFF) &&
> +           (rstctl & PLLaRSTCTL_ENABLE_MASK) =3D=3D PLLaRSTCTL_ENABLE_SE=
T) {
> +               dev_dbg(clk->dev, "pll%d already prepared\n", clk->idx);
> +               return 0;
> +       }
> +
> +       dev_dbg(clk->dev, "prepare pll%d\n", clk->idx);
> +
> +       cr0 &=3D ~PLLaCR0_POFF;
> +       lynx_write(clk, cr0, PLLaCR0(clk->idx));
> +
> +       return lynx_pll_reset(clk);
> +}
> +
> +static int lynx_pll_is_enabled(struct clk_hw *hw)
> +{
> +       struct lynx_clk *clk =3D lynx_pll_to_clk(hw);
> +       u32 cr0 =3D lynx_read(clk, PLLaCR0(clk->idx));
> +       bool enabled =3D !(cr0 & PLLaCR0_POFF);
> +
> +       dev_dbg(clk->dev, "pll%d %s enabled\n", clk->idx,
> +               enabled ? "is" : "is not");
> +
> +       return enabled;
> +}
> +
> +static const u32 rfclk_sel_map[8] =3D {
> +       [0b000] =3D 100000000,
> +       [0b001] =3D 125000000,
> +       [0b010] =3D 156250000,
> +       [0b011] =3D 150000000,
> +};
> +
> +/**
> + * lynx_rfclk_to_sel() - Convert a reference clock rate to a selector
> + * @rate: The reference clock rate
> + *
> + * To allow for some variation in the reference clock rate, up to 100ppm=
 of
> + * error is allowed.
> + *
> + * Return: An appropriate selector for @rate, or -%EINVAL.
> + */
> +static int lynx_rfclk_to_sel(u32 rate)

Should rate be unsigned long? Or you really want 32-bits here?

> +{
> +       int ret;
> +
> +       for (ret =3D 0; ret < ARRAY_SIZE(rfclk_sel_map); ret++) {
> +               u32 rfclk_rate =3D rfclk_sel_map[ret];
> +               /* Allow an error of 100ppm */
> +               u32 error =3D rfclk_rate / 10000;
> +
> +               if (rate > rfclk_rate - error && rate < rfclk_rate + erro=
r)

Does

	if (abs(rate - rfclk_rate) < error)

work? I'm kinda surprised that we don't have a within_tolerance(x,
margin) macro in math.h that would make it look like:

	if (within_tolerance(rate - rfclk_rate, error))


> +                       return ret;
> +       }
> +
> +       return -EINVAL;
> +}
> +
> +static const u32 frate_sel_map[16] =3D {
> +       [0b0000] =3D 5000000,
> +       [0b0101] =3D 3750000,
> +       [0b0110] =3D 5156250,
> +       [0b0111] =3D 4000000,
> +       [0b1001] =3D 3125000,
> +       [0b1010] =3D 3000000,
> +};
> +
> +/**
> + * lynx_frate_to_sel() - Convert a VCO clock rate to a selector
> + * @rate_khz: The VCO frequency, in kHz
> + *
> + * Return: An appropriate selector for @rate_khz, or -%EINVAL.
> + */
> +static int lynx_frate_to_sel(u32 rate_khz)
> +{
> +       int ret;
> +
> +       for (ret =3D 0; ret < ARRAY_SIZE(frate_sel_map); ret++)
> +               if (frate_sel_map[ret] =3D=3D rate_khz)
> +                       return ret;
> +
> +       return -EINVAL;
> +}
> +
> +static u32 lynx_pll_ratio(u32 frate_sel, u32 rfclk_sel)
> +{
> +       u64 frate;
> +       u32 rfclk, error, ratio;
> +
> +       frate =3D frate_sel_map[frate_sel] * (u64)HZ_PER_KHZ;
> +       rfclk =3D rfclk_sel_map[rfclk_sel];
> +
> +       if (!frate || !rfclk)
> +               return 0;
> +
> +       ratio =3D div_u64_rem(frate, rfclk, &error);
> +       if (!error)
> +               return ratio;
> +       return 0;
> +}
> +
> +static unsigned long lynx_pll_recalc_rate(struct clk_hw *hw,
> +                                         unsigned long parent_rate)
> +{
> +       struct lynx_clk *clk =3D lynx_pll_to_clk(hw);
> +       u32 cr0 =3D lynx_read(clk, PLLaCR0(clk->idx));
> +       u32 frate_sel =3D FIELD_GET(PLLaCR0_FRATE_SEL, cr0);
> +       u32 rfclk_sel =3D FIELD_GET(PLLaCR0_RFCLK_SEL, cr0);
> +       u32 ratio =3D lynx_pll_ratio(frate_sel, rfclk_sel);
> +       unsigned long ret;
> +
> +       /* Ensure that the parent matches our rfclk selector */
> +       if (rfclk_sel =3D=3D lynx_rfclk_to_sel(parent_rate))
> +               ret =3D mult_frac(parent_rate, ratio, HZ_PER_KHZ);
> +       else
> +               ret =3D 0;
> +
> +       dev_dbg(clk->dev, "recalc pll%d new=3D%llu parent=3D%lu\n", clk->=
idx,
> +               (u64)ret * HZ_PER_KHZ, parent_rate);
> +       return ret;
> +}
> +
> +static long lynx_pll_round_rate(struct clk_hw *hw, unsigned long rate_kh=
z,
> +                               unsigned long *parent_rate)
> +{
> +       int frate_sel, rfclk_sel;
> +       struct lynx_clk *clk =3D lynx_pll_to_clk(hw);
> +       u32 ratio;
> +
> +       dev_dbg(clk->dev, "round pll%d new=3D%llu parent=3D%lu\n", clk->i=
dx,
> +               (u64)rate_khz * HZ_PER_KHZ, *parent_rate);
> +
> +       frate_sel =3D lynx_frate_to_sel(rate_khz);
> +       if (frate_sel < 0)
> +               return frate_sel;
> +
> +       /* Try the current parent rate */
> +       rfclk_sel =3D lynx_rfclk_to_sel(*parent_rate);
> +       if (rfclk_sel >=3D 0) {
> +               ratio =3D lynx_pll_ratio(frate_sel, rfclk_sel);
> +               if (ratio)
> +                       return mult_frac(*parent_rate, ratio, HZ_PER_KHZ);
> +       }
> +
> +       /* Try all possible parent rates */
> +       for (rfclk_sel =3D 0;
> +            rfclk_sel < ARRAY_SIZE(rfclk_sel_map);
> +            rfclk_sel++) {
> +               unsigned long new_parent_rate;
> +
> +               ratio =3D lynx_pll_ratio(frate_sel, rfclk_sel);
> +               if (!ratio)
> +                       continue;
> +
> +               /* Ensure the reference clock can produce this rate */
> +               new_parent_rate =3D rfclk_sel_map[rfclk_sel];
> +               new_parent_rate =3D clk_hw_round_rate(clk->ref, new_paren=
t_rate);
> +               if (rfclk_sel !=3D lynx_rfclk_to_sel(new_parent_rate))
> +                       continue;
> +
> +               *parent_rate =3D new_parent_rate;
> +               return mult_frac(new_parent_rate, ratio, HZ_PER_KHZ);
> +       }
> +
> +       return -EINVAL;
> +}
> +
> +static int lynx_pll_set_rate(struct clk_hw *hw, unsigned long rate_khz,
> +                          unsigned long parent_rate)
> +{
> +       int frate_sel, rfclk_sel;
> +       struct lynx_clk *clk =3D lynx_pll_to_clk(hw);
> +       u32 ratio, cr0 =3D lynx_read(clk, PLLaCR0(clk->idx));
> +
> +       dev_dbg(clk->dev, "set rate pll%d new=3D%llu parent=3D%lu\n", clk=
->idx,
> +               (u64)rate_khz * HZ_PER_KHZ, parent_rate);
> +
> +       frate_sel =3D lynx_frate_to_sel(rate_khz);
> +       if (frate_sel < 0)
> +               return frate_sel;
> +
> +       rfclk_sel =3D lynx_rfclk_to_sel(parent_rate);
> +       if (rfclk_sel < 0)
> +               return rfclk_sel;
> +
> +       ratio =3D lynx_pll_ratio(frate_sel, rfclk_sel);
> +       if (!ratio)
> +               return -EINVAL;
> +
> +       lynx_pll_stop(clk);
> +       cr0 &=3D ~(PLLaCR0_RFCLK_SEL | PLLaCR0_FRATE_SEL);
> +       cr0 |=3D FIELD_PREP(PLLaCR0_RFCLK_SEL, rfclk_sel);
> +       cr0 |=3D FIELD_PREP(PLLaCR0_FRATE_SEL, frate_sel);
> +       lynx_write(clk, cr0, PLLaCR0(clk->idx));
> +       /* Don't bother resetting if it's off */
> +       if (cr0 & PLLaCR0_POFF)
> +               return 0;
> +       return lynx_pll_reset(clk);
> +}
> +
> +static const struct clk_ops lynx_pll_clk_ops =3D {
> +       .prepare =3D lynx_pll_prepare,
> +       .disable =3D lynx_pll_disable,
> +       .is_enabled =3D lynx_pll_is_enabled,
> +       .recalc_rate =3D lynx_pll_recalc_rate,
> +       .round_rate =3D lynx_pll_round_rate,
> +       .set_rate =3D lynx_pll_set_rate,
> +};
> +
> +static void lynx_ex_dly_disable(struct clk_hw *hw)
> +{
> +       struct lynx_clk *clk =3D lynx_ex_dly_to_clk(hw);
> +       u32 cr0 =3D lynx_read(clk, PLLaCR0(clk->idx));
> +
> +       cr0 &=3D ~PLLaCR0_DLYDIV_SEL;
> +       lynx_write(clk, PLLaCR0(clk->idx), cr0);
> +}
> +
> +static int lynx_ex_dly_enable(struct clk_hw *hw)
> +{
> +       struct lynx_clk *clk =3D lynx_ex_dly_to_clk(hw);
> +       u32 cr0 =3D lynx_read(clk, PLLaCR0(clk->idx));
> +
> +       cr0 &=3D ~PLLaCR0_DLYDIV_SEL;
> +       cr0 |=3D FIELD_PREP(PLLaCR0_DLYDIV_SEL, PLLaCR0_DLYDIV_SEL_16);
> +       lynx_write(clk, PLLaCR0(clk->idx), cr0);
> +       return 0;
> +}
> +
> +static int lynx_ex_dly_is_enabled(struct clk_hw *hw)
> +{
> +       struct lynx_clk *clk =3D lynx_ex_dly_to_clk(hw);
> +
> +       return lynx_read(clk, PLLaCR0(clk->idx)) & PLLaCR0_DLYDIV_SEL;
> +}
> +
> +static unsigned long lynx_ex_dly_recalc_rate(struct clk_hw *hw,
> +                                            unsigned long parent_rate)
> +{
> +       return parent_rate / 16;
> +}
> +
> +static const struct clk_ops lynx_ex_dly_clk_ops =3D {
> +       .enable =3D lynx_ex_dly_enable,
> +       .disable =3D lynx_ex_dly_disable,
> +       .is_enabled =3D lynx_ex_dly_is_enabled,
> +       .recalc_rate =3D lynx_ex_dly_recalc_rate,
> +};
> +
> +static int lynx_clk_init(struct clk_hw_onecell_data *hw_data,
> +                        struct device *dev, struct regmap *regmap,
> +                        unsigned int index)
> +{
> +       const struct clk_hw *pll_parents, *ex_dly_parents;
> +       struct clk_init_data pll_init =3D {
> +               .ops =3D &lynx_pll_clk_ops,
> +               .parent_hws =3D &pll_parents,
> +               .num_parents =3D 1,
> +               .flags =3D CLK_GET_RATE_NOCACHE | CLK_SET_RATE_PARENT |
> +                        CLK_OPS_PARENT_ENABLE,
> +       };
> +       struct clk_init_data ex_dly_init =3D {
> +               .ops =3D &lynx_ex_dly_clk_ops,
> +               .parent_hws =3D &ex_dly_parents,
> +               .num_parents =3D 1,
> +       };
> +       struct clk *ref;
> +       struct lynx_clk *clk;
> +       char *ref_name;
> +       int ret;
> +
> +       clk =3D devm_kzalloc(dev, sizeof(*clk), GFP_KERNEL);
> +       if (!clk)
> +               return -ENOMEM;
> +
> +       clk->dev =3D dev;
> +       clk->regmap =3D regmap;
> +       clk->idx =3D index;
> +
> +       ref_name =3D kasprintf(GFP_KERNEL, "ref%d", index);
> +       pll_init.name =3D kasprintf(GFP_KERNEL, "%s.pll%d_khz", dev_name(=
dev),
> +                                 index);
> +       ex_dly_init.name =3D kasprintf(GFP_KERNEL, "%s.pll%d_ex_dly_khz",
> +                                    dev_name(dev), index);
> +       if (!ref_name || !pll_init.name || !ex_dly_init.name) {
> +               ret =3D -ENOMEM;
> +               goto out;
> +       }
> +
> +       ref =3D devm_clk_get(dev, ref_name);
> +       if (IS_ERR(clk->ref)) {
> +               ret =3D PTR_ERR(clk->ref);
> +               dev_err_probe(dev, ret, "could not get %s\n", ref_name);
> +               goto out;
> +       }
> +
> +       clk->ref =3D __clk_get_hw(ref);

Please don't use __clk_get_hw() for this. Instead use struct
clk_parent_data and set a DT index in the index member to map to this
clk.

> +       pll_parents =3D clk->ref;
> +       clk->pll.init =3D &pll_init;
> +       ret =3D devm_clk_hw_register(dev, &clk->pll);
> +       if (ret) {
> +               dev_err_probe(dev, ret, "could not register %s\n",
> +                             pll_init.name);
> +               goto out;
> +       }
> +
> +       ex_dly_parents =3D &clk->pll;
> +       clk->ex_dly.init =3D &ex_dly_init;
> +       ret =3D devm_clk_hw_register(dev, &clk->ex_dly);
> +       if (ret)
> +               dev_err_probe(dev, ret, "could not register %s\n",
> +                             ex_dly_init.name);
> +
> +       hw_data->hws[LYNX10G_PLLa(index)] =3D &clk->pll;
> +       hw_data->hws[LYNX10G_PLLa_EX_DLY(index)] =3D &clk->ex_dly;
> +
> +out:
> +       kfree(ref_name);
> +       kfree(pll_init.name);
> +       kfree(ex_dly_init.name);
> +       return ret;
> +}
> +
> +#define NUM_PLLS 2
> +#define NUM_CLKS (NUM_PLLS * LYNX10G_CLKS_PER_PLL)
> +
> +int lynx_clks_init(struct device *dev, struct regmap *regmap,
> +                  struct clk *plls[2], struct clk *ex_dlys[2])
> +{
> +       int ret, i;
> +       struct clk_hw_onecell_data *hw_data;
> +
> +       hw_data =3D devm_kzalloc(dev, struct_size(hw_data, hws, NUM_CLKS),
> +                              GFP_KERNEL);
> +       if (!hw_data)
> +               return -ENOMEM;
> +       hw_data->num =3D NUM_CLKS;
> +
> +       for (i =3D 0; i < NUM_PLLS; i++) {
> +               ret =3D lynx_clk_init(hw_data, dev, regmap, i);
> +               if (ret)
> +                       return ret;
> +
> +               plls[i] =3D hw_data->hws[LYNX10G_PLLa(i)]->clk;
> +               ex_dlys[i] =3D hw_data->hws[LYNX10G_PLLa_EX_DLY(i)]->clk;

Use clk_hw_get_clk() please.

> +       }
> +
> +       ret =3D devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, h=
w_data);
> +       if (ret)
> +               dev_err_probe(dev, ret, "could not register clock provide=
r\n");
> +
> +       return ret;
> +}
