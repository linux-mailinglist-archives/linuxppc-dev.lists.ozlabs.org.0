Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C11918441C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Mar 2020 10:51:36 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48f1Dj3lKGzDqLn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Mar 2020 20:51:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48f19l359DzDqRK
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Mar 2020 20:48:59 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02D9acZB141852; Fri, 13 Mar 2020 05:48:53 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2yr0c06wgx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Mar 2020 05:48:53 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 02D9affR142121;
 Fri, 13 Mar 2020 05:48:53 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2yr0c06wgk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Mar 2020 05:48:53 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 02D9k7qi029318;
 Fri, 13 Mar 2020 09:48:52 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma03wdc.us.ibm.com with ESMTP id 2yqt6pw9fp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Mar 2020 09:48:52 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02D9mqRN53608944
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 13 Mar 2020 09:48:52 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 348CDB2064;
 Fri, 13 Mar 2020 09:48:52 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 804FCB205F;
 Fri, 13 Mar 2020 09:48:50 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.85.91.235])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 13 Mar 2020 09:48:50 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH] powerpc/book3s/hash64/devmap: Use H_PAGE_THP_HUGE when
 setting up huge devmap pte entries
Date: Fri, 13 Mar 2020 15:18:42 +0530
Message-Id: <20200313094842.351830-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-13_04:2020-03-11,
 2020-03-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 spamscore=0
 bulkscore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003130050
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, oohall@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

H_PAGE_THP_HUGE is used to differentiate between a THP hugepage and hugetlb
hugepage entries. The difference is w.r.t how we handle hash fault on these
address. THP address enables MPSS in segments. We want to manage devmap hugepage
entries similar to THP pt entries. Hence use H_PAGE_THP_HUGE for devmap huge pte
entries.

With current code while handling hash pte fault, we do set is_thp = true when
finding devmap pte huge pte entries.

Current code also does the below sequence we setting up huge devmap entries.
	entry = pmd_mkhuge(pfn_t_pmd(pfn, prot));
	if (pfn_t_devmap(pfn))
		entry = pmd_mkdevmap(entry);

In that case we would find both H_PAGE_THP_HUGE and PAGE_DEVMAP set for huge
devmap pte entries. This results in false positive error like below.

 kernel BUG at /home/kvaneesh/src/linux/mm/memory.c:4321!
 Oops: Exception in kernel mode, sig: 5 [#1]
 LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
 Modules linked in:
 CPU: 56 PID: 67996 Comm: t_mmap_dio Not tainted 5.6.0-rc4-59640-g371c804dedbc #128
 ....
 NIP [c00000000044c9e4] __follow_pte_pmd+0x264/0x900
 LR [c0000000005d45f8] dax_writeback_one+0x1a8/0x740
 Call Trace:
 [c000000c6e9f38c0] [c0000000013f4130] str_spec.74809+0x22ffb4/0x2d116c (unreliable)
 [c000000c6e9f3960] [c0000000005d45f8] dax_writeback_one+0x1a8/0x740
 [c000000c6e9f3a40] [c0000000005d4dfc] dax_writeback_mapping_range+0x26c/0x700
 [c000000c6e9f3b30] [c000000000666580] ext4_dax_writepages+0x150/0x5a0
 [c000000c6e9f3ba0] [c0000000003fe278] do_writepages+0x68/0x180
 [c000000c6e9f3c10] [c0000000003ecc58] __filemap_fdatawrite_range+0x138/0x180
 [c000000c6e9f3cc0] [c0000000003ede74] file_write_and_wait_range+0xa4/0x110
 [c000000c6e9f3d10] [c0000000006552d0] ext4_sync_file+0x370/0x6e0
 [c000000c6e9f3d70] [c00000000057d330] vfs_fsync_range+0x70/0xf0
 [c000000c6e9f3db0] [c00000000046a000] sys_msync+0x220/0x2e0
 [c000000c6e9f3e20] [c00000000000b478] system_call+0x5c/0x68
 Instruction dump:
 7a941564 392affff 7fbffc36 7a94f082 7d2907b4 78f4f00e 7fff4838 7bff1f24
 7e54f82a 7e74fa14 724900a0 40820410 <0b080000> 72490040 418201c8 2fb7000

This is because our pmd_trans_huge check doesn't exclude _PAGE_DEVMAP.

To make this all consistent, update pmd_mkdevmap to set H_PAGE_THP_HUGE and
pmd_trans_huge check now excludes _PAGE_DEVMAP correctly.

Fixes: ebd31197931d ("powerpc/mm: Add devmap support for ppc64")
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/book3s/64/hash-4k.h  | 6 ++++++
 arch/powerpc/include/asm/book3s/64/hash-64k.h | 8 +++++++-
 arch/powerpc/include/asm/book3s/64/pgtable.h  | 4 +++-
 arch/powerpc/include/asm/book3s/64/radix.h    | 5 +++++
 4 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/hash-4k.h b/arch/powerpc/include/asm/book3s/64/hash-4k.h
index 8fd8599c9395..3f9ae3585ab9 100644
--- a/arch/powerpc/include/asm/book3s/64/hash-4k.h
+++ b/arch/powerpc/include/asm/book3s/64/hash-4k.h
@@ -156,6 +156,12 @@ extern pmd_t hash__pmdp_huge_get_and_clear(struct mm_struct *mm,
 extern int hash__has_transparent_hugepage(void);
 #endif
 
+static inline pmd_t hash__pmd_mkdevmap(pmd_t pmd)
+{
+	BUG();
+	return pmd;
+}
+
 #endif /* !__ASSEMBLY__ */
 
 #endif /* _ASM_POWERPC_BOOK3S_64_HASH_4K_H */
diff --git a/arch/powerpc/include/asm/book3s/64/hash-64k.h b/arch/powerpc/include/asm/book3s/64/hash-64k.h
index d1d9177d9ebd..0729c034e56f 100644
--- a/arch/powerpc/include/asm/book3s/64/hash-64k.h
+++ b/arch/powerpc/include/asm/book3s/64/hash-64k.h
@@ -246,7 +246,7 @@ static inline void mark_hpte_slot_valid(unsigned char *hpte_slot_array,
  */
 static inline int hash__pmd_trans_huge(pmd_t pmd)
 {
-	return !!((pmd_val(pmd) & (_PAGE_PTE | H_PAGE_THP_HUGE)) ==
+	return !!((pmd_val(pmd) & (_PAGE_PTE | H_PAGE_THP_HUGE | _PAGE_DEVMAP)) ==
 		  (_PAGE_PTE | H_PAGE_THP_HUGE));
 }
 
@@ -272,6 +272,12 @@ extern pmd_t hash__pmdp_huge_get_and_clear(struct mm_struct *mm,
 				       unsigned long addr, pmd_t *pmdp);
 extern int hash__has_transparent_hugepage(void);
 #endif /*  CONFIG_TRANSPARENT_HUGEPAGE */
+
+static inline pmd_t hash__pmd_mkdevmap(pmd_t pmd)
+{
+	return __pmd(pmd_val(pmd) | (_PAGE_PTE | H_PAGE_THP_HUGE | _PAGE_DEVMAP));
+}
+
 #endif	/* __ASSEMBLY__ */
 
 #endif /* _ASM_POWERPC_BOOK3S_64_HASH_64K_H */
diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index 201a69e6a355..368b136517e0 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -1303,7 +1303,9 @@ extern void serialize_against_pte_lookup(struct mm_struct *mm);
 
 static inline pmd_t pmd_mkdevmap(pmd_t pmd)
 {
-	return __pmd(pmd_val(pmd) | (_PAGE_PTE | _PAGE_DEVMAP));
+	if (radix_enabled())
+		return radix__pmd_mkdevmap(pmd);
+	return hash__pmd_mkdevmap(pmd);
 }
 
 static inline int pmd_devmap(pmd_t pmd)
diff --git a/arch/powerpc/include/asm/book3s/64/radix.h b/arch/powerpc/include/asm/book3s/64/radix.h
index d97db3ad9aae..a1c60d5b50af 100644
--- a/arch/powerpc/include/asm/book3s/64/radix.h
+++ b/arch/powerpc/include/asm/book3s/64/radix.h
@@ -263,6 +263,11 @@ static inline int radix__has_transparent_hugepage(void)
 }
 #endif
 
+static inline pmd_t radix__pmd_mkdevmap(pmd_t pmd)
+{
+	return __pmd(pmd_val(pmd) | (_PAGE_PTE | _PAGE_DEVMAP));
+}
+
 extern int __meminit radix__vmemmap_create_mapping(unsigned long start,
 					     unsigned long page_size,
 					     unsigned long phys);
-- 
2.24.1

