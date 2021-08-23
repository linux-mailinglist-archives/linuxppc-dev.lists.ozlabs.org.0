Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 84AD33F474E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Aug 2021 11:22:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GtRbm343Cz2xs3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Aug 2021 19:22:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pzWzgDzg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=pzWzgDzg; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GtRZw3rJWz2xg5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Aug 2021 19:22:00 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17N92vU7009766; Mon, 23 Aug 2021 05:21:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=okoaRYi+/lTcUGZGOiHFvGkdYP49QudhReGuE6d1bm8=;
 b=pzWzgDzg/bWo5C5xBHL86PJTvfzV/7KuVhy9utHr8oXrOnGM6Jv00w6TspgsBknATR9H
 aZJdL8Au41zLJNGRxhklxKJmbejnlQsF4AJJJRnVejcyF89Vb0h1h1TB0oPQS+8zEQuH
 BbHI+OeQVu67ODRn1YBJ1pV2l2cUgq5TvK081PpUtEEK3ki6Dg3S427WwzU/SnZL00q6
 DS0df6ngV9UvoX9FSShEACT8YPkdlp26Q9LNXcYf8AYhM79xMs8B/zBuZxSO8teElkzS
 0geYYwTXeaYPuBgTyuAdOGHZVhCMq+/BAhfClo5+WyCjhml7WqllDF/Yt6PXqpI0JLaK iw== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3am73ju96p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Aug 2021 05:21:40 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17N9HEfI029420;
 Mon, 23 Aug 2021 09:21:38 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03fra.de.ibm.com with ESMTP id 3ajs48ak5v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Aug 2021 09:21:38 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 17N9Hunb20513160
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 Aug 2021 09:17:56 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4D41E42045;
 Mon, 23 Aug 2021 09:21:34 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E8AEC4205F;
 Mon, 23 Aug 2021 09:21:33 +0000 (GMT)
Received: from pomme.local (unknown [9.145.94.172])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 23 Aug 2021 09:21:33 +0000 (GMT)
Subject: Re: [PATCH v2 1/3] powerpc/numa: Print debug statements only when
 required
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <20210821102535.169643-1-srikar@linux.vnet.ibm.com>
 <20210821102535.169643-2-srikar@linux.vnet.ibm.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
Message-ID: <b8bbc10b-5432-512f-5899-455302a59d01@linux.ibm.com>
Date: Mon, 23 Aug 2021 11:21:33 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210821102535.169643-2-srikar@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 1XcvW-SS7HDJT8mdkKySnN6QwEvMtazC
X-Proofpoint-GUID: 1XcvW-SS7HDJT8mdkKySnN6QwEvMtazC
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-23_02:2021-08-23,
 2021-08-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 clxscore=1011 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=986 phishscore=0 spamscore=0
 lowpriorityscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2107140000 definitions=main-2108230059
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Gautham R Shenoy <ego@linux.vnet.ibm.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>,
 Valentin Schneider <valentin.schneider@arm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le 21/08/2021 à 12:25, Srikar Dronamraju a écrit :
> Currently, a debug message gets printed every time an attempt to
> add(remove) a CPU. However this is redundant if the CPU is already added
> (removed) from the node.
> 
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: Nathan Lynch <nathanl@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Ingo Molnar <mingo@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Valentin Schneider <valentin.schneider@arm.com>
> Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>
> Cc: Vincent Guittot <vincent.guittot@linaro.org>
> Cc: Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>
> Cc: Laurent Dufour <ldufour@linux.ibm.com>
> Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
> ---
>   arch/powerpc/mm/numa.c | 11 +++++------
>   1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
> index f2bf98bdcea2..fbe03f6840e0 100644
> --- a/arch/powerpc/mm/numa.c
> +++ b/arch/powerpc/mm/numa.c
> @@ -141,10 +141,11 @@ static void map_cpu_to_node(int cpu, int node)
>   {
>   	update_numa_cpu_lookup_table(cpu, node);
>   
> -	dbg("adding cpu %d to node %d\n", cpu, node);
>   
> -	if (!(cpumask_test_cpu(cpu, node_to_cpumask_map[node])))
> +	if (!(cpumask_test_cpu(cpu, node_to_cpumask_map[node]))) {
> +		dbg("adding cpu %d to node %d\n", cpu, node);
>   		cpumask_set_cpu(cpu, node_to_cpumask_map[node]);
> +	}
>   }
>   
>   #if defined(CONFIG_HOTPLUG_CPU) || defined(CONFIG_PPC_SPLPAR)
> @@ -152,13 +153,11 @@ static void unmap_cpu_from_node(unsigned long cpu)
>   {
>   	int node = numa_cpu_lookup_table[cpu];
>   
> -	dbg("removing cpu %lu from node %d\n", cpu, node);
> -
>   	if (cpumask_test_cpu(cpu, node_to_cpumask_map[node])) {
>   		cpumask_clear_cpu(cpu, node_to_cpumask_map[node]);
> +		dbg("removing cpu %lu from node %d\n", cpu, node);
>   	} else {
> -		printk(KERN_ERR "WARNING: cpu %lu not found in node %d\n",
> -		       cpu, node);
> +		pr_err("WARNING: cpu %lu not found in node %d\n", cpu, node);

Would pr_warn() be more appropriate here (or removing the "WARNING" statement)?

>   	}
>   }
>   #endif /* CONFIG_HOTPLUG_CPU || CONFIG_PPC_SPLPAR */
> 

