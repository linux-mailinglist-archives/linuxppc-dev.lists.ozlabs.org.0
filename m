Return-Path: <linuxppc-dev+bounces-11422-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B03F6B39EE1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Aug 2025 15:28:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cCMg642lNz2ykc;
	Thu, 28 Aug 2025 23:28:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756387730;
	cv=none; b=ffKWwNjFa+ZDEGRhHXtzidUvJBjBL21mEookrSqE0t5J0LW4KmMTbyhcIeou+3HTyZ5gjHR7gSD2HIktsonYoaeSXGiiclMGk/0uy+O/JcBpBTgwjL5sK8fyR45x2T9SSqTle3JDnGV/eDXwHwRmKIHSoYJkxj9khgSPvZOn5nfaYXQqEm3mdndb6WeVswWoUITHSVoZwoYniB4rf3MqM4EATaYC8UJBSFITE2N/o06a8pp1jMB4qIBxDE5vm3oGhcy0HR6Q1xJQUZRfR1ZWT+kF+iQD5OxpNJxRpEZOZem6G4KE0HQJ6wkQ2reSH1y7WJuYZ5k1uG07e4QLxclGew==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756387730; c=relaxed/relaxed;
	bh=80lLDHpN3Csbhaqn6OlMNPOii5Ix4huABuj8mVbmyWk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jGMKbI9RGOLXPbOkIALd0Sx5fxEN+z1tz+5O+tw8VtW5OTGDdm0aSgo2fC8g/vr57WdzIixDhuuA8dNSghlQEo66iuicwKF//zODRfq6WceEphbw5JRgDaYutCn10ZrfOV2+3gsdWEEi5+d3xJLlb2U9Rg06zTaOiPOGIi7vcs0gJTylU3fm46x0UNL5bsrIaTNaWqgccJ2gqYhLm8569kZohmbA5Fv7y3kQ78TO59t6BfzsE9UHAqfERECKm6quMEeyI2qDFrrV/I8YkPzseJUBAzBuZ5z+YNEU+bUgZH1wP5zZt/O5V1hHoee+RiVDG+EYoXLSxHgIOYb0XPf19g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=swzObivg; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=swzObivg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cCMg55DNCz2yg0
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Aug 2025 23:28:49 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 92B39441D2
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Aug 2025 13:28:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72778C4CEED
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Aug 2025 13:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756387727;
	bh=DfHHBD/rVjjrqh5NmASHX+RFHIrOFeXwQ0K0sXIKM0I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=swzObivgRxQ1txTRZOLUVqeNZa30HWFK/E0loDw51gF1fYkBfgiRHVViLErwUbGe4
	 tah2ih40TeRH5TbGU+fURSCilcEw5fk41YCdMnlDI0U8Jpcam/U9UCHfEqIlzTGREW
	 3v8+EbjwRBduKZzUn/PyAKWN2kLXYqbKyQfbp9ISsuVdl/eaB8rluloH/3teYGMe9n
	 1e1sURGOAzbO/5ASZVMVH+OAr/GiWXRBcnKRsUM+V9W0D76ONMZAfLCyV8izrF7hEP
	 yvMMk0HtP087rudOTF4ljFhubq3lh0QsfCPEzSJt5qPximNFO9taD7TmHaRgKixx41
	 FqYxNmc/mB/Mw==
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-afe6fe7c89bso314127866b.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Aug 2025 06:28:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUIMvxxVz42bEAczWs4tfuERVe8KWCZVXSmkdZesdNxQH3bPXLLY1+BhTzXhPLYXegvx/cLue17ED+OwXg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw1Di5jOPnKDQRHikBsHL/JiKnTKzFtsaoLVmxW8AaD7CZp89qX
	uOAVlwXTNP2QPG/c1BbWOaa+8nTCmyr7MqexnnG3i0r1cYkvbog8pO6bPryBTg6nCwutCh2lX5y
	r/Gm/lfXtN2/MKXBWMO4h4zbYpvV4iw==
X-Google-Smtp-Source: AGHT+IFgWx3EjxiuyoE9wirR/dDT7Hm9AlZ1rldwPD7NWFyqMumFqslPy2Yia23VX1xN9hg0OQGKXYTedeYDgzaTElM=
X-Received: by 2002:a17:907:1c1c:b0:af9:a381:aee1 with SMTP id
 a640c23a62f3a-afeafecae85mr812402766b.0.1756387726034; Thu, 28 Aug 2025
 06:28:46 -0700 (PDT)
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
Precedence: list
MIME-Version: 1.0
References: <cover.1756104334.git.christophe.leroy@csgroup.eu> <17636607f2beac3b64c87b3bec035fa27ce8d195.1756104334.git.christophe.leroy@csgroup.eu>
In-Reply-To: <17636607f2beac3b64c87b3bec035fa27ce8d195.1756104334.git.christophe.leroy@csgroup.eu>
From: Rob Herring <robh@kernel.org>
Date: Thu, 28 Aug 2025 08:28:33 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKFvVQTVXV8mWX0z1=hd3nLDzLXq-0G_0bshMCvQ5kVvA@mail.gmail.com>
X-Gm-Features: Ac12FXxDhqNf1LWnckP7L04gabZFe5TqvyzgYXr11IYk9xaITt-kXXAUX9A3-yw
Message-ID: <CAL_JsqKFvVQTVXV8mWX0z1=hd3nLDzLXq-0G_0bshMCvQ5kVvA@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] dt-bindings: soc: fsl: qe: Add support of IRQ in
 QE GPIO
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Aug 25, 2025 at 2:20=E2=80=AFAM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
> In the QE, a few GPIOs are IRQ capable. Similarly to
> commit 726bd223105c ("powerpc/8xx: Adding support of IRQ in MPC8xx
> GPIO"), add IRQ support to QE GPIO.
>
> Add property 'fsl,qe-gpio-irq-mask' similar to
> 'fsl,cpm1-gpio-irq-mask' that define which of the GPIOs have IRQs.

Why do you need to know this? The ones that have interrupts will be
referenced by an 'interrupts' property somewhere.

> Here is an exemple for port B of mpc8323 which has IRQs for

typo

> GPIOs PB7, PB9, PB25 and PB27.
>
>         qe_pio_b: gpio-controller@1418 {
>                 compatible =3D "fsl,mpc8323-qe-pario-bank";
>                 reg =3D <0x1418 0x18>;
>                 interrupts =3D <4 5 6 7>;
>                 interrupt-parent =3D <&qepic>;
>                 gpio-controller;
>                 #gpio-cells =3D <2>;
>                 fsl,qe-gpio-irq-mask =3D <0x01400050>;
>         };

You are missing #interrupt-cells and interrupt-controller properties.

With multiple new properties, this should be converted to schema first.

>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  .../bindings/soc/fsl/cpm_qe/qe/par_io.txt     | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/par_io.t=
xt b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/par_io.txt
> index 09b1b05fa677..829fe9a3d70c 100644
> --- a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/par_io.txt
> +++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/par_io.txt
> @@ -32,6 +32,15 @@ Required properties:
>    "fsl,mpc8323-qe-pario-bank".
>  - reg : offset to the register set and its length.
>  - gpio-controller : node to identify gpio controllers.
> +Optional properties:
> +- fsl,qe-gpio-irq-mask : For banks having interrupt capability this item=
 tells
> +  which ports have an associated interrupt (ports are listed in the same=
 order
> +  as in QE ports registers)
> +- interrupts : This property provides the list of interrupt for each GPI=
O having
> +  one as described by the fsl,cpm1-gpio-irq-mask property. There should =
be as
> +  many interrupts as number of ones in the mask property. The first inte=
rrupt in
> +  the list corresponds to the most significant bit of the mask.
> +- interrupt-parent : Parent for the above interrupt property.
>
>  Example:
>         qe_pio_a: gpio-controller@1400 {
> @@ -42,6 +51,16 @@ Example:
>                 gpio-controller;
>           };
>
> +       qe_pio_b: gpio-controller@1418 {
> +               #gpio-cells =3D <2>;
> +               compatible =3D "fsl,mpc8323-qe-pario-bank";
> +               reg =3D <0x1418 0x18>;
> +               interrupts =3D <4 5 6 7>;
> +               fsl,qe-gpio-irq-mask =3D <0x01400050>;
> +               interrupt-parent =3D <&qepic>;
> +               gpio-controller;
> +         };
> +
>         qe_pio_e: gpio-controller@1460 {
>                 #gpio-cells =3D <2>;
>                 compatible =3D "fsl,mpc8360-qe-pario-bank",
> --
> 2.49.0
>

