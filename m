Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB7A1430CA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jan 2020 18:28:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 481dt42w20zDqjn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2020 04:28:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=mark.brown@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 481drD1YTkzDqg3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2020 04:26:33 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 516D331B;
 Mon, 20 Jan 2020 09:26:29 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C1A193F68E;
 Mon, 20 Jan 2020 09:26:28 -0800 (PST)
Date: Mon, 20 Jan 2020 17:26:27 +0000
From: Mark Brown <broonie@kernel.org>
To: "Theodore Y. Ts'o" <tytso@mit.edu>
Subject: Re: [PATCH v2 00/10] Impveovements for random.h/archrandom.h
Message-ID: <20200120172627.GH6852@sirena.org.uk>
References: <20200110145422.49141-1-broonie@kernel.org>
 <20200110155153.GG19453@zn.tnic> <20200110170559.GA304349@mit.edu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="AzNpbZlgThVzWita"
Content-Disposition: inline
In-Reply-To: <20200110170559.GA304349@mit.edu>
X-Cookie: I invented skydiving in 1989!
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 herbert@gondor.apana.org.au, x86@kernel.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Borislav Petkov <bp@alien8.de>, linux-crypto@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--AzNpbZlgThVzWita
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 10, 2020 at 12:05:59PM -0500, Theodore Y. Ts'o wrote:
> On Fri, Jan 10, 2020 at 04:51:53PM +0100, Borislav Petkov wrote:
> > On Fri, Jan 10, 2020 at 02:54:12PM +0000, Mark Brown wrote:

> > > This is a resend of a series from Richard Henderson last posted back in
> > > November:

> > >    https://lore.kernel.org/linux-arm-kernel/20191106141308.30535-1-rth@twiddle.net/

> > > Back then Borislav said they looked good and asked if he should take
> > > them through the tip tree but things seem to have got lost since then.

> > Or, alternatively, akpm could take them. In any case, if someone else
> > ends up doing that, for the x86 bits:

> Or I can take them through the random.git tree, since we have a lot of
> changes this cycle going to Linus anyway.  Any objections?

I think the important thing here is that *someone* takes the patches.
We've now got Ted and Borislav both saying they're OK applying the
patches, an additional proposal that Andrew takes the patches, nobody
saying anything negative about applying the patches and yet the patches
are not applied.  The random tree sounds like a sensible enough tree to
take this so if Ted picks them up perhaps that's most sensible?

--AzNpbZlgThVzWita
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4l4sIACgkQJNaLcl1U
h9BxEgf/RJIHZB+Cajrjtj2rRTGbAHO9kok/m6BSU0ERJzN1CQsdp4P19aWYHYmF
XEM/Gca6c0PICes5FwW+XWozKxRdmcpBI36CaxYgqnkdOu9ydFaCC9vVNC33ot3d
I0mGi3O7IvbFWglmZQhpD235hFGJYleeR2C9k3ZD4kJpp6aNTdWKVy/0qtVtOjk/
PgAxQ2xBYwxIkofP/3sE8U/AbP0e+HlQglHv4zDNAeoU366QXcO0cQ1Xzf/5vra4
oswWcyowcg9oEm6rFpmF5/1XMnB7dJEVX8OYOsrXHoS5TZuq81GZxke7Y6TynjS7
ZBwLT8sRsdbZeyoNDJhcjqY4VrojIg==
=jrbn
-----END PGP SIGNATURE-----

--AzNpbZlgThVzWita--
