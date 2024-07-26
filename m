Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ADFB93D7BD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jul 2024 19:40:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DV/Z7vEt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WVw4v1rN7z3dV3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 03:40:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DV/Z7vEt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WVw4C2xp8z3dHj
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jul 2024 03:39:39 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 865E86181E;
	Fri, 26 Jul 2024 17:39:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 184F0C32782;
	Fri, 26 Jul 2024 17:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722015575;
	bh=8w1mM4hsz30RIDmoijcUZjPnnrqcKXvR4sSqM1tep/4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DV/Z7vEtOQ6fpK1XlwOsYQ7qcHj5loTqEE6QOhCsSqjvyq9NRvKlcmNtdC2g8jhY6
	 aWv73Vf0gzmua1r6eBaKdypdddT45gnW/E0ABD3it7eli5FXDS+vnvrvDj+V5Zfuuf
	 xJNXr3X9g2ZxiiKEMQrknbNds0YasB4VTugZ9IQSP4WKpt7pUqp9dLjKWUReroNOBk
	 zdaLXSY7z39Eb+B855w+mW2obCbZIuBQWm6KGs+ypfSLztcWYns4CkQV6YGLM+lL6w
	 dPuiR8OQU9eJqPpaihNfj/a0aVBCnjAMFu+cCYtlW4GgQA0xW00IYT91LmXOdgA9e2
	 EkBh389uPh7Pg==
Date: Fri, 26 Jul 2024 18:39:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Dave Martin <Dave.Martin@arm.com>
Subject: Re: [PATCH v4 18/29] arm64: add POE signal support
Message-ID: <a52f1762-afd4-4527-88ac-76cdd8a59d5d@sirena.org.uk>
References: <20240503130147.1154804-1-joey.gouly@arm.com>
 <20240503130147.1154804-19-joey.gouly@arm.com>
 <229bd367-466e-4bf9-9627-24d2d0821ff4@arm.com>
 <7789da64-34e2-49db-b203-84b80e5831d5@sirena.org.uk>
 <cf7de572-420a-4d59-a8dd-effaff002e12@arm.com>
 <ZqJ2I3f2qdiD2DfP@e133380.arm.com>
 <a13c3d5e-6517-4632-b20d-49ce9f0d8e58@sirena.org.uk>
 <ZqPLSRjjE+SRoGAQ@e133380.arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jKu8x7uvwJS8RqOX"
Content-Disposition: inline
In-Reply-To: <ZqPLSRjjE+SRoGAQ@e133380.arm.com>
X-Cookie: It is your destiny.
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


--jKu8x7uvwJS8RqOX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 26, 2024 at 05:14:01PM +0100, Dave Martin wrote:
> On Thu, Jul 25, 2024 at 07:11:41PM +0100, Mark Brown wrote:

> > That'd have to be a variably sized structure with pairs of sysreg
> > ID/value items in it I think which would be a bit of a pain to implement
> > but doable.  The per-record header is 64 bits, we'd get maximal saving
> > by allocating a byte for the IDs.

> Or possibly the regs could be identified positionally, avoiding the
> need for IDs.  Space would be at a premium, and we would have to think
> carefully about what should and should not be allowed in there.

Yes, though that would mean if we had to generate any register in there
we'd always have to generate at least as many entries as whatever number
it got assigned which depending on how much optionality ends up getting
used might be unfortunate.

> > It would be very unfortunate timing to start gating things on such a
> > change though (I'm particularly worried about GCS here, at this point
> > the kernel changes are blocking the entire ecosystem).

> For GCS, I wonder whether it should be made a strictly opt-in feature:
> i.e., if you use it then you must tolerate large sigframes, and if it
> is turned off then its state is neither dumped nor restored.  Since GCS
> requires an explict prctl to turn it on, the mechanism seems partly
> there already in your series.

Yeah, that's what the current code does actually.  In any case it's not
just a single register - there's also the GCS mode in there.

--jKu8x7uvwJS8RqOX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmaj304ACgkQJNaLcl1U
h9CeVAf/WJj2W/iYeqVHnIEx+p4FWw5ApJBNcEdmXOIBDVGUJEIji/s5+DIMmTsR
GnMMoGn0PGovhD7ABJPly+Ysr1Ma/cWGs/eia+AhmGLvDh7ATNWxUWPWoQpfH4vI
FFXbia4AkmLZ34lsI6P1BKT5wTRVWQj9QaTTCFxVdoNmBF7nYgnT0u0A4Od9O9Vm
iX064HfEvrM/PwRID8FMKY2pXuOWTRWJrQ7X1l75V7H0wdUW1h6b5tWIyUuoZIOl
RChlS70kcpLdwt6Y0KjNj5bblDCwZ3KNQPEVcEWq2lMChKzoxm1I1QNmc7XEAqf9
JC4bAZwKKaKlseDDs61j4qyz/Nj1Hg==
=DfYC
-----END PGP SIGNATURE-----

--jKu8x7uvwJS8RqOX--
