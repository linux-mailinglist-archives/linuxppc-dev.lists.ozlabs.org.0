Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D04A715FD19
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Feb 2020 07:27:43 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48KKzv2FTXzDqm6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Feb 2020 17:27:39 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48KKyP2YVdzDq6K
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Feb 2020 17:26:21 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01F6Ohtl035194
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Feb 2020 01:26:19 -0500
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y4qyuxabm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Feb 2020 01:26:19 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01F6PRKZ011708
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Feb 2020 06:26:18 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma01wdc.us.ibm.com with ESMTP id 2y6895h0a6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Feb 2020 06:26:18 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01F6QGO456623578
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 15 Feb 2020 06:26:16 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8E2F4BE059;
 Sat, 15 Feb 2020 06:26:16 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1D96FBE058;
 Sat, 15 Feb 2020 06:26:15 +0000 (GMT)
Received: from LeoBras (unknown [9.85.178.59])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Sat, 15 Feb 2020 06:26:14 +0000 (GMT)
Message-ID: <317f8594683d37ed7e0935d37f38e389eeae7b36.camel@linux.ibm.com>
Subject: Re: [PATCH] powerpc: fix hardware PMU exception bug on PowerVM
 compatibility mode systems
From: Leonardo Bras <leonardo@linux.ibm.com>
To: "Desnes A. Nunes do Rosario" <desnesn@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Date: Sat, 15 Feb 2020 03:26:13 -0300
In-Reply-To: <20200214001905.20065-1-desnesn@linux.ibm.com>
References: <20200214001905.20065-1-desnesn@linux.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-WVAws4usn+TiYLx0DHQJ"
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-15_01:2020-02-14,
 2020-02-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 lowpriorityscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002150052
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
Cc: gromero@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--=-WVAws4usn+TiYLx0DHQJ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Desnes, thanks for the patch.

On Thu, 2020-02-13 at 21:19 -0300, Desnes A. Nunes do Rosario wrote:
> PowerVM systems running compatibility mode on a few Power8 revisions are
> still vulnerable to the hardware defect that loses PMU exceptions arrivin=
g
> prior to a context switch.
>=20
> The software fix for this issue is enabled through the CPU_FTR_PMAO_BUG
> cpu_feature bit, nevertheless this bit also needs to be set for PowerVM
> compatibility mode systems.
>=20
> Fixes: 68f2f0d431d9ea4 ("powerpc: Add a cpu feature CPU_FTR_PMAO_BUG")
> Signed-off-by: Desnes A. Nunes do Rosario <desnesn@linux.ibm.com>
> ---
>  arch/powerpc/kernel/cputable.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/arch/powerpc/kernel/cputable.c b/arch/powerpc/kernel/cputabl=
e.c
> index e745abc5457a..5bfef6263dfb 100644
> --- a/arch/powerpc/kernel/cputable.c
> +++ b/arch/powerpc/kernel/cputable.c
> @@ -2198,6 +2198,8 @@ static struct cpu_spec * __init setup_cpu_spec(unsi=
gned long offset,
>  		if (old.oprofile_cpu_type !=3D NULL) {
>  			t->oprofile_cpu_type =3D old.oprofile_cpu_type;
>  			t->oprofile_type =3D old.oprofile_type;
> +			if (old.cpu_features & CPU_FTR_PMAO_BUG)
> +				t->cpu_features |=3D CPU_FTR_PMAO_BUG;
>  		}
>  	}
> =20

What are your thoughts about doing:
        t->cpu_features |=3D  old.cpu_features & CPU_FTR_PMAO_BUG;

Also, I would recommend adding a short comment on top of the added
lines explaining why it is needed.=20

Best regards,
Leonardo Bras

--=-WVAws4usn+TiYLx0DHQJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMdeUgIzgjf6YmUyOlQYWtz9SttQFAl5HjwUACgkQlQYWtz9S
ttTG0w/+PbZGsA0GeCOquTv/k+UTPNlGqSg3M6im7O2+YBHAi13OrOCiHdIsax+L
lkmU0U3orkHtcIip0vI0D6GG4ap1dT8YDvQostGuTwcfRCvgIy2yq0xL1EUtkcwb
WIy2+g2hT+fe/+1I52uDLtC7LNeA/4hfa8lSautcoE0naLkkSC2OE/ZRg7u4uZZ0
mO4oJN32+bej8F//bR/VkqC+gsTbL3BH82QwKg3aFmVI5x7lYfPgmDyC0tLmTI6Z
BEWS2JtaBvvq2jLOZzmFWyZi1SDfPIygGEHFdnzYncf39Y/BB1FkH2JdSZOLjAN2
KesQSNMHmR1pn3Kph/sRAhdAyx6ez7oja1QC+vc1ZrZDRi8dq+7X/IImRmZWPA02
APl9VyHAR85qd3c0jcriTzC6KrtEnDtxk7h9ohc4BOYinz1Dn1NuV36/iOST4EKT
FwFg1qbvyYXzAoA3sn1wH5rhNg/gc37AHupOMPvbifpohHF89tnfwTPc1N9tbu/Y
M/DXr/scP5+w+GToiG09ojr965AvXcBmMc6FjgQ8ha6JQ9zgJ7AhdAN50d0z6DCa
o/xAK4pG0NcFxzqgjKL6I1EOLOrU9BOIPKH9Pj0SajEwnnlXx1qWYLUv/fWaGQab
GkvvnleGsvV2jt+wwWWTrLkcJBhhM4/vwWAlxrUEwNCG5Zy44tw=
=RGfy
-----END PGP SIGNATURE-----

--=-WVAws4usn+TiYLx0DHQJ--

