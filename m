Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FBA31598A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 23:34:16 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZyP134dZzDwfj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 09:34:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=PmMallxr; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZyKc37DPzDvYH
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Feb 2021 09:31:16 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B6BB764DEC;
 Tue,  9 Feb 2021 22:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612909871;
 bh=w7T608Q6sIBtugY8EWYFaF2gDmCXirnHsPDnBwKISHU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PmMallxrg49c9T3/O7B24Yc8QF+vHPMUZhsxsmIA3AYTCPjSXBZdttdZWSlrlkF7t
 NYFw3OHI4R8nOXlkGD9kkAbeJZHFvaz1muvqjCOsVryfpvD2NLJDyQQNIwEIFwMnHd
 XDVy126fR8JWavHG/mdG7irrh+6besHVrvPfSsRyURgvjm9p46T9DdVrm7cPdQwyrc
 iE72rodMIU7KJvexaxB+krJyWAmdp9puA+TPnu1y719kZyQysBiyQp6OyBIvkvBHhX
 MZ9eqkXv9gfxDNJSS/uXPe+j6321+ncpNHvE3Q4kLZdh771KSW/2r1eqr4g3lmqn66
 QcR3VVnYsbkfA==
Date: Tue, 9 Feb 2021 22:30:18 +0000
From: Mark Brown <broonie@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 1/3] spi: mpc52xx: Avoid using get_tbl()
Message-ID: <20210209223018.GG4916@sirena.org.uk>
References: <99bf008e2970de7f8ed3225cda69a6d06ae1a644.1612866360.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7lMq7vMTJT4tNk0a"
Content-Disposition: inline
In-Reply-To: <99bf008e2970de7f8ed3225cda69a6d06ae1a644.1612866360.git.christophe.leroy@csgroup.eu>
X-Cookie: Put your trust in those who are worthy.
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
Cc: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--7lMq7vMTJT4tNk0a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 09, 2021 at 10:26:21AM +0000, Christophe Leroy wrote:
> get_tbl() is confusing as it returns the content TBL register
> on PPC32 but the concatenation of TBL and TBU on PPC64.
>=20
> Use mftb() instead.
>=20
> This will allow the removal of get_tbl() in a following patch.

Acked-by: Mark Brown <broonie@kernel.org>

--7lMq7vMTJT4tNk0a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAjDPkACgkQJNaLcl1U
h9DIDAf+PfQCzvmSV62gREXxoOf6uW42RTKr/G1+QpxhzKRx0uIr/LobLhb7MJWj
dmwCZP+NqyviQCFy1dsAUZSommXfxd7WbfhSKFRTV+KBZlF/wy4QzfNBTAn+UIC9
UsDnYBWthhw7d1rJ0FaWU4jn6cewk8VIOoZ0comyvzBdPDGi99YsVukpSlmbKFbf
fD/uZJdMmdMsQlob6Ajd+h/tUYGr0zLUkBX5vsFwnTJmy9Lv9Y30PNu5mzGOMxo8
3BT7cZ+DSgJZM4dsd72sW3eN1ER/G3FLjjr5hhffxw9XzVmKTrS01FNeAaGQO0ah
QFqtkGS40qUehSgnuIac6q0B+yWFbQ==
=jS1n
-----END PGP SIGNATURE-----

--7lMq7vMTJT4tNk0a--
