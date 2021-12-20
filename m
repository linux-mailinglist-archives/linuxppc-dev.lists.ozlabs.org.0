Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA9A47A9B6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Dec 2021 13:31:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JHf97472kz3c5Z
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Dec 2021 23:31:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nYzm9Jmv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=nYzm9Jmv; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JHf8V0Qxbz2xr3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Dec 2021 23:31:21 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6949E6102D;
 Mon, 20 Dec 2021 12:31:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D67BC36AE8;
 Mon, 20 Dec 2021 12:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640003477;
 bh=i25KeYvLqv8bmnNiXOuTvfwiv8T+bOL5zwFzIAnI7yE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nYzm9Jmv9h4WIy0H423pWluJsb9rDkATgoPPgzOMwCEDNvcFh4ZS/YYWpHFIcxJJo
 xANLCiA+d0H/u1UxIvTaZ8C2hZndQsbONXIThDFMJZ7A2Yu9U6DqaToGP5AAcubVvA
 ANl6cPIT5egHtLjFrf/0yWPJqWdN0EOWWzMI2gwohEU5rXTqk8dfDhsfjc/kBkNmjk
 QR+EGNwVjohV3qD8J+gSVU4+CNsGsHGSbQvi+pcMWAsmAYNkVFHPRTLMjmizAHA/E2
 saO9DXoEPqq/1o8F56tuqfzLRatsPbtN54PR7nwxG2Q6T+sSop7+0+kYxdnnimU7gg
 Y/8LfLSALIVtA==
Date: Mon, 20 Dec 2021 12:31:13 +0000
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] powerpc: dts: Remove "spidev" nodes
Message-ID: <YcB3kTelEHBvcsGA@sirena.org.uk>
References: <20211217221400.3667133-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="eQZIqh1wMxp77hgz"
Content-Disposition: inline
In-Reply-To: <20211217221400.3667133-1-robh@kernel.org>
X-Cookie: Christ was born in 4 B.C.
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--eQZIqh1wMxp77hgz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 17, 2021 at 04:14:00PM -0600, Rob Herring wrote:
> "spidev" is not a real device, but a Linux implementation detail. It has
> never been documented either. The kernel has WARNed on the use of it for
> over 6 years. Time to remove its usage from the tree.

Reviwed-by: Mark Brown <broonie@kernel.org>

Thanks for cleaning these up.

--eQZIqh1wMxp77hgz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHAd5AACgkQJNaLcl1U
h9AmbQf9G/i81z0y9A3tciRvrblQ24v7aDb4HyS/CjCPbTIAvDwEY75F3UuSQdiX
u66pm9EGC4x/cbRWdnf7slxhhevUGpv9WrxH1WvY9BDGo558GP0ApQd2bd5ifdFr
zsrABMp7ee5dJeBq7zYtLY560AIgypoP3331L+kKiNkeoozARrHbUrtANG4SVaVD
RkdKO1efkdyas9B0npaDBFQIFhFDBo2y8Wq+/e/CMEHNHflyKlEjVl5vHZ6OuOsS
GdCAKCnyTnKbs9Wjckq0ibX42HKX9dxxcGxBvoK8TVMlUXoCIu/AOxN0t63DcarF
wUv9MQWnRMXWZlEskQZ0Ym5tM5oqOw==
=sdX5
-----END PGP SIGNATURE-----

--eQZIqh1wMxp77hgz--
