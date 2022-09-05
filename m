Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B340C5ACB82
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Sep 2022 08:57:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MLfTb1Qdkz2yx8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Sep 2022 16:57:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NWNpJ3sq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rnsastry@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NWNpJ3sq;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MLfSs1wBPz2xkc
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Sep 2022 16:56:44 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2856tQbw029081;
	Mon, 5 Sep 2022 06:56:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=rtZuzJ9AzIWOPcF8jVWKBTPVo/DCdVQ6E/wRW6VE1tY=;
 b=NWNpJ3sqLLRFEot/tFljQ1aFkUCV+9elffZpaK/nKhaP707R8Ctg6scFPZgEStBMvOch
 wWfTBJMm2R7lzgrc39Ygb2daQpTXwws7ma/xIPWjf5wIEJ48O6SG7gcpOfQFMtJGF/cf
 JsfNAP4ghawERD5DTYptCiS6XpBuFT5cVymCjRwjQ1hyShohQkfht9+JFASTrMEQGvQF
 8uswtnDFZoVRcrGcedsrVSb2UUo77MrJLwHta4oSGrVmjoqFnFQgQk15CUSU7slFeFQk
 Gexr2uACAurElMFLTD5WRF9zKuOvDK5waiO5yuShv15nSgsXakesILsc/TPwNoShRTHo aQ== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jdc96r0fs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Sep 2022 06:56:35 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2856o5jI011684;
	Mon, 5 Sep 2022 06:56:33 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma03ams.nl.ibm.com with ESMTP id 3jbxj8t20a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Sep 2022 06:56:33 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2856uViB42205494
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 Sep 2022 06:56:31 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 047DF11C04A;
	Mon,  5 Sep 2022 06:56:31 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3977811C04C;
	Mon,  5 Sep 2022 06:56:29 +0000 (GMT)
Received: from [9.43.20.7] (unknown [9.43.20.7])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
	Mon,  5 Sep 2022 06:56:29 +0000 (GMT)
Message-ID: <efe3682b-edb8-b9b2-3c25-3dcf54187702@linux.ibm.com>
Date: Mon, 5 Sep 2022 12:26:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH 1/2] tools/perf: Fix out of bound access to affinity
 "sched_cpus"
Content-Language: en-US
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, acme@kernel.org,
        jolsa@kernel.org
References: <20220905045441.1643-1-atrajeev@linux.vnet.ibm.com>
From: R Nageswara Sastry <rnsastry@linux.ibm.com>
In-Reply-To: <20220905045441.1643-1-atrajeev@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: AE6ZYifcXeCnGg1-NB8dR9p5r_9pU2Ux
X-Proofpoint-GUID: AE6ZYifcXeCnGg1-NB8dR9p5r_9pU2Ux
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-09-05_04,2022-09-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 mlxscore=0 mlxlogscore=999 spamscore=0 suspectscore=0 impostorscore=0
 phishscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209050031
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
Cc: linux-perf-users@vger.kernel.org, maddy@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, kjain@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 05/09/22 10:24 am, Athira Rajeev wrote:
> The affinity code in "affinity_set" function access array
> named "sched_cpus". The size for this array is allocated in
> affinity_setup function which is nothing but value from
> get_cpu_set_size. This is used to contain the cpumask value
> for each cpu. While setting bit for each cpu, it calls
> "set_bit" function which access index in sched_cpus array.
> If we provide a command-line option to -C which is more than
> the number of CPU's present in the system, the set_bit could
> access an array member which is out-of the array size. This
> is because currently, there is no boundary check for the CPU.
> This will result in seg fault:
> 
> <<>>
>   ./perf stat -C 12323431 ls
> Perf can support 2048 CPUs. Consider raising MAX_NR_CPUS
> Segmentation fault (core dumped)
> <<>>
> 
> Fix this by adding boundary check for the array.
> 
> After the fix from powerpc system:
> 
> <<>>
> ./perf stat -C 12323431 ls 1>out
> Perf can support 2048 CPUs. Consider raising MAX_NR_CPUS
> 
>   Performance counter stats for 'CPU(s) 12323431':
> 
>     <not supported> msec cpu-clock
>     <not supported>      context-switches
>     <not supported>      cpu-migrations
>     <not supported>      page-faults
>     <not supported>      cycles
>     <not supported>      instructions
>     <not supported>      branches
>     <not supported>      branch-misses
> 
>         0.001192373 seconds time elapsed
> <<>>
> 
> Reported-by: Nageswara Sastry <rnsastry@linux.ibm.com>

Tested-by: Nageswara Sastry <rnsastry@linux.ibm.com>

> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---
>   tools/perf/util/affinity.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/perf/util/affinity.c b/tools/perf/util/affinity.c
> index 4d216c0dc425..a1dd37347abc 100644
> --- a/tools/perf/util/affinity.c
> +++ b/tools/perf/util/affinity.c
> @@ -49,8 +49,14 @@ void affinity__set(struct affinity *a, int cpu)
>   {
>   	int cpu_set_size = get_cpu_set_size();
>   
> -	if (cpu == -1)
> +	/*
> +	 * Return:
> +	 * - if cpu is -1
> +	 * - restrict out of bound access to sched_cpus
> +	 */
> +	if (cpu == -1 || ((cpu / __BITS_PER_LONG) >= (cpu_set_size / 8)))
>   		return;
> +
>   	a->changed = true;
>   	set_bit(cpu, a->sched_cpus);
>   	/*

-- 
Thanks and Regards
R.Nageswara Sastry
