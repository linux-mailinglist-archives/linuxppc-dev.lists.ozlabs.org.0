Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4165B3197A3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 01:54:04 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DcFPP4RSRzDwvJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 11:54:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c;
 helo=mail-pj1-x102c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=g1dfJ+/v; dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DcF1h561JzDwwh
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Feb 2021 11:36:54 +1100 (AEDT)
Received: by mail-pj1-x102c.google.com with SMTP id l18so4419734pji.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Feb 2021 16:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=7stMU8rkICSB42n8HN3vxCUZLDn6j7hn0nIs5uFGH9c=;
 b=g1dfJ+/v/G2LUH0nUr8Fub8O64BXj/LwkvpiJuQ/Xt7IPhKP5Lfr2N0idh6OgeHF24
 wo6LLHOHyBVvrnvVTO8tB2TJuIp4n5VQBpnWjOk6biZigUq+KkX30uXOWW38j4xBNlDT
 RGgsdgk5VMUONJw/yQfaIl3zYX987bAismBfy4T1+kQkWRtiCSwZnI5xs8NOpJ1ieKPb
 Giu/cUDYA2opEi3dYY9x6NkQdzNj8TjgPhxkJeXpQ3hW90QWbWaNTFsja6PagoidWDSh
 sUezH/EJqxZHP0v7m8p0duV5ZUSw+iv/Arya0h2oQnhsTRrF+bK9XztyCwZfyxjJixMm
 HB0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=7stMU8rkICSB42n8HN3vxCUZLDn6j7hn0nIs5uFGH9c=;
 b=eAIojiAQGKBBps80g86sMz9gSOQqZxt8i9hvpCtUGxwHrZrejf7ZwVEjngWNb0bwsP
 SEIwZblTv1jTkqN03VqzveNKab2yqmcVHWfm9q7Bxs8zou7CaFzC6nAs5aEFWxrBq3p9
 EUCwzPm+jueMlt+h59K2DaWR/3gKSaQYr042qHjkJKrn/ceQNXbzGQxQ7FAUSl703V6n
 Am+TGkAzYRlzdU1kgxfLPP5K+YKtBZLQVVX8p7Ebf5voZamxrO3zRm6I479fSAHnZ35D
 JeDU2c5uzXGFzDBNU0gFx2ZPZE/Avk8k9VUsP/mPUgagXx8ji8HXx/qcY6c+NWqzARdU
 jcoA==
X-Gm-Message-State: AOAM5323vZ1kk+OEtopbmaKx+u1u7wSqB852gOwIuVEwjegkcBk41Hs3
 ywyooWf3TzF1k1vIixeReiW0pJSybTc=
X-Google-Smtp-Source: ABdhPJwT0LPmkN+QLAUqKznQ3d1OTr15+8H3QwdxGaWqKvBVT6zgVvJliNLt04YnH9a09PCdU/1uvA==
X-Received: by 2002:a17:90a:8b82:: with SMTP id z2mr327780pjn.25.1613090210495; 
 Thu, 11 Feb 2021 16:36:50 -0800 (PST)
Received: from localhost (14-201-150-91.tpgi.com.au. [14.201.150.91])
 by smtp.gmail.com with ESMTPSA id me3sm5999542pjb.32.2021.02.11.16.36.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 16:36:49 -0800 (PST)
Date: Fri, 12 Feb 2021 10:36:43 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 5/6] powerpc/mm/64s/hash: Add real-mode
 change_memory_range() for hash LPAR
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
References: <20210211135130.3474832-1-mpe@ellerman.id.au>
 <20210211135130.3474832-5-mpe@ellerman.id.au>
In-Reply-To: <20210211135130.3474832-5-mpe@ellerman.id.au>
MIME-Version: 1.0
Message-Id: <1613086376.ygjdbhz8p5.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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

Excerpts from Michael Ellerman's message of February 11, 2021 11:51 pm:
> When we enabled STRICT_KERNEL_RWX we received some reports of boot
> failures when using the Hash MMU and running under phyp. The crashes
> are intermittent, and often exhibit as a completely unresponsive
> system, or possibly an oops.
>=20
> One example, which was caught in xmon:
>=20
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
>=20
> This shows that CPU 2, which was idle, woke up and then appears to
> randomly take an instruction fault on a completely valid area of
> kernel text.
>=20
> The cause turns out to be the call to hash__mark_rodata_ro(), late in
> boot. Due to the way we layout text and rodata, that function actually
> changes the permissions for all of text and rodata to read-only plus
> execute.
>=20
> To do the permission change we use a hypervisor call, H_PROTECT. On
> phyp that appears to be implemented by briefly removing the mapping of
> the kernel text, before putting it back with the updated permissions.
> If any other CPU is executing during that window, it will see spurious
> faults on the kernel text and/or data, leading to crashes.
>=20
> To fix it we use stop machine to collect all other CPUs, and then have
> them drop into real mode (MMU off), while we change the mapping. That
> way they are unaffected by the mapping temporarily disappearing.
>=20
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  arch/powerpc/mm/book3s64/hash_pgtable.c | 105 +++++++++++++++++++++++-
>  1 file changed, 104 insertions(+), 1 deletion(-)
>=20
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
> =20
>  #include <asm/sections.h>
>  #include <asm/mmu.h>
> @@ -400,6 +401,19 @@ EXPORT_SYMBOL_GPL(hash__has_transparent_hugepage);
>  #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
> =20
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
> =20
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

Pity we don't have something that can switch to emergency stack and
so we can write this stuff in C.

How's something like this suit you?

---
 arch/powerpc/kernel/misc_64.S | 22 +++++++++++++++++++++
 arch/powerpc/kernel/process.c | 37 +++++++++++++++++++++++++++++++++++
 2 files changed, 59 insertions(+)

diff --git a/arch/powerpc/kernel/misc_64.S b/arch/powerpc/kernel/misc_64.S
index 070465825c21..5e911d0b0b16 100644
--- a/arch/powerpc/kernel/misc_64.S
+++ b/arch/powerpc/kernel/misc_64.S
@@ -27,6 +27,28 @@
=20
 	.text
=20
+#ifdef CONFIG_PPC_BOOK3S_64
+_GLOBAL(__call_realmode)
+	mflr	r0
+	std	r0,16(r1)
+	stdu	r1,THREAD_SIZE-STACK_FRAME_OVERHEAD(r5)
+	mr	r1,r5
+	mtctr	r3
+	mr	r3,r4
+	mfmsr	r4
+	xori	r4,r4,(MSR_IR|MSR_DR)
+	mtmsrd	r4
+	bctrl
+	mfmsr	r4
+	xori	r4,r4,(MSR_IR|MSR_DR)
+	mtmsrd	r4
+	ld	r1,0(r1)
+	ld	r0,16(r1)
+	mtlr	r0
+	blr
+
+#endif
+
 _GLOBAL(call_do_softirq)
 	mflr	r0
 	std	r0,16(r1)
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index a66f435dabbf..260d60f665a3 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -2197,6 +2197,43 @@ void show_stack(struct task_struct *tsk, unsigned lo=
ng *stack,
 	put_task_stack(tsk);
 }
=20
+#ifdef CONFIG_PPC_BOOK3S_64
+int __call_realmode(int (*fn)(void *arg), void *arg, void *sp);
+
+/* XXX: find a better place for this
+ * Executing C code in real-mode in general Book3S-64 code can only be don=
e
+ * via this function that switches the stack to one inside the real-mode-a=
rea,
+ * which may cover only a small first part of real memory on hash guest LP=
ARs.
+ * fn must be NOKPROBES, must not access vmalloc or anything outside the R=
MA,
+ * probably shouldn't enable the MMU or interrupts, etc, and be very caref=
ul
+ * about calling other generic kernel or powerpc functions.
+ */
+int call_realmode(int (*fn)(void *arg), void *arg)
+{
+	unsigned long flags;
+	void *cursp, *emsp;
+	int ret;
+
+	/* Stack switch is only really required for HPT LPAR, but do it for all t=
o help test coverage of tricky code */
+	cursp =3D (void *)(current_stack_pointer & ~(THREAD_SIZE - 1));
+	emsp =3D (void *)(local_paca->emergency_sp - THREAD_SIZE);
+
+	/* XXX check_stack_overflow(); */
+
+	if (WARN_ON_ONCE(cursp =3D=3D emsp))
+		return -EBUSY;
+
+	local_irq_save(flags);
+	hard_irq_disable();
+
+	ret =3D __call_realmode(fn, arg, emsp);
+
+	local_irq_restore(flags);
+
+	return ret;
+}
+#endif
+
 #ifdef CONFIG_PPC64
 /* Called with hard IRQs off */
 void notrace __ppc64_runlatch_on(void)
--=20
2.23.0

