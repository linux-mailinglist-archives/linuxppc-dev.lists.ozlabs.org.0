Return-Path: <linuxppc-dev+bounces-5966-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C913BA2CFC4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2025 22:38:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YqS563jHwz2yjb;
	Sat,  8 Feb 2025 08:38:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738964298;
	cv=none; b=laZ80y863g4PgMT3G5dvB9CBFElo67lW0L45sKVGxMyFdwHVNq24hxaFzMxKPFZ8n2KDrmZVF226Cb9hJpTCpwveJPXo0kUU8e1KIY7tc5SX/DURyuLIG/a6va0RLoyaIoDkxArwrY7KTDnKn1n30HjvX6vdJMmYTEweI9X2U90RIt03kMm44SORRUqTYgXegZtO+mc53sXdfvy5y2yjnC5/Xu3IalwCMf597dP5p/S1UR9xgMrEqzzbLMFV4auEjjv1PF3stA73jbmSIvDUj8relvDsBvMG6vn9gfD4G/JkAW6yje1IU45XRwFRGEIcIY2Harq/3JxQnVxVUy+IzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738964298; c=relaxed/relaxed;
	bh=d+AWo53Bbd3sX/7MFIskwu8/ey2mRt6zTcv4eDJPNZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QFp63BRUIvlXNElOhKAtXAs/blnykU5W62c3gtFsV+wRfAYjDgD8fg2De6REugOq1kFpkCsh2bKRWJSqHk2i8mYYAx/LB+GPaj4aPFOOd03pou/EKSuid6SlIBNm8xik6w/x+2www2mFkQ4I3arplK+/DYjzLEF6pCnMdH61fJSbfBBECT3n0FEI4zLLtq1/MGaagsT+ROUmsBk9txjSYHpnnMp30tKEBpBBgiy14vVw6k0tBciGtUvBBX5yI5ZRgin0d7O9RfxX+nj+GdPk3WHkgpkyV733kAMxCG/4pFzEAAsr+juBZE2pwt+lvLGt0L6fHPYUWnu1LjMBFGvSpQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lfyiv5cu; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lfyiv5cu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YqS55585Zz2yjV
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Feb 2025 08:38:17 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0FC385C06C0;
	Fri,  7 Feb 2025 21:37:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1DF4C4CED1;
	Fri,  7 Feb 2025 21:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738964295;
	bh=7xVwhwDjoai8YSxFqqwGSBjxwD2KZy4EIiDqNHKYu+k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lfyiv5cuS/GU2byBNx1/HS6vFu4XgUVKiwxJxFKa4f3ofnDnF5InCMn2/xpuWS58N
	 4QtqPZCaUgmr79HJ9xmM78pXb89BQLwgxXvc33Lh+3EQeafVlBrVppNrK8XOQUw5H8
	 UJR9X0noZ/1FbX4W1ZBZAMhUYy9BgxOGEd9MwMZFlu4BmJKNV6MQRgPREDIoJFchfh
	 vkIpTE9C01BimsoJ3MqyEWHAtinnUWxUS8B374bKNWOXDU9Asd0dSh8FiOORDf92iW
	 aQPWNpap/IIavA7B9QLaDyt/3GM8gUFwZBNJqf8kGVt3NewUlFLL83a8JTzoH0ByF2
	 gYO4ujWIo0Hvw==
Date: Fri, 7 Feb 2025 21:38:05 +0000
From: Mark Brown <broonie@kernel.org>
To: j.ne@posteo.net
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	Krzysztof Kozlowski <krzk@kernel.org>, imx@lists.linux.dev,
	Scott Wood <oss@buserror.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>, Lee Jones <lee@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	=?iso-8859-1?Q?J=2E_Neusch=E4fer?= <j.neuschaefer@gmx.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
	linux-ide@vger.kernel.org, linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 00/12] YAML conversion of several Freescale/PowerPC DT
 bindings
Message-ID: <611e47da-ba87-4c21-a6b7-cf051dc88158@sirena.org.uk>
References: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
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
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Yv3YhmJAoxj+QMAv"
Content-Disposition: inline
In-Reply-To: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
X-Cookie: MMM-MM!!  So THIS is BIO-NEBULATION!
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


--Yv3YhmJAoxj+QMAv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 07, 2025 at 10:30:17PM +0100, J. Neusch=E4fer via B4 Relay wrot=
e:

> This is a spin-off of the series titled
> "powerpc: MPC83xx cleanup and LANCOM NWAPP2 board".

> During the development of that series, it became clear that many
> devicetree bindings for Freescale MPC8xxx platforms are still in the old
> plain-text format, or don't exist at all, and in any case don't mention
> all valid compatible strings.

What's the story with dependencies here - why is all this stuff in one
series?  Normally I'd expect bindings conversions to be standalone.

--Yv3YhmJAoxj+QMAv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmemfT0ACgkQJNaLcl1U
h9Dq1Af/eChCpyVx52hhPj2Ppke4XqgRYwHfMx1ZD4zg9Fv5cLy+pNBr/CAHHckC
zFU84oMRCqn0Y8VcKQo6h/qnhsFnmdYxFgRmYg1kXZIm+jfrFUtTHfRH4I/8b95Z
G2JrWA/AN9rNXn2n7I0gL2mBLfXBlTl2GlESRinIHR9eESMM/hJAQmkkw2xpgeCM
lc0xNSEPmuS3M0+rYNtypbnc1bbGXU6zVOEz+5Ennz6bHPi6q6Amjz6HBLyoln3X
3F9zfSERvGPIA442jE6Qm6cFH4S7Vv/L4urjeIvSe7le626ajH99YJZl1BSFaPLR
qcOQY87d6Kjx7kPP+wMJG/Lfhrmprg==
=9fhs
-----END PGP SIGNATURE-----

--Yv3YhmJAoxj+QMAv--

