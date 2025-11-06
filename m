Return-Path: <linuxppc-dev+bounces-13883-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E99BBC3B49C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 06 Nov 2025 14:39:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d2NbV6JrVz2xdg;
	Fri,  7 Nov 2025 00:39:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762436390;
	cv=none; b=QzMsfPos+axSobL1BxSs3fvo6tNtiCdxrpFOWGU4Vn21C0MO0qt+D9hrg0OHrhKweS4zOthZ+BVmS0BpCN5tD2GgNCjJ2vsT/LhcD3Q1ddOozNq2yE3JvIaVLo7NK9XETuQGtYV8bMkuJqDyRAK7J8anr8xVnuscnMNRnV7ODA0tOERc7OHEcbanfzse0n/ILyHJs6uY7EP4CtPIEchv9z6IbRXHaxLo/9NxjHT33oJH8DE9cjxuuZCNZg9mVmmgxI2uIBY4AAXWMHlzauQsWUKgDK8I/ZyNal1WIwHpfnhyclNdPN4ybCjvCDcLAoLY8ktxNOwD0WhkJYDNR0yzUA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762436390; c=relaxed/relaxed;
	bh=lvN082Tgo45NxAv9qOCzujCY0L4Wp+Q7wkeySWpj1K0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SFSBG6Ne0y6oEJx6GVibb2SgYn6HvKZPhXyND6wsDYhNeP8DIHUSGCy8VbEvaBff4K5Y5KmCYTNeOhZcA9TVD/hVWhBnlSgxPYrQUjcGmEQExdG02XWmcKiJAkOkGBspjmb01w8Xw+G+0pUhjY5pQ6cgs88YDBnP4nhxdQEmQIaeXZPl5ulx6Nwlksu6K3iiul3mJCkv+co0LaISaxpeDKVO6M0p0QMcKG7KrsxpCD5s5xH/L9AS/3/6Gl3A1K6MndAFOFrPWqmeNizHaLHjwKfUKmXZZLELdwJv/w15d89lHFLqqjosEcKLQaequZ7HaAl93tQtTzd1G2afUcOoCA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Pj9jE7yo; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Pj9jE7yo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d2NbT6zRyz2xR2
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Nov 2025 00:39:49 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E232F60236;
	Thu,  6 Nov 2025 13:39:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06FADC4CEF7;
	Thu,  6 Nov 2025 13:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762436387;
	bh=lvN082Tgo45NxAv9qOCzujCY0L4Wp+Q7wkeySWpj1K0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pj9jE7yoInr9BCWfLJ0Y8+K6jrgVmgkwml63N4WoByHVsIr4RWQ7jaDOc81VdNYJ8
	 iTSCutwFS0KKGPYd8MgmLbSZozfDICTrA/EwOxswYw32R5r2FcMvYuyqLSnKlg09GK
	 ZGqwqyOq5eWuvrCT8KWgRiq/B2qmCmSO815iikAweI9cxudRZAg/pcDZnnUrPzQRrs
	 cN2lwF4mGeI/cbxWZtf3kduZfEEOnF+HlI1wbjFN0rVAlsEKu9W/Nk6ryO+lT+57Vi
	 zzU+PGx4Sd+6r49nkGvK51PgNHObALx0PSlYhCn8Qq3ZiZYk2NFEy6IKxYmHxQusBf
	 Wc8wnQM0TuucA==
Date: Thu, 6 Nov 2025 13:39:44 +0000
From: Mark Brown <broonie@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
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
	Nagarathnam Muthusamy <nagarathnam.muthusamy@oracle.com>,
	Shannon Nelson <sln@onemain.com>, linux-kernel@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-s390@vger.kernel.org, Aishwarya.TCV@arm.com,
	Ryan.Roberts@arm.com
Subject: Re: [PATCH v4 23/35] vdso/datastore: Map pages through struct page
Message-ID: <aQylIPCo1sEnJF4F@finisterre.sirena.org.uk>
References: <20251014-vdso-sparc64-generic-2-v4-0-e0607bf49dea@linutronix.de>
 <20251014-vdso-sparc64-generic-2-v4-23-e0607bf49dea@linutronix.de>
 <aQjJNmwniQwwjeBR@finisterre.sirena.org.uk>
 <CGME20251104084442eucas1p2af1bd88393f4d6a532df1cd41f32a287@eucas1p2.samsung.com>
 <e7f05748-a11c-47eb-b1fa-cdc9dc6d05e0@samsung.com>
 <aQyig5TNkw2YJm19@finisterre.sirena.org.uk>
 <20251106142956-d6251eba-c696-4a2f-a3e3-af461530d932@linutronix.de>
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
	protocol="application/pgp-signature"; boundary="EYbPhjGrYVw8SR92"
Content-Disposition: inline
In-Reply-To: <20251106142956-d6251eba-c696-4a2f-a3e3-af461530d932@linutronix.de>
X-Cookie: If in doubt, mumble.
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--EYbPhjGrYVw8SR92
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 06, 2025 at 02:32:56PM +0100, Thomas Wei=DFschuh wrote:
> On Thu, Nov 06, 2025 at 01:28:35PM +0000, Mark Brown wrote:

> > Given that this issue is very disruptive to userspace it's causing us to
> > miss huge amounts of test coverage for -next, would it be possible to
> > drop these patches until we resolve the issue?

> This issue and the observed panics should be fixed in v5 of the series:
> https://lore.kernel.org/lkml/20251106-vdso-sparc64-generic-2-v5-0-97ff2b6=
542f7@linutronix.de/

> I'll ping tglx directly.

Ah, fantastic - I wasn't aware of the new version.

--EYbPhjGrYVw8SR92
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkMpSAACgkQJNaLcl1U
h9ApqAf8DFWNLEwpnWuEpnrOTVfL+iVYzK6YSgBge+QboC8tTBNFnMnnQ5Ht92aC
QaU0hO+PO0XJiyMXzjXfT5JgDO8ovlQIUShX3kjD7MF/MuSGdEAbRUEzoFj4d170
GN1BVZ8iAysXN0NytDNcZImpsxwVva2BtBFzYouhWlcDg2eRPWhzd6tvmJY3b0ZI
qn9eJOHvYiqh6I4jaF/7mI11G/JYp3x3738trx8FMvZxgxL6y0O0MQ8lETGJTaao
EwYoM4wyzL8dDJ0r4bYy7pGAiIKFQXpASY1pInXJQ/NVO4fcAC7E47S0u5odZz1h
lhDgGOw14KG8UFp0J4rBQQRfSWDhCA==
=oxel
-----END PGP SIGNATURE-----

--EYbPhjGrYVw8SR92--

