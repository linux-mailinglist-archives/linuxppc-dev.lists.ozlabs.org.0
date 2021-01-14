Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C4ED22F629D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jan 2021 15:03:25 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DGmHY2cHkzDsg0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 01:03:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DGmCL6m7bzDqrX
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 00:59:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=MS2p0keP; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by ozlabs.org (Postfix) with ESMTP id 4DGmCL5PKHz9sVt
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 00:59:42 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 4DGmCL4n3wz9sWC; Fri, 15 Jan 2021 00:59:42 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=MS2p0keP; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4DGmCL1XPQz9sVt
 for <linuxppc-dev@ozlabs.org>; Fri, 15 Jan 2021 00:59:42 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 83AA123A69;
 Thu, 14 Jan 2021 13:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610632780;
 bh=ladoP6+LmH3OTLqx40cXlLNjDwqMk+v5QZwHRlHcYHQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MS2p0kePgx1mItBQV8PxP9zm4Rnw2L2Xxk/El67hV9Vi+315U5V7diGBJwg8b7BN5
 iSK4UmtGJFl6amo5/6t+q2BaLGWNMsqhUBTZevtK4j7TRCcvt8lS5rcKboq2tP99dK
 e8asBdVB5kJVmvKsk7Ky5qWtUZG+HwuDiXlwRTOqJBtnLYg2iSroSnsVfWyohxaauQ
 hmD5v1B36dJFqur3QcKpCornGufYDgx9LY3fy5KXxYZd7NjkL4lJ2jQPhD62nCLEAz
 vA31LD5zSHLLDP24y7U18dWC1AnsCjaWze1PkuZB0RPOHeN1f+6IvNz6pOnZnj0lUq
 r24FRwrefZGMw==
Date: Thu, 14 Jan 2021 13:59:06 +0000
From: Mark Brown <broonie@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: SPI not working on 5.10 and 5.11, bisected to 766c6b63aa04
 ("spi: fix client driver breakages when using GPIO descriptors")
Message-ID: <20210114135906.GF4854@sirena.org.uk>
References: <dc5d8d35-31aa-b36d-72b0-17c8a7c13061@csgroup.eu>
 <20210113123345.GD4641@sirena.org.uk>
 <9400d900-f315-815f-a358-16ed4963da6c@csgroup.eu>
 <20210114115958.GB4854@sirena.org.uk>
 <006d1594-8eec-3aad-1651-919071e89f3b@csgroup.eu>
 <20210114132258.GD4854@sirena.org.uk>
 <adbf508d-ed5a-e06a-4a59-98df0229d7b4@csgroup.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Il7n/DHsA0sMLmDu"
Content-Disposition: inline
In-Reply-To: <adbf508d-ed5a-e06a-4a59-98df0229d7b4@csgroup.eu>
X-Cookie: You have taken yourself too seriously.
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


--Il7n/DHsA0sMLmDu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 14, 2021 at 02:42:26PM +0100, Christophe Leroy wrote:
> Le 14/01/2021 =E0 14:22, Mark Brown a =E9crit=A0:

> > For GPIO chipselects you should really fix the driver to just hand the
> > GPIO off to the core rather than trying to implement this itself, that
> > will avoid driver specific differences like this.

> IIUC, it is not trivial as it requires implementing transfer_one() instead
> of the existing transfer_one_message() in the driver. Am I right ?

Yes, that's a good idea in general though.  It should normally be pretty
simple since the conversion is mostly just deleting code doing things
which will be handled by the core.

> What's the difference/benefit of transfer_one() compared to the existing =
transfer_one_message() ?

It factors out all the handling of chip selects, including per-transfer
chip select inversion and so on, and also factors out all the handling
of in-message delays.  If nothing else it reduces the amount of
duplicated code that might require maintainance can have issues with
misaligned expectations from the core or client drivers.

--Il7n/DHsA0sMLmDu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAATikACgkQJNaLcl1U
h9BW6Af+Pw9Y1WvW7FDLeDR69lK5Jq9X67HuG7iEoAFDhmj/Q6Jb4DzPkSeG1LRs
YRbcTBvXoPs2vVAU3bisyy4MmTmnhW5BtlkigV2NTXPKi3qzRu5YjhxEjPAmgeJ9
RZhHco4yXMm7dP7g7EPvlb3VqjBH+ARZRnT5SN870EkDnQV6aEBR9YRHbQmKsabV
VkU2uvRlXIdpJ9FKBbDcV0jWKqJdVphdBhEKhr9mWKxG5FBQ05iGyJdDL0c2zr5x
oBubtYUiq/yd41w96NV4/4O9h9DmTDxiQ1QM8kW6mbgU4JykUhq5qr6ua3G0pRLC
/9vXvRuBpx6IbHr7IM1p2oasKi1WsA==
=nlRk
-----END PGP SIGNATURE-----

--Il7n/DHsA0sMLmDu--
