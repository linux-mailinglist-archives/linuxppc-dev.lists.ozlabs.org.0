Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B0643172251
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 16:32:39 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48SxW65zmFzDqhC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 02:32:34 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48SxM20H1jzDr3X
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Feb 2020 02:25:33 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01RFON4r099915
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 10:25:30 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ydkfamkcv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 10:25:30 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01RFJkDf023281
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 15:25:28 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma04dal.us.ibm.com with ESMTP id 2ydcmm1t0r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 15:25:28 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01RFPRph60883444
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Feb 2020 15:25:27 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 197D1BE054;
 Thu, 27 Feb 2020 15:25:27 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B09E9BE04F;
 Thu, 27 Feb 2020 15:25:25 +0000 (GMT)
Received: from LeoBras (unknown [9.85.179.126])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 27 Feb 2020 15:25:25 +0000 (GMT)
Message-ID: <65b583ab89ebff348f5e464740da863a8f7f22b5.camel@linux.ibm.com>
Subject: Re: [PATCH, v2] powerpc: fix hardware PMU exception bug on PowerVM
 compatibility mode systems
From: Leonardo Bras <leonardo@linux.ibm.com>
To: "Desnes A. Nunes do Rosario" <desnesn@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Date: Thu, 27 Feb 2020 12:25:20 -0300
In-Reply-To: <20200227134715.9715-1-desnesn@linux.ibm.com>
References: <20200227134715.9715-1-desnesn@linux.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-tOpHfc4br+ybK4UJTNTg"
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-27_05:2020-02-26,
 2020-02-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999
 suspectscore=0 malwarescore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002270122
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


--=-tOpHfc4br+ybK4UJTNTg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-02-27 at 10:47 -0300, Desnes A. Nunes do Rosario wrote:
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
>  arch/powerpc/kernel/cputable.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/powerpc/kernel/cputable.c b/arch/powerpc/kernel/cputabl=
e.c
> index e745abc5457a..245be4fafe13 100644
> --- a/arch/powerpc/kernel/cputable.c
> +++ b/arch/powerpc/kernel/cputable.c
> @@ -2193,11 +2193,13 @@ static struct cpu_spec * __init setup_cpu_spec(un=
signed long offset,
>  		 * oprofile_cpu_type already has a value, then we are
>  		 * possibly overriding a real PVR with a logical one,
>  		 * and, in that case, keep the current value for
> -		 * oprofile_cpu_type.
> +		 * oprofile_cpu_type. Futhermore, let's ensure that the
> +		 * fix for the PMAO bug is enabled on compatibility mode.
>  		 */
>  		if (old.oprofile_cpu_type !=3D NULL) {
>  			t->oprofile_cpu_type =3D old.oprofile_cpu_type;
>  			t->oprofile_type =3D old.oprofile_type;
> +			t->cpu_features |=3D old.cpu_features & CPU_FTR_PMAO_BUG;
>  		}
>  	}
> =20

Looks good to me.

Reviewed-by: Leonardo Bras <leonardo@linux.ibm.com>

--=-tOpHfc4br+ybK4UJTNTg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMdeUgIzgjf6YmUyOlQYWtz9SttQFAl5X32AACgkQlQYWtz9S
ttTjdRAAsEpQ3v8EhVrErEpF62zfbup+l6FEu4uK0nRCUkSq6quTpsF6menUI5bL
dZwrBtqZZbosr8l2JRf6txLi+3LbNczcGHuxXBnGg9bndj+9i5DFJA2hq/U9Q1tz
tE/S6o8K13N+rCVk07gzk7TD2ftZgTJij+cMOiD0KAOc6Vrhw3S1nsR9rZ+sroFy
4bZikGu2VA5AErk0S5S5AX+ll/03lLoon4dJqB+lBt5JKUuN1k960Rj/klLqEeOt
bsXluYalDxreJm07srAtGGHTGriP32kcW6Y0bnBMk//ap3gMgiwl8Ac5qRYCjtjT
Oqh3adtzXSgrd1pi+1XmINO5+pHo+hdoiY+4wW8Z/PDi/ZsB0Tymw2Dnp080nStQ
59134c2i8+PU/kQTdrQKKyIpZh+V3iKC9WXw1PHEZleJJYm5b8wehxyK2lMiFU3q
M1wjauWGTXvYImxC8R+Ac1ctylm5sLfVi8xQuu48V4a5+ZZDFvVQFAOLkzWU2+TM
SMNxbrx20nZx1PeitFGvzWvKIxjpJPZ7pFcB8z8nI7go/tE+BgLUvIfkBi0LDCXR
rhFDZ+QWKwksdd6y9Xcj+FkdZqsMCjaTPyZeP4IyDQ6NK/ayoUloUE2jqVxNoyaR
vh+hc6pXn6PJ0ZLWje+We7eRA/9Ygxv6tfR7BuGD3PXcKBNfnls=
=sX2q
-----END PGP SIGNATURE-----

--=-tOpHfc4br+ybK4UJTNTg--

