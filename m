Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2468225AA85
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 13:48:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BhMfC6FhfzDqkx
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 21:48:51 +1000 (AEST)
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
 header.s=pp1 header.b=axvOKxi6; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BhMWD3hBWzDqnV
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Sep 2020 21:42:48 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 082BWAoq035404; Wed, 2 Sep 2020 07:42:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=LVwTeyKe/+eadJkxhdcPDPb/XZX3HzejRljrDbr75SI=;
 b=axvOKxi6yC4hQD+HszDRSjPxzhBDCbkjbYNNDY09EqRLXmzZtiVZyskb/JY1eNzrttky
 pgX5XHr5r43+e1hqsPklwXSFWycQLEmyA4M6nc8j4YFyzm0QLp4T4QJsUOgmh1N83YhK
 mtoqDS95q/ptk3LjnJLnByEjPzvXPcyLfBqRwb1QpZkijjTXfc8gC9sRY0zviINz0FgZ
 Y0u97vIZAN/d5Le+epmThHZM97u+RvMvtsZ2x0f5gXqjx+VsGLDjub0ekRg7NRPo+PZM
 zCwYKYAyDTZjXSJBlPbTm9rvKV6gvgTXHijMkp8MngjvopS36xbV+ga7PG5aIde47wCr 0A== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33a7pa5udu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Sep 2020 07:42:37 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 082BbRZH031106;
 Wed, 2 Sep 2020 11:42:36 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma02wdc.us.ibm.com with ESMTP id 337en9qcs0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Sep 2020 11:42:36 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 082BgaU852036004
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Sep 2020 11:42:36 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4236DB2064;
 Wed,  2 Sep 2020 11:42:36 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2244FB205F;
 Wed,  2 Sep 2020 11:42:34 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.61.124])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  2 Sep 2020 11:42:33 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org
Subject: [PATCH v4 01/13] powerpc/mm: Add DEBUG_VM WARN for pmd_clear
Date: Wed,  2 Sep 2020 17:12:10 +0530
Message-Id: <20200902114222.181353-2-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200902114222.181353-1-aneesh.kumar@linux.ibm.com>
References: <20200902114222.181353-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-02_03:2020-09-02,
 2020-09-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 mlxscore=0 clxscore=1015 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009020105
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
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With the hash page table, the kernel should not use pmd_clear for clearing
huge pte entries. Add a DEBUG_VM WARN to catch the wrong usage.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/book3s/64/pgtable.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index 6de56c3b33c4..079211968987 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -868,6 +868,13 @@ static inline bool pte_ci(pte_t pte)
 
 static inline void pmd_clear(pmd_t *pmdp)
 {
+	if (IS_ENABLED(CONFIG_DEBUG_VM) && !radix_enabled()) {
+		/*
+		 * Don't use this if we can possibly have a hash page table
+		 * entry mapping this.
+		 */
+		WARN_ON((pmd_val(*pmdp) & (H_PAGE_HASHPTE | _PAGE_PTE)) == (H_PAGE_HASHPTE | _PAGE_PTE));
+	}
 	*pmdp = __pmd(0);
 }
 
@@ -916,6 +923,13 @@ static inline int pmd_bad(pmd_t pmd)
 
 static inline void pud_clear(pud_t *pudp)
 {
+	if (IS_ENABLED(CONFIG_DEBUG_VM) && !radix_enabled()) {
+		/*
+		 * Don't use this if we can possibly have a hash page table
+		 * entry mapping this.
+		 */
+		WARN_ON((pud_val(*pudp) & (H_PAGE_HASHPTE | _PAGE_PTE)) == (H_PAGE_HASHPTE | _PAGE_PTE));
+	}
 	*pudp = __pud(0);
 }
 
-- 
2.26.2

