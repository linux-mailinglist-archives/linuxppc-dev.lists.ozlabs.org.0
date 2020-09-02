Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 57AAC25A408
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 05:25:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bh8TM41Z3zDqdS
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 13:25:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=azJKGcoK; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bh8RV2GqBzDqXq
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Sep 2020 13:23:50 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0823KbMh075309; Tue, 1 Sep 2020 23:23:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=nLuE3mHjJelWvYnysULu3m6kt+EOonC33mOzhj7FswU=;
 b=azJKGcoKuZ2lXKKxwScetQ9luU/XB7CleYiZz+1FXaFPxah9aHh1PISHH1CWs52I4Ez9
 nAlh/QVZtQhFji/rqq8nxkhLtGSUv+l/rZQCptsHo5jNRK2ALQvUEMhgqDIVXUt5VOv6
 UsAbcjLlTmbxOB3JuznPT0CboFJjY/o0p+0rzJql0nDmg6VkyzVtJNxOvjJrsZD1i8Nu
 k6NnZSHHGD2SjqNVLyXxZsvaWidhmE1CoS/xhKQUBCOp7ILbHSHI0rK3cIccjashPY/r
 M6DEgdgfjzt3NDRT6GG/FLZRtLbLc0aBXyQ2uhsGlKUrMuJ2AI/DywHUIoj8YSwhZyoX QA== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33a3der1cr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Sep 2020 23:23:35 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0823BoXc017628;
 Wed, 2 Sep 2020 03:23:34 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma04dal.us.ibm.com with ESMTP id 339tmuuxbr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Sep 2020 03:23:34 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0823NSNr19399026
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Sep 2020 03:23:28 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 51D3A78063;
 Wed,  2 Sep 2020 03:23:33 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ED49B7805C;
 Wed,  2 Sep 2020 03:23:30 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.199.61.124])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  2 Sep 2020 03:23:30 +0000 (GMT)
X-Mailer: emacs 27.1 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc: Fix random segfault when freeing hugetlb range
In-Reply-To: <f0cb2a5477cd87d1eaadb128042e20aeb2bc2859.1598860677.git.christophe.leroy@csgroup.eu>
References: <f0cb2a5477cd87d1eaadb128042e20aeb2bc2859.1598860677.git.christophe.leroy@csgroup.eu>
Date: Wed, 02 Sep 2020 08:53:28 +0530
Message-ID: <875z8weua7.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-02_02:2020-09-01,
 2020-09-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 bulkscore=0
 malwarescore=0 suspectscore=2 mlxlogscore=999 phishscore=0
 lowpriorityscore=0 mlxscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2009020022
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:

> The following random segfault is observed from time to time with
> map_hugetlb selftest:
>
> root@localhost:~# ./map_hugetlb 1 19
> 524288 kB hugepages
> Mapping 1 Mbytes
> Segmentation fault
>
> [   31.219972] map_hugetlb[365]: segfault (11) at 117 nip 77974f8c lr 779a6834 code 1 in ld-2.23.so[77966000+21000]
> [   31.220192] map_hugetlb[365]: code: 9421ffc0 480318d1 93410028 90010044 9361002c 93810030 93a10034 93c10038
> [   31.220307] map_hugetlb[365]: code: 93e1003c 93210024 8123007c 81430038 <80e90004> 814a0004 7f443a14 813a0004
> [   31.221911] BUG: Bad rss-counter state mm:(ptrval) type:MM_FILEPAGES val:33
> [   31.229362] BUG: Bad rss-counter state mm:(ptrval) type:MM_ANONPAGES val:5
>
> This fault is due to hugetlb_free_pgd_range() freeing page tables
> that are also used by regular pages.
>
> As explain in the comment at the beginning of
> hugetlb_free_pgd_range(), the verification done in free_pgd_range()
> on floor and ceiling is not done here, which means
> hugetlb_free_pte_range() can free outside the expected range.
>
> As the verification cannot be done in hugetlb_free_pgd_range(), it
> must be done in hugetlb_free_pte_range().
>

Reviewed-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

> Fixes: b250c8c08c79 ("powerpc/8xx: Manage 512k huge pages as standard pages.")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/mm/hugetlbpage.c | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
> index 26292544630f..e7ae2a2c4545 100644
> --- a/arch/powerpc/mm/hugetlbpage.c
> +++ b/arch/powerpc/mm/hugetlbpage.c
> @@ -330,10 +330,24 @@ static void free_hugepd_range(struct mmu_gather *tlb, hugepd_t *hpdp, int pdshif
>  				 get_hugepd_cache_index(pdshift - shift));
>  }
>  
> -static void hugetlb_free_pte_range(struct mmu_gather *tlb, pmd_t *pmd, unsigned long addr)
> +static void hugetlb_free_pte_range(struct mmu_gather *tlb, pmd_t *pmd,
> +				   unsigned long addr, unsigned long end,
> +				   unsigned long floor, unsigned long ceiling)
>  {
> +	unsigned long start = addr;
>  	pgtable_t token = pmd_pgtable(*pmd);
>  
> +	start &= PMD_MASK;
> +	if (start < floor)
> +		return;
> +	if (ceiling) {
> +		ceiling &= PMD_MASK;
> +		if (!ceiling)
> +			return;
> +	}
> +	if (end - 1 > ceiling - 1)
> +		return;
> +

We do repeat that for pud/pmd/pte hugetlb_free_range. Can we consolidate
that with comment explaining we are checking if the pgtable entry is
mapping outside the range?

>  	pmd_clear(pmd);
>  	pte_free_tlb(tlb, token, addr);
>  	mm_dec_nr_ptes(tlb->mm);
> @@ -363,7 +377,7 @@ static void hugetlb_free_pmd_range(struct mmu_gather *tlb, pud_t *pud,
>  			 */
>  			WARN_ON(!IS_ENABLED(CONFIG_PPC_8xx));
>  
> -			hugetlb_free_pte_range(tlb, pmd, addr);
> +			hugetlb_free_pte_range(tlb, pmd, addr, end, floor, ceiling);
>  
>  			continue;
>  		}
> -- 
> 2.25.0
