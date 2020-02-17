Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A1B16144C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2020 15:13:42 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48LmDh09TDzDqfM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2020 01:13:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=leonardo@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Lm933bc9zDqc7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2020 01:10:31 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01HE5RuM134777; Mon, 17 Feb 2020 09:10:17 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2y6bp07ywf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Feb 2020 09:10:17 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01HEA8uk008753;
 Mon, 17 Feb 2020 14:10:16 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma02dal.us.ibm.com with ESMTP id 2y68966pky-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Feb 2020 14:10:15 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01HEAEcS27263320
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Feb 2020 14:10:14 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A667CBE054;
 Mon, 17 Feb 2020 14:10:14 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4AFB1BE051;
 Mon, 17 Feb 2020 14:10:13 +0000 (GMT)
Received: from leobras.br.ibm.com (unknown [9.18.235.152])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 17 Feb 2020 14:10:13 +0000 (GMT)
Message-ID: <423702075b0dcb129dca83ae3a98b090d58ad0e7.camel@linux.ibm.com>
Subject: Re: [PATCH] powerpc/8xx: Fix clearing of bits 20-23 in ITLB miss
From: Leonardo Bras <leonardo@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@c-s.fr>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael
 Ellerman <mpe@ellerman.id.au>
Date: Mon, 17 Feb 2020 11:10:09 -0300
In-Reply-To: <1d6a53ab-ea72-7452-ea5f-43dd70b223c9@c-s.fr>
References: <4f70c2778163affce8508a210f65d140e84524b4.1581272050.git.christophe.leroy@c-s.fr>
 <546ce4737f308a4ba99a53f550de5b44abc06444.camel@linux.ibm.com>
 <1d6a53ab-ea72-7452-ea5f-43dd70b223c9@c-s.fr>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-VzmBVc8/yToR3dI4YbK+"
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-17_08:2020-02-17,
 2020-02-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 malwarescore=0 phishscore=0 mlxlogscore=999 adultscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002170117
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


--=-VzmBVc8/yToR3dI4YbK+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2020-02-15 at 11:17 +0100, Christophe Leroy wrote:
>=20
> Le 15/02/2020 =C3=A0 07:28, Leonardo Bras a =C3=A9crit :
> > On Sun, 2020-02-09 at 18:14 +0000, Christophe Leroy wrote:
> > > In ITLB miss handled the line supposed to clear bits 20-23 on the
> > > L2 ITLB entry is buggy and does indeed nothing, leading to undefined
> > > value which could allow execution when it shouldn't.
> > >=20
> > > Properly do the clearing with the relevant instruction.
> > >=20
> > > Fixes: 74fabcadfd43 ("powerpc/8xx: don't use r12/SPRN_SPRG_SCRATCH2 i=
n TLB Miss handlers")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> > > ---
> > >   arch/powerpc/kernel/head_8xx.S | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/hea=
d_8xx.S
> > > index 9922306ae512..073a651787df 100644
> > > --- a/arch/powerpc/kernel/head_8xx.S
> > > +++ b/arch/powerpc/kernel/head_8xx.S
> > > @@ -256,7 +256,7 @@ InstructionTLBMiss:
> > >   	 * set.  All other Linux PTE bits control the behavior
> > >   	 * of the MMU.
> > >   	 */
> > > -	rlwimi	r10, r10, 0, 0x0f00	/* Clear bits 20-23 */
> > > +	rlwinm	r10, r10, 0, ~0x0f00	/* Clear bits 20-23 */
> > >   	rlwimi	r10, r10, 4, 0x0400	/* Copy _PAGE_EXEC into bit 21 */
> > >   	ori	r10, r10, RPN_PATTERN | 0x200 /* Set 22 and 24-27 */
> > >   	mtspr	SPRN_MI_RPN, r10	/* Update TLB entry */
> >=20
> > Looks a valid change.
> > rlwimi  r10, r10, 0, 0x0f00 means:
> > r10 =3D ((r10 << 0) & 0x0f00) | (r10 & ~0x0f00) which ends up being
> > r10 =3D r10
> >=20
> > On ISA, rlwinm is recommended for clearing high order bits.
> > rlwinm  r10, r10, 0, ~0x0f00 means:
> > r10 =3D (r10 << 0) & ~0x0f00
> >=20
> > Which does exactly what the comments suggests.
> >=20
> > FWIW:
> > Reviwed-by: Leonardo Bras <leonardo@linux.ibm.com>
> >=20
>=20
> I guess you mean
>=20
> Reviewed-by: Leonardo Bras <leonardo@linux.ibm.com>

Yes, sorry for the typo.

--=-VzmBVc8/yToR3dI4YbK+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMdeUgIzgjf6YmUyOlQYWtz9SttQFAl5KnsEACgkQlQYWtz9S
ttSWQw//Qk881kecmznRJws7Dniga+I79I0aWy8xbXeMV7u8p7eLeom2HeZydUo0
Jg/DFMiNnoMj77138Ht07KdADYV8fdE59DW66YufBfEevltanJ6tS8Zj/MV0js5H
H5OphYNon2NWw5fCRpYGRlQJi+BsM7c6s/fpVW0xsEWg6MvRekLSOCs/gtEwFWDn
Rxj9jY7+gvDJyMYR59cMJH07F9Ob7Bbu4PSUM8YbPNwgFtjR49WSAGsV0VCfN9L8
Kz+52aOj9m48kA2PG5XiejC56+Tp06vGbo4ODjZY/5+b+OcG9O5P9qM7x4TCPfL3
BsJKBBbj4nyWUSCfYkHOSP3PenZ1g/ZUffUZA2WiDC/ia7UTG+4PWlnqchPg5kz7
liFfO34RKPnZSjVKTjpxcRERu5azbc8LryKEW6QI4nb1Ol59JLK0HItnmPG+YW4d
trrjOfrj/0jP6HI8HzGMDoEbMFD6lfuf81oNQV8p26U+3x02PK2dEfeilgb6QFMv
BRvFzwj2GGuNI+vOIWm5DsdLin3KaqAFZ2CZGt/VYWH1AAil6umwsSAcQRz84tvW
UblRqtrV5tUaA7aKzgvyuu/mSrF0URrzA75eWjneM4MljkY77cHIAZ6RpByJ/Iim
OBUhPODqgdGdwC0R9YwRB5KX6NbEx6y/wmqsmsivWTYTecp73QM=
=LUct
-----END PGP SIGNATURE-----

--=-VzmBVc8/yToR3dI4YbK+--

