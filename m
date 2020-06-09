Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8623D1F34C7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 09:24:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49h1p562kKzDqFM
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 17:24:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sandipan@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49h0NQ20qDzDqcK
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jun 2020 16:20:22 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05963Mgb091322; Tue, 9 Jun 2020 02:20:17 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31g41ejw1g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Jun 2020 02:20:16 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0596BEwP009747;
 Tue, 9 Jun 2020 06:20:14 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 31g2s7wbf0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Jun 2020 06:20:14 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0596KAEL48169082
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 9 Jun 2020 06:20:10 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 56ACD4C040;
 Tue,  9 Jun 2020 06:20:10 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 15A1C4C052;
 Tue,  9 Jun 2020 06:20:09 +0000 (GMT)
Received: from [9.199.39.62] (unknown [9.199.39.62])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  9 Jun 2020 06:20:08 +0000 (GMT)
Subject: Re: [PATCH] selftests: powerpc: Fix online CPU selection
From: Sandipan Das <sandipan@linux.ibm.com>
To: mpe@ellerman.id.au
References: <20200608144212.985144-1-sandipan@linux.ibm.com>
Message-ID: <ba90f6ae-83a9-e69c-eb6a-ddd27ba82794@linux.ibm.com>
Date: Tue, 9 Jun 2020 11:50:08 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200608144212.985144-1-sandipan@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-09_01:2020-06-08,
 2020-06-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 clxscore=1015 mlxlogscore=999
 bulkscore=0 suspectscore=3 cotscore=-2147483648 priorityscore=1501
 spamscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006090046
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
Cc: shiganta@in.ibm.com, linuxppc-dev@lists.ozlabs.org, nasastry@in.ibm.com,
 srikar@linux.vnet.ibm.com, kamalesh@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 08/06/20 8:12 pm, Sandipan Das wrote:
> The size of the cpu set must be large enough for systems
> with a very large number of CPUs. Otherwise, tests which
> try to determine the first online CPU by calling
> sched_getaffinity() will fail. This makes sure that the
> size of the allocated cpu set is dependent on the number
> of CPUs as reported by get_nprocs().
> 
> Fixes: 3752e453f6ba ("selftests/powerpc: Add tests of PMU EBBs")
> Reported-by: Shirisha Ganta <shiganta@in.ibm.com>
> Signed-off-by: Sandipan Das <sandipan@linux.ibm.com>
> ---
>  tools/testing/selftests/powerpc/utils.c | 33 ++++++++++++++++---------
>  1 file changed, 21 insertions(+), 12 deletions(-)
> 
> diff --git a/tools/testing/selftests/powerpc/utils.c b/tools/testing/selftests/powerpc/utils.c
> index 933678f1ed0a..bb8e402752c0 100644
> --- a/tools/testing/selftests/powerpc/utils.c
> +++ b/tools/testing/selftests/powerpc/utils.c
> @@ -16,6 +16,7 @@
> [...]
>  
>  int pick_online_cpu(void)
>  {
> -	cpu_set_t mask;
> -	int cpu;
> +	int ncpus, cpu = -1;
> +	cpu_set_t *mask;
> +	size_t size;
>  
> -	CPU_ZERO(&mask);
> +	ncpus = get_nprocs();
> +	size = CPU_ALLOC_SIZE(ncpus);
> +	mask = CPU_ALLOC(ncpus);
>  
> -	if (sched_getaffinity(0, sizeof(mask), &mask)) {
> +	CPU_ZERO_S(size, mask);
> +
> +	if (sched_getaffinity(0, size, mask)) {
>  		perror("sched_getaffinity");
> -		return -1;
> +		goto done;
>  	}
>  
>  	/* We prefer a primary thread, but skip 0 */
> -	for (cpu = 8; cpu < CPU_SETSIZE; cpu += 8)
> -		if (CPU_ISSET(cpu, &mask))
> -			return cpu;
> +	for (cpu = 8; cpu < ncpus; cpu += 8)
> +		if (CPU_ISSET_S(cpu, size, mask))
> +			goto done;
>  
>  	/* Search for anything, but in reverse */
> -	for (cpu = CPU_SETSIZE - 1; cpu >= 0; cpu--)
> -		if (CPU_ISSET(cpu, &mask))
> -			return cpu;
> +	for (cpu = ncpus - 1; cpu >= 0; cpu--)
> +		if (CPU_ISSET_S(cpu, size, mask))
> +			goto done;
>  
>  	printf("No cpus in affinity mask?!\n");
> -	return -1;

Missed the fact that the for loop before this would anyway make 'cpu'
count down to -1 if no online CPU is found. Please ignore the previous
message.

> +
> +done:
> +	CPU_FREE(mask);
> +	return cpu;
>  }
>  
>  bool is_ppc64le(void)
> 

- Sandipan
