Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id B1B2E8D3BA0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2024 18:01:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GaoQuU+O;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VqDQw1yDcz882x
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 May 2024 01:52:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GaoQuU+O;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VqDPr4DYJz87Xj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 May 2024 01:51:12 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C3631CE1851;
	Wed, 29 May 2024 15:51:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9C84C32789;
	Wed, 29 May 2024 15:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716997869;
	bh=yfp/7KVmaD9soBtmKL6q5BZ78PtD4h6vksVq6qycOPU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GaoQuU+Ob2D3PlaLdueq8ggVFX6iSg+v2w6qHqkuwkS9CIgWTLw5y7rGQ7+5GR4Fg
	 uANNlFpP1VgfT6if855Wvm9NdJN5hRzQP8OUOXnuwKFyjKE8G12ivBjGrC1LcCD6w/
	 2CbGLQHQSM6PJj0po0Ffs9ICz8Me24rTqw+GAiNZZ5D95XM1c/Be35pC/WsJGQWlhu
	 cvJiH6240yh986469ZD5sWVoor/vICC4R7TZnHLH5OlRmYRov3nFNqae7tV2jRXm5t
	 74bcVyy7YRqfNy5it18K2OpzG2/9T12ylaqtFtRDxi1h/k1btvzJcvqZ8OIz1ZIaEz
	 EaoL1OtvzQsog==
Date: Wed, 29 May 2024 16:51:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Joey Gouly <joey.gouly@arm.com>
Subject: Re: [PATCH v4 28/29] kselftest/arm64: Add test case for POR_EL0
 signal frame records
Message-ID: <58fb8a27-6c40-4b13-a231-b0db1c16916c@sirena.org.uk>
References: <20240503130147.1154804-1-joey.gouly@arm.com>
 <20240503130147.1154804-29-joey.gouly@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BFkxsI+/n7XbdM1d"
Content-Disposition: inline
In-Reply-To: <20240503130147.1154804-29-joey.gouly@arm.com>
X-Cookie: Everybody gets free BORSCHT!
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


--BFkxsI+/n7XbdM1d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 03, 2024 at 02:01:46PM +0100, Joey Gouly wrote:
> Ensure that we get signal context for POR_EL0 if and only if POE is present
> on the system.

Reviewed-by: Mark Brown <broonie@kernel.org>

--BFkxsI+/n7XbdM1d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZXTuQACgkQJNaLcl1U
h9B5sgf9GRRafV0J2nOmiAXvWZuutE7IagLikzc5FwyU8kvRSUOCwAK+THgPINah
BKWEKe5a8EKzbzzeOWUu2mhw/twKyx6t92RRQsEc4fzFmotuq+6dET2hiVcbjtyk
c1ipV82q2LVB1L7pmftHRXKUZ0DHxgT346HzSi6Oz8hl/+FIN2Wi/AnTmIIqnDrn
VSmKA7dRfJ8aQ7dsRIBk1sbuBHtNHqE0sCsy1CgaRxnh92opgwRwCy/E3g9bl+mw
hfGE1FluYz3zipMP7rHeVMPXJm95ejVZUENNlNglTFZ97NTPJB7hAYc6BVumdHNx
FHZxeYLHzVUNbVEs0vYJplYVSegMdg==
=IfbO
-----END PGP SIGNATURE-----

--BFkxsI+/n7XbdM1d--
