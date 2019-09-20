Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8104EB92B2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Sep 2019 16:35:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Zbpw3nsJzDqF3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Sep 2019 00:35:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ZbcV0dCCzDrL1
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Sep 2019 00:26:17 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8KE8ivV094660; Fri, 20 Sep 2019 10:26:05 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v4ycskjwv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Sep 2019 10:26:04 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8KEMFf0006224;
 Fri, 20 Sep 2019 14:26:03 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma05wdc.us.ibm.com with ESMTP id 2v3vbu6h7p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Sep 2019 14:26:03 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8KEPxhq49611246
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 Sep 2019 14:26:00 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E13E8B2064;
 Fri, 20 Sep 2019 14:25:59 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2911FB206B;
 Fri, 20 Sep 2019 14:25:58 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.199.44.128])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 20 Sep 2019 14:25:57 +0000 (GMT)
X-Mailer: emacs 26.2 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Qian Cai <cai@lca.pw>
Subject: Re: "Pick the right alignment default when creating dax devices"
 failed to build on powerpc
In-Reply-To: <1568988209.5576.199.camel@lca.pw>
References: <1568988209.5576.199.camel@lca.pw>
Date: Fri, 20 Sep 2019 19:55:55 +0530
Message-ID: <87r24bhwng.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-20_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909200136
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
Cc: Dan Williams <dan.j.williams@intel.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Qian Cai <cai@lca.pw> writes:

> The linux-next commit "libnvdimm/dax: Pick the right alignment default when
> creating dax devices" causes powerpc failed to build with this config. Reverted
> it fixed the issue.
>
> ERROR: "hash__has_transparent_hugepage" [drivers/nvdimm/libnvdimm.ko] undefined!
> ERROR: "radix__has_transparent_hugepage" [drivers/nvdimm/libnvdimm.ko]
> undefined!
> make[1]: *** [scripts/Makefile.modpost:93: __modpost] Error 1
> make: *** [Makefile:1305: modules] Error 2
>
> [1] https://patchwork.kernel.org/patch/11133445/
> [2] https://raw.githubusercontent.com/cailca/linux-mm/master/powerpc.config

Sorry for breaking the build. How about?

commit ea15fd8b5489e2c8e9f1b96d67248a7428ffb74a
Author: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Date:   Fri Sep 20 19:47:56 2019 +0530

    powerpc/book3s/nvdimm: Fix build error with nvdimm kernel module
    
    Fix the below comiple error.
    
    ERROR: "hash__has_transparent_hugepage" [drivers/nvdimm/libnvdimm.ko] undefined!
    ERROR: "radix__has_transparent_hugepage" [drivers/nvdimm/libnvdimm.ko] undefined!
    
    Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

diff --git a/arch/powerpc/include/asm/book3s/64/radix.h b/arch/powerpc/include/asm/book3s/64/radix.h
index e04a839cb5b9..65a6966f1de4 100644
--- a/arch/powerpc/include/asm/book3s/64/radix.h
+++ b/arch/powerpc/include/asm/book3s/64/radix.h
@@ -254,7 +254,13 @@ extern void radix__pgtable_trans_huge_deposit(struct mm_struct *mm, pmd_t *pmdp,
 extern pgtable_t radix__pgtable_trans_huge_withdraw(struct mm_struct *mm, pmd_t *pmdp);
 extern pmd_t radix__pmdp_huge_get_and_clear(struct mm_struct *mm,
 				      unsigned long addr, pmd_t *pmdp);
-extern int radix__has_transparent_hugepage(void);
+static inline int radix__has_transparent_hugepage(void)
+{
+	/* For radix 2M at PMD level means thp */
+	if (mmu_psize_defs[MMU_PAGE_2M].shift == PMD_SHIFT)
+		return 1;
+	return 0;
+}
 #endif
 
 extern int __meminit radix__vmemmap_create_mapping(unsigned long start,
diff --git a/arch/powerpc/mm/book3s64/hash_pgtable.c b/arch/powerpc/mm/book3s64/hash_pgtable.c
index d1f390ac9cdb..64733b9cb20a 100644
--- a/arch/powerpc/mm/book3s64/hash_pgtable.c
+++ b/arch/powerpc/mm/book3s64/hash_pgtable.c
@@ -406,6 +406,8 @@ int hash__has_transparent_hugepage(void)
 
 	return 1;
 }
+EXPORT_SYMBOL_GPL(hash__has_transparent_hugepage);
+
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
 #ifdef CONFIG_STRICT_KERNEL_RWX
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index b4ca9e95e678..dc7a38f0a45b 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -1057,13 +1057,6 @@ pmd_t radix__pmdp_huge_get_and_clear(struct mm_struct *mm,
 	return old_pmd;
 }
 
-int radix__has_transparent_hugepage(void)
-{
-	/* For radix 2M at PMD level means thp */
-	if (mmu_psize_defs[MMU_PAGE_2M].shift == PMD_SHIFT)
-		return 1;
-	return 0;
-}
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
 void radix__ptep_set_access_flags(struct vm_area_struct *vma, pte_t *ptep,
