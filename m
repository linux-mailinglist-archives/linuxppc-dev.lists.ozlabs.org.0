Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BDC7BC37E
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Oct 2023 03:04:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Eh0mPlWo;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Zi45Apvi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S2RsH5ZHVz3vcb
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Oct 2023 12:04:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Eh0mPlWo;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Zi45Apvi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=piliu@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S2RrM5y5Zz2yW2
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Oct 2023 12:03:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696640621;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y+T/mKnKjirLmHdpNj5uezoOUyhga1RZHqElb3N4/ps=;
	b=Eh0mPlWo8im6TF4WzYdMliEp4n1LBLdfFvhTLdBGGlb1MzJckHqSM5+68pbSAJta8c6paj
	5TKp9pQ2ZV2AkhKk2tp9X4bTNkoRsccqdC64JJBdicT3V5u6lTlMO5zy60pOsN9xcs1ooe
	6ghNvxjTNPfkY2HtJTfbfxu43v2fcdk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696640622;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y+T/mKnKjirLmHdpNj5uezoOUyhga1RZHqElb3N4/ps=;
	b=Zi45ApviQ0SrcPxO+zIKQv5+kUFHKa7lXhd0MZO5ikS6vhhBH+yCZFT5VmRrm2JgI8lOze
	lICUYWCz5XoxbE35huh1MKi9d7isR3Hw5Ktwae0/z5hnzdnqEaZ85LdoMMbM7LfOhMtQkF
	qY6cdnRfPe4xUqgCwp2b7bHG04qGT40=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-58-noSIlzTgNoiCFvwCEG5iYw-1; Fri, 06 Oct 2023 21:03:40 -0400
X-MC-Unique: noSIlzTgNoiCFvwCEG5iYw-1
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-59f8134eb83so42215837b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Oct 2023 18:03:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696640619; x=1697245419;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y+T/mKnKjirLmHdpNj5uezoOUyhga1RZHqElb3N4/ps=;
        b=QzIrYR9MfCQyYi+X0OlfNi19nYZ6vHXWGg7l9mXmnRuV/Lk1QmdTkLHiQuU3EGDqtc
         y78shQTixwzltWRrQ3B0j+gpr6dG8k+IsEk79a7RU13Drqa5Bvd/mB4TCvAH7bpC2Tcb
         T5tTyJXWpnfAhXulQCaWFJee6VltBUcFxi8+kQL8hqtYVyOjzJ6PmC06imgjZNrsacxO
         8M29bDIEPmsK/aXbbmoFZLBD8a1LljGD9e3toKViKwNL9AaFvBIguk6wciHS3uZj9QO0
         2VhPsQJeQplKTOE4oNb42TIac/95bw4vH8yOECMytUXOKE1foncNRfHZpLsSpMjl5245
         ex+A==
X-Gm-Message-State: AOJu0YylG2+MzvZGR/JnhvjClMctfQfUp95jOCUhWVO1PJ2RZfPhEvnx
	u0hCbspJbOVwydFovPxY6zoOZwhh2Okq+Or2kPQ9mWg2PnFNfM5xdoFN5r3XIcguuaSAPNFbvFQ
	RlfLZNz/97rDj4tWmfsSM8+TweHQyWTtRknEMZSUpkg==
X-Received: by 2002:a25:858b:0:b0:d89:47d6:b4fb with SMTP id x11-20020a25858b000000b00d8947d6b4fbmr9075144ybk.63.1696640619561;
        Fri, 06 Oct 2023 18:03:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFu72OQB2GOaeoMfkhWpRdERZD9QWvuaGiH6xOsPe4dI0JUFitLHSudGHqUuOj92U9zFjGD/rCvvVRUMPLX7Cw=
X-Received: by 2002:a25:858b:0:b0:d89:47d6:b4fb with SMTP id
 x11-20020a25858b000000b00d8947d6b4fbmr9075136ybk.63.1696640619314; Fri, 06
 Oct 2023 18:03:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230925075348.16654-1-piliu@redhat.com> <20230925075348.16654-5-piliu@redhat.com>
 <zuptut5gbcd3cyaphv5axgrqrful2knkzkmxxjslgtgb75n6yi@l5ndw6ajw6im>
In-Reply-To: <zuptut5gbcd3cyaphv5axgrqrful2knkzkmxxjslgtgb75n6yi@l5ndw6ajw6im>
From: Pingfan Liu <piliu@redhat.com>
Date: Sat, 7 Oct 2023 09:03:28 +0800
Message-ID: <CAF+s44Ty9r5zRjDRrXAUJk4Tb97EUsuTHKnhrWGw2BtVbnd=DQ@mail.gmail.com>
Subject: Re: [PATCHv7 4/4] powerpc/setup: alloc extra paca_ptrs to hold boot_cpuid
To: mahesh@linux.ibm.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: Baoquan He <bhe@redhat.com>, kexec@lists.infradead.org, Ming Lei <ming.lei@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, Wen Xiong <wenxiong@us.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 4, 2023 at 2:07=E2=80=AFAM Mahesh J Salgaonkar <mahesh@linux.ib=
m.com> wrote:
>
> On 2023-09-25 15:53:48 Mon, Pingfan Liu wrote:
> > paca_ptrs should be large enough to hold the boot_cpuid, hence, its
> > lower boundary is set to the bigger one between boot_cpuid+1 and
> > nr_cpus.
> >
> > On the other hand, some kernel component: -1. the timer assumes cpu0
> > online since the timer_list->flags subfield 'TIMER_CPUMASK' is zero if
> > not initialized to a proper present cpu.  -2. power9_idle_stop() assume=
s
> > the primary thread's paca is allocated.
> >
> > Hence lift nr_cpu_ids from one to two to ensure cpu0 is onlined, if the
> > boot cpu is not cpu0.
> >
> > Result:
> > When nr_cpus=3D1, taskset -c 14 bash -c 'echo c > /proc/sysrq-trigger'
> > the kdump kernel brings up two cpus.
> > While when taskset -c 4 bash -c 'echo c > /proc/sysrq-trigger',
> > the kdump kernel brings up one cpu.
>
> I tried your changes on power9 and power10 systems. However, on power10 l=
par I
> see bellow backtrace in kdump kernel bootup with nr_cpus=3D1.
>

Thanks for the testing. I have only tried this series on Power9 bare
metal.  I think the bug is related with the code snippet in
update_mask_from_threadgroup()
  for (i =3D first_thread; i < first_thread + threads_per_core; i++) {
    int i_group_start =3D get_cpu_thread_group_start(i, tg);
                                  ^^^

Here it iterates over each thread in the core, but some of them are not onl=
ine.

I will try to bring up a remedy.

Thanks,

Pingfan


> $ taskset -c 4 bash -c 'echo c > /proc/sysrq-trigger'
> [...]
> [    0.000000] Hardware name: IBM,9105-22A POWER10 (raw) 0x800200 0xf0000=
06 of:IBM,FW1040.00 (NL1040_005) hv:phyp pSeries
> [    0.000000] printk: bootconsole [udbg0] enabled
> [    0.000000] the round shift between dt seq and the cpu logic number: 8
> [    0.000000] Partition configured for 16 cpus, operating system maximum=
 is 2.
> [    0.000000] CPU maps initialized for 8 threads per core
> [...]
> [    0.002249] BUG: Unable to handle kernel data access at 0x888888888888=
88c0
> [    0.002260] Faulting instruction address: 0xc00000001201226c
> [    0.002268] Oops: Kernel access of bad area, sig: 11 [#1]
> [    0.002274] LE PAGE_SIZE=3D64K MMU=3DRadix SMP NR_CPUS=3D2048 NUMA pSe=
ries
> [    0.002282] Modules linked in:
> [    0.002288] CPU: 4 PID: 1 Comm: swapper/4 Not tainted 6.6.0-rc4 #1
> [    0.002296] Hardware name: IBM,9105-22A POWER10 (raw) 0x800200 0xf0000=
06 of:IBM,FW1040.00 (NL1040_005) hv:phyp pSeries
> [    0.002305] NIP:  c00000001201226c LR: c000000012012234 CTR: 000000000=
0000004
> [    0.002312] REGS: c0000000167ff8f0 TRAP: 0380   Not tainted  (6.6.0-rc=
4)
> [    0.002321] MSR:  8000000002009033 <SF,VEC,EE,ME,IR,DR,RI,LE>  CR: 240=
00844  XER: 0000000a
> [    0.002346] CFAR: c00000001201231c IRQMASK: 0
> [    0.002346] GPR00: c000000012012234 c0000000167ffb90 c000000011b61900 =
0000000000000002
> [    0.002346] GPR04: 0000000000000000 0000000000000001 0000000000000001 =
c00000004ffeff80
> [    0.002346] GPR08: 0000000000000000 8888888888888888 0000000000000002 =
0000000000000000
> [    0.002346] GPR12: 0000000000000000 c000000013141000 c000000010011058 =
0000000000000000
> [    0.002346] GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000
> [    0.002346] GPR20: 0000000000000028 c000000012170968 c0000000120a3e80 =
0000000000000016
> [    0.002346] GPR24: c00000004ffdcfd0 0000000000000000 c000000012b82058 =
0000000000000000
> [    0.002346] GPR28: c00000004fc80a68 c000000012bf0350 c0000000120a3e2c =
0000000000000000
> [    0.002426] NIP [c00000001201226c] update_mask_from_threadgroup+0x98/0=
x174
> [    0.002437] LR [c000000012012234] update_mask_from_threadgroup+0x60/0x=
174
> [    0.002444] Call Trace:
> [    0.002451] [c0000000167ffb90] [c000000012012234] update_mask_from_thr=
eadgroup+0x60/0x174 (unreliable)
> [    0.002464] [c0000000167ffbe0] [c0000000120125f8] init_thread_group_ca=
che_map+0x2b0/0x328
> [    0.002477] [c0000000167ffc50] [c00000001201296c] smp_prepare_cpus+0x2=
fc/0x4f0
> [    0.002497] [c0000000167ffd10] [c000000012004e40] kernel_init_freeable=
+0x198/0x3cc
> [    0.002509] [c0000000167ffde0] [c000000010011084] kernel_init+0x34/0x1=
b0
> [    0.002531] [c0000000167ffe50] [c00000001000dd3c] ret_from_kernel_user=
_thread+0x14/0x1c
> [    0.002547] --- interrupt: 0 at 0x0
> [    0.002553] NIP:  0000000000000000 LR: 0000000000000000 CTR: 000000000=
0000000
> [    0.002563] REGS: c0000000167ffe80 TRAP: 0000   Not tainted  (6.6.0-rc=
4)
> [    0.002569] MSR:  0000000000000000 <>  CR: 00000000  XER: 00000000
> [    0.002576] CFAR: 0000000000000000 IRQMASK: 0
> [    0.002576] GPR00: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000
> [    0.002576] GPR04: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000
> [    0.002576] GPR08: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000
> [    0.002576] GPR12: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000
> [    0.002576] GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000
> [    0.002576] GPR20: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000
> [    0.002576] GPR24: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000
> [    0.002576] GPR28: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000
> [    0.002671] NIP [0000000000000000] 0x0
> [    0.002680] LR [0000000000000000] 0x0
> [    0.002689] --- interrupt: 0
> [    0.002697] Code: 7feafb78 813d0000 7d29fa14 7f895000 409d00d4 3ce2010=
2 38e74758 79491f24 e87e0006 39000000 e8e70000 7d27482a <a8890038> 7f834000=
 79090020 419e005c
> [    0.002727] ---[ end trace 0000000000000000 ]---
> [    0.002739]
> [    1.002749] Kernel panic - not syncing: Fatal exception
> [    1.002795] Rebooting in 10 seconds..
>
> Thanks,
> -Mahesh.
>
> >
> > Signed-off-by: Pingfan Liu <piliu@redhat.com>
> > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > Cc: Nicholas Piggin <npiggin@gmail.com>
> > Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> > Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> > Cc: Wen Xiong <wenxiong@us.ibm.com>
> > Cc: Baoquan He <bhe@redhat.com>
> > Cc: Ming Lei <ming.lei@redhat.com>
> > Cc: kexec@lists.infradead.org
> > To: linuxppc-dev@lists.ozlabs.org
> > ---
> >  arch/powerpc/kernel/paca.c | 10 ++++++----
> >  arch/powerpc/kernel/prom.c |  9 ++++++---
> >  2 files changed, 12 insertions(+), 7 deletions(-)
> >
> > diff --git a/arch/powerpc/kernel/paca.c b/arch/powerpc/kernel/paca.c
> > index cda4e00b67c1..91e2401de1bd 100644
> > --- a/arch/powerpc/kernel/paca.c
> > +++ b/arch/powerpc/kernel/paca.c
> > @@ -242,9 +242,10 @@ static int __initdata paca_struct_size;
> >
> >  void __init allocate_paca_ptrs(void)
> >  {
> > -     paca_nr_cpu_ids =3D nr_cpu_ids;
> > +     int n =3D (boot_cpuid + 1) > nr_cpu_ids ? (boot_cpuid + 1) : nr_c=
pu_ids;
> >
> > -     paca_ptrs_size =3D sizeof(struct paca_struct *) * nr_cpu_ids;
> > +     paca_nr_cpu_ids =3D n;
> > +     paca_ptrs_size =3D sizeof(struct paca_struct *) * n;
> >       paca_ptrs =3D memblock_alloc_raw(paca_ptrs_size, SMP_CACHE_BYTES)=
;
> >       if (!paca_ptrs)
> >               panic("Failed to allocate %d bytes for paca pointers\n",
> > @@ -287,13 +288,14 @@ void __init allocate_paca(int cpu)
> >  void __init free_unused_pacas(void)
> >  {
> >       int new_ptrs_size;
> > +     int n =3D (boot_cpuid + 1) > nr_cpu_ids ? (boot_cpuid + 1) : nr_c=
pu_ids;
> >
> > -     new_ptrs_size =3D sizeof(struct paca_struct *) * nr_cpu_ids;
> > +     new_ptrs_size =3D sizeof(struct paca_struct *) * n;
> >       if (new_ptrs_size < paca_ptrs_size)
> >               memblock_phys_free(__pa(paca_ptrs) + new_ptrs_size,
> >                                  paca_ptrs_size - new_ptrs_size);
> >
> > -     paca_nr_cpu_ids =3D nr_cpu_ids;
> > +     paca_nr_cpu_ids =3D n;
> >       paca_ptrs_size =3D new_ptrs_size;
> >
> >  #ifdef CONFIG_PPC_64S_HASH_MMU
> > diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
> > index 87272a2d8c10..15c994f54bf9 100644
> > --- a/arch/powerpc/kernel/prom.c
> > +++ b/arch/powerpc/kernel/prom.c
> > @@ -362,9 +362,12 @@ static int __init early_init_dt_scan_cpus(unsigned=
 long node,
> >                        */
> >                       boot_cpuid =3D i;
> >                       found =3D true;
> > -                     /* This works around the hole in paca_ptrs[]. */
> > -                     if (nr_cpu_ids < nthreads)
> > -                             set_nr_cpu_ids(nthreads);
> > +                     /*
> > +                      * Ideally, nr_cpus=3D1 can be achieved if each k=
ernel
> > +                      * component does not assume cpu0 is onlined.
> > +                      */
> > +                     if (boot_cpuid !=3D 0 && nr_cpu_ids < 2)
> > +                             set_nr_cpu_ids(2);
> >               }
> >  #ifdef CONFIG_SMP
> >               /* logical cpu id is always 0 on UP kernels */
> > --
> > 2.31.1
> >
>
> --
> Mahesh J Salgaonkar
>

