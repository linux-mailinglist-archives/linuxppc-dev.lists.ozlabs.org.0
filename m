Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 099CC8D6709
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 18:40:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dSD3vp0E;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VrTPy1w1Pz3fyN
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Jun 2024 02:40:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dSD3vp0E;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VrTPF1PWKz3fqR
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Jun 2024 02:40:00 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B6E11CE1D0F;
	Fri, 31 May 2024 16:39:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E30C6C116B1;
	Fri, 31 May 2024 16:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717173599;
	bh=rlYXMn9txVbGYCPiT2IUpgeD44MrV8UPEyTPDwBy2Tk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dSD3vp0EAmW3nQ4jBdkff5x8LhXhmeFSYjYCRtLGk9qtpcSIZtZWjiE0CpQ2PzxQG
	 zq8S87nbi8joiFp3jMggqggvZNfuUE+8cUzIpK9+5B9iud3ukrsQmxDrR9gP3vcCYM
	 2EtmrX3DIxOWBZb8slu2bltZvdr8hLJw0rZU28LN29nZCAoabp7PbOllZeJho9tGBX
	 Xb6CcTbaxFh7g+zcdkqIY2G2nd0RUVAzTmKC/cwjoAEmV6derZ1lQWvYJc5KiQH+OR
	 xsiLE2t3HEY0uiywjJbomMZLqWwmNUv+lV4FB+jXwbYBSshDHzUyKDOu1WXCqi7Fwn
	 gSwAB/Ll67+Dg==
Date: Fri, 31 May 2024 17:39:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Amit Daniel Kachhap <amitdaniel.kachhap@arm.com>
Subject: Re: [PATCH v4 18/29] arm64: add POE signal support
Message-ID: <7789da64-34e2-49db-b203-84b80e5831d5@sirena.org.uk>
References: <20240503130147.1154804-1-joey.gouly@arm.com>
 <20240503130147.1154804-19-joey.gouly@arm.com>
 <229bd367-466e-4bf9-9627-24d2d0821ff4@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="crruTSd4fVdttIMX"
Content-Disposition: inline
In-Reply-To: <229bd367-466e-4bf9-9627-24d2d0821ff4@arm.com>
X-Cookie: Serving suggestion.
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
Cc: szabolcs.nagy@arm.com, catalin.marinas@arm.com, dave.hansen@linux.intel.com, Joey Gouly <joey.gouly@arm.com>, linux-mm@kvack.org, hpa@zytor.com, shuah@kernel.org, maz@kernel.org, x86@kernel.org, aneesh.kumar@kernel.org, mingo@redhat.com, aneesh.kumar@linux.ibm.com, naveen.n.rao@linux.ibm.com, will@kernel.org, npiggin@gmail.com, bp@alien8.de, kvmarm@lists.linux.dev, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, oliver.upton@linux.dev, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--crruTSd4fVdttIMX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 28, 2024 at 12:26:54PM +0530, Amit Daniel Kachhap wrote:
> On 5/3/24 18:31, Joey Gouly wrote:

> > +#define POE_MAGIC	0x504f4530

> > +struct poe_context {
> > +	struct _aarch64_ctx head;
> > +	__u64 por_el0;
> > +};

> There is a comment section in the beginning which mentions the size
> of the context frame structure and subsequent reduction in the
> reserved range. So this new context description can be added there.
> Although looks like it is broken for za, zt and fpmr context.

Could you be more specific about how you think these existing contexts
are broken?  The above looks perfectly good and standard and the
existing contexts do a reasonable simulation of working.  Note that the
ZA and ZT contexts don't generate data payload unless userspace has set
PSTATE.ZA.

--crruTSd4fVdttIMX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZZ/VYACgkQJNaLcl1U
h9Ci3wgAgleCKLaBEMbJu0CzmzGdWvFcfWAwe7pJAUfgV6FDy/JI8Gy8L94zl2Gw
7U3DH3qDg1TZkpc+LT7nqNuoXy4rjjES8veABih0GdUG8DILjqvgitPM6smrf391
KPXshBFPzSV8efQnp15FPdkUJ/jF6+EqJ6Q03F4FOlYbPMRH0d1GKVmU+r09JNOD
2Gh2GZOhyuCLUqqwuDmjpgvHScykEMIN+c7mX1MDYt0xmC9SFTWI7w7Knv15wNPG
I5Bzm7+iqF4KLxD5qazPSlsNihVRSEFDajD8tTpx9601oadr7+oG51y4P71GloJz
c8HHc7Cs4xJpmMSz2TvtDfKpKVWj0w==
=+zed
-----END PGP SIGNATURE-----

--crruTSd4fVdttIMX--
