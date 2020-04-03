Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D1A19CDD4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 02:39:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48th0L0PqRzDrgF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 11:39:46 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tgyk518bzDqwr
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 11:38:22 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0330WrB2124894; Thu, 2 Apr 2020 20:38:00 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 303wryyer3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Apr 2020 20:37:59 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 0330araG007582;
 Fri, 3 Apr 2020 00:37:58 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma02wdc.us.ibm.com with ESMTP id 301x77cv4h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Apr 2020 00:37:58 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0330bv3r41025894
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 3 Apr 2020 00:37:57 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8C0E9C6055;
 Fri,  3 Apr 2020 00:37:57 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D0F1BC6057;
 Fri,  3 Apr 2020 00:37:47 +0000 (GMT)
Received: from LeoBras (unknown [9.85.174.86])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  3 Apr 2020 00:37:47 +0000 (GMT)
Message-ID: <02e74be19534ab1db2f16a0c89ecb164e380c12a.camel@linux.ibm.com>
Subject: Re: [PATCH v3 1/1] ppc/crash: Reset spinlocks during crash
From: Leonardo Bras <leonardo@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Enrico
 Weigelt <info@metux.net>, Alexios Zavras <alexios.zavras@intel.com>, Thomas
 Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,
 Christophe Leroy <christophe.leroy@c-s.fr>, peterz@infradead.org
Date: Thu, 02 Apr 2020 21:37:40 -0300
In-Reply-To: <871rp6t9di.fsf@mpe.ellerman.id.au>
References: <20200401000020.590447-1-leonardo@linux.ibm.com>
 <871rp6t9di.fsf@mpe.ellerman.id.au>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-0Tr/A2r0lls4SLWwZoEE"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-02_13:2020-04-02,
 2020-04-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 clxscore=1015 bulkscore=0 malwarescore=0 suspectscore=0
 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004030000
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


--=-0Tr/A2r0lls4SLWwZoEE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-04-02 at 22:28 +1100, Michael Ellerman wrote:
> Leonardo Bras <leonardo@linux.ibm.com> writes:
> > During a crash, there is chance that the cpus that handle the NMI IPI
> > are holding a spin_lock. If this spin_lock is needed by crashing_cpu it
> > will cause a deadlock. (rtas.lock and printk logbuf_lock as of today)
> >=20
> > This is a problem if the system has kdump set up, given if it crashes
> > for any reason kdump may not be saved for crash analysis.
> >=20
> > After NMI IPI is sent to all other cpus, force unlock all spinlocks
> > needed for finishing crash routine.
>=20
> I'm not convinced this is the right approach.

Me neither. I think it's a very hacky solution, but I couldn't think of
anything better at the time.

> Busting locks is risky, it could easily cause a crash if data structures
> are left in some inconsistent state.
>=20
> I think we need to make this code more careful about what it's doing.
> There's a clue at the top of default_machine_crash_shutdown(), which
> calls crash_kexec_prepare_cpus():
>=20
> 	 * This function is only called after the system
> 	 * has panicked or is otherwise in a critical state.
> 	 * The minimum amount of code to allow a kexec'd kernel
> 	 * to run successfully needs to happen here.
>=20
>=20
> You said the "IPI complete" message was the cause of one lockup:
>=20
>   #0  arch_spin_lock=20
>   #1  do_raw_spin_lock=20
>   #2  __raw_spin_lock=20
>   #3  _raw_spin_lock=20
>   #4  vprintk_emit=20
>   #5  vprintk_func
>   #7  crash_kexec_prepare_cpus=20
>   #8  default_machine_crash_shutdown
>   #9  machine_crash_shutdown=20
>   #10 __crash_kexec
>   #11 crash_kexec
>   #12 oops_end
>=20
> TBH I think we could just drop that printk() entirely.
>=20
> Or we could tell printk() that we're in NMI context so that it uses the
> percpu buffers.
>=20
> We should probably do the latter anyway, in case there's any other code
> we call that inadvertently calls printk().
>=20

I was not aware of using per-cpu buffers in printk. It may be a nice
solution.

There is another printk call there:
printk("kexec: Starting switchover sequence.\n");
in default_machine_kexec().

Two printk and one rtas call: it's all I could see using a spinlock
after IPI Complete.

>=20
> The RTAS trace you sent was:
>=20
>   #0 arch_spin_lock
>   #1  lock_rtas ()=20
>   #2  rtas_call (token=3D8204, nargs=3D1, nret=3D1, outputs=3D0x0)
>   #3  ics_rtas_mask_real_irq (hw_irq=3D4100)=20
>   #4  machine_kexec_mask_interrupts
>   #5  default_machine_crash_shutdown
>   #6  machine_crash_shutdown=20
>   #7  __crash_kexec
>   #8  crash_kexec
>   #9  oops_end
>=20
>=20
> Which doesn't make it clear who holds the RTAS lock. We really shouldn't
> be crashing while holding the RTAS lock, but I guess it could happen.
> Can you get a full backtrace?
>=20

Oh, all traces are from the thread that called the crash, by writing
'c' to sysrq. That is what I am using to reproduce.

#10 bad_page_fault
#11 handle_page_fault
#12 __handle_sysrq (key=3D99, check_mask=3Dfalse)=20
#13 write_sysrq_trigger=20
#14 proc_reg_write
#15 __vfs_write
#16 vfs_write
#17 SYSC_write
#18 SyS_write
#19 system_call

>=20
> PAPR says we are not allowed to have multiple CPUs calling RTAS at once,
> except for a very small list of RTAS calls. So if we bust the RTAS lock
> there's a risk we violate that part of PAPR and crash even harder.

Interesting, I was not aware.

>=20
> Also it's not specific to kdump, we can't even get through a normal
> reboot if we crash with the RTAS lock held.
>=20
> Anyway here's a patch with some ideas. That allows me to get from a
> crash with the RTAS lock held through kdump into the 2nd kernel. But it
> only works if it's the crashing CPU that holds the RTAS lock.
>=20

Nice idea.=20
But my test environment is just triggering a crash from sysrq, so I
think it would not improve the result, given that this thread is
probably not holding the lock by the time.

I noticed that when rtas is locked, irqs and preemption are also
disabled.

Should the IPI send by crash be able to interrupt a thread with
disabled irqs?

Best regards,
Leonardo Bras


> cheers
>=20
> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
> index c5fa251b8950..44ce74966d60 100644
> --- a/arch/powerpc/kernel/rtas.c
> +++ b/arch/powerpc/kernel/rtas.c
> @@ -25,6 +25,7 @@
>  #include <linux/reboot.h>
>  #include <linux/syscalls.h>
> =20
> +#include <asm/debugfs.h>
>  #include <asm/prom.h>
>  #include <asm/rtas.h>
>  #include <asm/hvcall.h>
> @@ -65,6 +66,8 @@ unsigned long rtas_rmo_buf;
>  void (*rtas_flash_term_hook)(int);
>  EXPORT_SYMBOL(rtas_flash_term_hook);
> =20
> +static int rtas_lock_holder =3D -1;
> +
>  /* RTAS use home made raw locking instead of spin_lock_irqsave
>   * because those can be called from within really nasty contexts
>   * such as having the timebase stopped which would lockup with
> @@ -76,7 +79,20 @@ static unsigned long lock_rtas(void)
> =20
>  	local_irq_save(flags);
>  	preempt_disable();
> -	arch_spin_lock(&rtas.lock);
> +
> +	if (!arch_spin_trylock(&rtas.lock)) {
> +		// Couldn't get the lock, do we already hold it?
> +		if (rtas_lock_holder =3D=3D smp_processor_id())
> +			// Yes, so we would have deadlocked on ourself. Assume
> +			// we're crashing and continue on hopefully ...
> +			return flags;
> +
> +		// No, wait on the lock
> +		arch_spin_lock(&rtas.lock);
> +	}
> +
> +	rtas_lock_holder =3D smp_processor_id();
> +
>  	return flags;
>  }
> =20
> @@ -85,6 +101,8 @@ static void unlock_rtas(unsigned long flags)
>  	arch_spin_unlock(&rtas.lock);
>  	local_irq_restore(flags);
>  	preempt_enable();
> +
> +	rtas_lock_holder =3D -1;
>  }
> =20
>  /*
> @@ -1263,3 +1281,24 @@ void rtas_take_timebase(void)
>  	timebase =3D 0;
>  	arch_spin_unlock(&timebase_lock);
>  }
> +
> +static int rtas_crash_set(void *data, u64 val)
> +{
> +	printk("%s: Taking RTAS lock and then crashing ...\n", __func__);
> +	lock_rtas();
> +
> +	*((volatile int *) 0) =3D 0;
> +
> +	return 0;
> +}
> +
> +DEFINE_DEBUGFS_ATTRIBUTE(fops_rtas_crash, NULL, rtas_crash_set, "%llu\n"=
);
> +
> +static __init int rtas_crash_debugfs_init(void)
> +{
> +	debugfs_create_file_unsafe("crash_in_rtas", 0200,
> +				   powerpc_debugfs_root, NULL,
> +				   &fops_rtas_crash);
> +	return 0;
> +}
> +device_initcall(rtas_crash_debugfs_init);
> diff --git a/arch/powerpc/kexec/crash.c b/arch/powerpc/kexec/crash.c
> index d488311efab1..4c52cb58e889 100644
> --- a/arch/powerpc/kexec/crash.c
> +++ b/arch/powerpc/kexec/crash.c
> @@ -15,6 +15,7 @@
>  #include <linux/crash_dump.h>
>  #include <linux/delay.h>
>  #include <linux/irq.h>
> +#include <linux/printk.h>
>  #include <linux/types.h>
> =20
>  #include <asm/processor.h>
> @@ -311,6 +312,8 @@ void default_machine_crash_shutdown(struct pt_regs *r=
egs)
>  	unsigned int i;
>  	int (*old_handler)(struct pt_regs *regs);
> =20
> +	printk_nmi_enter();
> +
>  	/*
>  	 * This function is only called after the system
>  	 * has panicked or is otherwise in a critical state.
>=20
>=20

--=-0Tr/A2r0lls4SLWwZoEE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMdeUgIzgjf6YmUyOlQYWtz9SttQFAl6GhVQACgkQlQYWtz9S
ttS1VQ//UalPgDSIiB85o5Hsly36gCxn7d+33UXSLICphCBT2GFeQafiwA2iG3Nf
/fro0p3MvHy/PhnKcRaWzUn3gQvjjzx/PCUGZc2Z23qbAB4az/y/PxpkhSCUBMvJ
5LSiz2AiVOrHpj008HNHzgaNpu1y3KgE2DSouBdawyjN5/k6CeEuBD1mwjMpT3fS
jC/kerkewYCKUcheRpn4HirW9t7i2DRSoIV+KwuuTrJX9ueXnsvc1qkX1c382mlY
9B0gYvN1gQdSanilMVFN2DUzl8/4nMT/VYEh4xlnQVmAnlCEAUNcI8JeqqWdppZt
E+RwKyZUO/xqkaj+PPjkH496twU4NQMLQ4Zs24kwXhwvqOsm1BqfE7+THQJQi21i
LlbdqidYKf5ka2k3MCaahpRFNsNMQbn23sWJtEYmoR1hejI/UPcDB1SDEQ/1N/tV
9D1pFXCD0IRXCPtFcBoXwpngCSEpN5vDXL867YmGC3EczjZ7ncTiiIg+1bsB0YTK
A39uuQvfrWQ7diTIEqd4drgKynNQNuIJ68rAk2aEM0CldI8e2cxgZymQDK/vbmLQ
h9nPt+GjdOI6hFZQC0EPSo3nKrlUMmC61KGfeT9PtwZm4ZjrP5KNuLLYZDs/8a7p
V9rtmf2kRZcFx1UHgl4G9g58aAbfZlpidHimF9qSBYIaHsRZW+E=
=0Bny
-----END PGP SIGNATURE-----

--=-0Tr/A2r0lls4SLWwZoEE--

