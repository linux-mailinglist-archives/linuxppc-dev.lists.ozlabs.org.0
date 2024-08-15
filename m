Return-Path: <linuxppc-dev+bounces-108-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D85953D1E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2024 00:02:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=127.0.0.1
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pqZS310e;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WlJyZ1Hw1z2xHT;
	Fri, 16 Aug 2024 08:02:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:40e1:4800::1"
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pqZS310e;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wl87D3Gmyz2ygG
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2024 01:24:40 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CDD85CE19DA;
	Thu, 15 Aug 2024 15:24:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4344C32786;
	Thu, 15 Aug 2024 15:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723735475;
	bh=ICZgpaAfwuMR3pqfoKaQI6huKtAIlk7+AL/YQW7wSzk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pqZS310enYO3SuTKgqFBE1ONxMk5uQHkWyqjqlJm7oPicN+OhBG2QVNkgmtU9si4v
	 aO84Mpuvhc8OggeDVc6lsPuTWi2ARPg6YGyOOmMlwJYMRmLwLr/7ekvT13PDEXtO8N
	 MSvzPnFp9jNfRk9F3oYMnRCeY0litDzNrwFbgRBiZvsx/RDgK0iLmolLBSgsy3UmLK
	 dgD52B7taQ7VBGBKL1KBfJGTbFJIgXgSkGJtuvIdGoYCqOGELbep0OGePItQqw1IRY
	 j5lEJUPcwlLaVh4yh2kJUdHIoR+DNVCESBUvxThvwEc584Vx/fPL3TtrlnPnONN75K
	 fo2FvpN95wYlQ==
Date: Thu, 15 Aug 2024 16:24:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Dave Martin <Dave.Martin@arm.com>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org, akpm@linux-foundation.org,
	aneesh.kumar@kernel.org, aneesh.kumar@linux.ibm.com, bp@alien8.de,
	christophe.leroy@csgroup.eu, dave.hansen@linux.intel.com,
	hpa@zytor.com, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org, maz@kernel.org, mingo@redhat.com,
	mpe@ellerman.id.au, naveen.n.rao@linux.ibm.com, npiggin@gmail.com,
	oliver.upton@linux.dev, shuah@kernel.org, szabolcs.nagy@arm.com,
	tglx@linutronix.de, will@kernel.org, x86@kernel.org,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH v4 18/29] arm64: add POE signal support
Message-ID: <a3b72007-e0f6-4a81-a23a-6c5bb5df8cf0@sirena.org.uk>
References: <20240503130147.1154804-1-joey.gouly@arm.com>
 <20240503130147.1154804-19-joey.gouly@arm.com>
 <ZqJ2knGETfS4nfEA@e133380.arm.com>
 <20240801155441.GB841837@e124191.cambridge.arm.com>
 <Zqu2VYELikM5LFY/@e133380.arm.com>
 <20240806103532.GA1986436@e124191.cambridge.arm.com>
 <20240806143103.GB2017741@e124191.cambridge.arm.com>
 <ZrzHU9et8L_0Tv_B@arm.com>
 <20240815131815.GA3657684@e124191.cambridge.arm.com>
 <Zr4aJqc/ifRXJQAd@e133380.arm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wqb8liXWozkhAkEw"
Content-Disposition: inline
In-Reply-To: <Zr4aJqc/ifRXJQAd@e133380.arm.com>
X-Cookie: -- Owen Meredith


--wqb8liXWozkhAkEw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 15, 2024 at 04:09:26PM +0100, Dave Martin wrote:

> I'm coming round to the view that trying to provide absolute guarantees
> about the signal frame size is unsustainable.  x86 didn't, and got away
> with it for some time...  Maybe we should just get rid of the relevant
> comments in headers, and water down guarantees in the SVE/SME
> documentation to recommendations with no promise attached?

I tend to agree, especially given that even within the fixed size our
layout is variable.  It creates contortions and realistically the big
issue is the vector extensions rather than anything else.  There we're
kind of constrained in what we can do.

--wqb8liXWozkhAkEw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAma+HasACgkQJNaLcl1U
h9Aj1Qf/YNaa1FCiSI68LMMwxwE6eenm9OEl456cdnlqFBO9AkqUcrDmxhLHSH03
GXCM+GkBVn8BYFt9QFvMe7j1isn+eJhuaPVQV7bj6JGZb/5hw8Q2au78WGQDcfXK
7aAATdyMJlyl5xbWpzB5EP71BIpQ08XuxMbh1B1zcMjfJGlDdR7izJxhAWJekzr6
/FYhxfXLIINvWKD/QJw2mO3D61zS0CB3K0yZGKz811qViXyaoP9GrtRiLtglFkjU
TSoEwNVwVI/TNLQ1owKssDBw76Lxj9jaoLoFLl+K+vfrEwS3PD71MB3MabBrdqNG
kU8UB4OXrCNYhMJ+5rqw15bTFY+0sQ==
=L2pp
-----END PGP SIGNATURE-----

--wqb8liXWozkhAkEw--

