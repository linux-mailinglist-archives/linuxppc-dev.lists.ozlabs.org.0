Return-Path: <linuxppc-dev+bounces-13743-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 403B8C313B0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 04 Nov 2025 14:29:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d18Sn1slHz3bfX;
	Wed,  5 Nov 2025 00:29:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762262985;
	cv=none; b=WA+EAEE6yw3f6wOefO5F05CLdZtXXgj7I2bNjB7qYiQQI70sIeHorfbYpVDjAlVC6107gBvhROIVXZwGWfSkDc+tWQJvqJx1kwjWhb2NYw/sbCkcAWxvmreorAgJi42VO5md6S1cr4L2GW8QB0sytXEvemcC0fuN0hLQCtKXkPXV6b6B3yXg5Tkodq3FgOFB5zsqwvPaCJMbP1T12edz5UWUr84NNLFvPr8XpJbfrlI4dmlXCAjRAairj4bz2mPbO+3vp1bBWgkVKQSD5tsdw1yHhEr+6QD/04EVkGkhsrUWBWZUNh1k1p234N+0EC75h6DSkXNXvBVweezlRJb8Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762262985; c=relaxed/relaxed;
	bh=azAivItrY49K4UEWYLYRHt/ABH+lv/uzEUAK+JesQvU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WFbb8JQCFaCNXY/zfXnbxG3EgDJO6yrbSEYTbXPWfRo99o6NLveVhXXBNSM/xMIPyZH1yUSOEXG2TzQc8QzS/YBa7U7rM4U5wfiqkhlVPT98cwlCvVMtWH5aGm64rg+O3dy8PEwG7eHdEBn0IlWLBuI0bBWBS+OcundOZXfd3plaBjtdIIFP9o/ceKrksyqpVgjoTc/N58jf879ZKY9IDRt9dU39rgOrvYQHmTcCIUlwGb6w8bp3599WbhIr5mpP8v4pkv9Mibl8/sVZCsQM6KfV+ba8KDqhcjDi7Jbz4QFvrfNJ1Fa6AoTvRjzJ1gslDYIynChoX164UXzb9pGfGg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=F7Hjr3XX; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=F7Hjr3XX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d18Sm1qD7z304H
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Nov 2025 00:29:44 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1D5D9601EE;
	Tue,  4 Nov 2025 13:29:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A062C116C6;
	Tue,  4 Nov 2025 13:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762262981;
	bh=azAivItrY49K4UEWYLYRHt/ABH+lv/uzEUAK+JesQvU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F7Hjr3XXl0wQ6S3iFdZF1fsWAaniWWYVjMUMFOIJoxwxwG7Pdt5Q0uoBuKT25gqwg
	 lEz+KP3L9DEWhfwLtWQyANZbT349w+tMTDOFwZKz33/HLWZtWtJ6dR2iveJMA4OzRX
	 erIpsHPp7L5Mb1SU6CLwmjZR8Jcdzc4vfBaVHd5T5hzMrsk3QEdctGHJa6D8Mjc0c6
	 5LLMlS9wnVeGjT7cisTQFuxpFn/c3zVixGIreOkBM+QBI8NyzYNm8+6L8x0GlqVCk4
	 h09XYJA7Qt/yd9XY2mSb9HhEa2mV76Vaia8dMabqnpGlCecthwd/NVPosoImOzatBm
	 3ebOICKClbf8w==
Date: Tue, 4 Nov 2025 13:29:38 +0000
From: Mark Brown <broonie@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
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
	linux-s390@vger.kernel.org, Aishwarya.TCV@arm.com
Subject: Re: [PATCH v4 23/35] vdso/datastore: Map pages through struct page
Message-ID: <aQn_wgG6bLhDL0xJ@finisterre.sirena.org.uk>
References: <20251014-vdso-sparc64-generic-2-v4-0-e0607bf49dea@linutronix.de>
 <20251014-vdso-sparc64-generic-2-v4-23-e0607bf49dea@linutronix.de>
 <aQjJNmwniQwwjeBR@finisterre.sirena.org.uk>
 <CGME20251104084442eucas1p2af1bd88393f4d6a532df1cd41f32a287@eucas1p2.samsung.com>
 <e7f05748-a11c-47eb-b1fa-cdc9dc6d05e0@samsung.com>
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
	protocol="application/pgp-signature"; boundary="+bUc+8DkjVNeTm22"
Content-Disposition: inline
In-Reply-To: <e7f05748-a11c-47eb-b1fa-cdc9dc6d05e0@samsung.com>
X-Cookie: If in doubt, mumble.
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--+bUc+8DkjVNeTm22
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 04, 2025 at 09:44:38AM +0100, Marek Szyprowski wrote:

> I got almost the same result while bisecting on ARM 32bit Exynos-based=20
> boards, so the issue with this patchset is not fully ARM64 specific. For=
=20
> some reasons it also doesn't affect all systems though. It is even=20
> worse, because it affected only a subset of boards, but different for=20
> each tested commit. The observed failure looks exactly the same:

I'm also seeing other architectures affected looking at -next, I see the
Avenger96 (32 bit Arm) and VisionFive 2 (RISC-V) with bisects coming out
on the merge of the branch or on

# first bad commit: [10d91dac2ea5ddf04e647cf862430d1051adb839] vdso/datasto=
re: Allocate data pages dynamically

It looks like the uniprocessor boards I've got (at91sam9g20ek,
BeagleBone Black) are running fine.

--+bUc+8DkjVNeTm22
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkJ/8EACgkQJNaLcl1U
h9CpkAf6A+69+z2QXStQyH9xpQ9GPBEq+tDAXKjipsigRts9dJxv2bGY1a5Dh8au
FBJQ/jhD8D2X6RlQHTv40vs6tG60GIngt24OmI3FasOGwxXhtwBcLaS0aHHlYUUt
qLVORv6xfBq3F6/wDzQ1aIDlPTIy400fD/eCJUwI083H1txPvzlYMm12cIWIiJ8u
bT8xDPGVKJtPEbLohQkWfoI6tPvxoDxzOGziUwQMi4XK8U2/4cEhIPve/Aa9GbpF
+ZCmks9cF4bslJWUjVPor98/kGlIRc722fvvOaukvYQv8rrS79j7XNfo78Bw/d3g
b6y91B0A7gLZU52AavqrMnJTlHXHQQ==
=LyBm
-----END PGP SIGNATURE-----

--+bUc+8DkjVNeTm22--

