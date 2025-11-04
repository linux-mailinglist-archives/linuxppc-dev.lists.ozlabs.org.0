Return-Path: <linuxppc-dev+bounces-13749-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9726C3204A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 04 Nov 2025 17:21:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d1DHS31RZz3bfM;
	Wed,  5 Nov 2025 03:21:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762273316;
	cv=none; b=JzM+FjbjFdQeZP58x4toYj+mgkiekgucHuBd538Pxz2GfX7fLPWmQ/aZorKYYfpP4LukAqtf1Ff9NLB3nqNkXIoZrCJFqp9vyIkeqqcCfIFUpSOHh96kLORaRuqa5BP8GtDVnn9aN5Y/xVbJ9O6bfn+vK4DBF36NU854uMl0ku0GzzQqJ13X1yUcG1rbDgH61Rim4oKhLnRwEhy8Sy6JEe9qJrc5cW4hj+Qif0aayso7Ajsu/l1AMRfBr67DOBw12GOLWxSvX+XU0AS40pmCip81usxsL82IqU4aEgF6IGueKyfPCtLBFPdfMt90wOlakYzZMR1S3aKQadzZat8G6w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762273316; c=relaxed/relaxed;
	bh=g9b8dgRqX4uL2BHQtqvlqSlczFEDIsrr/9vjvvQGP/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L3e7O5/CFTPqmNixLJ8Vctxqj0kpMzYjjaJAj8nqkmebva8nbihv2noTvwafEgwEajfmSUxKdY6/rr8ESnb4loXhFbWsMmvfH9W/F75F9G2kLKMtfHUDXX1rEde7UJQro2XYCrkXU9fF71zdFcQ62kGcnbBznnnzRoyoqsb6ahbDSD3VeIFo0epiVaYZGcCr4wF231//7tSGMwubuDaa4sii9ZuEWzgfudpkiJrSE8lP7WrHgxDhA+s90Zx9ho7UHY7+I91RVbxjig+fvZMu/zt6XI96ZlLrBz/H5RPn4kzdJ/kA9qWeB79QUfeXMStBdqaGni+w0f5/kn8vpkPkIg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XERX5aBH; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XERX5aBH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d1DHR0xJ2z304H
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Nov 2025 03:21:55 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 793D86020D;
	Tue,  4 Nov 2025 16:21:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA99BC4CEF8;
	Tue,  4 Nov 2025 16:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762273312;
	bh=ZgapEV2f6UOkVKQ4Tm3UO+ujY8mCniaMXHTUMRbX7qU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XERX5aBHazdMMA+oEnGRxw1zsSiVD03zD1/OvFrITxNP8TY8EKGHO897kQpHZcTC4
	 AjOz22hE45sDXPt8Me6tOdmAhG+A6sT8FL6AjX6iYO6ZcS6KadkQT0rMkbJmui1OF/
	 y4pOsmta37VrO7TikjmFAe6yJr0DOXYwKDoT/9gVY3btW9L5vhKbX9306CCCv2kmMU
	 q0Xm6Z0TQ7+VPuX7Bj+EZ5H6rPQRzeur3ohk90yIJvxkO3YG03g9YEM8mYNDLcUFlG
	 PnlmletPsDgf5n3+Go+pKne9UEK4e4ygPuzYRVo35SlZ1BzC2w6vuQ8zAxKAJKLqqA
	 KeZdQ7RUrsN6Q==
Date: Tue, 4 Nov 2025 16:21:49 +0000
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
	linux-s390@vger.kernel.org, Aishwarya.TCV@arm.com
Subject: Re: [PATCH v4 23/35] vdso/datastore: Map pages through struct page
Message-ID: <aQooHZ5p4DNhwbar@finisterre.sirena.org.uk>
References: <20251014-vdso-sparc64-generic-2-v4-0-e0607bf49dea@linutronix.de>
 <20251014-vdso-sparc64-generic-2-v4-23-e0607bf49dea@linutronix.de>
 <aQjJNmwniQwwjeBR@finisterre.sirena.org.uk>
 <CGME20251104084442eucas1p2af1bd88393f4d6a532df1cd41f32a287@eucas1p2.samsung.com>
 <e7f05748-a11c-47eb-b1fa-cdc9dc6d05e0@samsung.com>
 <aQn8G9r2OWv_yEQp@finisterre.sirena.org.uk>
 <20251104162009-8cffa62d-e95b-466b-9a27-c51b0f5257cd@linutronix.de>
 <aQogAfbrP9rTPLvI@finisterre.sirena.org.uk>
 <20251104170215-3600e71c-1573-43aa-ad1d-8d02af9bbbf4@linutronix.de>
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
	protocol="application/pgp-signature"; boundary="vgxhQqUhFOf4jqrE"
Content-Disposition: inline
In-Reply-To: <20251104170215-3600e71c-1573-43aa-ad1d-8d02af9bbbf4@linutronix.de>
X-Cookie: If in doubt, mumble.
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--vgxhQqUhFOf4jqrE
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 04, 2025 at 05:03:28PM +0100, Thomas Wei=DFschuh wrote:
> On Tue, Nov 04, 2025 at 03:47:13PM +0000, Mark Brown wrote:

> > I can let you submit LAVA jobs to my lab (there's an API, a web
> > interface for (re)submitting jobs and a CLI tool for shoving jobs in) if
> > that works?  That's how my own access to it works unless I go pull
> > boards out.  You should be able to resubmit existing jobs, it downloads
> > test binaries over HTTP.

> Sounds good.

OK, folllowing up off-list for that.

--vgxhQqUhFOf4jqrE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkKKBwACgkQJNaLcl1U
h9BB+Qf9EauYOf7gmQuIlmWkRFyAe3nL6GnUvplpFK7JQgCAmEpS6FK/StPLVbZL
WwU/hE4esPcUwdBtU2pbY2fHKOHlAE3CNPiiEYfjkd51GcYtFX5b0Lw1PDB72Kgo
ZFvKRrKRgkb3Mn3f7Dl2XoapM8m7YR/tRtJNCBk+SesiIQ0HfL5V4ExsYO+L5c7s
wegS0czcQsWbwDBTsPWl3QJF+HPkq28QUpznRvaUwKfj7Pe5PJTpEQy9OZQf7u4r
e8p94FrmEto2SEMlh98mHi5iZcmCBPvOtFtCrv8NmzDi7olabfnoQ+ECOnFB2+Cy
tm2fLJofnR2UpxNKmXwxdF0pK8VkPw==
=HhMt
-----END PGP SIGNATURE-----

--vgxhQqUhFOf4jqrE--

