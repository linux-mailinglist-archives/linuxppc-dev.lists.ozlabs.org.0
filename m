Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E67638C1391
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2024 19:12:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VTGvIKV3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VZz8Q36L1z3cYJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2024 03:12:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VTGvIKV3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VZz7d6tDvz30Wl
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 May 2024 03:11:25 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C4E5161CF1;
	Thu,  9 May 2024 17:11:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C539C116B1;
	Thu,  9 May 2024 17:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715274678;
	bh=YA/u5mUcOxyTQK4E6Daw3gCqDJqZ+z0mf7v0UCWoLp0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VTGvIKV3Q1U4y5xPkrsYLHkZEVfxKI5NSpA/MjGFH9qYIXb8ISw4VmwSYbRo3Wbpt
	 AUc17UJ2ENNqqBx/mzOFCwj4TDG9E5t499JPnvS2tgX6zKQzzyhspPT8OquDgx5LGL
	 ze8dMWHERjQ+aLj+EhFYiM5W0kjPL1KXaK50LQ09aUM1BSrKZIdnS5DfBX7E3jaeSH
	 iZykHvXUCEsYdzCQgK3pG2gzcqvnMmxVb/aWTx2n2kAtKvMQ7UiZ1JHwbt4xnA78Xl
	 f5DLkuB36V41YqYYP9cm4BriMD1pSpZN6rnhWZH7O9ldn3RRwdUsWH2x2dlVJA+Au2
	 ecUhVXGcZxHnA==
Date: Thu, 9 May 2024 18:11:13 +0100
From: Conor Dooley <conor@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH 1/4] ASoC: dt-bindings: fsl,xcvr: Add compatible string
 for i.MX95
Message-ID: <20240509-phonics-wound-58d3435165f0@spud>
References: <1715223460-32662-1-git-send-email-shengjiu.wang@nxp.com>
 <1715223460-32662-2-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="o/G3P2Zf+UnkTwok"
Content-Disposition: inline
In-Reply-To: <1715223460-32662-2-git-send-email-shengjiu.wang@nxp.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linuxppc-dev@lists.ozlabs.org, alsa-devel@alsa-project.org, Xiubo.Lee@gmail.com, festevam@gmail.com, tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org, linux-kernel@vger.kernel.org, nicoleotsuka@gmail.com, broonie@kernel.org, linux-sound@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, perex@perex.cz, shengjiu.wang@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--o/G3P2Zf+UnkTwok
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 09, 2024 at 10:57:37AM +0800, Shengjiu Wang wrote:
> Add compatible string "fsl,imx95-xcvr" for i.MX95 platform.

That's apparent from the diff. Why is it not compatible with existing
devices?

Cheers,
Conor.

>=20
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  Documentation/devicetree/bindings/sound/fsl,xcvr.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml b/Docu=
mentation/devicetree/bindings/sound/fsl,xcvr.yaml
> index 0eb0c1ba8710..1c74a32def09 100644
> --- a/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
> +++ b/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
> @@ -22,6 +22,7 @@ properties:
>      enum:
>        - fsl,imx8mp-xcvr
>        - fsl,imx93-xcvr
> +      - fsl,imx95-xcvr
> =20
>    reg:
>      items:
> --=20
> 2.34.1
>=20

--o/G3P2Zf+UnkTwok
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZj0DsQAKCRB4tDGHoIJi
0imKAQCYoCen/pDUqt0eydvNAg6kYtqxHG4j0dkiPPhCBQDTugD9ETg2kVQ8oDL8
pD2YGMysprBxoLeYVTWRCjCN8LvUCwU=
=iBRc
-----END PGP SIGNATURE-----

--o/G3P2Zf+UnkTwok--
