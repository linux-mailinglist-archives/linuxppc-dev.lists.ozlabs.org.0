Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E83697CC2E9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Oct 2023 14:19:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=A5nGC0s/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S8tMr6Cjpz3cFq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Oct 2023 23:19:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=A5nGC0s/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aboorvad@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S8tM03x6Hz3c18
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Oct 2023 23:19:08 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39HC7JdQ024911;
	Tue, 17 Oct 2023 12:18:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=EA50+OAa6+lxbvxabpIw+kS8IHck9lprvoOmGk82Hl0=;
 b=A5nGC0s/scGInFvcsBllX+/X19Tue61uyj+QNNWNbUGyFGwmKVzhzejNMwMZt1sisPEB
 r5Co10gej6CztUO8pinAsngG7mL9nsGySJ06k/gRued0qIOwdgz/5eU5QfzX2rhbNhO9
 S7zMwplHPPAtxb6NAiOmZyzJzDc7N2DDu81hQbi3rVAF6/jdM3COmcJD0Ctu+0FZBAY6
 acXF1XQKE3tTodR9Hi4YvyJmtlpAy8IBAfOP0c/jTyBkwFegcW3J/aoqJ/mThbMk1X2E
 c4QZUuxYZJsCGsKz/iEq8Uk49mtGGoHoP6WLQyJ1K8o9gUtasLSwN2SolQfXwAxO9qW8 IQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tst09re2u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Oct 2023 12:18:58 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39HC7tRB029212;
	Tue, 17 Oct 2023 12:18:57 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tst09re28-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Oct 2023 12:18:57 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39HBm791027163;
	Tue, 17 Oct 2023 12:18:56 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3tr6tk8m42-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Oct 2023 12:18:56 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39HCItwV26673834
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Oct 2023 12:18:55 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 37C1F58068;
	Tue, 17 Oct 2023 12:18:55 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B066458065;
	Tue, 17 Oct 2023 12:18:50 +0000 (GMT)
Received: from li-34d1fccc-27cd-11b2-a85c-c167793e56f7.ibm.com (unknown [9.171.12.6])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 17 Oct 2023 12:18:50 +0000 (GMT)
Message-ID: <9dc975aa52c50e564e5e314c1be5065c15916303.camel@linux.vnet.ibm.com>
Subject: Re: [PATCH] powerpc/paravirt: Improve vcpu_is_preempted
From: Aboorva Devarajan <aboorvad@linux.vnet.ibm.com>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Date: Tue, 17 Oct 2023 17:48:48 +0530
In-Reply-To: <20231009051740.17683-1-srikar@linux.vnet.ibm.com>
References: <20231009051740.17683-1-srikar@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-22.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: JO-VB4hcrzqdI7gVEXYx4z6NqJBkzDBF
X-Proofpoint-ORIG-GUID: JXQAtIKVAL_zoNUWLzJzGg6eTyTJRgeM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-16_13,2023-10-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 bulkscore=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 clxscore=1011 spamscore=0 mlxlogscore=999
 impostorscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2309180000 definitions=main-2310170103
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
Cc: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org, Ajay Kaher <akaher@vmware.com>, Nicholas Piggin <npiggin@gmail.com>, Alexey Makhalov <amakhalov@vmware.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2023-10-09 at 10:47 +0530, Srikar Dronamraju wrote:

Hi Srikar,

Benchmarked this patch on baremetal POWER9 node by launching KVM to
observe the improvements achieved in KVM with the patched kernel.
Below, you can find the schbench latency result comparision.

System was running on SMT4 mode with the below configuration:

Setup:

$ lscpu
Architecture:        ppc64le
Byte Order:          Little Endian
CPU(s):              128
On-line CPU(s) list: 0-127
Thread(s) per core:  4
Core(s) per socket:  16
Socket(s):           2
NUMA node(s):        8
Model:               2.3 (pvr 004e 1203)
Model name:          POWER9, altivec supported
CPU max MHz:         3800.0000
CPU min MHz:         2300.0000
L1d cache:           32K
L1i cache:           32K
L2 cache:            512K
L3 cache:            10240K
NUMA node0 CPU(s):   0-63
NUMA node8 CPU(s):   64-127
NUMA node250 CPU(s):
NUMA node251 CPU(s):
NUMA node252 CPU(s):
NUMA node253 CPU(s):
NUMA node254 CPU(s):
NUMA node255 CPU(s):

- Baseline kernel  : v6.6.0-rc5
- Patched kernel   : v6.6.0-rc5 with patchset
- schbench version : upto commit 2eef44 (schbench: record the 
  execution time in the matrix multiplication mode)


Results:
--------

These results shows the schbench latency on a patched kernel compared
to a baseline kernel on KVM. The numbers in the "compare%" column
represent the percentage difference between the latency measured on the
baseline kernel and the patched kernel. A negative percentage means the
patched kernel performs less optimially (higher latency) than the
baseline, while a positive percentage means it performs better (lower
latency).


Scenarios:
----------


Case 1: No Noise

Host: Idle
KVM 1: Launched a KVM affined to 0-39 CPUs (40 CPUs)
KVM 1 (Workload) : ./schbench -m 20 -t 2 -r 30 (benchmark)

schbench latency (niter: 20)

percentile      compare% (avg)
                (higher the better)

50.0th:	        -4.84
75.0th:	        -8.09
90.0th:	        -3.39
95.0th:	        +5.16
99.0th:	        +90.78
99.5th:	        +36.34
99.9th:	        +8.31

--------------------------------------------------------

Case 2: With Noise: Over-commit case: Multiple KVM guests sharing the
same set of CPUs

Two KVM instances are launched, where one being benchmarked, and the
other executing a workload to introduce noise.

KVM 1: Launched a KVM affined to 0-39 CPUs (40 CPUs)
KVM 1 (Workload) : ./schbench -m 20 -t 2 -r 30 (benchmark)

KVM 2 (Noise): Launched a KVM affined to 0-39 CPUs 

schbench latency (niter: 20)

percentile      compare% (avg) 
                (higher the better)

50.0th:	        -1.47
75.0th:         -5.72
90.0th:	        +7.88
95.0th:         +10.71
99.0th:	        +512.08
99.5th:	        +380.61
99.9th:	        +90.39

--------------------------------------------------------

Case 3: Overlap case: Multiple KVM guests sharing a subset of CPUs.

Two KVM instances are launched, where one being benchmarked, and the
other executing a workload to introduce noise.

KVM 1: Launched a KVM affined to 0-39 CPUs (40 CPUs)
KVM 1 (Workload) : ./schbench -m 20 -t 2 -r 30 (benchmark)

KVM 2 (Noise): Launched a KVM affined to 0-19 CPUs

schbench latency (niter: 20)

percentile      compare% (avg)
                (higher the better)

50.0th:	        -1.63
75.0th:	        -2.78
90.0th:         +57.62
95.0th:	        +87.90
99.0th:	        +343.66
99.5th:	        +178.01
99.9th:	        +36.07

--------------------------------------------------------

The above results demonstrate the effectiveness of the proposed
approach, which utilizes the idle-hint in lppaca to detect the
preempted vCPU more efficiently. This approach is beneficial for
improving schbench latency on KVM, particularly the tail latencies.

Thanks,
Aboorva

> PowerVM Hypervisor dispatches on a whole core basis. In a shared
> LPAR, a
> CPU from a core that is preempted may have a larger latency. In
> such a scenario, its preferable to choose a different CPU to run.
> 
> If one of the CPUs in the core is active, i.e neither CEDED nor
> preempted, then consider this CPU as not preempted.
> 
> Also if any of the CPUs in the core has yielded but OS has not
> requested
> CEDE or CONFER, then consider this CPU to be preempted.
> 
> Cc: Ajay Kaher <akaher@vmware.com>
> Cc: Alexey Makhalov <amakhalov@vmware.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Juergen Gross <jgross@suse.com>
> Cc: linux-kernel@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: virtualization@lists.linux-foundation.org
> Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
> ---
>  arch/powerpc/include/asm/paravirt.h | 33 ++++++++++++++++++++++++++-
> --
>  1 file changed, 30 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/paravirt.h
> b/arch/powerpc/include/asm/paravirt.h
> index e08513d73119..a980756f58df 100644
> --- a/arch/powerpc/include/asm/paravirt.h
> +++ b/arch/powerpc/include/asm/paravirt.h
> @@ -121,9 +121,19 @@ static inline bool vcpu_is_preempted(int cpu)
>  	if (!is_shared_processor())
>  		return false;
>  
> +	if (!(yield_count_of(cpu) & 1))
> +		return false;
> +
> +	/*
> +	 * If CPU has yielded but OS has not requested idle then this
> CPU is
> +	 * definitely preempted.
> +	 */
> +	if (!lppaca_of(cpu).idle)
> +		return true;
> +
>  #ifdef CONFIG_PPC_SPLPAR
>  	if (!is_kvm_guest()) {
> -		int first_cpu;
> +		int first_cpu, i;
>  
>  		/*
>  		 * The result of vcpu_is_preempted() is used in a
> @@ -149,11 +159,28 @@ static inline bool vcpu_is_preempted(int cpu)
>  		 */
>  		if (cpu_first_thread_sibling(cpu) == first_cpu)
>  			return false;
> +
> +		/*
> +		 * If any of the threads of this core is not preempted
> or
> +		 * ceded, then consider this CPU to be non-preempted
> +		 */
> +		first_cpu = cpu_first_thread_sibling(cpu);
> +		for (i = first_cpu; i < first_cpu + threads_per_core;
> i++) {
> +			if (i == cpu)
> +				continue;
> +			if (!(yield_count_of(i) & 1))
> +				return false;
> +			if (!lppaca_of(i).idle)
> +				return true;
> +		}
>  	}
>  #endif
>  
> -	if (yield_count_of(cpu) & 1)
> -		return true;
> +	/*
> +	 * None of the threads in this thread group are running but
> none of
> +	 * them were preempted too. Hence assume the thread to be
> +	 * non-preempted.
> +	 */
>  	return false;
>  }
>  

