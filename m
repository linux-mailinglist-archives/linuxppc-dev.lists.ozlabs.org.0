Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB863EBE6D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Aug 2021 01:00:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GmfCX5rYSz3cVr
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Aug 2021 09:00:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Kx1Sokru;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Kx1Sokru; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GmfBn0Ycvz3bPV
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Aug 2021 08:59:28 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17DMZHTJ022255; Fri, 13 Aug 2021 18:59:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=+LU0JC0OH8wdlQAidWtisOjSGsT8zxXXZZjrK/lu1qs=;
 b=Kx1SokruvHO+kZsDNYmNiUxYr3JLJEar/1/uokNwlfSYRTR8URjlFJCrY+isSAEJ5iGw
 RBXGf2Mt1zmOGL4cPWdB2vH/oupXdWO/ZJ35ob5DtZ5E6Ebdomr38z1GKPOY/Gw4t+lL
 AVGR53sCSVuSvNl+DEmIOlEo0oUjYnRyVW7j7QQ4C0cgnKzxMGwc3x7BsWDBRkmIK9xK
 FoJSZSs2nc9Zf7tyv9vBUDRb0OHoEVXKm8l9sdbK8o0N56VW60hEC+twbKOz7DrzGNiy
 rRJ9a+iP5vmPUjDJbVWGaqWOGUaAR+RW1xstK9McE84jWK5ZfHStjsb9pPDxvylyO879 lg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3adsf45hab-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Aug 2021 18:59:05 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17DMaJ7h027454;
 Fri, 13 Aug 2021 18:59:05 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3adsf45ha2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Aug 2021 18:59:04 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17DMvZMK028019;
 Fri, 13 Aug 2021 22:59:04 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma02dal.us.ibm.com with ESMTP id 3a9htjf6hq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Aug 2021 22:59:04 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17DMx2fm48300442
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 13 Aug 2021 22:59:02 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 75EF6BE04F;
 Fri, 13 Aug 2021 22:59:02 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D5B1FBE053;
 Fri, 13 Aug 2021 22:59:01 +0000 (GMT)
Received: from localhost (unknown [9.211.46.37])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Fri, 13 Aug 2021 22:59:01 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Laurent Vivier <lvivier@redhat.com>, Jordan Niethe <jniethe5@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v15 7/9] powerpc: Set ARCH_HAS_STRICT_MODULE_RWX
In-Reply-To: <f7624d58-80e1-6912-1867-7874f1a569f5@redhat.com>
References: <20210609013431.9805-1-jniethe5@gmail.com>
 <20210609013431.9805-8-jniethe5@gmail.com>
 <f7624d58-80e1-6912-1867-7874f1a569f5@redhat.com>
Date: Fri, 13 Aug 2021 19:58:59 -0300
Message-ID: <8735rdt0i4.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: kqC0rpjbEdUQY3HwpruQNEnbaw08Udj5
X-Proofpoint-GUID: Vizkp80HeT6cjZOwO8LqTonAMeJPSraA
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-13_09:2021-08-13,
 2021-08-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 spamscore=0 lowpriorityscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108130132
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
Cc: ajd@linux.ibm.com, aneesh.kumar@linux.ibm.com, muriloo@linux.ibm.com,
 Greg Kurz <groug@kaod.org>, npiggin@gmail.com, cmr@codefail.de,
 kvm-ppc@vger.kernel.org, naveen.n.rao@linux.ibm.com,
 David Gibson <david@gibson.dropbear.id.au>, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Laurent Vivier <lvivier@redhat.com> writes:

>
> since this patch is merged my VM is experiencing a crash at boot (20% of the time):
>
> [    8.496850] kernel tried to execute exec-protected page (c008000004073278) - exploit
> attempt? (uid: 0)
> [    8.496921] BUG: Unable to handle kernel instruction fetch
> [    8.496954] Faulting instruction address: 0xc008000004073278
> [    8.496994] Oops: Kernel access of bad area, sig: 11 [#1]
> [    8.497028] LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA pSeries
> [    8.497071] Modules linked in: drm virtio_console fuse drm_panel_orientation_quirks xfs
> libcrc32c virtio_net net_failover virtio_blk vmx_crypto failover dm_mirror dm_region_hash
> dm_log dm_mod
> [    8.497186] CPU: 3 PID: 44 Comm: kworker/3:1 Not tainted 5.14.0-rc4+ #12
> [    8.497228] Workqueue: events control_work_handler [virtio_console]
> [    8.497272] NIP:  c008000004073278 LR: c008000004073278 CTR: c0000000001e9de0
> [    8.497320] REGS: c00000002e4ef7e0 TRAP: 0400   Not tainted  (5.14.0-rc4+)
> [    8.497361] MSR:  800000004280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 24002822
> XER: 200400cf
> [    8.497426] CFAR: c0000000001e9e44 IRQMASK: 1
> [    8.497426] GPR00: c008000004073278 c00000002e4efa80 c000000002a26b00 c000000042c39520
> [    8.497426] GPR04: 0000000000000001 0000000000000000 0000000000000000 00000000000000ff
> [    8.497426] GPR08: 0000000000000001 c000000042c39520 0000000000000001 c008000004076008
> [    8.497426] GPR12: c0000000001e9de0 c0000001fffccb00 c00000000018ba88 c00000002c91d400
> [    8.497426] GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> [    8.497426] GPR20: 0000000000000000 0000000000000000 0000000000000000 c008000004080340
> [    8.497426] GPR24: c0080000040a01e8 0000000000000000 0000000000000000 c00000002e0975c0
> [    8.497426] GPR28: c00000002ce72940 c000000042c39520 0000000000000048 0000000000000038
> [    8.497891] NIP [c008000004073278] fill_queue+0xf0/0x210 [virtio_console]
> [    8.497934] LR [c008000004073278] fill_queue+0xf0/0x210 [virtio_console]
> [    8.497976] Call Trace:
> [    8.497993] [c00000002e4efa80] [c00800000407323c] fill_queue+0xb4/0x210
> [virtio_console] (unreliable)
> [    8.498052] [c00000002e4efae0] [c008000004073a90] add_port+0x1a8/0x470 [virtio_console]
> [    8.498102] [c00000002e4efbb0] [c0080000040750f4] control_work_handler+0xbc/0x1e8
> [virtio_console]
> [    8.498160] [c00000002e4efc60] [c00000000017f4f0] process_one_work+0x290/0x590
> [    8.498212] [c00000002e4efd00] [c00000000017f878] worker_thread+0x88/0x620
> [    8.498256] [c00000002e4efda0] [c00000000018bc14] kthread+0x194/0x1a0
> [    8.498299] [c00000002e4efe10] [c00000000000cf54] ret_from_kernel_thread+0x5c/0x64
> [    8.498349] Instruction dump:
> [    8.498374] 7da96b78 a14d0c8a 419c00b0 2f8a0000 419eff88 b32d0c8a 7c0004ac 4bffff7c
> [    8.498430] 60000000 60000000 7fa3eb78 48002d95 <e8410018> 38600000 480025e1 e8410018
> [    8.498485] ---[ end trace 16ee10903290b647 ]---
> [    8.501433]
> [    9.502601] Kernel panic - not syncing: Fatal exception
>
> add_port+0x1a8/0x470 :
>
>   1420	
>   1421		/* We can safely ignore ENOSPC because it means
>   1422		 * the queue already has buffers. Buffers are removed
>   1423		 * only by virtcons_remove(), not by unplug_port()
>   1424		 */
> ->1425		err = fill_queue(port->in_vq, &port->inbuf_lock);
>   1426		if (err < 0 && err != -ENOSPC) {
>   1427			dev_err(port->dev, "Error allocating inbufs\n");
>   1428			goto free_device;
>   1429		}
>
> fill_queue+0x90/0x210 :
>
>   1326	static int fill_queue(struct virtqueue *vq, spinlock_t *lock)
>   1327	{
>   1328		struct port_buffer *buf;
>   1329		int nr_added_bufs;
>   1330		int ret;
>   1331	
>   1332		nr_added_bufs = 0;
>   1333		do {
>   1334			buf = alloc_buf(vq->vdev, PAGE_SIZE, 0);
>   1335			if (!buf)
>   1336				return -ENOMEM;
>   1337	
> ->1338			spin_lock_irq(lock);
>
> I'm using an upstream kernel (5.14-rc4, 251a1524293d) in the VM.
>
> My host is a RHEL 8.5/POWER9: qemu-kvm-6.0.0-21 and kernel-4.18.0-325
>
> My qemu command line is:
>
> /usr/libexec/qemu-kvm \
> -M pseries,accel=kvm \
> -nographic -nodefaults \
> -device virtio-serial-pci \
> -device virtconsole \
> -device virtio-net-pci,mac=9a:2b:2c:2d:2e:2f,netdev=hostnet0  \
> -blockdev
> node-name=disk1,file.driver=file,driver=qcow2,file.driver=file,file.filename=disk.qcow2 \
> -netdev bridge,id=hostnet0,br=virbr0,helper=/usr/libexec/qemu-bridge-helper \
> -device virtio-blk-pci,id=image1,drive=disk1 \
> -m 8192  \
> -smp 4 \
> -serial mon:stdio
>
>
> Do we need something in qemu/kvm to support STRICT_MODULE_RWX ?
>
> Thanks,
> Laurent

This patch survived 300 consecutive runs without the issue:

diff --git a/arch/powerpc/mm/pageattr.c b/arch/powerpc/mm/pageattr.c
index 0876216ceee6..7aeb2b62e5dc 100644
--- a/arch/powerpc/mm/pageattr.c
+++ b/arch/powerpc/mm/pageattr.c
@@ -35,10 +35,7 @@ static int change_page_attr(pte_t *ptep, unsigned long addr, void *data)
        pte_t pte;
 
        spin_lock(&init_mm.page_table_lock);
-
-       /* invalidate the PTE so it's safe to modify */
-       pte = ptep_get_and_clear(&init_mm, addr, ptep);
-       flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
+       pte = *ptep;
 
        /* modify the PTE bits as desired, then apply */
        switch (action) {
@@ -60,10 +57,7 @@ static int change_page_attr(pte_t *ptep, unsigned long addr, void *data)
        }
 
        set_pte_at(&init_mm, addr, ptep, pte);
-
-       /* See ptesync comment in radix__set_pte_at() */
-       if (radix_enabled())
-               asm volatile("ptesync": : :"memory");
+       flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
        spin_unlock(&init_mm.page_table_lock);
 
        return 0;
---

What I think is happening is that the virtio_console code is running
at the same time we are doing the `module_enable_ro` at the end of
`do_init_module` due to the async nature of the work handler. There is
a window after the TLB flush when the PTE has its permission bits
cleared, so any translations of the module code page attempted during
that window will fault.

I'm ignorant of strict rwx in general so I don't see why we need to
clear the bits before setting them to their final value, but as I
understand it, the set_pte_at + flush_tlb_kernel_range satisfy the ISA
requirement of [ptesync; tlbie; eieio; tlbsync; ptesync;] so it seems
like the patch should work.

Now, I cannot explain why the crash always happens around the code
that does the module's symbols relocation (the NIP in Laurent's trace
is the TOC reload from module_64.c:restore_r2). Maybe because
instructions are already in icache until the first branch into the
stub?

Anyway, this is what Murilo and I found out over our debugging session
in the past couple of days. I hope it helps. =)

