Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EA1161465
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2020 15:17:40 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48LmKF3mzPzDqfy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2020 01:17:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48LmBj3FFVzDqjb
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2020 01:11:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 48LmBh02HQz8sxV
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2020 01:11:56 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 48LmBg4pXmz9sRl; Tue, 18 Feb 2020 01:11:55 +1100 (AEDT)
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
 by ozlabs.org (Postfix) with ESMTPS id 48LmBc2gvNz9sRf;
 Tue, 18 Feb 2020 01:11:51 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01HE6waE038818; Mon, 17 Feb 2020 09:11:49 -0500
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y6d60nd8c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Feb 2020 09:11:48 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01HEA8Th020622;
 Mon, 17 Feb 2020 14:11:47 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma01wdc.us.ibm.com with ESMTP id 2y689627bw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Feb 2020 14:11:47 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01HEBk1O56230168
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Feb 2020 14:11:46 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A8AB278060;
 Mon, 17 Feb 2020 14:11:46 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C6C117805F;
 Mon, 17 Feb 2020 14:11:45 +0000 (GMT)
Received: from leobras.br.ibm.com (unknown [9.18.235.152])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 17 Feb 2020 14:11:45 +0000 (GMT)
Message-ID: <a06896549c6c0ca4c66dd6961626d48450c0d54b.camel@linux.ibm.com>
Subject: Re: [PATCH] powerpc: Fix /proc/cpuinfo revision for POWER9P processors
From: Leonardo Bras <leonardo@linux.ibm.com>
To: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>, linuxppc-dev
 <linuxppc-dev@ozlabs.org>
Date: Mon, 17 Feb 2020 11:11:44 -0300
In-Reply-To: <2f2e88ca614ea1fd37d347a189f89c8bfa6b1c9c.camel@linux.ibm.com>
References: <158161167949.29594.6467033073126346958.stgit@jupiter>
 <2f2e88ca614ea1fd37d347a189f89c8bfa6b1c9c.camel@linux.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-6azvr9P5JW84/Q+QuLdV"
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-17_08:2020-02-17,
 2020-02-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 mlxscore=0 suspectscore=0 adultscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
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
Cc: Michael Neuling <mikey@neuling.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--=-6azvr9P5JW84/Q+QuLdV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2020-02-15 at 03:23 -0300, Leonardo Bras wrote:
> Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com> writes:
>=20
> Hello Mahesh,
>=20
> > POWER9P PVR bits are same as that of POWER9. Hence mask off only the
> > relevant bits for the major revision similar to POWER9.
> >=20
> > Without this patch the cpuinfo output shows 17.0 as revision:
> >=20
> > $ cat /proc/cpuinfo
> > processor     : 0
> > cpu           : POWER9P, altivec supported
> > clock         : 2950.000000MHz
> > revision      : 17.0 (pvr 004f 1100)
> >=20
> > With this change it reflects the correct revision:
> >=20
> > $ cat /proc/cpuinfo
> > processor     : 0
> > cpu           : POWER9P, altivec supported
> > clock         : 2633.000000MHz
> > revision      : 1.0 (pvr 004f 1100)
> >=20
> > Signed-off-by: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>
> > ---
> >  arch/powerpc/kernel/setup-common.c |    1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/s=
etup-common.c
> > index 488f1eecc0de..37342ec42cb3 100644
> > --- a/arch/powerpc/kernel/setup-common.c
> > +++ b/arch/powerpc/kernel/setup-common.c
> > @@ -315,6 +315,7 @@ static int show_cpuinfo(struct seq_file *m, void *v=
)
> >                               min =3D pvr & 0xFF;
> >                               break;
> >                       case 0x004e: /* POWER9 bits 12-15 give chip type =
*/
> > +                     case 0x004f: /* POWER9P bits 12-15 give chip type=
 */
> >                               maj =3D (pvr >> 8) & 0x0F;
> >                               min =3D pvr & 0xFF;
> >                               break;
>=20
> Seems fine to me.
>=20
> FWIW:
> Reviwed-by: Leonardo Bras <leonardo@linux.ibm.com>

Sorry, typo.
Reviewed-by: Leonardo Bras <leonardo@linux.ibm.com>

--=-6azvr9P5JW84/Q+QuLdV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMdeUgIzgjf6YmUyOlQYWtz9SttQFAl5KnyAACgkQlQYWtz9S
ttRhHBAAzGl7rG+Kj8Y8wHqfecODyEoc6w5qiRx74B6b0/6VKUhCKSfCYuyjKdNc
DeGtykHwpjQI82pGUktuU6v0UMHCO7iN+hBh/pZUBPIYmxwzhKGJs0Lt5fky+V2+
CtP9Y3m22TNPVojvnOgFSw4jeuCyuV2YKo7Sw8ZJ1uQiOge/VEfMOHpUMol/ZSof
x/v1Q6PcF7d2HZ+88Wb/8AY1IGfFCCe16UCdaN0AE5B2o5reKwgVCcsaflyJcE+H
1kK0THPz2vSlqVqB55t8DHzTj7OMX/YFMH6SdjCETThanaLFPWwBl87/vrLjpbTk
RZHpS4Sd+HQPSYg8yHUi9zwMcNIWPIwziSC2TgtxHrHdlSQBP8XVnByUYvvqcmM7
oE0VVfaCK3dAuqm2+F+qAvSQpZsKbS2c0u+GyCnFbLrK2T9ctkRpxouNgTO/5Nxv
LmBUIALObhM9j8VghxxVgS4NFh+Qn0mVxh3c9RUaAQNUDwo8b+8Yw9t7CRPfofIJ
4ehxKDoASPaAhhWTuJa0Qq0wwKk1667HKRl+Vwb9JcWmc2cIAL3fdpi5YITrapeS
GlFKsab+MVsrg+xtJS2SHSM7VZaMMNIgLabawUfZJFAsZay/1KIXYVI8cNxWCAUj
LQk78yh/0x9syWK37WfPODlvgQysWXe96hBq/BsppPMTyu2faQA=
=Suve
-----END PGP SIGNATURE-----

--=-6azvr9P5JW84/Q+QuLdV--

