Return-Path: <linuxppc-dev+bounces-4856-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CEF0A0613B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2025 17:13:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YStJM6wSjz30V3;
	Thu,  9 Jan 2025 03:13:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736352819;
	cv=none; b=fLkInfGZUE3l5hsfEsZKFkdv/m7TPuhW+xK2bC3eXAc1qEqyw+ZD9c8TqVRxMf47sgo9I8yRM87R/Lsbq9G/VA3DVdtQ/toABToHfbwDPILXrW3RlkbFmOWWP9s0oqsGAyJ7Ho30TXdSlbuaQ0v/u/9ukbXZL3xd1QEPRLPh9/Y85LbFhQeuzFWhdqJ9YAf3f7HGbMazQ0r+6xJY+uX32TYWvD1CxvwDjFNvHsQcdnEaQ9a+SPwWTGZKoSQjEEU/Fq64dIPiGDyTb9/AVctv4DKmyGbqi1Xtfw8QIovbL/yodsqklLtFe2N7n6M3BzyyyejBT6wVr6ofyDwZR60Lvw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736352819; c=relaxed/relaxed;
	bh=/0pEosJAtrrq7+AZfl2ID181pVMDXxvqRB1iDHPru/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IhSQ7y6zJsUuMP6KP9Rl3cS9lv0cXjG4o8CwOIs3VQAbIzQFj2kJj/LJKkaFCAVmwID4sGxHRap06m26PW1hWaViHRUgsb+yr/OmZSA57Hawl7EIn5Z2FEMkzYZXlezQo8F+XOKKu5Yuith0yrmMrl1BDyyTzXaK7WqD89wUPRDJrOjgWhFqXrOkUJIEdzNDz8lcaNKmbt+VO9q4QTSzJNVsCXSkJiy/B3QVjju35vwToJ4hArdMd6cucj1R/IGkbzr+pi29C1SMQgBFJ0J0zzUdaVJtKFumQCK+wBDwbs3I/uykEj4C6b45yp99lDVv0tRbj+psTnn5wrNeqdXvTg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Qc2i4Tp0; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Qc2i4Tp0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YStJL5mZBz2ydW
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jan 2025 03:13:38 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508Ew0Hd008979;
	Wed, 8 Jan 2025 16:13:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=/0pEosJAtrrq7+AZfl2ID181pVMDXx
	vqRB1iDHPru/M=; b=Qc2i4Tp0uvBRyl+jGtaMLwYGZKKaztQUee3zrazLkmkths
	BKjfeh5hc4DNF+FovJkBB/fHbU/DPDjRCbIEh/eMZyHyvXxayMqu9FBQFJOug4QH
	iQGB7QT793mBW00g/2e5RWsTUnIRvzEqsPYZoZ1xrycOjY77mjmhxD3Tr58vKYfh
	i5WI1PseA+GU3nr66lZ1WH05bULNRioNAgJgAm9VNeTRLQ4pRSeX+RYdvIB2cetS
	GTBBs7NBz+M3Z6MiU02DQX/J9dzcrcbfHP6qZ8C6ajXXZ6zofEYRDTTx4bda1nof
	mnWd9f4JhtWC7wiQ3TFYDev/txCoPQl/rsnDG/uQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 441hupu905-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 16:13:02 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 508GD1K1025958;
	Wed, 8 Jan 2025 16:13:01 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 441hupu901-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 16:13:01 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 508CW5fH003630;
	Wed, 8 Jan 2025 16:13:00 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 43yfat8qq7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 16:13:00 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 508GCwru8061280
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 8 Jan 2025 16:12:58 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B38D720040;
	Wed,  8 Jan 2025 16:12:58 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1575720043;
	Wed,  8 Jan 2025 16:12:58 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown [9.155.204.135])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed,  8 Jan 2025 16:12:58 +0000 (GMT)
Date: Wed, 8 Jan 2025 17:12:56 +0100
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
Subject: Re: [PATCH v5 06/17] s390: pgtable: add statistics for PUD and P4D
 level page table
Message-ID: <Z36kCF6tgnzkIRDM@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
References: <cover.1736317725.git.zhengqi.arch@bytedance.com>
 <4707dffce228ccec5c6662810566dd12b5741c4b.1736317725.git.zhengqi.arch@bytedance.com>
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
In-Reply-To: <4707dffce228ccec5c6662810566dd12b5741c4b.1736317725.git.zhengqi.arch@bytedance.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: KUhXNS6aArO_tUV9i1PAsm9yGShhoIw3
X-Proofpoint-GUID: AEhKKtU-rxWzLnMSxQ4AI9AzMP3tXlSR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 clxscore=1011 mlxscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 bulkscore=0 impostorscore=0 mlxlogscore=890
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501080133
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Jan 08, 2025 at 02:57:22PM +0800, Qi Zheng wrote:
> Like PMD and PTE level page table, also add statistics for PUD and P4D
> page table.
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
> Cc: linux-s390@vger.kernel.org
> ---
>  arch/s390/include/asm/pgalloc.h | 29 +++++++++++++++++++++--------
>  arch/s390/include/asm/tlb.h     |  2 ++
>  2 files changed, 23 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/s390/include/asm/pgalloc.h b/arch/s390/include/asm/pgalloc.h
> index 7b84ef6dc4b6d..a0c1ca5d8423c 100644
> --- a/arch/s390/include/asm/pgalloc.h
> +++ b/arch/s390/include/asm/pgalloc.h
> @@ -53,29 +53,42 @@ static inline p4d_t *p4d_alloc_one(struct mm_struct *mm, unsigned long address)
>  {
>  	unsigned long *table = crst_table_alloc(mm);
>  
> -	if (table)
> -		crst_table_init(table, _REGION2_ENTRY_EMPTY);
> +	if (!table)
> +		return NULL;
> +	crst_table_init(table, _REGION2_ENTRY_EMPTY);
> +	pagetable_p4d_ctor(virt_to_ptdesc(table));
> +
>  	return (p4d_t *) table;
>  }
>  
>  static inline void p4d_free(struct mm_struct *mm, p4d_t *p4d)
>  {
> -	if (!mm_p4d_folded(mm))
> -		crst_table_free(mm, (unsigned long *) p4d);
> +	if (mm_p4d_folded(mm))
> +		return;
> +
> +	pagetable_p4d_dtor(virt_to_ptdesc(p4d));
> +	crst_table_free(mm, (unsigned long *) p4d);
>  }
>  
>  static inline pud_t *pud_alloc_one(struct mm_struct *mm, unsigned long address)
>  {
>  	unsigned long *table = crst_table_alloc(mm);
> -	if (table)
> -		crst_table_init(table, _REGION3_ENTRY_EMPTY);
> +
> +	if (!table)
> +		return NULL;
> +	crst_table_init(table, _REGION3_ENTRY_EMPTY);
> +	pagetable_pud_ctor(virt_to_ptdesc(table));
> +
>  	return (pud_t *) table;
>  }
>  
>  static inline void pud_free(struct mm_struct *mm, pud_t *pud)
>  {
> -	if (!mm_pud_folded(mm))
> -		crst_table_free(mm, (unsigned long *) pud);
> +	if (mm_pud_folded(mm))
> +		return;
> +
> +	pagetable_pud_dtor(virt_to_ptdesc(pud));
> +	crst_table_free(mm, (unsigned long *) pud);
>  }
>  
>  static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long vmaddr)
> diff --git a/arch/s390/include/asm/tlb.h b/arch/s390/include/asm/tlb.h
> index e95b2c8081eb8..907d57a68145c 100644
> --- a/arch/s390/include/asm/tlb.h
> +++ b/arch/s390/include/asm/tlb.h
> @@ -122,6 +122,7 @@ static inline void p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4d,
>  {
>  	if (mm_p4d_folded(tlb->mm))
>  		return;
> +	pagetable_p4d_dtor(virt_to_ptdesc(p4d));
>  	__tlb_adjust_range(tlb, address, PAGE_SIZE);
>  	tlb->mm->context.flush_mm = 1;
>  	tlb->freed_tables = 1;
> @@ -140,6 +141,7 @@ static inline void pud_free_tlb(struct mmu_gather *tlb, pud_t *pud,
>  {
>  	if (mm_pud_folded(tlb->mm))
>  		return;
> +	pagetable_pud_dtor(virt_to_ptdesc(pud));
>  	tlb->mm->context.flush_mm = 1;
>  	tlb->freed_tables = 1;
>  	tlb->cleared_p4ds = 1;

Acked-by: Alexander Gordeev <agordeev@linux.ibm.com>

Thanks!

