Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C644D15FCF9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Feb 2020 06:40:53 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48KJxt5JtdzDqn2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Feb 2020 16:40:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=leonardo@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48KJwF67M9zDqcw
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Feb 2020 16:39:25 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01F5SFc1173832
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Feb 2020 00:39:23 -0500
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y1ucqk5f0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Feb 2020 00:39:22 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01F5b0Zk013485
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Feb 2020 05:39:22 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma03wdc.us.ibm.com with ESMTP id 2y6895gs39-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Feb 2020 05:39:22 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01F5dK1W61145438
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 15 Feb 2020 05:39:21 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DDBA27805C;
 Sat, 15 Feb 2020 05:39:20 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1A60B7805F;
 Sat, 15 Feb 2020 05:39:19 +0000 (GMT)
Received: from LeoBras (unknown [9.85.178.59])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Sat, 15 Feb 2020 05:39:18 +0000 (GMT)
Message-ID: <9ba1d74b53b573d62becba084bb796d3e983f9b4.camel@linux.ibm.com>
Subject: Re: [PATCH] powerpc: fix hardware PMU exception bug on PowerVM
 compatibility mode systems
From: Leonardo Bras <leonardo@linux.ibm.com>
To: desnesn@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Date: Sat, 15 Feb 2020 02:39:17 -0300
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-57yNezBsW8hZHr7PEVjF"
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-14_09:2020-02-14,
 2020-02-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 mlxscore=0
 mlxlogscore=999 priorityscore=1501 suspectscore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002150043
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
Cc: desnesn@linux.ibm.com, gromero@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--=-57yNezBsW8hZHr7PEVjF
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Desnes, thanks for the patch.

"Desnes A. Nunes do Rosario" <desnesn@linux.ibm.com> writes:

> PowerVM systems running compatibility mode on a few Power8 revisions are
> still vulnerable to the hardware defect that loses PMU exceptions arrivin=
g
> prior to a context switch.
>
> The software fix for this issue is enabled through the CPU_FTR_PMAO_BUG
> cpu_feature bit, nevertheless this bit also needs to be set for PowerVM
> compatibility mode systems.
>
> Fixes: 68f2f0d431d9ea4 ("powerpc: Add a cpu feature CPU_FTR_PMAO_BUG")
> Signed-off-by: Desnes A. Nunes do Rosario <desnesn@linux.ibm.com>
> ---
>  arch/powerpc/kernel/cputable.c | 2 ++
>  1 file changed, 2 insertions(+)
>
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

What are your thoughts about doing:
	t->cpu_features |=3D  old.cpu_features & CPU_FTR_PMAO_BUG;

Also, I would recommend adding a short comment on top of the added
lines explaining why it is needed.=20

Best regards,
Leonardo Bras


--=-57yNezBsW8hZHr7PEVjF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMdeUgIzgjf6YmUyOlQYWtz9SttQFAl5HhAUACgkQlQYWtz9S
ttTm0BAAr/hyHPX6RA6KHBHYwDS/9zZ8u8zvO7vPqDYQfD+jLnIJ5iiT3VNYgrqb
iV5XE8qicQNa42jUfgv/lqOqRWtm9OQLzc4tI5a7tVQqlPYgAkjJP/xDoD0NrXHC
Qi4x1RJ5D6tdTb9rxqrg7Yc3wWx4pxu4Sh44xfnKbnZzYz3mkWulRc0CcO3m3eYe
OItoUT8+4q13Xs566YWDEYHGd9rQ3mW4YrYTxg3JxFwj3K9T6av1W6aEm/5ozVD2
3qQJuo4ssLVcUeO4dK0s8m6iq0r2m88DiO8cLjBFvhMeKCGKY3vEZospQh2kdfK3
JANSMHDpFFjoBqLLiVepAklVcQenBhjn6slhbZDZbsVOgl/jC7HrbuZo3GHxQv7m
q99czgX2fMy5VugjMLPnL9ZwoIUkyUJ31uCXIrLHw95ScANy/ECeAd9PNthbCjyX
MGBpxyXr9YPC2am2GRdMH+ZeSHmFCXopkjEsUNBJrYEwC4kIYyi4QtAPMv01bART
TlZmarCZvQDGYXb1Z5kDDwddOiq9JHHWKW2v2qygsKGZoof19dUADdc+jcpM+WDD
Gui5Mjc+bT2cUK5JUyI+SeliSmEzC6bKfamS9eXk+FMTDqrgU0CmpwWg6oVRLBdR
Prm9I7KSIXPcofA02xREq3sbHxaeJr5zxJuuG3Jyzvn30KGpgtA=
=PZuY
-----END PGP SIGNATURE-----

--=-57yNezBsW8hZHr7PEVjF--

