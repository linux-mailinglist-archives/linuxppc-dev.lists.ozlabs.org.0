Return-Path: <linuxppc-dev+bounces-3094-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 481CF9C44B9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Nov 2024 19:15:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XnHlh743Hz2yD4;
	Tue, 12 Nov 2024 05:15:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::112e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731348928;
	cv=none; b=GHLAb4LC/H9UnuGLjSTQoCicgryGpTAli1HgrosDmcckQhr+PzEcNIe18acoHUh4K6qfBZwh4hng0UkQVSBA+GInjGv4EWTkcTulnPpe+8ghHuAehNXhPe0hjrS78EN0l0H0vaqKZhxYz9FzAxo86lt0IOE4ASW4KXONrcNw+pmW1oGxfkqo0uZTNsTDmHTZypP50WIswd4TlSzLiML+sItbLWKhp+B/LlD73cWbvzh2SmtTa1dzZQmi7x0QY8RdYvu/Zm3WXqtGJY0qb/Ilg5k30N0ogWYhAThR4gYPVRGzunt8WjcLOzEkjwcc1RMjKZ9Nc3EOcWNIMcsbdHsiXA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731348928; c=relaxed/relaxed;
	bh=HpZAS2bWwt2zOBZ8cYigNTZ+YnuSyLmLc70gMu7hl/I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=InClA4AEYf3xfS7mTJtZdtxP9NMT+jD9ccVeM5o2FXG+1wIwe8emjnPOZuMxydE/3vGAdbxBtdTuwwT4X2OEmlGXbZDdbEpRKzdmPCVGVsbDhzvFurGTOBJu8HopMQxCZjinRa5TeYL/aseUO51vTWT+5QOsUsXQ2ZGpL78CrHRvCNW4uRhiWJalUbkoLsEs+PSlB9hn4xFXHtLbxxgfkezZLZ3QNAiCJD4TVdd9WJ3PJjUBKWt5/inBNEJuLT28c0Rcc8awOlQYebFSlL7UuVPlNmQ0EtimbXngUAJdu3T7Yn84M1huXLV2sdOqbXMpXbTEEwCQOgkqPJIWV2A0CA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ilCMA+05; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::112e; helo=mail-yw1-x112e.google.com; envelope-from=rosenp@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ilCMA+05;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::112e; helo=mail-yw1-x112e.google.com; envelope-from=rosenp@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XnHld3GJYz2y1W
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2024 05:15:23 +1100 (AEDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-6eb0c2dda3cso12089657b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Nov 2024 10:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731348920; x=1731953720; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HpZAS2bWwt2zOBZ8cYigNTZ+YnuSyLmLc70gMu7hl/I=;
        b=ilCMA+05HO9YXZCDEftgRyozj5HRWaJPvDNOcVYVly4kNXnnKpmKtLaQ+VQXJvw6Bg
         pRFyc8RHEbdn5tdEq/hN1DiiUKHXW95vAhDvCL0fUfCaZw44UlqCSIOOMD2vrkfgaMH2
         Oq0wBlWati6f3wLF6YYbwN12nwlXeAnAvtvfsyMN/SW7pyb02pwREYZl56F8WTR3rUqz
         ggYQaUGfP6uJ0jZOUyNZxyk0NfHuxJJC4ZvoA1Jo7Ly0+e35Cz6mKpnG4YikBUwwesft
         6zK5njeDM8ms388oSzYI13Z3IDHiNUYJnf+eGvg59BBUoSIuzAjL2eTdDfLsKKnoroOv
         n32w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731348920; x=1731953720;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HpZAS2bWwt2zOBZ8cYigNTZ+YnuSyLmLc70gMu7hl/I=;
        b=i+OFhKB7vKCTBnz5hXjEdMvuAF8ZkM0kT7R8uzo28Ysc26GMg2r6XatrpPO/G4eKXa
         t1LmPFg2WMGvOCpWEnu+jcJOfRJKR/mV3EGn36WhSjtdSvNSBQL1SdoYBZMHvnq81OE4
         S7n9ByE4zH6+HcasX0EpmWzc7GZaLtwHgaIzdu7Mg2/6D0NyceujSLLZFPshxFhqPgKG
         0c379JmovbU5D4dhllPse+gS9AZsFF2F/8Tkz4/0fAxSYliErouPV+RghkjaLWJn7JGN
         ZL2ZLRtVNNz5iGsTfRXDhYQVhGQ5oP7KuViIkRLrWVZlqM4a7Mz4/sRlf4FZ2gQb57W6
         uCeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUakspxmrZtgarWpV5Hh8IYAl2ODCUvcnPi4wcoWq4FMMqQfzSwY461+dsIYjrymW4yEPlA9f7mVEX49NY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzCbiaq5BSOAkeEJLCGjQyL4bRuMtTJLbmAPM3iYr9XxDcJ7SHE
	ouMUUCw/1ueLKqMHhse/K6ikQLUkZ+VfmY54/BkWCSVqCboQX9PbdypwobHGGA+9+cCdqoDtaEF
	qnlCY/BAZAjQxWV9VKp/QBUfQXyo=
X-Google-Smtp-Source: AGHT+IGLBSwTKT95wxrHMnOt9Q5Li6BlHC6K+1FHrKgyvNGBGBapWvVwMHYCacWx2xVp0o642B7HukZWBmszb38LcHY=
X-Received: by 2002:a05:690c:b8e:b0:6dd:d119:58dd with SMTP id
 00721157ae682-6eaddda4d5fmr140329177b3.16.1731348920311; Mon, 11 Nov 2024
 10:15:20 -0800 (PST)
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
References: <20241109233821.8619-1-rosenp@gmail.com> <CAL_JsqJeYS12OCVeMHze01631NOtj=uaLcEZRiWKPRZLQpSkUA@mail.gmail.com>
In-Reply-To: <CAL_JsqJeYS12OCVeMHze01631NOtj=uaLcEZRiWKPRZLQpSkUA@mail.gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 11 Nov 2024 10:15:09 -0800
Message-ID: <CAKxU2N-yy7tptcQL7GCFDCGq7mHSp34cDLg6vYuU7UB2669TDg@mail.gmail.com>
Subject: Re: [PATCH net-next] net: use pdev instead of OF funcs
To: Rob Herring <robh@kernel.org>
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
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Nov 11, 2024 at 8:21=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> On Sat, Nov 9, 2024 at 5:40=E2=80=AFPM Rosen Penev <rosenp@gmail.com> wro=
te:
> >
> > np here is ofdev->dev.of_node. Better to use the proper functions as
> > there's no use of children or anything else.
>
> Your commit message needs some work.
>
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/net/can/grcan.c                       |  2 +-
> >  drivers/net/can/mscan/mpc5xxx_can.c           |  2 +-
> >  drivers/net/dsa/bcm_sf2.c                     |  4 ++--
> >  drivers/net/ethernet/allwinner/sun4i-emac.c   |  2 +-
> >  drivers/net/ethernet/freescale/fec_mpc52xx.c  | 23 ++++++++++---------
> >  .../net/ethernet/freescale/fec_mpc52xx_phy.c  | 12 ++++++----
> >  .../net/ethernet/freescale/fs_enet/mac-fcc.c  |  2 +-
> >  .../net/ethernet/freescale/fs_enet/mac-fec.c  |  2 +-
> >  .../net/ethernet/freescale/fs_enet/mac-scc.c  |  2 +-
> >  .../net/ethernet/freescale/fs_enet/mii-fec.c  | 12 ++++++----
> >  drivers/net/ethernet/freescale/ucc_geth.c     | 12 +++++-----
> >  drivers/net/ethernet/marvell/mvneta.c         |  2 +-
> >  drivers/net/ethernet/moxa/moxart_ether.c      |  4 ++--
> >  .../ethernet/samsung/sxgbe/sxgbe_platform.c   |  8 +++----
> >  drivers/net/ethernet/via/via-rhine.c          |  2 +-
> >  drivers/net/ethernet/via/via-velocity.c       |  2 +-
> >  drivers/net/ethernet/xilinx/ll_temac_mdio.c   |  6 ++---
> >  drivers/net/mdio/mdio-mux-mmioreg.c           | 16 +++++++------
> >  drivers/net/wan/fsl_ucc_hdlc.c                | 10 ++++----
> >  19 files changed, 66 insertions(+), 59 deletions(-)
> >
> > diff --git a/drivers/net/can/grcan.c b/drivers/net/can/grcan.c
> > index cdf0ec9fa7f3..0a2cc0ba219f 100644
> > --- a/drivers/net/can/grcan.c
> > +++ b/drivers/net/can/grcan.c
> > @@ -1673,7 +1673,7 @@ static int grcan_probe(struct platform_device *of=
dev)
> >                 goto exit_error;
> >         }
> >
> > -       irq =3D irq_of_parse_and_map(np, GRCAN_IRQIX_IRQ);
> > +       irq =3D platform_get_irq(ofdev, GRCAN_IRQIX_IRQ);
> >         if (!irq) {
> >                 dev_err(&ofdev->dev, "no irq found\n");
> >                 err =3D -ENODEV;
> > diff --git a/drivers/net/can/mscan/mpc5xxx_can.c b/drivers/net/can/msca=
n/mpc5xxx_can.c
> > index 0080c39ee182..252ad40bdb97 100644
> > --- a/drivers/net/can/mscan/mpc5xxx_can.c
> > +++ b/drivers/net/can/mscan/mpc5xxx_can.c
> > @@ -300,7 +300,7 @@ static int mpc5xxx_can_probe(struct platform_device=
 *ofdev)
> >         if (!base)
> >                 return dev_err_probe(&ofdev->dev, err, "couldn't iorema=
p\n");
> >
> > -       irq =3D irq_of_parse_and_map(np, 0);
> > +       irq =3D platform_get_irq(ofdev, 0);
> >         if (!irq) {
> >                 dev_err(&ofdev->dev, "no irq found\n");
> >                 err =3D -ENODEV;
> > diff --git a/drivers/net/dsa/bcm_sf2.c b/drivers/net/dsa/bcm_sf2.c
> > index 43bde1f583ff..9229582efd05 100644
> > --- a/drivers/net/dsa/bcm_sf2.c
> > +++ b/drivers/net/dsa/bcm_sf2.c
> > @@ -1443,8 +1443,8 @@ static int bcm_sf2_sw_probe(struct platform_devic=
e *pdev)
> >                 of_node_put(ports);
> >         }
> >
> > -       priv->irq0 =3D irq_of_parse_and_map(dn, 0);
> > -       priv->irq1 =3D irq_of_parse_and_map(dn, 1);
> > +       priv->irq0 =3D platform_get_irq(pdev, 0);
> > +       priv->irq1 =3D platform_get_irq(pdev, 1);
> >
> >         base =3D &priv->core;
> >         for (i =3D 0; i < BCM_SF2_REGS_NUM; i++) {
> > diff --git a/drivers/net/ethernet/allwinner/sun4i-emac.c b/drivers/net/=
ethernet/allwinner/sun4i-emac.c
> > index 2f516b950f4e..18df8d1d93fd 100644
> > --- a/drivers/net/ethernet/allwinner/sun4i-emac.c
> > +++ b/drivers/net/ethernet/allwinner/sun4i-emac.c
> > @@ -995,7 +995,7 @@ static int emac_probe(struct platform_device *pdev)
> >
> >         /* fill in parameters for net-dev structure */
> >         ndev->base_addr =3D (unsigned long)db->membase;
> > -       ndev->irq =3D irq_of_parse_and_map(np, 0);
> > +       ndev->irq =3D platform_get_irq(pdev, 0);
> >         if (ndev->irq =3D=3D -ENXIO) {
> >                 netdev_err(ndev, "No irq resource\n");
> >                 ret =3D ndev->irq;
> > diff --git a/drivers/net/ethernet/freescale/fec_mpc52xx.c b/drivers/net=
/ethernet/freescale/fec_mpc52xx.c
> > index 2bfaf14f65c8..553d33a98c99 100644
> > --- a/drivers/net/ethernet/freescale/fec_mpc52xx.c
> > +++ b/drivers/net/ethernet/freescale/fec_mpc52xx.c
> > @@ -811,7 +811,7 @@ static int mpc52xx_fec_probe(struct platform_device=
 *op)
> >         int rv;
> >         struct net_device *ndev;
> >         struct mpc52xx_fec_priv *priv =3D NULL;
> > -       struct resource mem;
> > +       struct resource *mem;
> >         const u32 *prop;
> >         int prop_size;
> >         struct device_node *np =3D op->dev.of_node;
> > @@ -828,20 +828,21 @@ static int mpc52xx_fec_probe(struct platform_devi=
ce *op)
> >         priv->ndev =3D ndev;
> >
> >         /* Reserve FEC control zone */
> > -       rv =3D of_address_to_resource(np, 0, &mem);
> > -       if (rv) {
> > +       mem =3D platform_get_resource(op, 0, IORESOURCE_MEM);
> > +       if (!mem) {
> >                 pr_err("Error while parsing device node resource\n");
> > +               rv =3D -ENODEV;
> >                 goto err_netdev;
> >         }
> > -       if (resource_size(&mem) < sizeof(struct mpc52xx_fec)) {
> > +       if (resource_size(mem) < sizeof(struct mpc52xx_fec)) {
> >                 pr_err("invalid resource size (%lx < %x), check mpc52xx=
_devices.c\n",
> > -                      (unsigned long)resource_size(&mem),
> > +                      (unsigned long)resource_size(mem),
> >                        sizeof(struct mpc52xx_fec));
> >                 rv =3D -EINVAL;
> >                 goto err_netdev;
> >         }
> >
> > -       if (!request_mem_region(mem.start, sizeof(struct mpc52xx_fec),
> > +       if (!request_mem_region(mem->start, sizeof(struct mpc52xx_fec),
> >                                 DRIVER_NAME)) {
> >                 rv =3D -EBUSY;
> >                 goto err_netdev;
> > @@ -851,13 +852,13 @@ static int mpc52xx_fec_probe(struct platform_devi=
ce *op)
> >         ndev->netdev_ops        =3D &mpc52xx_fec_netdev_ops;
> >         ndev->ethtool_ops       =3D &mpc52xx_fec_ethtool_ops;
> >         ndev->watchdog_timeo    =3D FEC_WATCHDOG_TIMEOUT;
> > -       ndev->base_addr         =3D mem.start;
> > +       ndev->base_addr         =3D mem->start;
> >         SET_NETDEV_DEV(ndev, &op->dev);
> >
> >         spin_lock_init(&priv->lock);
> >
> >         /* ioremap the zones */
> > -       priv->fec =3D ioremap(mem.start, sizeof(struct mpc52xx_fec));
> > +       priv->fec =3D ioremap(mem->start, sizeof(struct mpc52xx_fec));
>
> Generally, devm_platform_ioremap_resource(),
> devm_platform_get_and_ioremap_resource(), etc. are preferred. So if
> we're going to rework things, rework them to use those.
I'm going to avoid that as I've been constantly getting requests to
test my changes on real hardware. I don't own anything that uses
fec_mpc52xx.c.

Plus, documentation states that netdev isn't too big of a fan of devm.

Oh and this file uses no devm of any kind.
>
> Rob

