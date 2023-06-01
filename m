Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E460719E0D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 15:28:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QX6R95dGsz3dxR
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 23:28:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZtVj7QfP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZtVj7QfP;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QX6QG22pTz3cgq
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jun 2023 23:28:05 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 351DDUYp018739;
	Thu, 1 Jun 2023 13:27:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=bPE9AxXhG80C4torBNp1dgqNJL9dzxzABLAPHZlRU4c=;
 b=ZtVj7QfP7IaRKJkngAiqZPkdIdLpxo3dz9kg7bawD1r3/JUrkOoKmNZEAY6ztjsFWXjb
 Wzn+DNiWS9M9E3rhsdi32yPUbVTol70R/IVUPnTKmt2p0XGjXQCjbLanQFXwhNsO1CSX
 IytfDJRa+qAIHhkfdsFuAnOimhf1BSOu3dnsW1p6GIjGXlT8hrp3trb8UbfoiezhStlk
 rFQo/bqSV5X1i8u2Ka88dctnU8GImgNpK38EgNBjyT+zKak6AB0qvRbLvlsk9B7S+ctp
 B/XuUUulM9tRXQ74eBP6SMWxwAu/tZ8NZHcGWLrx8nFY791bKcvacMZSVNUQv58zhxbO NQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qxv1a8ksv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Jun 2023 13:27:36 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 351DE17r022544;
	Thu, 1 Jun 2023 13:27:36 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qxv1a8krq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Jun 2023 13:27:35 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3510vbWW006682;
	Thu, 1 Jun 2023 13:27:34 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3qu94e2hyt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Jun 2023 13:27:33 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 351DRV6j32113240
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 1 Jun 2023 13:27:31 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 97E5C2004B;
	Thu,  1 Jun 2023 13:27:31 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3A4AC20043;
	Thu,  1 Jun 2023 13:27:31 +0000 (GMT)
Received: from [9.144.159.119] (unknown [9.144.159.119])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  1 Jun 2023 13:27:31 +0000 (GMT)
Message-ID: <5752a488-be54-61a0-6d18-647456abc4ee@linux.ibm.com>
Date: Thu, 1 Jun 2023 15:27:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH 8/9] powerpc: Add HOTPLUG_SMT support
To: Michael Ellerman <mpe@ellerman.id.au>, linux-kernel@vger.kernel.org
References: <20230524155630.794584-1-mpe@ellerman.id.au>
 <20230524155630.794584-8-mpe@ellerman.id.au>
Content-Language: en-US
From: Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <20230524155630.794584-8-mpe@ellerman.id.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: eTDF-zGZ2zA_y9IcYigGwfomNzbW0tV5
X-Proofpoint-ORIG-GUID: dun_0TqE2rOk885f52-ndoe6QkF9Vmkk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-01_08,2023-05-31_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=999 phishscore=0
 clxscore=1011 malwarescore=0 adultscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306010115
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
Cc: linux-arch@vger.kernel.org, x86@kernel.org, dave.hansen@linux.intel.com, mingo@redhat.com, bp@alien8.de, tglx@linutronix.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 24/05/2023 17:56:29, Michael Ellerman wrote:
> Add support for HOTPLUG_SMT, which enables the generic sysfs SMT support
> files in /sys/devices/system/cpu/smt, as well as the "nosmt" boot
> parameter.

Hi Michael,

It seems that there is now a conflict between with the PPC 'smt-enabled'
boot option.

Booting the patched kernel with 'smt-enabled=4', later, change to the SMT
level (for instance to 6) done through /sys/devices/system/cpu/smt/control
are not applied. Nothing happens.
Based on my early debug, I think the reasons is that cpu_smt_num_threads=8
when entering __store_smt_control(). But I need to dig further.

BTW, should the 'smt-enabled' PPC specific option remain?

Cheers,
Laurent.

> Implement the recently added hooks to allow partial SMT states, allow
> any number of threads per core.
> 
> Tie the config symbol to HOTPLUG_CPU, which enables it on the major
> platforms that support SMT. If there are other platforms that want the
> SMT support that can be tweaked in future.
> 
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  arch/powerpc/Kconfig                |  1 +
>  arch/powerpc/include/asm/topology.h | 25 +++++++++++++++++++++++++
>  arch/powerpc/kernel/smp.c           |  3 +++
>  3 files changed, 29 insertions(+)
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 539d1f03ff42..5cf87ca10a9c 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -273,6 +273,7 @@ config PPC
>  	select HAVE_SYSCALL_TRACEPOINTS
>  	select HAVE_VIRT_CPU_ACCOUNTING
>  	select HAVE_VIRT_CPU_ACCOUNTING_GEN
> +	select HOTPLUG_SMT			if HOTPLUG_CPU
>  	select HUGETLB_PAGE_SIZE_VARIABLE	if PPC_BOOK3S_64 && HUGETLB_PAGE
>  	select IOMMU_HELPER			if PPC64
>  	select IRQ_DOMAIN
> diff --git a/arch/powerpc/include/asm/topology.h b/arch/powerpc/include/asm/topology.h
> index 8a4d4f4d9749..1e9117a22d14 100644
> --- a/arch/powerpc/include/asm/topology.h
> +++ b/arch/powerpc/include/asm/topology.h
> @@ -143,5 +143,30 @@ static inline int cpu_to_coregroup_id(int cpu)
>  #endif
>  #endif
>  
> +#ifdef CONFIG_HOTPLUG_SMT
> +#include <linux/cpu_smt.h>
> +#include <asm/cputhreads.h>
> +
> +static inline bool topology_smt_supported(void)
> +{
> +	return threads_per_core > 1;
> +}
> +
> +static inline bool topology_smt_threads_supported(unsigned int num_threads)
> +{
> +	return num_threads <= threads_per_core;
> +}
> +
> +static inline bool topology_is_primary_thread(unsigned int cpu)
> +{
> +	return cpu == cpu_first_thread_sibling(cpu);
> +}
> +
> +static inline bool topology_smt_thread_allowed(unsigned int cpu)
> +{
> +	return cpu_thread_in_core(cpu) < cpu_smt_num_threads;
> +}
> +#endif
> +
>  #endif /* __KERNEL__ */
>  #endif	/* _ASM_POWERPC_TOPOLOGY_H */
> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> index 265801a3e94c..eed20b9253b7 100644
> --- a/arch/powerpc/kernel/smp.c
> +++ b/arch/powerpc/kernel/smp.c
> @@ -1154,6 +1154,9 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
>  
>  	if (smp_ops && smp_ops->probe)
>  		smp_ops->probe();
> +
> +	// Initalise the generic SMT topology support
> +	cpu_smt_check_topology(threads_per_core);
>  }
>  
>  void smp_prepare_boot_cpu(void)

