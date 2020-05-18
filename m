Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA0E1D751F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 May 2020 12:26:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49QZv20GP7zDq7w
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 May 2020 20:26:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=esCVAepP; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49QZsB6YBGzDqVP
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 May 2020 20:25:18 +1000 (AEST)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9047A20657;
 Mon, 18 May 2020 10:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589797516;
 bh=Eaeopgb7k64NvMRJRFgKStNcTRQI/XLC/CYzyt+WMZM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=esCVAepPOf2uIfV4GcU4IVH5KCwyFK5iyZq5UBUM6vL5beEz3krpBi66kjN4sfuV5
 +LF+4ve0dcSh6BUfua9fo+3rjQztB9nZwNO6hv1Pfz4UwXeYbWolvR6PuLOKQiGSVS
 YMF+XTc6C1RuWqZm0egXkJ6G3zGXdbI7n5CkvwIQ=
Date: Mon, 18 May 2020 11:25:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Tang Bin <tangbin@cmss.chinamobile.com>
Subject: Re: [PATCH] ASoC: fsl_micfil: Fix format and unused assignment
Message-ID: <20200518102513.GA8699@sirena.org.uk>
References: <20200518074405.14880-1-tangbin@cmss.chinamobile.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="PEIAKu/WMn1b1Hv9"
Content-Disposition: inline
In-Reply-To: <20200518074405.14880-1-tangbin@cmss.chinamobile.com>
X-Cookie: If in doubt, mumble.
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linux-kernel@vger.kernel.org, perex@perex.cz, nicoleotsuka@gmail.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--PEIAKu/WMn1b1Hv9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 18, 2020 at 03:44:05PM +0800, Tang Bin wrote:
> In the function fsl_micfil_startup(), the two lines of dev_err()
> can be shortened to one line. And delete unused initialized value
> of 'ret', because it will be assigned by the function
> fsl_micfil_set_mclk_rate().

This is two separate changes with no overlap so would have been better
sent as separate patches.

--PEIAKu/WMn1b1Hv9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7CYoYACgkQJNaLcl1U
h9DxVwf9EjET5pmKEmkJIyEEevXgdVBnEiqOseuE559viDAK89WlL+AGIO+0E0+P
rALP/qUBAX1MVom2U+GtBsuYLlSYKjP4g7vTwcKihKhapvLL50UyRD41wdE0sYAo
cfZd+cZrNUKRtyoUjpEMssa8xiz2f6ygBWbvqOO3MRCLyEraQ5bF5+OkcanGY9j+
k0L5GL1cjdX5Ts6QkdO0EF1JOgCzgUKOETwQC/U8KKw26Gvn6pngBVRJZGFEvI83
cKKf3NQeVZtsO0g+qsl+mU4jXuIdkTv0Z1ptdvCa/MhhYkbzLWoiJh+jqoldRJ3s
Jcb75FYE6uBLd1xSoB8ybjT/KGOY9g==
=CoR6
-----END PGP SIGNATURE-----

--PEIAKu/WMn1b1Hv9--
