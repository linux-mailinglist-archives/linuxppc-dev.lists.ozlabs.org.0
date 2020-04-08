Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C64A11A283A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Apr 2020 20:03:37 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48yBwP0h5WzDr5Z
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Apr 2020 04:03:33 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48yBsz6zCGzDqfs
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Apr 2020 04:01:27 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 038HXC6Z075944; Wed, 8 Apr 2020 14:01:09 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 309210cugm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Apr 2020 14:01:08 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 038HnJg0123775;
 Wed, 8 Apr 2020 14:01:08 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 309210cug7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Apr 2020 14:01:08 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 038I17Fo005697;
 Wed, 8 Apr 2020 18:01:07 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma04wdc.us.ibm.com with ESMTP id 3091mdxxva-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Apr 2020 18:01:07 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 038I17E052756932
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 Apr 2020 18:01:07 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4A011AC065;
 Wed,  8 Apr 2020 18:01:07 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A00ADAC05B;
 Wed,  8 Apr 2020 18:00:56 +0000 (GMT)
Received: from LeoBras (unknown [9.85.164.111])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  8 Apr 2020 18:00:55 +0000 (GMT)
Message-ID: <08fd515f1e0925a9d640dffd6a97c3ddbcd0cf18.camel@linux.ibm.com>
Subject: Re: [PATCH v3 1/1] ppc/crash: Reset spinlocks during crash
From: Leonardo Bras <leonardo@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Alexios Zavras <alexios.zavras@intel.com>, Benjamin
 Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@c-s.fr>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Enrico Weigelt <info@metux.net>, Paul Mackerras <paulus@samba.org>,
 peterz@infradead.org, Thomas Gleixner <tglx@linutronix.de>
Date: Wed, 08 Apr 2020 15:00:33 -0300
In-Reply-To: <87v9majhh2.fsf@mpe.ellerman.id.au>
References: <20200401000020.590447-1-leonardo@linux.ibm.com>
 <871rp6t9di.fsf@mpe.ellerman.id.au>
 <02e74be19534ab1db2f16a0c89ecb164e380c12a.camel@linux.ibm.com>
 <1585895551.7o9oa0ey62.astroid@bobo.none>
 <fb98f346a4d6a9d689ae64dae33cbd45d2f8b0df.camel@linux.ibm.com>
 <87v9majhh2.fsf@mpe.ellerman.id.au>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-dPAT5Uf265gBn5bk+UIE"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-07_10:2020-04-07,
 2020-04-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0
 mlxscore=0 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004080129
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


--=-dPAT5Uf265gBn5bk+UIE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2020-04-08 at 22:21 +1000, Michael Ellerman wrote:
> We should be able to just allocate the rtas_args on the stack, it's only
> ~80 odd bytes. And then we can use rtas_call_unlocked() which doesn't
> take the global lock.

At this point, would it be a problem using kmalloc?=20

Best regards,

--=-dPAT5Uf265gBn5bk+UIE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMdeUgIzgjf6YmUyOlQYWtz9SttQFAl6OEUEACgkQlQYWtz9S
ttRQYBAAjA9TrNO0aSybcGBUbLI3D/xxV/K5oX2uvgUE80/JxGaCtDT09vhBmu1L
zf0fNtV1m6+DtbMQWeXeAexvSR5Roz1QCkYW8HEndnoavaDHn5InmBPi1iLXe3h0
1ANo9fyO0HhwNUI9I42OnnH/cKrIRsvtLHxLvLkT2oM4kFlOzfR981dR1ACDVR6M
FAo1e0Dt85utw+yVvJFfWfY/Ys9H7eTrtowSRqW6GrZ2nKuWW8sgxGPuuuSv84Tn
KDjMAEqaSw/JR5QEQkMfK8FzFy7h+ra8uhoA+Uasjz6tX4H142baUqjdj0n/hfXC
KrJ+FuU+AHzmKoUsgP2zeT29F2Zu6ZsmjcctKSvcsHT3/hCrzp2iha0EyV1+A+oF
v1s7JBEGu1smnq/6Cilw6+MLS7uktbjZQSvWbCuk+Brt9UX8dxVbPSdy3jVeao51
Dfds2Bz66ECsPZ56OCDmfUmpsQFmFhjCBL/O7BDI5yqf65b1R2KMUp2ozJUfGTIv
Q8QdzdsY1RE9ED0Rcr4+zOiQWQLXwLcarsrF1DIuD58Bml8+8HpF07I9PHhs/QFh
VN7wgWQh23m1sVjiMGRdMt4ofR8ZBcUCV+iP2RQewrKWFU4bPoJvai2g9YwlMPZE
T4UXnRfKeuNxqktKeA02LZBTMPumazdoe/jdUy5v/clZtdC6KCM=
=2bkq
-----END PGP SIGNATURE-----

--=-dPAT5Uf265gBn5bk+UIE--

