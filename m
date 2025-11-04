Return-Path: <linuxppc-dev+bounces-13747-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C13C31E8D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 04 Nov 2025 16:47:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d1CWY2ccvz3bfV;
	Wed,  5 Nov 2025 02:47:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762271241;
	cv=none; b=Rf4DQbLbDfMu8Ukxhvq6rFmRW2LL4pASLNwWCNM7f/lX/0gxfeo4qdJSpBsfsTEGhaxX6Zl1H6hGhye2XGoFJ819LKhC9eW3dvDxHGAWlfJJUaqoy1Z335LmZZRb72UwTWDEgrLS+z5SGn6H80V2vYiG+Vgk/4xs7RnBvbyRAkz4hfgja1XxCZkRsDEjXByVsMcXgE2Pi1njj2ToyOnpi4jucICUd2sSjhrATX77gMmqKbdTanlOYh5VrKuxv+CNh0KVFA7OI7+EVOwcqbY/2v7MJo6/Q3Gm/QfpH1SKRH/P6UQd1hzr+l0h5CNdYHTTHuXQdTTdrmFR4SAtaxTF7g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762271241; c=relaxed/relaxed;
	bh=05s7QhxdzIV4M0EltkhCWjxKsXoYwIMqoOafTsAgdTc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k+jcKoetVoRSICYnI6EDLnnWfQB6oHEPaKdiR6HEQyMGZpTpqIzskS6oAOTb7BPS7vC52CtH+hDzunGLc6TkLU4+FMy8GYSBjIz9TYiRgUBYIpBP+u+ruPdKSJPzZ2oNe7Y0FLkQw1SXwJ6WaA/lLO/XNge5Je6Vo8YD/PS5IaQT6q/oV9oy7QCwjOD026zeqou2QiTMDlmilEm45DVrG9jrJPyiqhOBvwiS95yEYWlD3A9MGxYUJ+oGMvHRMIlIfu9AG1w6NMFIpOj4Q0WAsPRV+iPHRlCLDzZICxfEgjtIu42JKrvYwp0OrsB+QcTrVAJuCwkEaEhfUz4/jSESWg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mCdInrer; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mCdInrer;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d1CWX1zM9z3bf8
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Nov 2025 02:47:20 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 17BD6445DA;
	Tue,  4 Nov 2025 15:47:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EED2C116B1;
	Tue,  4 Nov 2025 15:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762271237;
	bh=sNvgLU2tT2QtYcE++dQwFqfrLanXeBmZ4oNa9dmXiuY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mCdInrer7LepIuBSWSpwRE+lkhLMT9QMw++9YEMTJILBagvaoNxLr+E0o5iuw+6qh
	 4/wP2J/i3qQhy5Kft/3TosLdM1EgHmFfsDK6IfYfxoZle5eaUgdBPc4bBPcnGVDqCk
	 KDErSYxmCqyp6oXXW1VrnfahWBgE9m/+PVH+EPJIt9FQkfqsuURo3cJDCqE+O2eLBm
	 H5C/ACbilrOMnKgtI/iXeKepbvLqkq/7r0yYg60InC0JDZv2lD5lmhMJiKxwLDUaGU
	 HnvSWLKkLYbiR9jWLoMXivF840mjsxtbmnf6d5oYx+LvesdpChJDbGY8UJRR9UTUBV
	 x1K59OjL2V1Cw==
Date: Tue, 4 Nov 2025 15:47:13 +0000
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
Message-ID: <aQogAfbrP9rTPLvI@finisterre.sirena.org.uk>
References: <20251014-vdso-sparc64-generic-2-v4-0-e0607bf49dea@linutronix.de>
 <20251014-vdso-sparc64-generic-2-v4-23-e0607bf49dea@linutronix.de>
 <aQjJNmwniQwwjeBR@finisterre.sirena.org.uk>
 <CGME20251104084442eucas1p2af1bd88393f4d6a532df1cd41f32a287@eucas1p2.samsung.com>
 <e7f05748-a11c-47eb-b1fa-cdc9dc6d05e0@samsung.com>
 <aQn8G9r2OWv_yEQp@finisterre.sirena.org.uk>
 <20251104162009-8cffa62d-e95b-466b-9a27-c51b0f5257cd@linutronix.de>
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
	protocol="application/pgp-signature"; boundary="zVoWTguNpry6X+3h"
Content-Disposition: inline
In-Reply-To: <20251104162009-8cffa62d-e95b-466b-9a27-c51b0f5257cd@linutronix.de>
X-Cookie: If in doubt, mumble.
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--zVoWTguNpry6X+3h
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 04, 2025 at 04:43:34PM +0100, Thomas Wei=DFschuh wrote:
> On Tue, Nov 04, 2025 at 01:14:03PM +0000, Mark Brown wrote:

> > I've now got the results for this specific commit, it looks like every
> > single arm64 system is failing.  I didn't test any other architectures.

> Which one do you mean exactly with "this specific commit"?

> 6a011a228293 ("vdso/datastore: Map pages through struct page")
> 10d91dac2ea5 ("vdso/datastore: Allocate data pages dynamically")

The one in the thread being replied to here, the first.

> Any chance I could get remote access to one of your test machines?
> I don't have access to the exact machines and that should reduce the chan=
ce
> of chasing down dead ends.

I can let you submit LAVA jobs to my lab (there's an API, a web
interface for (re)submitting jobs and a CLI tool for shoving jobs in) if
that works?  That's how my own access to it works unless I go pull
boards out.  You should be able to resubmit existing jobs, it downloads
test binaries over HTTP.

--zVoWTguNpry6X+3h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkKIAEACgkQJNaLcl1U
h9BXnwf8DrtoASOmIwCcathDthMIkBxak4gjtFCMM9nl89xoYXw0PBVjwG05q9Ug
wRGz5y1/4Lw02ScLoNgGHwrQvg+j2UZaRq5bxFZ/sTsAIk/EGp6BPS0DkaQscGWH
lua2F7kyuqAm4W68+aHxBoFfT/Tmj/IrNYJkAV0t1PSLxWAXckiHTsa8wpUsW857
Dmv99n18VJcp32FYPy8Cdgxcdi86Uta8cpqOkA9IDA/ExbpWmveGN+IkJklF7zBA
YdW9Z9zvjZ6yfNP4/HgLCx5G41XKX2Ra0iNKEvdrKC9mp5x5Ra2ogMPYFFYZDhBx
mWcYg2iUelmLcPPYxVsizqjhauW2MA==
=RR8q
-----END PGP SIGNATURE-----

--zVoWTguNpry6X+3h--

