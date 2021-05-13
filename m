Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F33337F291
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 May 2021 07:23:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fgg761Mtpz3bTv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 May 2021 15:23:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=201602 header.b=c5lq+rL9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=dgibson@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=c5lq+rL9; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fgg6611Vtz2xvB
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 May 2021 15:22:53 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fgg6536Q9z9sXM; Thu, 13 May 2021 15:22:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620883373;
 bh=8CGeZk8dQ9gEdZx0CchTi98oQoxcns66y6Wa4r+Tj30=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c5lq+rL907KTart2aDLNOr6mubk6CksstlAZjvEN8Iy8mFhXjC1GE4UMtnxpTRkk+
 DhSGoQjHYea5koWIAoRbi1Pdo1wLBzglkW4+dl4a9g/8eOGvidVa/Cs3WCxLj4GuSL
 rDzcDPcGRqu39K+lE8TOKMHe3ZaZX4p7Nuo2C12o=
Date: Thu, 13 May 2021 15:12:05 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v2 2/4] powerpc/pseries: check DRCONF_MEM_RESERVED in
 lmb_is_removable()
Message-ID: <YJy1JVJb0uAltuBi@yekko>
References: <20210512202809.95363-1-danielhb413@gmail.com>
 <20210512202809.95363-3-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="XPYbvkeW2WqzzFNH"
Content-Disposition: inline
In-Reply-To: <20210512202809.95363-3-danielhb413@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--XPYbvkeW2WqzzFNH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 12, 2021 at 05:28:07PM -0300, Daniel Henrique Barboza wrote:
> DRCONF_MEM_RESERVED is a flag that represents the "Reserved Memory"
> status in LOPAR v2.10, section 4.2.8. If a LMB is marked as reserved,
> quoting LOPAR, "is not to be used or altered by the base OS". This flag
> is read only in the kernel, being set by the firmware/hypervisor in the
> DT. As an example, QEMU will set this flag in hw/ppc/spapr.c,
> spapr_dt_dynamic_memory().
>=20
> lmb_is_removable() does not check for DRCONF_MEM_RESERVED. This function
> is used in dlpar_remove_lmb() as a guard before the removal logic. Since
> it is failing to check for !RESERVED, dlpar_remove_lmb() will fail in a
> later stage instead of failing in the validation when receiving a
> reserved LMB as input.
>=20
> lmb_is_removable() is also used in dlpar_memory_remove_by_count() to
> evaluate if we have enough LMBs to complete the request. The missing
> !RESERVED check in this case is causing dlpar_memory_remove_by_count()
> to miscalculate the number of elegible LMBs for the removal, and can
> make it error out later on instead of failing in the validation with the
> 'not enough LMBs to satisfy request' message.
>=20
> Making a DRCONF_MEM_RESERVED check in lmb_is_removable() fixes all these
> issues.
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  arch/powerpc/platforms/pseries/hotplug-memory.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/power=
pc/platforms/pseries/hotplug-memory.c
> index bb98574a84a2..c21d9278c1ce 100644
> --- a/arch/powerpc/platforms/pseries/hotplug-memory.c
> +++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
> @@ -348,7 +348,8 @@ static int pseries_remove_mem_node(struct device_node=
 *np)
> =20
>  static bool lmb_is_removable(struct drmem_lmb *lmb)
>  {
> -	if (!(lmb->flags & DRCONF_MEM_ASSIGNED))
> +	if ((lmb->flags & DRCONF_MEM_RESERVED) ||
> +		!(lmb->flags & DRCONF_MEM_ASSIGNED))
>  		return false;
> =20
>  #ifdef CONFIG_FA_DUMP

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--XPYbvkeW2WqzzFNH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCctSMACgkQbDjKyiDZ
s5KYhw//VGe4R5Gz66MBUbeyY/PNokoNJqLAmoanhlPlEkbnGrYXiJIru2DZizbU
5IPAtZJ9/nWcdpQ1qknZzVPnsQyakjI/59buCLNtD6lVluc+d8M8admPIGXX8FIb
S0p0qYACph+lRiXrmmP6ip1oiCuwmUo8axtPFlM61BEx9drvqnbOe7HfOWkMf5qJ
bdepWXrLtdmsgafJh9fIzdXvpxx4aYbzi37n1HWase69fIDmFwHsrA5FQ1diOowY
cu58qPMKSnlYPVZ0M+qCTd4gto7GzqaN8tJgO4wNedJyWPa9tOXs5dytWpJfehYo
65AIADEZwmMzj6TofI68uGM/INmoZT5m2YTVtwlxL+/E77gbgehR6K0hcNTq6CC4
HnHS9v4PrDgEs1UQC4w18dK3pAqO5eo+sKrlz2Rsg0sCUSyF0AtR7gXYIjFiWi6J
nqfBK+YHRbReUs6vwoetT6O+hSFTlzCO5QCiUdOcx4gyxyr24NhM8XwHrKMFWNgR
21ionRNcG5oZR/vWAM+550/ZSwLyUFLgIlrx9YOwCl6foUwebY9DacMKc/7UzEME
Hx/eeRoeZu89rfyHdPY0gv4fvqUF77U4n7Z31h4xSficn8cV7/AecrWGv0KJwocV
EXdPqy69XFlQHSc7eKQ+L1MxJALOHhR+u+PucpRHr4jINJNyAtY=
=2Zq0
-----END PGP SIGNATURE-----

--XPYbvkeW2WqzzFNH--
