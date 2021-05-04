Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7587372416
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 03:04:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZ1p54bG0z3bmw
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 11:04:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=201602 header.b=jowNmyJ+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=dgibson@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=jowNmyJ+; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZ1n742wHz2xZM
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 May 2021 11:03:39 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FZ1n32fDsz9s1l; Tue,  4 May 2021 11:03:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620090215;
 bh=rKOhfHlzRscgXbbKiNbQSo8saR7AYyyRCJYJdal+T0s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jowNmyJ+VOAVuxzvS/Ko7rhGzUX62uvOVWwUlKRZLiv4a0pLl/35RGTKuNZwqxbVh
 J8s1siSFCgt26QRVbj+c0rSnHdKpZtBnLZj81ZNGtClROfKxD/EMscBQnVXXn3qKgU
 geRtAnriIIXSTQJxAhKR0u7pYriG/XOyEYQ92/oU=
Date: Tue, 4 May 2021 11:02:44 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 2/3] hotplug-memory.c: enhance dlpar_memory_remove* LMB
 checks
Message-ID: <YJCdNJRSLCOV59dE@yekko>
References: <20210430120917.217951-1-danielhb413@gmail.com>
 <20210430120917.217951-3-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="18ZgUFqVCTZCbzb9"
Content-Disposition: inline
In-Reply-To: <20210430120917.217951-3-danielhb413@gmail.com>
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


--18ZgUFqVCTZCbzb9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 30, 2021 at 09:09:16AM -0300, Daniel Henrique Barboza wrote:
> dlpar_memory_remove_by_ic() validates the amount of LMBs to be removed
> by checking !DRCONF_MEM_RESERVED, and in the following loop before
> dlpar_remove_lmb() a check for DRCONF_MEM_ASSIGNED is made before
> removing it. This means that a LMB that is both !DRCONF_MEM_RESERVED and
> !DRCONF_MEM_ASSIGNED will be counted as valid, but then not being
> removed.  The function will end up not removing all 'lmbs_to_remove'
> LMBs while also not reporting any errors.
>=20
> Comparing it to dlpar_memory_remove_by_count(), the validation is done
> via lmb_is_removable(), which checks for DRCONF_MEM_ASSIGNED and fadump
> constraints. No additional check is made afterwards, and
> DRCONF_MEM_RESERVED is never checked before dlpar_remove_lmb(). The
> function doesn't have the same 'check A for validation, then B for
> removal' issue as remove_by_ic(), but it's not checking if the LMB is
> reserved.
>=20
> There is no reason for these functions to validate the same operation in
> two different manners.

Actually, I think there is: remove_by_ic() is handling a request to
remove a specific range of LMBs.  If any are reserved, they can't be
removed and so this needs to fail.  But if they are !ASSIGNED, that
essentially means they're *already* removed (or never added), so
"removing" them is, correctly, a no-op.

remove_by_count(), in contrast, is being asked to remove a fixed
number of LMBs from wherever they can be found, and for that it needs
to find LMBs that haven't already been removed.

Basically remove_by_ic() is an absolute request: "make this set of
LMBs be not-plugged", whereas remove_by_count() is a relative request
"make N less LMBs be plugged".


So I think remove_by_ic()s existing handling is correct.  I'm less
sure if remove_by_count() ignoring RESERVED is correct - I couldn't
quickly find under what circumstances RESERVED gets set.


> This patch addresses that by changing
> lmb_is_removable() to also check for DRCONF_MEM_RESERVED to tell if a
> lmb is removable, making dlpar_memory_remove_by_count() take the
> reservation state into account when counting the LMBs.
> lmb_is_removable() is then used in the validation step of
> dlpar_memory_remove_by_ic(), which is already checking for both states
> but in different stages, to avoid counting a LMB that is not assigned as
> eligible for removal. We can then skip the check before
> dlpar_remove_lmb() since we're validating all LMBs beforehand.
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  arch/powerpc/platforms/pseries/hotplug-memory.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>=20
> diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/power=
pc/platforms/pseries/hotplug-memory.c
> index bb98574a84a2..4e6d162c3f1a 100644
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
> @@ -523,7 +524,7 @@ static int dlpar_memory_remove_by_ic(u32 lmbs_to_remo=
ve, u32 drc_index)
> =20
>  	/* Validate that there are enough LMBs to satisfy the request */
>  	for_each_drmem_lmb_in_range(lmb, start_lmb, end_lmb) {
> -		if (lmb->flags & DRCONF_MEM_RESERVED)
> +		if (!lmb_is_removable(lmb))
>  			break;
> =20
>  		lmbs_available++;
> @@ -533,9 +534,6 @@ static int dlpar_memory_remove_by_ic(u32 lmbs_to_remo=
ve, u32 drc_index)
>  		return -EINVAL;
> =20
>  	for_each_drmem_lmb_in_range(lmb, start_lmb, end_lmb) {
> -		if (!(lmb->flags & DRCONF_MEM_ASSIGNED))
> -			continue;
> -
>  		rc =3D dlpar_remove_lmb(lmb);
>  		if (rc)
>  			break;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--18ZgUFqVCTZCbzb9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCQnTIACgkQbDjKyiDZ
s5LCXhAAvalMr35BNe5xUEyABeXan+63NW9SrXnRTE86XAth4R88nBLNJPUk0OYF
k34XMXrVzCLjsgnaioGPft2SPeCdx1vfzeRxPZtcXP/dyYSyflO+c4t6SQ8VbqP2
NsfKXPMajQF9wpyl1bKD11XIUdXWkf9ZN/Vxe/1o2buzMuBT4NWbLR4GxH2fcZFz
9zql6BKsyHFxaLsJGGX7q3ZOKd1Df50EkSwVYGvJF6Q13vW+/VfOpsjfzcnzQIxh
zF+yskXkVnRHIub88MjUwSV+EZbwiIG9aKdXVfZKLj3uMWN9NOypV9OoJc4ooo95
CSRn603JDqxwFIaBXDKLSfhM2wPOY77leCHkk7ERpgal5W03ncQiUPFuJeWOW8Du
TVR6et+a37YzskVKIJscPYz8CVyF4iEuA1YWqNnWVvf5V/4hhiK4oHFXRUKvACEn
RENPW1qWHMqH6Zi2aH2s831m9Gplz3M714Ezzdum8wkbmGROoK+f4Htafo3dcn7I
gaSnGzNtiwE9Qemm14k8z5a65WXUV3MpE7qyx1hi7KMwLDAD6gHH8I02Hlvb2Cta
65o72PpeBNBU7PKyfM1O45QMppDVh8zFhhl1tMvun4WaOC+v6lHCwhY7kt4iY7h2
LB2sv/gcpfMyQiGBBS6UWubirA7Pn3t6aszvkX0cC+8GbeemuHo=
=/pkL
-----END PGP SIGNATURE-----

--18ZgUFqVCTZCbzb9--
