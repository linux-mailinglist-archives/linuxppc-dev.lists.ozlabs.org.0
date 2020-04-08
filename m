Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 812A41A2785
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Apr 2020 18:51:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48y9KD51hvzDqc2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Apr 2020 02:51:28 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48y9GN2h2XzDqR1
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Apr 2020 02:49:00 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 038GYYJW176033; Wed, 8 Apr 2020 12:48:42 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30920rrens-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Apr 2020 12:48:42 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 038GYnHx176784;
 Wed, 8 Apr 2020 12:48:41 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30920rrenk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Apr 2020 12:48:41 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 038GeZla021524;
 Wed, 8 Apr 2020 16:48:40 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma02wdc.us.ibm.com with ESMTP id 3091mdxhd4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Apr 2020 16:48:40 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 038GmdCZ55837174
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 Apr 2020 16:48:39 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D44B17805C;
 Wed,  8 Apr 2020 16:48:39 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 181FA7805E;
 Wed,  8 Apr 2020 16:48:29 +0000 (GMT)
Received: from LeoBras (unknown [9.85.164.111])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  8 Apr 2020 16:48:29 +0000 (GMT)
Message-ID: <c9c8f4d31a21ba20d030fc197e9c5d6778553521.camel@linux.ibm.com>
Subject: Re: [PATCH v3 1/1] ppc/crash: Reset spinlocks during crash
From: Leonardo Bras <leonardo@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Alexios Zavras <alexios.zavras@intel.com>, Benjamin
 Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@c-s.fr>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Enrico Weigelt <info@metux.net>, Paul Mackerras <paulus@samba.org>,
 peterz@infradead.org, Thomas Gleixner <tglx@linutronix.de>
Date: Wed, 08 Apr 2020 13:48:21 -0300
In-Reply-To: <87v9majhh2.fsf@mpe.ellerman.id.au>
References: <20200401000020.590447-1-leonardo@linux.ibm.com>
 <871rp6t9di.fsf@mpe.ellerman.id.au>
 <02e74be19534ab1db2f16a0c89ecb164e380c12a.camel@linux.ibm.com>
 <1585895551.7o9oa0ey62.astroid@bobo.none>
 <fb98f346a4d6a9d689ae64dae33cbd45d2f8b0df.camel@linux.ibm.com>
 <87v9majhh2.fsf@mpe.ellerman.id.au>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-2xsxWow0iUbl6nYPXNaI"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-07_10:2020-04-07,
 2020-04-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 phishscore=0 mlxlogscore=939 adultscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004080125
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


--=-2xsxWow0iUbl6nYPXNaI
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2020-04-08 at 22:21 +1000, Michael Ellerman wrote:
[...]
> > On the other hand, busting the rtas.lock could be dangerous, because
> > it's code we can't control.
> >=20
> > According with LoPAR, for both of these rtas-calls, we have:
> >=20
> > For the PowerPC External Interrupt option: The call must be reentrant
> > to the number of processors on the platform.
> > For the PowerPC External Interrupt option: The argument call buffer for
> > each simultaneous call must be physically unique.
>=20
> Oh well spotted. Where is that in the doc?

In the current LoPAR available on OpenPower Foundation, it's on page
170, '7.3.10.2 ibm,set-xive' and '7.3.10.3 ibm,int-off'.

> > Which I think means this rtas-calls can be done simultaneously.
>=20
> I think so too. I'll read PAPR in the morning and make sure.
>=20
> > Would it mean that busting the rtas.lock for these calls would be safe?
>=20
> What would be better is to make those specific calls not take the global
> RTAS lock to begin with.
>=20
> We should be able to just allocate the rtas_args on the stack, it's only
> ~80 odd bytes. And then we can use rtas_call_unlocked() which doesn't
> take the global lock.

Good idea. I will try getting some work done on this.

Best regards,

--=-2xsxWow0iUbl6nYPXNaI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMdeUgIzgjf6YmUyOlQYWtz9SttQFAl6OAFUACgkQlQYWtz9S
ttTHMA//cVNN4TkaS/RG4cF8+zMGbjZkJJVQ4U1PJgiEBcETqk8W6qF5YbAMopj2
RRdQjGnxAlKBheTyTgy1uDVl38bniciIstfwVFOBsdwp43lGfWWVj9XuMrtZD/d+
gS8fJVjEgBrfR5GG/fQvyMUwZVWkZCTFTLnUDb6uAkcT25LC0qBx/j6gybZ2zsHr
M3OYkmc8xUKSbj89ZdPtvHjRzrLvxi2LvOMTRC8yBfYgP6EEhzOJymAxdaY5zwP2
p81SBoWOLAThctMStJu6YZ8xrszkbRW7G7FIRE3DXdLOYGhm8hLF+Zc7xe5Npg30
1IjejGie/7tevB2kTEOjgHugHKGSKnRBkn1BUPhyQdu8xSr02Uy78KlwRxQTzn2Y
R1cWVHtn676LPYG3yZO0fpdyANWeUeOQgGu2R/zV6K9Ou/rmJ+yKvgxm7telw4aU
ENvEF8PeLpK1cTGmS2PY8dJwW/fnX6otFXu0dgvTYLCoIoQruywUnJlL+xQRKmbi
YS7nQTpPRUDM07SKS3zQFL/N1eiBZkjMNdlu539zcZ9kWCjcUWnHCM/M2l77gYTw
/v14vY0ADSTQxCa4PO1mTHsK3gRLagdJtntrC3HO5DbgF68/OrzLbIx6s5+5h4+f
ZMG1lzZlJ6ANGRfke0yhw3RJsvfAIJQNdvlgeI5M4mvbYXVuFUY=
=pR/4
-----END PGP SIGNATURE-----

--=-2xsxWow0iUbl6nYPXNaI--

