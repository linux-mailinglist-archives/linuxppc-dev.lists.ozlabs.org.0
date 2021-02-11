Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C5403319676
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 00:19:13 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DcCHy43gzzDwrR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 10:19:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633;
 helo=mail-pl1-x633.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=vX8f47Wz; dkim-atps=neutral
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DcCFf3LnDzDwnv
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Feb 2021 10:17:09 +1100 (AEDT)
Received: by mail-pl1-x633.google.com with SMTP id u15so4174995plf.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Feb 2021 15:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=3I9Yg6+Jn4eXnKF9k0n7iaNkXu59at9i04udV7WgS9I=;
 b=vX8f47WzilwpH+BDW824rjaENUEwDGDfkMfEJjLiaQDfAWti7aWU7Wn//DhIVJXyrs
 +hDAVwmh9xsgsQyauDoIiHj1QetwunF8TJUBsu1XlA7Ijf5k9DzKFaDMXvGcflL1XKMd
 dLBiXLhHfesMRdF0wZDaigz2I6Yt+NVDDhUrqmbj4QcZGzC8tz2DCnYu7cODdem4wFR/
 KVedfn1i/bSZXmiunNgjWoTybP5CRftKqGzKcXPEDpiX6AtBHo6HbeNJZnAS1PkRRPnJ
 vnfRMEJXnwk4JKcU2nDZ/sfwNTOuePCKgWcJz0kV0vlzzgOpuCVX8c6EcCXt9RHV0Xii
 txAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=3I9Yg6+Jn4eXnKF9k0n7iaNkXu59at9i04udV7WgS9I=;
 b=HRdNFtLu28pB4+Ig0TcO6wB5qTCSKOu1SfeTq24XLDK6mdU8VFbCoFZAUTsxEDsRku
 qDhdrg1vz78ULkNxnrpg+2OG7vd+GHmwc1K7+icaZE+gTfZmD7I729nWLtw2LwcEX9Ly
 e9M1VN7zo305mgFOnkFBawIlLPGbAoeGDRkGaWlA57nBkV4e0IFcWU8NIpUxTL72znHo
 EozGukCL2eESH31Y6ewBTq4V3a/c9xFLsE6+ISug34ufo2ADHNSd8DWwJVwhncAg4O2m
 2KvkTsh8aD18VARBRPuB4iqahXK81k/GW/w80YJtQ/zM1Q8uZ6m4bzLYTYXOTb5dbJGX
 CL7g==
X-Gm-Message-State: AOAM530OtZ50ZRvPWcPz4KaQuZumTu7+bSjv0w8ap7CPU5TU/G2xiJI9
 uZarUkKrW7jA4CjumaQiTl6qVFRPVUU=
X-Google-Smtp-Source: ABdhPJxP3+ZGh97Egy5rvKEBIXSDwplyZ9BADMpkA6LjbbyEV2bwC2Il9zcYBfWqwhnlcp8CesirXQ==
X-Received: by 2002:a17:90a:5208:: with SMTP id v8mr67036pjh.224.1613085425406; 
 Thu, 11 Feb 2021 15:17:05 -0800 (PST)
Received: from localhost (14-201-150-91.tpgi.com.au. [14.201.150.91])
 by smtp.gmail.com with ESMTPSA id x4sm6370614pfm.64.2021.02.11.15.17.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 15:17:04 -0800 (PST)
Date: Fri, 12 Feb 2021 09:16:58 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 5/6] powerpc/mm/64s/hash: Add real-mode
 change_memory_range() for hash LPAR
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
References: <20210211135130.3474832-1-mpe@ellerman.id.au>
 <20210211135130.3474832-5-mpe@ellerman.id.au>
In-Reply-To: <20210211135130.3474832-5-mpe@ellerman.id.au>
MIME-Version: 1.0
Message-Id: <1613084139.rsms9jxmax.astroid@bobo.none>
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

Hmm. __hard_EE_RI_disable won't get restored by this because it doesn't
set the HARD_DIS flag. Also we don't want RI disabled here because=20
tracing will get called first (which might take SLB or HPTE fault).

But it's also slightly rude to ever enable EE under an irq soft mask,
because you don't know if it had been disabled by the masked interrupt=20
handler. It's not strictly a problem AFAIK because the interrupt would
just get masked again, but if we try to maintain a good pattern would
be good. Hmm that means we should add a check for irqs soft masked in
__hard_irq_enable(), I'm not sure if all existing users would follow
this rule.

Might be better to call hard_irq_disable(); after the local_irq_save();
and then clear and reset RI inside that region (could just do it at the
same time as disabling MMU).

You could possibly pass old_msr and new_msr into asm directly and do
mfmsr() in C?

Clearing RI here unfortuantely I don't think will prevent interrupt
handlers (sreset or MCE) from trying to go into virtual mode if they
hit here. It only prevents them trying to return.

Thanks,
Nick
