Return-Path: <linuxppc-dev+bounces-8449-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E492FAAFDEA
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 May 2025 16:57:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZtZwX4VbXz30hF;
	Fri,  9 May 2025 00:57:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746716220;
	cv=none; b=JDLnd9NgchE07x/69u7xUPxtePBIU3bdKg3GcV3fgl4wGXHc7w5ox4mx7T4m5NmBZwWzB43Fq+J9C2Dfqc+g0nw1zym2Oc8hsgBfNcJKAmxsoom07EHt7lBCLaGddnhnbyc8Z+4LrOGmiTRqNAr2QzxiQf8p3PmKCSeXSUyJ7LAEnQtvEFttNvIIHOXW1In8RPwRtLVJltSqfb6XEIDZY8Jz2iFsMQnuixTaYQkGVvvh3rx0Fb/f3SFCY8Sr4Z9m+tV2N7nHKD2B3/jwwkUSAB+IYBc49oPBxrg6uSOpqrM+CddCisncuA7Kp95bVPcIIj1QPlaN++TYNr4KVtGFxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746716220; c=relaxed/relaxed;
	bh=1vsxm1JyRB+bAQ3tEUlSlA5M/qBA4ktV3wqCb8KbCyU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FaSvyg6hPmvyKlJEY5IbsXytXrlPuxLIyld8weXJAetNLPT5VgTIEgdOTgJzH0dglOAMCosahWJtnUpkgUMCUQ9s427N9XctB4IKx1TXCGX+Rb1MHOyAPAwImK7p1Wb+qC479mUSjxRhNxJSIDilUm7vbV5FqGIP0I1Wkz0IBg30Vrx6AKQBsNPbETJ5qDtzSrDkMGIXSZdzZU9FcAKdjHcwvqtx12tThFHuUzTbsi/GmRv4NS/gTR/qKen9XojPqFXASO1bpi4Ydfu6xSCUfM2Ao8CctQ/p3bLs9zte6qRGaEdmAxfIWqyEHtZ+igfz1ywm1LtrCnk6DTvMvSLPwQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=j07kvywV; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=j07kvywV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZtZwV0yTbz307K
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 May 2025 00:56:58 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 62A92A4DEE2;
	Thu,  8 May 2025 14:56:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43A12C4CEE7;
	Thu,  8 May 2025 14:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746716215;
	bh=1vsxm1JyRB+bAQ3tEUlSlA5M/qBA4ktV3wqCb8KbCyU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j07kvywVUKN4l2qE9kTZVbyyzXQMh5gn/i7jJIOvsFTdJI2DaCj5f01to0kD1yOPn
	 oNbYZLuUXb7btBzUHSGlUSgbyvpV6IIzNF+u6JaXMywUKN4Aqo/f5y5dNUqz9QE0rc
	 SWNCQrPJR1fYLKQBHOiTHr8BGoquAUD5XeSXdJ+TzZfHnNutQIGmVyl7+DemlVlAEl
	 G4nnXIofN1dyRp9t6V/P3Ln2ISaAGcY5E/Q1l7fgG7zDHyDUSgdRpgjw1erVujp5H0
	 lm+ZwIDFz37odHj3WzqDxaeOvI1G0t3DXcSAG00r8EIq2f061mFYe5s01Fb0ZFoxVP
	 XY55/TPE8R2Sw==
Date: Thu, 8 May 2025 15:56:51 +0100
From: Conor Dooley <conor@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: soc: fsl,qman-fqd: Fix reserved-memory.yaml
 reference
Message-ID: <20250508-tumbling-suffocate-a0f41c8e67b4@spud>
References: <20250507154231.1590634-1-robh@kernel.org>
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
	protocol="application/pgp-signature"; boundary="oD3B2Ah4KH8Tz7Mp"
Content-Disposition: inline
In-Reply-To: <20250507154231.1590634-1-robh@kernel.org>
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--oD3B2Ah4KH8Tz7Mp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 07, 2025 at 10:42:31AM -0500, Rob Herring (Arm) wrote:
> The reserved-memory.yaml reference needs the full path. No warnings were
> generated because the example has the wrong compatible string, so fix
> that too.
>=20
> Fixes: 304a90c4f75d ("dt-bindings: soc: fsl: Convert q(b)man-* to yaml fo=
rmat")
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--oD3B2Ah4KH8Tz7Mp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBzGMwAKCRB4tDGHoIJi
0jQLAQDjo0zImdxubhL2UWRrPkobD019kaPhau2jHa4h21N5xQD+M40JHVkb1q4E
VNgqwP6qcDhA0fIZ7YW9nJZYAS+vjQ0=
=kREc
-----END PGP SIGNATURE-----

--oD3B2Ah4KH8Tz7Mp--

