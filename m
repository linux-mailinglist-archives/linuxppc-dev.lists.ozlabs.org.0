Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6CA931BB2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2024 22:18:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TuGYsfLc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WND6Q0gRwz3dHm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2024 06:18:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TuGYsfLc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WND5l2tTYz3c3l
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2024 06:17:47 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9ACFECE102E;
	Mon, 15 Jul 2024 20:17:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10193C32782;
	Mon, 15 Jul 2024 20:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721074664;
	bh=nV0pV7geh3E0Gng/hveSYWznkIUJ2IUGHcX8dzFXWOY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TuGYsfLcx4GspKL86Eh/mosMZut+5IR33yPnktkxhHSsLtJLwoG7R+PTdsfJaGNGv
	 EEsBgrMTB/d9+P3pG00k5CpvXUlXXAUp06SkyRUyXzXG5Gg1QfUVaAwFJnEDA81Eve
	 XCiLvlIQNT3XrJ79nV1CWO/lkeMB4onsXrzbIfzKukWEVI5fcH5gd1lG8G0Sa67wNg
	 SgOOQzlTIfTSa1WWFAGegf9V1reI0i3t/93fD1W8pVcDHtiv3ZHiQoI5/uSe4cmJY9
	 NbZlWOo3IIm1W58H9bQP5k72fSzsTKG5TnnyM/uiLPOVNFWGsyHwa2tFqGd8P45cDq
	 ZBFIDVDbN9n2w==
Date: Mon, 15 Jul 2024 21:16:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Joey Gouly <joey.gouly@arm.com>
Subject: Re: [PATCH v4 10/29] arm64: enable the Permission Overlay Extension
 for EL0
Message-ID: <a867d629-270f-4f34-90a6-4bc346e5c018@sirena.org.uk>
References: <20240503130147.1154804-1-joey.gouly@arm.com>
 <20240503130147.1154804-11-joey.gouly@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Q58zRk7wvnj6jGJn"
Content-Disposition: inline
In-Reply-To: <20240503130147.1154804-11-joey.gouly@arm.com>
X-Cookie: You'll be sorry...
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
Cc: szabolcs.nagy@arm.com, catalin.marinas@arm.com, dave.hansen@linux.intel.com, linux-mm@kvack.org, hpa@zytor.com, shuah@kernel.org, maz@kernel.org, x86@kernel.org, christophe.leroy@csgroup.eu, aneesh.kumar@kernel.org, mingo@redhat.com, naveen.n.rao@linux.ibm.com, will@kernel.org, npiggin@gmail.com, bp@alien8.de, kvmarm@lists.linux.dev, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, oliver.upton@linux.dev, aneesh.kumar@linux.ibm.com, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--Q58zRk7wvnj6jGJn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 03, 2024 at 02:01:28PM +0100, Joey Gouly wrote:

> This takes the last bit of HWCAP2, is this fine? What can we do about
> more features in the future?

HWCAP3 has already been allocated so we could just start using that.

--Q58zRk7wvnj6jGJn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmaVg6sACgkQJNaLcl1U
h9AW9Af+JYOKBw8IlU3TJ8USeMzNKhlTsIR9EXmjyh8mC+eUbN+xIrb5A7B4dG6m
dk6iLPP5/E8GCiVOKSmrN2D8WF4fcCTkl1cwLojd2EkthrMhOX1qgJTkzNosR76D
aVo2JL7YvyiEpKMaZv74UnaxL9zipPWHMwX8tyakt+3F75Jho3fjo/pkNleV8jxl
bALzynA7fKtt7p2R57PbLXPhTLG4IxG/8gH2ODuDwMj6o46ng4BmOfZXlgaqOgsT
RxnODCG0OpXODiw+QlMS/JBrbg21d3Rc3CHVUsz4INNeI0WRL1yv35HFKWdfhuIQ
v1DA+hOMClSlNNEQ+qWr3JYq7W6eqw==
=sIpQ
-----END PGP SIGNATURE-----

--Q58zRk7wvnj6jGJn--
