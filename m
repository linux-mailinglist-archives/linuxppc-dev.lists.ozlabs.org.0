Return-Path: <linuxppc-dev+bounces-8944-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2C1AC429B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 May 2025 17:54:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b5gLk3sbDz2xS2;
	Tue, 27 May 2025 01:54:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748274878;
	cv=none; b=ouSSt/+rfqUWiA1h23ZV6ADjNcWKay2zN2HKMyGFvVVJ3d3kBPUnSgXTmDEQ/jGDsZGutx4T7L0u9lZVJEZWXih/Gc6AFy3meKABjHKO7eLis/buW8G+d7JobS7JCxJMaHRsXXcDH28tRXWOZYbt5TwjevaP0VUJ3CzVRvksXZBXAeBwO5hhHmhICjUGZc79E9zU6+M7VzKKW7QEWkejUN4LGftxhDrxUQO+lglMqllTCQX4xNDec9TJiR+kKHt9xnSN6PTF5iHV24/prIHI/MJNmv3XDMLa4RslADqdy1DWopIoOWudMQ09rEf/jL20YrTE44+zlh1HBSJUTWq1XA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748274878; c=relaxed/relaxed;
	bh=dsI7p+fF52PYCImxD0SbLWNleOyvT7ycxlSTDj+5yB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TxVKnAEeNF/JDd+yWdaehe2dwtLNdqMuhP/kW+c2fSKt4sG9C3zkD3nKCEpEsVDP74dp1Qx/8wzwUdVGGu5BMHPT3gO2OEUtHCuetoZoMSipjZO747yTLXUd35Ku9+85z2IuJpYZNmlvpPHREjJWgjCFZY3v4wX8Fjs2l1K8cAjwNDbAeghDr2xfpokjJAWijH0dYxtsFKHNdQdidA9PUsHg2lVDuP1ZYYi/9BIfuswddwrQ9upd9XE1T4iSqTNcXWI/F/7IkcCphN5P0uY1Psn0FAqdx5K7MaS1UxECkXbSNDA+JS2Hmgom2yEt6eJQun1EUOAs+3tnBoYQs+eUfA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=At0jz7Ww; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=At0jz7Ww;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b5gLj3W4Yz2xRw
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 May 2025 01:54:37 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 119E64A5F7;
	Mon, 26 May 2025 15:54:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8225C4CEE7;
	Mon, 26 May 2025 15:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748274874;
	bh=Sb8w3t/dNkEK/ZuTtthI1LdL+b5SAvMEWX+Ac00LuF0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=At0jz7WwcMqnFvgZakL8A0pxWGIMlW2bydUYyahUxtpUkBFuVNgmKj1lm1XmX0J0D
	 PTZSrM6RfIMzuVoKpU0quaykIk4NoiXqrxLUjocGL+NEY1kacHh/a1wBQrXiGgMUYh
	 Motfld2ZVJoLi5r8R0PwVxq9af/4WrOVYFjIcADjb8BkT7nfheXoGRybGw31IvpESA
	 jVHcKwpVXzPMIITfMRoOLTBwhlQzJxQdO2TcaoiFUvNYN+d5bkyq9z8GaMuBTHOThd
	 S9+cok0e+v8vyFzz7TQ3/NT5L7V5Ti02tInZZG+kxzEWmDSeNV8eC+AMnsVKzOptNW
	 jAf7br8ko+YyQ==
Date: Mon, 26 May 2025 16:54:30 +0100
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:FREESCALE SOC DRIVERS" <linuxppc-dev@lists.ozlabs.org>,
	"moderated list:FREESCALE SOC DRIVERS" <linux-arm-kernel@lists.infradead.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: soc: add vf610 reset controller
Message-ID: <20250526-unpaid-mushy-d47196d04ad1@spud>
References: <20250522213951.506019-1-Frank.Li@nxp.com>
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
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JFc4LU9IsIE1KMjo"
Content-Disposition: inline
In-Reply-To: <20250522213951.506019-1-Frank.Li@nxp.com>
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--JFc4LU9IsIE1KMjo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 05:39:50PM -0400, Frank Li wrote:
> Add vf610 reset controller, which used to reboot system to fix below
> CHECK_DTB warnings:
>=20
> arch/arm/boot/dts/nxp/vf/vf610-bk4.dtb: /soc/bus@40000000/src@4006e000:
>     failed to match any schema with compatible: ['fsl,vf610-src', 'syscon=
']
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/soc/fsl/fsl,vf610-src.yaml       | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/fsl/fsl,vf610-s=
rc.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/soc/fsl/fsl,vf610-src.yaml=
 b/Documentation/devicetree/bindings/soc/fsl/fsl,vf610-src.yaml
> new file mode 100644
> index 0000000000000..4c92a5e4892bf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/fsl/fsl,vf610-src.yaml
> @@ -0,0 +1,46 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas//soc/fsl/fsl,vf610-src.yaml#

It's a reset controller then, shouldn't it be in /reset, not //soc?

> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale vf610 System Reset Controller
> +
> +maintainers:
> +  - Frank Li <Frank.Li@nxp.com>
> +
> +description:
> +  The System Reset Controller (SRC) generates the resets for the device.=
 The
> +  functional reset sources are programmable as either reset or interrupt=
=2E The
> +  block also generates interrupts for various device events.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - fsl,vf610-src
> +      - const: syscon
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    reset@4006e000 {

The generic node name here is reset-controller

> +        compatible =3D "fsl,vf610-src", "syscon";
> +        reg =3D <0x4006e000 0x1000>;
> +        interrupts =3D <96 IRQ_TYPE_LEVEL_HIGH>;
> +    };
> +
> --=20
> 2.34.1
>=20

--JFc4LU9IsIE1KMjo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaDSOtgAKCRB4tDGHoIJi
0jUOAQDQoc27GSHxRP7tOOEB3eThzeGn0UPkwWG1x+2578wSVQD7BI2VzjCyhPki
GriXRs9WSYTq7+FHXwaz+D9bmZa05ws=
=WC08
-----END PGP SIGNATURE-----

--JFc4LU9IsIE1KMjo--

