Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 526C63775F1
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 May 2021 10:44:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FdHn02kRWz309V
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 May 2021 18:44:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=201602 header.b=LB8np1RD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=dgibson@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=LB8np1RD; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FdHmW2040z2yXp
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 May 2021 18:44:26 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FdHmN0NmQz9tlT; Sun,  9 May 2021 18:44:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620549860;
 bh=mrCCxrPLXd2u1Yu8mIR3FTFSkj8bqt1tbpyVIVUlIN4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LB8np1RDK6sXz+8RQpVqLvfednJu/3YOG/Ts82h1EDnmRujtY9CW19Z7Si+X0WKVh
 aEdPe7nrwwr8neXr5PdX4Z2KdnQMVmie8RKzhu6+ueEbzHQ28ZZVe24LHrR6ln3ryi
 AWfx25jF/Wezr7msPMRzShVH5UfReex07uilHX6Q=
Date: Sun, 9 May 2021 18:43:50 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 2/3] hotplug-memory.c: enhance dlpar_memory_remove* LMB
 checks
Message-ID: <YJegxrNqFd6fVsGO@yekko>
References: <20210430120917.217951-1-danielhb413@gmail.com>
 <20210430120917.217951-3-danielhb413@gmail.com>
 <YJCdNJRSLCOV59dE@yekko>
 <1491f5c1-593b-4a87-2645-6da76bb7e47a@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2wBBJs86Fo+2xVwd"
Content-Disposition: inline
In-Reply-To: <1491f5c1-593b-4a87-2645-6da76bb7e47a@gmail.com>
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


--2wBBJs86Fo+2xVwd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 07, 2021 at 01:36:06PM -0300, Daniel Henrique Barboza wrote:
>=20
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
>=20
> I guess that makes sense. Although I am not aware of any situation, at le=
ast
> thinking about how QEMU adds/removes LMBs, where some LMBs would be remov=
ed
> 'ad-hoc' in the middle of a LMB range that maps to a QEMU DIMM, I can't s=
ay
> that this wouldn't never happen either.

Right.  I believe a user could explicitly offline LMBs in the middle
of a DIMM. There's not much reason to do so, but it's possible.  There
might also be situations involving memory errors where individual LMBs
could get offlined.

> It is sensible to make remove_by_ic()
> resilient to this situation.
>=20
> I'll re-send this patch just with the remove_by_count() change.
>=20
>=20
> Thanks,
>=20
>=20
> Daniel
>=20
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
> >=20
> >=20
> > > This patch addresses that by changing
> > > lmb_is_removable() to also check for DRCONF_MEM_RESERVED to tell if a
> > > lmb is removable, making dlpar_memory_remove_by_count() take the
> > > reservation state into account when counting the LMBs.
> > > lmb_is_removable() is then used in the validation step of
> > > dlpar_memory_remove_by_ic(), which is already checking for both states
> > > but in different stages, to avoid counting a LMB that is not assigned=
 as
> > > eligible for removal. We can then skip the check before
> > > dlpar_remove_lmb() since we're validating all LMBs beforehand.
> > >=20
> > > Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> > > ---
> > >   arch/powerpc/platforms/pseries/hotplug-memory.c | 8 +++-----
> > >   1 file changed, 3 insertions(+), 5 deletions(-)
> > >=20
> > > diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/p=
owerpc/platforms/pseries/hotplug-memory.c
> > > index bb98574a84a2..4e6d162c3f1a 100644
> > > --- a/arch/powerpc/platforms/pseries/hotplug-memory.c
> > > +++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
> > > @@ -348,7 +348,8 @@ static int pseries_remove_mem_node(struct device_=
node *np)
> > >   static bool lmb_is_removable(struct drmem_lmb *lmb)
> > >   {
> > > -	if (!(lmb->flags & DRCONF_MEM_ASSIGNED))
> > > +	if ((lmb->flags & DRCONF_MEM_RESERVED) ||
> > > +		!(lmb->flags & DRCONF_MEM_ASSIGNED))
> > >   		return false;
> > >   #ifdef CONFIG_FA_DUMP
> > > @@ -523,7 +524,7 @@ static int dlpar_memory_remove_by_ic(u32 lmbs_to_=
remove, u32 drc_index)
> > >   	/* Validate that there are enough LMBs to satisfy the request */
> > >   	for_each_drmem_lmb_in_range(lmb, start_lmb, end_lmb) {
> > > -		if (lmb->flags & DRCONF_MEM_RESERVED)
> > > +		if (!lmb_is_removable(lmb))
> > >   			break;
> > >   		lmbs_available++;
> > > @@ -533,9 +534,6 @@ static int dlpar_memory_remove_by_ic(u32 lmbs_to_=
remove, u32 drc_index)
> > >   		return -EINVAL;
> > >   	for_each_drmem_lmb_in_range(lmb, start_lmb, end_lmb) {
> > > -		if (!(lmb->flags & DRCONF_MEM_ASSIGNED))
> > > -			continue;
> > > -
> > >   		rc =3D dlpar_remove_lmb(lmb);
> > >   		if (rc)
> > >   			break;
> >=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--2wBBJs86Fo+2xVwd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCXoMQACgkQbDjKyiDZ
s5Ku5BAA4UhaK1jhLdWOgp5Y65JmJ2UOz0Q8QuUEYPJqDe0zHWPkRR9OQNKHohXq
vMw+OtmzVghC422SWhBOyRs2tUtiZ8JU43DXyATXvO8t8eN7i2FCRIG0J2ktjQ26
Qo/sYM213GBTspxtVsMBV8hZ3SyEnHqP4ty51MzK/+rr/ZAAmXgZ8CPsFhzmT+z1
GRGpc8cwGpbFmCKGOKiu/SRdYGn13+Qh/NPkrdf/dRU97a+g2yhhD+v5RwVB3eFD
UIPkY3UNmY9v79d3AVEK+t6MXdCyqY9d5fo9VHJhSNF00IyGKP94KTpCXvqUUOrG
HUwEdggkt6J7qkC9UtGWE6KnoIfXAh8G3gau0NzFk3/Cx1tVzE+eUQXFlFt8YMUV
6qz30Oa5i5seEqITl3x7lqFa8Lm58/8svBt3GYud7eNkuIQRp56DCTi/yqbJgF7t
/WmuDnKd4EjNnQSjvHS1vpU9rFJ38EehTRC+nshpaNWyUkpmpqMmRnULqwHhA3OG
pm+Twr+eMYFISBiRB+z7ZVZxd1r1iyO+R6+p7cxvCHuOncgH7n12Rq1iXI/fjgPT
OiVywW+BBPvs8O4WLK4fvZD5CgUNEY18SKkpZUpz4zM8dr4k5kbCKjw2HZxddpxa
V/+euH1s40khpIqN8xOhdIy65G/6qhMyhClA0IOZjgnpJue+yLQ=
=3zys
-----END PGP SIGNATURE-----

--2wBBJs86Fo+2xVwd--
