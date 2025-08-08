Return-Path: <linuxppc-dev+bounces-10766-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0354AB1EC80
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Aug 2025 17:54:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bz7rD3GV9z2yCL;
	Sat,  9 Aug 2025 01:54:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754668460;
	cv=none; b=SJtlGOYxn3YKMJ+NyS7btxZKcyjioqTywsvNsVFEt0Tr3MiWER9bdANkghmfAqaDmJQkPJ6ZxnI4Wiq+YBds89imdDMxBOPXcoKXTRfXgzq3opjg7S6EHJqy7MgoMFSHygBZNbW2jAdNQHdR/JFmAaru3GqDUHC8Aybnup7QCuRPBh8TLR1TAAwKZnCpVrYadWQShaCw8daLvSDN0KMwhSa9Xbie2esHpkzv5IN8aDDuh9niUzN6pfzUm1eysTF5U09Iejv6SWRYl029Id/1zfJ0jt7q4mbmddyI33rofwz7O1yRamaVtaWIp2woAJltsf6GT+sHo/4aBD9FatBfdw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754668460; c=relaxed/relaxed;
	bh=QkTBeKjoqiTYtsZj4TAvkNckToe61OoBlX9hB16EcL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W7sn2c4xvkcOCy64IjrYTtBBVtfExsU9PSIY5E/Z4JG0PMX1HpevseYWw4xi0KNrQ/XsMOa0WbH68nUmR+scARcq45JC2liJc6GX760oWjGs9S2j/ICS2lwbZXgT0ClMblx0tuRlWaqhFrCfhagw9KGOOm/SGdQpV/zEwuh4C3zELFQsIRrVPnWIEw6Cg7uYPh/qz5ahgXeSVZmY2qXxF0QBNZJAwz4Xh1NGVBOoksRNk+YxVnoCzrPcbS8YGk1lSxhaUh/RMEvD72Zh7fdirFSDQ02TrDnEgbv3sqm3vW4ef3keGlwXKmAU2u7raKXlHAODCBGYAPNIsexnBadg4Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WsQ4J6SP; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WsQ4J6SP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bz7r9203Rz2xHY
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Aug 2025 01:54:17 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7337945988;
	Fri,  8 Aug 2025 15:54:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAE23C4CEED;
	Fri,  8 Aug 2025 15:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754668454;
	bh=QkTBeKjoqiTYtsZj4TAvkNckToe61OoBlX9hB16EcL0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WsQ4J6SPWk8shw4SPDSNN1j4nasGAZUC7D6PsTtOyRs+rN+wfdeW6JPwic5Oa9OVt
	 e1WiPn4zl6o/+8U7JEXVQhIn+KFIqPUeqpK0hq+zEUwDO8GVtT8PIwxsrX5bVi1Yj/
	 rXZDYmbpivaBIOigk9DNDpNHE3ukAGg4LMYz/Z36qjRP91sj/aGXnkKl7w+/5UMtQ/
	 GXNgZSjwqDqAudpB4lvg8lO8C1cCRrHDN176XRECaEURfYrZ9LRpqooi/tLHJONktI
	 WQ1mPa557qJxSWyX7cEQHacJNBa1y2nzcUi6zO+a6SNBqMFpE6XPeH6Y5kQfLMZQV8
	 Ls1+lmCWGu9KA==
Date: Fri, 8 Aug 2025 16:54:07 +0100
From: Conor Dooley <conor@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Scott Wood <oss@buserror.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] dt-bindings: powerpc: Drop duplicate fsl/mpic.txt
Message-ID: <20250808-sake-specimen-13313160b9a6@spud>
References: <20250807214432.4173273-1-robh@kernel.org>
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
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sKigfMgF1pPea84g"
Content-Disposition: inline
In-Reply-To: <20250807214432.4173273-1-robh@kernel.org>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--sKigfMgF1pPea84g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 07, 2025 at 04:44:30PM -0500, Rob Herring (Arm) wrote:
> The chrp,open-pic binding schema already supports the "fsl,mpic"
> compatible. A couple of properties are missing, so add them and remove
> fsl/mpic.txt.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--sKigfMgF1pPea84g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaJYdnwAKCRB4tDGHoIJi
0hEfAP9kk4vmVMA5jFwH7XJWvyF6laSF8vCUSKc4JYmZQYyPUgEA746BN1y0RtWR
PAGQ7h3RQWwh8A9hbpKAfs8O7cY2PAE=
=QgBv
-----END PGP SIGNATURE-----

--sKigfMgF1pPea84g--

