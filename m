Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1453E9C05
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 03:42:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlTw308Lyz3cJY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 11:42:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=201602 header.b=G9rGX8cc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=dgibson@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=G9rGX8cc; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlTvL5mSWz2yyK
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Aug 2021 11:42:06 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GlTvK2TMFz9sRK; Thu, 12 Aug 2021 11:42:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1628732525;
 bh=V/SCrmHxYDZKrcohQWJKjuiMuPBcGRKm023Nu09XQcs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G9rGX8ccRjLQrMmNGaCZO46SGP+zXSc9Zy3/7bymx3yvRNM0pwiJZToGGvYJmWD4w
 i7VfTSe9GTPvFIIUpPXFMvbqo7DK4z8nROkvvZREHVfC3RX+KcPvSHsUdlnjVVfp46
 7cfrC8JHqhp06p+x++eg/XDMuoX1i3aAnQXI8qyQ=
Date: Thu, 12 Aug 2021 11:41:59 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v7 5/6] powerpc/pseries: Add support for FORM2
 associativity
Message-ID: <YRR8Z0EhlXgEKtY8@yekko>
References: <20210809052434.53978-1-aneesh.kumar@linux.ibm.com>
 <20210809052434.53978-6-aneesh.kumar@linux.ibm.com>
 <YRHsXDPaEZyLGLl+@yekko> <87a6loaagz.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="vSGbd2Oce516awN6"
Content-Disposition: inline
In-Reply-To: <87a6loaagz.fsf@linux.ibm.com>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--vSGbd2Oce516awN6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 11, 2021 at 09:39:32AM +0530, Aneesh Kumar K.V wrote:
> David Gibson <david@gibson.dropbear.id.au> writes:
>=20
> > On Mon, Aug 09, 2021 at 10:54:33AM +0530, Aneesh Kumar K.V wrote:
> >> PAPR interface currently supports two different ways of communicating =
resource
> >> grouping details to the OS. These are referred to as Form 0 and Form 1
> >> associativity grouping. Form 0 is the older format and is now consider=
ed
> >> deprecated. This patch adds another resource grouping named FORM2.
> >>=20
> >> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> >> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> >
> > LGTM, with the exception of some minor nits noted below.
> ...
>=20
> > +
> >> +	for (i =3D 0; i < max_numa_index; i++)
> >> +		/* +1 skip the max_numa_index in the property */
> >> +		numa_id_index_table[i] =3D of_read_number(&numa_lookup_index[i + 1]=
, 1);
> >> +
> >> +
> >> +	if (numa_dist_table_length !=3D max_numa_index * max_numa_index) {
> >> +
> >
> > Stray extra whitespace line here.
> >
> >> +		WARN(1, "Wrong NUMA distance information\n");
> >> +		/* consider everybody else just remote. */
> >> +		for (i =3D 0;  i < max_numa_index; i++) {
> >> +			for (j =3D 0; j < max_numa_index; j++) {
> >> +				int nodeA =3D numa_id_index_table[i];
> >> +				int nodeB =3D numa_id_index_table[j];
> >> +
> >> +				if (nodeA =3D=3D nodeB)
> >> +					numa_distance_table[nodeA][nodeB] =3D LOCAL_DISTANCE;
> >> +				else
> >> +					numa_distance_table[nodeA][nodeB] =3D REMOTE_DISTANCE;
> >> +			}
> >> +		}
> >
> > I don't think it's necessarily a problem, but something to consider is
> > that this fallback will initialize distance for *all* node IDs,
> > whereas the normal path will only initialize it for nodes that are in
> > the index table.  Since some later error checks key off whether
> > certain fields in the distance table are initialized, is that the
> > outcome you want?
> >
>=20
> With the device tree details not correct, one of the possible way to
> make progress is to consider everybody remote. With new node hotplug
> support we used to check whether the distance table entry is
> initialized. With the updated spec, we expect all possible numa node
> distance to be available during boot.

Sure.  But my main point here is that the fallback behaviour in this
clause is different from the fallback behaviour if the table is there
and parseable, but incomplete - which is also not expected.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--vSGbd2Oce516awN6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmEUfGYACgkQbDjKyiDZ
s5KyHBAAusNboZbx7CJZ38Q1h+g3zQPRTbOr5WK1FJsbmTvfOOQKEoBsnfR15wGh
CvMOo6cyGophxLFzOjSF37GFcIqurf7Ii2aB+CEJuNkYqIEY6N8CUEfRhszkWSMW
XoY5B+YTzchj3PW0rltb5cSWYF+DnVmom+SxLrX/sUMz8Zw3wnCClhg84MQ7EwXi
prRrC/EhO9qF7J/wvK1eQ3CiyPHX84QB1Lafa7yjMV581mZSEtVlSvGCGiZ/Y4Fv
QcvvGAMkRG3K1plZD/S/vD/eA2QSvciyMa32IlbMpIBhlwyylY4vim6Y3RShzA14
N+jVZWKnQvThpY+GcDzSx3dzdhpznJMXkuVY4MI1HO3gJl9Q3TFKkF88okdaoJ9S
FGA5ziBKQMIxOW2DPRcqopx+xUVjRhM/eo0sR5miZFO8McjpeBurSpy7Nfgve9QV
CO1owds+ScootWyGD10Tveg/OoA0XsKclRFHn4mMMEaqeDiaBH6y1P351wFPVBPj
C29n1XI+a+WGNAUhZNZswFTJh+Kx4ojpuC8QQ/vKe0Qlrr/K30A0dpQs1RGBTl+p
7kU1B+0qamtXIDYxOykTx0z/djqtJnJ1BefoAq0gmCfbkNRzpoOV73qq2CMyEX5S
S9Qx4M0J3OVTvfNMv5CUjpb7nde0dqRH1S3jjZs1FpDySPhiiGI=
=nQPV
-----END PGP SIGNATURE-----

--vSGbd2Oce516awN6--
