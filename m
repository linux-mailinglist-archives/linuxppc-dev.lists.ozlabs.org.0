Return-Path: <linuxppc-dev+bounces-13885-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BBCC3B893
	for <lists+linuxppc-dev@lfdr.de>; Thu, 06 Nov 2025 15:02:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d2P5g0Dn0z2xdg;
	Fri,  7 Nov 2025 01:02:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762437750;
	cv=none; b=bP/b8YKW9On8YPs5hRhnngB+KHIcYAsInJ9rUXjDV9l7oFa/UlwTQk+dFlGUGmsT6F4x/WeuLinzbESsq7t+9nNHKtkOCOc/wEb5ykv9b0dk1XoNtS24YAorD0+idBVZ6XphiYhl+cUcgiRB0SbQYjnS82shAGxLBgMOW1w6XN/VgkFKpbiGuSQ8tlFDI0e7k72eQhnOf3sDU+jIC613DnKjp9ppKGWvm/UxtIZ4eymSvopJ6c+ke9+7LOsME2lPFf8WWVWkT4yxsCGWG6+f5A3gB8pNTPYqxXOiFQKa+vwdHY0l6NaGUBatVW77tY3NknMgMykbQnVo/0kBi+r2gg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762437750; c=relaxed/relaxed;
	bh=rks74Ok2xVDZRYVekwVF/tod1CxxsRBTTzdE/GlxP70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L9HpZwQKozBspNZ+iyLrNBSWeWul/r3RoStKN8cmWpT4Hps+JOuW/MuhjW+2T1tmRAI1rPGwP1NLX9KNnyPNhbnHRTeCmLMzefUtkEd1kBiTmmaEqaoLPfFRheCi8WOzM5l8pom9EDrz7868hCPwwWKaExAwjHxqdqIyld3/VLYNW1uECSH3QIiqVSgeMqX1AGTrldQPME3AxsQT3B6Asoo5NFjUcRmb8Ku+ieUiLZtTnl6XPeHUA3f+rl3aoC5WFgAEKhz3r668VOtGG6pd1FkBd0nt50VdPIivkWjqfPPKMp5wLPafthY+O3f1TNXeOZMbRVDgJ+WSOsWHQU80gg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ud+s8WUS; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ud+s8WUS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d2P5f0ddvz2xR2
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Nov 2025 01:02:29 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A86BE601B8;
	Thu,  6 Nov 2025 14:02:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2A90C4CEFB;
	Thu,  6 Nov 2025 14:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762437747;
	bh=rks74Ok2xVDZRYVekwVF/tod1CxxsRBTTzdE/GlxP70=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ud+s8WUSocuprubvzUOn8VaTTNgP5pI8KL1QrPvB41zFUOTeVRqsg6VXanq7RjXrt
	 Xn+A/6fKrbkrAoSRxtE7sgs19ET/So8zm9IajCVZ4mSdbwTSULmFfhU5BAo+iF7nTD
	 ZMUcjlN+rjIbRkhA07YgsdHFpyV+ozJZ/xB4qYFYWSN+AChzURE/gwQXR5xm4ExRgC
	 f5IG/MS4uEHvmQ/Vp4534qX52O/yMhhPHpmXheOg/bpZX16ILqr8bdwixpllo89E9L
	 dh0F2VOHbeO7NnGAN2xsSfXTCxZCZ93t4sk6Si+GzjOjs2MhU+GK+MX4wmRD6Ijdjv
	 z3wqWVhwtQQaQ==
Date: Thu, 6 Nov 2025 14:02:24 +0000
From: Mark Brown <broonie@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Nick Alcock <nick.alcock@oracle.com>,
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Shuah Khan <shuah@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Russell King <linux@armlinux.org.uk>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Shannon Nelson <sln@onemain.com>, linux-kernel@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-s390@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH v5 00/34] sparc64: vdso: Switch to the generic vDSO
 library
Message-ID: <aQyqcH39IPLRWMt_@finisterre.sirena.org.uk>
References: <20251106-vdso-sparc64-generic-2-v5-0-97ff2b6542f7@linutronix.de>
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
	protocol="application/pgp-signature"; boundary="4rnwqeK5vRaFw2+U"
Content-Disposition: inline
In-Reply-To: <20251106-vdso-sparc64-generic-2-v5-0-97ff2b6542f7@linutronix.de>
X-Cookie: Dyslexics have more fnu.
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--4rnwqeK5vRaFw2+U
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 06, 2025 at 11:01:53AM +0100, Thomas Wei=DFschuh wrote:
> The generic vDSO provides a lot common functionality shared between
> different architectures. SPARC is the last architecture not using it,
> preventing some necessary code cleanup.
>=20
> Make use of the generic infrastructure.

> ---
> Changes in v5:
> - Merge the patches for 'struct page' mapping and dynamic allocation
> - Zero out newly-allocated data pages
> - Pick up review tags
> - Link to v4: https://lore.kernel.org/r/20251014-vdso-sparc64-generic-2-v=
4-0-e0607bf49dea@linutronix.de

I've validated that the zeroing fixes the issues we were seeing with
boot failures on a reasonable chunk of the arm64 platforms:

Tested-by: Mark Brown <broonie@kernel.org>

I didn't get to all of them but I'd expect the rest are also fine.

--4rnwqeK5vRaFw2+U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkMqnAACgkQJNaLcl1U
h9DdXQf/cqvSjdtV28SWYNX+UHnXmboyHxzenwcfa4zxbnrzgQ8feYntV6Ikfx7L
ovSme6EY9cGYwoDmmhIHSSVZ0iuMwgiSj/NLxYlzbayc8uJITnfMorXtyOkqn7eQ
9PngOIxdOAGels3s3oLIZfRg7pXKnfX176OvkFQi6I2gHaBHCpQbBq4o5qVqFo85
Yra3emkWyARoll2AJ3u/dPVaDlXP2H3z4fm9QzX/1aWFaGN5Ml43iLbTfuC6YPlA
/XTavzO9jIbi7l2J36K152BdwsgyOEHqQezDy5a/7bSQwA9cH7ok32svP1b5hpl1
DOGKdUeeQCo9BAzV2TfMQR9jwzkZSQ==
=zN3L
-----END PGP SIGNATURE-----

--4rnwqeK5vRaFw2+U--

