Return-Path: <linuxppc-dev+bounces-24-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE0594F964
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2024 00:11:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NUXUll5c;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WjTHs5VyHz2xKT;
	Tue, 13 Aug 2024 08:11:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NUXUll5c;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WjKDM6nZ8z2xKT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Aug 2024 02:07:47 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3176FCE0FCA;
	Mon, 12 Aug 2024 16:07:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1471C32782;
	Mon, 12 Aug 2024 16:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723478862;
	bh=xtGm+PnqS9zMeh65xDDKfq7qKoHUSOzcfLhggZPCYKA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NUXUll5c/CSjhblh1/IJtpDqNS+BdK0g6MDSMDmOZBfMT0u4Ff6Qjn+pSIYtSiaw1
	 Z686FVneDVc+oBB18x42O9O0GsjcsC1rZ2FEF+awWtzu0vcL8aA7RIdkN8Ob1/4X7f
	 fR/NBqM9NYh+v6tWGrTS91NvQSyceg7zsXHBtAJuc8vHyvfqH/lUk950AKQt7szFae
	 j+CR7Xy4RWKcxQg7Fch9CqEJibgeTbK9LtNhzmeatrggmID42rwIwMREKhDJNVNO7V
	 jXTItXbWpwVPVdAbtxySLNqevoLFZ4NHZD7kVrET1VbprDgK0NRW0DCqQNcsBKfTSS
	 hFdxEDGrt6pUQ==
Date: Mon, 12 Aug 2024 17:07:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: fsl: fsl,rcpm: fix unevaluated
 fsl,rcpm-wakeup property
Message-ID: <20240812-shrapnel-treason-03ed1d6b49c9@spud>
References: <20240811153507.126512-1-krzysztof.kozlowski@linaro.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qepN/n4K0ZLCBrZr"
Content-Disposition: inline
In-Reply-To: <20240811153507.126512-1-krzysztof.kozlowski@linaro.org>


--qepN/n4K0ZLCBrZr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 11, 2024 at 05:35:07PM +0200, Krzysztof Kozlowski wrote:
> Drop the RCPM consumer example from the binding (LPUART device node),
> because:
> 1. Using phandles is typical syntax, thus explaining it is not needed in
>    the provider binding,
> 2. It has 'fsl,rcpm-wakeup' property which is not allowed by LPUART
>    binding so it causes dt_binding_check warning:
>=20
>    fsl,rcpm.example.dtb: serial@2950000: Unevaluated properties are not a=
llowed ('fsl,rcpm-wakeup' was unexpected)
>      from schema $id: http://devicetree.org/schemas/serial/fsl-lpuart.yam=
l#
>=20
> Alternatively, this property could be added to LPUART binding
> (fsl-lpuart.yaml), but it looks like none of in-tree DTS use it.
>=20
> Fixes: ad21e3840a88 ("dt-bindings: soc: fsl: Convert rcpm to yaml format")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--qepN/n4K0ZLCBrZr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZrozSgAKCRB4tDGHoIJi
0n99AP4k+jo0HIAm3yUe34ZbYrr+lBZIK5GnzwPCmxrJygD2CgEA/9T8i4JsN8yG
WAetWYv+5wxC3MTm8AeHkGrG3HeydAo=
=RSNA
-----END PGP SIGNATURE-----

--qepN/n4K0ZLCBrZr--

