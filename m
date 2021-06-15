Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C6F3A757C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 05:59:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3vhN4sT9z3clt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 13:59:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=201602 header.b=WP7jJxJC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=dgibson@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=WP7jJxJC; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3vd70Z7nz303y
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 13:56:26 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4G3vcz4m8yz9t10; Tue, 15 Jun 2021 13:56:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1623729379;
 bh=13Pn92Rsr/hYhtFrTjnVtB9iZYClobDqpyOkISx6PZo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WP7jJxJCEGESvxOdW+XQ9mC5Ax96LrRzHrvNUvOplTyfqJyupMOTxonFP5ksGZF+A
 yQuMIzUcwk5P0qA6rEiE2yi/Gu/4RtfHVovea7iunU13ghHld62rRz4TYK1Pi5r9xQ
 5Nwn6xAexJcoa506tzsQ4JepCKC84Og0GZPXlx34=
Date: Tue, 15 Jun 2021 13:21:59 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [RFC PATCH 6/8] powerpc/pseries: Add a helper for form1 cpu
 distance
Message-ID: <YMgc1z63ejhHEHsM@yekko>
References: <20210614164003.196094-1-aneesh.kumar@linux.ibm.com>
 <20210614164003.196094-7-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Ltj0sKFFmY8m21Do"
Content-Disposition: inline
In-Reply-To: <20210614164003.196094-7-aneesh.kumar@linux.ibm.com>
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


--Ltj0sKFFmY8m21Do
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 14, 2021 at 10:10:01PM +0530, Aneesh Kumar K.V wrote:
> This helper is only used with the dispatch trace log collection.
> A later patch will add Form2 affinity support and this change helps
> in keeping that simpler. Also add a comment explaining we don't expect
> the code to be called with FORM0
>=20
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  arch/powerpc/mm/numa.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
> index 64caaf07cf82..696e5bfe1414 100644
> --- a/arch/powerpc/mm/numa.c
> +++ b/arch/powerpc/mm/numa.c
> @@ -166,7 +166,7 @@ static void unmap_cpu_from_node(unsigned long cpu)
>  }
>  #endif /* CONFIG_HOTPLUG_CPU || CONFIG_PPC_SPLPAR */
> =20
> -int cpu_distance(__be32 *cpu1_assoc, __be32 *cpu2_assoc)
> +static int __cpu_form1_distance(__be32 *cpu1_assoc, __be32 *cpu2_assoc)
>  {
>  	int dist =3D 0;
> =20
> @@ -182,6 +182,14 @@ int cpu_distance(__be32 *cpu1_assoc, __be32 *cpu2_as=
soc)
>  	return dist;
>  }
> =20
> +int cpu_distance(__be32 *cpu1_assoc, __be32 *cpu2_assoc)
> +{
> +	/* We should not get called with FORM0 */
> +	VM_WARN_ON(affinity_form =3D=3D FORM0_AFFINITY);
> +
> +	return __cpu_form1_distance(cpu1_assoc, cpu2_assoc);
> +}
> +
>  /* must hold reference to node during call */
>  static const __be32 *of_get_associativity(struct device_node *dev)
>  {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Ltj0sKFFmY8m21Do
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDIHNcACgkQbDjKyiDZ
s5Ie1Q/9Gg2JCY9Lz4xuRk0/XNB19EiSKe4RH2bg/2EESfvK6WE6yjHATNX/s4xg
RQJRTOpM5Q94q0NijW25oCQyHoeE6iYkYfFWmCjM/X7KvOkFO4bw92TvCJlRJ8vA
d3aU5yJqCHeGRTrONMFTTO8CzscNTdLR4zQaMprGWkqqVpsrT5PKCX/Gyl+aacgf
cSn0FWJH0q6Uqckr96YztQeR/e+fswabmGTRDPBuukq4iHEEYH+Rsku5uV9X6K5p
xacQPlWnH9c4CcTa3bzQlA7aqiUoEmOVBDyrcB1YhQ8MCxMtOojQ4/AhbbSI395r
Vqo4DB6YdbZM1Xcugd00zz3XqeHOi0qJtmL/+Quep8OAKcRL5szwvbNQRZzP1V1e
My21tN/oQpdht3HRJalGptC5MEgBUHN7HhqVg7pITCHFTOtWPVBBr0IsTGOCczWn
LiJ7JRbLldAB712GImY2OK3Tj+1imPGW9QU7xj0UQpCuKLzGt5XAljDOvBznQs3v
H1VLx7Y6dhBPkkQPJ/tpVP2XncMKn/eYHxYxwTOkGCbvK6A7LQNpjCtkQLsiFu/1
XCplFWEnevyQVtg9fZ0DOl90MM9Zk2sb1mxXhrNBkIHoky3n6cOOjArnWgPh5Ucx
KHqysFFxOfPYCjzzYizrg/hJd351Y0ugMqECnWZE6O/mv4x6A/Y=
=msmZ
-----END PGP SIGNATURE-----

--Ltj0sKFFmY8m21Do--
