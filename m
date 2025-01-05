Return-Path: <linuxppc-dev+bounces-4675-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D91A01BCD
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Jan 2025 21:28:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YR86H6zbZz2ymQ;
	Mon,  6 Jan 2025 07:28:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736108935;
	cv=none; b=F1NYU1oExeeVbURJHw/5vO3HEysFX55+UGsix0Aphg6HbeT/4Ta7MARajcdFTuHmvKBw4rgXVuVM52Lf8fQ3QNmZluccuVkmm8pLml0llcnBauO48ziS12j8UFLIzSZdvmrl8zPeYXFr2TD07krx5hPlFKMdX7oXK/P3djeBk/HMpKeXp5a+jOmpMmyrTTMXAfFQq4XreDB33OKSka3HmJDTiS4KFXxF305EjK+1EtIwzeNMe+31OIgIaEKZoHI7BFmE0S6zHvaTJddnL4DxcUAHH7sN8ldWgrR/hbSZ9J5Er8CdacHfaKh7I32fmAC7EOzfvRmfRloAhgx4/W/yDw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736108935; c=relaxed/relaxed;
	bh=0tU7h/Ztoat1uFla9mUT7M20raXkja/MF65dJaF6x9A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ammQUCzatxz2OPATAzRWpS8PkCuLua2Z6Hhtt58bafj5+oOlUMoWLD85PYPvZLZQEwFx+TpOYOcDMs/r6ujufCWhgLhguoEQ5JAFk7BDDk7jIsb2P/E2jYbynBKYQhlOzKfpHXix5KOLe5q1VbuszXIRlk41QOrvIQoNnK3Vl/DG2npCGRGXUv+TmL3PjYH0pucGbhN4JXW+GcSiTa+c9CIKNBnTXkyGWn86STcOEIpqVBsWTKpKNPxQT5sq/C3DsaFAI8kAevB7oyri0eRRDdP1GH5yPDFTKlJqwCvJTq2FT2LsBpxYMPpp0GamAp0WcHXJwguc/GBivhEm+M57Ww==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rkHDMHKQ; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rkHDMHKQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YR86G17g9z2yNH
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jan 2025 07:28:54 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F131A5C5A1A
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Jan 2025 20:28:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1FA7C4CEE3
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Jan 2025 20:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736108929;
	bh=AyEhIAXKetLWnEXX/8mvNQbxYa7DyuIGHQQAVbJ5pBo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rkHDMHKQs8avFTDQn6kZMcopJVxc0CUXlHaTpy53fRSAr0NKTp0idara2sEFc1FLy
	 ry172TGrYUS0XwbbD+GaVwbe6QpGglrxPNTjajcyZjQcv7tq+fEXDOObQlPvy811sS
	 KB7H9c25peR20wntVGxT0JWiSjrgFHveSzF8Wbgn+6zq6WYgEiNGum0yUM+U19tOSU
	 YQJnBTlePR7Pfj+IcOnKpgSVCT7g2kXlMbzKuPZpOFq8TXz7mnsLI8/ZhvuxTlFR37
	 gk+z9Jx8D+4ViiYZ0mgGQcEy9C+N2n2V7Xd4sg6vb3yednYCIxlp+ubwZ3d4jCw0Bo
	 zv594E5Kq3GFw==
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e3978c00a5aso18247707276.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 05 Jan 2025 12:28:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVSaEqLSNetBKvXGfEsppCapZ2Tg4QzbkHoka+ZVNhkJ0Dxa5WWqbSTXiUpMELn2clx2NsDLUV6EHU5GHg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyS1KcE2hpGof/xWHbbT+4hI+nEu/961jOWEz3VCmaNUl5xLxCO
	JyYSBSXc7fwbet1VFbKVu/1UhMTQMbTpFm6HLDNE7E9nk6u3XmxwKcX0dtEGL42g8GAoBR/Uydx
	S22+rX4rGc9zQ7VghFD3JvdLmhg==
X-Google-Smtp-Source: AGHT+IHqZvyalRFjy7jMGbHDLu2PENMBR7A5IENWEEuKVcLGqVEncnQ1jHvJ4PvkM8+ugn+0jS7p2xnDU/30KNqFwCc=
X-Received: by 2002:a05:690c:6208:b0:6ef:4b3f:3bc3 with SMTP id
 00721157ae682-6f3f811507amr410644137b3.16.1736108928776; Sun, 05 Jan 2025
 12:28:48 -0800 (PST)
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
References: <20250102-mpc83xx-v1-0-86f78ba2a7af@posteo.net>
 <20250102-mpc83xx-v1-14-86f78ba2a7af@posteo.net> <CAL_JsqKU0AQ+ym_iDZSN5hNUTMF0bgjqu-aAVtG792Mw_eZTbg@mail.gmail.com>
 <Z3lKqLXphxeI1Gvo@probook>
In-Reply-To: <Z3lKqLXphxeI1Gvo@probook>
From: Rob Herring <robh@kernel.org>
Date: Sun, 5 Jan 2025 14:28:37 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+HrXpqi-mDJF+vyg5zL5mTD5FsCTSq_39U8DffKW+XYQ@mail.gmail.com>
Message-ID: <CAL_Jsq+HrXpqi-mDJF+vyg5zL5mTD5FsCTSq_39U8DffKW+XYQ@mail.gmail.com>
Subject: Re: [PATCH 14/19] powerpc: mpc83xx: Switch to of_platform_populate
To: =?UTF-8?B?Si4gTmV1c2Now6RmZXI=?= <j.ne@posteo.net>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Frank Li <Frank.Li@nxp.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sat, Jan 4, 2025 at 8:50=E2=80=AFAM J. Neusch=C3=A4fer <j.ne@posteo.net>=
 wrote:
>
> On Thu, Jan 02, 2025 at 12:51:47PM -0600, Rob Herring wrote:
> > On Thu, Jan 2, 2025 at 12:32=E2=80=AFPM J. Neusch=C3=A4fer via B4 Relay
> > <devnull+j.ne.posteo.net@kernel.org> wrote:
> > >
> > > From: "J. Neusch=C3=A4fer" <j.ne@posteo.net>
> > >
> > > Quoting from drivers/of/platform.c:
> > >
> > > > of_platform_populate() - [...]
> > > > Similar to of_platform_bus_probe(), this function walks the device
> > > > tree and creates devices from nodes.  It differs in that it follows
> > > > the modern convention of requiring all device nodes to have a
> > > > 'compatible' property, and it is suitable for creating devices whic=
h
> > > > are children of the root node (of_platform_bus_probe will only crea=
te
> > > > children of the root which are selected by the @matches argument).
> > >
> > > This is useful for new board ports because it means that the C code d=
oes
> > > not have to anticipate every node that is placed directly under the r=
oot.
> > >
> > > As a consequence, the of_bus_ids list can be much shorter, and I've
> > > trimmed it to the necessary parts:
> > >
> > >  - device-type =3D "soc" and compatible =3D "simple-bus" for the SoC =
bus
> > >  - compatible =3D "gianfar" for the Ethernet controller (TSEC), which
> > >    may contain an MDIO bus, which needs to be probed, as a subnode
> > >
> > > Signed-off-by: J. Neusch=C3=A4fer <j.ne@posteo.net>
> > > ---
> > >  arch/powerpc/platforms/83xx/misc.c | 6 +-----
> > >  1 file changed, 1 insertion(+), 5 deletions(-)
> > >
> > > diff --git a/arch/powerpc/platforms/83xx/misc.c b/arch/powerpc/platfo=
rms/83xx/misc.c
> > > index 1135c1ab923cc120f377a0d98767fef686cad1fe..bf522ee007bbb14292333=
55f668fc8563d8ca4e2 100644
> > > --- a/arch/powerpc/platforms/83xx/misc.c
> > > +++ b/arch/powerpc/platforms/83xx/misc.c
> > > @@ -94,18 +94,14 @@ void __init mpc83xx_ipic_init_IRQ(void)
> > >
> > >  static const struct of_device_id of_bus_ids[] __initconst =3D {
> > >         { .type =3D "soc", },
> >
> > of_platform_populate() won't work on this match unless there's a
> > compatible in the node, too. Can we use compatible instead or are
> > there a bunch of them?
>
> In arch/powerpc/boot/dts, I can find the following cases of device_type
> =3D "soc" without compatible =3D "simple-bus":
>
> - arch/powerpc/boot/dts/tqm8xx.dts           (MPC8xx)
> - arch/powerpc/boot/dts/mpc885ads.dts        (MPC8xx)
> - arch/powerpc/boot/dts/mpc866ads.dts        (MPC8xx)
> - arch/powerpc/boot/dts/ep88xc.dts           (MPC8xx)
> - arch/powerpc/boot/dts/kuroboxHG.dts        (MPC82xx)
> - arch/powerpc/boot/dts/kuroboxHD.dts        (MPC82xx)
> - arch/powerpc/boot/dts/storcenter.dts       (MPC82xx)
> - arch/powerpc/boot/dts/asp834x-redboot.dts  (MPC83xx!)
> - arch/powerpc/boot/dts/ksi8560.dts          (MPC85xx)
>
> i.e. there is one affected devicetree. I can simply patch that one in
> the next iteration.

You can, but that doesn't fix existing DTBs with your kernel change.

We either have to determine no one cares about that platform or the
ABI or add a fixup to add the compatible property.

> >
> > > -       { .compatible =3D "soc", },
> > >         { .compatible =3D "simple-bus" },
> > >         { .compatible =3D "gianfar" },
> > > -       { .compatible =3D "gpio-leds", },
> > > -       { .type =3D "qe", },
> > > -       { .compatible =3D "fsl,qe", },
> >
> > Better still would be if we could move the remaining ones to the
> > default table and just call of_platform_default_populate().
>
> of_platform_default_populate does sound preferable.
>
> I'll investigate why exactly the "gianfar" match is necessary and how to
> fix it in the corresponding driver (I don't think it's general enough to
> warrant being listed in of_default_bus_match_table).

That may work too.

Rob

