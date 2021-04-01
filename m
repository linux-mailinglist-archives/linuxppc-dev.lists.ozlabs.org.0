Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2033522F2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 00:54:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FBJRJ5V7Nz3bsM
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 09:54:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZIsXk6o/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ZIsXk6o/; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FBJQs0MB3z2yx1
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Apr 2021 09:54:28 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 131MXYN9015592; Thu, 1 Apr 2021 18:51:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=4HQFY0DLQQZVXSP8UOIRNBVq8B1kUu5uE3kElhyNkBI=;
 b=ZIsXk6o/N+MbnXw+lwOfJ/gyQ5RuHMaqqn6kDTokFZ57SCyqXEfeq2Kg9j6rnO2XSC+e
 Ea5twQur0sr7KLOzN8lfxbdabkw50s5UMmXJ2/9MWv9gk1U0DYW6wIlwGcHSZ8fNRhjL
 Lq6ntRpfABzt9rhIXtKfaDoHaIB8vF7IaU8rYkwsVBryEAEzUQ9WH93WfanDgsrMmBxa
 gI0zH/KSFMZFEGCE+kPqaufDKW3bZWr4QSEi1otg5cFzFHzskxMxO/upcWxSiSdKZ5KW
 odRhv3SAvouKl/2eg9FbKj1bK5B+ef4K7uQ9wlWY9cLg0q6pAq2U4xbdqrULUPzNhsFD OQ== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37njj9qx7v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Apr 2021 18:51:07 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 131Ml09O003669;
 Thu, 1 Apr 2021 22:51:07 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma01wdc.us.ibm.com with ESMTP id 37n2907dsw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Apr 2021 22:51:07 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 131Mp5Km13631790
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 1 Apr 2021 22:51:05 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C99CCBE056;
 Thu,  1 Apr 2021 22:51:05 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A4941BE053;
 Thu,  1 Apr 2021 22:51:05 +0000 (GMT)
Received: from localhost (unknown [9.163.15.116])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  1 Apr 2021 22:51:05 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/1] powerpc/smp: Set numa node before updating mask
In-Reply-To: <20210401154200.150077-1-srikar@linux.vnet.ibm.com>
References: <20210401154200.150077-1-srikar@linux.vnet.ibm.com>
Date: Thu, 01 Apr 2021 17:51:05 -0500
Message-ID: <87czvdbova.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: tgM1oq83-x0NNycPn-SvEBEJQAiohKZO
X-Proofpoint-GUID: tgM1oq83-x0NNycPn-SvEBEJQAiohKZO
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-04-01_14:2021-04-01,
 2021-04-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 impostorscore=0 clxscore=1011 malwarescore=0 mlxlogscore=999
 bulkscore=0 lowpriorityscore=0 spamscore=0 mlxscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2103310000 definitions=main-2104010143
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
Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>, Scott Cheloha <cheloha@linux.ibm.com>,
 Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>,
 Ingo Molnar <mingo@kernel.org>, Laurent Dufour <ldufour@linux.vnet.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Valentin Schneider <valentin.schneider@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Srikar,

Thanks for figuring this out.

Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:
>
> Some of the per-CPU masks use cpu_cpu_mask as a filter to limit the search
> for related CPUs. On a dlpar add of a CPU, update cpu_cpu_mask before
> updating the per-CPU masks. This will ensure the cpu_cpu_mask is updated
> correctly before its used in setting the masks. Setting the numa_node will
> ensure that when cpu_cpu_mask() gets called, the correct node number is
> used. This code movement helped fix the above call trace.
>
>
> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> index 5a4d59a1070d..1a99d75679a8 100644
> --- a/arch/powerpc/kernel/smp.c
> +++ b/arch/powerpc/kernel/smp.c
> @@ -1521,6 +1521,9 @@ void start_secondary(void *unused)
>  
>  	vdso_getcpu_init();
>  #endif
> +	set_numa_node(numa_cpu_lookup_table[cpu]);
> +	set_numa_mem(local_memory_node(numa_cpu_lookup_table[cpu]));
> +
>  	/* Update topology CPU masks */
>  	add_cpu_to_masks(cpu);
>  
> @@ -1539,9 +1542,6 @@ void start_secondary(void *unused)
>  			shared_caches = true;
>  	}
>  
> -	set_numa_node(numa_cpu_lookup_table[cpu]);
> -	set_numa_mem(local_memory_node(numa_cpu_lookup_table[cpu]));
> -

Regardless of your change: at boot time, this set of calls to
set_numa_node() and set_numa_mem() is redundant, right? Because
smp_prepare_cpus() has:

	for_each_possible_cpu(cpu) {
		...
		if (cpu_present(cpu)) {
			set_cpu_numa_node(cpu, numa_cpu_lookup_table[cpu]);
			set_cpu_numa_mem(cpu,
				local_memory_node(numa_cpu_lookup_table[cpu]));
		}

I would rather that, when onlining a CPU that happens to have been
dynamically added after boot, we enter start_secondary() with conditions
equivalent to those at boot time. Or as close to that as is practical.

So I'd suggest that pseries_add_processor() be made to update
these things when the CPUs are marked present, before onlining them.
