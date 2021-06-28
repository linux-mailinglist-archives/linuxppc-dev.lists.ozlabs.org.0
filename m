Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BFF3B58ED
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Jun 2021 08:04:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GCxrw20QLz2yYh
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Jun 2021 16:04:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Dtq68a0x;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Dtq68a0x; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GCxrS0P1Jz2yXj
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Jun 2021 16:04:07 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15S63bVB028683; Mon, 28 Jun 2021 02:03:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=CSe8oBYUzmv2QLg981RIoKEM76oSxvVA2+PI2FyhoyI=;
 b=Dtq68a0x+Hmh0Ts8QHV8JF0TzYf/rzdEHXTzi6bXu5vnRSXXvY+ItS3yrS2plg2F5HNM
 bXJvNo59Kqf3k+/LgfS3qV8TIN5BIPX+jOQWUhBbSDCkUb/3jYMn3UVNLeBmXCBKZtOD
 Ejf9JtEYx2miHV0W0PODYeXsmF/gH+moIjlCWcBsQoBKQr1YRdqKILaTX4D/xRNwXH8h
 qPGC8ghphw+gdfeVu8JIA8zWxeiPlh5ITAy4SfZy8ce/T1Vft8EOY061xTwIBBth2eyX
 LeOsLVKPUgSYj1LCeYz1MssBrdNiROcVepEv/jawKdzRkfLMY2yy42jaUz1Y8Gce24RP nw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39f6sfakyy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Jun 2021 02:03:45 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15S63ftY029070;
 Mon, 28 Jun 2021 02:03:44 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39f6sfakyk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Jun 2021 02:03:44 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15S63AZ2021970;
 Mon, 28 Jun 2021 06:03:43 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma04dal.us.ibm.com with ESMTP id 39ekx9f83b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Jun 2021 06:03:43 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15S63gRr13107526
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Jun 2021 06:03:42 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 04384C605F;
 Mon, 28 Jun 2021 06:03:42 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 271FEC6055;
 Mon, 28 Jun 2021 06:03:38 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.85.91.177])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 28 Jun 2021 06:03:37 +0000 (GMT)
X-Mailer: emacs 28.0.50 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Steven Price <steven.price@arm.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org
Subject: Re: [PATCH v3] mm: pagewalk: Fix walk for hugepage tables
In-Reply-To: <38d04410700c8d02f28ba37e020b62c55d6f3d2c.1624597695.git.christophe.leroy@csgroup.eu>
References: <38d04410700c8d02f28ba37e020b62c55d6f3d2c.1624597695.git.christophe.leroy@csgroup.eu>
Date: Mon, 28 Jun 2021 11:33:35 +0530
Message-ID: <87bl7qle4o.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: RC-M6h30cdQaqCwwTmW44E92686JJ4Af
X-Proofpoint-GUID: B71VDKPLLizhblFHH34Gd7exK_gUjFhy
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-28_03:2021-06-25,
 2021-06-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 mlxscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106280042
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
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 Oliver O'Halloran <oohall@gmail.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:

> Pagewalk ignores hugepd entries and walk down the tables
> as if it was traditionnal entries, leading to crazy result.

But we do handle hugetlb separately

	if (vma && is_vm_hugetlb_page(vma)) {
		if (ops->hugetlb_entry)
			err = walk_hugetlb_range(start, end, walk);
	} else
		err = walk_pgd_range(start, end, walk);

Are we using hugepd format for non hugetlb entries?

>
> Add walk_hugepd_range() and use it to walk hugepage tables.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Reviewed-by: Steven Price <steven.price@arm.com>
> ---
> v3:
> - Rebased on next-20210624 (no change since v2)
> - Added Steven's Reviewed-by
> - Sent as standalone for merge via mm
>
> v2:
> - Add a guard for NULL ops->pte_entry
> - Take mm->page_table_lock when walking hugepage table, as suggested by follow_huge_pd()
> ---
>  mm/pagewalk.c | 58 ++++++++++++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 53 insertions(+), 5 deletions(-)
>
> diff --git a/mm/pagewalk.c b/mm/pagewalk.c
> index e81640d9f177..9b3db11a4d1d 100644
> --- a/mm/pagewalk.c
> +++ b/mm/pagewalk.c
> @@ -58,6 +58,45 @@ static int walk_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>  	return err;
>  }
>  
> +#ifdef CONFIG_ARCH_HAS_HUGEPD
> +static int walk_hugepd_range(hugepd_t *phpd, unsigned long addr,
> +			     unsigned long end, struct mm_walk *walk, int pdshift)
> +{
> +	int err = 0;
> +	const struct mm_walk_ops *ops = walk->ops;
> +	int shift = hugepd_shift(*phpd);
> +	int page_size = 1 << shift;
> +
> +	if (!ops->pte_entry)
> +		return 0;
> +
> +	if (addr & (page_size - 1))
> +		return 0;
> +
> +	for (;;) {
> +		pte_t *pte;
> +
> +		spin_lock(&walk->mm->page_table_lock);
> +		pte = hugepte_offset(*phpd, addr, pdshift);
> +		err = ops->pte_entry(pte, addr, addr + page_size, walk);
> +		spin_unlock(&walk->mm->page_table_lock);
> +
> +		if (err)
> +			break;
> +		if (addr >= end - page_size)
> +			break;
> +		addr += page_size;
> +	}
> +	return err;
> +}
> +#else
> +static int walk_hugepd_range(hugepd_t *phpd, unsigned long addr,
> +			     unsigned long end, struct mm_walk *walk, int pdshift)
> +{
> +	return 0;
> +}
> +#endif
> +
>  static int walk_pmd_range(pud_t *pud, unsigned long addr, unsigned long end,
>  			  struct mm_walk *walk)
>  {
> @@ -108,7 +147,10 @@ static int walk_pmd_range(pud_t *pud, unsigned long addr, unsigned long end,
>  				goto again;
>  		}
>  
> -		err = walk_pte_range(pmd, addr, next, walk);
> +		if (is_hugepd(__hugepd(pmd_val(*pmd))))
> +			err = walk_hugepd_range((hugepd_t *)pmd, addr, next, walk, PMD_SHIFT);
> +		else
> +			err = walk_pte_range(pmd, addr, next, walk);
>  		if (err)
>  			break;
>  	} while (pmd++, addr = next, addr != end);
> @@ -157,7 +199,10 @@ static int walk_pud_range(p4d_t *p4d, unsigned long addr, unsigned long end,
>  		if (pud_none(*pud))
>  			goto again;
>  
> -		err = walk_pmd_range(pud, addr, next, walk);
> +		if (is_hugepd(__hugepd(pud_val(*pud))))
> +			err = walk_hugepd_range((hugepd_t *)pud, addr, next, walk, PUD_SHIFT);
> +		else
> +			err = walk_pmd_range(pud, addr, next, walk);
>  		if (err)
>  			break;
>  	} while (pud++, addr = next, addr != end);
> @@ -189,7 +234,9 @@ static int walk_p4d_range(pgd_t *pgd, unsigned long addr, unsigned long end,
>  			if (err)
>  				break;
>  		}
> -		if (ops->pud_entry || ops->pmd_entry || ops->pte_entry)
> +		if (is_hugepd(__hugepd(p4d_val(*p4d))))
> +			err = walk_hugepd_range((hugepd_t *)p4d, addr, next, walk, P4D_SHIFT);
> +		else if (ops->pud_entry || ops->pmd_entry || ops->pte_entry)
>  			err = walk_pud_range(p4d, addr, next, walk);
>  		if (err)
>  			break;
> @@ -224,8 +271,9 @@ static int walk_pgd_range(unsigned long addr, unsigned long end,
>  			if (err)
>  				break;
>  		}
> -		if (ops->p4d_entry || ops->pud_entry || ops->pmd_entry ||
> -		    ops->pte_entry)
> +		if (is_hugepd(__hugepd(pgd_val(*pgd))))
> +			err = walk_hugepd_range((hugepd_t *)pgd, addr, next, walk, PGDIR_SHIFT);
> +		else if (ops->p4d_entry || ops->pud_entry || ops->pmd_entry || ops->pte_entry)
>  			err = walk_p4d_range(pgd, addr, next, walk);
>  		if (err)
>  			break;
> -- 
> 2.25.0
