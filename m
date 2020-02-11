Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5950415892B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Feb 2020 05:30:43 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48GqZm0XwSzDqJh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Feb 2020 15:30:40 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48GqXx4w62zDqBc
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Feb 2020 15:29:05 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01B4SeWA085221; Mon, 10 Feb 2020 23:28:54 -0500
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2y1tndsjtw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Feb 2020 23:28:54 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01B4QUH4014697;
 Tue, 11 Feb 2020 04:28:53 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma01dal.us.ibm.com with ESMTP id 2y1mm6yuh7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Feb 2020 04:28:53 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01B4SqE550397458
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 Feb 2020 04:28:52 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9E2B6AE05C;
 Tue, 11 Feb 2020 04:28:52 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 673A1AE060;
 Tue, 11 Feb 2020 04:28:49 +0000 (GMT)
Received: from LeoBras (unknown [9.85.155.18])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 11 Feb 2020 04:28:49 +0000 (GMT)
Message-ID: <1cd9c970771ba9f08621ae8357340c93f386bc24.camel@linux.ibm.com>
Subject: Re: [PATCH] powerpc/8xx: Fix clearing of bits 20-23 in ITLB miss
From: Leonardo Bras <leonardo@linux.ibm.com>
To: christophe.leroy@c-s.fr, benh@kernel.crashing.org, paulus@samba.org,
 mpe@ellerman.id.au
Date: Tue, 11 Feb 2020 01:28:44 -0300
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-xDAOyXIsHMs0j4R39yqj"
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-10_08:2020-02-10,
 2020-02-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 phishscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002110030
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


--=-xDAOyXIsHMs0j4R39yqj
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Christophe Leroy <christophe.leroy@c-s.fr> writes:

> In ITLB miss handled the line supposed to clear bits 20-23 on the
> L2 ITLB entry is buggy and does indeed nothing, leading to undefined
> value which could allow execution when it shouldn't.
>
> Properly do the clearing with the relevant instruction.
>
> Fixes: 74fabcadfd43 ("powerpc/8xx: don't use r12/SPRN_SPRG_SCRATCH2 in TL=
B Miss handlers")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> ---
>  arch/powerpc/kernel/head_8xx.S | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8x=
x.S
> index 9922306ae512..073a651787df 100644
> --- a/arch/powerpc/kernel/head_8xx.S
> +++ b/arch/powerpc/kernel/head_8xx.S
> @@ -256,7 +256,7 @@ InstructionTLBMiss:
>  	 * set.  All other Linux PTE bits control the behavior
>  	 * of the MMU.
>  	 */
> -	rlwimi	r10, r10, 0, 0x0f00	/* Clear bits 20-23 */
> +	rlwinm	r10, r10, 0, ~0x0f00	/* Clear bits 20-23 */
>  	rlwimi	r10, r10, 4, 0x0400	/* Copy _PAGE_EXEC into bit 21 */
>  	ori	r10, r10, RPN_PATTERN | 0x200 /* Set 22 and 24-27 */
>  	mtspr	SPRN_MI_RPN, r10	/* Update TLB entry */
> --=20
> 2.25.0

Looks a valid change.
rlwimi  r10, r10, 0, 0x0f00 means:=20
r10 =3D ((r10 << 0) & 0x0f00) | (r10 & ~0x0f00) which ends up being
r10 =3D r10=20

On ISA, rlwinm is recommended for clearing high order bits.
rlwinm  r10, r10, 0, ~0x0f00 means:
r10 =3D (r10 << 0) & ~0x0f00

Which does exactly what the comments suggests.

FWIW:
Reviwed-by: Leonardo Bras <leonardo@linux.ibm.com>

--=-xDAOyXIsHMs0j4R39yqj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMdeUgIzgjf6YmUyOlQYWtz9SttQFAl5CLXwACgkQlQYWtz9S
ttTvxg/+P4NqENWap51cZFh1Umvzrmqhy+i/SX1us+WFPUoW7paLgqSPZDz5G1iq
4NotVXJCw1ZC5hf7bYBzIsFjfB5pLPSjUExie/P5O9yNvOjon3BOdrcwdx5p8sfS
5Xca8szD9e6Om/YVrTmvY3aIhorGTtVboyCZ/xZIZjdcSh5wC7fyGQE0+eK2Cu5w
6tIHwdvwO0/Z/ovOo/hQlprh8Zz24R7qJVOae8LAUMENSeNN5tNUW5YCTYJOsuR8
RQ/4NzFw5DBRhZtPcJxBh7wZ/GDvRr5s1eIGgft1L4IWqUap73GI34VaeClVKRZD
/EW5JThmcbmN2DlyOw1BRs4yrrJD5jXbMQlj6TXeSXrzGLs4azyGHS2K3/XbGBYv
C+x/+PsDx5/otJe2OWWjuypyy9GI/LQiTCQUZfrUaDafNP1EiP/UiyKLbhsMacAB
hB/mRHoTXvIMK/qa7+QYoAqPIlVTQXKTZmOwGXPQtSvi7NNFpX55DjU28SWguJsi
eRXdo0/imfSJUCz9HPzg5DjfVK94BuZtSX2+w8P99Ic6mEbIN/BBW1vffoT1vT1B
a8LXCpXdbZwyiuKAwiwDDqX0s0XjYLDo/7L3qCmgKPkYBrY3etAfr/eohV6UlxAF
8k6d/nDfltv3B2G0DxlzfBgFR1RUlYfJIVQYe0DPdgxNUohwn4A=
=LkZr
-----END PGP SIGNATURE-----

--=-xDAOyXIsHMs0j4R39yqj--

