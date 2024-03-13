Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D4F87A7D6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Mar 2024 13:54:08 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=D9qsVO4T;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tvr7246mYz3d4L
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Mar 2024 23:54:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=D9qsVO4T;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tvr6K1CrNz2xcw
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Mar 2024 23:53:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1710334408;
	bh=pHJqCqZCSnBo7TibBzZr69lpF8JZp8rZX05ia5gTyLg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=D9qsVO4ToatVFVLije71EjN1eaIAzKjvSpzxBi2F2YQ9joA4cR2ieVDnB2pBRK1ht
	 F/XSYGIaNeQo1zI0zEUEhvD2K3LFzQyh7LqA1t3Qj3UGMHprlB4GAawRGCnwJZDTs+
	 k3hDWUTpJDIF8qKZ7NkiipUcOns0Ptf2gEqjtqTfVg0Ch+aima/HUgFGXb06DtBKtN
	 17I6Zhnb/zuNBkN31It2/I9+EG0wRpMidcL+S2vGvFbczHWxFKfUcR48ehYUE0gxpE
	 xosPYMCgOtX52oRISDqS4pPV1m6NjnssSkTJXeNaBC5ed3YBDE9cFYrLa7F1hy6G3u
	 UGnq4+s6xFPUw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Tvr6D64K6z4wqM;
	Wed, 13 Mar 2024 23:53:24 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Shivaprasad G Bhat <sbhat@linux.ibm.com>,
 tpearson@raptorengineering.com, alex.williamson@redhat.com,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [RFC PATCH 3/3] pseries/iommu: Enable DDW for VFIO TCE create
In-Reply-To: <171026728072.8367.13581504605624115205.stgit@linux.ibm.com>
References: <171026724548.8367.8321359354119254395.stgit@linux.ibm.com>
 <171026728072.8367.13581504605624115205.stgit@linux.ibm.com>
Date: Wed, 13 Mar 2024 23:53:21 +1100
Message-ID: <87zfv22szi.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: robh@kernel.org, jroedel@suse.de, sbhat@linux.ibm.com, gbatra@linux.vnet.ibm.com, jgg@ziepe.ca, aik@ozlabs.ru, linux-kernel@vger.kernel.org, svaidy@linux.ibm.com, aneesh.kumar@kernel.org, brking@linux.vnet.ibm.com, npiggin@gmail.com, kvm@vger.kernel.org, naveen.n.rao@linux.ibm.com, vaibhav@linux.ibm.com, msuchanek@suse.de, aik@amd.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Shivaprasad,

Shivaprasad G Bhat <sbhat@linux.ibm.com> writes:
> The commit 9d67c9433509 ("powerpc/iommu: Add \"borrowing\"
> iommu_table_group_ops") implemented the "borrow" mechanism for
> the pSeries SPAPR TCE. It did implement this support partially
> that it left out creating the DDW if not present already.
>
> The patch here attempts to fix the missing gaps.
>  - Expose the DDW info to user by collecting it during probe.
>  - Create the window and the iommu table if not present during
>    VFIO_SPAPR_TCE_CREATE.
>  - Remove and recreate the window if the pageshift and window sizes
>    do not match.
>  - Restore the original window in enable_ddw() if the user had
>    created/modified the DDW. As there is preference for DIRECT mapping
>    on the host driver side, the user created window is removed.
>
> The changes work only for the non-SRIOV-VF scenarios for PEs having
> 2 DMA windows.

This crashes on powernv.

Full log at https://github.com/linuxppc/linux-snowpatch/actions/runs/8253875566/job/22577897225.

[    0.958561][    T1] pci_bus 0002:01: Configuring PE for bus
[    0.959699][    T1] pci 0002:01     : [PE# fd] Secondary bus 0x0000000000000001 associated with PE#fd
[    0.961692][    T1] pci 0002:01:00.0: Configured PE#fd
[    0.962424][    T1] pci 0002:01     : [PE# fd] Setting up 32-bit TCE table at 0..80000000
[    0.966424][    T1] IOMMU table initialized, virtual merging enabled
[    0.967544][    T1] pci 0002:01     : [PE# fd] Setting up window#0 0..ffffffff pg=10000
[    0.969362][    T1] pci 0002:01     : [PE# fd] Enabling 64-bit DMA bypass
[    0.971386][    T1] pci 0002:01:00.0: Adding to iommu group 0
[    0.973481][    T1] BUG: Unable to handle kernel instruction fetch (NULL pointer?)
[    0.974388][    T1] Faulting instruction address: 0x00000000
[    0.975578][    T1] Oops: Kernel access of bad area, sig: 11 [#1]
[    0.976476][    T1] LE PAGE_SIZE=64K MMU=Hash SMP ERROR: Error: saw oops/warning etc. while expecting NR_CPUS=2048 NUMA PowerNV
[    0.977777][    T1] Modules linked in:
[    0.978570][    T1] CPU: 1 PID: 1 Comm: swapper/1 Not tainted 6.8.0-rc6-g80dcb4e6d0aa #1
[    0.979766][    T1] Hardware name: IBM PowerNV (emulated by qemu) POWER8 0x4d0200 opal:v6.8-104-g820d43c0 PowerNV
[    0.981197][    T1] NIP:  0000000000000000 LR: c00000000005653c CTR: 0000000000000000
[    0.982221][    T1] REGS: c000000003687420 TRAP: 0480   Not tainted  (6.8.0-rc6-g80dcb4e6d0aa)
[    0.983400][    T1] MSR:  9000000000009033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 44004422  XER: 00000000
[    0.984742][    T1] CFAR: c000000000056538 IRQMASK: 0 
[    0.984742][    T1] GPR00: c000000000056520 c0000000036876c0 c0000000015b9800 c00000000363ae58 
[    0.984742][    T1] GPR04: c00000000352f0a0 c0000000026d4748 0000000000000001 0000000000000000 
[    0.984742][    T1] GPR08: 0000000000000000 c000000002716668 0000000000000003 0000000000008000 
[    0.984742][    T1] GPR12: 0000000000000000 c000000002be0000 c0000000000110cc 0000000000000000 
[    0.984742][    T1] GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
[    0.984742][    T1] GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000001 
[    0.984742][    T1] GPR24: c0000000014681d8 0000000000000000 c000000003068a00 0000000000000001 
[    0.984742][    T1] GPR28: c000000003068a00 0000000000000000 c00000000363ae58 c00000000352f0a0 
[    0.994647][    T1] NIP [0000000000000000] 0x0
[    0.995699][    T1] LR [c00000000005653c] spapr_tce_platform_iommu_attach_dev+0x74/0xc8
[    0.997399][    T1] Call Trace:
[    0.997897][    T1] [c0000000036876c0] [c000000000056514] spapr_tce_platform_iommu_attach_dev+0x4c/0xc8 (unreliable)
[    0.999383][    T1] [c000000003687700] [c000000000b383dc] __iommu_attach_device+0x44/0xfc
[    1.000476][    T1] [c000000003687730] [c000000000b38574] __iommu_device_set_domain+0xe0/0x170
[    1.001728][    T1] [c0000000036877c0] [c000000000b3869c] __iommu_group_set_domain_internal+0x98/0x1c0
[    1.003014][    T1] [c000000003687820] [c000000000b3bb10] iommu_setup_default_domain+0x544/0x650
[    1.004306][    T1] [c0000000036878e0] [c000000000b3d3b4] __iommu_probe_device+0x5b0/0x604
[    1.005500][    T1] [c000000003687950] [c000000000b3d454] iommu_probe_device+0x4c/0xb0
[    1.006563][    T1] [c000000003687990] [c00000000005648c] iommu_add_device+0x3c/0x78
[    1.007590][    T1] [c0000000036879b0] [c0000000000db920] pnv_pci_ioda_dma_dev_setup+0x168/0x73c
[    1.008918][    T1] [c000000003687a60] [c0000000000729f4] pcibios_bus_add_device+0x80/0x328
[    1.010077][    T1] [c000000003687ac0] [c000000000a49fa0] pci_bus_add_device+0x30/0x11c
[    1.011169][    T1] [c000000003687b30] [c000000000a4a0e4] pci_bus_add_devices+0x58/0xb4
[    1.012230][    T1] [c000000003687b70] [c000000000a4a118] pci_bus_add_devices+0x8c/0xb4
[    1.013301][    T1] [c000000003687bb0] [c00000000201a3c8] pcibios_init+0xd8/0x140
[    1.014314][    T1] [c000000003687c30] [c000000000010d58] do_one_initcall+0x80/0x2f8
[    1.015349][    T1] [c000000003687d00] [c000000002005b0c] kernel_init_freeable+0x31c/0x510
[    1.016470][    T1] [c000000003687de0] [c0000000000110f8] kernel_init+0x34/0x25c
[    1.017527][    T1] [c000000003687e50] [c00000000000debc] ret_from_kernel_user_thread+0x14/0x1c
[    1.018778][    T1] --- interrupt: 0 at 0x0
[    1.019525][    T1] Code: XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX 
[    1.022234][    T1] ---[ end trace 0000000000000000 ]---
[    1.022983][    T1] 
[    2.023819][    T1] note: swapper/1[1] exited with irqs disabled
[    2.025051][    T1] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
[    2.027371][    T1] Rebooting in 10 seconds.


cheers
