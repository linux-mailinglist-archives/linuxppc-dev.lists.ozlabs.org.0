Return-Path: <linuxppc-dev+bounces-3238-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6802C9C92CE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2024 21:01:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xq9yn3MxBz30CB;
	Fri, 15 Nov 2024 07:01:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731614497;
	cv=none; b=XnnH5KQeEfKfLjb9mFp7GNvFG/I9jDyEzLYR4nJ3izbpttdaTt03spxM7XQWlDLJcyjrB9jvefBU5bl7o/JY8ZskEJZuFmOVpiZvqdHhaug9UEsf60QQTQ1cySqpjoR4nYUh5hyiPdPsL4SfK4ZvY4Xy3y8ro1t4P77P8qdXSCVUiWp0PWTcbcsmVDFX37469uvSrFW/Txpef4uVoHEzu1+iT9sDcHx6jz4UsXBMinyvneygTxwP/t/17cAEIcFcMbG0RhVIdhBrqMieZD33omQ5BrlSODlWaoOyqtB1xySD1j6xB95S+Ie56AvfGLxuMyswd9J2wT548uQS2LUjRA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731614497; c=relaxed/relaxed;
	bh=VWz5sCQ5z+GdY4O5saurQxhltkqAWeh87WpSHdVQSB0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iyqiKbDfciq4wYsllc2i/HWkTX2SzHGMH+HvwuTHEJt2nuuH4A5BQosp6KcbSIo8v7o/mPb9KpoROczbinnPivztfXz1DJzER69C6vN3ydGpf/TWUhf4LUphZP5/G9LiEHCIOqDZ82jcHGBcZGxX6eDgW6hB+BTlLqIeFMP32yJV1FkIHD3ePaUbt2TNnyrZN76pBajPfD9xwKfSvKRZ/M2l4f91carYQVzlyfgd1xdcLJ5eC8Os8DBcZET4w8R0BDttZXmms8lrRbmNUvRc6M7PkAZh7Cysbx/lqzy/ADA8waCzdj3HUvY3lGiknT9NO4H0ywF3NKMMNfQ53Ut6VQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=I635dSjA; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=I635dSjA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xq9ym2JKNz3051
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2024 07:01:36 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4A1C25C5FBF;
	Thu, 14 Nov 2024 20:00:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E10DC4CECD;
	Thu, 14 Nov 2024 20:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731614492;
	bh=VWz5sCQ5z+GdY4O5saurQxhltkqAWeh87WpSHdVQSB0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I635dSjAnKKMVpTevwE3oP4UacKi1Yjjb2bBYkCes6s6ebjTGyqdcBF2BMyKn4BDh
	 RujBYwS6TiHSe2L+C+eqL1BFovRlIFtD5Qxai1Kt2P8RXHl8TLyuGB70dBHEiW4Iem
	 gGPDpWEg1F0rmNxojPbYL50vzvvDjmhNWWF5xSAEE530VKRLHVSIxSqhWMY4C8Ww71
	 ta9cKABHiUYmvMypAYfJbEm94wbUnd9p8fgvdhedLAVoIQ2f6Vo7uPb17YnrBjhxbo
	 oplQZQcY2KCbrxBwQevspMt84ivecQzWmJZD84hbtJK04HknEn+vWve1T+hM1RAgaX
	 5XXxd5davnOeQ==
Date: Thu, 14 Nov 2024 20:01:27 +0000
From: Conor Dooley <conor@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Horia =?utf-8?Q?Geant=C4=83?= <horia.geanta@nxp.com>,
	Pankaj Gupta <pankaj.gupta@nxp.com>,
	Gaurav Jain <gaurav.jain@nxp.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Frank Li <Frank.Li@nxp.com>, linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: Unify "fsl,liodn" type definitions
Message-ID: <20241114-obligate-thinness-204e7edbac77@spud>
References: <20241113225614.1782862-1-robh@kernel.org>
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
	protocol="application/pgp-signature"; boundary="LBgC8kDFmZGaqIfM"
Content-Disposition: inline
In-Reply-To: <20241113225614.1782862-1-robh@kernel.org>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


--LBgC8kDFmZGaqIfM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 13, 2024 at 04:56:13PM -0600, Rob Herring (Arm) wrote:
> The type definition of "fsl,liodn" is defined as uint32 in
> crypto/fsl,sec-v4.0.yaml and uint32-array in soc/fsl/fsl,bman.yaml,
> soc/fsl/fsl,qman-portal.yaml, and soc/fsl/fsl,qman.yaml. Unify the type to
> be uint32-array and constraint the single entry cases.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--LBgC8kDFmZGaqIfM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZzZXFwAKCRB4tDGHoIJi
0kYGAP9Wme55iNVWUdF0JCfZsdd/dSXawb3Xp/9hcFkAFPL+1wD+JyfKr1/0r859
g2MAxCrI6eo9mzcsXHJ6NGT7mvH0DQs=
=7ofP
-----END PGP SIGNATURE-----

--LBgC8kDFmZGaqIfM--

