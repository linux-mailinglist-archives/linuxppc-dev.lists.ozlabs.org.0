Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5AF31F410
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Feb 2021 03:43:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DhbVx2ym9z3bd0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Feb 2021 13:43:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=rNqcvSyb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::635;
 helo=mail-pl1-x635.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=rNqcvSyb; dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DhbVW47nCz30HY
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Feb 2021 13:43:28 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id e9so2542280plh.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Feb 2021 18:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version:content-transfer-encoding;
 bh=7aryp10/VmSwwO8C4xDfYdb1XN+0IB4ZvFHaifg5EDY=;
 b=rNqcvSybCVYJPM8ZBxJhBkkLmzdM2145EWYl1Wyes7CV/A8F4mR70RGQUrFYiT6dp0
 Us7rRZC0AL6G4UP/5ooGcZa78xXzzq8bXOLXG9zeEO8VlzFqY8GpZa+YqPQ2mdZ90t13
 xtIOsVHrtNqN9GX6GCZF7BaO9FfSAchnYoND8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version:content-transfer-encoding;
 bh=7aryp10/VmSwwO8C4xDfYdb1XN+0IB4ZvFHaifg5EDY=;
 b=qdHkJbUtKXzicwQVTROXHI9e6sj3uHJ4x6eC5jSIFPkAC7BPEntwcj94XWVS6+84ZP
 NWEIL4eeIlhR7F9H0y7mMCRb5RIml+qMWesjcPDpBgrbhhw+CH5kG3AQJSm47zzUP6qh
 8mYOXd6SzYKKVxtmimCpJ8O/QHvwEZfEtZ1kIxdFQt0e5JCyWvHdjbqucLdSZqJFQ80k
 HGeSo1PA2WlYJqaTk6G9+cX9H372BQNVUBmPalgTV7vtdADVbJVb0x9j2P2EGxk3hqHs
 Bt1Ea8oBxiHT2+ecdk8tN5khQYJ32DZpjDOP1q3WY0UBFBNtTO08oGobCkJ5uGjfKHMh
 8LPw==
X-Gm-Message-State: AOAM530utptIxkfG5yPoSbjS0hNxIHwKtelmFjUA+1wt/dL2hJ0p8AhE
 NZD6Rq/gwwZZjzQxeOIioZrlvg==
X-Google-Smtp-Source: ABdhPJxaHL4PyEksxAVtVuixHdI2guSBjaLNxscmOrwF7EROddZok1S08WSHqoMPk8ApAdUn5C0jBA==
X-Received: by 2002:a17:90a:aa8a:: with SMTP id
 l10mr7063175pjq.86.1613702605553; 
 Thu, 18 Feb 2021 18:43:25 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-7c23-3019-42a1-bee8.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:7c23:3019:42a1:bee8])
 by smtp.gmail.com with ESMTPSA id k4sm7511716pfa.191.2021.02.18.18.43.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Feb 2021 18:43:24 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 5/6] powerpc/mm/64s/hash: Add real-mode
 change_memory_range() for hash LPAR
In-Reply-To: <20210211135130.3474832-5-mpe@ellerman.id.au>
References: <20210211135130.3474832-1-mpe@ellerman.id.au>
 <20210211135130.3474832-5-mpe@ellerman.id.au>
Date: Fri, 19 Feb 2021 13:43:22 +1100
Message-ID: <87h7m8pyk5.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: aneesh.kumar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:

> When we enabled STRICT_KERNEL_RWX we received some reports of boot
> failures when using the Hash MMU and running under phyp. The crashes
> are intermittent, and often exhibit as a completely unresponsive
> system, or possibly an oops.
>
> One example, which was caught in xmon:
>
>   [   14.068327][    T1] devtmpfs: mounted
>   [   14.069302][    T1] Freeing unused kernel memory: 5568K
>   [   14.142060][  T347] BUG: Unable to handle kernel instruction fetch
>   [   14.142063][    T1] Run /sbin/init as init process
>   [   14.142074][  T347] Faulting instruction address: 0xc000000000004400
>   cpu 0x2: Vector: 400 (Instruction Access) at [c00000000c7475e0]
>       pc: c000000000004400: exc_virt_0x4400_instruction_access+0x0/0x80
>       lr: c0000000001862d4: update_rq_clock+0x44/0x110
>       sp: c00000000c747880
>      msr: 8000000040001031
>     current =3D 0xc00000000c60d380
>     paca    =3D 0xc00000001ec9de80   irqmask: 0x03   irq_happened: 0x01
>       pid   =3D 347, comm =3D kworker/2:1
>   ...
>   enter ? for help
>   [c00000000c747880] c0000000001862d4 update_rq_clock+0x44/0x110 (unrelia=
ble)
>   [c00000000c7478f0] c000000000198794 update_blocked_averages+0xb4/0x6d0
>   [c00000000c7479f0] c000000000198e40 update_nohz_stats+0x90/0xd0
>   [c00000000c747a20] c0000000001a13b4 _nohz_idle_balance+0x164/0x390
>   [c00000000c747b10] c0000000001a1af8 newidle_balance+0x478/0x610
>   [c00000000c747be0] c0000000001a1d48 pick_next_task_fair+0x58/0x480
>   [c00000000c747c40] c000000000eaab5c __schedule+0x12c/0x950
>   [c00000000c747cd0] c000000000eab3e8 schedule+0x68/0x120
>   [c00000000c747d00] c00000000016b730 worker_thread+0x130/0x640
>   [c00000000c747da0] c000000000174d50 kthread+0x1a0/0x1b0
>   [c00000000c747e10] c00000000000e0f0 ret_from_kernel_thread+0x5c/0x6c
>
> This shows that CPU 2, which was idle, woke up and then appears to
> randomly take an instruction fault on a completely valid area of
> kernel text.
>
> The cause turns out to be the call to hash__mark_rodata_ro(), late in
> boot. Due to the way we layout text and rodata, that function actually
> changes the permissions for all of text and rodata to read-only plus
> execute.
>
> To do the permission change we use a hypervisor call, H_PROTECT. On
> phyp that appears to be implemented by briefly removing the mapping of
> the kernel text, before putting it back with the updated permissions.
> If any other CPU is executing during that window, it will see spurious
> faults on the kernel text and/or data, leading to crashes.

Jordan asked why we saw this on phyp but not under KVM? We had a look at
book3s_hv_rm_mmu.c but the code is a bit too obtuse for me to reason
about!

Nick suggests that the KVM hypervisor is invalidating the HPTE, but
because we run guests in VPM mode, the hypervisor would catch the page
fault and not reflect it down to the guest. It looks like Linux-as-a-HV
will take HPTE_V_HVLOCK, and then because it's running in VPM mode, the
hypervisor will catch the fault and not pass it to the guest. But if
phyp runs with VPM mode off, the guest will see the fault before the
hypervisor. (we think this is what's going on anyway.)

We spent a while pondering if phyp is doing something buggy or not...
Looking at the PAPR definition of H_PROTECT, that claims the hypervisor
will do the 'architected =E2=80=9CModifying a Page Table Entry General Case=
=E2=80=9D
sequence'. s 5.10.1.2 of Book IIIS of the ISAv3 defines that, and the
non-atomic hardware sequence does indeed modify the PTE by going through
the invalid state. So it looks like if phyp is running without VPM mode
it's technically not buggy.

Hopefully I'll get to have a look at the rest of the patch shortly!

Kind regards,
Daniel

> To fix it we use stop machine to collect all other CPUs, and then have
> them drop into real mode (MMU off), while we change the mapping. That
> way they are unaffected by the mapping temporarily disappearing.
>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  arch/powerpc/mm/book3s64/hash_pgtable.c | 105 +++++++++++++++++++++++-
>  1 file changed, 104 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/mm/book3s64/hash_pgtable.c b/arch/powerpc/mm/bo=
ok3s64/hash_pgtable.c
> index 3663d3cdffac..01de985df2c4 100644
> --- a/arch/powerpc/mm/book3s64/hash_pgtable.c
> +++ b/arch/powerpc/mm/book3s64/hash_pgtable.c
> @@ -8,6 +8,7 @@
>  #include <linux/sched.h>
>  #include <linux/mm_types.h>
>  #include <linux/mm.h>
> +#include <linux/stop_machine.h>
>=20=20
>  #include <asm/sections.h>
>  #include <asm/mmu.h>
> @@ -400,6 +401,19 @@ EXPORT_SYMBOL_GPL(hash__has_transparent_hugepage);
>  #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
>=20=20
>  #ifdef CONFIG_STRICT_KERNEL_RWX
> +
> +struct change_memory_parms {
> +	unsigned long start, end, newpp;
> +	unsigned int step, nr_cpus, master_cpu;
> +	atomic_t cpu_counter;
> +};
> +
> +// We'd rather this was on the stack but it has to be in the RMO
> +static struct change_memory_parms chmem_parms;
> +
> +// And therefore we need a lock to protect it from concurrent use
> +static DEFINE_MUTEX(chmem_lock);
> +
>  static void change_memory_range(unsigned long start, unsigned long end,
>  				unsigned int step, unsigned long newpp)
>  {
> @@ -414,6 +428,73 @@ static void change_memory_range(unsigned long start,=
 unsigned long end,
>  							mmu_kernel_ssize);
>  }
>=20=20
> +static int notrace chmem_secondary_loop(struct change_memory_parms *parm=
s)
> +{
> +	unsigned long msr, tmp, flags;
> +	int *p;
> +
> +	p =3D &parms->cpu_counter.counter;
> +
> +	local_irq_save(flags);
> +	__hard_EE_RI_disable();
> +
> +	asm volatile (
> +	// Switch to real mode and leave interrupts off
> +	"mfmsr	%[msr]			;"
> +	"li	%[tmp], %[MSR_IR_DR]	;"
> +	"andc	%[tmp], %[msr], %[tmp]	;"
> +	"mtmsrd %[tmp]			;"
> +
> +	// Tell the master we are in real mode
> +	"1:				"
> +	"lwarx	%[tmp], 0, %[p]		;"
> +	"addic	%[tmp], %[tmp], -1	;"
> +	"stwcx.	%[tmp], 0, %[p]		;"
> +	"bne-	1b			;"
> +
> +	// Spin until the counter goes to zero
> +	"2:				;"
> +	"lwz	%[tmp], 0(%[p])		;"
> +	"cmpwi	%[tmp], 0		;"
> +	"bne-	2b			;"
> +
> +	// Switch back to virtual mode
> +	"mtmsrd %[msr]			;"
> +
> +	: // outputs
> +	  [msr] "=3D&r" (msr), [tmp] "=3D&b" (tmp), "+m" (*p)
> +	: // inputs
> +	  [p] "b" (p), [MSR_IR_DR] "i" (MSR_IR | MSR_DR)
> +	: // clobbers
> +	  "cc", "xer"
> +	);
> +
> +	local_irq_restore(flags);
> +
> +	return 0;
> +}
> +
> +static int change_memory_range_fn(void *data)
> +{
> +	struct change_memory_parms *parms =3D data;
> +
> +	if (parms->master_cpu !=3D smp_processor_id())
> +		return chmem_secondary_loop(parms);
> +
> +	// Wait for all but one CPU (this one) to call-in
> +	while (atomic_read(&parms->cpu_counter) > 1)
> +		barrier();
> +
> +	change_memory_range(parms->start, parms->end, parms->step, parms->newpp=
);
> +
> +	mb();
> +
> +	// Signal the other CPUs that we're done
> +	atomic_dec(&parms->cpu_counter);
> +
> +	return 0;
> +}
> +
>  static bool hash__change_memory_range(unsigned long start, unsigned long=
 end,
>  				      unsigned long newpp)
>  {
> @@ -428,7 +509,29 @@ static bool hash__change_memory_range(unsigned long =
start, unsigned long end,
>  	if (start >=3D end)
>  		return false;
>=20=20
> -	change_memory_range(start, end, step, newpp);
> +	if (firmware_has_feature(FW_FEATURE_LPAR)) {
> +		mutex_lock(&chmem_lock);
> +
> +		chmem_parms.start =3D start;
> +		chmem_parms.end =3D end;
> +		chmem_parms.step =3D step;
> +		chmem_parms.newpp =3D newpp;
> +		chmem_parms.master_cpu =3D smp_processor_id();
> +
> +		cpus_read_lock();
> +
> +		atomic_set(&chmem_parms.cpu_counter, num_online_cpus());
> +
> +		// Ensure state is consistent before we call the other CPUs
> +		mb();
> +
> +		stop_machine_cpuslocked(change_memory_range_fn, &chmem_parms,
> +					cpu_online_mask);
> +
> +		cpus_read_unlock();
> +		mutex_unlock(&chmem_lock);
> +	} else
> +		change_memory_range(start, end, step, newpp);
>=20=20
>  	return true;
>  }
> --=20
> 2.25.1
