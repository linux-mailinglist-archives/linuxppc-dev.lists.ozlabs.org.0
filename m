Return-Path: <linuxppc-dev+bounces-4854-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B32BA060EE
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2025 16:59:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSt0W5VyJz30TH;
	Thu,  9 Jan 2025 02:59:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736351995;
	cv=none; b=ZKAdRAqt4S8SfEuAmtdYs9a54t2zWR25O/4mS/qS+3U10jngDwVBd6C4n2/AEO1PIXU/mEutxNJkDF9iRnSjwLqezH91WTXJKFFfDW/cQsnkKaccKPxbsvXgOvBMwN75MpOjSjtFHE5/TySUpAvie6RvtGVIiD5+lZh7H4AS0j3ObWMnDv7rc9mHrJqLySg8vxlpnErmmEMEMKJQ3nKYZRC3Pn1H1GsF5/66Aiz0CnVNWqoqtQ3AgClXTVqY94Pk1Ty1SXdDPdD+AZfLNh4eHmffK9sWcylXS12XeKWV7DFfIGqA+FoJY9cCg3/aCJ/NVTw4Syjpq5y8RGGpV8cf5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736351995; c=relaxed/relaxed;
	bh=XzrBDsfbN16b57Szr+NoTSMSWpMH+uOkeqBmyngOcg4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hkiQKv5Ki8ukV8P1+F1ppQdK7+9KEjyQGXkaba6xjhvz+6pj8Jp4PO6aE/DJvBu2CkQo7BeSTVSa2p/airnHRpp7jCzIrQkpMqFcmfGW5MkTMwwOTo90SXYRkVdMsY433jRW0+tOJ4dWclYDCV7Wt5ZJ4FVhE/AVLw4mnWKz4tIaX5EpG+QH3qHIgMhiwFsuoQD8fc30dpNpqj1WN70o39Jxqo377fgndghFX1fYjt06mrEVSSzF+R4CIbfzWXH7OdR1mWhvHOIyjefW6Pdc03DeKxYe7/EODw/0Lgnb1NdRHT20DZKsQEcXgmq5ODoVWbXmuUvn2aL9Fph8vqYpfw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YZTc6nI5; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YZTc6nI5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YSt0V5RNbz2ydW
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jan 2025 02:59:54 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508DbbrG024745;
	Wed, 8 Jan 2025 15:59:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=XzrBDsfbN16b57Szr+NoTSMSWpMH+u
	OkeqBmyngOcg4=; b=YZTc6nI5iyhjqWkcNpXaEmpPwapzcwK35XjlkTWHeVXteh
	g+TXuIQ8o5IOecfQsno/rbHSGS7B69KtGg+M7iBJX1JOHOOduDCOUAGyuXAlnMD+
	8amKWViZzrwIvy03Td6vJgppXlN2yLDtXniHA55zAivcgj/QMY33zOl1Ico8umY6
	ocjbXmekzY97eN0PPxUkkL73nfsqZx6hv1t8vXZZHNBCg6cdTM95N0eMQTPfNJP8
	LPI5+Rj3IbDne5+ata9znvf7BSNN0k4ZYBAgDI0wz+NQlEkTW51OXb9KfI6ErFy8
	k1GPYQPQfoLIPMhVPwAhVlr1VtmQLlulDagrELVQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 441edj3vtu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 15:59:09 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 508Fldkt022838;
	Wed, 8 Jan 2025 15:59:08 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 441edj3vsd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 15:59:08 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 508CRJIE003614;
	Wed, 8 Jan 2025 15:58:43 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 43yfat8mxj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 15:58:43 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 508FwfdT51118510
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 8 Jan 2025 15:58:41 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C2AAC20049;
	Wed,  8 Jan 2025 15:58:41 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3B6B320040;
	Wed,  8 Jan 2025 15:58:41 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown [9.155.204.135])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed,  8 Jan 2025 15:58:41 +0000 (GMT)
Date: Wed, 8 Jan 2025 16:58:40 +0100
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: peterz@infradead.org, kevin.brodsky@arm.com, alex@ghiti.fr,
        andreas@gaisler.com, palmer@dabbelt.com, tglx@linutronix.de,
        david@redhat.com, jannh@google.com, hughd@google.com,
        yuzhao@google.com, willy@infradead.org, muchun.song@linux.dev,
        vbabka@kernel.org, lorenzo.stoakes@oracle.com,
        akpm@linux-foundation.org, rientjes@google.com, vishal.moola@gmail.com,
        arnd@arndb.de, will@kernel.org, aneesh.kumar@kernel.org,
        npiggin@gmail.com, dave.hansen@linux.intel.com, rppt@kernel.org,
        ryan.roberts@arm.com, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org,
        x86@kernel.org, linux-arch@vger.kernel.org, linux-csky@vger.kernel.org,
        linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-um@lists.infradead.org
Subject: Re: [PATCH v5 13/17] s390: pgtable: consolidate PxD and PTE TLB free
 paths
Message-ID: <Z36gsNyRhb3wCPvN@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
References: <cover.1736317725.git.zhengqi.arch@bytedance.com>
 <ac69360a5f3350ebb2f63cd14b7b45316a130ee4.1736317725.git.zhengqi.arch@bytedance.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac69360a5f3350ebb2f63cd14b7b45316a130ee4.1736317725.git.zhengqi.arch@bytedance.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: i_F65JriRryrfiA96jFrqrnvASp9vCOR
X-Proofpoint-ORIG-GUID: KrEysfrNgz7tD54gKNitjTUFxG7_tMkS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=594 phishscore=0 malwarescore=0
 impostorscore=0 priorityscore=1501 clxscore=1011 adultscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501080133
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Jan 08, 2025 at 02:57:29PM +0800, Qi Zheng wrote:
> Call pagetable_dtor() for PMD|PUD|P4D tables just before ptdesc is
> freed - same as it is done for PTE tables. That allows consolidating
> TLB free paths for all table types.
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
> Cc: linux-s390@vger.kernel.org
> ---
>  arch/s390/include/asm/tlb.h |  3 ---
>  arch/s390/mm/pgalloc.c      | 14 ++++----------
>  2 files changed, 4 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/s390/include/asm/tlb.h b/arch/s390/include/asm/tlb.h
> index dde847a5be545..d5b27a2445c96 100644
> --- a/arch/s390/include/asm/tlb.h
> +++ b/arch/s390/include/asm/tlb.h
> @@ -102,7 +102,6 @@ static inline void pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmd,
>  {
>  	if (mm_pmd_folded(tlb->mm))
>  		return;
> -	pagetable_dtor(virt_to_ptdesc(pmd));
>  	__tlb_adjust_range(tlb, address, PAGE_SIZE);
>  	tlb->mm->context.flush_mm = 1;
>  	tlb->freed_tables = 1;
> @@ -122,7 +121,6 @@ static inline void p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4d,
>  {
>  	if (mm_p4d_folded(tlb->mm))
>  		return;
> -	pagetable_dtor(virt_to_ptdesc(p4d));
>  	__tlb_adjust_range(tlb, address, PAGE_SIZE);
>  	tlb->mm->context.flush_mm = 1;
>  	tlb->freed_tables = 1;
> @@ -141,7 +139,6 @@ static inline void pud_free_tlb(struct mmu_gather *tlb, pud_t *pud,
>  {
>  	if (mm_pud_folded(tlb->mm))
>  		return;
> -	pagetable_dtor(virt_to_ptdesc(pud));
>  	tlb->mm->context.flush_mm = 1;
>  	tlb->freed_tables = 1;
>  	tlb->cleared_p4ds = 1;
> diff --git a/arch/s390/mm/pgalloc.c b/arch/s390/mm/pgalloc.c
> index 569de24d33761..c73b89811a264 100644
> --- a/arch/s390/mm/pgalloc.c
> +++ b/arch/s390/mm/pgalloc.c
> @@ -180,7 +180,7 @@ unsigned long *page_table_alloc(struct mm_struct *mm)
>  	return table;
>  }
>  
> -static void pagetable_pte_dtor_free(struct ptdesc *ptdesc)
> +static void pagetable_dtor_free(struct ptdesc *ptdesc)
>  {
>  	pagetable_dtor(ptdesc);
>  	pagetable_free(ptdesc);
> @@ -190,20 +190,14 @@ void page_table_free(struct mm_struct *mm, unsigned long *table)
>  {
>  	struct ptdesc *ptdesc = virt_to_ptdesc(table);
>  
> -	pagetable_pte_dtor_free(ptdesc);
> +	pagetable_dtor_free(ptdesc);
>  }
>  
>  void __tlb_remove_table(void *table)
>  {
>  	struct ptdesc *ptdesc = virt_to_ptdesc(table);
> -	struct page *page = ptdesc_page(ptdesc);
>  
> -	if (compound_order(page) == CRST_ALLOC_ORDER) {
> -		/* pmd, pud, or p4d */
> -		pagetable_free(ptdesc);
> -		return;
> -	}
> -	pagetable_pte_dtor_free(ptdesc);
> +	pagetable_dtor_free(ptdesc);
>  }
>  
>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
> @@ -211,7 +205,7 @@ static void pte_free_now(struct rcu_head *head)
>  {
>  	struct ptdesc *ptdesc = container_of(head, struct ptdesc, pt_rcu_head);
>  
> -	pagetable_pte_dtor_free(ptdesc);
> +	pagetable_dtor_free(ptdesc);
>  }
>  
>  void pte_free_defer(struct mm_struct *mm, pgtable_t pgtable)

Acked-by: Alexander Gordeev <agordeev@linux.ibm.com>

Thanks!

