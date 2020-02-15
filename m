Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C213015FD16
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Feb 2020 07:24:43 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48KKwS6SCCzDqnZ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Feb 2020 17:24:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48KKtx3xXhzDqfj
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Feb 2020 17:23:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 48KKtx3P2Rz8t2l
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Feb 2020 17:23:21 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 48KKtx2lmLz9sPk; Sat, 15 Feb 2020 17:23:21 +1100 (AEDT)
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
 by ozlabs.org (Postfix) with ESMTPS id 48KKtw6y8gz9sPJ;
 Sat, 15 Feb 2020 17:23:20 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01F6JFB7054542; Sat, 15 Feb 2020 01:23:18 -0500
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y5g8cp6fn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 15 Feb 2020 01:23:18 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01F6KGgr006918;
 Sat, 15 Feb 2020 06:23:17 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma01wdc.us.ibm.com with ESMTP id 2y6895gyvn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 15 Feb 2020 06:23:17 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01F6NHrt26214704
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 15 Feb 2020 06:23:17 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EA394AE05F;
 Sat, 15 Feb 2020 06:23:16 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CC4F0AE05C;
 Sat, 15 Feb 2020 06:23:15 +0000 (GMT)
Received: from LeoBras (unknown [9.85.178.59])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Sat, 15 Feb 2020 06:23:15 +0000 (GMT)
Message-ID: <2f2e88ca614ea1fd37d347a189f89c8bfa6b1c9c.camel@linux.ibm.com>
Subject: Re: [PATCH] powerpc: Fix /proc/cpuinfo revision for POWER9P processors
From: Leonardo Bras <leonardo@linux.ibm.com>
To: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>, linuxppc-dev
 <linuxppc-dev@ozlabs.org>
Date: Sat, 15 Feb 2020 03:23:14 -0300
In-Reply-To: <158161167949.29594.6467033073126346958.stgit@jupiter>
References: <158161167949.29594.6467033073126346958.stgit@jupiter>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-UP+1jzEu/NkEzMtjJF/9"
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-15_01:2020-02-14,
 2020-02-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015
 mlxlogscore=999 lowpriorityscore=0 phishscore=0 priorityscore=1501
 mlxscore=0 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
Cc: Michael Neuling <mikey@neuling.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--=-UP+1jzEu/NkEzMtjJF/9
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
> processor     : 0
> cpu           : POWER9P, altivec supported
> clock         : 2950.000000MHz
> revision      : 17.0 (pvr 004f 1100)
>
> With this change it reflects the correct revision:
>
> $ cat /proc/cpuinfo
> processor     : 0
> cpu           : POWER9P, altivec supported
> clock         : 2633.000000MHz
> revision      : 1.0 (pvr 004f 1100)
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
>                               min =3D pvr & 0xFF;
>                               break;
>                       case 0x004e: /* POWER9 bits 12-15 give chip type */
> +                     case 0x004f: /* POWER9P bits 12-15 give chip type *=
/
>                               maj =3D (pvr >> 8) & 0x0F;
>                               min =3D pvr & 0xFF;
>                               break;

Seems fine to me.

FWIW:
Reviwed-by: Leonardo Bras <leonardo@linux.ibm.com>

--=-UP+1jzEu/NkEzMtjJF/9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMdeUgIzgjf6YmUyOlQYWtz9SttQFAl5HjlIACgkQlQYWtz9S
ttT36BAAzoVg6TWdq66mJbbzu+e1Jtgd6Uyc/+45ovk6sNVGeATh5p3I+pAI4mXO
XcwEstxJCoTOeogIgvXKEIrEYZ0yzg/aiZoR0sOkwvnWOSdkJ+bjrPo3bwO7x8qi
5Mj/fT0Edrl0UrSxPXbvMwe5CM7pWpSZQQjKHhuOsSZE0veppuDYxpcC4HbeG2U0
we/WfWbs6MGUiSRd9CHhX1tzMhnjvhXOay7m00/dM01P57pvgZA2z+Q7s/PmEqpc
7WgUJRwmg2zyK3Zav/AuKrv4jTAM7wcE1wKA6vCneYcfPEio0YM8mcGr4PgH0E3z
bd9ow1qzRm0QWNMeEWqs2s4jfXOFhSjZQGjNChBsJ7k5UcLy314bwIxPK2PykJrM
spVSWZZBMDRLKygGYhfJbBma9aoExh1gNDa9oRJzWm1dDzO/56lW+RRya6TjEBYr
fGHORdvGHgQvYsaF1bGW67v5Bhs3/+pSJqJIYPdRJv9fMM3CVO1hW9m/5a9IyLhs
m0Iz2onHZXO6KXc/2E2el53ZFf4B0O76HgwOAZqG17dN7gi7kFvOTfiZzhhqFQru
fZep33RqKmWS8w0pMe5FJLs9pfCIzKbdPwp9FbgBHmxzjWInuhbvV+Li/nlFeKGi
PcfQmd9gRMAbdW7QU0LrgAp6JMYp+IPLf4OHpRrD33NKZp3xisU=
=gv6B
-----END PGP SIGNATURE-----

--=-UP+1jzEu/NkEzMtjJF/9--

