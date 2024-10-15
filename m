Return-Path: <linuxppc-dev+bounces-2285-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F98399ED42
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2024 15:26:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XSZcY3CmLz3bcW;
	Wed, 16 Oct 2024 00:26:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728998781;
	cv=none; b=czKW1sMR2nrZRdCMNtGRGdG5gAmPEce7pKePK6SdsF63JNSDsP9AQEUnifKf20LvgILPaQf6qEMXc0LKwkwa9T98B6S/Ptkpkk+GYwOLccMjkg75sQpsH2/94Pzlu9GlEFQwgKDtNcy4Vuqtpd0koi5Rct77y8WsLOYMA1h5oj7Q2+xlUt3V/spw0BFt+F0S6WKb/ANetOALk8MogxBf570t2gUs8B2Np/WH9PKfNbB6ysoxi+cYYGt0L5W30BuWTWbS4njAOeezmjUWixNU2iDmgJZQev8LXxc5+VCsHgMQEYyU5NdTmWODAB1DDPXDwNgJWYlID7ngemZbXisP2g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728998781; c=relaxed/relaxed;
	bh=OLL/FHpOgdkgTUSJ+XP8UQ6hU/ajTm9thb2i8HtEvvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E5diZAk92MJQ8I3B6VHpfDNuv3flKzG/t8WZcZ5DzE11lLIxU4SdGSTg2F9LcSyPg5SsGz2ABOqGUDaHh2eZDcjEUk4YgB3rxMrnk49kCUr1PRy4Dq9CmKBgf4SypbYKQ0XkTAZYaMrtDQXytwfHD1KPoaPTjYU0XG0pORqbwIfkXtapqcCSx2aexL33gCmEUgdOnCdHz615GtG0T5Q9glwKdfMetjSr7KG15EMVsyol9ChRIM52YSxwL+BRPLWnowFhqWWXKGw6qnzPhpwL4DFodixJaJToQlqwgj9+82s6tqlzVHDB36vh0XWjj69YWIMBTHye/JivkoALVx+jYw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FrKsNHUr; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FrKsNHUr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XSZcX2LgXz2xtK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2024 00:26:20 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9B8535C5C6C;
	Tue, 15 Oct 2024 13:26:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B3CCC4CECE;
	Tue, 15 Oct 2024 13:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728998777;
	bh=oFFPT5mvvt/DlJJSCGR58VuLSdcKbAv5xgnJpcGR0tY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FrKsNHUrBSbtPVikj1FML7vlz2mzC3ZXIoGIfrjrUd5GNlvj7byXhK69OID1comZ3
	 ERsc0zdXy2HK9A2Z7G99T+h/RV2RmGFRkCXOSx8aShAqDswaIjUsafckOOSl1skiEU
	 I2tf+OBx0u4OvVcY4HsF2UpTQUhJbpZzsK31x/FIIThfUQgmq8SNCnsUS81S2+rnJn
	 JbezWxhO8+rA32VdG2XOwewpI/bX783q2XyJgeqNS477KHazRAG5kVkrecFNa/Tgu6
	 T9M85n1LAvOk5DzGVWzOFVwwmW+vDtjPlBvN5IHs9Pu+Y+jgPolGy/RrDmde4Rw9M3
	 Bn4LSqGCTRfig==
Date: Tue, 15 Oct 2024 14:26:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Joey Gouly <joey.gouly@arm.com>
Cc: Will Deacon <will@kernel.org>, Kevin Brodsky <kevin.brodsky@arm.com>,
	linux-arm-kernel@lists.infradead.org, nd@arm.com,
	akpm@linux-foundation.org, aneesh.kumar@kernel.org,
	aneesh.kumar@linux.ibm.com, anshuman.khandual@arm.com, bp@alien8.de,
	catalin.marinas@arm.com, christophe.leroy@csgroup.eu,
	dave.hansen@linux.intel.com, hpa@zytor.com,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org, maz@kernel.org, mingo@redhat.com,
	mpe@ellerman.id.au, naveen.n.rao@linux.ibm.com, npiggin@gmail.com,
	oliver.upton@linux.dev, shuah@kernel.org, skhan@linuxfoundation.org,
	szabolcs.nagy@arm.com, tglx@linutronix.de, x86@kernel.org,
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 19/30] arm64: add POE signal support
Message-ID: <e9eb6cf1-1ed4-45b0-85c1-39028728f952@sirena.org.uk>
References: <20240822151113.1479789-1-joey.gouly@arm.com>
 <20240822151113.1479789-20-joey.gouly@arm.com>
 <47e1537f-5b60-4541-aed1-a20e804c137d@arm.com>
 <20241009144301.GA12453@willie-the-truck>
 <20241014171023.GA18295@willie-the-truck>
 <20241015095911.GA3777204@e124191.cambridge.arm.com>
 <20241015114116.GA19334@willie-the-truck>
 <20241015122529.GA3820764@e124191.cambridge.arm.com>
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
	protocol="application/pgp-signature"; boundary="VY579BsplRjShns6"
Content-Disposition: inline
In-Reply-To: <20241015122529.GA3820764@e124191.cambridge.arm.com>
X-Cookie: New customers only.
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


--VY579BsplRjShns6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 15, 2024 at 01:25:29PM +0100, Joey Gouly wrote:
> On Tue, Oct 15, 2024 at 12:41:16PM +0100, Will Deacon wrote:

> > 	if (system_supports_poe() && err == 0 && user->poe_offset) {
> > 		...

> > which gives the wrong impression that the POR is somehow optional, even
> > if the CPU supports POE. So we should drop that check of
> > 'user->poe_offset' as it cannot be NULL here.

> That was cargo culted (by me) from the rest of the function (apart from TPIDR2
> and FPMR). I think Kevin is planning on sending his signal changes still, but
> is on holiday, maybe he can remove the last part of the condition as part of
> his series.

That's there because the decisions about "should we save this thing" are
taken in setup_sigframe_layout() and for a bunch of the extensions we
suppress the saving if they're in some sort of default state (eg, when
we don't have TIF_SVE set we don't output the SVE sigframe).

--VY579BsplRjShns6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcObXAACgkQJNaLcl1U
h9Buxgf7B6JxtnaQV7bcQdxU3W/45vjVnsJAj4oq+mBBFjqBV2314SqKcMSBrcJ1
xE3cGR9A04qVmbrPzOkCkiHLXWFD6I/JAZP9eAZGwJXU0Jr8fJWBnXFqDEUdWstw
XRJtiGFQkpdq/e0ijRt5DymHm18i/lEE/eg6Zi2o621Abzx9QNS+LMKkn9WpTOk8
W/xOE+DMhh2zpccEJ8VU2HgFJxZ/EcqC/fgkBlJTTApUuvHNdhue2DyBAgzIIsoq
2UYiKeiDTIkN07oUwJ7pRlftHSrLAZyM6WfK8+SZ2rQ1QzhTX8KUz5WzBw3BBpz5
7nn2tj3oFNHFeCRd88yFJnu0JH0lIw==
=yrSH
-----END PGP SIGNATURE-----

--VY579BsplRjShns6--

