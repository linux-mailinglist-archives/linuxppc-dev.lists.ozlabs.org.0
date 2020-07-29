Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97261232220
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jul 2020 18:06:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BGz1Q3MMczDql2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jul 2020 02:06:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BGyyn1VDgzDqcg
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jul 2020 02:04:00 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06TG3753116550; Wed, 29 Jul 2020 12:03:53 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32k9q55kqk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jul 2020 12:03:53 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06TG1HWS005287;
 Wed, 29 Jul 2020 16:03:51 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 32gcy4n8bf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jul 2020 16:03:51 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06TG3kba32899498
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Jul 2020 16:03:46 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B6FB742047;
 Wed, 29 Jul 2020 16:03:46 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3E0E042045;
 Wed, 29 Jul 2020 16:03:45 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 29 Jul 2020 16:03:45 +0000 (GMT)
Date: Wed, 29 Jul 2020 21:33:44 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Sandipan Das <sandipan@linux.ibm.com>
Subject: Re: [PATCH v2] selftests: powerpc: Fix online CPU selection
Message-ID: <20200729160344.GB14603@linux.vnet.ibm.com>
References: <20200609073733.997643-1-sandipan@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20200609073733.997643-1-sandipan@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-29_10:2020-07-29,
 2020-07-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 spamscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007290108
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
Reply-To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Cc: kamalesh@linux.vnet.ibm.com, shiganta@in.ibm.com, nasastry@in.ibm.com,
 harish@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Sandipan Das <sandipan@linux.ibm.com> [2020-06-09 13:07:33]:

> The size of the CPU affinity mask must be large enough for
> systems with a very large number of CPUs. Otherwise, tests
> which try to determine the first online CPU by calling
> sched_getaffinity() will fail. This makes sure that the size
> of the allocated affinity mask is dependent on the number of
> CPUs as reported by get_nprocs().
> 
> Fixes: 3752e453f6ba ("selftests/powerpc: Add tests of PMU EBBs")
> Reported-by: Shirisha Ganta <shiganta@in.ibm.com>
> Signed-off-by: Sandipan Das <sandipan@linux.ibm.com>
> Reviewed-by: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>
> ---
> Previous versions can be found at:
> v1: https://lore.kernel.org/linuxppc-dev/20200608144212.985144-1-sandipan@linux.ibm.com/
> 
> @@ -88,28 +89,40 @@ void *get_auxv_entry(int type)
> 
>  int pick_online_cpu(void)
>  {
> -	cpu_set_t mask;
> -	int cpu;
> +	int ncpus, cpu = -1;
> +	cpu_set_t *mask;
> +	size_t size;
> +
> +	ncpus = get_nprocs();

Please use get_nprocs_conf or sysconf(_SC_NPROCESSORS_CONF). The manpage
seems to suggest the latter. Not sure how accurate the manpage is.

get_nprocs is returning online cpus and when smt is off, the cpu numbers
would be sparse and hence the result from get_nprocs wouldn't be ideal for
allocating cpumask. However get_nprocs_conf would return the max configured
cpus and would be able to handle it. 

I think this was the same situation hit by Michael Ellerman.

> +	size = CPU_ALLOC_SIZE(ncpus);
> +	mask = CPU_ALLOC(ncpus);
> +	if (!mask) {
> +		perror("malloc");
> +		return -1;
> +	}
> 

-- 
Thanks and Regards
Srikar Dronamraju
