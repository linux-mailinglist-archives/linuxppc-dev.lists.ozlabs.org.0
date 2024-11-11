Return-Path: <linuxppc-dev+bounces-3093-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDA39C4282
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Nov 2024 17:21:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XnFCq6rrCz2yD6;
	Tue, 12 Nov 2024 03:21:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731342071;
	cv=none; b=eqYGVKa/8hk11e/v2xcJo9BaZ2IWochnWFRG6Ee5AF3TFFK211NQHCDfz7BpVOcZuZQSjHRzW3WbSGPgB7m62cE4fyXUjsmBs41CRiGH7x09wdKpfizE3LYTgUP8AE+LDi4wd5qZwM2fPmh2NmvAsBHOM44eNqh10PhpuOMcoGFe8f487MX+lDqTB4ir8LS28KC5k40/t4aPVmMMLGFlBRnUQZazsTqKTcOHbHuafKxOQuwrC9VW/DpUan3530Mo7bF0LywGv6GxZTj4HfB/btat+d3ugxFgabWe7P5VdWt6eLWT0JLzWGRZCrkfsSX7rUd5Xo2Dz5i0Me6g92B47g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731342071; c=relaxed/relaxed;
	bh=gw53oWEi9nvsXEro79kN+57LAYK+q6czmjjY24kbJcw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ObHrJail2gAfyJWWWsya7rn1L4N5MJ4/uZS/QaN9NHygw81pyQIJBbf0vf/5t1qV1m9a0e6o3eEbzTbkrgrviQoLI7bf9r6C1O+5O4Xre6FuNC/+qCZyCumz5g9a0h7VTga/QIybS0Iu9E0w+ETxyeHwK8/Ys09uxK9O0x32jR7aBAHIQ2KRESItynW/1CCHf8QdfNM37SU4WxH2f7uN+DJMzSg7ujukn3U+0KgYlcLAQ+4xfsTM4EdHR2MuDBgV40suMzhLtRT+DRu7ZQn+aOkV/rwUbiMFj0/LZZbwc2oSs112GW6ofrnNJU6m0LdEZgDKvBEu2pVGExNb+Qp1ZA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hPH7cBOp; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hPH7cBOp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XnFCl10Y3z2xlF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2024 03:21:07 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6BB98A411BD
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Nov 2024 16:19:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BB92C4CECF
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Nov 2024 16:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731342062;
	bh=GfqOZHoPyLMOe3TrvjRQ3VBO9c4vBbSeNCUI7N4diTo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hPH7cBOpV/0WSzgdkLacMc9djqKB799vXFOejt+DVzx4KyX0VGM8WDsX5Vz9xBG2I
	 nqKki6CBmvBY7hxgqyW5ByFY0/CxRg9Usyhd+730U4gUtbdCalPKuJX/DyIdiGA37f
	 plWo84v7RYNXS5ihGc7+zqQfai5laAsCzxngyZnU4lkFadbCyLnOTeRAOKBzrVm3FM
	 taVFt5DEMApruTmKPSaH+G3dIUOT1qdk+jeUBv5WD9jdxBsgVVo7ZaA4uHjJ8EaJF0
	 GyKlMuTYJ/sFPIe3wCIyuB/xSXjPobMjKiJ4V2UONynvsoHTvnaceNDZta7KRYS4nM
	 OPcJRHFMMasGw==
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6e34339d41bso39958677b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Nov 2024 08:21:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUxaCC36Zx/o7lMYP00nWhmrcUDLHON68Tm7Fz0xqIxN+e9oLiFieE5BOk/qM57UiCSgE5GUYhjN6pwfBY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx3QnaiBIPaXZByocPIUFes2U3U25RU3oGW/Xq97goi6fePBI/e
	KmoocNle/6HuuQVYPWgJkF0zNSHTPeev+aQj9uJ6I5u1M9BZUXljv4NEuFhzFVwZEDMTmGtZNZo
	xSU5Y8/ZpJqg7Rh27RQiNQbAsNg==
X-Google-Smtp-Source: AGHT+IFkAuK1RKHBxdF4ybGePBRZX8TGIGcGLxePtSshvEbTc34Fms21ng8jvbLerdOHzgIff9cxTqOeul3GUAOFeRE=
X-Received: by 2002:a05:690c:7441:b0:6e2:aceb:fb34 with SMTP id
 00721157ae682-6eaddd72ec1mr118266547b3.1.1731342061623; Mon, 11 Nov 2024
 08:21:01 -0800 (PST)
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
References: <20241109233821.8619-1-rosenp@gmail.com>
In-Reply-To: <20241109233821.8619-1-rosenp@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 11 Nov 2024 10:20:50 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJeYS12OCVeMHze01631NOtj=uaLcEZRiWKPRZLQpSkUA@mail.gmail.com>
Message-ID: <CAL_JsqJeYS12OCVeMHze01631NOtj=uaLcEZRiWKPRZLQpSkUA@mail.gmail.com>
Subject: Re: [PATCH net-next] net: use pdev instead of OF funcs
To: Rosen Penev <rosenp@gmail.com>
Cc: netdev@vger.kernel.org, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Vladimir Oltean <olteanv@gmail.com>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Pantelis Antoniou <pantelis.antoniou@gmail.com>, 
	Marcin Wojtas <marcin.s.wojtas@gmail.com>, Byungho An <bh74.an@samsung.com>, 
	Kevin Brace <kevinbrace@bracecomputerlab.com>, Francois Romieu <romieu@fr.zoreil.com>, 
	Michal Simek <michal.simek@amd.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Zhao Qiang <qiang.zhao@nxp.com>, 
	"open list:CAN NETWORK DRIVERS" <linux-can@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, 
	"open list:FREESCALE SOC FS_ENET DRIVER" <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sat, Nov 9, 2024 at 5:40=E2=80=AFPM Rosen Penev <rosenp@gmail.com> wrote=
:
>
> np here is ofdev->dev.of_node. Better to use the proper functions as
> there's no use of children or anything else.

Your commit message needs some work.

> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/net/can/grcan.c                       |  2 +-
>  drivers/net/can/mscan/mpc5xxx_can.c           |  2 +-
>  drivers/net/dsa/bcm_sf2.c                     |  4 ++--
>  drivers/net/ethernet/allwinner/sun4i-emac.c   |  2 +-
>  drivers/net/ethernet/freescale/fec_mpc52xx.c  | 23 ++++++++++---------
>  .../net/ethernet/freescale/fec_mpc52xx_phy.c  | 12 ++++++----
>  .../net/ethernet/freescale/fs_enet/mac-fcc.c  |  2 +-
>  .../net/ethernet/freescale/fs_enet/mac-fec.c  |  2 +-
>  .../net/ethernet/freescale/fs_enet/mac-scc.c  |  2 +-
>  .../net/ethernet/freescale/fs_enet/mii-fec.c  | 12 ++++++----
>  drivers/net/ethernet/freescale/ucc_geth.c     | 12 +++++-----
>  drivers/net/ethernet/marvell/mvneta.c         |  2 +-
>  drivers/net/ethernet/moxa/moxart_ether.c      |  4 ++--
>  .../ethernet/samsung/sxgbe/sxgbe_platform.c   |  8 +++----
>  drivers/net/ethernet/via/via-rhine.c          |  2 +-
>  drivers/net/ethernet/via/via-velocity.c       |  2 +-
>  drivers/net/ethernet/xilinx/ll_temac_mdio.c   |  6 ++---
>  drivers/net/mdio/mdio-mux-mmioreg.c           | 16 +++++++------
>  drivers/net/wan/fsl_ucc_hdlc.c                | 10 ++++----
>  19 files changed, 66 insertions(+), 59 deletions(-)
>
> diff --git a/drivers/net/can/grcan.c b/drivers/net/can/grcan.c
> index cdf0ec9fa7f3..0a2cc0ba219f 100644
> --- a/drivers/net/can/grcan.c
> +++ b/drivers/net/can/grcan.c
> @@ -1673,7 +1673,7 @@ static int grcan_probe(struct platform_device *ofde=
v)
>                 goto exit_error;
>         }
>
> -       irq =3D irq_of_parse_and_map(np, GRCAN_IRQIX_IRQ);
> +       irq =3D platform_get_irq(ofdev, GRCAN_IRQIX_IRQ);
>         if (!irq) {
>                 dev_err(&ofdev->dev, "no irq found\n");
>                 err =3D -ENODEV;
> diff --git a/drivers/net/can/mscan/mpc5xxx_can.c b/drivers/net/can/mscan/=
mpc5xxx_can.c
> index 0080c39ee182..252ad40bdb97 100644
> --- a/drivers/net/can/mscan/mpc5xxx_can.c
> +++ b/drivers/net/can/mscan/mpc5xxx_can.c
> @@ -300,7 +300,7 @@ static int mpc5xxx_can_probe(struct platform_device *=
ofdev)
>         if (!base)
>                 return dev_err_probe(&ofdev->dev, err, "couldn't ioremap\=
n");
>
> -       irq =3D irq_of_parse_and_map(np, 0);
> +       irq =3D platform_get_irq(ofdev, 0);
>         if (!irq) {
>                 dev_err(&ofdev->dev, "no irq found\n");
>                 err =3D -ENODEV;
> diff --git a/drivers/net/dsa/bcm_sf2.c b/drivers/net/dsa/bcm_sf2.c
> index 43bde1f583ff..9229582efd05 100644
> --- a/drivers/net/dsa/bcm_sf2.c
> +++ b/drivers/net/dsa/bcm_sf2.c
> @@ -1443,8 +1443,8 @@ static int bcm_sf2_sw_probe(struct platform_device =
*pdev)
>                 of_node_put(ports);
>         }
>
> -       priv->irq0 =3D irq_of_parse_and_map(dn, 0);
> -       priv->irq1 =3D irq_of_parse_and_map(dn, 1);
> +       priv->irq0 =3D platform_get_irq(pdev, 0);
> +       priv->irq1 =3D platform_get_irq(pdev, 1);
>
>         base =3D &priv->core;
>         for (i =3D 0; i < BCM_SF2_REGS_NUM; i++) {
> diff --git a/drivers/net/ethernet/allwinner/sun4i-emac.c b/drivers/net/et=
hernet/allwinner/sun4i-emac.c
> index 2f516b950f4e..18df8d1d93fd 100644
> --- a/drivers/net/ethernet/allwinner/sun4i-emac.c
> +++ b/drivers/net/ethernet/allwinner/sun4i-emac.c
> @@ -995,7 +995,7 @@ static int emac_probe(struct platform_device *pdev)
>
>         /* fill in parameters for net-dev structure */
>         ndev->base_addr =3D (unsigned long)db->membase;
> -       ndev->irq =3D irq_of_parse_and_map(np, 0);
> +       ndev->irq =3D platform_get_irq(pdev, 0);
>         if (ndev->irq =3D=3D -ENXIO) {
>                 netdev_err(ndev, "No irq resource\n");
>                 ret =3D ndev->irq;
> diff --git a/drivers/net/ethernet/freescale/fec_mpc52xx.c b/drivers/net/e=
thernet/freescale/fec_mpc52xx.c
> index 2bfaf14f65c8..553d33a98c99 100644
> --- a/drivers/net/ethernet/freescale/fec_mpc52xx.c
> +++ b/drivers/net/ethernet/freescale/fec_mpc52xx.c
> @@ -811,7 +811,7 @@ static int mpc52xx_fec_probe(struct platform_device *=
op)
>         int rv;
>         struct net_device *ndev;
>         struct mpc52xx_fec_priv *priv =3D NULL;
> -       struct resource mem;
> +       struct resource *mem;
>         const u32 *prop;
>         int prop_size;
>         struct device_node *np =3D op->dev.of_node;
> @@ -828,20 +828,21 @@ static int mpc52xx_fec_probe(struct platform_device=
 *op)
>         priv->ndev =3D ndev;
>
>         /* Reserve FEC control zone */
> -       rv =3D of_address_to_resource(np, 0, &mem);
> -       if (rv) {
> +       mem =3D platform_get_resource(op, 0, IORESOURCE_MEM);
> +       if (!mem) {
>                 pr_err("Error while parsing device node resource\n");
> +               rv =3D -ENODEV;
>                 goto err_netdev;
>         }
> -       if (resource_size(&mem) < sizeof(struct mpc52xx_fec)) {
> +       if (resource_size(mem) < sizeof(struct mpc52xx_fec)) {
>                 pr_err("invalid resource size (%lx < %x), check mpc52xx_d=
evices.c\n",
> -                      (unsigned long)resource_size(&mem),
> +                      (unsigned long)resource_size(mem),
>                        sizeof(struct mpc52xx_fec));
>                 rv =3D -EINVAL;
>                 goto err_netdev;
>         }
>
> -       if (!request_mem_region(mem.start, sizeof(struct mpc52xx_fec),
> +       if (!request_mem_region(mem->start, sizeof(struct mpc52xx_fec),
>                                 DRIVER_NAME)) {
>                 rv =3D -EBUSY;
>                 goto err_netdev;
> @@ -851,13 +852,13 @@ static int mpc52xx_fec_probe(struct platform_device=
 *op)
>         ndev->netdev_ops        =3D &mpc52xx_fec_netdev_ops;
>         ndev->ethtool_ops       =3D &mpc52xx_fec_ethtool_ops;
>         ndev->watchdog_timeo    =3D FEC_WATCHDOG_TIMEOUT;
> -       ndev->base_addr         =3D mem.start;
> +       ndev->base_addr         =3D mem->start;
>         SET_NETDEV_DEV(ndev, &op->dev);
>
>         spin_lock_init(&priv->lock);
>
>         /* ioremap the zones */
> -       priv->fec =3D ioremap(mem.start, sizeof(struct mpc52xx_fec));
> +       priv->fec =3D ioremap(mem->start, sizeof(struct mpc52xx_fec));

Generally, devm_platform_ioremap_resource(),
devm_platform_get_and_ioremap_resource(), etc. are preferred. So if
we're going to rework things, rework them to use those.

Rob

