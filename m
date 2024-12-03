Return-Path: <linuxppc-dev+bounces-3741-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E5C9E280B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2024 17:49:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2mpk3D86z30HH;
	Wed,  4 Dec 2024 03:49:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733244590;
	cv=none; b=fIuRJ0bOBYK/al82TO+vfT7fdgspOhJH44PvjMBWYwj5dCkpNSQZl1IfPJURSyKzn31U00crEj+8mReKkoDNX0umC0bgIa0dc8yPrkRw4sFT6zvpx2J0xNMWOqy4CIFVrK6/gR3A73hGDoWMkxyW7mRaOYDVWpUpVKjXr4jnGlMHsAz5dCETCfNWxpHRCevxlA7HBsBdZfU1Bjaeb2SHiQpOta6tPtE95TE0MbweRhnagbBArgn6u4ow/LLDDLJ5Yq6kq2d4qC1eD1HmryNvv3N9kof+Bvh7p6xT3QJb7kdRZxCKjW/Zk3oBFbsvTuOXDh8VUdRKPF1IaO25MJp2RA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733244590; c=relaxed/relaxed;
	bh=c8yKeFLr7GK2j1GC41CvEEkFDcayC545MbavQqa2ETY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gWO62xJjkOGSwVvaCwgDrvU3QXTAn+PkaapeuryMGZINXepyXd86hcByNhRh1vxB50ZTg7cU+KKcBd1O8yAEcFUQoHsXSyq9NseIpEp7FoWu3Pf4nF2uyn3F4t5oxPfjOqnq5QQ8eX6iRhSg1ogXH80NZ6y2SLx433kAWVf6os4ikNLjz0Q7Hl+Mp5+dCzCBoAaEXbiAG81LDxkdKxAbk9ai5SjnKzVobk+rySwPgJ+CKUsydUo3RYVGcqXl2v804lUcu1pqthNvYZQkg1Vy1V5JgJZkWATTLpKqXumGJ3LSc/IT2TFwQKRH/uwDmNwK+cqpG866m9aLnORFD0ECUg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uJo1JZl2; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uJo1JZl2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2mph3Wp4z30DX
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Dec 2024 03:49:48 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2E7925C5FD8;
	Tue,  3 Dec 2024 16:49:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5CEBC4CECF;
	Tue,  3 Dec 2024 16:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733244583;
	bh=1NqLuuLFwHm0v/yK7wKaDo26NhV34tP1XmqEcIsx8to=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uJo1JZl25KEUEqfUZcLBB/tMBA0DqTkqNW9sWubx4kv7Y3pfx/lt5a+4iT+XQL0W5
	 Txc43BClWHT6BKKuL7HBYTCMYPXmMS7V/t6cmHshp7VtgQnN9cAbB0LHUZCswVGJdc
	 DKHlIUuRyXVLaOQJbpL0q6rHr6D89fQVmdPLC61hw3lsn1M1x4dlSb+hV5S6sxRry3
	 dSuHczvq1DBSm+SCu7n4Y6K0QiEcqdGQo5ECPrRLkbwAiPNPYrO0tVEOabwTXRvjEs
	 3C1LyxcAoye0/25Q7rKK6tt5+i3LvrKa24QHpz300wIipXPYveiVEftvQvo6EzBScm
	 u870mSPB8nrlg==
Date: Tue, 3 Dec 2024 16:49:39 +0000
From: Conor Dooley <conor@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: soc: fsl: cpm_qe: Limit matching to nodes
 with "fsl,qe"
Message-ID: <20241203-egotistic-certainly-116f38bd39b6@spud>
References: <20241202045757.39244-1-wenst@chromium.org>
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
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5+M0C7v+8zXCbXJ/"
Content-Disposition: inline
In-Reply-To: <20241202045757.39244-1-wenst@chromium.org>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


--5+M0C7v+8zXCbXJ/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 02, 2024 at 12:57:55PM +0800, Chen-Yu Tsai wrote:
> Otherwise the binding matches against random nodes with "simple-bus"
> giving out all kinds of invalid warnings:
>=20
>     $ make CHECK_DTBS=3Dy mediatek/mt8188-evb.dtb
>       SYNC    include/config/auto.conf.cmd
>       UPD     include/config/kernel.release
>       SCHEMA  Documentation/devicetree/bindings/processed-schema.json
>       DTC [C] arch/arm64/boot/dts/mediatek/mt8188-evb.dtb
>     arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: soc: compatible:0: 'fsl,=
qe' was expected
> 	    from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe=
=2Eyaml#
>     arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: soc: compatible: ['simpl=
e-bus'] is too short
> 	    from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe=
=2Eyaml#
>     arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: soc: interrupt-controlle=
r@c000000:compatible:0: 'fsl,qe-ic' was expected
> 	    from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe=
=2Eyaml#
>     arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: soc: interrupt-controlle=
r@c000000:reg: [[0, 201326592, 0, 262144], [0, 201588736, 0, 2097152]] is t=
oo long
> 	    from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe=
=2Eyaml#
>     arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: soc: interrupt-controlle=
r@c000000:#interrupt-cells:0:0: 1 was expected
> 	    from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe=
=2Eyaml#
>     arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: soc: interrupt-controlle=
r@c000000: '#redistributor-regions', 'ppi-partitions' do not match any of t=
he regexes: 'pinctrl-[0-9]+'
> 	    from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe=
=2Eyaml#
>     arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: soc: 'reg' is a required=
 property
> 	    from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe=
=2Eyaml#
>     arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: soc: 'bus-frequency' is =
a required property
> 	    from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe=
=2Eyaml#

I'm curious why this is only coming up now, Rob applied this apparently
in July.

>=20
> Fixes: ecbfc6ff94a2 ("dt-bindings: soc: fsl: cpm_qe: convert to yaml form=
at")
> Cc: Frank Li <Frank.Li@nxp.com>
> Cc: <stable@vger.kernel.org> # v6.11+
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  .../devicetree/bindings/soc/fsl/cpm_qe/fsl,qe.yaml        | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe.yaml=
 b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe.yaml
> index 89cdf5e1d0a8..9e07a2c4d05b 100644
> --- a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe.yaml
> +++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe.yaml
> @@ -21,6 +21,14 @@ description: |
>    The description below applies to the qe of MPC8360 and
>    more nodes and properties would be extended in the future.
> =20
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        const: fsl,qe
> +  required:
> +    - compatible
> +
>  properties:
>    compatible:
>      items:
> --=20
> 2.47.0.338.g60cca15819-goog
>=20

--5+M0C7v+8zXCbXJ/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ082owAKCRB4tDGHoIJi
0s0HAQDAWUaDFTMODECrGoMpk/JQ6X3sb4Uok6Yl2lbO7EaJUwEAkJy4Xvisf0FS
fWsESM6zpR0CkagNmMJ9ezdGDBwYAAE=
=ZvIG
-----END PGP SIGNATURE-----

--5+M0C7v+8zXCbXJ/--

