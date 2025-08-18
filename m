Return-Path: <linuxppc-dev+bounces-11098-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6D2B2AEE6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Aug 2025 19:06:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c5Jz52M8Hz2xBV;
	Tue, 19 Aug 2025 03:06:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755536801;
	cv=none; b=kZeMD4/mtz6u4V87ao+ppZOFS/biwmADExPOgTw8eEtKO1oTyAo0wD6l4Vdiz38mirGGgEjRhzeuax3joBmqvEUZWR4DxryW9zPGWpJWj+a16kKckugUOpWA8E5T2hW89cvywgGUafsYL0C2KIGfTnwmFD6yx0unPXUxC9c/58RIWUqO7jRfg6aiNxLAAuvMofldnJhjN+vS8WHr1uoFUgtel1pBCR1cAc8t4/jmvuOWJWj7Ix/jqI5SgRyMlORC9VTrppAoNvTICqiNFNXj6G7/nrcLw6sTEFqRRMkhqKHhb91PC4LM0GCF10bCACbycGRz+gnBIX0bh264YACvFg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755536801; c=relaxed/relaxed;
	bh=fveELrcwPJ1qHSHr3I0l8L1ROl2qKoK8Ug6HcjVhzD4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LY5kY/zS0gpw3U3TN4BLwelf0pFaWU9q/S4zNPcx5VLsdHpjd1R/ULH+sWZ9Bp61M8GpGfylyLLn2ClWawq/haMf6ym64sCNm1v42qDBEwn8s17V5MQSIupsUKNc7H81vzcGR3uliuwxSwG5uL5Y2ehDayqHs9uBRwP+XFISzJR4n3YtJrvn9rGup8Xubu7NY0pOa+K/eo/lI72Gr46VPXIk6zt75JRALO20LMWZcZHakYR4OFaTwtktLpQXTMSIdKhhxyayaNavz6I7V8tyPWmskycbdkpsS0eHUwM6CO4+Di64WIlH2t2Qpcyd4D2eh05Yt4efXQteMXjsgxaCrg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=W5hYa9v0; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=W5hYa9v0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c5Jz41GDfz3cdD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Aug 2025 03:06:40 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F2EFB600AE;
	Mon, 18 Aug 2025 17:06:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55CBFC4CEEB;
	Mon, 18 Aug 2025 17:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755536797;
	bh=zoBUx4qB8f1MLgIpXLlf3KIgZIdGo3Y5op4r8llhgtY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W5hYa9v0xq5xmvg8i9Emrk6I/y6gBd9JYT0E5FB9urMyr3jczGLdQqKiKkBd/FRY9
	 eaML0Gae867cQbqXy10OpvnaHV0b4q21Bfajl7rxm59Qz4uJMk76UqUS9iFTd9clmu
	 0t5X7aTAehklAzN+9udM+QgplGHW3eOqQtHRTyZnEaxm6dJjS13PFtFXjU8/z58V0N
	 g4CDXsp3H99cV/7VQ7Ys/97yBMnIVRDPxo4VQstjBgk7X7E3najweMFrFBT8d8YD+x
	 hZT4rXfMEhUmSoI0LTqbQmpW0wf8ELH1RNrYz40KQUsSTbmFgy0zNE3SCeqkKx47di
	 bncedGnykODrA==
Date: Mon, 18 Aug 2025 18:06:33 +0100
From: Conor Dooley <conor@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Qiang Zhao <qiang.zhao@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 5/5] dt-bindings: soc: fsl: qe: Add an interrupt
 controller for QUICC Engine Ports
Message-ID: <20250818-babbling-studio-81a974afc169@spud>
References: <cover.1755506608.git.christophe.leroy@csgroup.eu>
 <be8952a26d7a8d55ff96e4547f6c107094988220.1755506608.git.christophe.leroy@csgroup.eu>
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
	protocol="application/pgp-signature"; boundary="r9pc0nvx4F9Bp7Ya"
Content-Disposition: inline
In-Reply-To: <be8952a26d7a8d55ff96e4547f6c107094988220.1755506608.git.christophe.leroy@csgroup.eu>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--r9pc0nvx4F9Bp7Ya
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 18, 2025 at 10:45:58AM +0200, Christophe Leroy wrote:
> The QUICC Engine provides interrupts for a few I/O ports. This is
> handled via a separate interrupt ID and managed via a triplet of
> dedicated registers hosted by the SoC.
>=20
> Implement an interrupt driver for it for that those IRQs can then
> be linked to the related GPIOs.
>=20
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
> v2: Fixed problems reported by 'make dt_binding_check'
> ---
>  .../soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml       | 58 +++++++++++++++++++
>  1 file changed, 58 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,=
qe-ports-ic.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-port=
s-ic.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-i=
c.yaml
> new file mode 100644
> index 000000000000..b7c74c66347c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.ya=
ml
> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale QUICC Engine I/O Ports Interrupt Controller
> +
> +maintainers:
> +  - Christophe Leroy <christophe.leroy@csgroup.eu>
> +
> +description:
> +  Interrupt controller for the QUICC Engine I/O ports found on some Free=
scale/NXP PowerQUICC and QorIQ SoCs.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,mpc8323-qe-ports-ic
> +      - fsl,mpc8360-qe-ports-ic
> +      - fsl,mpc8568-qe-ports-ic
> +
> +  reg:
> +    maxItems: 1
> +    description: Base address and size of the QE I/O Ports Interrupt Con=
troller registers.
> +
> +  interrupt-controller: true
> +
> +  '#address-cells':
> +    const: 0
> +
> +  '#interrupt-cells':
> +    const: 1
> +
> +  interrupts:
> +    maxItems: 1
> +    description: Interrupt line to which the QE I/O Ports controller is =
connected.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupt-controller
> +  - '#address-cells'
> +  - '#interrupt-cells'
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    interrupt-controller@c00 {
> +      interrupt-controller;
> +      compatible =3D "fsl,mpc8323-qe-ports-ic";
> +      #address-cells =3D <0>;
> +      #interrupt-cells =3D <1>;
> +      reg =3D <0xc00 0x18>;

Your property order here is kinda wacky, please stick to the documented
order in dts-coding-style.rst.

Otherwise, this seems okay although I think the descriptions for
single-item properties could be removed. With the ordering fixed:
Acked-by: Conor Dooley <conor.dooley@microchip.com>

> +      interrupts =3D <74 0x8>;
> +      interrupt-parent =3D <&ipic>;
> +    };
> --=20
> 2.49.0
>=20

--r9pc0nvx4F9Bp7Ya
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaKNdmQAKCRB4tDGHoIJi
0lkOAQD+gYbFPysEZ7FMHkPKOTKu3lQkiuVAYqWebn9qZGxrBQD/cDOIpOlHmXBN
PZXajWao16FHS+SHJLjv/KNc7P6fcAU=
=ZlEM
-----END PGP SIGNATURE-----

--r9pc0nvx4F9Bp7Ya--

