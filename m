Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 84DF111DC3D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2019 03:50:07 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47YwBN5txxzDr5Y
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2019 13:50:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Yw6w4FzjzDr8R
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2019 13:47:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="iQ9NVhgh"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47Yw6s5RTSz9sPL;
 Fri, 13 Dec 2019 13:47:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1576205222;
 bh=adDE0dFQb7R0+p6kUF326jvxHElndCMGDtGrsm0svFY=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=iQ9NVhghmA/lllso6hWhBByOH29vooJW/SRf8nrlV6K0a5Ad4VWaMwRFM8+eV0mPk
 nzTKfelw8tvH1BCkP3n2bk6i5gCw2zUKBDf4HCAKsNSwdeAxI4BaNKA0JmAr6WMXDL
 uXE6cKAuoS2wj4EpB4xL/AmRsxamW8pHRpUpgtgMiCNJg+Lb7FPtYFq2dM9MgXYe8h
 N2f31BbMQQlrOZKe6tvemH7uLqaP0W3abCio4byFLXsUZpG4Bfh9wJr+HAFUfKoxKC
 tLAYLx2OfHaaa9qJLdZTqHQwcAIYK+wqe71USH0kxA0X5ZKtifep1v4FaiZEd/TTSQ
 Ba6/9pSj5mBvw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH v4 1/2] powerpc/vcpu: Assume dedicated processors as
 non-preempt
In-Reply-To: <20191212085344.17357-1-srikar@linux.vnet.ibm.com>
References: <20191212085344.17357-1-srikar@linux.vnet.ibm.com>
Date: Fri, 13 Dec 2019 13:46:58 +1100
Message-ID: <871rt9osbh.fsf@mpe.ellerman.id.au>
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Parth Shah <parth@linux.ibm.com>,
 Phil Auld <pauld@redhat.com>, Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 "Gautham R . Shenoy" <ego@linux.vnet.ibm.com>,
 Ihor Pasichnyk <Ihor.Pasichnyk@ibm.com>, Waiman Long <longman@redhat.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:
> With commit 247f2f6f3c70 ("sched/core: Don't schedule threads on pre-empted
> vCPUs"), scheduler avoids preempted vCPUs to schedule tasks on wakeup.
> This leads to wrong choice of CPU, which in-turn leads to larger wakeup
> latencies. Eventually, it leads to performance regression in latency
> sensitive benchmarks like soltp, schbench etc.
>
> On Powerpc, vcpu_is_preempted only looks at yield_count. If the
> yield_count is odd, the vCPU is assumed to be preempted. However
> yield_count is increased whenever LPAR enters CEDE state. So any CPU
> that has entered CEDE state is assumed to be preempted.
>
> Even if vCPU of dedicated LPAR is preempted/donated, it should have
> right of first-use since they are suppose to own the vCPU.
>
> On a Power9 System with 32 cores
>  # lscpu
> Architecture:        ppc64le
> Byte Order:          Little Endian
> CPU(s):              128
> On-line CPU(s) list: 0-127
> Thread(s) per core:  8
> Core(s) per socket:  1
> Socket(s):           16
> NUMA node(s):        2
> Model:               2.2 (pvr 004e 0202)
> Model name:          POWER9 (architected), altivec supported
> Hypervisor vendor:   pHyp
> Virtualization type: para
> L1d cache:           32K
> L1i cache:           32K
> L2 cache:            512K
> L3 cache:            10240K
> NUMA node0 CPU(s):   0-63
> NUMA node1 CPU(s):   64-127
>
>   # perf stat -a -r 5 ./schbench
> v5.4                                     v5.4 + patch
> Latency percentiles (usec)               Latency percentiles (usec)
> 	50.0000th: 45                    	50.0000th: 39
> 	75.0000th: 62                    	75.0000th: 53
> 	90.0000th: 71                    	90.0000th: 67
> 	95.0000th: 77                    	95.0000th: 76
> 	*99.0000th: 91                   	*99.0000th: 89
> 	99.5000th: 707                   	99.5000th: 93
> 	99.9000th: 6920                  	99.9000th: 118
> 	min=0, max=10048                 	min=0, max=211
> Latency percentiles (usec)               Latency percentiles (usec)
> 	50.0000th: 45                    	50.0000th: 34
> 	75.0000th: 61                    	75.0000th: 45
> 	90.0000th: 72                    	90.0000th: 53
> 	95.0000th: 79                    	95.0000th: 56
> 	*99.0000th: 691                  	*99.0000th: 61
> 	99.5000th: 3972                  	99.5000th: 63
> 	99.9000th: 8368                  	99.9000th: 78
> 	min=0, max=16606                 	min=0, max=228
> Latency percentiles (usec)               Latency percentiles (usec)
> 	50.0000th: 45                    	50.0000th: 34
> 	75.0000th: 61                    	75.0000th: 45
> 	90.0000th: 71                    	90.0000th: 53
> 	95.0000th: 77                    	95.0000th: 57
> 	*99.0000th: 106                  	*99.0000th: 63
> 	99.5000th: 2364                  	99.5000th: 68
> 	99.9000th: 7480                  	99.9000th: 100
> 	min=0, max=10001                 	min=0, max=134
> Latency percentiles (usec)               Latency percentiles (usec)
> 	50.0000th: 45                    	50.0000th: 34
> 	75.0000th: 62                    	75.0000th: 46
> 	90.0000th: 72                    	90.0000th: 53
> 	95.0000th: 78                    	95.0000th: 56
> 	*99.0000th: 93                   	*99.0000th: 61
> 	99.5000th: 108                   	99.5000th: 64
> 	99.9000th: 6792                  	99.9000th: 85
> 	min=0, max=17681                 	min=0, max=121
> Latency percentiles (usec)               Latency percentiles (usec)
> 	50.0000th: 46                    	50.0000th: 33
> 	75.0000th: 62                    	75.0000th: 44
> 	90.0000th: 73                    	90.0000th: 51
> 	95.0000th: 79                    	95.0000th: 54
> 	*99.0000th: 113                  	*99.0000th: 61
> 	99.5000th: 2724                  	99.5000th: 64
> 	99.9000th: 6184                  	99.9000th: 82
> 	min=0, max=9887                  	min=0, max=121
>
>  Performance counter stats for 'system wide' (5 runs):
>
> context-switches    43,373  ( +-  0.40% )   44,597 ( +-  0.55% )
> cpu-migrations       1,211  ( +-  5.04% )      220 ( +-  6.23% )
> page-faults         15,983  ( +-  5.21% )   15,360 ( +-  3.38% )
>
> Waiman Long suggested using static_keys.
>
> Fixes: 41946c86876e ("locking/core, powerpc: Implement vcpu_is_preempted(cpu)")
>
> Cc: Parth Shah <parth@linux.ibm.com>
> Cc: Ihor Pasichnyk <Ihor.Pasichnyk@ibm.com>
> Cc: Juri Lelli <juri.lelli@redhat.com>
> Cc: Phil Auld <pauld@redhat.com>
> Cc: Waiman Long <longman@redhat.com>
> Cc: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
> Cc: Vaidyanathan Srinivasan <svaidy@linux.ibm.com>
> Reported-by: Parth Shah <parth@linux.ibm.com>
> Reported-by: Ihor Pasichnyk <Ihor.Pasichnyk@ibm.com>
> Tested-by: Juri Lelli <juri.lelli@redhat.com>
> Tested-by: Parth Shah <parth@linux.ibm.com>
> Acked-by: Waiman Long <longman@redhat.com>
> Acked-by: Phil Auld <pauld@redhat.com>
> Reviewed-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
> Reviewed-by: Vaidyanathan Srinivasan <svaidy@linux.ibm.com>
> Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
> ---
> Changelog v1 (https://patchwork.ozlabs.org/patch/1204190/) ->v3:
> Code is now under CONFIG_PPC_SPLPAR as it depends on CONFIG_PPC_PSERIES.
> This was suggested by Waiman Long.
>
> Changelog v3 (https://patchwork.ozlabs.org/patch/1204526) ->v4:
> Fix a build issue in CONFIG_NUMA=n reported by Michael Ellerman
> by moving the relevant code from mm/numa.c to kernel/smp.c
>
>  arch/powerpc/include/asm/spinlock.h |  6 ++++--
>  arch/powerpc/kernel/smp.c           | 19 ++++++++++++++-----
>  arch/powerpc/mm/numa.c              |  8 +++-----

This is all pseries specific, none of it should be in smp.c or numa.c.

I'll send a v5.

cheers
