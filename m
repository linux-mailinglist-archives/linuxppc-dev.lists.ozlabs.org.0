Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE462F4B66
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jan 2021 13:38:03 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DG6RW15P4zDqL0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jan 2021 23:37:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DG6MN58nSzDqxM
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Jan 2021 23:34:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=T3rrwfot; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by ozlabs.org (Postfix) with ESMTP id 4DG6MN1wWWz9sVy
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Jan 2021 23:34:24 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 4DG6MM0yQJz9sWP; Wed, 13 Jan 2021 23:34:23 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=T3rrwfot; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4DG6MK28Pwz9sVy
 for <linuxppc-dev@ozlabs.org>; Wed, 13 Jan 2021 23:34:21 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6D90723339;
 Wed, 13 Jan 2021 12:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610541259;
 bh=h9vp+z5IyuvmKXzLAbhb8Rntz6LzAx339QE/OJ3/nOw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T3rrwfotM2eUI1TK7AANu7ae8cfrIGpC/1dMQAq4jz9eY8RerRxE5bUfgvSc1hxyC
 sSQX4XdCPnyy4ESqoi0hbMZjrpw8/uyY3A+6SxaYl2T7+RrQ6fu0jVrncMZpXL6dcH
 d4gwa5IhWP9Ib89yfFpNL0NOS+DaDxdNoxO/yG/8HqCWDE0UNNwme1SGNBPVg0g5xF
 MI+PJcjfeNYPecvBHJGqN7GXjz60aNTgHOilSrHmvNJFPsKfLDu8RbEiUmKRpVnlqQ
 bfbBg+ZNRL0Va/oVHUK+PDqAOO4ybCULnREw1jo87SXViCfzEkM0NtTCjKdP+VJyhF
 sXoBumfS6A+Fg==
Date: Wed, 13 Jan 2021 12:33:45 +0000
From: Mark Brown <broonie@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: SPI not working on 5.10 and 5.11, bisected to 766c6b63aa04
 ("spi: fix client driver breakages when using GPIO descriptors")
Message-ID: <20210113123345.GD4641@sirena.org.uk>
References: <dc5d8d35-31aa-b36d-72b0-17c8a7c13061@csgroup.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="x4pBfXISqBoDm8sr"
Content-Disposition: inline
In-Reply-To: <dc5d8d35-31aa-b36d-72b0-17c8a7c13061@csgroup.eu>
X-Cookie: Ignore previous fortune.
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
Cc: "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>,
 Sven Van Asbroeck <thesven73@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--x4pBfXISqBoDm8sr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 13, 2021 at 09:49:12AM +0100, Christophe Leroy wrote:

> With commit 766c6b63aa04 ("spi: fix client driver breakages when using GPIO
> descriptors") reverted, it is back to work:

...

> What shall I do ?

I would guess that there's an error with the chip select polarity
configuration on your system that just happened to work previously, I'd
suggest fixing this in the board configuration to bring it in line with
everything else.

--x4pBfXISqBoDm8sr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/+6KgACgkQJNaLcl1U
h9CnbQf/fAtzQXX3e/4ey7wtx8MdEcgSbGpsx3rzEpk48zhiyY1XjYqXC+64WFCB
mZNlgLSCq5odAUTDBaOD0gn67E8AgVZi+NW0F8ibMLJQBEAa8wcEO7YhfEPcPJmv
3Ncha3suxToG2lWeuLceU71mP8ixfoCgodzgV58iXcFqsERnIH60lIN3MpBvjXYt
CB8YbV/g8OzUkB/rb+g/k8UvRQNO3I28DiyGnYBkYo/aM3OdGkzJnhKAc2MyH+VR
f1no1xAcxyCL/aP0BZGMQ9hAPWVyqvisw85x7Ubv5dt7MMeqNKYQfq3Wi4bD4MRq
NBrDQ7bCEF2WDrV2y4Z5iUWmhjWW5w==
=zTCg
-----END PGP SIGNATURE-----

--x4pBfXISqBoDm8sr--
