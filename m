Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 28734195DA1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 19:27:57 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48pr222gDnzDqJk
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Mar 2020 05:27:54 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48pqmD4z1yzDrF2
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Mar 2020 05:15:56 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02RI3hLe058444; Fri, 27 Mar 2020 14:15:31 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ywd8h6dpe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Mar 2020 14:15:31 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 02RI3lpg058972;
 Fri, 27 Mar 2020 14:15:30 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ywd8h6dp1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Mar 2020 14:15:30 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 02RI8m9o017564;
 Fri, 27 Mar 2020 18:15:29 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03wdc.us.ibm.com with ESMTP id 2ywawam74y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Mar 2020 18:15:29 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02RIFSHL13435178
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Mar 2020 18:15:28 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 30179BE054;
 Fri, 27 Mar 2020 18:15:28 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7DDCCBE051;
 Fri, 27 Mar 2020 18:15:18 +0000 (GMT)
Received: from LeoBras (unknown [9.85.230.141])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 27 Mar 2020 18:15:18 +0000 (GMT)
Message-ID: <f4447980747f4633ae720825128663bda0101188.camel@linux.ibm.com>
Subject: Re: [PATCH v2 1/1] ppc/crash: Skip spinlocks during crash
From: Leonardo Bras <leonardo@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Peter Zijlstra
 <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon
 <will@kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul
 Mackerras <paulus@samba.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Alexios
 Zavras <alexios.zavras@intel.com>, Christophe Leroy
 <christophe.leroy@c-s.fr>
Date: Fri, 27 Mar 2020 15:15:12 -0300
In-Reply-To: <87d08ywj61.fsf@mpe.ellerman.id.au>
References: <20200326232542.503157-1-leonardo@linux.ibm.com>
 <87d08ywj61.fsf@mpe.ellerman.id.au>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-txa6N3c5No/7zpOox/tI"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-27_06:2020-03-27,
 2020-03-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=999 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2003270152
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


--=-txa6N3c5No/7zpOox/tI
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Michael,

On Fri, 2020-03-27 at 14:50 +1100, Michael Ellerman wrote:
> Hi Leonardo,
>=20
> Leonardo Bras <leonardo@linux.ibm.com> writes:
> > During a crash, there is chance that the cpus that handle the NMI IPI
> > are holding a spin_lock. If this spin_lock is needed by crashing_cpu it
> > will cause a deadlock. (rtas_lock and printk logbuf_log as of today)
>=20
> Please give us more detail on how those locks are causing you trouble, a
> stack trace would be good if you have it.

Sure, I have hit it in printf and rtas_call, as said before.=20

After crash_send_ipi(), it's tested how many cpus_in_crash are there,
and once they hit the total value, it's printed "IPI complete". This
printk call itself already got stuck in spin_lock, for example.

Here are the stack traces:

#0  arch_spin_lock=20
#1  do_raw_spin_lock=20
#2  __raw_spin_lock=20
#3  _raw_spin_lock=20
#4  vprintk_emit=20
#5  vprintk_func
#7  crash_kexec_prepare_cpus=20
#8  default_machine_crash_shutdown
#9  machine_crash_shutdown=20
#10 __crash_kexec
#11 crash_kexec
#12 oops_end

#0 arch_spin_lock
#1  lock_rtas ()=20
#2  rtas_call (token=3D8204, nargs=3D1, nret=3D1, outputs=3D0x0)
#3  ics_rtas_mask_real_irq (hw_irq=3D4100)=20
#4  machine_kexec_mask_interrupts
#5  default_machine_crash_shutdown
#6  machine_crash_shutdown=20
#7  __crash_kexec
#8  crash_kexec
#9  oops_end

> > This is a problem if the system has kdump set up, given if it crashes
> > for any reason kdump may not be saved for crash analysis.
> >=20
> > Skip spinlocks after NMI IPI is sent to all other cpus.
>=20
> We don't want to add overhead to all spinlocks for the life of the
> system, just to handle this one case.

I understand.=20
Other than this patch, I would propose doing something uglier, like
forcing the said locks to unlocked state when cpus_in_crash hits it's
maximum value, before printing "IPI complete".
Creating similar functions that don't lock, just for this case, looks
like overkill to me.

Do you have any other suggestion?

> There's already a flag that is set when the system is crashing,
> "oops_in_progress", maybe we need to use that somewhere to skip a lock
> or do an early return.

I think that would not work, because oops_in_progress should be 0 here:
oops_end() calls bust_spinlocks(0) before calling crash_kexec(), and
bust_spinlocks(0) will decrement oops_in_progress.
(just verified, it's 0 before printing "IPI complete").

Thank you the feedback, :)

Best regards,
Leonardo


--=-txa6N3c5No/7zpOox/tI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMdeUgIzgjf6YmUyOlQYWtz9SttQFAl5+QrAACgkQlQYWtz9S
ttRtkxAAxQ18qV/sitx+eX0YI1Eu3Uj78PX8UN90MddDaTO0QU6k/ZV7UvEBmU8C
POlNTSgIkzMXq+N2DT+0OhhmP+2Fdj91ovQGtPnO7kjXRO3wpvRbIFoPi8/PDsCx
RJGGEv1AV+yleSYhG3pf/jk2q1NUSZW+t3A9SvkVMX0w4jav3qHzTm3T37ZZ1dks
6mJE+RlMvnt5N1PWNCcnlxcYgpvQZjWNfcltsfcG5f8aWEAXjKH5lZ9kTkBzUOmw
RXJIZhhLFr7QIBJK6joqAnohED0JlFyp9X/pfFkFYBkNmPcgB4AzuLHH+7xNvHd2
A23u4k7Xj7oYbpwYMLeMDg9yvpj1hk13R+RzcSk1x5WLAhWCAbtc2pW5Sps646sM
5BYN4XG0X1TIqU3XzVX9j5oeax7ePe9vFDta/CmV8KSsUdwTzOYNgGaKyi7vgYg4
dhkRYpMWTo+RJbyfDw8pJV2ABk3xgYmugQTfQNGDzJYTArDU5fq/UCovzat61eDh
jp28ciBr9jaZ3PHd6UhHZjogmaHewm/sJiLnr0qA0XPXb7acYc1LoMsEWCqBj1PG
3EuiHxJ1DlhBo7rfQ0kzxogfTpegEZ2u265eSKuEPO4ssPz9w30hex4fMJWuP5Lq
A3RlcbXHeZQyj+PxM2OFRxNXzXfesqOoD6JRA/kch5ZHGMz2J78=
=qwkO
-----END PGP SIGNATURE-----

--=-txa6N3c5No/7zpOox/tI--

