Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FE89090B4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2024 18:44:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hL+l8FUI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W14qt56cJz3cbB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jun 2024 02:44:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hL+l8FUI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W14qC5BR8z3cXF
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Jun 2024 02:43:51 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1F429CE2BE4;
	Fri, 14 Jun 2024 16:43:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56300C2BD10;
	Fri, 14 Jun 2024 16:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718383428;
	bh=OGecIESkxQlGPPHFvJKS/1V4WaNGOExMXfaeDU81YVM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hL+l8FUIXR9ASHQf9xeEPHt7CfdJYNX0X2a16Kb6dXovnPp+k2I7dQZVJz+bHAS+w
	 /Akw4bgdYCbPoCYPoxyXVhpR07QLakzGw+lOuLOCEcwc4m6XbzkVwX996ca3rr7kcm
	 ZekEHG9V5TCkNvXESp+C05L37+ynL56sBerph8iI/t5rhWxp+D44Fo5+P42u35Gl0K
	 7dhB+rmHkWPUfnZ28d9jgrO3szh5oJ5ZQY2ImBXkHINHxIt+m8b3G8wRkGcMlTbQL6
	 yUuCucQDUEkjvZjxu10iU71nkcLMlqu5oTEbzmsM1vD1k2Y6LXTCZz2aWqsZ/1SvcG
	 l+KTBfQzjR8yQ==
Date: Fri, 14 Jun 2024 17:43:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Subject: Re: [PATCH v3 0/4] Add audio support for LPC32XX CPUs
Message-ID: <ZmxzQLbzuEupDkiJ@finisterre.sirena.org.uk>
References: <20240611094810.27475-1-piotr.wojtaszczyk@timesys.com>
 <20240614163500.386747-1-piotr.wojtaszczyk@timesys.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4uEH+YoQX+igcbHZ"
Content-Disposition: inline
In-Reply-To: <20240614163500.386747-1-piotr.wojtaszczyk@timesys.com>
X-Cookie: Your love life will be... interesting.
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
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, "J.M.B. Downing" <jonathan.downing@nautel.com>, Russell King <linux@armlinux.org.uk>, alsa-devel@alsa-project.org, Chancel Liu <chancel.liu@nxp.com>, linux-sound@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--4uEH+YoQX+igcbHZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 14, 2024 at 06:34:48PM +0200, Piotr Wojtaszczyk wrote:
> This pach set is to bring back audio to machines with a LPC32XX CPU.
> The legacy LPC32XX SoC used to have audio spport in linux 2.6.27.
> The support was dropped due to lack of interest from mainaeners.

Please don't send new patches in reply to old patches or serieses, this
makes it harder for both people and tools to understand what is going
on - it can bury things in mailboxes and make it difficult to keep track
of what current patches are, both for the new patches and the old ones.

--4uEH+YoQX+igcbHZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZscz8ACgkQJNaLcl1U
h9BWvgf/f+S9NLVWH8/lPOJWNtq9tQndYQy8OK5iMAQJm7mKL0A4ttTTMYMYnh9h
tL3EW+ywS15IBWgG89JDmI9AuB9nWQKgmQIqjVuGW+54g1EYmViI28IteOGUZnv4
xSF8N2Ak+ag00veuwAnYp3oMDUbtZ/VpEcoBj6Na+QDI5ok19cDT4Vqo0lWSMTn8
9liaCr84fAjnbULZLuudLqd4wrhxbBtaYwCQ+iH2tW/N4j04iuTdop7ogfilTi/0
ZsZOYX4xC1lJ1EbS7qpQSTsA5aDQQ7BwwzOE43HOhzTLoOcVVEl2a5dmZkSHNNDc
2R617vs7FjbtGTrFUOVMTAzD01F8lQ==
=TUpG
-----END PGP SIGNATURE-----

--4uEH+YoQX+igcbHZ--
