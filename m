Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 296E172BEB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2019 12:01:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45trT86BppzDqMv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2019 20:01:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45trPw0lWwzDqPm
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2019 19:58:11 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6O9nlbu142647
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2019 05:58:09 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2txn1t0ed1-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2019 05:58:08 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <aneesh.kumar@linux.ibm.com>;
 Wed, 24 Jul 2019 10:58:07 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 24 Jul 2019 10:58:06 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x6O9w5ER30998966
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Jul 2019 09:58:05 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 374284C052;
 Wed, 24 Jul 2019 09:58:05 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C603F4C040;
 Wed, 24 Jul 2019 09:58:03 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.199.44.139])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 24 Jul 2019 09:58:03 +0000 (GMT)
X-Mailer: emacs 26.2 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 3/5] powerpc/perf: fix imc allocation failure handling
In-Reply-To: <20190724084638.24982-3-npiggin@gmail.com>
References: <20190724084638.24982-1-npiggin@gmail.com>
 <20190724084638.24982-3-npiggin@gmail.com>
Date: Wed, 24 Jul 2019 15:28:02 +0530
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 19072409-0012-0000-0000-00000335AE37
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19072409-0013-0000-0000-0000216F4199
Message-Id: <87d0hzn49h.fsf@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-24_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1907240109
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
Cc: Anju T Sudhakar <anju@linux.vnet.ibm.com>,
 Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Reza Arbab <arbab@linux.vnet.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:

> The alloc_pages_node return value should be tested for failure
> before being passed to page_address.
>


Reviewed-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

This need Fixes: tag? It fix a real crash unlike the other patch in this
series? 

> Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
> Tested-by: Anju T Sudhakar <anju@linux.vnet.ibm.com>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/perf/imc-pmu.c | 29 ++++++++++++++++++-----------
>  1 file changed, 18 insertions(+), 11 deletions(-)
>
> diff --git a/arch/powerpc/perf/imc-pmu.c b/arch/powerpc/perf/imc-pmu.c
> index dea243185ea4..cb50a9e1fd2d 100644
> --- a/arch/powerpc/perf/imc-pmu.c
> +++ b/arch/powerpc/perf/imc-pmu.c
> @@ -577,6 +577,7 @@ static int core_imc_mem_init(int cpu, int size)
>  {
>  	int nid, rc = 0, core_id = (cpu / threads_per_core);
>  	struct imc_mem_info *mem_info;
> +	struct page *page;
>  
>  	/*
>  	 * alloc_pages_node() will allocate memory for core in the
> @@ -587,11 +588,12 @@ static int core_imc_mem_init(int cpu, int size)
>  	mem_info->id = core_id;
>  
>  	/* We need only vbase for core counters */
> -	mem_info->vbase = page_address(alloc_pages_node(nid,
> -					  GFP_KERNEL | __GFP_ZERO | __GFP_THISNODE |
> -					  __GFP_NOWARN, get_order(size)));
> -	if (!mem_info->vbase)
> +	page = alloc_pages_node(nid,
> +				GFP_KERNEL | __GFP_ZERO | __GFP_THISNODE |
> +				__GFP_NOWARN, get_order(size));
> +	if (!page)
>  		return -ENOMEM;
> +	mem_info->vbase = page_address(page);
>  
>  	/* Init the mutex */
>  	core_imc_refc[core_id].id = core_id;
> @@ -849,15 +851,17 @@ static int thread_imc_mem_alloc(int cpu_id, int size)
>  	int nid = cpu_to_node(cpu_id);
>  
>  	if (!local_mem) {
> +		struct page *page;
>  		/*
>  		 * This case could happen only once at start, since we dont
>  		 * free the memory in cpu offline path.
>  		 */
> -		local_mem = page_address(alloc_pages_node(nid,
> +		page = alloc_pages_node(nid,
>  				  GFP_KERNEL | __GFP_ZERO | __GFP_THISNODE |
> -				  __GFP_NOWARN, get_order(size)));
> -		if (!local_mem)
> +				  __GFP_NOWARN, get_order(size));
> +		if (!page)
>  			return -ENOMEM;
> +		local_mem = page_address(page);
>  
>  		per_cpu(thread_imc_mem, cpu_id) = local_mem;
>  	}
> @@ -1095,11 +1099,14 @@ static int trace_imc_mem_alloc(int cpu_id, int size)
>  	int core_id = (cpu_id / threads_per_core);
>  
>  	if (!local_mem) {
> -		local_mem = page_address(alloc_pages_node(phys_id,
> -					GFP_KERNEL | __GFP_ZERO | __GFP_THISNODE |
> -					__GFP_NOWARN, get_order(size)));
> -		if (!local_mem)
> +		struct page *page;
> +
> +		page = alloc_pages_node(phys_id,
> +				GFP_KERNEL | __GFP_ZERO | __GFP_THISNODE |
> +				__GFP_NOWARN, get_order(size));
> +		if (!page)
>  			return -ENOMEM;
> +		local_mem = page_address(page);
>  		per_cpu(trace_imc_mem, cpu_id) = local_mem;
>  
>  		/* Initialise the counters for trace mode */
> -- 
> 2.22.0

