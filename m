Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 23153932757
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2024 15:22:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bEcc3cof;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WNfqn0NKsz3cl9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2024 23:22:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bEcc3cof;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WNfq50WB3z3cRc
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2024 23:21:37 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 44F23611FD;
	Tue, 16 Jul 2024 13:21:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E65C3C116B1;
	Tue, 16 Jul 2024 13:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721136094;
	bh=MDYDDMId9Vq5nWSoKcWFrH/nU7E7vtMo3ZqG+CSN320=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bEcc3cofO5RnyXn9FufGyGU2WpkjaGtJrPT8aBi+b0H30Mo62bFcyv7BR5vjOzAWl
	 uZrJURdKoed8pFvaMONdv+jp+73wl6MZHY8lDrbhzA4r0k9MZJwwbEVAPTLUca374n
	 MKXWh/SA9A+WMrYqrLM47uuFxtJv4bwCU6gu9M/AMrrCd93cOOAIo80yksddlZ2XGX
	 HV8m+g1I5NmH04HdZstHzkTovWOIl4Tv9+QV2lJyJ5PaFFz/k2utvqCm0MEovL8kn7
	 TiQtP+tWgjgVZ+uzbvYTDozgVzwXtJdOIPyPXDVtGte3ugmBPAQmLKeTuEclvh1MpB
	 yNyt/Qcv/YbWg==
Date: Tue, 16 Jul 2024 14:21:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH v4 06/29] arm64: context switch POR_EL0 register
Message-ID: <91862b79-b29a-49c2-8a0d-653bb87d3d9b@sirena.org.uk>
References: <20240503130147.1154804-1-joey.gouly@arm.com>
 <20240503130147.1154804-7-joey.gouly@arm.com>
 <3c655663-3407-4602-a958-c5382a6b3133@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="o+3mIAah6T0Lu29l"
Content-Disposition: inline
In-Reply-To: <3c655663-3407-4602-a958-c5382a6b3133@arm.com>
X-Cookie: Think honk if you're a telepath.
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
Cc: szabolcs.nagy@arm.com, catalin.marinas@arm.com, dave.hansen@linux.intel.com, Joey Gouly <joey.gouly@arm.com>, linux-mm@kvack.org, hpa@zytor.com, shuah@kernel.org, maz@kernel.org, x86@kernel.org, christophe.leroy@csgroup.eu, aneesh.kumar@kernel.org, mingo@redhat.com, aneesh.kumar@linux.ibm.com, naveen.n.rao@linux.ibm.com, will@kernel.org, npiggin@gmail.com, bp@alien8.de, kvmarm@lists.linux.dev, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, oliver.upton@linux.dev, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--o+3mIAah6T0Lu29l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 15, 2024 at 01:57:10PM +0530, Anshuman Khandual wrote:
> On 5/3/24 18:31, Joey Gouly wrote:

> > +static inline bool system_supports_poe(void)
> > +{
> > +	return IS_ENABLED(CONFIG_ARM64_POE) &&

> CONFIG_ARM64_POE has not been defined/added until now ?

That's a common pattern when adding a new feature over a multi-patch
series - add sections guarded with the Kconfig option for the new
feature but which can't be enabled until the last patch of the series
which adds the Kconfig option after the support is complete.

--o+3mIAah6T0Lu29l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmaWc9UACgkQJNaLcl1U
h9AE/Qf+Mp0vA/IFkYbl4mm5ponXV9Jh6x5rZSfeflZF96wTd3pBu5Y1PK36VG4R
hDFz7jcBPMBxn7afJA/mlfBPGWQXajmqTcK9TRVaWEG9rj54IZ7XCSiRItv2TwgJ
tGmxIj+O7pyTiDPz0cHxfxAlZ+Yz+RCe8YfKhbPXDxg51hu6UIWxYZ/v9aJtxC4V
tkXEFL+purD/K9Hp6wFTK3VAQFbsNyYcc8ulWXf3qGOHILnb8hznV4ei4BbqHKGk
TsqLVYHBT9RwW4q6RB2O9JeLOm5U7I17+YmBqEvZY/LIZzBtvZ/xYBsh4UCPt/6s
kNbCozOSV32r4nb/Z+kpJqbf9lA7ug==
=cS6P
-----END PGP SIGNATURE-----

--o+3mIAah6T0Lu29l--
