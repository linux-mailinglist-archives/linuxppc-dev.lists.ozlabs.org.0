Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E51119DA78
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 17:45:38 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48v45V0NtpzDrgC
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Apr 2020 02:45:33 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48v3xm1cVfzDrD0
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Apr 2020 02:38:51 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 033FX9QX042514
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 3 Apr 2020 11:38:49 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 304r51stjg-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Apr 2020 11:38:49 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <fbarrat@linux.ibm.com>;
 Fri, 3 Apr 2020 16:38:27 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 3 Apr 2020 16:38:24 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 033FceRc62717966
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 3 Apr 2020 15:38:40 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 700E1A405F;
 Fri,  3 Apr 2020 15:38:40 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 23C69A4054;
 Fri,  3 Apr 2020 15:38:40 +0000 (GMT)
Received: from pic2.home (unknown [9.145.26.57])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  3 Apr 2020 15:38:40 +0000 (GMT)
From: Frederic Barrat <fbarrat@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, clg@kaod.org, christophe_lombard@fr.ibm.com,
 ajd@linux.ibm.com, ukrishn@linux.ibm.com, mrochs@linux.ibm.com
Subject: [PATCH v2 3/4] ocxl: Don't return trigger page when allocating an
 interrupt
Date: Fri,  3 Apr 2020 17:38:37 +0200
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200403153838.29224-1-fbarrat@linux.ibm.com>
References: <20200403153838.29224-1-fbarrat@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20040315-0020-0000-0000-000003C0F3BC
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20040315-0021-0000-0000-00002219A4AE
Message-Id: <20200403153838.29224-4-fbarrat@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-03_11:2020-04-03,
 2020-04-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 suspectscore=2 mlxscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004030133
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

Existing users of ocxl_link_irq_alloc() have been converted to obtain
the trigger page of an interrupt through xive directly, we therefore
have no need to return the trigger page when allocating an interrupt.

It also allows ocxl to use the xive native interface to allocate
interrupts, instead of its custom service.

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
---
 drivers/misc/ocxl/Kconfig       |  2 +-
 drivers/misc/ocxl/afu_irq.c     |  4 +---
 drivers/misc/ocxl/link.c        | 15 +++++++--------
 drivers/scsi/cxlflash/ocxl_hw.c |  3 +--
 include/misc/ocxl.h             | 10 ++--------
 5 files changed, 12 insertions(+), 22 deletions(-)

diff --git a/drivers/misc/ocxl/Kconfig b/drivers/misc/ocxl/Kconfig
index 2d2266c1439e..e65773f5cf59 100644
--- a/drivers/misc/ocxl/Kconfig
+++ b/drivers/misc/ocxl/Kconfig
@@ -9,7 +9,7 @@ config OCXL_BASE
 
 config OCXL
 	tristate "OpenCAPI coherent accelerator support"
-	depends on PPC_POWERNV && PCI && EEH
+	depends on PPC_POWERNV && PCI && EEH && PPC_XIVE_NATIVE
 	select OCXL_BASE
 	select HOTPLUG_PCI_POWERNV
 	default m
diff --git a/drivers/misc/ocxl/afu_irq.c b/drivers/misc/ocxl/afu_irq.c
index b30ec0ef7be7..ecdcfae025b7 100644
--- a/drivers/misc/ocxl/afu_irq.c
+++ b/drivers/misc/ocxl/afu_irq.c
@@ -11,7 +11,6 @@ struct afu_irq {
 	int hw_irq;
 	unsigned int virq;
 	char *name;
-	u64 trigger_page;
 	irqreturn_t (*handler)(void *private);
 	void (*free_private)(void *private);
 	void *private;
@@ -125,8 +124,7 @@ int ocxl_afu_irq_alloc(struct ocxl_context *ctx, int *irq_id)
 		goto err_unlock;
 	}
 
-	rc = ocxl_link_irq_alloc(ctx->afu->fn->link, &irq->hw_irq,
-				&irq->trigger_page);
+	rc = ocxl_link_irq_alloc(ctx->afu->fn->link, &irq->hw_irq);
 	if (rc)
 		goto err_idr;
 
diff --git a/drivers/misc/ocxl/link.c b/drivers/misc/ocxl/link.c
index 58d111afd9f6..fd73d3bc0eb6 100644
--- a/drivers/misc/ocxl/link.c
+++ b/drivers/misc/ocxl/link.c
@@ -6,6 +6,7 @@
 #include <linux/mmu_context.h>
 #include <asm/copro.h>
 #include <asm/pnv-ocxl.h>
+#include <asm/xive.h>
 #include <misc/ocxl.h>
 #include "ocxl_internal.h"
 #include "trace.h"
@@ -682,23 +683,21 @@ int ocxl_link_remove_pe(void *link_handle, int pasid)
 }
 EXPORT_SYMBOL_GPL(ocxl_link_remove_pe);
 
-int ocxl_link_irq_alloc(void *link_handle, int *hw_irq, u64 *trigger_addr)
+int ocxl_link_irq_alloc(void *link_handle, int *hw_irq)
 {
 	struct ocxl_link *link = (struct ocxl_link *) link_handle;
-	int rc, irq;
-	u64 addr;
+	int irq;
 
 	if (atomic_dec_if_positive(&link->irq_available) < 0)
 		return -ENOSPC;
 
-	rc = pnv_ocxl_alloc_xive_irq(&irq, &addr);
-	if (rc) {
+	irq = xive_native_alloc_irq();
+	if (!irq) {
 		atomic_inc(&link->irq_available);
-		return rc;
+		return -ENXIO;
 	}
 
 	*hw_irq = irq;
-	*trigger_addr = addr;
 	return 0;
 }
 EXPORT_SYMBOL_GPL(ocxl_link_irq_alloc);
@@ -707,7 +706,7 @@ void ocxl_link_free_irq(void *link_handle, int hw_irq)
 {
 	struct ocxl_link *link = (struct ocxl_link *) link_handle;
 
-	pnv_ocxl_free_xive_irq(hw_irq);
+	xive_native_free_irq(hw_irq);
 	atomic_inc(&link->irq_available);
 }
 EXPORT_SYMBOL_GPL(ocxl_link_free_irq);
diff --git a/drivers/scsi/cxlflash/ocxl_hw.c b/drivers/scsi/cxlflash/ocxl_hw.c
index d6eec434a607..e4e0d767b98e 100644
--- a/drivers/scsi/cxlflash/ocxl_hw.c
+++ b/drivers/scsi/cxlflash/ocxl_hw.c
@@ -614,7 +614,6 @@ static int alloc_afu_irqs(struct ocxlflash_context *ctx, int num)
 	struct ocxl_hw_afu *afu = ctx->hw_afu;
 	struct device *dev = afu->dev;
 	struct ocxlflash_irqs *irqs;
-	u64 addr;
 	int rc = 0;
 	int hwirq;
 	int i;
@@ -639,7 +638,7 @@ static int alloc_afu_irqs(struct ocxlflash_context *ctx, int num)
 	}
 
 	for (i = 0; i < num; i++) {
-		rc = ocxl_link_irq_alloc(afu->link_token, &hwirq, &addr);
+		rc = ocxl_link_irq_alloc(afu->link_token, &hwirq);
 		if (unlikely(rc)) {
 			dev_err(dev, "%s: ocxl_link_irq_alloc failed rc=%d\n",
 				__func__, rc);
diff --git a/include/misc/ocxl.h b/include/misc/ocxl.h
index 06dd5839e438..a2868adec22f 100644
--- a/include/misc/ocxl.h
+++ b/include/misc/ocxl.h
@@ -480,14 +480,8 @@ int ocxl_link_remove_pe(void *link_handle, int pasid);
  * Allocate an AFU interrupt associated to the link.
  *
  * 'hw_irq' is the hardware interrupt number
- * 'obj_handle' is the 64-bit object handle to be passed to the AFU to
- * trigger the interrupt.
- * On P9, 'obj_handle' is an address, which, if written, triggers the
- * interrupt. It is an MMIO address which needs to be remapped (one
- * page).
- */
-int ocxl_link_irq_alloc(void *link_handle, int *hw_irq,
-			u64 *obj_handle);
+ */
+int ocxl_link_irq_alloc(void *link_handle, int *hw_irq);
 
 /*
  * Free a previously allocated AFU interrupt
-- 
2.25.1

