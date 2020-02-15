Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA4015FD07
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Feb 2020 07:13:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48KKgw583dzDqrC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Feb 2020 17:13:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48KKfK44fbzDqjT
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Feb 2020 17:12:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 48KKfK3NW4z8t53
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Feb 2020 17:12:25 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 48KKfK2xmVz9sRJ; Sat, 15 Feb 2020 17:12:25 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=leonardo@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 48KKfK0CCQz9sPk;
 Sat, 15 Feb 2020 17:12:23 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01F69qW0018448; Sat, 15 Feb 2020 01:12:21 -0500
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y57deujx5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 15 Feb 2020 01:12:21 -0500
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01F69xR5024176;
 Sat, 15 Feb 2020 06:12:20 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma02wdc.us.ibm.com with ESMTP id 2y6895gx4a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 15 Feb 2020 06:12:20 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01F6CJtk52756808
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 15 Feb 2020 06:12:20 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D360CBE051;
 Sat, 15 Feb 2020 06:12:19 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7E5C2BE04F;
 Sat, 15 Feb 2020 06:12:18 +0000 (GMT)
Received: from LeoBras (unknown [9.85.178.59])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Sat, 15 Feb 2020 06:12:18 +0000 (GMT)
Message-ID: <da4638d01627765dbf0c414132e044065a2b7e25.camel@linux.ibm.com>
Subject: Re: [PATCH] powerpc: Fix /proc/cpuinfo revision for POWER9P processors
From: Leonardo Bras <leonardo@linux.ibm.com>
To: mahesh@linux.vnet.ibm.com, linuxppc-dev@ozlabs.org
Date: Sat, 15 Feb 2020 03:12:13 -0300
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-h0OPRSb8kzQMReSP2DE+"
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-15_01:2020-02-14,
 2020-02-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0
 suspectscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 clxscore=1011 malwarescore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002150050
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
Cc: mikey@neuling.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--=-h0OPRSb8kzQMReSP2DE+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com> writes:

Hello Mahesh,

> POWER9P PVR bits are same as that of POWER9. Hence mask off only the
> relevant bits for the major revision similar to POWER9.
>
> Without this patch the cpuinfo output shows 17.0 as revision:
>
> $ cat /proc/cpuinfo
> processor	: 0
> cpu		: POWER9P, altivec supported
> clock		: 2950.000000MHz
> revision	: 17.0 (pvr 004f 1100)
>
> With this change it reflects the correct revision:
>
> $ cat /proc/cpuinfo
> processor	: 0
> cpu		: POWER9P, altivec supported
> clock		: 2633.000000MHz
> revision	: 1.0 (pvr 004f 1100)
>
> Signed-off-by: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>
> ---
>  arch/powerpc/kernel/setup-common.c |    1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/set=
up-common.c
> index 488f1eecc0de..37342ec42cb3 100644
> --- a/arch/powerpc/kernel/setup-common.c
> +++ b/arch/powerpc/kernel/setup-common.c
> @@ -315,6 +315,7 @@ static int show_cpuinfo(struct seq_file *m, void *v)
>  				min =3D pvr & 0xFF;
>  				break;
>  			case 0x004e: /* POWER9 bits 12-15 give chip type */
> +			case 0x004f: /* POWER9P bits 12-15 give chip type */
>  				maj =3D (pvr >> 8) & 0x0F;
>  				min =3D pvr & 0xFF;
>  				break;

Seems fine to me.

FWIW:
Reviwed-by: Leonardo Bras <leonardo@linux.ibm.com>

--=-h0OPRSb8kzQMReSP2DE+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMdeUgIzgjf6YmUyOlQYWtz9SttQFAl5Hi70ACgkQlQYWtz9S
ttTp8hAA4QMyWRaekIn0YRc4k3fAdhCbgVEK+tdjGjib+Qws7uCNp1FWvO5ljuOK
sgnZ4n5dRQshE6Ko7o60G4Sf1EiDZAe/I5bH1JjVcCnzhkFufuIq0VnPeGV3Vl2Y
XbSgATClrRUfyNXHqlm5RpnuaUnVt98b0axUlax7LFJp3iqKyCoP8aQFR/xZbCLA
yuWlgeh77ezecJSsl4MTWn2o/9p7HXZnhXZiBDMKmmZmjoZCatjghH27LoYxZUCu
7w72/V9lmLf3rrECdlEmBq4hDePL2L4igcQIHQZJ6LMhywpLypXm41AalaEWgCgd
c1IPBH8EedfOmgNHiibaLT+xMJ3cnBzKWvfnlpeBZFNgX6CDXkI1yBi8mnSnJBZw
Fmy+eH+KgUYgJpqNZCukzBQ+6ZTY0Iym4TB/OCArMtkGBfuuHpZ1qiGr7mQ027jp
TZdulGgSQXaYI5HUzf1j9mQlotOqul1MIEikVMgle5Dsc5WSMIZg0lxuODJewCUY
wI07LTLVR7Mp4idbQdBWK2OlEHeYKSWqbi7swROogZ8ZE2stKho1mSDa5NxSmpyu
TBxLhrWLCmO0ppLmTU+KlhZRu+5vZQteRKDgO1w+snauNcPIYxgRQEugQ/zoPIbV
RySDT1jcLxLQoA6szdzIJPyuloDxA3bRIQ6Hv4UsPoK4nkj4i/A=
=hGz8
-----END PGP SIGNATURE-----

--=-h0OPRSb8kzQMReSP2DE+--

