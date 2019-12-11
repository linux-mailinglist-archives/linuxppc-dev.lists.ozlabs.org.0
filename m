Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4FF11AE6C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2019 15:54:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Y0MV4plNzDqY3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2019 01:54:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.120;
 helo=us-smtp-1.mimecast.com; envelope-from=longman@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.b="UEZxoUcj"; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Y0KP0cyyzDqY3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2019 01:52:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576075972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HE0zgIvKXtgUnPsLJOa8XeAclSBSBTf49X1MsdU7xoY=;
 b=UEZxoUcj3uJ8x43acC9DAaLcVg6oNQm2bRq3YXQQnkSUG8YrXlhCzeghbGkOuUI6V2rm4q
 1hwDZ/MBJiTL3zH+YByi4PKkm8CYFKADIbcs678ihdr1F8gXkrhIp/GOHJbtI+nLLYziXj
 RH8Pzkx/yXcWBJQtEC2eap0L5tiz/Vk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-ljxkRPbrOaehjLyqLsA0qA-1; Wed, 11 Dec 2019 09:52:49 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C28A58B787F;
 Wed, 11 Dec 2019 14:52:47 +0000 (UTC)
Received: from llong.remote.csb (dhcp-17-59.bos.redhat.com [10.18.17.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0899760BF3;
 Wed, 11 Dec 2019 14:52:43 +0000 (UTC)
Subject: Re: [PATCH v3 1/2] powerpc/vcpu: Assume dedicated processors as
 non-preempt
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <20191205083218.25824-1-srikar@linux.vnet.ibm.com>
From: Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <8e4efef3-d956-1bac-81af-a5a881fa895b@redhat.com>
Date: Wed, 11 Dec 2019 09:52:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20191205083218.25824-1-srikar@linux.vnet.ibm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: ljxkRPbrOaehjLyqLsA0qA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
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
 Phil Auld <pauld@redhat.com>, "Gautham R . Shenoy" <ego@linux.vnet.ibm.com>,
 Ihor Pasichnyk <Ihor.Pasichnyk@ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/5/19 3:32 AM, Srikar Dronamraju wrote:
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

Since this patch is fixing a performance regression. Maybe we should add

Fixes: 41946c86876e ("locking/core, powerpc: Implement
vcpu_is_preempted(cpu)")

Cheers,
Longman


