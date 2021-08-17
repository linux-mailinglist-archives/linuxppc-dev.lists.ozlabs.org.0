Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C972D3EE528
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Aug 2021 05:41:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GpcJt5JW2z30GM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Aug 2021 13:41:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=201602 header.b=g1pIjmyW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=dgibson@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=g1pIjmyW; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GpcJ80XP0z2yZL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Aug 2021 13:40:55 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GpcJ54TNWz9sSs; Tue, 17 Aug 2021 13:40:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1629171653;
 bh=mDYvwgbNhuUVm8IDRx97J78CqvO14Rf+1xEDabDlgok=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g1pIjmyWJHVWBcT8rLrrEOmh/9sqJWsUG1dtC6B2TAz1ZSUgMW42gdhrdx6JLvOt+
 uLjLG+6S4eEVHdvoXezFxDzAeXhaMdiQ6I0YZzn0PSP7XNXor5xscAgMTqwggCNZUD
 +m+xgX6/eOXzla9RPuTZg9/jdZ384mxCmBnXoOjk=
Date: Tue, 17 Aug 2021 13:27:16 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v8 3/5] powerpc/pseries: Consolidate different NUMA
 distance update code paths
Message-ID: <YRsslK9jf91T+ly7@yekko>
References: <20210812132223.225214-1-aneesh.kumar@linux.ibm.com>
 <20210812132223.225214-4-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="p2G2N+zRlDDgbm+P"
Content-Disposition: inline
In-Reply-To: <20210812132223.225214-4-aneesh.kumar@linux.ibm.com>
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


--p2G2N+zRlDDgbm+P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 12, 2021 at 06:52:21PM +0530, Aneesh Kumar K.V wrote:
> The associativity details of the newly added resourced are collected from
> the hypervisor via "ibm,configure-connector" rtas call. Update the numa
> distance details of the newly added numa node after the above call.
>=20
> Instead of updating NUMA distance every time we lookup a node id
> from the associativity property, add helpers that can be used
> during boot which does this only once. Also remove the distance
> update from node id lookup helpers.
>=20
> Currently, we duplicate parsing code for ibm,associativity and
> ibm,associativity-lookup-arrays in the kernel. The associativity array pr=
ovided
> by these device tree properties are very similar and hence can use
> a helper to parse the node id and numa distance details.
>=20
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

There are a handful of nits it would be nice to clean up as followups, thou=
gh:

[snip]
> +static int get_nid_and_numa_distance(struct drmem_lmb *lmb)
> +{
> +	struct assoc_arrays aa =3D { .arrays =3D NULL };
> +	int default_nid =3D NUMA_NO_NODE;

I don't think there's any point to the 'default_nid' variable.

> +	int nid =3D default_nid;
> +	int rc, index;
> +
> +	if ((primary_domain_index < 0) || !numa_enabled)
> +		return default_nid;
> +
> +	rc =3D of_get_assoc_arrays(&aa);
> +	if (rc)
> +		return default_nid;
> +
> +	if (primary_domain_index <=3D aa.array_sz &&

You don't need this test any more - it's included in __associativity_to_nid=
().

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--p2G2N+zRlDDgbm+P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmEbLJIACgkQbDjKyiDZ
s5JhDRAA4Ca8mYNvobzIeaER/AZx+zFR+dUVVuAPZMHNCma4Pv/r/Ty66xo70NuN
S8OA7CQomj4cfFFUUS8kUC67g3SP+2JIcwnjVWkiFwOvPQrgz3ElmF0oZjMwlhFB
Qu7KxSSg4ZQji4CGRO1tJPljOgzOUejAzXX+cvHg851/lzr8vVSAHsUTf0Ze7nJ7
t2z1n5mCa0MN2lQofao3FbfHpiOod/1SDHxtBc7lYL2o66bLBsSwXwBQQphpdhYW
18maJjk3i0wTZZG0zgnObQYFhiH6sfTFT0XW3iw/QLfv0bzBbaUeviarNIYjPXCO
SFPcroECe76QbOmgbx/kmSQv+LvJovzQEN91kOZKUm6ktz9z6nYoyUb4kEmyafEK
nDFT/7xv3plpq0aGDFQCRs2GxgIhm2MreGZSS/xi+HE6DJdfLxWMtzuuBP6Z56Zk
PtoqUbxQOmlPkGNRgYBDQiDwFN06mMJ3nUJZccyoRMOCdKgFD26Kf6kw06Zfhuyc
An0F9lqsbHaDF5ZyWqbFrZbSp/80RhC5NKjYVXMjbf8zdFMXL/Ko2/LRS2SWXPiF
VWejV7NvHO4HSZpBhmx+fiFziMU2OJjDxNCpHwebem32cQMvrQG36BaTx/yyakdi
+IAk2Xlj4DwO6DNrII1ugKoHH2GrLjKYmdi+nUx4+Q2jWZ/r+is=
=lnHr
-----END PGP SIGNATURE-----

--p2G2N+zRlDDgbm+P--
