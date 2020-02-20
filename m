Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E01E166A13
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Feb 2020 22:54:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48NpKH2lfQzDqSl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Feb 2020 08:54:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=leonardo@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48NpHh1c1FzDqR6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Feb 2020 08:53:19 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01KLpWAZ102715; Thu, 20 Feb 2020 16:53:12 -0500
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y8ubgsx6m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Feb 2020 16:53:11 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01KLq7Ma016004;
 Thu, 20 Feb 2020 21:53:11 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma01dal.us.ibm.com with ESMTP id 2y6897c33u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Feb 2020 21:53:10 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01KLr9WH41812454
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 Feb 2020 21:53:09 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 86AF878069;
 Thu, 20 Feb 2020 21:53:09 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 369167805C;
 Thu, 20 Feb 2020 21:53:08 +0000 (GMT)
Received: from leobras.br.ibm.com (unknown [9.18.235.190])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 20 Feb 2020 21:53:07 +0000 (GMT)
Message-ID: <fd6b84ae605c652f652c25e3b8f3e234b82edd8e.camel@linux.ibm.com>
Subject: Re: [PATCH] powerpc/8xx: Fix clearing of bits 20-23 in ITLB miss
From: Leonardo Bras <leonardo@linux.ibm.com>
To: christophe.leroy@c-s.fr, benh@kernel.crashing.org, paulus@samba.org,
 mpe@ellerman.id.au
Date: Thu, 20 Feb 2020 18:53:04 -0300
In-Reply-To: <1cd9c970771ba9f08621ae8357340c93f386bc24.camel@linux.ibm.com>
References: <1cd9c970771ba9f08621ae8357340c93f386bc24.camel@linux.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-7O7yPN7c8Y5tej+lpYHC"
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-20_17:2020-02-19,
 2020-02-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 spamscore=0 impostorscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002200160
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--=-7O7yPN7c8Y5tej+lpYHC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2020-02-11 at 01:28 -0300, Leonardo Bras wrote:
> Looks a valid change.
> rlwimi  r10, r10, 0, 0x0f00 means:=20
> r10 =3D ((r10 << 0) & 0x0f00) | (r10 & ~0x0f00) which ends up being
> r10 =3D r10=20
>=20
> On ISA, rlwinm is recommended for clearing high order bits.
> rlwinm  r10, r10, 0, ~0x0f00 means:
> r10 =3D (r10 << 0) & ~0x0f00
>=20
> Which does exactly what the comments suggests.
>=20
> FWIW:
> Reviwed-by: Leonardo Bras <leonardo@linux.ibm.com>


Sorry, I just realized the above was not very clear on my part.

What I meant to say was:
I think your change is correct, as it correctly fixes this line.

I would suggest adding the text bellow to your commit message, making
it easier to understand why rlwimi is not the right instruction clear
bytes 20-23, and why rlwinm is.

The current instruction can be translated to C as:
rlwimi  r10, r10, 0, 0x0f00
r10 =3D ((r10 << 0) & 0x0f00) | (r10 & ~0x0f00) 	->
r10 =3D (r10 & 0x0f00) | (r10 & ~0x0f00)		->
r10 =3D r10

The new proposed instruction can be translated to C as:
rlwinm  r10, r10, 0, ~0x0f00 	->
r10 =3D (r10 << 0) & ~0x0f00

Which clears bits 20-23 as comment on code states.

Best regards,

Leonardo Bras



--=-7O7yPN7c8Y5tej+lpYHC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMdeUgIzgjf6YmUyOlQYWtz9SttQFAl5O/8AACgkQlQYWtz9S
ttQehQ//ejnIk/wjlRFuOR4Xe55pqcLVaHnyyveqvLIM6MA9GE7AQ3woMVFJSvXW
qoGDE/Daf26yPaFGEB8vsljZhkE1qtt6bnV3JtXVxYLdvv2EkSPPgZ2ZfDuBuv7Q
VWVpWOQ7rv9TPry/pfx5DZOaZFbUgB8I7n90ZfRl5hUBKI94FQ5Yf6yujkyfuPrP
1oPmXqSBZ9NIaHk7cATp3McpFtBOwd1wWvB2xGHycBuK+zIbj8xFaP3zc8EU9yUq
Uw/rtoJuRBUTVOIyrIypYIe3g5Kgf8pGSMMDrRUmWH/K6o5//o5eP8STJtC8Lzdl
oVQ6VXvGmLNIMbLASut2J9VDV2QT8okWoXl9lf6WOq47hm3dvraMjOLihHT3DRGg
WtDbTliELv7FtXC3+WvwzsjuNaAb3GhKT4FnQ5UWp7z8BJGXV8zRFKpj9W8SY1iG
W+ndgjCdHq//CV0M1W2H3fDvZqPzoUVmBAaQlUHCBrb2eJ5IXx3SFc73mIEgDi0h
FoqwEIYNF9jAKuIR0AvnpmUf7cz1/isDn2zg/6ttjjUESx0vSS0nQDQK5futrZbD
PO7/UBx4mq5MTppxksWYam2Q7eQ9b9Xd6F1o3kuiossMz10cn2FvCapxQM9gQhrb
doVD95YNX2L5d1l3ABul3bWfoOT32EqECUf9iPGpbgHDy3GQIt4=
=qHE2
-----END PGP SIGNATURE-----

--=-7O7yPN7c8Y5tej+lpYHC--

