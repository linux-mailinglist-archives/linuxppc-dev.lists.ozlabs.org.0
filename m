Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED05685CABA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Feb 2024 23:27:37 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=motorola.com header.i=@motorola.com header.a=rsa-sha256 header.s=DKIM202306 header.b=ElSgGv+K;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TfYtv60M6z3vgk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Feb 2024 09:27:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=motorola.com header.i=@motorola.com header.a=rsa-sha256 header.s=DKIM202306 header.b=ElSgGv+K;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=motorola.com (client-ip=148.163.148.104; helo=mx0a-00823401.pphosted.com; envelope-from=mbland@motorola.com; receiver=lists.ozlabs.org)
Received: from mx0a-00823401.pphosted.com (mx0a-00823401.pphosted.com [148.163.148.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TfYHs6972z30fm
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Feb 2024 09:00:40 +1100 (AEDT)
Received: from pps.filterd (m0355087.ppops.net [127.0.0.1])
	by mx0a-00823401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41KJD95s024286;
	Tue, 20 Feb 2024 20:33:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=motorola.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references; s=
	DKIM202306; bh=lwi3HRNY78hVZA0tkjf7HxRAkL6o9c683flfMjEmlDw=; b=E
	lSgGv+KqoOf5uoj86cmnKJHlpO8dh3somQfJMLfScSNqsu6w2yerKMo4dfeFFdjc
	ac0NUN5+TdUJgTX/l98WxBM2B2g9h4agUt2h5xsTdnQM3W5+KVeo4VL+5TT1Ih/A
	28MoIHA57HPmOmTXO2DDqDVDP/tktkt/rWfWggdoPMwsl1gv/kFDWTT8Lmmu8h8E
	4WSK0ZZkUD0mbRcWeNuLl5MTFmyj4fWznK/5Z8Fs6+RzBDvb9vO+uhnPmXpO5bWZ
	Wpec6+tkdY03l9oWiYDuUUeH70qYhoL90l7Yg9SbclAwfFkO/NUPP8i9FbLKVX4k
	wF0RW4+b/UsQdUbrND77w==
Received: from ilclpfpp01.lenovo.com ([144.188.128.67])
	by mx0a-00823401.pphosted.com (PPS) with ESMTPS id 3wd22085c8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Feb 2024 20:33:20 +0000 (GMT)
Received: from ilclmmrp01.lenovo.com (ilclmmrp01.mot.com [100.65.83.165])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ilclpfpp01.lenovo.com (Postfix) with ESMTPS id 4TfWM34D5FzfBZq;
	Tue, 20 Feb 2024 20:33:19 +0000 (UTC)
Received: from ilclasset01.mot.com (ilclasset01.mot.com [100.64.7.105])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mbland)
	by ilclmmrp01.lenovo.com (Postfix) with ESMTPSA id 4TfWM33V0nz3n3fr;
	Tue, 20 Feb 2024 20:33:19 +0000 (UTC)
From: Maxwell Bland <mbland@motorola.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/4] mm: pgalloc: support address-conditional pmd allocation
Date: Tue, 20 Feb 2024 14:32:54 -0600
Message-Id: <20240220203256.31153-3-mbland@motorola.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240220203256.31153-1-mbland@motorola.com>
References: <20240220203256.31153-1-mbland@motorola.com>
X-Proofpoint-GUID: 2FTPwLLxVF_PmOE_sZo-Tr78eaAtLsFQ
X-Proofpoint-ORIG-GUID: 2FTPwLLxVF_PmOE_sZo-Tr78eaAtLsFQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-20_06,2024-02-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 lowpriorityscore=0
 malwarescore=0 mlxlogscore=781 spamscore=0 clxscore=1015 impostorscore=0
 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402200146
X-Mailman-Approved-At: Wed, 21 Feb 2024 09:21:41 +1100
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
Cc: mark.rutland@arm.com, linux-efi@vger.kernel.org, david@redhat.com, catalin.marinas@arm.com, dave.hansen@linux.intel.com, ast@kernel.org, linux@armlinux.org.uk, linux-mm@kvack.org, ryabinin.a.a@gmail.com, glider@google.com, kasan-dev@googlegroups.com, yonghong.song@linux.dev, wuqiang.matt@bytedance.com, agordeev@linux.ibm.com, vincenzo.frascino@arm.com, will@kernel.org, ardb@kernel.org, michael.christie@oracle.com, quic_nprakash@quicinc.com, linux-arch@vger.kernel.org, hch@infradead.org, gor@linux.ibm.com, daniel@iogearbox.net, mst@redhat.com, john.fastabend@gmail.com, andrii@kernel.org, aneesh.kumar@kernel.org, urezki@gmail.com, samitolvanen@google.com, zlim.lnx@gmail.com, naveen.n.rao@linux.ibm.com, dennis@kernel.org, borntraeger@linux.ibm.com, cl@linux.com, aou@eecs.berkeley.edu, ryan.roberts@arm.com, arnd@arndb.de, linux-s390@vger.kernel.org, hca@linux.ibm.com, mbland@motorola.com, npiggin@gmail.com, kpsingh@kernel.org, meted@linux.ibm.com, quic_pkondeti@quicinc.com, paul.walm
 sley@sifive.com, surenb@google.com, akpm@linux-foundation.org, dvyukov@google.com, andreyknvl@gmail.com, haoluo@google.com, brauner@kernel.org, mjguzik@gmail.com, lstoakes@gmail.com, song@kernel.org, gregkh@linuxfoundation.org, muchun.song@linux.dev, linux-kernel@vger.kernel.org, awheeler@motorola.com, martin.lau@linux.dev, linux-riscv@lists.infradead.org, palmer@dabbelt.com, svens@linux.ibm.com, jolsa@kernel.org, tj@kernel.org, guoren@kernel.org, bpf@vger.kernel.org, rick.p.edgecombe@intel.com, linuxppc-dev@lists.ozlabs.org, sdf@google.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

While other descriptors (e.g. pud) allow allocations conditional on
which virtual address is allocated, pmd descriptor allocations do not.
However, adding support for this is straightforward and is beneficial to
future kernel development targeting the PMD memory granularity.

As many architectures already implement pmd_populate_kernel in an
address-generic manner, it is necessary to roll out support
incrementally. For this purpose a preprocessor flag,
__HAVE_ARCH_ADDR_COND_PMD is introduced to capture whether the
architecture supports some feature requiring PMD allocation conditional
on virtual address. Some microarchitectures (e.g. arm64) support
configurations for table descriptors, for example to enforce Privilege
eXecute Never, which benefit from knowing the virtual memory addresses
referenced by PMDs.

Thus two major arguments in favor of this change are (1) unformity of
allocation between PMD and other table descriptor types and (2) the
capability of address-specific PMD allocation.

Signed-off-by: Maxwell Bland <mbland@motorola.com>
---
 include/asm-generic/pgalloc.h | 18 ++++++++++++++++++
 include/linux/mm.h            |  4 ++--
 mm/hugetlb_vmemmap.c          |  4 ++--
 mm/kasan/init.c               | 22 +++++++++++++---------
 mm/memory.c                   |  4 ++--
 mm/percpu.c                   |  2 +-
 mm/pgalloc-track.h            |  3 ++-
 mm/sparse-vmemmap.c           |  2 +-
 8 files changed, 41 insertions(+), 18 deletions(-)

diff --git a/include/asm-generic/pgalloc.h b/include/asm-generic/pgalloc.h
index 879e5f8aa5e9..e5cdce77c6e4 100644
--- a/include/asm-generic/pgalloc.h
+++ b/include/asm-generic/pgalloc.h
@@ -142,6 +142,24 @@ static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long addr)
 }
 #endif
 
+#ifdef __HAVE_ARCH_ADDR_COND_PMD
+static inline void pmd_populate_kernel(struct mm_struct *mm, pmd_t *pmdp,
+			pte_t *ptep, unsigned long address);
+#else
+static inline void pmd_populate_kernel(struct mm_struct *mm, pmd_t *pmdp,
+			pte_t *ptep);
+#endif
+
+static inline void pmd_populate_kernel_at(struct mm_struct *mm, pmd_t *pmdp,
+			pte_t *ptep, unsigned long address)
+{
+#ifdef __HAVE_ARCH_ADDR_COND_PMD
+	pmd_populate_kernel(mm, pmdp, ptep, address);
+#else
+	pmd_populate_kernel(mm, pmdp, ptep);
+#endif
+}
+
 #ifndef __HAVE_ARCH_PMD_FREE
 static inline void pmd_free(struct mm_struct *mm, pmd_t *pmd)
 {
diff --git a/include/linux/mm.h b/include/linux/mm.h
index f5a97dec5169..6a9d5ded428d 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2782,7 +2782,7 @@ static inline void mm_dec_nr_ptes(struct mm_struct *mm) {}
 #endif
 
 int __pte_alloc(struct mm_struct *mm, pmd_t *pmd);
-int __pte_alloc_kernel(pmd_t *pmd);
+int __pte_alloc_kernel(pmd_t *pmd, unsigned long address);
 
 #if defined(CONFIG_MMU)
 
@@ -2977,7 +2977,7 @@ pte_t *pte_offset_map_nolock(struct mm_struct *mm, pmd_t *pmd,
 		 NULL : pte_offset_map_lock(mm, pmd, address, ptlp))
 
 #define pte_alloc_kernel(pmd, address)			\
-	((unlikely(pmd_none(*(pmd))) && __pte_alloc_kernel(pmd))? \
+	((unlikely(pmd_none(*(pmd))) && __pte_alloc_kernel(pmd, address)) ? \
 		NULL: pte_offset_kernel(pmd, address))
 
 #if USE_SPLIT_PMD_PTLOCKS
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index da177e49d956..1f5664b656f1 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -58,7 +58,7 @@ static int vmemmap_split_pmd(pmd_t *pmd, struct page *head, unsigned long start,
 	if (!pgtable)
 		return -ENOMEM;
 
-	pmd_populate_kernel(&init_mm, &__pmd, pgtable);
+	pmd_populate_kernel_at(&init_mm, &__pmd, pgtable, addr);
 
 	for (i = 0; i < PTRS_PER_PTE; i++, addr += PAGE_SIZE) {
 		pte_t entry, *pte;
@@ -81,7 +81,7 @@ static int vmemmap_split_pmd(pmd_t *pmd, struct page *head, unsigned long start,
 
 		/* Make pte visible before pmd. See comment in pmd_install(). */
 		smp_wmb();
-		pmd_populate_kernel(&init_mm, pmd, pgtable);
+		pmd_populate_kernel_at(&init_mm, pmd, pgtable, addr);
 		if (!(walk->flags & VMEMMAP_SPLIT_NO_TLB_FLUSH))
 			flush_tlb_kernel_range(start, start + PMD_SIZE);
 	} else {
diff --git a/mm/kasan/init.c b/mm/kasan/init.c
index 89895f38f722..1e31d965a14e 100644
--- a/mm/kasan/init.c
+++ b/mm/kasan/init.c
@@ -116,8 +116,9 @@ static int __ref zero_pmd_populate(pud_t *pud, unsigned long addr,
 		next = pmd_addr_end(addr, end);
 
 		if (IS_ALIGNED(addr, PMD_SIZE) && end - addr >= PMD_SIZE) {
-			pmd_populate_kernel(&init_mm, pmd,
-					lm_alias(kasan_early_shadow_pte));
+			pmd_populate_kernel_at(&init_mm, pmd,
+					lm_alias(kasan_early_shadow_pte),
+					addr);
 			continue;
 		}
 
@@ -131,7 +132,7 @@ static int __ref zero_pmd_populate(pud_t *pud, unsigned long addr,
 			if (!p)
 				return -ENOMEM;
 
-			pmd_populate_kernel(&init_mm, pmd, p);
+			pmd_populate_kernel_at(&init_mm, pmd, p, addr);
 		}
 		zero_pte_populate(pmd, addr, next);
 	} while (pmd++, addr = next, addr != end);
@@ -157,8 +158,9 @@ static int __ref zero_pud_populate(p4d_t *p4d, unsigned long addr,
 			pud_populate(&init_mm, pud,
 					lm_alias(kasan_early_shadow_pmd));
 			pmd = pmd_offset(pud, addr);
-			pmd_populate_kernel(&init_mm, pmd,
-					lm_alias(kasan_early_shadow_pte));
+			pmd_populate_kernel_at(&init_mm, pmd,
+					lm_alias(kasan_early_shadow_pte),
+					addr);
 			continue;
 		}
 
@@ -203,8 +205,9 @@ static int __ref zero_p4d_populate(pgd_t *pgd, unsigned long addr,
 			pud_populate(&init_mm, pud,
 					lm_alias(kasan_early_shadow_pmd));
 			pmd = pmd_offset(pud, addr);
-			pmd_populate_kernel(&init_mm, pmd,
-					lm_alias(kasan_early_shadow_pte));
+			pmd_populate_kernel_at(&init_mm, pmd,
+					lm_alias(kasan_early_shadow_pte),
+					addr);
 			continue;
 		}
 
@@ -266,8 +269,9 @@ int __ref kasan_populate_early_shadow(const void *shadow_start,
 			pud_populate(&init_mm, pud,
 					lm_alias(kasan_early_shadow_pmd));
 			pmd = pmd_offset(pud, addr);
-			pmd_populate_kernel(&init_mm, pmd,
-					lm_alias(kasan_early_shadow_pte));
+			pmd_populate_kernel_at(&init_mm, pmd,
+					lm_alias(kasan_early_shadow_pte),
+					addr);
 			continue;
 		}
 
diff --git a/mm/memory.c b/mm/memory.c
index 15f8b10ea17c..15702822d904 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -447,7 +447,7 @@ int __pte_alloc(struct mm_struct *mm, pmd_t *pmd)
 	return 0;
 }
 
-int __pte_alloc_kernel(pmd_t *pmd)
+int __pte_alloc_kernel(pmd_t *pmd, unsigned long address)
 {
 	pte_t *new = pte_alloc_one_kernel(&init_mm);
 	if (!new)
@@ -456,7 +456,7 @@ int __pte_alloc_kernel(pmd_t *pmd)
 	spin_lock(&init_mm.page_table_lock);
 	if (likely(pmd_none(*pmd))) {	/* Has another populated it ? */
 		smp_wmb(); /* See comment in pmd_install() */
-		pmd_populate_kernel(&init_mm, pmd, new);
+		pmd_populate_kernel_at(&init_mm, pmd, new, address);
 		new = NULL;
 	}
 	spin_unlock(&init_mm.page_table_lock);
diff --git a/mm/percpu.c b/mm/percpu.c
index 4e11fc1e6def..7312e584c1b5 100644
--- a/mm/percpu.c
+++ b/mm/percpu.c
@@ -3238,7 +3238,7 @@ void __init __weak pcpu_populate_pte(unsigned long addr)
 		new = memblock_alloc(PTE_TABLE_SIZE, PTE_TABLE_SIZE);
 		if (!new)
 			goto err_alloc;
-		pmd_populate_kernel(&init_mm, pmd, new);
+		pmd_populate_kernel_at(&init_mm, pmd, new, addr);
 	}
 
 	return;
diff --git a/mm/pgalloc-track.h b/mm/pgalloc-track.h
index e9e879de8649..0984681c03d4 100644
--- a/mm/pgalloc-track.h
+++ b/mm/pgalloc-track.h
@@ -45,7 +45,8 @@ static inline pmd_t *pmd_alloc_track(struct mm_struct *mm, pud_t *pud,
 
 #define pte_alloc_kernel_track(pmd, address, mask)			\
 	((unlikely(pmd_none(*(pmd))) &&					\
-	  (__pte_alloc_kernel(pmd) || ({*(mask)|=PGTBL_PMD_MODIFIED;0;})))?\
+	  (__pte_alloc_kernel(pmd, address) ||				\
+		({*(mask) |= PGTBL_PMD_MODIFIED; 0; }))) ?		\
 		NULL: pte_offset_kernel(pmd, address))
 
 #endif /* _LINUX_PGALLOC_TRACK_H */
diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index a2cbe44c48e1..d876cc4dc700 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -191,7 +191,7 @@ pmd_t * __meminit vmemmap_pmd_populate(pud_t *pud, unsigned long addr, int node)
 		void *p = vmemmap_alloc_block_zero(PAGE_SIZE, node);
 		if (!p)
 			return NULL;
-		pmd_populate_kernel(&init_mm, pmd, p);
+		pmd_populate_kernel_at(&init_mm, pmd, p, addr);
 	}
 	return pmd;
 }
-- 
2.39.2

