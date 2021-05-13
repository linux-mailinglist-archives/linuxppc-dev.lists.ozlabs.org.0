Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD1137F290
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 May 2021 07:23:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fgg6f6x67z30Cs
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 May 2021 15:23:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=201602 header.b=QIkdJEuT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=dgibson@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=QIkdJEuT; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fgg662wc1z2ydJ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 May 2021 15:22:53 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fgg654NTnz9sXS; Thu, 13 May 2021 15:22:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620883373;
 bh=eDYcq8BCjjX3D7pQTXkqLxntqLy5Xsc3SFw9biOwJVE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QIkdJEuTQQRooy4iYBVJRP0Vh87xgrl6aG/BtVgFUHhJwLK6utpLNjOkNKLgY7jL7
 v7v84wzmoLFuPk2ENGB0xYGfaIIoU6m1t66ZVXUrO4ybKYirW2P1HLXhhOYzR9hTEd
 QbWqep/aWF/PO/b9abIf8zBmN6NsToXZQER8v3EE=
Date: Thu, 13 May 2021 15:22:46 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 2/3] hotplug-memory.c: enhance dlpar_memory_remove* LMB
 checks
Message-ID: <YJy3pv/gZz/aeqMw@yekko>
References: <20210430120917.217951-1-danielhb413@gmail.com>
 <20210430120917.217951-3-danielhb413@gmail.com>
 <YJCdNJRSLCOV59dE@yekko>
 <c735c4ad-7477-b07a-e84b-86eccd8d9978@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="JzQ2d4KKlWLAayb6"
Content-Disposition: inline
In-Reply-To: <c735c4ad-7477-b07a-e84b-86eccd8d9978@gmail.com>
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


--JzQ2d4KKlWLAayb6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 12, 2021 at 05:35:39PM -0300, Daniel Henrique Barboza wrote:
>=20
> On 5/3/21 10:02 PM, David Gibson wrote:
> > On Fri, Apr 30, 2021 at 09:09:16AM -0300, Daniel Henrique Barboza wrote:
> > > dlpar_memory_remove_by_ic() validates the amount of LMBs to be removed
> > > by checking !DRCONF_MEM_RESERVED, and in the following loop before
> > > dlpar_remove_lmb() a check for DRCONF_MEM_ASSIGNED is made before
> > > removing it. This means that a LMB that is both !DRCONF_MEM_RESERVED =
and
> > > !DRCONF_MEM_ASSIGNED will be counted as valid, but then not being
> > > removed.  The function will end up not removing all 'lmbs_to_remove'
> > > LMBs while also not reporting any errors.
> > >=20
> > > Comparing it to dlpar_memory_remove_by_count(), the validation is done
> > > via lmb_is_removable(), which checks for DRCONF_MEM_ASSIGNED and fadu=
mp
> > > constraints. No additional check is made afterwards, and
> > > DRCONF_MEM_RESERVED is never checked before dlpar_remove_lmb(). The
> > > function doesn't have the same 'check A for validation, then B for
> > > removal' issue as remove_by_ic(), but it's not checking if the LMB is
> > > reserved.
> > >=20
> > > There is no reason for these functions to validate the same operation=
 in
> > > two different manners.
> >=20
> > Actually, I think there is: remove_by_ic() is handling a request to
> > remove a specific range of LMBs.  If any are reserved, they can't be
> > removed and so this needs to fail.  But if they are !ASSIGNED, that
> > essentially means they're *already* removed (or never added), so
> > "removing" them is, correctly, a no-op.
> >=20
> > remove_by_count(), in contrast, is being asked to remove a fixed
> > number of LMBs from wherever they can be found, and for that it needs
> > to find LMBs that haven't already been removed.
> >=20
> > Basically remove_by_ic() is an absolute request: "make this set of
> > LMBs be not-plugged", whereas remove_by_count() is a relative request
> > "make N less LMBs be plugged".
> >=20
> >=20
> > So I think remove_by_ic()s existing handling is correct.  I'm less
> > sure if remove_by_count() ignoring RESERVED is correct - I couldn't
> > quickly find under what circumstances RESERVED gets set.
>=20
> RESERVED is never set by the kernel. It is written in the DT by the
> firmware/hypervisor and the kernel just checks its value. QEMU sets it in
> spapr_dt_dynamic_memory() with the following comment:
>=20
>=20
>             /*
>              * LMB information for RMA, boot time RAM and gap b/n RAM and
>              * device memory region -- all these are marked as reserved
>              * and as having no valid DRC.
>              */
>             dynamic_memory[0] =3D cpu_to_be32(addr >> 32);
>             dynamic_memory[1] =3D cpu_to_be32(addr & 0xffffffff);
>             dynamic_memory[2] =3D cpu_to_be32(0);
>             dynamic_memory[3] =3D cpu_to_be32(0); /* reserved */
>             dynamic_memory[4] =3D cpu_to_be32(-1);
>             dynamic_memory[5] =3D cpu_to_be32(SPAPR_LMB_FLAGS_RESERVED |
>                                             SPAPR_LMB_FLAGS_DRC_INVALID);
>=20
>=20
> The flag is formally described in LOPAR section 4.2.8, "Reserved Memory":
>=20
> "Memory nodes marked with the special value of the =E2=80=9Cstatus=E2=80=
=9D property of
> =E2=80=9Creserved=E2=80=9D is not to be used or altered by the base OS."
>=20
>=20
> This makes me confident that we should check DRCONF_MEM_RESERVED in
> remove_by_count() as well, since phyp needs do adhere to these semantics =
and
> shouldn't be able to remove a LMB marked as RESERVED.

Right.  I doubt it would have caused a problem in practice, because
I'm pretty sure we should never get an LMB which is RESERVED &&
ASSIGNED, but it's probably safer to make it explicit.


--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--JzQ2d4KKlWLAayb6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCct6YACgkQbDjKyiDZ
s5I0hQ/9GoIQT3pfPFW1C84uJ4XUmkAaSE3Z7YxvFch6RqeLA+ypHgqEuMAARyom
pgOyhWDrku+2p8Ph7l4fu3YjwaFDtmWyK+5z9mQDiuqWuM9zplLlx5SsDzl49EJQ
VDDV5NjLzRBVwAPVKLD5/pWb1hBT8koIHPjH9gRIci0t5rbq4Leydyv7unAnQRst
yszGb6QE8g9lj8sNkP+JjQr8s7zOD5//P/cnzkgjrCdvAw6Tl+/9e6p5LiK09KFO
HePHrPDLW7rJIu7mkSJo3j3jcrhOt0bRsMaly6BqqOnn3LU3b4nNlCZpYWlvT6iG
SZ58DViT2ZzXBi5y3MdcKCzmyYlKSC26yLqPM1lHB41WyNH97Bg0Bww7EToNMu5Z
XT87N9IIAP4xxRqbM5/tRFqiVtwxnJKtp8yjBnUVcOP17BF/BcXQQiI8F99z6cEq
aRpS443FiDJ2kNhzqy9r2dAJjXOIkmBoP4rh9Mv8E3C5ma7l30vHQ4kRohZKP8fj
rZHqY9+Bqg1tgTg+cgbfrOUiSPCZqdEyqgi1hVWNTfp/nzZMsd9JzPFZCd/eRXgD
oGvK+QI1w3qUTdT/4m0KsXgdFi6P+aZdcCUKrsSb/TufXactFxApaydkbFb6V6L1
WwxjfDVqsWE0pNS2Bt2CdOJ5eiCFoCzTaLO91DEZOs0FTfyz/io=
=7Bx7
-----END PGP SIGNATURE-----

--JzQ2d4KKlWLAayb6--
