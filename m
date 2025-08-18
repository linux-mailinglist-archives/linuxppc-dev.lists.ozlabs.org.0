Return-Path: <linuxppc-dev+bounces-11097-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59643B2AED0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Aug 2025 19:03:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c5Jvn3KJSz3cd1;
	Tue, 19 Aug 2025 03:03:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755536629;
	cv=none; b=dfD32Bk+ZTUz8HzIOVV/YHv3a9QH3tC+XvKcXPqrFGrQN3goVoCw7xZ3dtWG8edkmmcmUhhTLt536LIb97N78sCD3m2HbWhbKt6FvhHcCiHoH0bRVq1yO+UMavf6pizIoDjoOk/rRynCGOvXFSkwf7Uz8dwnrrGEA51aiLQGHRrk9vaWAYb94QlYJgkMVJ4Pu5mq9e9OxPherPg/UGtIxRlrvHbBeL7cV0gcpQcW6nft8wBv31YcjmF9zl/K2sGPngwSB7PXfLgiSGpxL1sNTayakZ7enXbHdw4AiBbJGMdmKompPeEDu53kFY+U0rV1bnFLEyj9OV491GsxcyXumA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755536629; c=relaxed/relaxed;
	bh=HjnN+L59+oCEAhHVMW3WoiFgla7Z0W+Dy7OVqL4cvAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=afwDJnFHLeWfnAoXsht2y0ikdwjGu++ZMLeNzFI6XiSVJ2WkN8L6IzSNty8HAXNORBTERAPaqLB8mV+c5w2jZB/19gTOpMcJqhssOMg6onsRDGdP87he+cE+S6xn8KVjR2F+6WzqDxFY6Uo7/qhB1mHviA0/RmaPTREfHZbv/gGyMJ9jl8d8n1anfC6qnls6/JPdN2IfmyxQDIX4NdwVm0p2Y7jbWxT+5z5zQzudL9ER2xpa1JbC+e218IOGZxzdeUQGkHZS9tSesN+kAUCc5g/hCTmjiTy2bKdmA9VXMC2gP6EQsj0GkFnPNOavhxmumnhfkMpWG4euf6WesqtoFw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qkRfL/7Z; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qkRfL/7Z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c5Jvm2gjVz3ccF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Aug 2025 03:03:48 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 469DC600AE;
	Mon, 18 Aug 2025 17:03:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50122C116C6;
	Mon, 18 Aug 2025 17:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755536624;
	bh=LsUeufe182oeOYuRXyKOtbmmFBfg6vhanNGoljpohVE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qkRfL/7ZkgW0LFbBk7UqwdcY1KYuQ/VkRLwHCquXycZ+zYdXc6Qyzz/Awl83lQYoE
	 FWN9rIIT1cB5kePfP2+JBnr5mVW5jkyuX33cYUVEVlHzjaj6P7NsgkGWwIZVdquBsz
	 hagQFujhG7jAHgNbZ4mDUi0dRqBbV4KKqTNn6I4tP51pJxXUi5nCJzeaM4OLtgztS7
	 MC7WigYjh0JRnW5a3B0jaavtgAGHkDRJvU/sbR3GhBrAMwzhXpCkMgzROcq4bHKc/V
	 RATz74UaTSb4LQ/291wp9JEPu6NlodBuotMR5PP3DzSDnaajt4RZZ7nsnPK3T9HSkT
	 2Z3DXdYhjfCrw==
Date: Mon, 18 Aug 2025 18:03:40 +0100
From: Conor Dooley <conor@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Qiang Zhao <qiang.zhao@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 4/5] soc: fsl: qe: Add support of IRQ in QE GPIO
Message-ID: <20250818-tyke-pungent-20d9ffd47ecc@spud>
References: <cover.1755506608.git.christophe.leroy@csgroup.eu>
 <cddc5e900b84826614a63b8b29a048c09dd20853.1755506608.git.christophe.leroy@csgroup.eu>
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
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kD3gyAnEQtUYwXo5"
Content-Disposition: inline
In-Reply-To: <cddc5e900b84826614a63b8b29a048c09dd20853.1755506608.git.christophe.leroy@csgroup.eu>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--kD3gyAnEQtUYwXo5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 18, 2025 at 10:45:57AM +0200, Christophe Leroy wrote:
> In the QE, a few GPIOs are IRQ capable. Similarly to
> commit 726bd223105c ("powerpc/8xx: Adding support of IRQ in MPC8xx
> GPIO"), add IRQ support to QE GPIO.
>=20
> Add property 'fsl,qe-gpio-irq-mask' similar to
> 'fsl,cpm1-gpio-irq-mask' that define which of the GPIOs have IRQs.
>=20
> Here is an exemple for port B of mpc8323 which has IRQs for
> GPIOs PB7, PB9, PB25 and PB27.
>=20
> 	qe_pio_b: gpio-controller@1418 {
> 		#gpio-cells =3D <2>;
> 		compatible =3D "fsl,mpc8323-qe-pario-bank";
> 		reg =3D <0x1418 0x18>;
> 		interrupts =3D <4 5 6 7>;
> 		fsl,qe-gpio-irq-mask =3D <0x01400050>;
> 		interrupt-parent =3D <&qepic>;
> 		gpio-controller;
> 	};
>=20
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
> v2: Document fsl,qe-gpio-irq-mask
> ---
>  .../bindings/soc/fsl/cpm_qe/qe/par_io.txt     | 19 ++++++++++++++++++
>  drivers/soc/fsl/qe/gpio.c                     | 20 +++++++++++++++++++
>  2 files changed, 39 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/par_io.t=
xt b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/par_io.txt
> index 09b1b05fa677..9cd6e5ac2a7b 100644
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
> +  QE ports registers)
> +- interrupts : This property provides the list of interrupt for each GPI=
O having
> +  one as described by the fsl,cpm1-gpio-irq-mask property. There should =
be as
> +  many interrupts as number of ones in the mask property. The first inte=
rrupt in
> +  the list corresponds to the most significant bit of the mask.
> +- interrupt-parent : Parent for the above interrupt property.
> =20
>  Example:
>  	qe_pio_a: gpio-controller@1400 {
> @@ -42,6 +51,16 @@ Example:
>  		gpio-controller;
>  	  };
> =20
> +	qe_pio_b: gpio-controller@1418 {
> +		#gpio-cells =3D <2>;
> +		compatible =3D "fsl,mpc8323-qe-pario-bank";
> +		reg =3D <0x1418 0x18>;
> +		interrupts =3D <4 5 6 7>;
> +		fsl,qe-gpio-irq-mask =3D <0x01400050>;
> +		interrupt-parent =3D <&qepic>;
> +		gpio-controller;
> +	  };
> +
>  	qe_pio_e: gpio-controller@1460 {
>  		#gpio-cells =3D <2>;
>  		compatible =3D "fsl,mpc8360-qe-pario-bank",

Why is there a binding change hiding in here alongside a driver one?

--kD3gyAnEQtUYwXo5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaKNc6wAKCRB4tDGHoIJi
0gifAP4zV29lsa0wp7PTs4uJEEK4ElPSQZMpreO7o/az7p/onQEA4mIyE/65qlAv
TvH4uKCtgNCyRIAPqS8vTdBswhJBaws=
=PqSq
-----END PGP SIGNATURE-----

--kD3gyAnEQtUYwXo5--

