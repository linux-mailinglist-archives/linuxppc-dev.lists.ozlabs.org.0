Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AD42D9488
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Dec 2020 10:04:07 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cvb6X5929zDqXW
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Dec 2020 20:04:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cvb302xJ1zDqNG
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Dec 2020 20:01:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=gibson.dropbear.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=kzl/COHv; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Cvb301Wxbz9sVY; Mon, 14 Dec 2020 20:01:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1607936460;
 bh=E4s3yviVMjpp9iFpj/Bb5X71Y/qsElHb4YmF+/y4+1U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kzl/COHvaqklUVB68Pp3wvHJkXKBGnf76uitDJh17U1TFLfYYoXwb+UL2QhoPyN7o
 OzSLnQeU+eBvnL+1nKmwe5k6CGPNCU1rgLNdaAEPxJDW86t8PRxHaaQzSSiUhHMuN0
 P2KnoB3JwgtjA5QuGZdhK8mvKAOcGck7NRfdDN/M=
Date: Mon, 14 Dec 2020 17:05:59 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Bharata B Rao <bharata@linux.ibm.com>
Subject: Re: [PATCH v1 1/2] KVM: PPC: Book3S HV: Add support for
 H_RPT_INVALIDATE (nested case only)
Message-ID: <20201214060559.GH4717@yekko.fritz.box>
References: <20201019112642.53016-1-bharata@linux.ibm.com>
 <20201019112642.53016-2-bharata@linux.ibm.com>
 <20201211103336.GB775394@in.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="bpVaumkpfGNUagdU"
Content-Disposition: inline
In-Reply-To: <20201211103336.GB775394@in.ibm.com>
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
Cc: aneesh.kumar@linux.ibm.com, npiggin@gmail.com, kvm-ppc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--bpVaumkpfGNUagdU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 11, 2020 at 04:03:36PM +0530, Bharata B Rao wrote:
> On Mon, Oct 19, 2020 at 04:56:41PM +0530, Bharata B Rao wrote:
> > Implements H_RPT_INVALIDATE hcall and supports only nested case
> > currently.
> >=20
> > A KVM capability KVM_CAP_RPT_INVALIDATE is added to indicate the
> > support for this hcall.
>=20
> As Paul mentioned in the thread, this hcall does both process scoped
> invalidations and partition scoped invalidations for L2 guest.
> I am adding KVM_CAP_RPT_INVALIDATE capability with only partition
> scoped invalidations (nested case) implemented in the hcall as we
> don't see the need for KVM to implement process scoped invalidation
> function as KVM may never run with LPCR[GTSE]=3D0.
>=20
> I am wondering if enabling the capability with only partial
> implementation of the hcall is the correct thing to do. In future
> if we ever want process scoped invalidations support in this hcall,
> we may not be able to differentiate the availability of two functions
> cleanly from QEMU.

Yeah, it's not ideal.

> So does it make sense to implement the process scoped invalidation
> function also now itself even if it is not going to be used in
> KVM?

That might be a good idea, if it's not excessively difficult.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--bpVaumkpfGNUagdU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/XAMcACgkQbDjKyiDZ
s5LNERAAvbn39lxKegYiT0q7vfCJbBkn7+cCZOqT2aYZp8NUeHBUJyrAoqJqcYrB
HIYJDEEJ87GryOKi5fRGamQW19nvX04QbWx8miEN8HgZ8tdLu9skMDBIOoM0ieKO
FIiPujet7FW7ZQ7kvOOD+yJbRNsaBXZULM5Xn9YokA9R6EFAtjmF3CoYpZyHwM4g
LZ5KyjsRzcpPFu1m4T8boAt6p7ifj663iv07tvdVcYEFZXgpusEGqgUifQrf2Rg0
l8budyGJztZRxvd86NJHhWcmlgdFOsS1fkJwj3omVz3gtJNzsrihi7g8WPqARm0x
3hwe5345/zO2BFCieUQ7x38tmF6m4lkEg4DcoOjq2tVXEDeSbA14Ef1IlhsFtEtt
Z+Yyx+o2csLYD6YwaafZifCaof3+OFxc5Ox1VwC7R8F4X9TYEDDFW7/TmlvZVWuR
t1CfcOIndeDuuzDDTaZbNAoJVJ5BW4zT1niXxu4bSgYIEikG/gPFV4YOUAgSnTVt
J7YOmkAyOic/4Fh8PU5wVuq+6F5gqPTxBD0nsRVdVdscaiXKOrNj4rQT5TYxcJ5I
Y3nWMggiPrpYGfWb7AjLeNQ7MOQAbdVsPE1dmIHG/OAhN6HpfoqnJBcKbxTehnfv
a+LH2U9wq+VQtug+643Zx6Oa8i08BBj9fW7MGYm3IqqWmOfZrvE=
=eSeE
-----END PGP SIGNATURE-----

--bpVaumkpfGNUagdU--
