Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6B1164D9B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Feb 2020 19:26:36 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48N5lX4vgmzDq7d
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Feb 2020 05:26:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48N5BH0RFTzDqQn
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Feb 2020 05:01:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 48N5B44JDNz99Gj
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Feb 2020 05:01:00 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 48N5B41KYqz9sRl; Thu, 20 Feb 2020 05:01:00 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=leonardo@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 48N5B325S3z9sNg;
 Thu, 20 Feb 2020 05:00:59 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01JHnFn0112134; Wed, 19 Feb 2020 13:00:56 -0500
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2y8ubvqdad-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Feb 2020 13:00:56 -0500
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01JHtM0w026514;
 Wed, 19 Feb 2020 18:00:55 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma02wdc.us.ibm.com with ESMTP id 2y6896nh6d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Feb 2020 18:00:55 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01JI0sxg49349046
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Feb 2020 18:00:54 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C8C82AE060;
 Wed, 19 Feb 2020 18:00:54 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 35DF1AE062;
 Wed, 19 Feb 2020 18:00:54 +0000 (GMT)
Received: from leobras.br.ibm.com (unknown [9.18.235.190])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 19 Feb 2020 18:00:54 +0000 (GMT)
Message-ID: <ae63d7b8028dea5a8ffd37977d2b48ba6ceff620.camel@linux.ibm.com>
Subject: Re: [PATCH] KVM: PPC: Book3S HV: Use RADIX_PTE_INDEX_SIZE in Radix
 MMU code
From: Leonardo Bras <leonardo@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, kvm-ppc@vger.kernel.org
Date: Wed, 19 Feb 2020 15:00:50 -0300
In-Reply-To: <20200218043650.24410-1-mpe@ellerman.id.au>
References: <20200218043650.24410-1-mpe@ellerman.id.au>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-WANm6kNd/+v1nI1QzPkC"
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-19_04:2020-02-19,
 2020-02-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=2 mlxlogscore=999
 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002190136
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
Cc: linuxppc-dev@ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--=-WANm6kNd/+v1nI1QzPkC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Michael,

On Tue, 2020-02-18 at 15:36 +1100, Michael Ellerman wrote:
> In kvmppc_unmap_free_pte() in book3s_64_mmu_radix.c, we use the
> non-constant value PTE_INDEX_SIZE to clear a PTE page.
>=20
> We can instead use the constant RADIX_PTE_INDEX_SIZE, because we know
> this code will only be running when the Radix MMU is active.
>=20
> Note that we already use RADIX_PTE_INDEX_SIZE for the allocation of
> kvm_pte_cache.
>=20
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  arch/powerpc/kvm/book3s_64_mmu_radix.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/bo=
ok3s_64_mmu_radix.c
> index 803940d79b73..134fbc1f029f 100644
> --- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
> +++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
> @@ -425,7 +425,7 @@ static void kvmppc_unmap_free_pte(struct kvm *kvm, pt=
e_t *pte, bool full,
>  				  unsigned int lpid)
>  {
>  	if (full) {
> -		memset(pte, 0, sizeof(long) << PTE_INDEX_SIZE);
> +		memset(pte, 0, sizeof(long) << RADIX_PTE_INDEX_SIZE);
>  	} else {
>  		pte_t *p =3D pte;
>  		unsigned long it;

Looks fine to mee.=20

For book3s_64, pgtable.h says:
extern unsigned long __pte_index_size;
#define PTE_INDEX_SIZE  __pte_index_size

powerpc/mm/pgtable_64.c defines/export the variable:
unsigned long __pte_index_size;
EXPORT_SYMBOL(__pte_index_size);

And book3s64/radix_pgtable.c set the value in radix__early_init_mmu().
__pte_index_size =3D RADIX_PTE_INDEX_SIZE;

So I think it's ok to use the value directly in book3s_64_mmu_radix.c.
The include dependency looks fine for that to work.

FWIW:
Reviewed-by: Leonardo Bras <leonardo@linux.ibm.com>


--=-WANm6kNd/+v1nI1QzPkC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMdeUgIzgjf6YmUyOlQYWtz9SttQFAl5Nd9IACgkQlQYWtz9S
ttQU/g/8C1JEQTzs3SKTcxD4d/Qnbo8koRKYz9F3wcsLsKgkMZaJPM4a/JtXQyEf
uE/pBmy3zKvmwjlUuJQwnWwLqyxZYmf7lw479lqX+5I1oRC/lg7bwaLT2LuyNuJU
yO25vj8yPUXkmWhFgGgbTV3bUz7w1i3jG7BoNf/HCZkABidpOzbrDrqxcMPat5u2
tcKTd2yOEBuELStgJNEWu9uJkbqxB6K97ij6V5hUtqmop/8Ox6EyXrXDbp3N5pjM
EATBxBUeZtnnuoyb5KxpDnhyE5U966+LWt+dDwWHborMCX6KeKlMPhms3OBieFj6
eeqABl7DzTxnWE6swpmbx8j5YJczkvNfFz99gCZV8GrtT9VAKOv9Lqliv4bUJX/o
U1DtQd4p6E11FhK++rF151IwM30CF7Up+8c6AvQBANhV0hHMmHOYnVSN1uU9DOdb
Ux+/QAX0F//TSPCiqSxUSrYID2VKsjlt7VqLnwiVkO6CnwOWs2FHg7bIwrnQHFVn
FISzAd9IjutTrDeCOMLSbs6djpWQ6g3SG/IwjD+tDbsrMGS/vYeGtu3s//qho2Ux
X+cjxc7l8GEqNyV9WsWg6tWyBoPTJmK9to65LnbYZs6pcB3nc6Zmvjcj9x03fnCr
0fqX2noHT5AmGQnta9dW2/2ZLkif3utCZ1/qX/0Vt9KE2PMqOQA=
=gMeG
-----END PGP SIGNATURE-----

--=-WANm6kNd/+v1nI1QzPkC--

