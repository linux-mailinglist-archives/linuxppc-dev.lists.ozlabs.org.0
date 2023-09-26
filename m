Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E927AEDAE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Sep 2023 15:07:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LsTkHnL+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rw0QG36TQz3ccD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Sep 2023 23:07:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LsTkHnL+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rw0PQ5wXmz3c2V
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Sep 2023 23:06:34 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 94D4761491;
	Tue, 26 Sep 2023 13:06:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05736C433C8;
	Tue, 26 Sep 2023 13:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695733591;
	bh=nj7Pno7gxKRpYeFnO5r1L7tRE2na9od26GJPA9cmoRY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LsTkHnL+6Gku6jK1CrWtDSHYgBlZFoUkeW85VJlnCA2VJfgl+VdLRc1KdBwA3ddze
	 GnvDYhB+gobdJsh2F9tLYu6jFTKL4t9FvI+d2NuWIJNOj4OeMtD0FfPIoQRCm4PY7l
	 AeNDe2d/BANbs941hh7vjo32zrGFxelZzKkzbUlnVQyD8FJt641HPC441YFKrF9A7K
	 c0EeNsL7xLQG6A72wQ2zRk3ujrUCH86Tv2yw0GQ2OmJKXKe9DiAZMz6RcSkO5HAhfV
	 s7wOluArGcS6ljG5riOpXja14UG0qj2MQTQPlq1Oi02n+8xZkVUlKVQky0P4UnSz/B
	 baLx3rZxaRD0w==
Date: Tue, 26 Sep 2023 14:06:25 +0100
From: Conor Dooley <conor@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] ASoC: dt-bindings: Add missing
 (unevaluated|additional)Properties on child node schemas
Message-ID: <20230926-freewill-treachery-81fb636e537e@spud>
References: <20230925220947.2031536-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pRkokaTksUJ87J4L"
Content-Disposition: inline
In-Reply-To: <20230925220947.2031536-1-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Herve Codina <herve.codina@bootlin.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Liam Girdwood <lgirdwood@gmail.com>, Shenghao Ding <shenghao-ding@ti.com>, Damien Horsley <Damien.Horsley@imgtec.com>, Kevin Lu <kevin-lu@ti.com>, Mark Brown <broonie@kernel.org>, David Rau <David.Rau.opensource@dm.renesas.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, alsa-devel@alsa-project.org, Baojun Xu <baojun.xu@ti.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--pRkokaTksUJ87J4L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 25, 2023 at 05:09:28PM -0500, Rob Herring wrote:
> Just as unevaluatedProperties or additionalProperties are required at
> the top level of schemas, they should (and will) also be required for
> child node schemas. That ensures only documented properties are
> present for any node.
>=20
> Add unevaluatedProperties or additionalProperties as appropriate.
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  Documentation/devicetree/bindings/sound/dialog,da7219.yaml | 1 +
>  Documentation/devicetree/bindings/sound/fsl,qmc-audio.yaml | 1 +
>  Documentation/devicetree/bindings/sound/ti,pcm3168a.yaml   | 1 +
>  3 files changed, 3 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/sound/dialog,da7219.yaml b=
/Documentation/devicetree/bindings/sound/dialog,da7219.yaml
> index eb7d219e2c86..19137abdba3e 100644
> --- a/Documentation/devicetree/bindings/sound/dialog,da7219.yaml
> +++ b/Documentation/devicetree/bindings/sound/dialog,da7219.yaml
> @@ -89,6 +89,7 @@ properties:
> =20
>    da7219_aad:
>      type: object
> +    additionalProperties: false
>      description:
>        Configuration of advanced accessory detection.
>      properties:
> diff --git a/Documentation/devicetree/bindings/sound/fsl,qmc-audio.yaml b=
/Documentation/devicetree/bindings/sound/fsl,qmc-audio.yaml
> index ff5cd9241941..b522ed7dcc51 100644
> --- a/Documentation/devicetree/bindings/sound/fsl,qmc-audio.yaml
> +++ b/Documentation/devicetree/bindings/sound/fsl,qmc-audio.yaml
> @@ -33,6 +33,7 @@ patternProperties:
>      description:
>        A DAI managed by this controller
>      type: object
> +    additionalProperties: false
> =20
>      properties:
>        reg:
> diff --git a/Documentation/devicetree/bindings/sound/ti,pcm3168a.yaml b/D=
ocumentation/devicetree/bindings/sound/ti,pcm3168a.yaml
> index b6a4360ab845..0b4f003989a4 100644
> --- a/Documentation/devicetree/bindings/sound/ti,pcm3168a.yaml
> +++ b/Documentation/devicetree/bindings/sound/ti,pcm3168a.yaml
> @@ -60,6 +60,7 @@ properties:
> =20
>    ports:
>      $ref: audio-graph-port.yaml#/definitions/port-base
> +    unevaluatedProperties: false
>      properties:
>        port@0:
>          $ref: audio-graph-port.yaml#
> --=20
> 2.40.1
>=20

--pRkokaTksUJ87J4L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZRLXUQAKCRB4tDGHoIJi
0pghAP9+4AC2NOyTDvOOxue9O55ySqsVJ7XyGO5vj0hDxz+4vAD+JR0pthP9HqDu
s11/vLsHj4O2ke1qIBfFm69Uq5wWhgo=
=vDBg
-----END PGP SIGNATURE-----

--pRkokaTksUJ87J4L--
