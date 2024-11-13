Return-Path: <linuxppc-dev+bounces-3145-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F19969C6BD5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2024 10:48:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XpJQ53pvXz2yVv;
	Wed, 13 Nov 2024 20:48:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::f2a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731491325;
	cv=none; b=A/Kqx5W8X8M+Pa+iYaZq0Ykmeeu9FYUFB5HvLTsSHCAHn2Pc89ZV2X8ghtghdLOHUIdtPyJ8HMHdZT/URQ33ibM/aYMWt3tie94FmVv2aXAv71Tbpe9OkkE5vCp4ZOTc8hHt1EzFsoVidWmWtqXxlaZqToW94im3+QskP3Y2rDMoFHfUutoVOVSPE73B1y8rj8YbFg+mUfY1kstpEwC/SSzGGbL1j8xponp+RYj73oCAJlr8xEqFMTiRxotCAM/ZjXp+HtRGmTbf027uI/YQCXXSrBkUZq21jUUWgW6RmWo4DUhx3EnRrBQ/TWtwJSWgWF57EC/nKsSx4Typ+0MPYw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731491325; c=relaxed/relaxed;
	bh=XaSnfzm/t5DivDcI8TYnD0ZfKr8uwA2J8rw6CZWmB2k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LcZsouXJZcyZcOTD9JPl7mHSN2Amqo82KMKnOVL1s7IzTOyS4qdVE+KbMgCQbCXqosulXijuQFlXPnh4fq5I+pxOzNyVtG2pTxXRUljJkRO2tQ+nYXTRmt8trcPjET9aKAu4HiYATzsK+WDz24RoMGXUTGz/kWKD/6XpcsHOSG7X5x87CTt8gzpN3AER03NMbw4P2G6kouUIk9HMvEkBSFhOdRkn35h0Vtm21hEmbxX1iYSB+GEObDL570UKE6LKmScomDgza4p6mh4fv7PBR770olTKdineCUT2jBD5UxUF25rrdE/10e7WyBsYrX++IB8p3Y5sUyCpSnVBWDqwHg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FoLPvEV8; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::f2a; helo=mail-qv1-xf2a.google.com; envelope-from=julian.calaby@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FoLPvEV8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2a; helo=mail-qv1-xf2a.google.com; envelope-from=julian.calaby@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XpJQ31bZ0z2yVt
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2024 20:48:41 +1100 (AEDT)
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-6cbf340fccaso4420586d6.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2024 01:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731491317; x=1732096117; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XaSnfzm/t5DivDcI8TYnD0ZfKr8uwA2J8rw6CZWmB2k=;
        b=FoLPvEV81YM2CH1tXj75aCV6HkgI9EDyE+e+87JFDb3Y58VbeMvg8N4ESMkuJALZJ3
         qxmpoH4e6DYLMQgwCEQd2D4pP+IHYCdD7O4u7DeBc3efIP9xINDNqeaBAo7kfdiuzyAf
         XnMBhfFxWbym+CjZhXCT8k2zoGUx0dNfzyph9akkmMoTHovyM3R1/pvVN3aQSNdcmeoL
         JEpiZNzEr2KvAyHUXFYZRKgK8cqBSp/jrYlLr9oFUlozrUMwWMGdTBmQoZBPVOQFw7ql
         Vzh7J4hjLKTj57d8g2M2f7MTgNPf9+//fVgkvwZHN+hASu2fmniSoVaqgFhzqVx7Ai89
         OrsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731491317; x=1732096117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XaSnfzm/t5DivDcI8TYnD0ZfKr8uwA2J8rw6CZWmB2k=;
        b=eWgD0Fpa7Ib1IijcDUuYQOLRJOnO80CJKTqBDEoot6Oye7x62fFZFzEJR0KjjOYquK
         CPQQpyxKmlUWJ/+JleV3llFW5x7cozGLxgLedzLnLdOcYA3KgQS62uWf0cvtlleXVJ/a
         sTtturNOeo0EspV3Mz4LfPydcSD1EkX9kLqDBVSZW+qPC4KbSRM4bDag/ISkkje2pcuF
         ttQzsESUJ+NFIjSyMNa9Eg06bI2gvl7Z7If+9HtMdJ6XN312DRsiWLwOtnkagcBvKG0u
         BYZHMy0uN5ypi+aAePna/svxoGwXsgnj1XyUcp4qYBd97qj38oZV73Heoz8QtcBakvV0
         7dEA==
X-Forwarded-Encrypted: i=1; AJvYcCVfq5YC9c0mBYQV3tHWNIc2O9HMSezwblH9Ahi97zfh01RzToMgeiJpOJVgWjRCAzndOPovkD55gOk6ges=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YybJzd2+99n0HOkVSoeMZtPAt+f6B35tB9/BCb9IepiH9eEr88X
	+rXcJ50YrUMJ4ycv6L/ctB/LwJ7Gq7W8y8qwyZp3gAEylknSXKIMUJEnNM+S7MbzsIstIbOIbj8
	6l/dmHqmQ6bC2ZFEx9MusWSI31+0=
X-Google-Smtp-Source: AGHT+IHcLy8AEacbQGHGgfaEwyTub+t1gLTfFsAT9DwCgvxu+gX32+4tA6aRof7gwejihIaPx+ov6qt1kZkNWsKHlks=
X-Received: by 2002:ad4:5d49:0:b0:6d3:5be3:e711 with SMTP id
 6a1803df08f44-6d39d57c179mr302997596d6.9.1731491316900; Wed, 13 Nov 2024
 01:48:36 -0800 (PST)
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
References: <20241112211442.7205-1-rosenp@gmail.com>
In-Reply-To: <20241112211442.7205-1-rosenp@gmail.com>
From: Julian Calaby <julian.calaby@gmail.com>
Date: Wed, 13 Nov 2024 20:48:24 +1100
Message-ID: <CAGRGNgXhtPy_G9O0n7dEhcAX3sWN=08tF9tgFpLs8V---uELYg@mail.gmail.com>
Subject: Re: [PATCHv3 net-next] net: modernize IRQ resource acquisition
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
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Rosen,

On Wed, Nov 13, 2024 at 8:14=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wrot=
e:
>
> In probe, np =3D=3D pdev->dev.of_node. It's easier to pass pdev directly.
>
> Replace irq_of_parse_and_map() by platform_get_irq() to do so. Requires
> removing the error message as well as fixing the return type.
>
> Replace of_address_to_resource() with platform_get_resource() for the
> same reason.

Sorry for the drive-by review, but I have to question the utility of
this conversion.

> diff --git a/drivers/net/can/grcan.c b/drivers/net/can/grcan.c
> index cdf0ec9fa7f3..48e93c3445e7 100644
> --- a/drivers/net/can/grcan.c
> +++ b/drivers/net/can/grcan.c
> @@ -1673,9 +1673,8 @@ static int grcan_probe(struct platform_device *ofde=
v)
>                 goto exit_error;
>         }
>
> -       irq =3D irq_of_parse_and_map(np, GRCAN_IRQIX_IRQ);
> -       if (!irq) {
> -               dev_err(&ofdev->dev, "no irq found\n");
> +       irq =3D platform_get_irq(ofdev, GRCAN_IRQIX_IRQ);
> +       if (irq < 0) {

In this change and a lot of the others, you're not removing the "np"
variable, so you're basically replacing one wrapper with another.

>                 err =3D -ENODEV;
>                 goto exit_error;
>         }
> diff --git a/drivers/net/ethernet/freescale/fs_enet/mac-fcc.c b/drivers/n=
et/ethernet/freescale/fs_enet/mac-fcc.c
> index be63293511d9..9006137e3a55 100644
> --- a/drivers/net/ethernet/freescale/fs_enet/mac-fcc.c
> +++ b/drivers/net/ethernet/freescale/fs_enet/mac-fcc.c
> @@ -83,8 +83,8 @@ static int do_pd_setup(struct fs_enet_private *fep)
>         struct fs_platform_info *fpi =3D fep->fpi;
>         int ret =3D -EINVAL;
>
> -       fep->interrupt =3D irq_of_parse_and_map(ofdev->dev.of_node, 0);
> -       if (!fep->interrupt)
> +       fep->interrupt =3D platform_get_irq(ofdev, 0);
> +       if (fep->interrupt < 0)

This one and others like it are fine: it's much cleaner to use the
"platform_irq()" function instead of reaching deep into the structure
to grab the "of_node" property.

That said, in this case and probably a few others this is a driver for
an OF device so I'm still not sure this actually makes sense.

Thanks,

--=20
Julian Calaby

Email: julian.calaby@gmail.com
Profile: http://www.google.com/profiles/julian.calaby/

