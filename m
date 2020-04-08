Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4251A1A0B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Apr 2020 04:42:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48xpTK0BV4zDqn2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Apr 2020 12:42:13 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48xpN93RDbzDqnr
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Apr 2020 12:37:44 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0382YAxR042258; Tue, 7 Apr 2020 22:37:22 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 309201n2ud-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Apr 2020 22:37:22 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0382bMcD047469;
 Tue, 7 Apr 2020 22:37:22 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 309201n2u8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Apr 2020 22:37:22 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 0382af23020544;
 Wed, 8 Apr 2020 02:37:21 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma02dal.us.ibm.com with ESMTP id 3091mdj354-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Apr 2020 02:37:21 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0382bKu952036004
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 Apr 2020 02:37:20 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8EA59AE062;
 Wed,  8 Apr 2020 02:37:20 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BBEE4AE05C;
 Wed,  8 Apr 2020 02:37:12 +0000 (GMT)
Received: from LeoBras (unknown [9.85.168.225])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  8 Apr 2020 02:37:12 +0000 (GMT)
Message-ID: <fb98f346a4d6a9d689ae64dae33cbd45d2f8b0df.camel@linux.ibm.com>
Subject: Re: [PATCH v3 1/1] ppc/crash: Reset spinlocks during crash
From: Leonardo Bras <leonardo@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, Alexios Zavras
 <alexios.zavras@intel.com>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Christophe Leroy <christophe.leroy@c-s.fr>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Enrico Weigelt
 <info@metux.net>, Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras
 <paulus@samba.org>, peterz@infradead.org, Thomas Gleixner
 <tglx@linutronix.de>
Date: Tue, 07 Apr 2020 23:36:57 -0300
In-Reply-To: <1585895551.7o9oa0ey62.astroid@bobo.none>
References: <20200401000020.590447-1-leonardo@linux.ibm.com>
 <871rp6t9di.fsf@mpe.ellerman.id.au>
 <02e74be19534ab1db2f16a0c89ecb164e380c12a.camel@linux.ibm.com>
 <1585895551.7o9oa0ey62.astroid@bobo.none>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-8CLaLDVIR4ySyvxYU+c9"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-07_10:2020-04-07,
 2020-04-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 phishscore=0 impostorscore=0 adultscore=0 mlxlogscore=999 spamscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004080012
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


--=-8CLaLDVIR4ySyvxYU+c9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Nick, Michael,

On Fri, 2020-04-03 at 16:41 +1000, Nicholas Piggin wrote:
[...]
> > > PAPR says we are not allowed to have multiple CPUs calling RTAS at on=
ce,
> > > except for a very small list of RTAS calls. So if we bust the RTAS lo=
ck
> > > there's a risk we violate that part of PAPR and crash even harder.
> >=20
> > Interesting, I was not aware.
> >=20
> > > Also it's not specific to kdump, we can't even get through a normal
> > > reboot if we crash with the RTAS lock held.
> > >=20
> > > Anyway here's a patch with some ideas. That allows me to get from a
> > > crash with the RTAS lock held through kdump into the 2nd kernel. But =
it
> > > only works if it's the crashing CPU that holds the RTAS lock.
> > >=20
> >=20
> > Nice idea.=20
> > But my test environment is just triggering a crash from sysrq, so I
> > think it would not improve the result, given that this thread is
> > probably not holding the lock by the time.
>=20
> Crash paths should not take that RTAS lock, it's a massive pain. I'm=20
> fixing it for machine check, for other crashes I think it can be removed=
=20
> too, it just needs to be unpicked. The good thing with crashing is that=
=20
> you can reasonably *know* that you're single threaded, so you can=20
> usually reason through situations like above.
>=20
> > I noticed that when rtas is locked, irqs and preemption are also
> > disabled.
> >=20
> > Should the IPI send by crash be able to interrupt a thread with
> > disabled irqs?
>=20
> Yes. It's been a bit painful, but in the long term it means that a CPU=
=20
> which hangs with interrupts off can be debugged, and it means we can=20
> take it offline to crash without risking that it will be clobbering what=
=20
> we're doing.
>=20
> Arguably what I should have done is try a regular IPI first, wait a few=
=20
> seconds, then NMI IPI.
>=20
> A couple of problems with that. Firstly it probably avoids this issue=20
> you hit almost all the time, so it won't get fixed. So when we really=20
> need the NMI IPI in the field, it'll still be riddled with deadlocks.
>=20
> Secondly, sending the IPI first in theory can be more intrusive to the=
=20
> state that we want to debug. It uses the currently running stack, paca=
=20
> save areas, ec. NMI IPI uses its own stack and save regions so it's a=20
> little more isolated. Maybe this is only a small advantage but I'd like=
=20
> to have it if we can. =20
>=20
> Thanks,
> Nick


I think the printk issue is solved (sent a patch on that), now what is
missing is the rtas call spinlock.

I noticed that rtas.lock is taken on machine_kexec_mask_interrupts(),
which happen after crashing the other threads and getting into
realmode.=20

The following rtas are called each IRQ with valid interrupt descriptor:
ibm,int-off : Reset mask bit for that interrupt
ibm,set_xive : Set XIVE priority to 0xff

By what I could understand, these rtas calls happen to put the next
kexec kernel (kdump kernel) in a safer environment, so I think it's not
safe to just remove them.
=20
(See commit d6c1a9081080c6c4658acf2a06d851feb2855933)

On the other hand, busting the rtas.lock could be dangerous, because
it's code we can't control.

According with LoPAR, for both of these rtas-calls, we have:

For the PowerPC External Interrupt option: The call must be reentrant
to the number of processors on the platform.
For the PowerPC External Interrupt option: The argument call buffer for
each simultaneous call must be physically unique.

Which I think means this rtas-calls can be done simultaneously.
Would it mean that busting the rtas.lock for these calls would be safe?

Best regards,
Leonardo Bras

--=-8CLaLDVIR4ySyvxYU+c9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMdeUgIzgjf6YmUyOlQYWtz9SttQFAl6NOMkACgkQlQYWtz9S
ttRkZw/9EZ+Gm3z4pn3SnktToXv35yU/1QPM2eStiSIWe3s9AK/IKNyj7gqAVB75
Lbgfb3AVul/aX9QXQvJDUH0NnjQcHcEz0qbps27nS+6uZ72XO7IlhwoXLVVSJo9/
x5EBUaH1SVzL02HWMaLDauI242HJIJzTEXil2QGoIatALldD9OlH39b3FgBmVTco
eQp6f/T34lG3ooLKL9fY7Cg3jslB/542/RN8GyYraBH3h1+UPFb5Klv7Dok/78Xz
HpJLXB511hba5pg/0zxuU3NLQ8NxxY6wgBskw/zU1BF79wig5rIRdHIylPIj3QKV
XC2aJoG3KC6Z6U2eGDfGwogshKMDyEGQ7dfNPKfiBYZWbmBwlgQprbER1iJruYAs
xqll9RrwVQYv/xGgDo/baSdd8195gxgJmv5k6IockSF3wLRhFszE6PhHHR4Sp1w9
CIwYrvLrCT+/KtvsRalDoFJYzBuc1GzM637sQFZvGCsYRD+UpV8EOagjzHqDRMYy
LAabKnEa+k6jA/PbGtHNOiJsavuaKCG59F3XKnj+0SUCdmR+g4Vsy+e+BuoqVY5d
dMvEE6BCTUDG5UVfTpusEierwRxcn8M57PjZWuL+qtFRREh+9QUSo814NS/lFgQi
tJ7PjcqW4+T7kzuQnMoFNLu2QucihFW/jgDSQVPRHtVauS3zXtc=
=iT2X
-----END PGP SIGNATURE-----

--=-8CLaLDVIR4ySyvxYU+c9--

