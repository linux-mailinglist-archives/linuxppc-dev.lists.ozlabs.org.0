Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E07F3EBF52
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Aug 2021 03:24:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GmjQN6NLnz3cX7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Aug 2021 11:24:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=l3EWvdYz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b34;
 helo=mail-yb1-xb34.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=l3EWvdYz; dkim-atps=neutral
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GmjPf3nGVz30Gv
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Aug 2021 11:24:05 +1000 (AEST)
Received: by mail-yb1-xb34.google.com with SMTP id k65so22085330yba.13
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Aug 2021 18:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0+X64VzIPb21En6dTcnTdpLK7TP4EUwZT5ZJiSW+nPk=;
 b=l3EWvdYz07hq1SQGuay8alsy4Py1mhUsq63jrfj7zfi0Sc2sg3tN3NuXQGUzj9R+qe
 Ujie8UKliJMIWTFXMw1nCGp9K5lpTIkRjFQXfkaiKqwVTAB/zKsXyntTMhKTLtNmqON0
 /gytNctpWekEIbBKdM7JVBqjdOQJZ7+faYPhrCQLWzBAAjp6buzW3ivnnIZmuZUEWvLa
 oYmDWIcLDyTSe9Rb6oHQMydiNHyXZp6jISExv+7CyGVgXcQwTwWybu7YfZ2tR2ZANzHO
 any/cgjrLq6GAcn94WUNQZiDCUwT42dSsA4ayu+enBZHK/ssHQiYka9acu7TG9FomInF
 rJPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0+X64VzIPb21En6dTcnTdpLK7TP4EUwZT5ZJiSW+nPk=;
 b=nC9E4rjaej/60RnuNAWtXrvzYXEip8mL2ERT26zaF5by3DVGT0Ap6rJpz2ItzVF4Wb
 QyAmig0TtnuXWekDvRg9la6foH8hWfPwF45Nh9ttWqu6IWS8iBGMIA4bxrp4UMuKl0cU
 FsxnlcEYj0pvd860ukmXmS4wus9NhWCKQ9i1UY49c3Z1Nbglzh4ldo+XN26oJX9SUPg+
 p0aauHCKeuDuaTybn/f1TNmGbwFBuvOKukGiJNiR8eKn6rWaNBx0TZRi27du/Ih82/+3
 Vr5BRQUhM9oum0gEZwqOiO1Omddzee+kEES/ukwG3vmbW9SWV9Nnuy8W03xytNdzIuTE
 08IQ==
X-Gm-Message-State: AOAM532vh8wEc7ioZpPuqFFyO6s3TuG2ZGvZaC8l1T+gxfxYFiWF0C6L
 cApkOkvkx/+tz0ZXeTux71p3KRLmwyXtlLLaj1A=
X-Google-Smtp-Source: ABdhPJzEtqQfov5ECdn8dlk+TiLUPOXbD+SY1Txxlnn6oaZxK2RQ8Uk9rZV9eHv1Gt2fKqlUcCqK8Irpu7wBW7t2caM=
X-Received: by 2002:a25:b845:: with SMTP id b5mr6361417ybm.343.1628904239075; 
 Fri, 13 Aug 2021 18:23:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210609013431.9805-1-jniethe5@gmail.com>
 <20210609013431.9805-8-jniethe5@gmail.com>
 <f7624d58-80e1-6912-1867-7874f1a569f5@redhat.com>
 <8735rdt0i4.fsf@linux.ibm.com>
In-Reply-To: <8735rdt0i4.fsf@linux.ibm.com>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Sat, 14 Aug 2021 11:23:47 +1000
Message-ID: <CACzsE9pLgn+w=Ohx3gSaMxnZk8E2itmBPy_V2NVPrXjqL=Ef+Q@mail.gmail.com>
Subject: Re: [PATCH v15 7/9] powerpc: Set ARCH_HAS_STRICT_MODULE_RWX
To: Fabiano Rosas <farosas@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Laurent Vivier <lvivier@redhat.com>, ajd@linux.ibm.com,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, muriloo@linux.ibm.com,
 Greg Kurz <groug@kaod.org>, Nicholas Piggin <npiggin@gmail.com>,
 cmr@codefail.de, kvm-ppc@vger.kernel.org, naveen.n.rao@linux.ibm.com,
 David Gibson <david@gibson.dropbear.id.au>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Aug 14, 2021 at 8:59 AM Fabiano Rosas <farosas@linux.ibm.com> wrote:
>
> Laurent Vivier <lvivier@redhat.com> writes:
>
> >
> > since this patch is merged my VM is experiencing a crash at boot (20% of the time):
> >
> > [    8.496850] kernel tried to execute exec-protected page (c008000004073278) - exploit
> > attempt? (uid: 0)
> > [    8.496921] BUG: Unable to handle kernel instruction fetch
> > [    8.496954] Faulting instruction address: 0xc008000004073278
> > [    8.496994] Oops: Kernel access of bad area, sig: 11 [#1]
> > [    8.497028] LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA pSeries
> > [    8.497071] Modules linked in: drm virtio_console fuse drm_panel_orientation_quirks xfs
> > libcrc32c virtio_net net_failover virtio_blk vmx_crypto failover dm_mirror dm_region_hash
> > dm_log dm_mod
> > [    8.497186] CPU: 3 PID: 44 Comm: kworker/3:1 Not tainted 5.14.0-rc4+ #12
> > [    8.497228] Workqueue: events control_work_handler [virtio_console]
> > [    8.497272] NIP:  c008000004073278 LR: c008000004073278 CTR: c0000000001e9de0
> > [    8.497320] REGS: c00000002e4ef7e0 TRAP: 0400   Not tainted  (5.14.0-rc4+)
> > [    8.497361] MSR:  800000004280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 24002822
> > XER: 200400cf
> > [    8.497426] CFAR: c0000000001e9e44 IRQMASK: 1
> > [    8.497426] GPR00: c008000004073278 c00000002e4efa80 c000000002a26b00 c000000042c39520
> > [    8.497426] GPR04: 0000000000000001 0000000000000000 0000000000000000 00000000000000ff
> > [    8.497426] GPR08: 0000000000000001 c000000042c39520 0000000000000001 c008000004076008
> > [    8.497426] GPR12: c0000000001e9de0 c0000001fffccb00 c00000000018ba88 c00000002c91d400
> > [    8.497426] GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> > [    8.497426] GPR20: 0000000000000000 0000000000000000 0000000000000000 c008000004080340
> > [    8.497426] GPR24: c0080000040a01e8 0000000000000000 0000000000000000 c00000002e0975c0
> > [    8.497426] GPR28: c00000002ce72940 c000000042c39520 0000000000000048 0000000000000038
> > [    8.497891] NIP [c008000004073278] fill_queue+0xf0/0x210 [virtio_console]
> > [    8.497934] LR [c008000004073278] fill_queue+0xf0/0x210 [virtio_console]
> > [    8.497976] Call Trace:
> > [    8.497993] [c00000002e4efa80] [c00800000407323c] fill_queue+0xb4/0x210
> > [virtio_console] (unreliable)
> > [    8.498052] [c00000002e4efae0] [c008000004073a90] add_port+0x1a8/0x470 [virtio_console]
> > [    8.498102] [c00000002e4efbb0] [c0080000040750f4] control_work_handler+0xbc/0x1e8
> > [virtio_console]
> > [    8.498160] [c00000002e4efc60] [c00000000017f4f0] process_one_work+0x290/0x590
> > [    8.498212] [c00000002e4efd00] [c00000000017f878] worker_thread+0x88/0x620
> > [    8.498256] [c00000002e4efda0] [c00000000018bc14] kthread+0x194/0x1a0
> > [    8.498299] [c00000002e4efe10] [c00000000000cf54] ret_from_kernel_thread+0x5c/0x64
> > [    8.498349] Instruction dump:
> > [    8.498374] 7da96b78 a14d0c8a 419c00b0 2f8a0000 419eff88 b32d0c8a 7c0004ac 4bffff7c
> > [    8.498430] 60000000 60000000 7fa3eb78 48002d95 <e8410018> 38600000 480025e1 e8410018
> > [    8.498485] ---[ end trace 16ee10903290b647 ]---
> > [    8.501433]
> > [    9.502601] Kernel panic - not syncing: Fatal exception
> >
> > add_port+0x1a8/0x470 :
> >
> >   1420
> >   1421                /* We can safely ignore ENOSPC because it means
> >   1422                 * the queue already has buffers. Buffers are removed
> >   1423                 * only by virtcons_remove(), not by unplug_port()
> >   1424                 */
> > ->1425                err = fill_queue(port->in_vq, &port->inbuf_lock);
> >   1426                if (err < 0 && err != -ENOSPC) {
> >   1427                        dev_err(port->dev, "Error allocating inbufs\n");
> >   1428                        goto free_device;
> >   1429                }
> >
> > fill_queue+0x90/0x210 :
> >
> >   1326        static int fill_queue(struct virtqueue *vq, spinlock_t *lock)
> >   1327        {
> >   1328                struct port_buffer *buf;
> >   1329                int nr_added_bufs;
> >   1330                int ret;
> >   1331
> >   1332                nr_added_bufs = 0;
> >   1333                do {
> >   1334                        buf = alloc_buf(vq->vdev, PAGE_SIZE, 0);
> >   1335                        if (!buf)
> >   1336                                return -ENOMEM;
> >   1337
> > ->1338                        spin_lock_irq(lock);
> >
> > I'm using an upstream kernel (5.14-rc4, 251a1524293d) in the VM.
> >
> > My host is a RHEL 8.5/POWER9: qemu-kvm-6.0.0-21 and kernel-4.18.0-325
> >
> > My qemu command line is:
> >
> > /usr/libexec/qemu-kvm \
> > -M pseries,accel=kvm \
> > -nographic -nodefaults \
> > -device virtio-serial-pci \
> > -device virtconsole \
> > -device virtio-net-pci,mac=9a:2b:2c:2d:2e:2f,netdev=hostnet0  \
> > -blockdev
> > node-name=disk1,file.driver=file,driver=qcow2,file.driver=file,file.filename=disk.qcow2 \
> > -netdev bridge,id=hostnet0,br=virbr0,helper=/usr/libexec/qemu-bridge-helper \
> > -device virtio-blk-pci,id=image1,drive=disk1 \
> > -m 8192  \
> > -smp 4 \
> > -serial mon:stdio
> >
> >
> > Do we need something in qemu/kvm to support STRICT_MODULE_RWX ?
> >
> > Thanks,
> > Laurent
>
> This patch survived 300 consecutive runs without the issue:
>
> diff --git a/arch/powerpc/mm/pageattr.c b/arch/powerpc/mm/pageattr.c
> index 0876216ceee6..7aeb2b62e5dc 100644
> --- a/arch/powerpc/mm/pageattr.c
> +++ b/arch/powerpc/mm/pageattr.c
> @@ -35,10 +35,7 @@ static int change_page_attr(pte_t *ptep, unsigned long addr, void *data)
>         pte_t pte;
>
>         spin_lock(&init_mm.page_table_lock);
> -
> -       /* invalidate the PTE so it's safe to modify */
> -       pte = ptep_get_and_clear(&init_mm, addr, ptep);
> -       flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
> +       pte = *ptep;
>
>         /* modify the PTE bits as desired, then apply */
>         switch (action) {
> @@ -60,10 +57,7 @@ static int change_page_attr(pte_t *ptep, unsigned long addr, void *data)
>         }
>
>         set_pte_at(&init_mm, addr, ptep, pte);
> -
> -       /* See ptesync comment in radix__set_pte_at() */
> -       if (radix_enabled())
> -               asm volatile("ptesync": : :"memory");
> +       flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
>         spin_unlock(&init_mm.page_table_lock);
>
>         return 0;
> ---
>
> What I think is happening is that the virtio_console code is running
> at the same time we are doing the `module_enable_ro` at the end of
> `do_init_module` due to the async nature of the work handler. There is
> a window after the TLB flush when the PTE has its permission bits
> cleared, so any translations of the module code page attempted during
> that window will fault.

Thanks for looking at this. I agree that this is the problem.
This avoids the crash (not a proper solution):

--- a/kernel/module.c
+++ b/kernel/module.c
@@ -2011,13 +2011,15 @@ static void module_enable_ro(const struct
module *mod, bool after_init)
        if (!rodata_enabled)
                return;

-       set_vm_flush_reset_perms(mod->core_layout.base);
-       set_vm_flush_reset_perms(mod->init_layout.base);
-       frob_text(&mod->core_layout, set_memory_ro);
-
-       frob_rodata(&mod->core_layout, set_memory_ro);
-       frob_text(&mod->init_layout, set_memory_ro);
-       frob_rodata(&mod->init_layout, set_memory_ro);
+       if (!after_init) {
+               set_vm_flush_reset_perms(mod->core_layout.base);
+               set_vm_flush_reset_perms(mod->init_layout.base);
+               frob_text(&mod->core_layout, set_memory_ro);
+
+               frob_rodata(&mod->core_layout, set_memory_ro);
+               frob_text(&mod->init_layout, set_memory_ro);
+               frob_rodata(&mod->init_layout, set_memory_ro);
+       }

>
> I'm ignorant of strict rwx in general so I don't see why we need to
> clear the bits before setting them to their final value, but as I
> understand it, the set_pte_at + flush_tlb_kernel_range satisfy the ISA
> requirement of [ptesync; tlbie; eieio; tlbsync; ptesync;] so it seems
> like the patch should work.
I believe it's done like that because ISA 6.10.1.2 Modifying a
Translation Table Entry -
"The sequence is equivalent to deleting the PTE and then adding a new one".
In that sequence, I think it is [set pte to 0; ptesync; tlbie; eieio;
tlbsync; ptesync;]

But it does seem like we need to do something like your patch for
change_page_attr() to work as expected.
>
> Now, I cannot explain why the crash always happens around the code
> that does the module's symbols relocation (the NIP in Laurent's trace
> is the TOC reload from module_64.c:restore_r2). Maybe because
> instructions are already in icache until the first branch into the
> stub?
Yeah, mpe thought it might be some cache effect of a branch instruction.
From time to time I did see Oopses like this (not "kernel tried to
execute exec-protected page")

[  124.986964][   T52] Oops: Kernel access of bad area, sig: 11 [#1]
[  124.987043][   T52] LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA pSeries
[  124.987095][   T52] Modules linked in: virtio_console binfmt_misc
virtiofs fuse virtio_net virtio_blk virtio_pci virtio_pci_modern_dev
virtio_ring virtio crc32c_vpmsum [last unloaded: virtio_console]
[  124.987209][   T52] CPU: 2 PID: 52 Comm: kworker/2:1 Not tainted
5.14.0-rc4 #4
[  124.987259][   T52] Workqueue: events control_work_handler [virtio_console]
[  124.987307][   T52] NIP:  c008000001a86044 LR: c008000001a82cf8
CTR: c00000000042a6c0
[  124.987358][   T52] REGS: c00000000b273770 TRAP: 0300   Not tainted
 (5.14.0-rc4)
[  124.987406][   T52] MSR:  800000000280b033
<SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 82002882  XER: 00000004
[  124.987475][   T52] CFAR: c008000001a82cf4 DAR: c008000001a86058
DSISR: 40000000 IRQMASK: 0
[  124.987475][   T52] GPR00: c008000001a82ce8 c00000000b273a10
c008000001ab8000 c000000010731320
[  124.987475][   T52] GPR04: 0000000000000001 0000000000000000
0000000000000000 0000000000000000
[  124.987475][   T52] GPR08: 0000000000000000 0000000000000000
0000000000000000 c008000001a86038
[  124.987475][   T52] GPR12: 0000000022002884 c0000001ffffdf00
c000000000169ae8 c0000000037700c0
[  124.987475][   T52] GPR16: 0000000000000000 0000000000000000
c000000021af0000 c000000003313900
[  124.987475][   T52] GPR20: 0000000000000001 0000000000000000
0000000000000000 c000000003316780
[  124.987475][   T52] GPR24: c008000001a90288 0000000000000000
0000000000000000 c000000010731320
[  124.987475][   T52] GPR28: c000000003316900 0000000000000018
0000000000000068 c00000000379c5a0
[  124.988028][   T52] NIP [c008000001a86044] fini+0x824/0xa7e0 [virtio_console]
[  124.988085][   T52] LR [c008000001a82cf8] fill_queue+0xb0/0x230
[virtio_console]
[  124.988141][   T52] Call Trace:
[  124.988171][   T52] [c00000000b273a10] [c008000001a82ce8]
fill_queue+0xa0/0x230 [virtio_console] (unreliable)
[  124.988246][   T52] [c00000000b273aa0] [c008000001a83208]
add_port.isra.0+0x1a0/0x4b0 [virtio_console]
[  124.988312][   T52] [c00000000b273b70] [c008000001a85474]
control_work_handler+0x46c/0x654 [virtio_console]
[  124.988403][   T52] [c00000000b273c70] [c00000000015ce60]
process_one_work+0x2a0/0x570
[  124.988586][   T52] [c00000000b273d10] [c00000000015d1d8]
worker_thread+0xa8/0x660
[  124.988684][   T52] [c00000000b273da0] [c000000000169c5c] kthread+0x17c/0x190
[  124.988762][   T52] [c00000000b273e10] [c00000000000cf54]
ret_from_kernel_thread+0x5c/0x64
[  124.988916][   T52] Instruction dump:
[  124.988965][   T52] 396be010 f8410018 e98b0020 7d8903a6 4e800420
00000000 73747562 003a0300
[  124.989152][   T52] c0000000 3d62fffd 396be038 f8410018 <e98b0020>
7d8903a6 4e800420 00000000
[  124.989298][   T52] ---[ end trace ab9046c024eb3154 ]---

I guess it depends on the timing of which pte is invalidated.
>
> Anyway, this is what Murilo and I found out over our debugging session
> in the past couple of days. I hope it helps. =)
Yes it does, thanks heaps.
>
