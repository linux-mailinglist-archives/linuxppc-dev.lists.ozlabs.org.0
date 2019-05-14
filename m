Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB0E1CB06
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 16:56:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 453LPG3rJbzDqMg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 00:56:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 453LM55gr4zDq7k
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 00:54:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 453LM50Nznz8tPq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 00:54:57 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 453LM464V6z9sN6; Wed, 15 May 2019 00:54:56 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 453LM42Q5vz9s4V
 for <linuxppc-dev@ozlabs.org>; Wed, 15 May 2019 00:54:56 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4EEqESe002301
 for <linuxppc-dev@ozlabs.org>; Tue, 14 May 2019 10:54:54 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2sfwu3p6bt-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Tue, 14 May 2019 10:54:53 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <aneesh.kumar@linux.ibm.com>;
 Tue, 14 May 2019 15:54:51 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 14 May 2019 15:54:50 +0100
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4EEsnSU27590900
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 May 2019 14:54:49 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CFB694203F;
 Tue, 14 May 2019 14:54:49 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C62AE42041;
 Tue, 14 May 2019 14:54:48 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.102.2.154])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 14 May 2019 14:54:48 +0000 (GMT)
X-Mailer: emacs 26.2 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
Subject: Re: [PATCH] powerpc/mm: Fix crashes with hugepages & 4K pages
In-Reply-To: <20190514134321.25575-1-mpe@ellerman.id.au>
References: <20190514134321.25575-1-mpe@ellerman.id.au>
Date: Tue, 14 May 2019 20:24:47 +0530
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 19051414-0012-0000-0000-0000031B95F2
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19051414-0013-0000-0000-000021542EC4
Message-Id: <87imudw0g8.fsf@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-14_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905140106
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
Cc: aneesh.kumar@linux.vnet.ibm.com, sachinp@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:

> The recent commit to cleanup ifdefs in the hugepage initialisation led
> to crashes when using 4K pages as reported by Sachin:
>
>   BUG: Kernel NULL pointer dereference at 0x0000001c
>   Faulting instruction address: 0xc000000001d1e58c
>   Oops: Kernel access of bad area, sig: 11 [#1]
>   LE PAGE_SIZE=4K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
>   ...
>   CPU: 3 PID: 4635 Comm: futex_wake04 Tainted: G        W  O      5.1.0-next-20190507-autotest #1
>   NIP:  c000000001d1e58c LR: c000000001d1e54c CTR: 0000000000000000
>   REGS: c000000004937890 TRAP: 0300
>   MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 22424822  XER: 00000000
>   CFAR: c00000000183e9e0 DAR: 000000000000001c DSISR: 40000000 IRQMASK: 0
>   ...
>   NIP kmem_cache_alloc+0xbc/0x5a0
>   LR  kmem_cache_alloc+0x7c/0x5a0
>   Call Trace:
>     huge_pte_alloc+0x580/0x950
>     hugetlb_fault+0x9a0/0x1250
>     handle_mm_fault+0x490/0x4a0
>     __do_page_fault+0x77c/0x1f00
>     do_page_fault+0x28/0x50
>     handle_page_fault+0x18/0x38
>
> This is caused by us trying to allocate from a NULL kmem cache in
> __hugepte_alloc(). The kmem cache is NULL because it was never
> allocated in hugetlbpage_init(), because add_huge_page_size() returned
> an error.
>
> The reason add_huge_page_size() returned an error is a simple typo, we
> are calling check_and_get_huge_psize(size) when we should be passing
> shift instead.
>
> The fact that we're able to trigger this path when the kmem caches are
> NULL is a separate bug, ie. we should not advertise any hugepage sizes
> if we haven't setup the required caches for them.
>
> This was only seen with 4K pages, with 64K pages we don't need to
> allocate any extra kmem caches because the 16M hugepage just occupies
> a single entry at the PMD level.
>

Reviewed-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

> Fixes: 723f268f19da ("powerpc/mm: cleanup ifdef mess in add_huge_page_size()")
> Reported-by: Sachin Sant <sachinp@linux.ibm.com>
> Tested-by: Sachin Sant <sachinp@linux.ibm.com>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  arch/powerpc/mm/hugetlbpage.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
> index c5c9ff2d7afc..b5d92dc32844 100644
> --- a/arch/powerpc/mm/hugetlbpage.c
> +++ b/arch/powerpc/mm/hugetlbpage.c
> @@ -556,7 +556,7 @@ static int __init add_huge_page_size(unsigned long long size)
>  	if (size <= PAGE_SIZE || !is_power_of_2(size))
>  		return -EINVAL;
>  
> -	mmu_psize = check_and_get_huge_psize(size);
> +	mmu_psize = check_and_get_huge_psize(shift);
>  	if (mmu_psize < 0)
>  		return -EINVAL;
>  
> -- 
> 2.20.1

