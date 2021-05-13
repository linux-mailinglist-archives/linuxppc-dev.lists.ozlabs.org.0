Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD3937F293
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 May 2021 07:24:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fgg820Xqhz3c6r
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 May 2021 15:24:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=201602 header.b=owQ9oHgU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=dgibson@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=owQ9oHgU; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fgg663GWpz2yhr
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 May 2021 15:22:54 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fgg653tmkz9sj1; Thu, 13 May 2021 15:22:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620883373;
 bh=Vb4rmnIjEjqEVJw5BsKv6K7QbndJNhjYRfkTiT3g7F8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=owQ9oHgUz12/1YNr+MKZ+ZhlKO1uzFXuNLDDOQfc65BZmX7eUZELnmXwfqB80MvRj
 hkVczRzQLTt93BBhL3dQoT0foLVwhAKfij/aAmRaoEHFTcMi8VpJ82rkVMU1uLQ+iF
 0ThijDF4ie2VGAfLZOgDq21BjLWGNKm4u/662pwg=
Date: Thu, 13 May 2021 15:20:09 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v2 3/4] powerpc/pseries: break early in
 dlpar_memory_remove_by_count() loops
Message-ID: <YJy3CWRxidQzeKsU@yekko>
References: <20210512202809.95363-1-danielhb413@gmail.com>
 <20210512202809.95363-4-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="BESH7SqVVhQOjPsA"
Content-Disposition: inline
In-Reply-To: <20210512202809.95363-4-danielhb413@gmail.com>
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


--BESH7SqVVhQOjPsA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 12, 2021 at 05:28:08PM -0300, Daniel Henrique Barboza wrote:
> After marking the LMBs as reserved depending on dlpar_remove_lmb() rc,
> we evaluate whether we need to add the LMBs back or if we can release
> the LMB DRCs. In both cases, a for_each_drmem_lmb() loop without a break
> condition is used. This means that we're going to cycle through all LMBs
> of the partition even after we're done with what we were going to do.
>=20
> This patch adds break conditions in both loops to avoid this. The
> 'lmbs_removed' variable was renamed to 'lmbs_reserved', and it's now
> being decremented each time a lmb reservation is removed, indicating
> that the operation we're doing (adding back LMBs or releasing DRCs) is
> completed.
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

The fact that DRCONF_MEM_RESERVED and DRMEM_LMB_RESERVED look so
similar but have totally different meanings doesn't make this easy to
follow :/.

> ---
>  arch/powerpc/platforms/pseries/hotplug-memory.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/power=
pc/platforms/pseries/hotplug-memory.c
> index c21d9278c1ce..3c7ce5361ce3 100644
> --- a/arch/powerpc/platforms/pseries/hotplug-memory.c
> +++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
> @@ -402,7 +402,7 @@ static int dlpar_remove_lmb(struct drmem_lmb *lmb)
>  static int dlpar_memory_remove_by_count(u32 lmbs_to_remove)
>  {
>  	struct drmem_lmb *lmb;
> -	int lmbs_removed =3D 0;
> +	int lmbs_reserved =3D 0;
>  	int lmbs_available =3D 0;
>  	int rc;
> =20
> @@ -436,12 +436,12 @@ static int dlpar_memory_remove_by_count(u32 lmbs_to=
_remove)
>  		 */
>  		drmem_mark_lmb_reserved(lmb);
> =20
> -		lmbs_removed++;
> -		if (lmbs_removed =3D=3D lmbs_to_remove)
> +		lmbs_reserved++;
> +		if (lmbs_reserved =3D=3D lmbs_to_remove)
>  			break;
>  	}
> =20
> -	if (lmbs_removed !=3D lmbs_to_remove) {
> +	if (lmbs_reserved !=3D lmbs_to_remove) {
>  		pr_err("Memory hot-remove failed, adding LMB's back\n");
> =20
>  		for_each_drmem_lmb(lmb) {
> @@ -454,6 +454,10 @@ static int dlpar_memory_remove_by_count(u32 lmbs_to_=
remove)
>  				       lmb->drc_index);
> =20
>  			drmem_remove_lmb_reservation(lmb);
> +
> +			lmbs_reserved--;
> +			if (lmbs_reserved =3D=3D 0)
> +				break;
>  		}
> =20
>  		rc =3D -EINVAL;
> @@ -467,6 +471,10 @@ static int dlpar_memory_remove_by_count(u32 lmbs_to_=
remove)
>  				lmb->base_addr);
> =20
>  			drmem_remove_lmb_reservation(lmb);
> +
> +			lmbs_reserved--;
> +			if (lmbs_reserved =3D=3D 0)
> +				break;
>  		}
>  		rc =3D 0;
>  	}

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--BESH7SqVVhQOjPsA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCctwkACgkQbDjKyiDZ
s5IfJw//Ux7Mw/V03RbxwIG9TA0nP+HCymU2jruw1eV0z42LAQcfiIkY31iZ1iRA
jy3Kel8eDpnvrCCjzWNMOD+yjjTNUCA0VuJ2XmyoBpGcH5UplsU+1Zn0Qjft1P18
9avb49y8jlUOgnNS5AuKsIIolDsO7oqULjtQbIoG1PrGBI3LigmSIBoqTqttSSl5
hgOikliBjn/Oiy+SFSIAuXi9mVynezjpjI066UFzMtiUtWjAXnXU7SgXi1YdMf/e
w+NUpRCcPyI52XcO+/feDUughtpGApD0O8AxJh4uHwD6NThpzMb8Kfc1EbeJrbpT
ZvLlZw03bBG+F6rfVyza1Vcpxef/jtkxXXPC/kZdkEGp95DOr4dIEaCS9t9fVLz9
kJw1YYTgZz2ODMSvELigxmsHS3zdQWjDgaOlemhRUGfVAfE7ZktSBxlX16qQJiuh
a6TxMeTjfExNgBxUCUgDDPAQ9qg9mhAhtgTQVpTA0263S0LXliWfaMdpUwJCCMGs
7CT5CxVTc/rqF56wpELSv63a/vKpOkoAvRyziwTahdi3okdnG/KHJA+GBKRnxtoH
GITFDuBkV0Zx2nsxwyS6M/H4TuR2k1v18grihrZkREhAqiUcNQprU710TCQES8ED
IrzYQfr/Jx1kt7aMeQ4il573GqqEK54ecb7zYjtgc9dH6fI1R0I=
=uU+X
-----END PGP SIGNATURE-----

--BESH7SqVVhQOjPsA--
