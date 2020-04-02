Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C1E19C65F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 17:51:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tSGQ4BjXzDr8g
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 02:51:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tS6D715BzDrGx
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 02:44:04 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 032F5m5F125315
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 2 Apr 2020 11:44:02 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 303wryk7g1-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Apr 2020 11:44:02 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <fbarrat@linux.ibm.com>;
 Thu, 2 Apr 2020 16:43:44 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 2 Apr 2020 16:43:42 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 032FhsCM62587004
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 Apr 2020 15:43:54 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 347B4A404D;
 Thu,  2 Apr 2020 15:43:54 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DBEB7A4040;
 Thu,  2 Apr 2020 15:43:53 +0000 (GMT)
Received: from pic2.home (unknown [9.145.68.77])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  2 Apr 2020 15:43:53 +0000 (GMT)
From: Frederic Barrat <fbarrat@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, clg@kaod.org, christophe_lombard@fr.ibm.com,
 ajd@linux.ibm.com, ukrishn@linux.ibm.com, mrochs@linux.ibm.com
Subject: [PATCH 4/4] ocxl: Remove custom service to allocate interrupts
Date: Thu,  2 Apr 2020 17:43:52 +0200
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200402154352.586166-1-fbarrat@linux.ibm.com>
References: <20200402154352.586166-1-fbarrat@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20040215-4275-0000-0000-000003B84BD5
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20040215-4276-0000-0000-000038CDA282
Message-Id: <20200402154352.586166-5-fbarrat@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-02_05:2020-04-02,
 2020-04-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 mlxlogscore=641 clxscore=1015 bulkscore=0 malwarescore=0 suspectscore=2
 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004020131
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
Cc: haren@linux.ibm.com, groug@kaod.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We now allocate interrupts through xive directly.

Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
---
 arch/powerpc/include/asm/pnv-ocxl.h   |  3 ---
 arch/powerpc/platforms/powernv/ocxl.c | 30 ---------------------------
 2 files changed, 33 deletions(-)

diff --git a/arch/powerpc/include/asm/pnv-ocxl.h b/arch/powerpc/include/asm/pnv-ocxl.h
index 7de82647e761..e90650328c9c 100644
--- a/arch/powerpc/include/asm/pnv-ocxl.h
+++ b/arch/powerpc/include/asm/pnv-ocxl.h
@@ -30,7 +30,4 @@ extern int pnv_ocxl_spa_setup(struct pci_dev *dev, void *spa_mem, int PE_mask,
 extern void pnv_ocxl_spa_release(void *platform_data);
 extern int pnv_ocxl_spa_remove_pe_from_cache(void *platform_data, int pe_handle);
 
-extern int pnv_ocxl_alloc_xive_irq(u32 *irq, u64 *trigger_addr);
-extern void pnv_ocxl_free_xive_irq(u32 irq);
-
 #endif /* _ASM_PNV_OCXL_H */
diff --git a/arch/powerpc/platforms/powernv/ocxl.c b/arch/powerpc/platforms/powernv/ocxl.c
index 8c65aacda9c8..ecdad219d704 100644
--- a/arch/powerpc/platforms/powernv/ocxl.c
+++ b/arch/powerpc/platforms/powernv/ocxl.c
@@ -2,7 +2,6 @@
 // Copyright 2017 IBM Corp.
 #include <asm/pnv-ocxl.h>
 #include <asm/opal.h>
-#include <asm/xive.h>
 #include <misc/ocxl-config.h>
 #include "pci.h"
 
@@ -484,32 +483,3 @@ int pnv_ocxl_spa_remove_pe_from_cache(void *platform_data, int pe_handle)
 	return rc;
 }
 EXPORT_SYMBOL_GPL(pnv_ocxl_spa_remove_pe_from_cache);
-
-int pnv_ocxl_alloc_xive_irq(u32 *irq, u64 *trigger_addr)
-{
-	__be64 flags, trigger_page;
-	s64 rc;
-	u32 hwirq;
-
-	hwirq = xive_native_alloc_irq();
-	if (!hwirq)
-		return -ENOENT;
-
-	rc = opal_xive_get_irq_info(hwirq, &flags, NULL, &trigger_page, NULL,
-				NULL);
-	if (rc || !trigger_page) {
-		xive_native_free_irq(hwirq);
-		return -ENOENT;
-	}
-	*irq = hwirq;
-	*trigger_addr = be64_to_cpu(trigger_page);
-	return 0;
-
-}
-EXPORT_SYMBOL_GPL(pnv_ocxl_alloc_xive_irq);
-
-void pnv_ocxl_free_xive_irq(u32 irq)
-{
-	xive_native_free_irq(irq);
-}
-EXPORT_SYMBOL_GPL(pnv_ocxl_free_xive_irq);
-- 
2.25.1

