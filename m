Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8A6197E8D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 16:36:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48rZly23sjzDqjX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 01:36:46 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48rZhx54YRzDqjd
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar 2020 01:34:09 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02UEXoKl132301; Mon, 30 Mar 2020 10:33:52 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3020wcpua5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Mar 2020 10:33:52 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 02UEXpYi132364;
 Mon, 30 Mar 2020 10:33:51 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3020wcpu4d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Mar 2020 10:33:50 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 02UEW3aU031502;
 Mon, 30 Mar 2020 14:33:34 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma05wdc.us.ibm.com with ESMTP id 301x76hcp2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Mar 2020 14:33:34 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02UEXXON55312802
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 30 Mar 2020 14:33:33 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 979FEAC059;
 Mon, 30 Mar 2020 14:33:33 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F0F64AC05B;
 Mon, 30 Mar 2020 14:33:24 +0000 (GMT)
Received: from LeoBras (unknown [9.85.228.254])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 30 Mar 2020 14:33:24 +0000 (GMT)
Message-ID: <e1d8c41bb5d4f4a66be4edc8e2c80534f4abe2b4.camel@linux.ibm.com>
Subject: Re: [PATCH 1/1] ppc/crash: Skip spinlocks during crash
From: Leonardo Bras <leonardo@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@c-s.fr>, Peter Zijlstra
 <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon
 <will@kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul
 Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Enrico
 Weigelt <info@metux.net>, Allison Randal <allison@lohutok.net>, Thomas
 Gleixner <tglx@linutronix.de>
Date: Mon, 30 Mar 2020 11:33:15 -0300
In-Reply-To: <4759f5e9-24a6-7710-86a0-c8e45f5decb7@c-s.fr>
References: <20200326222836.501404-1-leonardo@linux.ibm.com>
 <af505ef0-e0df-e0aa-bb83-3ed99841f151@c-s.fr>
 <56965ad674071181548d5ed4fb7c8fa08061b591.camel@linux.ibm.com>
 <4759f5e9-24a6-7710-86a0-c8e45f5decb7@c-s.fr>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-C+Q7ijJHxQd1AYsB9q38"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-30_01:2020-03-30,
 2020-03-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 mlxlogscore=999
 adultscore=0 suspectscore=2 bulkscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003300134
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


--=-C+Q7ijJHxQd1AYsB9q38
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Christophe,

On Sat, 2020-03-28 at 10:19 +0000, Christophe Leroy wrote:
> Hi Leonardo,
>=20
>=20
> > On 03/27/2020 03:51 PM, Leonardo Bras wrote:
> > >=20
> > [SNIP]
> > - If the lock is already free, it would change nothing,
> > - Otherwise, the lock will wait.
> > - Waiting cycle just got bigger.
> > - Worst case scenario: running one more cycle, given lock->slock can
> > turn to 0 just after checking.Could you please point where I failed to =
see the performance penalty?
> > (I need to get better at this :) )
>=20
> You are right that when the lock is free, it changes nothing. However=20
> when it is not, it is not just one cycle.

Sorry, what I meant here is one "waiting cycle", meaning that in WCS
there would be 1 extra iteration on that while. Or it would 'spin' one
more time.

>=20
> Here is arch_spin_lock() without your patch:
>=20
> 00000440 <my_lock>:
>   440:	39 40 00 01 	li      r10,1
>   444:	7d 20 18 28 	lwarx   r9,0,r3
>   448:	2c 09 00 00 	cmpwi   r9,0
>   44c:	40 82 00 10 	bne     45c <my_lock+0x1c>
>   450:	7d 40 19 2d 	stwcx.  r10,0,r3
>   454:	40 a2 ff f0 	bne     444 <my_lock+0x4>
>   458:	4c 00 01 2c 	isync
>   45c:	2f 89 00 00 	cmpwi   cr7,r9,0
>   460:	4d be 00 20 	bclr+   12,4*cr7+eq
>   464:	7c 21 0b 78 	mr      r1,r1
>   468:	81 23 00 00 	lwz     r9,0(r3)
>   46c:	2f 89 00 00 	cmpwi   cr7,r9,0
>   470:	40 be ff f4 	bne     cr7,464 <my_lock+0x24>
>   474:	7c 42 13 78 	mr      r2,r2
>   478:	7d 20 18 28 	lwarx   r9,0,r3
>   47c:	2c 09 00 00 	cmpwi   r9,0
>   480:	40 82 00 10 	bne     490 <my_lock+0x50>
>   484:	7d 40 19 2d 	stwcx.  r10,0,r3
>   488:	40 a2 ff f0 	bne     478 <my_lock+0x38>
>   48c:	4c 00 01 2c 	isync
>   490:	2f 89 00 00 	cmpwi   cr7,r9,0
>   494:	40 be ff d0 	bne     cr7,464 <my_lock+0x24>
>   498:	4e 80 00 20 	blr
>=20
> Here is arch_spin_lock() with your patch. I enclose with =3D=3D=3D what c=
omes=20
> in addition:
>=20
> 00000440 <my_lock>:
>   440:	39 40 00 01 	li      r10,1
>   444:	7d 20 18 28 	lwarx   r9,0,r3
>   448:	2c 09 00 00 	cmpwi   r9,0
>   44c:	40 82 00 10 	bne     45c <my_lock+0x1c>
>   450:	7d 40 19 2d 	stwcx.  r10,0,r3
>   454:	40 a2 ff f0 	bne     444 <my_lock+0x4>
>   458:	4c 00 01 2c 	isync
>   45c:	2f 89 00 00 	cmpwi   cr7,r9,0
>   460:	4d be 00 20 	bclr+   12,4*cr7+eq
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>   464:	3d 40 00 00 	lis     r10,0
> 			466: R_PPC_ADDR16_HA	crash_skip_spinlock
>   468:	39 4a 00 00 	addi    r10,r10,0
> 			46a: R_PPC_ADDR16_LO	crash_skip_spinlock
>   46c:	39 00 00 01 	li      r8,1
>   470:	89 2a 00 00 	lbz     r9,0(r10)
>   474:	2f 89 00 00 	cmpwi   cr7,r9,0
>   478:	4c 9e 00 20 	bnelr   cr7
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>   47c:	7c 21 0b 78 	mr      r1,r1
>   480:	81 23 00 00 	lwz     r9,0(r3)
>   484:	2f 89 00 00 	cmpwi   cr7,r9,0
>   488:	40 be ff f4 	bne     cr7,47c <my_lock+0x3c>
>   48c:	7c 42 13 78 	mr      r2,r2
>   490:	7d 20 18 28 	lwarx   r9,0,r3
>   494:	2c 09 00 00 	cmpwi   r9,0
>   498:	40 82 00 10 	bne     4a8 <my_lock+0x68>
>   49c:	7d 00 19 2d 	stwcx.  r8,0,r3
>   4a0:	40 a2 ff f0 	bne     490 <my_lock+0x50>
>   4a4:	4c 00 01 2c 	isync
>   4a8:	2f 89 00 00 	cmpwi   cr7,r9,0
>   4ac:	40 be ff c4 	bne     cr7,470 <my_lock+0x30>
>   4b0:	4e 80 00 20 	blr
>=20
>=20
> Christophe

I agree. When there is waiting, it will usually add some time to it.
Accounting that spinlocks are widely used, it will cause a slowdown in
the whole system.

Thanks for the feedback,
Best regards,

--=-C+Q7ijJHxQd1AYsB9q38
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMdeUgIzgjf6YmUyOlQYWtz9SttQFAl6CAysACgkQlQYWtz9S
ttRBfhAAp4/gTVPb17bMlgO70B7405SwimpQ9SVhvDfp86mRUHzoqk1nhSLVgD3U
rWAzt9xF01uuM9nZDXGGsEb56vUwmYtz01FNd5ijZXsyS2zu/Wnld8CvKvn9Y4oA
v+i554fXWHxxg5BKB1dqViF3ISdleh5Qi1QkAYhrbguF46KIFDAVNvzMW3nOg7Jm
M9Jou/n7ci/G3AVllzG8DtFEcBSxUW/u14+FUGQIXyT8VeU18hy28uTeh8jwsV24
7wlPvjZ+zkSTwU+85C79IYv2bVxEZwLdi59OcNPGGaGxWVQuSjheuURy3qsO1Hwi
c2BTgDd8Q2cUYGPl7Ax42+aVJAFnkeRkwBaM4ndEasMWUXNaP6X/g1allm9yZcyD
4eXCFvO71qUExwIEs44mjQmt9mdMcAdeyIApgy5FdqgMqp5d8abpc8TLaq6+mrSs
FFxzs7vEl8NGDSIaCwAF4Mgp8vKDScGuz37nA+P7RqbBPU0S1Ogaw8Vniz8T2uaB
OX1FibnFOw1US3rhUpgiARz7aeDZWUXNp4InFrwWuaT/0CueooMhja3A19xF9pBA
79+68WNH6QCDZCikm5GFwjyIQ90I+Kc+69yeK9CYMoqzqVgMHBtEgDDCkfTijkha
s1WNvXKtppKGto6Pidx0IW1heLZTLh1u9+UyLGEGMLHaS7BVv7Y=
=g7r1
-----END PGP SIGNATURE-----

--=-C+Q7ijJHxQd1AYsB9q38--

