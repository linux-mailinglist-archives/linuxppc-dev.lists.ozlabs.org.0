Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5864E829821
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jan 2024 11:57:22 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KAUNf7aJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T94WC5bbKz3bfS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jan 2024 21:57:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KAUNf7aJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T94VN3DGMz2xXY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jan 2024 21:56:28 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 443C2CE1C0C;
	Wed, 10 Jan 2024 10:56:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2CE8C433C7;
	Wed, 10 Jan 2024 10:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704884180;
	bh=xkaWrvfIfP7fZ7XhBOMVv7Q1Juvm5n5GKRa8e8j5ynQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KAUNf7aJLFZZQ90MjJVa5wr0odvvVCP5rWR+DTYfKeWU38ePHYogD6u6vEMzXM+pU
	 PVHcAr3qi6SBD4pN8ssWUab2Ap1A2A/3vMgDMtSQvBVYcVMlMFz9hayZ9r9C6Fdp0q
	 vpLRh4m99k2bMFdc4NkhQijRAkcUeuv4ojSEX8vN2jvk4D7iJAkaFWejbtMIaJW2Cb
	 EfjdbwC9LpctUoW6EoXHkVB0YvfbqF8pNJ12lxbEfcfOVlU5SL/vXc3HqhRWF99Mug
	 4Ne4eKP57irYVyFcgPjgbZ8n3/ZfSXSUQXHx7GuB5C2CHNw231DBMmVFvHZHMWhH+D
	 XE036xOJQDtoQ==
Date: Wed, 10 Jan 2024 10:56:14 +0000
From: Conor Dooley <conor@kernel.org>
To: Chancel Liu <chancel.liu@nxp.com>
Subject: Re: [PATCH 3/3] ASoC: dt-bindings: fsl,micfil: Add compatible string
 for i.MX95 platform
Message-ID: <20240110-petty-tabasco-e8d86a751dea@spud>
References: <20240109075551.870001-1-chancel.liu@nxp.com>
 <20240109075551.870001-4-chancel.liu@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uKeeFUVPvFzJGMuc"
Content-Disposition: inline
In-Reply-To: <20240109075551.870001-4-chancel.liu@nxp.com>
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linuxppc-dev@lists.ozlabs.org, alsa-devel@alsa-project.org, Xiubo.Lee@gmail.com, festevam@gmail.com, tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org, perex@perex.cz, nicoleotsuka@gmail.com, broonie@kernel.org, linux-sound@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, shengjiu.wang@gmail.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--uKeeFUVPvFzJGMuc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 09, 2024 at 04:55:51PM +0900, Chancel Liu wrote:
> Add compatible string "fsl,imx95-micfil" for i.MX95 platform.
>=20
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> ---
>  .../devicetree/bindings/sound/fsl,micfil.yaml     | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/sound/fsl,micfil.yaml b/Do=
cumentation/devicetree/bindings/sound/fsl,micfil.yaml
> index b7e605835639..f0d3d11d07d2 100644
> --- a/Documentation/devicetree/bindings/sound/fsl,micfil.yaml
> +++ b/Documentation/devicetree/bindings/sound/fsl,micfil.yaml
> @@ -15,10 +15,17 @@ description: |
> =20
>  properties:
>    compatible:
> -    enum:
> -      - fsl,imx8mm-micfil
> -      - fsl,imx8mp-micfil
> -      - fsl,imx93-micfil
> +    oneOf:
> +      - items:
> +          - enum:
> +              - fsl,imx95-micfil
> +          - const: fsl,imx93-micfil
> +

> +      - items:

This items is not needed, as the only item in the list is the enum.
You can just do
properties:
  compatible:
    oneOf:
      - items:
          - enum:
              - fsl,imx95-micfil
          - const: fsl,imx93-micfil

      - enum:
          - fsl,imx8mm-micfil
          - fsl,imx8mp-micfil
          - fsl,imx93-micfil

Cheers,
Conor.

> +          - enum:
> +              - fsl,imx8mm-micfil
> +              - fsl,imx8mp-micfil
> +              - fsl,imx93-micfil
> =20
>    reg:
>      maxItems: 1
> --=20
> 2.42.0
>=20

--uKeeFUVPvFzJGMuc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZZ53zgAKCRB4tDGHoIJi
0tn/AP9dcugakMRKRZG/ezh4tXsqNC4Q32/3HPFQMtSa/xVWlwD+JAQQ5q83Q6Xt
RFG9B3BLubQbp2zSeeMNkMv2QI2Hiwg=
=JTpT
-----END PGP SIGNATURE-----

--uKeeFUVPvFzJGMuc--
