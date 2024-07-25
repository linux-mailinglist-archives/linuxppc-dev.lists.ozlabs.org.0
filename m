Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FFC693C82B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jul 2024 20:12:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=i8MLbVSU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WVJrZ0ns4z3cXw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jul 2024 04:12:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=i8MLbVSU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WVJqs25wNz30W2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2024 04:11:53 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6E88D61333;
	Thu, 25 Jul 2024 18:11:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9308C116B1;
	Thu, 25 Jul 2024 18:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721931110;
	bh=qMPNAiU4QG51WPd2++7tk9Ir3s3Q0Q2T/8v0cyCK9EM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i8MLbVSUZNyx2oKUzGxGulXalYXs/A3uuRF0gXaAp/dV3ROUF08DFt2kY/IMp5Xcm
	 vlXuoNeyAMEqYxrVUEI1dQlobQI79RrraPupjRZYMkILK/7R65RxA8Oko9h7UBRf1I
	 Njg0GtY8b1A4UiJ6N1oPGBmghESZCD4ochXvxojhpHw4NrPw5RTJoqGGUv1WMWuO2v
	 GmLBdZVjEf2L9xTtJi59xk15gvfikBTs1nGQwnW3F7760FeZ6Ow9iI/7TOkF2iLETQ
	 BfgrrX0qUOsSl2IKa5ozSDfzDbrGZSGqna2afVmNcVJYv1zNPS480l0tCDd/lH0Fxc
	 GHxSJJD0mx8jg==
Date: Thu, 25 Jul 2024 19:11:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Dave Martin <Dave.Martin@arm.com>
Subject: Re: [PATCH v4 18/29] arm64: add POE signal support
Message-ID: <a13c3d5e-6517-4632-b20d-49ce9f0d8e58@sirena.org.uk>
References: <20240503130147.1154804-1-joey.gouly@arm.com>
 <20240503130147.1154804-19-joey.gouly@arm.com>
 <229bd367-466e-4bf9-9627-24d2d0821ff4@arm.com>
 <7789da64-34e2-49db-b203-84b80e5831d5@sirena.org.uk>
 <cf7de572-420a-4d59-a8dd-effaff002e12@arm.com>
 <ZqJ2I3f2qdiD2DfP@e133380.arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zuHkNnSXmHBvO0dc"
Content-Disposition: inline
In-Reply-To: <ZqJ2I3f2qdiD2DfP@e133380.arm.com>
X-Cookie: Zeus gave Leda the bird.
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
Cc: szabolcs.nagy@arm.com, catalin.marinas@arm.com, dave.hansen@linux.intel.com, Joey Gouly <joey.gouly@arm.com>, linux-mm@kvack.org, hpa@zytor.com, shuah@kernel.org, Amit Daniel Kachhap <amitdaniel.kachhap@arm.com>, maz@kernel.org, x86@kernel.org, christophe.leroy@csgroup.eu, aneesh.kumar@kernel.org, mingo@redhat.com, aneesh.kumar@linux.ibm.com, naveen.n.rao@linux.ibm.com, will@kernel.org, npiggin@gmail.com, bp@alien8.de, kvmarm@lists.linux.dev, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, oliver.upton@linux.dev, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--zuHkNnSXmHBvO0dc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 25, 2024 at 04:58:27PM +0100, Dave Martin wrote:

> I'll post a draft patch separately, since I think the update could
> benefit from separate discussion, but my back-of-the-envelope
> calculation suggests that (before this patch) we are down to 0x90
> bytes of free space (i.e., over 96% full).

> I wonder whether it is time to start pushing back on adding a new
> _foo_context for every individual register, though?

> Maybe we could add some kind of _misc_context for miscellaneous 64-bit
> regs.

That'd have to be a variably sized structure with pairs of sysreg
ID/value items in it I think which would be a bit of a pain to implement
but doable.  The per-record header is 64 bits, we'd get maximal saving
by allocating a byte for the IDs.

It would be very unfortunate timing to start gating things on such a
change though (I'm particularly worried about GCS here, at this point
the kernel changes are blocking the entire ecosystem).

--zuHkNnSXmHBvO0dc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmailV0ACgkQJNaLcl1U
h9CJNAf/T4L+WiIsdTTGLKLrGIifWcIZMFDKVEGwW4FdSIpGyr1zBwSxsMMMpYMn
Y2vOp2+u+NUD72aKzhi9w2oDqf/zxrRMRtTac9G5p5yxDJ8A5TnZmLeUCeRDfeaD
KbGzJ+pmP6VAhz6dx1LVHo2/BlPFEBYic7aByH/VtQK5orNc9Ss1pjPj9M1kcMtS
ZpQDRVd9H8sTthXnA2au8VRVeCZIvHB7c6CHXWu8+gv4DVW9fcWaVmq7sKvrt3vA
KH+DHAft/yAobtjLtcPlj5ImoCIbRjmIa4qy3NsHji/xAHl4695sncCMJB7yi0fU
5WfF3lyw+U6HxGVPCH7jlQcjPB7XOw==
=PpFd
-----END PGP SIGNATURE-----

--zuHkNnSXmHBvO0dc--
