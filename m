Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF935BD41
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2019 15:48:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45cpbs2J0gzDqXQ
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2019 23:48:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45cpRc2H2gzDqDB
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Jul 2019 23:40:59 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x61Db0kZ140919
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 1 Jul 2019 09:40:55 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2tfhwd5dfg-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Jul 2019 09:40:54 -0400
Received: from localhost
 by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <aneesh.kumar@linux.ibm.com>;
 Mon, 1 Jul 2019 14:40:53 +0100
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
 by e13.ny.us.ibm.com (146.89.104.200) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 1 Jul 2019 14:40:49 +0100
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x61DemPZ30540184
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 1 Jul 2019 13:40:48 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D6EBCAC060;
 Mon,  1 Jul 2019 13:40:48 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 84695AC059;
 Mon,  1 Jul 2019 13:40:46 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.85.81.231])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  1 Jul 2019 13:40:46 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: dan.j.williams@intel.com, akpm@linux-foundation.org
Subject: [PATCH] mm/nvdimm: Add is_ioremap_addr and use that to check ioremap
 address
Date: Mon,  1 Jul 2019 19:10:38 +0530
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19070113-0064-0000-0000-000003F5BBF2
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011359; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01225913; UDB=6.00645348; IPR=6.01007125; 
 MB=3.00027534; MTD=3.00000008; XFM=3.00000015; UTC=2019-07-01 13:40:51
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19070113-0065-0000-0000-00003E195962
Message-Id: <20190701134038.14165-1-aneesh.kumar@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-01_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=933 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907010168
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-nvdimm@lists.01.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Architectures like powerpc use different address range to map ioremap
and vmalloc range. The memunmap() check used by the nvdimm layer was
wrongly using is_vmalloc_addr() to check for ioremap range which fails for
ppc64. This result in ppc64 not freeing the ioremap mapping. The side effect
of this is an unbind failure during module unload with papr_scm nvdimm driver

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/pgtable.h | 14 ++++++++++++++
 include/linux/mm.h                 |  5 +++++
 kernel/iomem.c                     |  2 +-
 3 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
index 3f53be60fb01..64145751b2fd 100644
--- a/arch/powerpc/include/asm/pgtable.h
+++ b/arch/powerpc/include/asm/pgtable.h
@@ -140,6 +140,20 @@ static inline void pte_frag_set(mm_context_t *ctx, void *p)
 }
 #endif
 
+#ifdef CONFIG_PPC64
+#define is_ioremap_addr is_ioremap_addr
+static inline bool is_ioremap_addr(const void *x)
+{
+#ifdef CONFIG_MMU
+	unsigned long addr = (unsigned long)x;
+
+	return addr >= IOREMAP_BASE && addr < IOREMAP_END;
+#else
+	return false;
+#endif
+}
+#endif /* CONFIG_PPC64 */
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* _ASM_POWERPC_PGTABLE_H */
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 973ebf71f7b6..65b2eb6c9f0a 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -633,6 +633,11 @@ static inline bool is_vmalloc_addr(const void *x)
 	return false;
 #endif
 }
+
+#ifndef is_ioremap_addr
+#define is_ioremap_addr(x) is_vmalloc_addr(x)
+#endif
+
 #ifdef CONFIG_MMU
 extern int is_vmalloc_or_module_addr(const void *x);
 #else
diff --git a/kernel/iomem.c b/kernel/iomem.c
index 93c264444510..62c92e43aa0d 100644
--- a/kernel/iomem.c
+++ b/kernel/iomem.c
@@ -121,7 +121,7 @@ EXPORT_SYMBOL(memremap);
 
 void memunmap(void *addr)
 {
-	if (is_vmalloc_addr(addr))
+	if (is_ioremap_addr(addr))
 		iounmap((void __iomem *) addr);
 }
 EXPORT_SYMBOL(memunmap);
-- 
2.21.0

