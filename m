Return-Path: <linuxppc-dev+bounces-3099-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6ED9C4D9F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2024 05:10:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XnXy70jbkz2xjv;
	Tue, 12 Nov 2024 15:10:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b30"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731384623;
	cv=none; b=HQ844RWmJE02ELXaS7UYBodA43x1dwijzscDAGXUqRjoQWvyPy9ctpSXwdzQORs1Wl+20FzuRqKAWmXgXwqtUad7CrrwmuNJTXrOY0lcJDJb0PPg0tof1KpPzdqouhQ5ccEjdoMXdrKms9WbSpVgAY6CWNlEhi03WWRzjC9Ta25xrta3C++NTiQoPf8xgcGvZ+t4HHAhwzFmIdHkWY7NznKoIZvJ/8GJRi9RoOy2o7+x9esPAI+gPahXECpmwkD6n8Yc4Pmj3+nDicFzLe7KXyAfHwIT43p/g8H0E0pcgsGmmISsEeAHZeEfBoujxaAPGVnJnRjFxqdcQfPJJe58rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731384623; c=relaxed/relaxed;
	bh=DsmubN01hyDUEhQ6tv783ePv53ofcUVY2RqcZdf3yEo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OSREVT7sCblaIcK4PRohvnbZtcnNKX1kaTE5vLEpR2kaE2Z/VyYoS2Chv6GPj0iNwUZ02I1k9lNZ+v/0Eg5USQYHonOuJqcSLtO5zsHSxwIXiM47m5M/P2f1M9nzcdxhxgEKzZBmYmtBeU9dH7PBWiquxB7q0zZ1iUEjQXTTrDRCcvxd2bMvIvqoqJrINx3OKTDgAv8MlCijQxPZQi0xPlDYdYcpymqyYQvS1GM5FQkz2ML03ZfJBinBwyAdyLs2DhOHiY3pwizmf4T5nJS5p8bibv/zioCAHAXgKIvqM7G3OiZ22sMZCXkGN60jaRJxWHtEdKIxvWJfmehmwbcKjg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kR8fVq4e; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b30; helo=mail-yb1-xb30.google.com; envelope-from=rosenp@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kR8fVq4e;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b30; helo=mail-yb1-xb30.google.com; envelope-from=rosenp@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XnXy52BwQz2xgp
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2024 15:10:20 +1100 (AEDT)
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-e2974743675so4757260276.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Nov 2024 20:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731384615; x=1731989415; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DsmubN01hyDUEhQ6tv783ePv53ofcUVY2RqcZdf3yEo=;
        b=kR8fVq4evCALYTKAWwcnghwNfnWnjm7muePhJW+XcANHtgkk//OU5cPCRPyiHq2XA+
         dTfTdR7vUWWzMx/gDlrSmFctFAkgUBHdrFtPY0mcQzfMkOXfgWWb1hXZKLj8XsBzQfW0
         awPE6f9vfC7NNJvjBktPiH4XaJxCmx2Cm9ur63R8/VNJgU81FNkN/HsnSBeLi/X3QR6D
         f5UJNQuhJL3qtScvauqKwtYaVSJnLBg6AwmphYFvpLdBlcHpj7Unmm7GfYzn5HJcAHdh
         g54J2IXG6gUf/pb0ww4wog6CromwenZezudXs7xzkrb3zHdW4gu/d0ncZAlTrz9Bv9IB
         4pVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731384615; x=1731989415;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DsmubN01hyDUEhQ6tv783ePv53ofcUVY2RqcZdf3yEo=;
        b=F5hIUkwiCTGf+1orySPMlksE29Kd8II6gLAYmwzxw046bdWpZGf12rwwn+fz9vlrO0
         SaMzbqWXSeAg46zR5lcPpPJNrVRW/5ZlRwPO85z3CCtuRpRhcF8iQN3X7WzDwB6NvaLl
         n/ytJltMikypF4zoBFC9alyBdbKTwcVrSZi6U1tDtA5H6/146TPgskv1CxQmjyPtBksJ
         j7upk7p5WgRJghhi1VZHQ+TvKRbK8Rb+JdcL9sMqxw4h7AvQuERw6E8TsYHZ7uAeDcmD
         zeSs9+w/QoyxVRjqiV9bg7RLc009zoybI1gnvnJwkQIO+o1gGUB+wj6g/Zt9IuHmsTPS
         RYIw==
X-Forwarded-Encrypted: i=1; AJvYcCXI6NMHjiQolgbv0PXNNJaHNIegA7qhbkdwaoQtfmdDsIPYzAOfXNpp6qBhnDkA2rTk30W63XGrOy8KUw0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzJ2ZhOnD2l+W0Mvtmutwy3En3xe185b1vtRiBUt7mAs++qGfoM
	ufZ6B49gbI4M2fI0nO5Ge36cXB0ciOVlHMdeAIu6sIwjbZQZx/ktrF496GP6/WnyllLQAliqFUz
	ew3vHmYW6m25iSXSQroolT6QB3bE=
X-Google-Smtp-Source: AGHT+IEEd9e7KYmg9hOChPdcooKIfQet+Ec2imFxx6bP82VRvCibSsbb8ecrhexu0TZ29275WhqN4tjEisNPdXIjqY0=
X-Received: by 2002:a05:690c:6b11:b0:6e2:ab93:8c68 with SMTP id
 00721157ae682-6eadddaf35cmr135388027b3.25.1731384615059; Mon, 11 Nov 2024
 20:10:15 -0800 (PST)
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
References: <20241111210316.15357-1-rosenp@gmail.com> <20241111193222.00ae2f3e@kernel.org>
In-Reply-To: <20241111193222.00ae2f3e@kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 11 Nov 2024 20:10:04 -0800
Message-ID: <CAKxU2N-VHmVerombZ77uOHApi0aGBFi46oC1eoGTm5sakCVc4w@mail.gmail.com>
Subject: Re: [PATCHv2 net-next] net: use pdev instead of OF funcs
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Vladimir Oltean <olteanv@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Pantelis Antoniou <pantelis.antoniou@gmail.com>, Marcin Wojtas <marcin.s.wojtas@gmail.com>, 
	Byungho An <bh74.an@samsung.com>, Kevin Brace <kevinbrace@bracecomputerlab.com>, 
	Francois Romieu <romieu@fr.zoreil.com>, Michal Simek <michal.simek@amd.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Zhao Qiang <qiang.zhao@nxp.com>, 
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

On Mon, Nov 11, 2024 at 7:32=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Mon, 11 Nov 2024 13:03:16 -0800 Rosen Penev wrote:
> > --- a/drivers/net/ethernet/samsung/sxgbe/sxgbe_platform.c
> > +++ b/drivers/net/ethernet/samsung/sxgbe/sxgbe_platform.c
> > @@ -111,7 +111,7 @@ static int sxgbe_platform_probe(struct platform_dev=
ice *pdev)
> >       }
> >
> >       /* Get the SXGBE common INT information */
> > -     priv->irq  =3D irq_of_parse_and_map(node, 0);
> > +     priv->irq =3D platform_get_irq(pdev, 0);
> >       if (priv->irq <=3D 0) {
> >               dev_err(dev, "sxgbe common irq parsing failed\n");
> >               goto err_drv_remove;
> > @@ -122,7 +122,7 @@ static int sxgbe_platform_probe(struct platform_dev=
ice *pdev)
> >
> >       /* Get the TX/RX IRQ numbers */
> >       for (i =3D 0, chan =3D 1; i < SXGBE_TX_QUEUES; i++) {
> > -             priv->txq[i]->irq_no =3D irq_of_parse_and_map(node, chan+=
+);
> > +             priv->txq[i]->irq_no =3D platform_get_irq(pdev, chan++);
> >               if (priv->txq[i]->irq_no <=3D 0) {
> >                       dev_err(dev, "sxgbe tx irq parsing failed\n");
> >                       goto err_tx_irq_unmap;
> > @@ -130,14 +130,14 @@ static int sxgbe_platform_probe(struct platform_d=
evice *pdev)
> >       }
> >
> >       for (i =3D 0; i < SXGBE_RX_QUEUES; i++) {
> > -             priv->rxq[i]->irq_no =3D irq_of_parse_and_map(node, chan+=
+);
> > +             priv->rxq[i]->irq_no =3D platform_get_irq(pdev, chan++);
> >               if (priv->rxq[i]->irq_no <=3D 0) {
> >                       dev_err(dev, "sxgbe rx irq parsing failed\n");
> >                       goto err_rx_irq_unmap;
> >               }
> >       }
> >
> > -     priv->lpi_irq =3D irq_of_parse_and_map(node, chan);
> > +     priv->lpi_irq =3D platform_get_irq(pdev, chan);
> >       if (priv->lpi_irq <=3D 0) {
> >               dev_err(dev, "sxgbe lpi irq parsing failed\n");
> >               goto err_rx_irq_unmap;
>
> Coccicheck wants you to drop the errors:
>
> drivers/net/ethernet/samsung/sxgbe/sxgbe_platform.c:116:2-9: line 116 is =
redundant because platform_get_irq() already prints an error
> drivers/net/ethernet/samsung/sxgbe/sxgbe_platform.c:127:3-10: line 127 is=
 redundant because platform_get_irq() already prints an error
> drivers/net/ethernet/samsung/sxgbe/sxgbe_platform.c:135:3-10: line 135 is=
 redundant because platform_get_irq() already prints an error
> drivers/net/ethernet/samsung/sxgbe/sxgbe_platform.c:142:2-9: line 142 is =
redundant because platform_get_irq() already prints an error

I looked at the output. The error checks need changing too.

>
> You can make it a separate patch in a series, for clarity.
I don't think it's enough to warrant its own commit.
> --
> pw-bot: cr

