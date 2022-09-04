Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 045BC5AC589
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Sep 2022 18:58:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MLHsC6wzTz3blY
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Sep 2022 02:58:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XZSK/o5y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XZSK/o5y;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MLHrS4yrJz2xHw
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Sep 2022 02:57:27 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 284GN2mi021856;
	Sun, 4 Sep 2022 16:57:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=YfNxwyPi16+FUS5Y5zzU9QkpeeP1B3L48uY4NJ8juLc=;
 b=XZSK/o5y+QXg24S7GDwRTWsv9GvetVXr+mSAw8qnzPZIg2zUTbnVTJsIJAA4OjHrVQ5h
 wgUfO+BB9oiqlAAOz7em2eIs+IUHT/zVf0kw29bvYQHcJA+/KNAkDSQrFICdSU+Za4+u
 gdzdwTAj2WuYi+QHrkiy6ImNOu+uB2a/QmBOM33LEdq97eUE6nHOCDR5ESGMDIRng293
 wA2AzgSLxK4eDcpf+NSWZbTclTep5sM/6Gtlll8dsql9pfjuE7F7jOgCgkFLw1901yW6
 teGx/nXLtFOqAHmpXMquSKAgsTmdcyCAQPE7oJTa4cauC4qlQwQTh17P+mdyunUxm/09 YA== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jcyg8re6b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 04 Sep 2022 16:57:18 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 284GoRhT015418;
	Sun, 4 Sep 2022 16:57:18 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com [9.57.198.26])
	by ppma03dal.us.ibm.com with ESMTP id 3jbxj9jcpq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 04 Sep 2022 16:57:18 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com [9.57.199.111])
	by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 284GvHrx12780032
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 4 Sep 2022 16:57:17 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 504F1AC05E;
	Sun,  4 Sep 2022 16:57:17 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8D819AC059;
	Sun,  4 Sep 2022 16:57:15 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.43.81.44])
	by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
	Sun,  4 Sep 2022 16:57:15 +0000 (GMT)
X-Mailer: emacs 29.0.50 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 1/2] powerpc/mm/64s: Drop pgd_huge()
In-Reply-To: <20220903123640.719846-1-mpe@ellerman.id.au>
References: <20220903123640.719846-1-mpe@ellerman.id.au>
Date: Sun, 04 Sep 2022 22:27:11 +0530
Message-ID: <877d2jaxi0.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: jFBbwKC4s2WG0HAZgKF7JE1Uw0M247ru
X-Proofpoint-GUID: jFBbwKC4s2WG0HAZgKF7JE1Uw0M247ru
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-09-04_02,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=845 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209040084
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
Cc: linux-mm@kvack.org, mike.kravetz@oracle.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:

>
> On powerpc there are two ways for huge pages to be represented in the
> top level page table, aka PGD (Page Global Directory).
>
> If the address space mapped by an individual PGD entry does not
> correspond to a given huge page size, then the PGD entry points to a
> non-standard page table, known as a "hugepd" (Huge Page Directory).
> The hugepd contains some number of huge page PTEs sufficient to map the
> address space with the given huge page size.
>
> On the other hand, if the address space mapped by an individual PGD
> entry does correspond exactly to a given huge page size, that PGD entry
> is used to directly encode the huge page PTE in place. In this case the
> pgd_huge() wrapper indicates to generic code that the PGD entry is
> actually a huge page PTE.
>
> This commit deals with the pgd_huge() case only, it does nothing with
> respect to the hugepd case.
>
> Over time the size of the virtual address space supported on powerpc has
> increased several times, which means the location at which huge pages
> can sit in the tree has also changed. There have also been new huge page
> sizes added, with the introduction of the Radix MMU.
>
> On Power9 and later with the Radix MMU, the largest huge page size in
> any implementation is 1GB.
>
> Since the introduction of Radix, 1GB entries have been supported at the
> PUD level, with both 4K and 64K base page size. Radix has never had a
> supported huge page size at the PGD level.
>
> On Power8 or earlier, which uses the Hash MMU, or Power9 or later with
> the Hash MMU enabled, the largest huge page size is 16GB.
>
> Using the Hash MMU and a base page size of 4K, 16GB has never been a
> supported huge page size at the PGD level, due to the geometry being
> incompatible. The two supported huge page sizes (16M & 16GB) both use
> the hugepd format.
>
> Using the Hash MMU and a base page size of 64K, 16GB pages were
> supported in the past at the PGD level.
>
> However in commit ba95b5d03596 ("powerpc/mm/book3s/64: Rework page table
> geometry for lower memory usage") the page table layout was reworked to
> shrink the size of the PGD.
>
> As a result the 16GB page size now fits at the PUD level when using 64K
> base page size.
>
> Therefore there are no longer any supported configurations where
> pgd_huge() can be true, so drop the definitions for pgd_huge(), and
> fallback to the generic definition which is always false.
>

Reviewed-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

> Fixes: ba95b5d03596 ("powerpc/mm/book3s/64: Rework page table geometry for lower memory usage")
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  arch/powerpc/include/asm/book3s/64/pgtable-4k.h  | 10 ----------
>  arch/powerpc/include/asm/book3s/64/pgtable-64k.h |  9 ---------
>  2 files changed, 19 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/book3s/64/pgtable-4k.h b/arch/powerpc/include/asm/book3s/64/pgtable-4k.h
> index 4e697bc2f4cd..48f21820afe2 100644
> --- a/arch/powerpc/include/asm/book3s/64/pgtable-4k.h
> +++ b/arch/powerpc/include/asm/book3s/64/pgtable-4k.h
> @@ -26,16 +26,6 @@ static inline int pud_huge(pud_t pud)
>  	return 0;
>  }
>  
> -static inline int pgd_huge(pgd_t pgd)
> -{
> -	/*
> -	 * leaf pte for huge page
> -	 */
> -	if (radix_enabled())
> -		return !!(pgd_raw(pgd) & cpu_to_be64(_PAGE_PTE));
> -	return 0;
> -}
> -#define pgd_huge pgd_huge
>  /*
>   * With radix , we have hugepage ptes in the pud and pmd entries. We don't
>   * need to setup hugepage directory for them. Our pte and page directory format
> diff --git a/arch/powerpc/include/asm/book3s/64/pgtable-64k.h b/arch/powerpc/include/asm/book3s/64/pgtable-64k.h
> index 34d1018896b3..2fce3498b000 100644
> --- a/arch/powerpc/include/asm/book3s/64/pgtable-64k.h
> +++ b/arch/powerpc/include/asm/book3s/64/pgtable-64k.h
> @@ -30,15 +30,6 @@ static inline int pud_huge(pud_t pud)
>  	return !!(pud_raw(pud) & cpu_to_be64(_PAGE_PTE));
>  }
>  
> -static inline int pgd_huge(pgd_t pgd)
> -{
> -	/*
> -	 * leaf pte for huge page
> -	 */
> -	return !!(pgd_raw(pgd) & cpu_to_be64(_PAGE_PTE));
> -}
> -#define pgd_huge pgd_huge
> -
>  /*
>   * With 64k page size, we have hugepage ptes in the pgd and pmd entries. We don't
>   * need to setup hugepage directory for them. Our pte and page directory format
> -- 
> 2.37.2
