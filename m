Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D677B5E7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2019 00:54:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ysLW70wzzDqYt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2019 08:54:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ysFx4D9JzDqLc
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2019 08:50:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 45ysFw05hKz9sMQ; Wed, 31 Jul 2019 08:50:11 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: da1115fdbd6e86c62185cdd2b4bf7add39f2f82b
In-Reply-To: <20190729095128.23707-1-aneesh.kumar@linux.ibm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, npiggin@gmail.com,
 paulus@samba.org, "Oliver O'Halloran" <oohall@gmail.com>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v3] powerpc/nvdimm: Pick nearby online node if the device
 node is not online
Message-Id: <45ysFw05hKz9sMQ@ozlabs.org>
Date: Wed, 31 Jul 2019 08:50:11 +1000 (AEST)
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2019-07-29 at 09:51:28 UTC, "Aneesh Kumar K.V" wrote:
> Currently, nvdimm subsystem expects the device numa node for SCM device to be
> an online node. It also doesn't try to bring the device numa node online. Hence
> if we use a non-online numa node as device node we hit crashes like below. This
> is because we try to access uninitialized NODE_DATA in different code paths.
> 
> cpu 0x0: Vector: 300 (Data Access) at [c0000000fac53170]
>     pc: c0000000004bbc50: ___slab_alloc+0x120/0xca0
>     lr: c0000000004bc834: __slab_alloc+0x64/0xc0
>     sp: c0000000fac53400
>    msr: 8000000002009033
>    dar: 73e8
>  dsisr: 80000
>   current = 0xc0000000fabb6d80
>   paca    = 0xc000000003870000   irqmask: 0x03   irq_happened: 0x01
>     pid   = 7, comm = kworker/u16:0
> Linux version 5.2.0-06234-g76bd729b2644 (kvaneesh@ltc-boston123) (gcc version 7.4.0 (Ubuntu 7.4.0-1ubuntu1~18.04.1)) #135 SMP Thu Jul 11 05:36:30 CDT 2019
> enter ? for help
> [link register   ] c0000000004bc834 __slab_alloc+0x64/0xc0
> [c0000000fac53400] c0000000fac53480 (unreliable)
> [c0000000fac53500] c0000000004bc818 __slab_alloc+0x48/0xc0
> [c0000000fac53560] c0000000004c30a0 __kmalloc_node_track_caller+0x3c0/0x6b0
> [c0000000fac535d0] c000000000cfafe4 devm_kmalloc+0x74/0xc0
> [c0000000fac53600] c000000000d69434 nd_region_activate+0x144/0x560
> [c0000000fac536d0] c000000000d6b19c nd_region_probe+0x17c/0x370
> [c0000000fac537b0] c000000000d6349c nvdimm_bus_probe+0x10c/0x230
> [c0000000fac53840] c000000000cf3cc4 really_probe+0x254/0x4e0
> [c0000000fac538d0] c000000000cf429c driver_probe_device+0x16c/0x1e0
> [c0000000fac53950] c000000000cf0b44 bus_for_each_drv+0x94/0x130
> [c0000000fac539b0] c000000000cf392c __device_attach+0xdc/0x200
> [c0000000fac53a50] c000000000cf231c bus_probe_device+0x4c/0xf0
> [c0000000fac53a90] c000000000ced268 device_add+0x528/0x810
> [c0000000fac53b60] c000000000d62a58 nd_async_device_register+0x28/0xa0
> [c0000000fac53bd0] c0000000001ccb8c async_run_entry_fn+0xcc/0x1f0
> [c0000000fac53c50] c0000000001bcd9c process_one_work+0x46c/0x860
> [c0000000fac53d20] c0000000001bd4f4 worker_thread+0x364/0x5f0
> [c0000000fac53db0] c0000000001c7260 kthread+0x1b0/0x1c0
> [c0000000fac53e20] c00000000000b954 ret_from_kernel_thread+0x5c/0x68
> 
> The patch tries to fix this by picking the nearest online node as the SCM node.
> This does have a problem of us losing the information that SCM node is
> equidistant from two other online nodes. If applications need to understand these
> fine-grained details we should express then like x86 does via
> /sys/devices/system/node/nodeX/accessY/initiators/
> 
> With the patch we get
> 
>  # numactl -H
> available: 2 nodes (0-1)
> node 0 cpus:
> node 0 size: 0 MB
> node 0 free: 0 MB
> node 1 cpus: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
> node 1 size: 130865 MB
> node 1 free: 129130 MB
> node distances:
> node   0   1
>   0:  10  20
>   1:  20  10
>  # cat /sys/bus/nd/devices/region0/numa_node
> 0
>  # dmesg | grep papr_scm
> [   91.332305] papr_scm ibm,persistent-memory:ibm,pmemory@44104001: Region registered with target node 2 and online node 0
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

Applied to powerpc fixes, thanks.

https://git.kernel.org/powerpc/c/da1115fdbd6e86c62185cdd2b4bf7add39f2f82b

cheers
