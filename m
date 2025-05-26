Return-Path: <linuxppc-dev+bounces-8943-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A99AAAC424E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 May 2025 17:33:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b5ftT0hrjz2xS2;
	Tue, 27 May 2025 01:33:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748273617;
	cv=none; b=WwlpsAmx3ZpDU/2TPUpIgRbFx5nJYCIdZ3hXI3U7GUwu9+9hX1UM6DBdDolZ1EWcRgYKeVvF4M8sZja+UoY9kVDRHDyfMCgouHEVYv6lgE250UiHvc7N1F0t7momvcLhnkpWaIK0mxTM2xum9PtD67eC9tFITVplK398H+PDKbl9h/fWFPQ3epmxwP8CF+HM3F8RkypKx0ulB7cRZuEmvLTu+ncnzN0H6UhI1mP6DPGyGCs3mgjTcK4ZQNJpXeQu9j9iRviKLGDJUOjTqzMfz/vQV0uzNc+zLnrROJ5pmx5nY1zfq7tfxQ2LOPqi/EwoxJsruFFbKbqSaYv4mDnh+g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748273617; c=relaxed/relaxed;
	bh=vetZnB8Rm8VfVwLOdkXrGlsQLcsEwAP0m2e4xXUlcBk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wrye8mGdTpWZ7fHOyJ8TbYNktaTVoFi3Ony0GJIz7UmpNYUT4O8SG1ZHML5Z3K8juMRmFtbQyAJwXlb9Ci1zm2mclMdbwn5rP4GnMwCD0ZjlS0BXkbA8d3lUccv6lRvduJnDpMZ88f2gizMpHTZzo/oSSABUM9ZtvK0pBR+PnlRl0YB+wi9oL+ckDGwgTKWx10kk8wUVbbhxIwxJYQDNb2FeDOCsjOILMM/LQW9JYb/1/hTZ4FbQjVDdx0pmeYZ+WYnL0gvm1eV8FBEb1VgMTgV+p3LiSmOOPFYltO0u2GCAX+j+u4ZSV352UQo64i2RgkQoxMVvUxSyeS9I1UxJVQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XpgzDHq8; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XpgzDHq8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b5ftR403Gz2xRw
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 May 2025 01:33:35 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3EA105C40C2;
	Mon, 26 May 2025 15:31:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F724C4CEE7;
	Mon, 26 May 2025 15:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748273613;
	bh=bTIiweD03lr1R1e1Y1cpiVQxuDlSy72r7CfXuZpCyb0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XpgzDHq8IAUfoS6wq7qPPTet5n4dB+fg6N5zLp0bkDtKEbqKiCKvQmdUge6ThtwS4
	 g+C5MVkQ+pGzfoPXP0o/Tkn6rBSAOWOoA2UWKgq6Dki7MlIoOxqno7gU81qtidKQsV
	 Lu0eNkLAYn1V+4WYuZn/XdbMRUONGgzhXJetBx6RAXmjfjMik14xR/A4VdqqXxLiZv
	 IULYHBNxYnMoXQv+BLfk96/Sc0DmNGpIaQOtYQksJDLUiV7j1aViQS3np3cpBZ70za
	 Nsb1bW5Fn4uvMFahzAwGKyJO/go310X6uYZ/fxNxj8Fe18s8P/ibtg6AYuCjvW55Zp
	 Va4NqQE45lWzA==
Date: Mon, 26 May 2025 16:33:28 +0100
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:FREESCALE SOC DRIVERS" <linuxppc-dev@lists.ozlabs.org>,
	"moderated list:FREESCALE SOC DRIVERS" <linux-arm-kernel@lists.infradead.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] dt-bindings: soc: Add fsl,imx23-digctl.yaml for
 i.MX23 and i.MX28
Message-ID: <20250526-corset-villain-8b72aefeba75@spud>
References: <20250523204524.573028-1-Frank.Li@nxp.com>
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
	protocol="application/pgp-signature"; boundary="0HV2Ae0Z+B5ulyZ6"
Content-Disposition: inline
In-Reply-To: <20250523204524.573028-1-Frank.Li@nxp.com>
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--0HV2Ae0Z+B5ulyZ6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 23, 2025 at 04:45:23PM -0400, Frank Li wrote:
> Add fsl,imx23-digctl.yaml for i.MX23 and i.MX28 to fix below CHECK_DTB
> warning:
>=20
> arch/arm/boot/dts/nxp/mxs/imx23-sansa.dtb: /apb@80000000/apbh-bus@8000000=
0/digctl@8001c000:
>     failed to match any schema with compatible: ['fsl,imx23-digctl']
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/soc/fsl/fsl,imx23-digctl.yaml    | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/fsl/fsl,imx23-d=
igctl.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/soc/fsl/fsl,imx23-digctl.y=
aml b/Documentation/devicetree/bindings/soc/fsl/fsl,imx23-digctl.yaml
> new file mode 100644
> index 0000000000000..47f92f763bfa3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/fsl/fsl,imx23-digctl.yaml
> @@ -0,0 +1,41 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas//soc/fsl/fsl,imx23-digctl.yaml#
                                     ^^ I assume it makes no difference,
but you got a double / here.

> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale mxs digctrl for i.MX23/i.MX28

I have no idea reading this what a "digctrl" is. I think you should add
a description briefly mentioning what it does.

> +
> +maintainers:
> +  - Frank Li <Frank.Li@nxp.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - fsl,imx28-digctl
> +          - const: fsl,imx23-digctl
> +      - const: fsl,imx23-digctl
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
> +    digctl@8001c000 {
> +        compatible =3D "fsl,imx28-digctl", "fsl,imx23-digctl";
> +        reg =3D <0x8001c000 0x2000>;
> +        interrupts =3D <89>;
> +    };
> +
> --=20
> 2.34.1
>=20

--0HV2Ae0Z+B5ulyZ6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaDSJxwAKCRB4tDGHoIJi
0gCyAP9LAdE1TGf4om1fs4XgX2jkfTuBjGIU5v+EiwczA9egZwD+L6HUreQw17x+
C0TNwI+EWaCw4LyMxszPbEdFd9lA1g4=
=cgID
-----END PGP SIGNATURE-----

--0HV2Ae0Z+B5ulyZ6--

