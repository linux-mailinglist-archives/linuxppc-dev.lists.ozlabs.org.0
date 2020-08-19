Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1592424A0C4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 15:56:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWq8G294lzDqh2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 23:56:46 +1000 (AEST)
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
 header.s=pp1 header.b=lLjgVNp+; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWpvr3BZRzDql9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Aug 2020 23:46:00 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07JDWiqu054482; Wed, 19 Aug 2020 09:45:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=dg4OIBOGxiNiRCwdZneZErvT32JihM+Fx7ES6SWkUjo=;
 b=lLjgVNp+MhidnbqSGuntkLYvz1+Xo3zvtM3HXtqCWRBtdgrsaJd9Dc1wg/GLtZ/uhA3T
 9WtCQqE+bClB+5i3k9QjFiJ2QYtODZdSMaDtk6syMulrrE0oZXqguZxjCTt7GV4BW6eB
 AJlODhJNy2HbfmqiA8GDf0HV0vq6qmmoJH1XZG5NIRg/2c4w+Zn9g9DZYDWnVV44I9Qy
 qeyroV8Wzdhj7niecx1MDIGYuQ15AUmD2A74os1clY5x/2dPvBqil8nT51U9nhG5K+Kq
 zoOCY7lyuXZsYFWS7rOxrnE1GvIpIF8jr/ENfnWEm84e4a32bYCtgzXpnc3kPGowGAs2 Cw== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3310ey9q4w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Aug 2020 09:45:47 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07JDiek4021987;
 Wed, 19 Aug 2020 13:45:46 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma04wdc.us.ibm.com with ESMTP id 3304uem6xw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Aug 2020 13:45:46 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07JDjjwb54329756
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Aug 2020 13:45:45 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B646A112063;
 Wed, 19 Aug 2020 13:45:45 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DCF1A112065;
 Wed, 19 Aug 2020 13:45:43 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.102.3.58])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 19 Aug 2020 13:45:43 +0000 (GMT)
X-Mailer: emacs 27.1 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org
Subject: Re: [PATCH v2 00/13] mm/debug_vm_pgtable fixes
In-Reply-To: <20200819130107.478414-1-aneesh.kumar@linux.ibm.com>
References: <20200819130107.478414-1-aneesh.kumar@linux.ibm.com>
Date: Wed, 19 Aug 2020 19:15:41 +0530
Message-ID: <87tuwyvjei.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-19_06:2020-08-19,
 2020-08-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0
 priorityscore=1501 mlxlogscore=985 mlxscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008190119
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
Cc: linuxppc-dev@lists.ozlabs.org,
 Anshuman Khandual <anshuman.khandual@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:

> This patch series includes fixes for debug_vm_pgtable test code so that
> they follow page table updates rules correctly. The first two patches introduce
> changes w.r.t ppc64. The patches are included in this series for completeness. We can
> merge them via ppc64 tree if required.
>
> Hugetlb test is disabled on ppc64 because that needs larger change to satisfy
> page table update rules.
>
> Changes from V1:
> * Address review feedback
> * drop test specific pfn_pte and pfn_pmd.
> * Update ppc64 page table helper to add _PAGE_PTE 
>
> Aneesh Kumar K.V (13):
>   powerpc/mm: Add DEBUG_VM WARN for pmd_clear
>   powerpc/mm: Move setting pte specific flags to pfn_pte
>   mm/debug_vm_pgtable/ppc64: Avoid setting top bits in radom value
>   mm/debug_vm_pgtables/hugevmap: Use the arch helper to identify huge
>     vmap support.
>   mm/debug_vm_pgtable/savedwrite: Enable savedwrite test with
>     CONFIG_NUMA_BALANCING
>   mm/debug_vm_pgtable/THP: Mark the pte entry huge before using
>     set_pmd/pud_at
>   mm/debug_vm_pgtable/set_pte/pmd/pud: Don't use set_*_at to update an
>     existing pte entry
>   mm/debug_vm_pgtable/thp: Use page table depost/withdraw with THP
>   mm/debug_vm_pgtable/locks: Move non page table modifying test together
>   mm/debug_vm_pgtable/locks: Take correct page table lock
>   mm/debug_vm_pgtable/pmd_clear: Don't use pmd/pud_clear on pte entries
>   mm/debug_vm_pgtable/hugetlb: Disable hugetlb test on ppc64
>   mm/debug_vm_pgtable: populate a pte entry before fetching it
>
>  arch/powerpc/include/asm/book3s/64/pgtable.h |  29 +++-
>  arch/powerpc/include/asm/nohash/pgtable.h    |   5 -
>  arch/powerpc/mm/book3s64/pgtable.c           |   2 +-
>  arch/powerpc/mm/pgtable.c                    |   5 -
>  include/linux/io.h                           |  12 ++
>  mm/debug_vm_pgtable.c                        | 151 +++++++++++--------
>  6 files changed, 127 insertions(+), 77 deletions(-)
>

BTW I picked a wrong branch when sending this. Attaching the diff
against what I want to send.  pfn_pmd() no more updates _PAGE_PTE
because that is handled by pmd_mkhuge().

diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index 3b4da7c63e28..e18ae50a275c 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -141,7 +141,7 @@ pmd_t pfn_pmd(unsigned long pfn, pgprot_t pgprot)
 	unsigned long pmdv;
 
 	pmdv = (pfn << PAGE_SHIFT) & PTE_RPN_MASK;
-	return __pmd(pmdv | pgprot_val(pgprot) | _PAGE_PTE);
+	return pmd_set_protbits(__pmd(pmdv), pgprot);
 }
 
 pmd_t mk_pmd(struct page *page, pgprot_t pgprot)
diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
index 7d9f8e1d790f..cad61d22f33a 100644
--- a/mm/debug_vm_pgtable.c
+++ b/mm/debug_vm_pgtable.c
@@ -229,7 +229,7 @@ static void __init pmd_huge_tests(pmd_t *pmdp, unsigned long pfn, pgprot_t prot)
 
 static void __init pmd_savedwrite_tests(unsigned long pfn, pgprot_t prot)
 {
-	pmd_t pmd = pfn_pmd(pfn, prot);
+	pmd_t pmd = pmd_mkhuge(pfn_pmd(pfn, prot));
 
 	if (!IS_ENABLED(CONFIG_NUMA_BALANCING))
 		return;
