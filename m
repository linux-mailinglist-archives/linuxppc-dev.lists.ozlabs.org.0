Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E965228D482
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Oct 2020 21:35:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C9m3l3PLVzDqXv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Oct 2020 06:35:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=cai@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=FNgXRJI7; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=FNgXRJI7; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C9m285QzXzDqV3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Oct 2020 06:34:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602617645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UfHyRKdM1jXzcI1NNXnTrYnbxIcTJ4h5krO896K+oKo=;
 b=FNgXRJI7YkAOdIMIoyRlmX3fF1SD6uD9tPJrwYPIeXhmRf1u3hCw79hWQJLsQ5qZ5Af+tM
 CiC6v8LoNfI8DlNsWkBp20iS7WV6AK39C5fm6p7/VoeiV9R81YioCXz/HBE3P3aglPj7zp
 57VvVhjljcF3Cice1DD2CTFuOKIwjno=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602617645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UfHyRKdM1jXzcI1NNXnTrYnbxIcTJ4h5krO896K+oKo=;
 b=FNgXRJI7YkAOdIMIoyRlmX3fF1SD6uD9tPJrwYPIeXhmRf1u3hCw79hWQJLsQ5qZ5Af+tM
 CiC6v8LoNfI8DlNsWkBp20iS7WV6AK39C5fm6p7/VoeiV9R81YioCXz/HBE3P3aglPj7zp
 57VvVhjljcF3Cice1DD2CTFuOKIwjno=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-Eand1oZxM321DQw7eBawCA-1; Tue, 13 Oct 2020 15:34:02 -0400
X-MC-Unique: Eand1oZxM321DQw7eBawCA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C80C86ABCE;
 Tue, 13 Oct 2020 19:33:59 +0000 (UTC)
Received: from ovpn-118-16.rdu2.redhat.com (ovpn-118-16.rdu2.redhat.com
 [10.10.118.16])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1748A7512E;
 Tue, 13 Oct 2020 19:33:57 +0000 (UTC)
Message-ID: <90922c43c670e4b55e6cf421be19146333e2ae7b.camel@redhat.com>
Subject: Re: [PATCH v2] powerpc/pci: unmap legacy INTx interrupts when a PHB
 is removed
From: Qian Cai <cai@redhat.com>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, Michael Ellerman
 <mpe@ellerman.id.au>
Date: Tue, 13 Oct 2020 15:33:57 -0400
In-Reply-To: <fce8ffe1-521c-8344-c7ad-53550e408cdc@kaod.org>
References: <20200807101854.844619-1-clg@kaod.org>
 <9c5eca863c63e360662fae7597213e8927c2a885.camel@redhat.com>
 <fce8ffe1-521c-8344-c7ad-53550e408cdc@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, linux-kernel@vger.kernel.org,
 linux-next@vger.kernel.org, Oliver O'Halloran <oohall@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2020-09-23 at 09:06 +0200, Cédric Le Goater wrote:
> On 9/23/20 2:33 AM, Qian Cai wrote:
> > On Fri, 2020-08-07 at 12:18 +0200, Cédric Le Goater wrote:
> > > When a passthrough IO adapter is removed from a pseries machine using
> > > hash MMU and the XIVE interrupt mode, the POWER hypervisor expects the
> > > guest OS to clear all page table entries related to the adapter. If
> > > some are still present, the RTAS call which isolates the PCI slot
> > > returns error 9001 "valid outstanding translations" and the removal of
> > > the IO adapter fails. This is because when the PHBs are scanned, Linux
> > > maps automatically the INTx interrupts in the Linux interrupt number
> > > space but these are never removed.
> > > 
> > > To solve this problem, we introduce a PPC platform specific
> > > pcibios_remove_bus() routine which clears all interrupt mappings when
> > > the bus is removed. This also clears the associated page table entries
> > > of the ESB pages when using XIVE.
> > > 
> > > For this purpose, we record the logical interrupt numbers of the
> > > mapped interrupt under the PHB structure and let pcibios_remove_bus()
> > > do the clean up.
> > > 
> > > Since some PCI adapters, like GPUs, use the "interrupt-map" property
> > > to describe interrupt mappings other than the legacy INTx interrupts,
> > > we can not restrict the size of the mapping array to PCI_NUM_INTX. The
> > > number of interrupt mappings is computed from the "interrupt-map"
> > > property and the mapping array is allocated accordingly.
> > > 
> > > Cc: "Oliver O'Halloran" <oohall@gmail.com>
> > > Cc: Alexey Kardashevskiy <aik@ozlabs.ru>
> > > Signed-off-by: Cédric Le Goater <clg@kaod.org>
> > 
> > Some syscall fuzzing will trigger this on POWER9 NV where the traces pointed
> > to
> > this patch.
> > 
> > .config: https://gitlab.com/cailca/linux-mm/-/blob/master/powerpc.config
> 
> OK. The patch is missing a NULL assignement after kfree() and that
> might be the issue. 
> 
> I did try PHB removal under PowerNV, so I would like to understand 
> how we managed to remove twice the PCI bus and possibly reproduce. 
> Any chance we could grab what the syscall fuzzer (syzkaller) did ? 

Any update on this? Maybe Michael or Stephen could drop this for now, so our
fuzzing could continue to find something else new?

It can still be reproduced on today's linux-next. BTW, this is running trinity
from an unprivileged user. This is the snapshot of the each fuzzing thread when
this happens.

http://people.redhat.com/qcai/pcibios_remove_bus/trinity-post-mortem.log

It can be reproduced by simply keep running this for a while:

$ trinity -C <total number of CPUs> --arch 64

[19611.946827][T1717146] pci_bus 0035:03: busn_res: [bus 03-07] is released
[19611.950956][T1717146] pci_bus 0035:08: busn_res: [bus 08-0c] is released
[19611.951260][T1717146] =============================================================================
[19611.952336][T1717146] BUG kmalloc-16 (Tainted: G        W  O     ): Object already free
[19611.952365][T1717146] -----------------------------------------------------------------------------
[19611.952365][T1717146] 
[19611.952411][T1717146] Disabling lock debugging due to kernel taint
[19611.952438][T1717146] INFO: Allocated in pcibios_scan_phb+0x104/0x3e0 age=1960714 cpu=4 pid=1
[19611.952481][T1717146] 	__slab_alloc+0xa4/0xf0
[19611.952500][T1717146] 	__kmalloc+0x294/0x330
[19611.952519][T1717146] 	pcibios_scan_phb+0x104/0x3e0
[19611.952549][T1717146] 	pcibios_init+0x84/0x124
[19611.952578][T1717146] 	do_one_initcall+0xac/0x528
[19611.952599][T1717146] 	kernel_init_freeable+0x35c/0x3fc
[19611.952618][T1717146] 	kernel_init+0x24/0x148
[19611.952646][T1717146] 	ret_from_kernel_thread+0x5c/0x80
[19611.952665][T1717146] INFO: Freed in pcibios_remove_bus+0x70/0x90 age=0 cpu=16 pid=1717146
[19611.952691][T1717146] 	kfree+0x49c/0x510
[19611.952700][T1717146] 	pcibios_remove_bus+0x70/0x90
[19611.952711][T1717146] 	pci_remove_bus+0xe4/0x110
[19611.952730][T1717146] 	pci_remove_bus_device+0x74/0x170
[19611.952749][T1717146] 	pci_remove_bus_device+0x4c/0x170
[19611.952768][T1717146] 	pci_stop_and_remove_bus_device_locked+0x34/0x50
[19611.952798][T1717146] 	remove_store+0xc0/0xe0
[19611.952819][T1717146] 	dev_attr_store+0x30/0x50
[19611.952852][T1717146] 	sysfs_kf_write+0x68/0xb0
[19611.952870][T1717146] 	kernfs_fop_write+0x114/0x260
[19611.952904][T1717146] 	vfs_write+0xe4/0x260
[19611.952922][T1717146] 	ksys_write+0x74/0x130
[19611.952951][T1717146] 	system_call_exception+0xf8/0x1d0
[19611.952970][T1717146] 	system_call_common+0xe8/0x218
[19611.952990][T1717146] INFO: Slab 0x0000000099caaf22 objects=178 used=174 fp=0x00000000006a64b0 flags=0x7fff8000000201
[19611.953004][T1717146] INFO: Object 0x00000000f360132d @offset=30192 fp=0x0000000000000000
[19611.953004][T1717146] 
[19611.953048][T1717146] Redzone 00000000acef7298: bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb  ................
[19611.953080][T1717146] Object 00000000f360132d: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b a5  kkkkkkkkkkkkkkk.
[19611.953114][T1717146] Redzone 0000000083758aaa: bb bb bb bb bb bb bb bb                          ........
[19611.953146][T1717146] Padding 00000000cbb228a2: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
[19611.953189][T1717146] CPU: 16 PID: 1717146 Comm: trinity-c8 Tainted: G    B   W  O      5.9.0-next-20201013 #1
[19611.953223][T1717146] Call Trace:
[19611.953242][T1717146] [c000200022557800] [c00000000064c208] dump_stack+0xec/0x144 (unreliable)
[19611.953291][T1717146] [c000200022557840] [c000000000363688] print_trailer+0x278/0x2a0
[19611.953323][T1717146] [c0002000225578d0] [c00000000035aa8c] free_debug_processing+0x57c/0x600
[19611.953356][T1717146] [c0002000225579b0] [c00000000035af24] __slab_free+0x414/0x5b0
[19611.953391][T1717146] [c000200022557a80] [c00000000035b55c] kfree+0x49c/0x510
[19611.953423][T1717146] [c000200022557b10] [c0000000000432a0] pcibios_remove_bus+0x70/0x90
pci_irq_map_dispose at arch/powerpc/kernel/pci-common.c:456
(inlined by) pcibios_remove_bus at arch/powerpc/kernel/pci-common.c:461
[19611.953454][T1717146] [c000200022557b40] [c000000000677f94] pci_remove_bus+0xe4/0x110
[19611.953477][T1717146] [c000200022557b70] [c000000000678134] pci_remove_bus_device+0x74/0x170
[19611.953510][T1717146] [c000200022557bb0] [c000000000678120] pci_remove_bus_device+0x60/0x170
[19611.953543][T1717146] [c000200022557bf0] [c0000000006782a4] pci_stop_and_remove_bus_device_locked+0x34/0x50
[19611.953567][T1717146] [c000200022557c20] [c000000000687690] remove_store+0xc0/0xe0
[19611.953599][T1717146] [c000200022557c70] [c0000000006e5320] dev_attr_store+0x30/0x50
[19611.953621][T1717146] [c000200022557c90] [c0000000004a53b8] sysfs_kf_write+0x68/0xb0
[19611.953652][T1717146] [c000200022557cd0] [c0000000004a45e4] kernfs_fop_write+0x114/0x260
[19611.953684][T1717146] [c000200022557d20] [c0000000003aff74] vfs_write+0xe4/0x260
[19611.953717][T1717146] [c000200022557d70] [c0000000003b02a4] ksys_write+0x74/0x130
[19611.953762][T1717146] [c000200022557dc0] [c00000000002a3e8] system_call_exception+0xf8/0x1d0
[19611.953795][T1717146] [c000200022557e20] [c00000000000d0a8] system_call_common+0xe8/0x218
[19611.953821][T1717146] FIX kmalloc-16: Object at 0x00000000f360132d not freed
[19611.954111][T1717146] =============================================================================
[19611.954144][T1717146] BUG kmalloc-16 (Tainted: G    B   W  O     ): Wrong object count. Counter is 174 but counted were 176
[19611.954176][T1717146] -----------------------------------------------------------------------------
[19611.954176][T1717146] 
[19611.954221][T1717146] INFO: Slab 0x0000000099caaf22 objects=178 used=174 fp=0x00000000006a64b0 flags=0x7fff8000000201
[19611.954237][T1717146] CPU: 16 PID: 1717146 Comm: trinity-c8 Tainted: G    B   W  O      5.9.0-next-20201013 #1
[19611.954269][T1717146] Call Trace:
[19611.954286][T1717146] [c0002000225576f0] [c00000000064c208] dump_stack+0xec/0x144 (unreliable)
[19611.954329][T1717146] [c000200022557730] [c000000000363368] slab_err+0x78/0xb0
[19611.954364][T1717146] [c000200022557810] [c000000000359f94] on_freelist+0x364/0x390
[19611.954390][T1717146] [c0002000225578b0] [c00000000035a798] free_debug_processing+0x288/0x600
[19611.954428][T1717146] [c000200022557990] [c00000000035af24] __slab_free+0x414/0x5b0
[19611.954459][T1717146] [c000200022557a60] [c00000000035b55c] kfree+0x49c/0x510
[19611.954507][T1717146] [c000200022557af0] [c0000000002bd5a0] kfree_const+0x60/0x80
[19611.954540][T1717146] [c000200022557b10] [c0000000006553ec] kobject_release+0x7c/0xd0
[19611.954562][T1717146] [c000200022557b50] [c0000000006e66c0] put_device+0x20/0x40
[19611.954594][T1717146] [c000200022557b70] [c00000000067820c] pci_remove_bus_device+0x14c/0x170
[19611.954627][T1717146] [c000200022557bb0] [c000000000678120] pci_remove_bus_device+0x60/0x170
[19611.954652][T1717146] [c000200022557bf0] [c0000000006782a4] pci_stop_and_remove_bus_device_locked+0x34/0x50
[19611.954686][T1717146] [c000200022557c20] [c000000000687690] remove_store+0xc0/0xe0
[19611.954717][T1717146] [c000200022557c70] [c0000000006e5320] dev_attr_store+0x30/0x50
[19611.954749][T1717146] [c000200022557c90] [c0000000004a53b8] sysfs_kf_write+0x68/0xb0
[19611.954784][T1717146] [c000200022557cd0] [c0000000004a45e4] kernfs_fop_write+0x114/0x260
[19611.954884][T1717146] [c000200022557d20] [c0000000003aff74] vfs_write+0xe4/0x260
[19611.954972][T1717146] [c000200022557d70] [c0000000003b02a4] ksys_write+0x74/0x130
[19611.955050][T1717146] [c000200022557dc0] [c00000000002a3e8] system_call_exception+0xf8/0x1d0
[19611.955144][T1717146] [c000200022557e20] [c00000000000d0a8] system_call_common+0xe8/0x218
[19611.955228][T1717146] FIX kmalloc-16: Object count adjusted.
[19611.955300][T1717146] pci_bus 0035:0d: busn_res: [bus 0d-11] is released
[19611.955394][T1717146] =============================================================================
[19611.955493][T1717146] BUG kmalloc-16 (Tainted: G    B   W  O     ): Object already free
[19611.955572][T1717146] -----------------------------------------------------------------------------
[19611.955572][T1717146] 
[19611.955732][T1717146] INFO: Allocated in pcibios_scan_phb+0x104/0x3e0 age=1960715 cpu=4 pid=1
[19611.955847][T1717146] 	__slab_alloc+0xa4/0xf0
[19611.955902][T1717146] 	__kmalloc+0x294/0x330
[19611.955948][T1717146] 	pcibios_scan_phb+0x104/0x3e0
[19611.955994][T1717146] 	pcibios_init+0x84/0x124
[19611.956064][T1717146] 	do_one_initcall+0xac/0x528
[19611.956101][T1717146] 	kernel_init_freeable+0x35c/0x3fc
[19611.956164][T1717146] 	kernel_init+0x24/0x148
[19611.956215][T1717146] 	ret_from_kernel_thread+0x5c/0x80
[19611.956283][T1717146] INFO: Freed in pcibios_remove_bus+0x70/0x90 age=1 cpu=16 pid=1717146
[19611.956385][T1717146] 	kfree+0x49c/0x510
[19611.956419][T1717146] 	pcibios_remove_bus+0x70/0x90
[19611.956481][T1717146] 	pci_remove_bus+0xe4/0x110
[19611.956532][T1717146] 	pci_remove_bus_device+0x74/0x170
[19611.956608][T1717146] 	pci_remove_bus_device+0x4c/0x170
[19611.956652][T1717146] 	pci_stop_and_remove_bus_device_locked+0x34/0x50
[19611.956722][T1717146] 	remove_store+0xc0/0xe0
[19611.956793][T1717146] 	dev_attr_store+0x30/0x50
[19611.956850][T1717146] 	sysfs_kf_write+0x68/0xb0
[19611.956914][T1717146] 	kernfs_fop_write+0x114/0x260
[19611.956964][T1717146] 	vfs_write+0xe4/0x260
[19611.957009][T1717146] 	ksys_write+0x74/0x130
[19611.957055][T1717146] 	system_call_exception+0xf8/0x1d0
[19611.957101][T1717146] 	system_call_common+0xe8/0x218
[19611.957173][T1717146] INFO: Slab 0x0000000099caaf22 objects=178 used=175 fp=0x00000000f4222fd7 flags=0x7fff8000000201
[19611.957304][T1717146] INFO: Object 0x00000000f360132d @offset=30192 fp=0x0000000000000000
[19611.957304][T1717146] 
[19611.957429][T1717146] Redzone 00000000acef7298: bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb  ................
[19611.957543][T1717146] Object 00000000f360132d: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b a5  kkkkkkkkkkkkkkk.
[19611.957684][T1717146] Redzone 0000000083758aaa: bb bb bb bb bb bb bb bb                          ........
[19611.957781][T1717146] Padding 00000000cbb228a2: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
[19611.957912][T1717146] CPU: 16 PID: 1717146 Comm: trinity-c8 Tainted: G    B   W  O      5.9.0-next-20201013 #1
[19611.958033][T1717146] Call Trace:
[19611.958085][T1717146] [c000200022557800] [c00000000064c208] dump_stack+0xec/0x144 (unreliable)
[19611.958182][T1717146] [c000200022557840] [c000000000363688] print_trailer+0x278/0x2a0
[19611.958261][T1717146] [c0002000225578d0] [c00000000035aa8c] free_debug_processing+0x57c/0x600
[19611.958385][T1717146] [c0002000225579b0] [c00000000035af24] __slab_free+0x414/0x5b0
[19611.958486][T1717146] [c000200022557a80] [c00000000035b55c] kfree+0x49c/0x510
[19611.958555][T1717146] [c000200022557b10] [c0000000000432a0] pcibios_remove_bus+0x70/0x90
[19611.958665][T1717146] [c000200022557b40] [c000000000677f94] pci_remove_bus+0xe4/0x110
[19611.958745][T1717146] [c000200022557b70] [c000000000678134] pci_remove_bus_device+0x74/0x170
[19611.958842][T1717146] [c000200022557bb0] [c000000000678120] pci_remove_bus_device+0x60/0x170
[19611.958953][T1717146] [c000200022557bf0] [c0000000006782a4] pci_stop_and_remove_bus_device_locked+0x34/0x50
[19611.959062][T1717146] [c000200022557c20] [c000000000687690] remove_store+0xc0/0xe0
[19611.959142][T1717146] [c000200022557c70] [c0000000006e5320] dev_attr_store+0x30/0x50
[19611.959242][T1717146] [c000200022557c90] [c0000000004a53b8] sysfs_kf_write+0x68/0xb0
[19611.959323][T1717146] [c000200022557cd0] [c0000000004a45e4] kernfs_fop_write+0x114/0x260
[19611.959425][T1717146] [c000200022557d20] [c0000000003aff74] vfs_write+0xe4/0x260
[19611.959506][T1717146] [c000200022557d70] [c0000000003b02a4] ksys_write+0x74/0x130
[19611.959613][T1717146] [c000200022557dc0] [c00000000002a3e8] system_call_exception+0xf8/0x1d0
[19611.959713][T1717146] [c000200022557e20] [c00000000000d0a8] system_call_common+0xe8/0x218
[19611.959819][T1717146] FIX kmalloc-16: Object at 0x00000000f360132d not freed
[19611.960653][T1717146] pci 0035:02     : [PE# fc] Releasing PE
[19611.960831][T1717146] pci_bus 0035:02: busn_res: [bus 02-11] is released
[19611.960913][T1717146] =============================================================================
[19611.960934][T1717146] BUG kmalloc-16 (Tainted: G    B   W  O     ): Object already free
[19611.960954][T1717146] -----------------------------------------------------------------------------
[19611.960954][T1717146] 
[19611.960991][T1717146] INFO: Allocated in pcibios_scan_phb+0x104/0x3e0 age=1960715 cpu=4 pid=1
[19611.961024][T1717146] 	__slab_alloc+0xa4/0xf0
[19611.961052][T1717146] 	__kmalloc+0x294/0x330
[19611.961070][T1717146] 	pcibios_scan_phb+0x104/0x3e0
[19611.961089][T1717146] 	pcibios_init+0x84/0x124
[19611.961108][T1717146] 	do_one_initcall+0xac/0x528
[19611.961169][T1717146] 	kernel_init_freeable+0x35c/0x3fc
[19611.961213][T1717146] 	kernel_init+0x24/0x148
[19611.961276][T1717146] 	ret_from_kernel_thread+0x5c/0x80
[19611.961321][T1717146] INFO: Freed in pcibios_remove_bus+0x70/0x90 age=1 cpu=16 pid=1717146
[19611.961441][T1717146] 	kfree+0x49c/0x510
[19611.961497][T1717146] 	pcibios_remove_bus+0x70/0x90
[19611.961554][T1717146] 	pci_remove_bus+0xe4/0x110
[19611.961621][T1717146] 	pci_remove_bus_device+0x74/0x170
[19611.961670][T1717146] 	pci_remove_bus_device+0x4c/0x170
[19611.961730][T1717146] 	pci_stop_and_remove_bus_device_locked+0x34/0x50
[19611.961810][T1717146] 	remove_store+0xc0/0xe0
[19611.961855][T1717146] 	dev_attr_store+0x30/0x50
[19611.961912][T1717146] 	sysfs_kf_write+0x68/0xb0
[19611.961965][T1717146] 	kernfs_fop_write+0x114/0x260
[19611.962017][T1717146] 	vfs_write+0xe4/0x260
[19611.962071][T1717146] 	ksys_write+0x74/0x130
[19611.962127][T1717146] 	system_call_exception+0xf8/0x1d0
[19611.962194][T1717146] 	system_call_common+0xe8/0x218
[19611.962239][T1717146] INFO: Slab 0x0000000099caaf22 objects=178 used=174 fp=0x00000000253d72f3 flags=0x7fff8000000201
[19611.962365][T1717146] INFO: Object 0x00000000f360132d @offset=30192 fp=0x0000000000000000
[19611.962365][T1717146] 
[19611.962501][T1717146] Redzone 00000000acef7298: bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb  ................
[19611.962628][T1717146] Object 00000000f360132d: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b a5  kkkkkkkkkkkkkkk.
[19611.962729][T1717146] Redzone 0000000083758aaa: bb bb bb bb bb bb bb bb                          ........
[19611.962836][T1717146] Padding 00000000cbb228a2: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
[19611.962962][T1717146] CPU: 16 PID: 1717146 Comm: trinity-c8 Tainted: G    B   W  O      5.9.0-next-20201013 #1
[19611.963077][T1717146] Call Trace:
[19611.963113][T1717146] [c000200022557840] [c00000000064c208] dump_stack+0xec/0x144 (unreliable)
[19611.963210][T1717146] [c000200022557880] [c000000000363688] print_trailer+0x278/0x2a0
[19611.963300][T1717146] [c000200022557910] [c00000000035aa8c] free_debug_processing+0x57c/0x600
[19611.963395][T1717146] [c0002000225579f0] [c00000000035af24] __slab_free+0x414/0x5b0
[19611.963490][T1717146] [c000200022557ac0] [c00000000035b55c] kfree+0x49c/0x510
[19611.963585][T1717146] [c000200022557b50] [c0000000000432a0] pcibios_remove_bus+0x70/0x90
[19611.963710][T1717146] [c000200022557b80] [c000000000677f94] pci_remove_bus+0xe4/0x110
[19611.963788][T1717146] [c000200022557bb0] [c000000000678134] pci_remove_bus_device+0x74/0x170
[19611.963883][T1717146] [c000200022557bf0] [c0000000006782a4] pci_stop_and_remove_bus_device_locked+0x34/0x50
[19611.963988][T1717146] [c000200022557c20] [c000000000687690] remove_store+0xc0/0xe0
[19611.964102][T1717146] [c000200022557c70] [c0000000006e5320] dev_attr_store+0x30/0x50
[19611.964189][T1717146] [c000200022557c90] [c0000000004a53b8] sysfs_kf_write+0x68/0xb0
[19611.964302][T1717146] [c000200022557cd0] [c0000000004a45e4] kernfs_fop_write+0x114/0x260
[19611.964390][T1717146] [c000200022557d20] [c0000000003aff74] vfs_write+0xe4/0x260
[19611.964493][T1717146] [c000200022557d70] [c0000000003b02a4] ksys_write+0x74/0x130
[19611.964541][T1717146] [c000200022557dc0] [c00000000002a3e8] system_call_exception+0xf8/0x1d0
[19611.964747][T1717146] [c000200022557e20] [c00000000000d0a8] system_call_common+0xe8/0x218
[19611.964851][T1717146] FIX kmalloc-16: Object at 0x00000000f360132d not freed
[19611.966211][T1717146] pci 0035:01     : [PE# fd] Releasing PE

