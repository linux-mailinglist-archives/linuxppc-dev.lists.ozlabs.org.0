Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7671A2C12
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Apr 2020 00:57:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48yKRw6K2kzDr4r
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Apr 2020 08:57:48 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48yKPt3YfkzDqfJ
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Apr 2020 08:56:02 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 038MZ1Gw088883; Wed, 8 Apr 2020 18:55:41 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 309mdtcfju-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Apr 2020 18:55:41 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 038MbX6U099422;
 Wed, 8 Apr 2020 18:55:41 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 309mdtcfjq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Apr 2020 18:55:41 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 038MqWQr026954;
 Wed, 8 Apr 2020 22:55:40 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma02dal.us.ibm.com with ESMTP id 3091mdts86-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Apr 2020 22:55:40 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 038MtdZh29884876
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 Apr 2020 22:55:39 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DAE3D112062;
 Wed,  8 Apr 2020 22:55:39 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A3268112061;
 Wed,  8 Apr 2020 22:55:29 +0000 (GMT)
Received: from LeoBras (unknown [9.85.164.111])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  8 Apr 2020 22:55:29 +0000 (GMT)
Message-ID: <49614a1c3fba382d2a7bca0574015438dd50b843.camel@linux.ibm.com>
Subject: Re: [PATCH v3 1/1] ppc/crash: Reset spinlocks during crash
From: Leonardo Bras <leonardo@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Alexios Zavras <alexios.zavras@intel.com>, Benjamin
 Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@c-s.fr>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Enrico Weigelt <info@metux.net>, Paul Mackerras <paulus@samba.org>,
 peterz@infradead.org, Thomas Gleixner <tglx@linutronix.de>
Date: Wed, 08 Apr 2020 19:55:19 -0300
In-Reply-To: <87v9majhh2.fsf@mpe.ellerman.id.au>
References: <20200401000020.590447-1-leonardo@linux.ibm.com>
 <871rp6t9di.fsf@mpe.ellerman.id.au>
 <02e74be19534ab1db2f16a0c89ecb164e380c12a.camel@linux.ibm.com>
 <1585895551.7o9oa0ey62.astroid@bobo.none>
 <fb98f346a4d6a9d689ae64dae33cbd45d2f8b0df.camel@linux.ibm.com>
 <87v9majhh2.fsf@mpe.ellerman.id.au>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-rW4zuZR8MtcT2HNBtaaN"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-08_09:2020-04-07,
 2020-04-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=957
 clxscore=1015 mlxscore=0 impostorscore=0 adultscore=0 phishscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004080152
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


--=-rW4zuZR8MtcT2HNBtaaN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2020-04-08 at 22:21 +1000, Michael Ellerman wrote:
[...]
> > According with LoPAR, for both of these rtas-calls, we have:
> >=20
> > For the PowerPC External Interrupt option: The call must be reentrant
> > to the number of processors on the platform.
> > For the PowerPC External Interrupt option: The argument call buffer for
> > each simultaneous call must be physically unique.
>=20
> Oh well spotted. Where is that in the doc?
>=20
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

Hello Michael,

I did the simplest possible version of this change:
http://patchwork.ozlabs.org/patch/1268371/

Where I create a rtas_call_reentrant(), and replace rtas_call() for
that in all the possible calls of "ibm,int-on", "ibm,int-off",ibm,get-
xive" and  "ibm,set-xive".

At first, I was planning on creating a function that tells if the
requested token is one of above, before automatically choosing between
the common and reentrant versions. But it seemed like unnecessary
overhead, since the current calls are very few and very straight.=20

What do you think on this?

Best regards,
Leonardo Bras

--=-rW4zuZR8MtcT2HNBtaaN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMdeUgIzgjf6YmUyOlQYWtz9SttQFAl6OVlcACgkQlQYWtz9S
ttTSNxAA2WHqbEvJ/q09rkldKj1jNwGATvtXn1UHGLMxi6baM0un8mwQGGA9rRk2
mYCS9d5t6SUFax/0dOd3k4jMZJL9EYLvArqakuNgt+HINbholuBjDR6hRMHSOOxq
YfIw0UQgsRlpIqM4qAUEr6c117sArf+PMMIKUSsN80JlVuQPMqZbGboBS9P70bjA
26tjVVBWBE1D05+QXrW3nh/bMgCoJ/wPujv8cFhrFEtlnxvQiA2kesnlSKn/Ijx/
Ne5xRD+erktHo88YXQ306BFBR4aCKE1pdcgtA5R+IaR5LPxAb0duqHbbKjBstAtc
J2hTn74nURuRvQAZ+T5G2dVFtu/9yJwwh1p0zQU1G04m6emyn5w4e5JKc00Kk6jC
vsYlt51nH2RJiKomGCw9GVwtEx9gU52dYaAKVzT5rvqUlRjPu/diDdF24mQ74zUd
+8oOMfbdnbU84CkXfD4LMe0RPJURgDuHdSOteos1ycYwL6kAKZb1CGiE/uJqWyPn
tnUReM4W+RWgQb4BjMRjhoYZciw5j/Vhim9s22G3tZGhOA4tYu2x/5UYWKgjg1zl
UtAbKTbM2U/bmD/+RzEQA5ZbWvR+qkeLsCd2MNFfFs8ZRkUQlIzumXWOoPhLxh1C
nJ3ePZ65jEvdW0EXxpSwV4NwyRbxMOEEiHYvLuEgerU2wLbbR7E=
=y/4S
-----END PGP SIGNATURE-----

--=-rW4zuZR8MtcT2HNBtaaN--

