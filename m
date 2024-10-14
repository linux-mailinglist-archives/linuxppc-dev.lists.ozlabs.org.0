Return-Path: <linuxppc-dev+bounces-2203-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C5A99C717
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2024 12:24:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XRtdM297Zz30MR;
	Mon, 14 Oct 2024 21:24:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728901479;
	cv=none; b=YXhp9bWqFS+l/ZSHvWP4TkDm9zHaMzVX9qCWx4Yl6l7O1PI8wISX3M/h/tvpK91lb2khbN5WYvAJ3dm5wS+PW4pW7Sa1igfpg6XJE3X9ibXHtrCqKxmlbVhGpMhTdDRsAXTmt4ApmE5Q6D3P4f7B6bwdCHcIFheaWgSBHuNHaFHwI2ngPvHfnIU5vccPmXBoU0c15B6/kU3R5HyejEi7y5dRfUBJI0yizOuTrbMVWHlIJGItvNhIuFvwwiUbNJ47LBbHpndqzRRaP8Duz6P/bcOZ9MIgR3rTn70CSBJpwtKpz/0KEh7cC+JK75YRDKcjvQDNC0FUhHVMJWvLHeLLEA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728901479; c=relaxed/relaxed;
	bh=Ocg3L0BVPJRwxCJcj03WGBFydvcJyY9Nl2aza3CZevs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=i1AjpgoncyaG/yYXwjOJ6bkiaVG9wJGHXaXB50oh7i+Wf5PisEpgUZJD7E2GA/UPDfgO6hQdatA4ts2A+UkVSUJtFBvwT4uunY+MMm28JjdMprKAEv5h10Py4SgZyJc6d7i8Syz0Ayob35ezIZYDJTQXvsBLMrddcU16yVW8pbDaWZY0YDNEib8EmicIiTJtJ4Fz4uMj6v+aOdCUScLNx0xOL4BkuB6eujz+egxBIrkMMu2P4VHG3piV76q3XPbc3U3C9BzYUIj9J+HkO5mkNLhenXmiayaVk5e8mwOCZ4yu0ceZQfu5SXB/w7t1e/WAaN4OMPj9XdNZb9oT4m6j4w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=J1zI4/kG; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=J1zI4/kG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XRtdK5VNxz2yVG
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2024 21:24:36 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49E7ogVF006067;
	Mon, 14 Oct 2024 10:24:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=pp1; bh=
	Ocg3L0BVPJRwxCJcj03WGBFydvcJyY9Nl2aza3CZevs=; b=J1zI4/kGhDXyQYNQ
	NA7cBd8+RsnpSRlMo1C0pL6EU/LHnfnDNcuAgEjbLeVHIfyT5ty91FurHJhH6MIC
	CM7EdPy/l4Us0hNVQ4bdol5g7xx1EDj2WuGRIGtN3SIKx1mE6Jgj9R7WAF0Gk/+E
	wCAo4EIFYuFSVK2njxE8QuoAKBLWTapagLyvYHhbjibgAUtz+FdxKR9YlzwKb4Zf
	8Kjq8OHdwXgkgDLSlfDOuO9eagXIpotBYeMhTtL1dA3qaAHC6PtrsWhbo1+1O9sy
	QOfYl/9c0O5GjhpnxquVQGZjXe0iT8FOPA8J7nvnBvdCaDIiMOc8ZmxySjnnAzhU
	aIH8wA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 428y8w0nmf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 10:24:20 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49EAOJHY029579;
	Mon, 14 Oct 2024 10:24:19 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 428y8w0nmb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 10:24:19 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 49E74jbO027452;
	Mon, 14 Oct 2024 10:24:19 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4283txe1hf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 10:24:19 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 49EAOIme27198058
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Oct 2024 10:24:18 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0551F5804E;
	Mon, 14 Oct 2024 10:24:18 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E25D65803F;
	Mon, 14 Oct 2024 10:24:09 +0000 (GMT)
Received: from [9.43.116.47] (unknown [9.43.116.47])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 14 Oct 2024 10:24:09 +0000 (GMT)
Message-ID: <941875f7-0d7f-4ba3-bc7c-7aedc3b20dae@linux.ibm.com>
Date: Mon, 14 Oct 2024 15:54:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v3 1/3] fadump: Refactor and prepare fadump_cma_init for
 late init
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        linuxppc-dev@lists.ozlabs.org
Cc: linux-mm@kvack.org, Sourabh Jain <sourabhjain@linux.ibm.com>,
        Hari Bathini <hbathini@linux.ibm.com>, Zi Yan <ziy@nvidia.com>,
        David Hildenbrand <david@redhat.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
        Donet Tom <donettom@linux.vnet.ibm.com>,
        LKML
 <linux-kernel@vger.kernel.org>,
        Sachin P Bappalige <sachinpb@linux.ibm.com>
References: <030b6d46fddac126a6cf7e119bea48055338f0ed.1728658614.git.ritesh.list@gmail.com>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <030b6d46fddac126a6cf7e119bea48055338f0ed.1728658614.git.ritesh.list@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: vCjybacVMoVYpyuqbebMZr5tU5ddzP-S
X-Proofpoint-GUID: HKCPcImhC0WCwjRQTgK8ZuBP0V1vbSTr
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-14_08,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 adultscore=0 mlxscore=0
 priorityscore=1501 clxscore=1011 suspectscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410140073
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 10/11/24 8:30 PM, Ritesh Harjani (IBM) wrote:
> We anyway don't use any return values from fadump_cma_init(). Since
> fadump_reserve_mem() from where fadump_cma_init() gets called today,
> already has the required checks.
> This patch makes this function return type as void. Let's also handle
> extra cases like return if fadump_supported is false or dump_active, so
> that in later patches we can call fadump_cma_init() separately from
> setup_arch().

Usually patches to this file are posted with title format of

powerpc/fadump:<>


> 
> Acked-by: Hari Bathini <hbathini@linux.ibm.com>
> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> ---
> v2 -> v3: Separated the series into 2 as discussed in v2.
> [v2]: https://lore.kernel.org/linuxppc-dev/cover.1728585512.git.ritesh.list@gmail.com/
> 
>  arch/powerpc/kernel/fadump.c | 23 +++++++++--------------
>  1 file changed, 9 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
> index a612e7513a4f..162327d66982 100644
> --- a/arch/powerpc/kernel/fadump.c
> +++ b/arch/powerpc/kernel/fadump.c
> @@ -78,27 +78,23 @@ static struct cma *fadump_cma;
>   * But for some reason even if it fails we still have the memory reservation
>   * with us and we can still continue doing fadump.
>   */
> -static int __init fadump_cma_init(void)
> +static void __init fadump_cma_init(void)
>  {
>  	unsigned long long base, size;
>  	int rc;
> 
> -	if (!fw_dump.fadump_enabled)
> -		return 0;
> -
> +	if (!fw_dump.fadump_supported || !fw_dump.fadump_enabled ||
> +			fw_dump.dump_active)
> +		return;

Is these checks even needed here? fadump_reserve_mem() checked for all
these already, also dont see any other caller for fadump_cma_init(). 


>  	/*
>  	 * Do not use CMA if user has provided fadump=nocma kernel parameter.
> -	 * Return 1 to continue with fadump old behaviour.
>  	 */
> -	if (fw_dump.nocma)
> -		return 1;
> +	if (fw_dump.nocma || !fw_dump.boot_memory_size)
> +		return;
> 
>  	base = fw_dump.reserve_dump_area_start;
>  	size = fw_dump.boot_memory_size;
> 
> -	if (!size)
> -		return 0;

So this is the only place where we return 0, which in turn will make the
"ret" in fadump_reserve_mem() as zero forcing to call reserve_crashkernel()
in early_init_devtree().

we are removing it, becos we know "size" here will never be zero?


> -
>  	rc = cma_init_reserved_mem(base, size, 0, "fadump_cma", &fadump_cma);
>  	if (rc) {
>  		pr_err("Failed to init cma area for firmware-assisted dump,%d\n", rc);
> @@ -108,7 +104,7 @@ static int __init fadump_cma_init(void)
>  		 * blocked from production system usage.  Hence return 1,
>  		 * so that we can continue with fadump.
>  		 */
> -		return 1;
> +		return;
>  	}
> 
>  	/*
> @@ -125,10 +121,9 @@ static int __init fadump_cma_init(void)
>  		cma_get_size(fadump_cma),
>  		(unsigned long)cma_get_base(fadump_cma) >> 20,
>  		fw_dump.reserve_dump_area_size);
> -	return 1;
>  }
>  #else
> -static int __init fadump_cma_init(void) { return 1; }
> +static void __init fadump_cma_init(void) { }
>  #endif /* CONFIG_CMA */
> 
>  /*
> @@ -638,7 +633,7 @@ int __init fadump_reserve_mem(void)
>  		pr_info("Reserved %lldMB of memory at %#016llx (System RAM: %lldMB)\n",
>  			(size >> 20), base, (memblock_phys_mem_size() >> 20));
> 
> -		ret = fadump_cma_init();
> +		fadump_cma_init();
>  	}
> 
>  	return ret;
> --
> 2.46.0
> 


