Return-Path: <linuxppc-dev+bounces-14013-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BA6C482C9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Nov 2025 18:03:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d4wwW0lS0z2xqj;
	Tue, 11 Nov 2025 04:03:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762794202;
	cv=none; b=SAWAoMlmrG75+Wg+Ik7ui7Bh+pUUTksAaoPRTNU5ejiK6MoFV8wM+HW5LESLjTiJYWlVHAfwoAE9u9bkRSfiK+zvHz8z8ZSQXxX6ztPadprWpBovH7a9Qx3joHbrFg91Ln/9NGdZKA7opoZLF4He8n1bM7njEYT2ewYCQNd3ISBBBc/NrHGFmRbDPNUziIJW5nPkGRv8TK4R6KZUs2eRAdVUH8qtoN66I56O4CdY7yf+F6Gw4b4n/qlvwdZOTXfSeuS43O4boCxZT8V5RvTHFz98ve0xhjGPBnTd16C5ZB+f5as3zCD4WEnjrfG/MEAFnNvH83s9abDZvPrwEPNSXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762794202; c=relaxed/relaxed;
	bh=eyMgkQAz6dS7bO5FbsUIEIAl+bd+EVxxpRwDcgLzq7o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B6GYFbsinj+vFF9i4iVD6bY+10lEYyibux2BIHiSsNoOvRi49MNCJreXmX4y3heAnqOGz6WAeF6P8UPrnN4xrRt91bm1E1Y6xp7GkFKECpa7jMhSHOK+jnjHBKoVY8Mzx2j5V2H8fDVyzQW3BfE2J8mh7zxOtEvp1V3AhU8pRTL6zJ/K7Ym42xstmzAI/rqE309qOuWLrLAN4KJFDugAMlqIXJXaOUfaOxpQukpTnsb4HDTUXSTLVJ8xAoWzuMF9Svm0VFxk8j8KfYxoLEfVfxyq7Ux7xwz94Vdeh05pxGoNa9EMwp9POzZMsi2hR1mRDYNClCtMdWyrd4FDQizpHA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Gugj/G+U; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Gugj/G+U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d4wwT5y8Fz2xqL
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Nov 2025 04:03:21 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AADeCNZ028678;
	Mon, 10 Nov 2025 17:02:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=eyMgkQ
	Az6dS7bO5FbsUIEIAl+bd+EVxxpRwDcgLzq7o=; b=Gugj/G+U963wZ1+A0vqmwM
	pJwDgdvDc/BJ8o2RWU7tYdazB5IC2Q8j4HPLDbSzf1vAQ75CmecQv7QsrwbYOi1P
	/kNPSDSzGPAFTPqO6msD/4vw1B2XSJb7nGJ2F9K0zPyP3nzBxC2ZWbtQGl6Z1WtW
	wn3UYM64b9ZmQaPToK4KkXOVPXAUJ3rfvhQduqp1Tnoan/ZpvnUZBup+Kwj8G84K
	G/5ik8HYURMlqTiSjBSKwGZExKLca7cl9aM8jvpqbrSjIxJzjcCy73Qt84Gu9lyu
	0jJ1XY+jzSGQdRceFlN9ij9ZPQqsBjGEWJMrZLRSI7w7abke7LtldfQ2Ajdk5cPA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a9wgwr9ha-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Nov 2025 17:02:57 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AAGtVmD015836;
	Mon, 10 Nov 2025 17:02:57 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a9wgwr9h8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Nov 2025 17:02:56 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AAGTZen014759;
	Mon, 10 Nov 2025 17:02:56 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4aahpjxmyu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Nov 2025 17:02:56 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AAH2pka58720762
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Nov 2025 17:02:51 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 17D6A20043;
	Mon, 10 Nov 2025 17:02:51 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 242AF20040;
	Mon, 10 Nov 2025 17:02:49 +0000 (GMT)
Received: from [9.124.210.118] (unknown [9.124.210.118])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 10 Nov 2025 17:02:48 +0000 (GMT)
Message-ID: <53fd537b-5549-427f-ad7d-28d58daaa5bd@linux.ibm.com>
Date: Mon, 10 Nov 2025 22:32:48 +0530
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/smp: Expose die_id and die_cpumask
To: Srikar Dronamraju <srikar@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
        linux-kernel@vger.kernel.org,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>
References: <20251028105734.1894998-1-srikar@linux.ibm.com>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20251028105734.1894998-1-srikar@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: yLdmRwN_1XDHZT-_nq1UmgV_rjsezNAX
X-Proofpoint-ORIG-GUID: NOMlJ4g_SXKRAtFtr-oSaoY6o5BGSuSL
X-Authority-Analysis: v=2.4 cv=VMPQXtPX c=1 sm=1 tr=0 ts=69121ac1 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=XNNoshNgl4cG0apxiokA:9 a=QEXdDO2ut3YA:10
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA4MDAyMiBTYWx0ZWRfXy5G8w2FTlkBB
 rxFV9nPA06JStMZn6WJg8Z/kQarDfSyi7ixSLwq5ksuwxENpxf8YYeb16EeVTNeTv2GkRgUFXMO
 LKWf3wSDjY8+oE8R3YGKMJULeRcyCk2tNFLF+LLSQpeE3KFYEKen9TdgqDSITDDdJmix/niOCBj
 tjTN2bfIFecmgu85cfT3YKyZA7u0slnCNQPpraNQ3ZP7MS5Qx0WKeDdG6fjO9uHII/bCdayYsar
 t7+EJ0H1eYRJtgw2fabypiZRoJQxV4GfD8aS1i51ztwl6sg0nRetHgw15SRlBtrssH79X8i6R4C
 GCooVXrbl0ozDrqpS1k6aYnOb1PbLc2eOv7mU+SKBYwXewIL3V1lmq8zuzjXFemxe9dNm15jl+7
 NoemuTDM7GVf50p/p9FrpY2+Zu2NqQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_06,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1015 phishscore=0 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2511080022
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



> 
> Without this change.
> $ grep . /sys/devices/system/cpu/cpu8/topology/{die*,package*} 2> /dev/null
> /sys/devices/system/cpu/cpu8/topology/package_cpus:0000,ffffff00
> /sys/devices/system/cpu/cpu8/topology/package_cpus_list:8-31
> 
> With this change.
> $ grep . /sys/devices/system/cpu/cpu8/topology/{die*,package*} 2> /dev/null
> /sys/devices/system/cpu/cpu8/topology/die_cpus:0000,0000ff00
> /sys/devices/system/cpu/cpu8/topology/die_cpus_list:8-15
> /sys/devices/system/cpu/cpu8/topology/die_id:4
> /sys/devices/system/cpu/cpu8/topology/package_cpus:0000,ffffff00
> /sys/devices/system/cpu/cpu8/topology/package_cpus_list:8-31
> 
> snipped lstopo-no-graphics o/p
> Group0 L#0
>    Package L#1
>      NUMANode L#1 (P#2 8135MB)
>      Die L#0 + Core L#1

Die L#0 -> Here L# indicates logical die number.
One should run --verbose  to see theactual die_id.

For example:
Die L#8 (P#25) --> die_id is 25.


Maybe you could the same CPU's (CPU8) info of lstopo here?


>        L3 L#2 (4096KB) + L2 L#2 (1024KB) + L1d L#2 (32KB) + L1i L#2 (48KB)
>          PU L#8 (P#8)

> 
> Signed-off-by: Srikar Dronamraju <srikar@linux.ibm.com>
> ---
>   arch/powerpc/include/asm/topology.h |  4 ++++
>   arch/powerpc/kernel/smp.c           | 18 ++++++++++++++++++
>   2 files changed, 22 insertions(+)
> 
> diff --git a/arch/powerpc/include/asm/topology.h b/arch/powerpc/include/asm/topology.h
> index f19ca44512d1..c6ad1eb7e44a 100644
> --- a/arch/powerpc/include/asm/topology.h
> +++ b/arch/powerpc/include/asm/topology.h
> @@ -132,6 +132,8 @@ static inline int cpu_to_coregroup_id(int cpu)
>   #include <asm/cputable.h>
>   
>   struct cpumask *cpu_coregroup_mask(int cpu);
> +const struct cpumask *cpu_die_mask(int cpu);
> +int cpu_die_id(int cpu);
>   
>   #ifdef CONFIG_PPC64
>   #include <asm/smp.h>
> @@ -141,6 +143,8 @@ struct cpumask *cpu_coregroup_mask(int cpu);
>   #define topology_sibling_cpumask(cpu)	(per_cpu(cpu_sibling_map, cpu))
>   #define topology_core_cpumask(cpu)	(per_cpu(cpu_core_map, cpu))
>   #define topology_core_id(cpu)		(cpu_to_core_id(cpu))
> +#define topology_die_id(cpu) (cpu_die_id(cpu))
> +#define topology_die_cpumask(cpu) (cpu_die_mask(cpu))
>   

nit:

can we fix the tab spacing here please? Maybe like below?

+#define topology_sibling_cpumask(cpu)          (per_cpu(cpu_sibling_map, cpu))
+#define topology_core_cpumask(cpu)             (per_cpu(cpu_core_map, cpu))
+#define topology_core_id(cpu)                  (cpu_to_core_id(cpu))
+#define topology_die_id(cpu)                   (cpu_die_id(cpu))
+#define topology_die_cpumask(cpu)              (cpu_die_mask(cpu))

>   #endif
>   #endif
> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> index 68edb66c2964..a0b0b46b78e3 100644
> --- a/arch/powerpc/kernel/smp.c
> +++ b/arch/powerpc/kernel/smp.c
> @@ -1085,6 +1085,24 @@ static int __init init_big_cores(void)
>   	return 0;
>   }
>

As you have mentioned in the changelog, could you add a comment here
explaining on which systems we see this information correctly.   
> +const struct cpumask *cpu_die_mask(int cpu)
> +{
> +	if (has_coregroup_support())
> +		return per_cpu(cpu_coregroup_map, cpu);
> +	else
> +		return cpu_node_mask(cpu);
> +}
> +EXPORT_SYMBOL_GPL(cpu_die_mask);
> +
> +int cpu_die_id(int cpu)
> +{
> +	if (has_coregroup_support())
> +		return cpu_to_coregroup_id(cpu);
> +	else
> +		return -1;
> +}
> +EXPORT_SYMBOL_GPL(cpu_die_id);
> +
>   void __init smp_prepare_cpus(unsigned int max_cpus)
>   {
>   	unsigned int cpu, num_threads;


Other than above:

Reviewed-by: Shrikanth Hegde <sshegde@linux.ibm.com>

