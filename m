Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3893D5154
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jul 2021 04:42:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GY42J0SZ0z3bN7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jul 2021 12:42:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=201602 header.b=NWs4sOvQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=dgibson@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=NWs4sOvQ; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GY41t2gfFz2yYt
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Jul 2021 12:41:37 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GY41s39jjz9shx; Mon, 26 Jul 2021 12:41:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1627267297;
 bh=J1Q6FKFfcQaG+kr6nzb0+k63DUlZAlWAywgYoFxnAXs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NWs4sOvQNW//xl8cm++BHuzQ462+V4QUjnI+pC+h8rwgFsETCAzDIt6xYAIxiZq0P
 9oktLC5KQAa06L9sk+25e8I+V6A0B/Be52MwnkftxptstYUtM/ctc+Fx7qhWRiZUBz
 L6oYCCqd5olfcZ9RQji44bEogO24F0nFmupkxsrw=
Date: Mon, 26 Jul 2021 12:28:02 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v5 1/6] powerpc/pseries: rename min_common_depth to
 primary_domain_index
Message-ID: <YP4dssdfoozA3n5b@yekko>
References: <20210628151117.545935-1-aneesh.kumar@linux.ibm.com>
 <20210628151117.545935-2-aneesh.kumar@linux.ibm.com>
 <YPjQ85wtr165BOMa@yekko> <YPjZvgRr2WSdcX/W@yekko>
 <30f70122-e8e0-e823-c585-bc79ba2e8152@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="X2/4MS3gwv3ck9Kn"
Content-Disposition: inline
In-Reply-To: <30f70122-e8e0-e823-c585-bc79ba2e8152@linux.ibm.com>
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


--X2/4MS3gwv3ck9Kn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 22, 2021 at 10:47:49AM +0530, Aneesh Kumar K.V wrote:
> On 7/22/21 8:06 AM, David Gibson wrote:
> > On Thu, Jul 22, 2021 at 11:59:15AM +1000, David Gibson wrote:
> > > On Mon, Jun 28, 2021 at 08:41:12PM +0530, Aneesh Kumar K.V wrote:
> > > > No functional change in this patch.
> > >=20
> > > The new name does not match how you describe "primary domain index" in
> > > the documentation from patch 6/6.  There it comes from the values in
> > > associativity-reference-points, but here it simply comes from the
> > > lengths of all the associativity properties.
> >=20
> > No, sorry, I misread this code... misled by the old name, so it's a
> > good thing you're changing it.
> >=20
> > But.. I'm still not sure the new name is accurate, either...
> >=20
> > [snip]
> > > >   	if (form1_affinity) {
> > > > -		depth =3D of_read_number(distance_ref_points, 1);
> > > > +		index =3D of_read_number(distance_ref_points, 1);
> >=20
> > AFACIT distance_ref_points hasn't been altered from the
> > of_get_property() at this point, so isn't this setting depth / index
> > to the number of entries in ref-points, rather than the value of the
> > first entry (which is what primary domain index is supposed to be).
> >=20
>=20
> ibm,associativity-reference-points property format is as below.
>=20
> # lsprop  ibm,associativity-reference-points
> ibm,associativity-reference-points
>                  00000004 00000002
>=20
> it doesn't have the number of elements as the first item.
>=20
> For FORM1 1 element is the NUMA boundary index/primary_domain_index
> For FORM0 2 element is the NUMA boundary index/primary_domain_index.

Sorry, my bad.  I foolishly expected consistency from PAPR.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--X2/4MS3gwv3ck9Kn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmD+HbIACgkQbDjKyiDZ
s5LPEg//WTqRmA6oVhx1dd05kJAcb45FJElKkIq3nJtokE5fD/THJHV7qno1zTsA
NWh1xYUuFyHYIJqNTzPnx8vfAcyBDoIPzZHyZnkh0gurG3hu5NjI++d64y9uY+9n
qV8SsDy7xGz2DJH5AwI+sxxnv203MRjUaauxpqzmrRhjIAhqPg/sHnpUKyENizpV
IvV3/geJsWheD8JsvkqKY0Gs9Xo4lpmrMSLogmXqpBLbKIswZIEcWBAj0D9/k5RH
ONeWe4Eh8wCuoZQM+mqoUob6HNmQGBPOpNoQhaKAInmuX8vxubVgv6d4kZHACOR/
5EdRJ+VOb9QBvbTct43JnUWTowY4TqsQb6oJONWtxJxw9Tdok3SXd5KRifQE6rL4
D1jTPtcULEnDdUm4RLyAghLmLoE+RSmiUmH9GleI3FQyZoa3tNAhACV7a+EsTd4T
sMnxcqGGkQ4ifSxtKXJx+5QNDW9+6lomctK2Y4cPwezosyK6TIRJiBAq1JZa+Y0g
10RQuVeYXvqGwaYU9w0KB+VkA0PvzIU6tceXcqKJ53HYl923Io3ZIxFXHr582jAK
FBDT/COKhGFbSeDAMH27GRbgWOkiyvDO9oI1VMwqgzZdsOs4kw0qLG4gWWd2G40D
54NKsfM2958BVefBVEzb+IvgX2SE33W74foUfzOC0Y60g87JXxw=
=9QV6
-----END PGP SIGNATURE-----

--X2/4MS3gwv3ck9Kn--
