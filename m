Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7B18C139B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2024 19:15:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qNltURwB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VZzDG06RCz30Np
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2024 03:15:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qNltURwB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VZzCQ08Tvz30Np
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 May 2024 03:14:41 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6C33661D5A;
	Thu,  9 May 2024 17:14:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D799FC116B1;
	Thu,  9 May 2024 17:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715274878;
	bh=YwUKTYOpoxA/NOjHV7A/q7cg5e41+QOvCr4wGh3um4g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qNltURwBHZ0ugcWbLrUYJc6RkDUcNQgiYSfZKjEwL9+mHhuhW146bkl+HHiyqOY7D
	 wNNuItMLZg9XcI1JEb6/M6vYSge5p3d/Jqj/OmYtbmVYnvKDIu/qETs5sRmCps6IOQ
	 4LZSSh8xcEqDzkYGMQlizUe3dBHJGeJ27fyMc2GPvTmQUB2fR1FDljGOCifTUgm44z
	 tODVfJsI9WuQ5oCQ1S/mdwWcfvfMNNaHEiYnNaps8KLZaGtfuR9Xjg2wUSON1ihOC1
	 qDjHDw8Jt0BWhP/UqDK3LVzv0+Cy99DGUte0fmFAja8ZXPpS+oNlfndpyWeqf3uBUo
	 7ppc6G/TeWG3A==
Date: Thu, 9 May 2024 18:14:32 +0100
From: Conor Dooley <conor@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH 2/4] ASoC: dt-bindings: fsl,xcvr: Add two PLL clock
 sources
Message-ID: <20240509-repurpose-dumping-156b57c25960@spud>
References: <1715223460-32662-1-git-send-email-shengjiu.wang@nxp.com>
 <1715223460-32662-3-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9OB7iJL8uyGYmSbm"
Content-Disposition: inline
In-Reply-To: <1715223460-32662-3-git-send-email-shengjiu.wang@nxp.com>
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


--9OB7iJL8uyGYmSbm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 09, 2024 at 10:57:38AM +0800, Shengjiu Wang wrote:
> Add two PLL clock sources, they are the parent clocks of the root clock
> one is for 8kHz series rates, named as 'pll8k', another one is for
> 11kHz series rates, named as 'pll11k'. They are optional clocks,
> if there are such clocks, then the driver can switch between them to
> support more accurate sample rates.
>=20
> As 'pll8k' and 'pll11k' are optional, then add 'minItems: 4' for
> clocks and clock-names properties.

Despite the detail given here in the commit message, the series this is
appearing in and one of the driver patches makes me a bit "suspicious"
of this patch. Are these newly added clocks available on all devices, or
just on the imx95, or?

Thanks,
Conor.

>=20
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  Documentation/devicetree/bindings/sound/fsl,xcvr.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml b/Docu=
mentation/devicetree/bindings/sound/fsl,xcvr.yaml
> index 1c74a32def09..c4660faed404 100644
> --- a/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
> +++ b/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
> @@ -50,6 +50,9 @@ properties:
>        - description: PHY clock
>        - description: SPBA clock
>        - description: PLL clock
> +      - description: PLL clock source for 8kHz series
> +      - description: PLL clock source for 11kHz series
> +    minItems: 4
> =20
>    clock-names:
>      items:
> @@ -57,6 +60,9 @@ properties:
>        - const: phy
>        - const: spba
>        - const: pll_ipg
> +      - const: pll8k
> +      - const: pll11k
> +    minItems: 4
> =20
>    dmas:
>      items:
> --=20
> 2.34.1
>=20

--9OB7iJL8uyGYmSbm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZj0EeAAKCRB4tDGHoIJi
0kPzAP43Zn5AesCX1kKOSIjtrW5Vpt8hIHrIlOUZhE9kMqS8CgD+MljoXShCv6Tw
G/iLAeB3RppsSsV+7vuOr03Tr0FXKAw=
=oPv2
-----END PGP SIGNATURE-----

--9OB7iJL8uyGYmSbm--
