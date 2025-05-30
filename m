Return-Path: <linuxppc-dev+bounces-9041-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 55801AC927D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 May 2025 17:23:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b86T769PSz2xpl;
	Sat, 31 May 2025 01:23:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748618619;
	cv=none; b=BY4H5OEYxmiB1pFwsr5VucJJzpHS+0Vhs6KPDNLjZtdLkOZrzhV8ZNMeAXOst3lKCFN4iHLR3kWT5NJXI8bJaCFrOSdcBLgP+ficZVs22inmacRevSh5hmZItShhKarHDfHEytM9Pt8C2FkvN1Yhr8mruWs71o41ZFxy9NkkXHBO9JZtBVd/p+OoOlhLn2hMTowktfMEWXNOTQkk9dfby9d/yRD91TMRTj0LUzq5CGNUzKDM+odPsomq57bGaoC04ZkTCNNwHdjeQILKII4YMJsln79NjL6dgQkNnG3he+jHpU3GFRSpu2rjiTZsgiVrh+P3ABy0xa5swKRUgw2uKg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748618619; c=relaxed/relaxed;
	bh=agKHQjxfZDqRcl11omTUAcYR28VqjSi2A39hS2TD8qk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Je+4FQXqbNBrU8v9d2tYMX0X4xzIKadL/xralVHZyVnFHyuATMq3TIT4phxkVxGHInTv/poet9nbPfj7uPgrk4AjcN/u6P8696dJwif90uD5YelLhv3iVX01b9bN+qsiAPtdZhUUCZlWGegs3JOFrVRpt49jq28W4Ijg9H1CDUyLg3W7RILOYqwp+H6IvDn+gALka2qlLS+Vi6vpcPRtFoDQ3wDPfcx1f7n9veCqFiO86mlfU3zrLoQWJOsxNcsVBR0syLgpEodw7/mE3OefjDD+VAZZZA/p3TjUMIWld4MiCvteZKF89epaLHvJtNY2kavEVWTY7FiI6tGfT7ZRwQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KrfVTlxC; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KrfVTlxC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b86T66lNCz2xjv
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 May 2025 01:23:38 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DBDFEA4F893;
	Fri, 30 May 2025 15:23:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 905DAC4CEE9;
	Fri, 30 May 2025 15:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748618615;
	bh=LWFWoggGe46xQ5RQp18Vq6QjeHfIxauE+ObN41PB7bQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KrfVTlxCx05DUwfOjqI/Y+5oFEqvXplJaFVRb0USAmPukce0NtMccV3wPk95cxeDU
	 bC6SNp+9u2uDpjLj40UgXQ3mlgMKcthZWGBctAe5wBn/owpHTXBs6jQs+QVrB3PjE8
	 oIofx9Icjcm5lJTPLPCfxMctJGh2waqT554jPb/WyXPHZpwGuvKFtIlWS+75kbw1Kf
	 3Um/EaSao1rpeCl/teCkz7VPqIx1b/bzTwPNjpWbnKWnAZPObr8aQCyHZWHgXIbNl0
	 oBxoiaUMqvBevfH6vUUmFLasn5VTzso3O/hrfPWpBO/X5qix1fy24IS/GFFMArfVuo
	 It81f7ltRlxVQ==
Date: Fri, 30 May 2025 16:23:31 +0100
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:FREESCALE SOC DRIVERS" <linuxppc-dev@lists.ozlabs.org>,
	"moderated list:FREESCALE SOC DRIVERS" <linux-arm-kernel@lists.infradead.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: soc: add vf610 reset controller
Message-ID: <20250530-construct-library-64ec665a6fea@spud>
References: <20250522213951.506019-1-Frank.Li@nxp.com>
 <20250526-unpaid-mushy-d47196d04ad1@spud>
 <aDcvP975apg/dhQz@lizhi-Precision-Tower-5810>
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
	protocol="application/pgp-signature"; boundary="ldWk4wJW7G7nxwGc"
Content-Disposition: inline
In-Reply-To: <aDcvP975apg/dhQz@lizhi-Precision-Tower-5810>
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--ldWk4wJW7G7nxwGc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 11:43:59AM -0400, Frank Li wrote:
> On Mon, May 26, 2025 at 04:54:30PM +0100, Conor Dooley wrote:
> > On Thu, May 22, 2025 at 05:39:50PM -0400, Frank Li wrote:
> > > Add vf610 reset controller, which used to reboot system to fix below
> > > CHECK_DTB warnings:
> > >
> > > arch/arm/boot/dts/nxp/vf/vf610-bk4.dtb: /soc/bus@40000000/src@4006e00=
0:
> > >     failed to match any schema with compatible: ['fsl,vf610-src', 'sy=
scon']
> > >
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > >  .../bindings/soc/fsl/fsl,vf610-src.yaml       | 46 +++++++++++++++++=
++
> > >  1 file changed, 46 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/soc/fsl/fsl,vf6=
10-src.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/soc/fsl/fsl,vf610-src.=
yaml b/Documentation/devicetree/bindings/soc/fsl/fsl,vf610-src.yaml
> > > new file mode 100644
> > > index 0000000000000..4c92a5e4892bf
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/soc/fsl/fsl,vf610-src.yaml
> > > @@ -0,0 +1,46 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas//soc/fsl/fsl,vf610-src.yaml#
> >
> > It's a reset controller then, shouldn't it be in /reset, not //soc?
>=20
> It is not reset controller since there are not #reset-cells property to
> reset other models. It just provides syscon to reboot the whole system.

| Add vf610 reset controller
| The System Reset Controller (SRC) generates the resets for the device.

Giving me mixed signal here chief. If you call something a reset
controller multiple times without any additional clarification that it
does not provide resets to peripherals, how is anyone reading the patch
not supposed to come to the same conclusion as me?

--ldWk4wJW7G7nxwGc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaDnNcwAKCRB4tDGHoIJi
0k0fAP9xEMP3RDsq99tpKwUODFMvlZc/u4nYb9rlcX/IGT0BUgEA1fwhbAWRvv7y
JcFusmsVetdwlGO4zY35QGEzwv9h8Qc=
=ttAW
-----END PGP SIGNATURE-----

--ldWk4wJW7G7nxwGc--

