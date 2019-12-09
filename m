Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 91896116996
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Dec 2019 10:39:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47WdS55xgjzDqGZ
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Dec 2019 20:39:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=parth@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Wbrf6Ns7zDqPT
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Dec 2019 19:26:36 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB98McO5143952
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 9 Dec 2019 03:26:34 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wrtgygcn8-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Dec 2019 03:26:33 -0500
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <parth@linux.ibm.com>;
 Mon, 9 Dec 2019 08:26:31 -0000
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 9 Dec 2019 08:26:28 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id xB98PkST50135466
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Dec 2019 08:25:46 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 92B73AE051;
 Mon,  9 Dec 2019 08:26:27 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4431EAE045;
 Mon,  9 Dec 2019 08:26:26 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.124.35.123])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  9 Dec 2019 08:26:26 +0000 (GMT)
Subject: Re: [PATCH v3 1/2] powerpc/vcpu: Assume dedicated processors as
 non-preempt
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <20191205083218.25824-1-srikar@linux.vnet.ibm.com>
From: Parth Shah <parth@linux.ibm.com>
Date: Mon, 9 Dec 2019 13:56:25 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20191205083218.25824-1-srikar@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19120908-0020-0000-0000-00000395BF6F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19120908-0021-0000-0000-000021ECF8D1
Message-Id: <41f9dea0-3b50-d8d4-52dc-7b3f5f4ff845@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-09_01:2019-12-09,2019-12-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1011
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 bulkscore=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912090072
X-Mailman-Approved-At: Mon, 09 Dec 2019 20:35:31 +1100
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
Cc: Juri Lelli <juri.lelli@redhat.com>,
 "Gautham R . Shenoy" <ego@linux.vnet.ibm.com>, Phil Auld <pauld@redhat.com>,
 Ihor Pasichnyk <Ihor.Pasichnyk@ibm.com>, Waiman Long <longman@redhat.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On 12/5/19 2:02 PM, Srikar Dronamraju wrote:
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
> Reported-by: Parth Shah <parth@linux.ibm.com>
> Reported-by: Ihor Pasichnyk <Ihor.Pasichnyk@ibm.com>
> Cc: Parth Shah <parth@linux.ibm.com>
> Cc: Ihor Pasichnyk <Ihor.Pasichnyk@ibm.com>
> Cc: Juri Lelli <juri.lelli@redhat.com>
> Cc: Phil Auld <pauld@redhat.com>
> Cc: Waiman Long <longman@redhat.com>
> Cc: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
> Tested-by: Juri Lelli <juri.lelli@redhat.com>
> Ack-by: Waiman Long <longman@redhat.com>
> Reviewed-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
> Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
> ---
> Changelog v1 (https://patchwork.ozlabs.org/patch/1204190/) ->v3:
> Code is now under CONFIG_PPC_SPLPAR as it depends on CONFIG_PPC_PSERIES.
> This was suggested by Waiman Long.
> 
>  arch/powerpc/include/asm/spinlock.h | 5 +++--
>  arch/powerpc/mm/numa.c              | 4 ++++
>  2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/spinlock.h b/arch/powerpc/include/asm/spinlock.h
> index e9a960e28f3c..de817c25deff 100644
> --- a/arch/powerpc/include/asm/spinlock.h
> +++ b/arch/powerpc/include/asm/spinlock.h
> @@ -35,11 +35,12 @@
>  #define LOCK_TOKEN	1
>  #endif
>  
> -#ifdef CONFIG_PPC_PSERIES
> +#ifdef CONFIG_PPC_SPLPAR
> +DECLARE_STATIC_KEY_FALSE(shared_processor);
>  #define vcpu_is_preempted vcpu_is_preempted
>  static inline bool vcpu_is_preempted(int cpu)
>  {
> -	if (!firmware_has_feature(FW_FEATURE_SPLPAR))
> +	if (!static_branch_unlikely(&shared_processor))
>  		return false;
>  	return !!(be32_to_cpu(lppaca_of(cpu).yield_count) & 1);
>  }
> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
> index 50d68d21ddcc..ffb971f3a63c 100644
> --- a/arch/powerpc/mm/numa.c
> +++ b/arch/powerpc/mm/numa.c
> @@ -1568,9 +1568,13 @@ int prrn_is_enabled(void)
>  	return prrn_enabled;
>  }
>  
> +DEFINE_STATIC_KEY_FALSE(shared_processor);
> +EXPORT_SYMBOL_GPL(shared_processor);
> +
>  void __init shared_proc_topology_init(void)
>  {
>  	if (lppaca_shared_proc(get_lppaca())) {
> +		static_branch_enable(&shared_processor);
>  		bitmap_fill(cpumask_bits(&cpu_associativity_changes_mask),
>  			    nr_cpumask_bits);
>  		numa_update_cpu_topology(false);
> 

I have tested this patch on Guest KVM with following configuration:
Architecture:        ppc64le
Byte Order:          Little Endian
CPU(s):              88
On-line CPU(s) list: 0-87
Thread(s) per core:  1
Core(s) per socket:  1
Socket(s):           88
NUMA node(s):        1
Model:               2.2 (pvr 004e 1202)
Model name:          POWER9 (architected), altivec supported
Hypervisor vendor:   KVM
Virtualization type: para
L1d cache:           32K
L1i cache:           32K
NUMA node0 CPU(s):   0-87

- Baseline kernel: v5.4

Setup:
=======
- 2 KVM guests: Both sharing same set of CPUs.
- First guest is idle
- Second guest executes 'schbench -r 30'
- Hypervisor details:
  - Architecture: POWER9
  - CPU(s): 88
  - Socket(s): 1
  - kernel: v5.4


Results:
===========
- schbench -r 30
+----------------+--------------+-----------------+
|   Latency %ile | v5.4         | v5.4 + patch    |
+================+==============+=================+
|          50    | 28 (+- 1)    | 22.625 (+- 0.7) |
+----------------+--------------+-----------------+
|          75    | 330 (+- 107) | 67 (+- 36)      |
+----------------+--------------+-----------------+
|          90    | 463 (+- 14)  | 447 (+- 5)      |
+----------------+--------------+-----------------+
|          95    | 486 (+- 27)  | 472 (+- 7.3)    |
+----------------+--------------+-----------------+
|          99    | 851 (+- 83)  | 709 (+- 77)     |
+----------------+--------------+-----------------+
|          99.5  | 884 (+- 51)  | 865 (+- 57)     |
+----------------+--------------+-----------------+
|          99.99 | 1038 (+- 72) | 961 (+- 36)     |
+----------------+--------------+-----------------+


Tested-by: Parth Shah <parth@linux.ibm.com>


Best,
Parth

