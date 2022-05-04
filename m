Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 946AB51A30E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 May 2022 17:04:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ktg8q3dfjz3bmW
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 01:04:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sBTekUai;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=sBTekUai; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ktg882dRTz3bbw
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 May 2022 01:03:52 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 87F2361B53;
 Wed,  4 May 2022 15:03:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2E58C385AA;
 Wed,  4 May 2022 15:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651676626;
 bh=gS9cgRft2gHupLhQNBtsqLQ0zVLeGAsSN5zeFP4h4k0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sBTekUaifCimlhjajkdL2NZyWiN3UFz7vjqLSot0sBDx9tF8DMYExUV2qDoaPNn5b
 KYO/QdA7xVibP7boWTEEtGaJGWb+tPRd3xB1YLqOwY7orcA7r6m4ILsbaf7rmMCy1e
 zIvneMbbhxbXioMm7LBxTjne2J0GLD4i525V1CTJMxU8AM94aF2R9HWSPxK43y80Xt
 rFOOsJnWrxpu7lJszvL6UPaFYbQ7mCfcQCdphzeLNRJwC3Qb9dAJoV3siInlSIlqVf
 2EedtYa8TST1srSugZyIjH+iBTS0FYtdUhxy14vaJEjJKP2wDfRWRZuwDo5V8Hk3xh
 SLciCY6XIkF2A==
Date: Wed, 4 May 2022 16:03:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 2/4] powerpc/mpc5xxx: Switch
 mpc5xxx_get_bus_frequency() to use fwnode
Message-ID: <YnKVytydpZeNWsBP@sirena.org.uk>
References: <20220504134449.64473-1-andriy.shevchenko@linux.intel.com>
 <20220504134449.64473-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="YyVuIp0t4l9kBDGR"
Content-Disposition: inline
In-Reply-To: <20220504134449.64473-2-andriy.shevchenko@linux.intel.com>
X-Cookie: Mother is the invention of necessity.
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
Cc: linux-ide@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Paul Mackerras <paulus@samba.org>, linux-i2c@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, Jiri Slaby <jirislaby@kernel.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 linux-serial@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Anatolij Gustschin <agust@denx.de>, Wolfgang Grandegger <wg@grandegger.com>,
 linux-can@vger.kernel.org, Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Marc Kleine-Budde <mkl@pengutronix.de>, Sergey Shtylyov <s.shtylyov@omp.ru>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
 netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--YyVuIp0t4l9kBDGR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 04, 2022 at 04:44:47PM +0300, Andy Shevchenko wrote:
> Switch mpc5xxx_get_bus_frequency() to use fwnode in order to help
> cleaning up other parts of the kernel from OF specific code.

Acked-by: Mark Brown <broonie@kernel.org>

--YyVuIp0t4l9kBDGR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJylckACgkQJNaLcl1U
h9BYbQf/d+R2/K8I9P6XsFeNBBDkbkBKu4u+dnvyBvda1uA0bN681S7UN/+65MPC
sNd9OZXoE0bx/AnrXyZlW+IJC2jWyLcwL9rGR4hrIkW1w50MqD6WWl6XRe+cmYSF
W+/goNVZ9EcqhviJXuhSTy7Cu14LU7V4uFUWR/MOcjmFD0hxnUJNub6xJsdUsf8I
pAEjZJB7TEiPpN6SXvENzukmdyQewPL6RqLTTIki9dUXE9fn1ixsvQX0bBd5yY1e
vWYnszaplvlFBXwDLftPDtQ+880HVZK0VrXJpCfPW2MqfFsDovNNQyZdlR4T0W9w
rUS8W2LQXMCfj7BSLZ+tUgPA+OoNKg==
=mP8/
-----END PGP SIGNATURE-----

--YyVuIp0t4l9kBDGR--
