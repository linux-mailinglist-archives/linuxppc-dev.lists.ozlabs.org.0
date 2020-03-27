Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B2F195A81
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 17:00:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48pmlL4MptzDqKT
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Mar 2020 02:59:58 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48pmjG6FfhzDrD1
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Mar 2020 02:58:10 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02RFXFct015771; Fri, 27 Mar 2020 11:57:51 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ywf0sb78q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Mar 2020 11:57:50 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 02RFveYe030502;
 Fri, 27 Mar 2020 11:57:40 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ywf0sb5um-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Mar 2020 11:57:40 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 02RFk6A8001596;
 Fri, 27 Mar 2020 15:52:12 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma02wdc.us.ibm.com with ESMTP id 2ywawkkbrq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Mar 2020 15:52:12 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02RFqBPl49742292
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Mar 2020 15:52:11 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8659CAC05E;
 Fri, 27 Mar 2020 15:52:11 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BC13EAC05F;
 Fri, 27 Mar 2020 15:52:04 +0000 (GMT)
Received: from LeoBras (unknown [9.85.230.141])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 27 Mar 2020 15:52:03 +0000 (GMT)
Message-ID: <56965ad674071181548d5ed4fb7c8fa08061b591.camel@linux.ibm.com>
Subject: Re: [PATCH 1/1] ppc/crash: Skip spinlocks during crash
From: Leonardo Bras <leonardo@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@c-s.fr>, Peter Zijlstra
 <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon
 <will@kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul
 Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Enrico
 Weigelt <info@metux.net>, Allison Randal <allison@lohutok.net>, Thomas
 Gleixner <tglx@linutronix.de>
Date: Fri, 27 Mar 2020 12:51:55 -0300
In-Reply-To: <af505ef0-e0df-e0aa-bb83-3ed99841f151@c-s.fr>
References: <20200326222836.501404-1-leonardo@linux.ibm.com>
 <af505ef0-e0df-e0aa-bb83-3ed99841f151@c-s.fr>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-N8KxtCe2h0PkgV316JGh"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-27_05:2020-03-27,
 2020-03-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 impostorscore=0 malwarescore=0 mlxlogscore=999 spamscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=2 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003270141
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


--=-N8KxtCe2h0PkgV316JGh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Christophe, thanks for the feedback.

I noticed an error in this patch and sent a v2, that can be seen here:
http://patchwork.ozlabs.org/patch/1262468/

Comments inline::

On Fri, 2020-03-27 at 07:50 +0100, Christophe Leroy wrote:
> > @@ -142,6 +144,8 @@ static inline void arch_spin_lock(arch_spinlock_t *=
lock)
> >   		if (likely(__arch_spin_trylock(lock) =3D=3D 0))
> >   			break;
> >   		do {
> > +			if (unlikely(crash_skip_spinlock))
> > +				return;

Complete function for reference:
static inline void arch_spin_lock(arch_spinlock_t *lock)
{
	while (1) {
		if (likely(__arch_spin_trylock(lock) =3D=3D 0))
			break;
		do {
			if (unlikely(crash_skip_spinlock))
				return;
			HMT_low();
			if (is_shared_processor())
				splpar_spin_yield(lock);
		} while (unlikely(lock->slock !=3D 0));
		HMT_medium();
	}
}

> You are adding a test that reads a global var in the middle of a so hot=
=20
> path ? That must kill performance.=20

I thought it would, in worst case scenario, increase a maximum delay of
an arch_spin_lock() call 1 spin cycle. Here is what I thought:

- If the lock is already free, it would change nothing,=20
- Otherwise, the lock will wait.
- Waiting cycle just got bigger.
- Worst case scenario: running one more cycle, given lock->slock can
turn to 0 just after checking.

Could you please point where I failed to see the performance penalty?
(I need to get better at this :) )


> Can we do different ?

Sure, a less intrusive way of doing it would be to free the currently
needed locks before proceeding. I just thought it would be harder to
maintain.

> Christophe

Best regards,
Leonardo

--=-N8KxtCe2h0PkgV316JGh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMdeUgIzgjf6YmUyOlQYWtz9SttQFAl5+IRsACgkQlQYWtz9S
ttRYYg//fvDvt7w4iVd2lQCTzrUoA50Bf5B58kF9Hv+9VEW1V4BEOQpAzHVZHFjm
5qQwHnFnvOjvoCQhcGPKoPt39DHSDHmajf5XygqLve8OrQZwEzOaUazV8q1ZNQGN
jpX7WBR5qlnmZshJkPcf8UtYDAOCdhHgn6rEN8W4L7bUpGP8pWXDiqB9WPmaE2Yx
/qjdvmzLcLjKsB2GUrFKBTgFBdM0yFJSERnBZ7Er0zRrLWeKBKSvRAyrrbuKHX+0
tMsH5wD/Q0hEll8E/Bc47ggDnZ2Sa62mBNsl1M4U+Sj3BMitD9PONcaY8imHxnB7
xJvjw1ja5rFO2ELMNASOVAXKnOzbHYdSjNxxqsHwmmzrU7gr//UBRiVAn00CYScI
ninm9FtUJqYwhxm1CjGc86vQ14CzNQ+a1RTdAjCe6Cl75PMuLYthGeLUPigNKWm2
q7qXCl2xdqs6MAWByWBoAkAt5ZtVMtuEt3R77pAPPFFSgg8fIZeyhMGeqIYXeCR+
fGufYRvnf4rAspYonFGdKtLdjcYpsSETZ5+ZUk3L1YmunbgYImvNM5uRg6WzwIGl
uXlqDA/iqyfk2kABmpNOWSk9gcR/hHJkn+kGjTDl3ajM7qdvyqxR/H7sh0oQifpw
UR+DiiNuKgQJJcM3KnPYSS3V76uk52I7mzy/MbhTXIHj2P2dBoU=
=fUTE
-----END PGP SIGNATURE-----

--=-N8KxtCe2h0PkgV316JGh--

