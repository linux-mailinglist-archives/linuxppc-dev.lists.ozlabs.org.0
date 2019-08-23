Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9619A8A9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2019 09:22:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46FCXD50grzDrgd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2019 17:22:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=sathnaga@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46FCPx1yspzDrNG
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2019 17:16:46 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7N7D2AH086088
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2019 03:16:44 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uj9mav4t9-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2019 03:16:43 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sathnaga@linux.vnet.ibm.com>;
 Fri, 23 Aug 2019 08:16:41 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 23 Aug 2019 08:16:38 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7N7Gaab33751214
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 23 Aug 2019 07:16:37 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C788CA4069;
 Fri, 23 Aug 2019 07:16:36 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 52A15A4054;
 Fri, 23 Aug 2019 07:16:35 +0000 (GMT)
Received: from sathnaga86 (unknown [9.85.80.117])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri, 23 Aug 2019 07:16:35 +0000 (GMT)
Date: Fri, 23 Aug 2019 12:46:32 +0530
From: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH 2/3] powerpc/numa: Early request for home node
 associativity
References: <20190822144235.19398-1-srikar@linux.vnet.ibm.com>
 <20190822144235.19398-3-srikar@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190822144235.19398-3-srikar@linux.vnet.ibm.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-TM-AS-GCONF: 00
x-cbid: 19082307-0020-0000-0000-000003630C23
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19082307-0021-0000-0000-000021B84AC7
Message-Id: <20190823071632.GA10037@sathnaga86>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-23_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908230073
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
Reply-To: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
Cc: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 22, 2019 at 08:12:34PM +0530, Srikar Dronamraju wrote:
> Currently the kernel detects if its running on a shared lpar platform
> and requests home node associativity before the scheduler sched_domains
> are setup. However between the time NUMA setup is initialized and the
> request for home node associativity, workqueue initializes its per node
> cpumask. The per node workqueue possible cpumask may turn invalid
> after home node associativity resulting in weird situations like
> workqueue possible cpumask being a subset of workqueue online cpumask.

Tested this series on Power KVM guest and expected that it fixes 
https://github.com/linuxppc/issues/issues/167 but am able to see the below warning
still while doing vcpu hotplug with numa nodes, Advise if am missing anything or
this is not the intended series to fix above issue.

Env:
HW: Power8
Host/Guest Kernel: 5.3.0-rc5-00172-g13e3f1076e29 (linux master + this series)
Qemu: 4.0.90 (v4.1.0-rc3)

Guest Config:
..
 <vcpu placement='static' current='2'>4</vcpu>
...
    <kernel>/home/kvmci/linux/vmlinux</kernel>
    <cmdline>root=/dev/sda2 rw console=tty0 console=ttyS0,115200 init=/sbin/init  initcall_debug numa=debug crashkernel=1024M selinux=0</cmdline>
...
  <topology sockets='1' cores='2' threads='2'/>
    <numa>
      <cell id='0' cpus='0-1' memory='2097152' unit='KiB'/>
      <cell id='1' cpus='2-3' memory='2097152' unit='KiB'/>
    </numa>

Event: 
vcpu hotplug

[root@atest-guest ~]# [   41.447170] random: crng init done
[   41.448153] random: 7 urandom warning(s) missed due to ratelimiting
[   51.727256] VPHN hcall succeeded. Reset polling...
[   51.826301] adding cpu 2 to node 1
[   51.856238] WARNING: workqueue cpumask: online intersect > possible intersect
[   51.916297] VPHN hcall succeeded. Reset polling...
[   52.036272] adding cpu 3 to node 1


Regards,
-Satheesh.
> 
> This can be fixed by requesting home node associativity earlier just
> before NUMA setup. However at the NUMA setup time, kernel may not be in
> a position to detect if its running on a shared lpar platform. So
> request for home node associativity and if the request fails, fallback
> on the device tree property.
> 
> However home node associativity requires cpu's hwid which is set in
> smp_setup_pacas. Hence call smp_setup_pacas before numa_setup_cpus.
> 
> Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Nathan Lynch <nathanl@linux.ibm.com>
> Cc: linuxppc-dev@lists.ozlabs.org
> Reported-by: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
> Reported-by: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
> ---
>  arch/powerpc/kernel/setup-common.c |  5 +++--
>  arch/powerpc/mm/numa.c             | 28 +++++++++++++++++++++++++++-
>  2 files changed, 30 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
> index 1f8db66..9135dba 100644
> --- a/arch/powerpc/kernel/setup-common.c
> +++ b/arch/powerpc/kernel/setup-common.c
> @@ -888,6 +888,9 @@ void __init setup_arch(char **cmdline_p)
>  	/* Check the SMT related command line arguments (ppc64). */
>  	check_smt_enabled();
> 
> +#ifdef CONFIG_SMP
> +	smp_setup_pacas();
> +#endif
>  	/* Parse memory topology */
>  	mem_topology_setup();
> 
> @@ -899,8 +902,6 @@ void __init setup_arch(char **cmdline_p)
>  	 * so smp_release_cpus() does nothing for them.
>  	 */
>  #ifdef CONFIG_SMP
> -	smp_setup_pacas();
> -
>  	/* On BookE, setup per-core TLB data structures. */
>  	setup_tlb_core_data();
> 
> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
> index 88b5157..7965d3b 100644
> --- a/arch/powerpc/mm/numa.c
> +++ b/arch/powerpc/mm/numa.c
> @@ -461,6 +461,21 @@ static int of_drconf_to_nid_single(struct drmem_lmb *lmb)
>  	return nid;
>  }
> 
> +static int vphn_get_nid(unsigned long cpu)
> +{
> +	__be32 associativity[VPHN_ASSOC_BUFSIZE] = {0};
> +	long rc;
> +
> +	/* Use associativity from first thread for all siblings */
> +	rc = hcall_vphn(get_hard_smp_processor_id(cpu),
> +				VPHN_FLAG_VCPU, associativity);
> +
> +	if (rc == H_SUCCESS)
> +		return  associativity_to_nid(associativity);
> +
> +	return NUMA_NO_NODE;
> +}
> +
>  /*
>   * Figure out to which domain a cpu belongs and stick it there.
>   * Return the id of the domain used.
> @@ -490,7 +505,18 @@ static int numa_setup_cpu(unsigned long lcpu)
>  			goto out;
>  	}
> 
> -	nid = of_node_to_nid_single(cpu);
> +	/*
> +	 * On a shared lpar, the device tree might not have the correct node
> +	 * associativity.  At this time lppaca, or its __old_status field
> +	 * may not be updated. Hence request an explicit associativity
> +	 * irrespective of whether the lpar is shared or dedicated.  Use the
> +	 * device tree property as a fallback.
> +	 */
> +	if (firmware_has_feature(FW_FEATURE_VPHN))
> +		nid = vphn_get_nid(lcpu);
> +
> +	if (nid == NUMA_NO_NODE)
> +		nid = of_node_to_nid_single(cpu);
> 
>  out_present:
>  	if (nid < 0 || !node_possible(nid))
> -- 
> 1.8.3.1
> 

