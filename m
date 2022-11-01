Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 967936152BD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Nov 2022 21:08:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N21LW30xMz3dsG
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Nov 2022 07:08:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qTcA2zv/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=sboyd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qTcA2zv/;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N21KZ07XJz30Ky
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Nov 2022 07:08:01 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E4DF061717;
	Tue,  1 Nov 2022 20:07:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4626BC433D6;
	Tue,  1 Nov 2022 20:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667333277;
	bh=jODf5oFatJsSUGvBhFgHv+L4Zcs7WamIZXIwk1cHpiU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=qTcA2zv/0L05XIHYuTr5gtLYwxFQsklUGfH2Gg01dV/ozsG2KKcLK+qPH6wbc+NTa
	 bynztw7vQ+VR/fuKNG4n/KDENs9Ii5fmcR/PpMxj7sLWx+GanvT6EjvPn/xV0nMZb6
	 zyI7FZgrqOiCNgARZXAiziXvdjdLdGcE69vx5JQtuKlbQ2BVVLsCctXVhGI9clC4te
	 LDH+GwpSuy5x8asupkiCldikQym1GuM6B0SI3q4sLyzEds8CFzkUF7HrBjgia3T6gw
	 DV7rIH3wJR4Za0BNYTCRz8P4FCrgVrufoOQwn6c1TOPYPmXxL7t1rtGvC2lEh+BZRp
	 aeGcigCjSCHaA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <5f00ede6-10f5-c11c-ee21-54460c1f98b0@seco.com>
References: <20221027191113.403712-1-sean.anderson@seco.com> <20221027191113.403712-5-sean.anderson@seco.com> <20221027230331.19C2FC433D6@smtp.kernel.org> <5f00ede6-10f5-c11c-ee21-54460c1f98b0@seco.com>
Subject: Re: [PATCH v8 4/9] phy: fsl: Add Lynx 10G SerDes driver
From: Stephen Boyd <sboyd@kernel.org>
To: Kishon Vijay Abraham I <kishon@ti.com>, Sean Anderson <sean.anderson@seco.com>, Vinod Koul <vkoul@kernel.org>, linux-phy@lists.infradead.org
Date: Tue, 01 Nov 2022 13:07:55 -0700
User-Agent: alot/0.10
Message-Id: <20221101200757.4626BC433D6@smtp.kernel.org>
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
Cc: devicetree@vger.kernel.org, Bagas Sanjaya <bagasdotme@gmail.com>, Madalin Bucur <madalin.bucur@nxp.com>, Michael Turquette <mturquette@baylibre.com>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Quoting Sean Anderson (2022-10-28 09:13:57)
> On 10/27/22 19:03, Stephen Boyd wrote:
> > Quoting Sean Anderson (2022-10-27 12:11:08)
> >> diff --git a/drivers/phy/freescale/Kconfig b/drivers/phy/freescale/Kco=
nfig
> >> index 853958fb2c06..a6ccccf9e39b 100644
> >> --- a/drivers/phy/freescale/Kconfig
> >> +++ b/drivers/phy/freescale/Kconfig
> >> @@ -47,3 +47,25 @@ config PHY_FSL_LYNX_28G
> >>            found on NXP's Layerscape platforms such as LX2160A.
> >>            Used to change the protocol running on SerDes lanes at runt=
ime.
> >>            Only useful for a restricted set of Ethernet protocols.
> >> +
> >> +config PHY_FSL_LYNX_10G
> >> +       tristate "Freescale QorIQ Lynx 10G SerDes support"
> >> +       depends on COMMON_CLK
> >=20
> > Does something not compile if COMMON_CLK is disabled?
>=20
> ld: drivers/phy/freescale/phy-fsl-lynx-10g-clk.o: in function `lynx_pll_r=
ound_rate':
> phy-fsl-lynx-10g-clk.c:(.text+0x444): undefined reference to `clk_hw_roun=
d_rate'
> ld: drivers/phy/freescale/phy-fsl-lynx-10g-clk.o: in function `lynx_clks_=
init':
> phy-fsl-lynx-10g-clk.c:(.text+0x5eb): undefined reference to `devm_clk_hw=
_register'
> ld: phy-fsl-lynx-10g-clk.c:(.text+0x625): undefined reference to `devm_cl=
k_hw_register'

Cool thanks!

>=20
> >> diff --git a/drivers/phy/freescale/lynx-10g.h b/drivers/phy/freescale/=
lynx-10g.h
> >> new file mode 100644
> >> index 000000000000..75d9353a867b
> >> --- /dev/null
> >> +++ b/drivers/phy/freescale/lynx-10g.h
> >> @@ -0,0 +1,16 @@
> >> +/* SPDX-License-Identifier: GPL-2.0 */
> >> +/*
> >> + * Copyright (C) 2022 Sean Anderson <sean.anderson@seco.com>
> >> + */
> >> +
> >> +#ifndef LYNX_10G
> >> +#define LYNX_10G
> >> +
> >> +struct clk;
> >> +struct device;
> >> +struct regmap;
> >> +
> >> +int lynx_clks_init(struct device *dev, struct regmap *regmap,
> >=20
> > Can you use auxiliary bus to register this clk controller instead and
> > then move the clk file to drivers/clk/?
>=20
> I don't want to have to deal with my clock driver getting unbound (aka
> the user has come and decided to make my life harder). Dynamic binding
> will only add complexity in this situation.

We have 'suppress_bind_attrs' for that. What dynamic binding are you
thinking about?

>=20
> I don't know how much context you've picked up, but this driver
>=20
> - Has one consumer, and is is the serdes.
> - Is not accessible from outside the serdes.
> - Does not share any code with other drivers.
> - Has bits in its registers which can control the reset process of lanes
>    using the PLLs.
>=20
> These drivers are tightly coupled to each other. It is very likely IMO
> that changes to one (bugs, features, etc) will affect the other. For
> this reason, I think it makes sense to keep them in the same source
> directory. I actually would have preferred to keep them in the same
> file.
>=20

Using the auxiliary bus is about getting better code review on the
subsystem specific parts of a device. I'm not going to be paying a lot
of attention to the clk parts of this driver if it is outside
drivers/clk. Making this change helps with better code review.

The Kconfig symbol could be the same for the clk part and the phy part,
and this is already split to a different file. It seems that your
argument for keeping the clk file in the phy directory is because
they're part of the same phy device. Do you expect to get clk driver
review on the clk parts with the clk implementation in a different
directory?

> >> +       for (i =3D 0; i < NUM_PLLS; i++) {
> >> +               ret =3D lynx_clk_init(hw_data, dev, regmap, i);
> >> +               if (ret)
> >> +                       return ret;
> >> +
> >> +               plls[i] =3D hw_data->hws[LYNX10G_PLLa(i)]->clk;
> >> +               ex_dlys[i] =3D hw_data->hws[LYNX10G_PLLa_EX_DLY(i)]->c=
lk;
> >=20
> > Use clk_hw_get_clk() please.
>=20
> I don't want to do that, because then I'd have to generate the clock ID
> again. And why do we even need a new clock consumer in the first place?
> This is only for internal use by the driver; the consumer is the same as
> the producer.
>=20

We want to get rid of the clk pointer stashed in clk_hw. Using
clk_hw_get_clk() lets us easily change that and not need to change this
driver. I don't quite understand why you need to generate a clock ID.
Are you concerned about passing in the 'con_id' argument? That string
can be anything.
