Return-Path: <linuxppc-dev+bounces-2289-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDF699EEB3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2024 16:06:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XSbW36zn2z3bpn;
	Wed, 16 Oct 2024 01:06:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729001199;
	cv=none; b=VAw0riHhWWPtvK8Mah6yXlM7zKfQOHIUCMFWetY+salgRjhBwUJSYuDfFyDGW9dcIOXNXfcI/yC4IKRDaGA6ADDfcMmT4IjrtvbYAgqOc8XRJsppitC0QU8AteVOIrUxKISSDElMaS79hRS/AYO1+LsIRAt1wzogaVwdKfHaUb1cg7BDrnzjVck4DMZHW5vRGYbJAVVXo6+fX5uBLHHl5Cr9+fK9vTjzWYKa+00vffaMwf7U5EUKGk648FioPUksaSKxSSmPnuv2mDMCVLbm0cQZwG9AAXhcsYQ6SQr+7Kuafl9joNjACkVue1PY+/NsaIiJNCt7sgp9/nEXq1cB0w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729001199; c=relaxed/relaxed;
	bh=gAMkFuurSKWsXKkavscpUQu+wnifZHhrSt0CodqSyYs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mlhtE0O7dw7te1cZ9CKrqUQ5rHPHuopsWczOXkQOxhmLAhHLmsUIuXJgPstY9j9pKvg8ONK6uHnNIGpRVtX1J43WpeMB/FJTfT5fW7s5I4H+SiGJUuJ8rJsAWBuKqnhdd9N4yXZCC4fIvVgUayUz9NBUp8kdjBPqCGn8jJcpzdkjIm9PqiBFElmkl6vHrJJSJzSFRt/QzNrJ3HRqKkjoCfWIF4stCKH7aI48lrLt7CpNc/vs4rNAlNpEewEIugMtvBQ+8gg2cRjyg6W+GJQUWSYGuZvrrB3fUfzLcMO3/XbYDA4VZ0O2PyK+etvA55JJBrYeSlfioiKbewf6QmblRA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rNLHZLOv; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rNLHZLOv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XSbW24hKPz3bpm
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2024 01:06:37 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49FCOVKb011338;
	Tue, 15 Oct 2024 14:06:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=gAMkFu
	urSKWsXKkavscpUQu+wnifZHhrSt0CodqSyYs=; b=rNLHZLOvukuSpUg1Ekt2fL
	nRFDj/FaYoew1FNr1Vq1VOwz2ihwX4dG+Be8Xhrd5c+rLJQ38kbSdFVyYX09g8bO
	15WqJL1CRzwgCeMKYy/3lCLrLuBRD2NptjwV3LJMIUXammT3VMeV/+C93Il7/GQ1
	6gR1pHl6Z5TJDoYXl8lxc2Oy1cqxAgr78Sncntxj8dlqUp3PI9QKbn0rDCtSqASP
	C7aWR/nwgan5G+Ba+yTIDShhDtKyh/1y01wAAR7tBtfNOHHhm2FYLMXJhP2N6r4Q
	oD9HpHLlXkCSjwsXVDAdHHAuRGiIq5qupwpO1NBiADFe0IFwYv8ouNFqibj1FUtA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 429rcerhuf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 14:06:25 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49FE6OFp002259;
	Tue, 15 Oct 2024 14:06:24 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 429rcerhu8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 14:06:24 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 49FCFxle004988;
	Tue, 15 Oct 2024 14:06:23 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4285nj3xsx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 14:06:23 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 49FE6Mwn44368244
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Oct 2024 14:06:22 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C870958060;
	Tue, 15 Oct 2024 14:06:22 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0B02258051;
	Tue, 15 Oct 2024 14:06:15 +0000 (GMT)
Received: from [9.43.42.92] (unknown [9.43.42.92])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 15 Oct 2024 14:06:14 +0000 (GMT)
Message-ID: <7ae152f0-1887-4862-9173-fe2e9914dbe6@linux.ibm.com>
Date: Tue, 15 Oct 2024 19:36:12 +0530
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v3 3/3] fadump: Move fadump_cma_init to setup_arch() after
 initmem_init()
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
 <759d0fc37d9fedca6cfe78ea7061447ecbf1bc77.1728658614.git.ritesh.list@gmail.com>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <759d0fc37d9fedca6cfe78ea7061447ecbf1bc77.1728658614.git.ritesh.list@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: OrYDgTtVNxs83JroPRt-Qzl2IJZxzi09
X-Proofpoint-ORIG-GUID: yqy2g7rGIy8HZ1kHEvg7rlWCG3Zm2J3P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 mlxlogscore=999 clxscore=1015 phishscore=0 mlxscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410150094
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 10/11/24 8:30 PM, Ritesh Harjani (IBM) wrote:
> During early init CMA_MIN_ALIGNMENT_BYTES can be PAGE_SIZE,
> since pageblock_order is still zero and it gets initialized
> later during initmem_init() e.g.
> setup_arch() -> initmem_init() -> sparse_init() -> set_pageblock_order()
> 
> One such use case where this causes issues is -
> early_setup() -> early_init_devtree() -> fadump_reserve_mem() -> fadump_cma_init()
> 
> This causes CMA memory alignment check to be bypassed in
> cma_init_reserved_mem(). Then later cma_activate_area() can hit
> a VM_BUG_ON_PAGE(pfn & ((1 << order) - 1)) if the reserved memory
> area was not pageblock_order aligned.
> 
> Fix it by moving the fadump_cma_init() after initmem_init(),
> where other such cma reservations also gets called.
> 
> <stack trace>
> ==============
> page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x10010
> flags: 0x13ffff800000000(node=1|zone=0|lastcpupid=0x7ffff) CMA
> raw: 013ffff800000000 5deadbeef0000100 5deadbeef0000122 0000000000000000
> raw: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000000
> page dumped because: VM_BUG_ON_PAGE(pfn & ((1 << order) - 1))
> ------------[ cut here ]------------
> kernel BUG at mm/page_alloc.c:778!
> 
> Call Trace:
> __free_one_page+0x57c/0x7b0 (unreliable)
> free_pcppages_bulk+0x1a8/0x2c8
> free_unref_page_commit+0x3d4/0x4e4
> free_unref_page+0x458/0x6d0
> init_cma_reserved_pageblock+0x114/0x198
> cma_init_reserved_areas+0x270/0x3e0
> do_one_initcall+0x80/0x2f8
> kernel_init_freeable+0x33c/0x530
> kernel_init+0x34/0x26c
> ret_from_kernel_user_thread+0x14/0x1c
> 

Changes looks fine to me.
Reviewed-by: Madhavan Srinivasan <maddy@linux.ibm.com>

> Fixes: 11ac3e87ce09 ("mm: cma: use pageblock_order as the single alignment")
> Suggested-by: David Hildenbrand <david@redhat.com>
> Reported-by: Sachin P Bappalige <sachinpb@linux.ibm.com>
> Acked-by: Hari Bathini <hbathini@linux.ibm.com>
> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> ---
>  arch/powerpc/include/asm/fadump.h  | 7 +++++++
>  arch/powerpc/kernel/fadump.c       | 6 +-----
>  arch/powerpc/kernel/setup-common.c | 6 ++++--
>  3 files changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/fadump.h b/arch/powerpc/include/asm/fadump.h
> index ef40c9b6972a..3638f04447f5 100644
> --- a/arch/powerpc/include/asm/fadump.h
> +++ b/arch/powerpc/include/asm/fadump.h
> @@ -34,4 +34,11 @@ extern int early_init_dt_scan_fw_dump(unsigned long node, const char *uname,
>  				      int depth, void *data);
>  extern int fadump_reserve_mem(void);
>  #endif
> +
> +#if defined(CONFIG_FA_DUMP) && defined(CONFIG_CMA)
> +void fadump_cma_init(void);
> +#else
> +static inline void fadump_cma_init(void) { }
> +#endif
> +
>  #endif /* _ASM_POWERPC_FADUMP_H */
> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
> index ffaec625b7a8..c42f89862893 100644
> --- a/arch/powerpc/kernel/fadump.c
> +++ b/arch/powerpc/kernel/fadump.c
> @@ -78,7 +78,7 @@ static struct cma *fadump_cma;
>   * But for some reason even if it fails we still have the memory reservation
>   * with us and we can still continue doing fadump.
>   */
> -static void __init fadump_cma_init(void)
> +void __init fadump_cma_init(void)
>  {
>  	unsigned long long base, size, end;
>  	int rc;
> @@ -139,8 +139,6 @@ static void __init fadump_cma_init(void)
>  		fw_dump.boot_memory_size >> 20);
>  	return;
>  }
> -#else
> -static void __init fadump_cma_init(void) { }
>  #endif /* CONFIG_CMA */
>  
>  /*
> @@ -642,8 +640,6 @@ int __init fadump_reserve_mem(void)
>  
>  		pr_info("Reserved %lldMB of memory at %#016llx (System RAM: %lldMB)\n",
>  			(size >> 20), base, (memblock_phys_mem_size() >> 20));
> -
> -		fadump_cma_init();
>  	}
>  
>  	return ret;
> diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
> index 4bd2f87616ba..9f1e6f2e299e 100644
> --- a/arch/powerpc/kernel/setup-common.c
> +++ b/arch/powerpc/kernel/setup-common.c
> @@ -996,9 +996,11 @@ void __init setup_arch(char **cmdline_p)
>  	initmem_init();
>  
>  	/*
> -	 * Reserve large chunks of memory for use by CMA for KVM and hugetlb. These must
> -	 * be called after initmem_init(), so that pageblock_order is initialised.
> +	 * Reserve large chunks of memory for use by CMA for fadump, KVM and
> +	 * hugetlb. These must be called after initmem_init(), so that
> +	 * pageblock_order is initialised.
>  	 */
> +	fadump_cma_init();
>  	kvm_cma_reserve();
>  	gigantic_hugetlb_cma_reserve();
>  


