Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD21C3EA5B3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 15:30:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlncK4cRtz3dHx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 23:30:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CchMcTc6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=CchMcTc6; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlnZm0XsTz308y
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Aug 2021 23:28:47 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17CD4FuF020546; Thu, 12 Aug 2021 09:28:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=qjh0/GC0xinYmUZflbPZFiawIVt52otWigb8X20RJVA=;
 b=CchMcTc6G3doEIUTc1YB6rNaqgZFhXTtGsTXP9vnhH0C08hTzQTZm+NmGOWd7ysB+HRF
 zHzvDKBqy33vVnXIcx+6uI48rQU6ikCfONm/rG+OKKH64ByJxTHdjwvuJW/ok5HEHtyc
 nbjpFUYA4unRty6/qu0C4q4Y0vQvMSQYm8oxBfERbpKHYi4wqom/ee3VnsCnCsvAOBQ3
 jysSNuG+FTlPzA6tsjjSoWOhtPEGIXLs9509CB41sSBlSpWKuQrc20FqRbKCfVE59Hoi
 AYjVntc/tNZSRAVBmkyJf8rZ7bFDJVLVxEsL0o1X0WbjsLN5ScH531CRt9FejFpAS/JM QQ== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3achs76d68-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Aug 2021 09:28:40 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17CDCu9J003148;
 Thu, 12 Aug 2021 13:28:40 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma03dal.us.ibm.com with ESMTP id 3a9htfu019-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Aug 2021 13:28:39 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17CDSbKc53739998
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Aug 2021 13:28:37 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8B1396A047;
 Thu, 12 Aug 2021 13:28:37 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 361CE6A04D;
 Thu, 12 Aug 2021 13:28:36 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.50.186])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 12 Aug 2021 13:28:35 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v2 1/2] powerpc/book3s64/radix: make
 tlb_single_page_flush_ceiling a debugfs entry
Date: Thu, 12 Aug 2021 18:58:30 +0530
Message-Id: <20210812132831.233794-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: GuTS0JvXorvuNFgGU2YdWAuL5rId9XkM
X-Proofpoint-ORIG-GUID: GuTS0JvXorvuNFgGU2YdWAuL5rId9XkM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-12_04:2021-08-12,
 2021-08-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 bulkscore=0 impostorscore=0 mlxlogscore=999 suspectscore=0
 malwarescore=0 spamscore=0 mlxscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108120085
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Similar to x86/s390 add a debugfs file to tune tlb_single_page_flush_ceiling.
Also add a debugfs entry for tlb_local_single_page_flush_ceiling.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
Changes from v1:
* switch to debugfs_create_u32

 arch/powerpc/mm/book3s64/radix_tlb.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
index aefc100d79a7..1fa2bc6a969e 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -17,6 +17,7 @@
 #include <asm/trace.h>
 #include <asm/cputhreads.h>
 #include <asm/plpar_wrappers.h>
+#include <asm/debugfs.h>
 
 #include "internal.h"
 
@@ -1106,8 +1107,8 @@ EXPORT_SYMBOL(radix__flush_tlb_kernel_range);
  * invalidating a full PID, so it has a far lower threshold to change from
  * individual page flushes to full-pid flushes.
  */
-static unsigned long tlb_single_page_flush_ceiling __read_mostly = 33;
-static unsigned long tlb_local_single_page_flush_ceiling __read_mostly = POWER9_TLB_SETS_RADIX * 2;
+static u32 tlb_single_page_flush_ceiling __read_mostly = 33;
+static u32 tlb_local_single_page_flush_ceiling __read_mostly = POWER9_TLB_SETS_RADIX * 2;
 
 static inline void __radix__flush_tlb_range(struct mm_struct *mm,
 					    unsigned long start, unsigned long end)
@@ -1524,3 +1525,14 @@ void do_h_rpt_invalidate_prt(unsigned long pid, unsigned long lpid,
 EXPORT_SYMBOL_GPL(do_h_rpt_invalidate_prt);
 
 #endif /* CONFIG_KVM_BOOK3S_HV_POSSIBLE */
+
+static int __init create_tlb_single_page_flush_ceiling(void)
+{
+	debugfs_create_u32("tlb_single_page_flush_ceiling", 0600,
+			   powerpc_debugfs_root, &tlb_single_page_flush_ceiling);
+	debugfs_create_u32("tlb_local_single_page_flush_ceiling", 0600,
+			   powerpc_debugfs_root, &tlb_local_single_page_flush_ceiling);
+	return 0;
+}
+late_initcall(create_tlb_single_page_flush_ceiling);
+
-- 
2.31.1

