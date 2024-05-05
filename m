Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 044258BC179
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 May 2024 16:42:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RPi6uav5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VXS1d43x3z3fR2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2024 00:42:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RPi6uav5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VXS0x3lfgz2yG9
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 May 2024 00:41:53 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 84AEDCE09E6;
	Sun,  5 May 2024 14:41:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A48ECC113CC;
	Sun,  5 May 2024 14:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714920110;
	bh=/tY7IK1QVTL6FMfA+Ww9aRKIyTlFGPjNOtHtVgAmoKY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RPi6uav5aYbPQfmfHatxieTjhCQQ4RHhRST8lMJVxqqXA1lvsP2881H8aDI6PohGQ
	 LeHY5VWkdagoHfKD2NKLD2h/PE+Y42Qhnk2RnVFDnGPdUGZ6mqz2NJCSp9WbokuMd/
	 gXQZ0f5TIRvmcxHsCK8xTyUTceKjAnZiuv171CcUpOg8lxrdpLoFQ7GGLYtuxOlQyn
	 9CP9XYcDx9tZdI3y7aQdDIIJAKZTAHeBnf+LSQDkrSTpw6ssx0ZdmzC58ADE3cuJaU
	 JCoOiMDMUiDYf2JQLz6PzgY/WxQSO8NGTZOMpJy8nMXPSCsv0xL+sHNGrn7iOi0s5f
	 q8Z086FVh2m/w==
Date: Sun, 5 May 2024 23:41:46 +0900
From: Mark Brown <broonie@kernel.org>
To: Joey Gouly <joey.gouly@arm.com>
Subject: Re: [PATCH v4 00/29] arm64: Permission Overlay Extension
Message-ID: <ZjeaqkJVmNHUBi11@finisterre.sirena.org.uk>
References: <20240503130147.1154804-1-joey.gouly@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Mvqulcr+gDoxw3xu"
Content-Disposition: inline
In-Reply-To: <20240503130147.1154804-1-joey.gouly@arm.com>
X-Cookie: lisp, v.:
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
Cc: szabolcs.nagy@arm.com, catalin.marinas@arm.com, dave.hansen@linux.intel.com, linux-mm@kvack.org, hpa@zytor.com, shuah@kernel.org, maz@kernel.org, x86@kernel.org, aneesh.kumar@kernel.org, mingo@redhat.com, naveen.n.rao@linux.ibm.com, will@kernel.org, npiggin@gmail.com, bp@alien8.de, kvmarm@lists.linux.dev, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, oliver.upton@linux.dev, aneesh.kumar@linux.ibm.com, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--Mvqulcr+gDoxw3xu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 03, 2024 at 02:01:18PM +0100, Joey Gouly wrote:

> One possible issue with this version, I took the last bit of HWCAP2.

Fortunately we already have AT_HWCAP[34] defined thanks to PowerPC.

--Mvqulcr+gDoxw3xu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmY3mqoACgkQJNaLcl1U
h9DyDQf9FoDkCaYHDO5wProKreHZRTnyo5S6VE72gy5he2LZ7cUSiGEdleVivA4u
8R/kRZXT60g/uhii3EkTh2HOot2Bkbkq79OwjSZN1sS9vmvOFqaNe5v+vSVrHaiI
X2EXd0YIlKboeQAsL7RI17OmneWdCX3UzfPckF6xsgPEvWZU46DSc/4kff6/cahW
uAGUC9hcDdU9wrfi26ffmLu2F+V7ro64nLRGotI4jK3klTFRi6uyFE+LAmOii2Cg
erA+PnNqh1uDmi94V8HXlcg+wX/2JlEei+ATyoi5K22UgdyL/0VUG5yPn06Y6DHJ
mjHRwI6iO+NclFXmvqfStSh+YfD4BA==
=cQNP
-----END PGP SIGNATURE-----

--Mvqulcr+gDoxw3xu--
