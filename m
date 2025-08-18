Return-Path: <linuxppc-dev+bounces-11100-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A75ADB2AF5A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Aug 2025 19:26:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c5KPp23m6z3cf8;
	Tue, 19 Aug 2025 03:26:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755537982;
	cv=none; b=g+zNL+MG39to399M0M+LjAK77egOe3w3Voa6207T3a7KXZb0298e7mPEm1CIAuulVnhXSzQo/IvpTslDjyy5copixuFkOPXAPwwU667oZN+ZOMGQO4tXgcVrjz+Kr0M+zWkS/HH82XI4MSx006cLJTt3St3AXJd83NCjpZ/yKSuKm7n+NBfcMmaE/m+eOLu/xvbF9IsQLIry/Dmm0+/bo8IJ1GnV8Cj0dFz1A/oPSpUv5ryjZLo7DDnjeJPteCfs6UCdPyVUG5IH5l4EdEwLszk2moY3Lh69HSxww49uvrCiqvRNzI5gRparKM+t5N0XsTnRV16HWuim8cvBeehTQA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755537982; c=relaxed/relaxed;
	bh=N1ZV9nZygGnfTY3gzTQ20v7qVV4L/qPQ7i1daiPe7xg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NdF2YgEAP9NAXiIVkLeLntOAtdjfWMAvDq2gnmLDVvpgBksTThHJWR8ytkFYddQ5MO7UgZc6K/G/qs/IzQOwYZufzWLJXiKBrg1+CuWyrqe5hYihtmmUPzSPUxfK0p8RF4ayfp7XQUG/vrs4s9rYTWsbpyFipDQG7N1HcqkkTwsa6EXRqfe200B3hqjtCDeaQWRnDJbmWysUC8sredfY+w7RvQlxnGxZdeuZEcaLKfOn9IimWecdNX3/nLOFHTaXsTNj+41Mak7Q0wj9jm8dRSDqPfRxPyV9twZSsThkej7czJ5+ZwVRqHyON/h6El/omb63zZ+u50zxveCIflQy0Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GdcHkq8U; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GdcHkq8U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c5KPm66CNz3cdm
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Aug 2025 03:26:20 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 78F5B601F5;
	Mon, 18 Aug 2025 17:26:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81BF1C4CEEB;
	Mon, 18 Aug 2025 17:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755537977;
	bh=DZrc/xQQUWAtQWUj/brEuNkoWNjVTqKwijAmut0IFhU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GdcHkq8U2vePf1ul4rUZw+E1iugmay9QuWid9xt5WPfUUR+stb773TL5sstXPlObC
	 aOWFscgzDsgE/x5vJRAdiLmtyX2Se2whC9d8IpXeDWF3mWzk2ZGGgrWAj4AKS9wE9A
	 l50YL3pRSjGlT+UT/pM/pagzyQHw22HSccJiFtQYt3wf+pFYF+J5Z6GjUJKlH3TSpG
	 lW6I8xTTilElClsWnFIjUEdpI0Nz/IAAbrPNpSHSPudapN6iAFyC6tDODXf603C6O/
	 5TJ8bLA68mmF+ZFQWM/gZPx79lzRrnYXpddCcJD6LgP8mHvDpDvZ2o9gfb2/gNy5yS
	 pHlC7dFPRfjHA==
Date: Mon, 18 Aug 2025 18:26:13 +0100
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
Message-ID: <20250818-angelfish-jasmine-f48d257a4949@spud>
References: <cover.1755506608.git.christophe.leroy@csgroup.eu>
 <cddc5e900b84826614a63b8b29a048c09dd20853.1755506608.git.christophe.leroy@csgroup.eu>
 <20250818-tyke-pungent-20d9ffd47ecc@spud>
 <732b5fb6-ec38-43d9-b544-b27802a844ab@csgroup.eu>
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
	protocol="application/pgp-signature"; boundary="srp7PXp30YhJAiJF"
Content-Disposition: inline
In-Reply-To: <732b5fb6-ec38-43d9-b544-b27802a844ab@csgroup.eu>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--srp7PXp30YhJAiJF
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 18, 2025 at 07:08:47PM +0200, Christophe Leroy wrote:
>=20
>=20
> Le 18/08/2025 =E0 19:03, Conor Dooley a =E9crit=A0:
> > On Mon, Aug 18, 2025 at 10:45:57AM +0200, Christophe Leroy wrote:
> > > In the QE, a few GPIOs are IRQ capable. Similarly to
> > > commit 726bd223105c ("powerpc/8xx: Adding support of IRQ in MPC8xx
> > > GPIO"), add IRQ support to QE GPIO.
> > >=20
> > > Add property 'fsl,qe-gpio-irq-mask' similar to
> > > 'fsl,cpm1-gpio-irq-mask' that define which of the GPIOs have IRQs.
> > >=20
> > > Here is an exemple for port B of mpc8323 which has IRQs for
> > > GPIOs PB7, PB9, PB25 and PB27.
> > >=20
> > > 	qe_pio_b: gpio-controller@1418 {
> > > 		#gpio-cells =3D <2>;
> > > 		compatible =3D "fsl,mpc8323-qe-pario-bank";
> > > 		reg =3D <0x1418 0x18>;
> > > 		interrupts =3D <4 5 6 7>;
> > > 		fsl,qe-gpio-irq-mask =3D <0x01400050>;
> > > 		interrupt-parent =3D <&qepic>;
> > > 		gpio-controller;
> > > 	};
> > >=20
> > > Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> > > ---
> > > v2: Document fsl,qe-gpio-irq-mask
> > > ---
> > >   .../bindings/soc/fsl/cpm_qe/qe/par_io.txt     | 19 ++++++++++++++++=
++
> > >   drivers/soc/fsl/qe/gpio.c                     | 20 ++++++++++++++++=
+++
> > >   2 files changed, 39 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/par_=
io.txt b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/par_io.txt
> > > index 09b1b05fa677..9cd6e5ac2a7b 100644
> > > --- a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/par_io.txt
> > > +++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/par_io.txt
> > > @@ -32,6 +32,15 @@ Required properties:
> > >     "fsl,mpc8323-qe-pario-bank".
> > >   - reg : offset to the register set and its length.
> > >   - gpio-controller : node to identify gpio controllers.
> > > +Optional properties:
> > > +- fsl,qe-gpio-irq-mask : For banks having interrupt capability this =
item tells
> > > +  which ports have an associated interrupt (ports are listed in the =
same order
> > > +  QE ports registers)
> > > +- interrupts : This property provides the list of interrupt for each=
 GPIO having
> > > +  one as described by the fsl,cpm1-gpio-irq-mask property. There sho=
uld be as
> > > +  many interrupts as number of ones in the mask property. The first =
interrupt in
> > > +  the list corresponds to the most significant bit of the mask.
> > > +- interrupt-parent : Parent for the above interrupt property.
> > >   Example:
> > >   	qe_pio_a: gpio-controller@1400 {
> > > @@ -42,6 +51,16 @@ Example:
> > >   		gpio-controller;
> > >   	  };
> > > +	qe_pio_b: gpio-controller@1418 {
> > > +		#gpio-cells =3D <2>;
> > > +		compatible =3D "fsl,mpc8323-qe-pario-bank";
> > > +		reg =3D <0x1418 0x18>;
> > > +		interrupts =3D <4 5 6 7>;
> > > +		fsl,qe-gpio-irq-mask =3D <0x01400050>;
> > > +		interrupt-parent =3D <&qepic>;
> > > +		gpio-controller;
> > > +	  };
> > > +
> > >   	qe_pio_e: gpio-controller@1460 {
> > >   		#gpio-cells =3D <2>;
> > >   		compatible =3D "fsl,mpc8360-qe-pario-bank",
> >=20
> > Why is there a binding change hiding in here alongside a driver one?
>=20
> I did the same way as commit 726bd223105c ("powerpc/8xx: Adding support of
> IRQ in MPC8xx GPIO")
>=20
> Should it be done differently ?

Yes, binding changes should not be in with driver changes. Surprised
that checkpatch didn't complain. That commit you mention seems to have
been like 10 years ago and without dt-binding maintainer review so not
the best thing to use as a basis.
Additionally, Rob may require you to covert to yaml to add new
properties, I forget if that is a requirement or not.

--srp7PXp30YhJAiJF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaKNiNQAKCRB4tDGHoIJi
0qKaAP9vS6SisYRcuo6AMAuGe0ztZz+fC4G1/xIXwq8AALY87gD+LY0HpnxB3XP5
3lW31jMJdflZV5qlHjVzpy2H1FJmRQU=
=zKiO
-----END PGP SIGNATURE-----

--srp7PXp30YhJAiJF--

