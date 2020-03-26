Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 976FB194D50
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 00:33:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48pLrk49j9zDr3R
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 10:33:10 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48pLkR1rPkzDr1r
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Mar 2020 10:27:43 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02QN37e3115286; Thu, 26 Mar 2020 19:27:24 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ywf2kyp7h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Mar 2020 19:27:24 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 02QN7XfB003164;
 Thu, 26 Mar 2020 19:27:20 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ywf2kyp5n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Mar 2020 19:27:19 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 02QNOwTM031251;
 Thu, 26 Mar 2020 23:27:14 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma01dal.us.ibm.com with ESMTP id 2ywawmgu13-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Mar 2020 23:27:14 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02QNRD0K50331954
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Mar 2020 23:27:13 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 32EC2AE05C;
 Thu, 26 Mar 2020 23:27:13 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D0E36AE062;
 Thu, 26 Mar 2020 23:27:04 +0000 (GMT)
Received: from LeoBras (unknown [9.85.162.45])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 26 Mar 2020 23:27:04 +0000 (GMT)
Message-ID: <d8ad4ef329bda280cac4103ad69a391fee63eaf8.camel@linux.ibm.com>
Subject: Re: [PATCH 1/1] ppc/crash: Skip spinlocks during crash
From: Leonardo Bras <leonardo@linux.ibm.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael
 Ellerman <mpe@ellerman.id.au>, Enrico Weigelt <info@metux.net>, Allison
 Randal <allison@lohutok.net>, Christophe Leroy <christophe.leroy@c-s.fr>,
 Thomas Gleixner <tglx@linutronix.de>
Date: Thu, 26 Mar 2020 20:26:59 -0300
In-Reply-To: <20200326222836.501404-1-leonardo@linux.ibm.com>
References: <20200326222836.501404-1-leonardo@linux.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-FVin2VQG/dF3wxpzlErY"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-26_14:2020-03-26,
 2020-03-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 malwarescore=0 mlxlogscore=999 clxscore=1015 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2003260166
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


--=-FVin2VQG/dF3wxpzlErY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

oops, forgot to EXPORT_SYMBOL.=20
arch_spin_lock*() is used on modules.

Sending v2.

On Thu, 2020-03-26 at 19:28 -0300, Leonardo Bras wrote:
> During a crash, there is chance that the cpus that handle the NMI IPI
> are holding a spin_lock. If this spin_lock is needed by crashing_cpu it
> will cause a deadlock. (rtas_lock and printk logbuf_log as of today)
>=20
> This is a problem if the system has kdump set up, given if it crashes
> for any reason kdump may not be saved for crash analysis.
>=20
> Skip spinlocks after NMI IPI is sent to all other cpus.
>=20
> Signed-off-by: Leonardo Bras <leonardo@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/spinlock.h | 6 ++++++
>  arch/powerpc/kexec/crash.c          | 3 +++
>  2 files changed, 9 insertions(+)
>=20
> diff --git a/arch/powerpc/include/asm/spinlock.h b/arch/powerpc/include/a=
sm/spinlock.h
> index 860228e917dc..a6381d110795 100644
> --- a/arch/powerpc/include/asm/spinlock.h
> +++ b/arch/powerpc/include/asm/spinlock.h
> @@ -111,6 +111,8 @@ static inline void splpar_spin_yield(arch_spinlock_t =
*lock) {};
>  static inline void splpar_rw_yield(arch_rwlock_t *lock) {};
>  #endif
> =20
> +extern bool crash_skip_spinlock __read_mostly;
> +
>  static inline bool is_shared_processor(void)
>  {
>  #ifdef CONFIG_PPC_SPLPAR
> @@ -142,6 +144,8 @@ static inline void arch_spin_lock(arch_spinlock_t *lo=
ck)
>  		if (likely(__arch_spin_trylock(lock) =3D=3D 0))
>  			break;
>  		do {
> +			if (unlikely(crash_skip_spinlock))
> +				return;
>  			HMT_low();
>  			if (is_shared_processor())
>  				splpar_spin_yield(lock);
> @@ -161,6 +165,8 @@ void arch_spin_lock_flags(arch_spinlock_t *lock, unsi=
gned long flags)
>  		local_save_flags(flags_dis);
>  		local_irq_restore(flags);
>  		do {
> +			if (unlikely(crash_skip_spinlock))
> +				return;
>  			HMT_low();
>  			if (is_shared_processor())
>  				splpar_spin_yield(lock);
> diff --git a/arch/powerpc/kexec/crash.c b/arch/powerpc/kexec/crash.c
> index d488311efab1..8a522380027d 100644
> --- a/arch/powerpc/kexec/crash.c
> +++ b/arch/powerpc/kexec/crash.c
> @@ -66,6 +66,8 @@ static int handle_fault(struct pt_regs *regs)
> =20
>  #ifdef CONFIG_SMP
> =20
> +bool crash_skip_spinlock;
> +
>  static atomic_t cpus_in_crash;
>  void crash_ipi_callback(struct pt_regs *regs)
>  {
> @@ -129,6 +131,7 @@ static void crash_kexec_prepare_cpus(int cpu)
>  	/* Would it be better to replace the trap vector here? */
> =20
>  	if (atomic_read(&cpus_in_crash) >=3D ncpus) {
> +		crash_skip_spinlock =3D true;
>  		printk(KERN_EMERG "IPI complete\n");
>  		return;
>  	}

--=-FVin2VQG/dF3wxpzlErY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMdeUgIzgjf6YmUyOlQYWtz9SttQFAl59OkMACgkQlQYWtz9S
ttTdfxAAxfhffzM9iTgF/t3ay/7HkmkImzVE3dqBCSrCsUNMOI7eO2+Oba7a0Ia6
Qr+sqoya33yFOHgzsPlj8fSIcaNRxw5qoNU4Mvt/IO+7veVkGfXl6DCvUnjGWRMS
rZnkQoFb7ilh7ik9yW0zyg5geH7b6IBILDXdMnslGqsQK4G3AkH70Pb/INxvVfOz
v+qIGriALpQ/PRPKoxbjk7v8ETtkaCvxDsIF05ynnzRr+uPuqydcCWRD5nO8nwBk
XtF/4RL8zowSnPmlR0s7AMV0Mr7uaNvhrEtKpK9ugl817OGosGgYd76TDbn3n+Ga
VxK63NNQkUgnUV6gToPoEwSdqSGC6hA31X6y5B6ckLJdjpc1wO+OngBaMUvO0sPE
tuSN86f4IlaYIHY0szfMdhpoX2ptzN7LSsQwgkYwCrx9RfUrhKGzWIMK+FTH9eF3
yBHbIkKY+GS3KMnp+lsdtbgNHm4MuEmF4U/TMj6SUi5XPlGKMy9hf/lxucLC5fyA
ZhZQE3q4U9k2QVSJmZvw/i6jhSi99RbseBe1qt0mwLReDSlP/HUzy6QVky9bh+w5
1wzAJyQWmM0jCMkAZWDI5ckeV+3Y6tRc5Lor1JTS1LbrG78qyRttq9zaioeSU3C2
h0StSxKOcPDTIeg3LkZ4cZWubcLo5rwmHNjB5mn/RlRGu4oFqO4=
=aPwG
-----END PGP SIGNATURE-----

--=-FVin2VQG/dF3wxpzlErY--

