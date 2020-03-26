Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 33466194B3A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Mar 2020 23:08:03 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48pJyS0GWXzDqRm
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 09:08:00 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48pJvf3znJzDqRN
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Mar 2020 09:05:34 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02QM4pYo003294; Thu, 26 Mar 2020 18:05:22 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 300jeununj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Mar 2020 18:05:22 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 02QM3AUC020255;
 Thu, 26 Mar 2020 22:05:21 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma02dal.us.ibm.com with ESMTP id 2ywaw2ra6v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Mar 2020 22:05:20 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02QM5KIb11076308
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Mar 2020 22:05:20 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 18E20AC311;
 Thu, 26 Mar 2020 22:05:20 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6BCBDAC2E7;
 Thu, 26 Mar 2020 22:05:11 +0000 (GMT)
Received: from LeoBras (unknown [9.85.162.45])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 26 Mar 2020 22:05:10 +0000 (GMT)
Message-ID: <f86aa1672b447bd09a214bc8682a70934dcee82f.camel@linux.ibm.com>
Subject: Re: [RFC PATCH 1/1] ppc/smp: Replace unnecessary 'while' by 'if'
From: Leonardo Bras <leonardo@linux.ibm.com>
To: Paul Mackerras <paulus@ozlabs.org>
Date: Thu, 26 Mar 2020 19:05:03 -0300
In-Reply-To: <20200326214005.GB9894@blackberry>
References: <20200326203752.497029-1-leonardo@linux.ibm.com>
 <20200326214005.GB9894@blackberry>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-GTdlyedGwk3mGYQKKQZt"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-26_13:2020-03-26,
 2020-03-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 adultscore=0 phishscore=0 suspectscore=0 mlxlogscore=838 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003260160
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
Cc: linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--=-GTdlyedGwk3mGYQKKQZt
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2020-03-27 at 08:40 +1100, Paul Mackerras wrote:
> On Thu, Mar 26, 2020 at 05:37:52PM -0300, Leonardo Bras wrote:
> > spin_until_cond() will wait until nmi_ipi_busy =3D=3D false, and
> > nmi_ipi_lock_start() does not seem to change nmi_ipi_busy, so there is
> > no way this while will ever repeat.
> >=20
> > Replace this 'while' by an 'if', so it does not look like it can repeat=
.
>=20
> Nack, it can repeat.  The scenario is that cpu A is in this code,
> inside spin_until_cond(); cpu B has previously set nmi_ipi_busy, and
> cpu C is also waiting for nmi_ipi_busy to be cleared, like cpu A.
> When cpu B clears nmi_ipi_busy, both cpu A and cpu C will see that and
> will race inside nmi_ipi_lock_start().  One of them, say cpu C, will
> take the lock and proceed to set nmi_ipi_busy and then call
> nmi_ipi_unlock().  Then the other cpu (cpu A) will then take the lock
> and return from nmi_ipi_lock_start() and find nmi_ipi_busy =3D=3D true.
> At that point it needs to go through the while loop body once more.
>=20
> Paul.

Ok, got it.

Thanks for explaining Paul!

--=-GTdlyedGwk3mGYQKKQZt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMdeUgIzgjf6YmUyOlQYWtz9SttQFAl59JxAACgkQlQYWtz9S
ttTSdRAAttveHAUp1FuyI8cjRY3YA64LGrCYQ/GJZfAZljGAMyg78+BO1orF0p7b
n+wYBDvQzqmLMgL5fUxeHG+CQzPX7unA/9n+rn7y4j+BVZbupjLHOnPXswoDda3Y
Ycs5eFcEJ2d5Fs0psXJs/aOVtF6cd8uKNzdpk0tVGM3VMkoB509DtJqdkjY96n1g
Oi7+eDKF+yUNIxmOjEeTaJwR9fSrzLRJhdnLLpOmR0/42QvOcGeh8q3p2qtCyfgo
H6qEXVCq5E1nYLGuvJskD46vaRRXGZ29myCPzFDTUpaP5JMH36sUw4Ei6UjNgz8x
DhXNqoqSKQ4/mP91fMXgfyBGER2l4f4dTn1fmkXRC6IAt49XIFzRTVHf7GxS3i2z
jHQQHrkWmCnFeRjzbGZDZUeNU/XmNMXKponwH7Q2KvPmtiaG9YDsPnB5cKGfFyKN
uOGH0fjq1yHDq3O4epERX+o+2qTxKcEUQOakkQ4chpJ6eC/EgM2KPEwadZdZ1BAf
DQM4nCzsPQP+zptJO+LjJqDjZ1JXBwoeJYfPJBfB8pAw8VgvIXcnXVfHwoSH7WGf
1JRmT583BLGzc3cqD89kyzZ2NbL+XEGNTWcEAEHzg6Nf+2t4AQQY3T7U4Cluj2Fl
cXrBonqlCQPiR7ShKkwkYgQ7ZuYeuV1JdKsDjVXy85WBnxcAugI=
=iE5j
-----END PGP SIGNATURE-----

--=-GTdlyedGwk3mGYQKKQZt--

