Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D600119C68A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 17:55:33 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tSMQ6pM7zDqqW
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 02:55:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tS6H5yHtzDrJj
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 02:44:07 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 032FWfsO160062
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 2 Apr 2020 11:44:05 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 304mccg7c9-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Apr 2020 11:44:03 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <fbarrat@linux.ibm.com>;
 Thu, 2 Apr 2020 16:43:58 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 2 Apr 2020 16:43:54 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 032FgnkK35520940
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 Apr 2020 15:42:49 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 09DB1A404D;
 Thu,  2 Apr 2020 15:43:53 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ACCFBA4040;
 Thu,  2 Apr 2020 15:43:52 +0000 (GMT)
Received: from pic2.home (unknown [9.145.68.77])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  2 Apr 2020 15:43:52 +0000 (GMT)
From: Frederic Barrat <fbarrat@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, clg@kaod.org, christophe_lombard@fr.ibm.com,
 ajd@linux.ibm.com, ukrishn@linux.ibm.com, mrochs@linux.ibm.com
Subject: [PATCH 1/4] scsi: cxlflash: Access interrupt trigger page from xive
 directly
Date: Thu,  2 Apr 2020 17:43:49 +0200
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200402154352.586166-1-fbarrat@linux.ibm.com>
References: <20200402154352.586166-1-fbarrat@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20040215-0028-0000-0000-000003F0B96D
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20040215-0029-0000-0000-000024B6444D
Message-Id: <20200402154352.586166-2-fbarrat@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-02_05:2020-04-02,
 2020-04-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=2 bulkscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0
 mlxlogscore=999 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2003020000 definitions=main-2004020131
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

xive is already mapping the trigger page in kernel space and it can be
accessed through standard APIs, so let's reuse it and simplify the code.

Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
---
 drivers/scsi/cxlflash/ocxl_hw.c | 17 +++++++----------
 drivers/scsi/cxlflash/ocxl_hw.h |  1 -
 2 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/scsi/cxlflash/ocxl_hw.c b/drivers/scsi/cxlflash/ocxl_hw.c
index 7018cd802569..59452850f71c 100644
--- a/drivers/scsi/cxlflash/ocxl_hw.c
+++ b/drivers/scsi/cxlflash/ocxl_hw.c
@@ -15,7 +15,8 @@
 #include <linux/pseudo_fs.h>
 #include <linux/poll.h>
 #include <linux/sched/signal.h>
-
+#include <linux/interrupt.h>
+#include <asm/xive.h>
 #include <misc/ocxl.h>
 
 #include <uapi/misc/cxl.h>
@@ -180,7 +181,7 @@ static int afu_map_irq(u64 flags, struct ocxlflash_context *ctx, int num,
 	struct ocxl_hw_afu *afu = ctx->hw_afu;
 	struct device *dev = afu->dev;
 	struct ocxlflash_irqs *irq;
-	void __iomem *vtrig;
+	struct xive_irq_data *xd;
 	u32 virq;
 	int rc = 0;
 
@@ -204,15 +205,14 @@ static int afu_map_irq(u64 flags, struct ocxlflash_context *ctx, int num,
 		goto err1;
 	}
 
-	vtrig = ioremap(irq->ptrig, PAGE_SIZE);
-	if (unlikely(!vtrig)) {
-		dev_err(dev, "%s: Trigger page mapping failed\n", __func__);
-		rc = -ENOMEM;
+	xd = irq_get_handler_data(virq);
+	if (unlikely(!xd)) {
+		dev_err(dev, "%s: Can't get interrupt data\n", __func__);
 		goto err2;
 	}
 
 	irq->virq = virq;
-	irq->vtrig = vtrig;
+	irq->vtrig = xd->trig_mmio;
 out:
 	return rc;
 err2:
@@ -259,8 +259,6 @@ static void afu_unmap_irq(u64 flags, struct ocxlflash_context *ctx, int num,
 	}
 
 	irq = &ctx->irqs[num];
-	if (irq->vtrig)
-		iounmap(irq->vtrig);
 
 	if (irq_find_mapping(NULL, irq->hwirq)) {
 		free_irq(irq->virq, cookie);
@@ -648,7 +646,6 @@ static int alloc_afu_irqs(struct ocxlflash_context *ctx, int num)
 		}
 
 		irqs[i].hwirq = hwirq;
-		irqs[i].ptrig = addr;
 	}
 
 	ctx->irqs = irqs;
diff --git a/drivers/scsi/cxlflash/ocxl_hw.h b/drivers/scsi/cxlflash/ocxl_hw.h
index fc6ad4f985de..f2fe88816bea 100644
--- a/drivers/scsi/cxlflash/ocxl_hw.h
+++ b/drivers/scsi/cxlflash/ocxl_hw.h
@@ -13,7 +13,6 @@
 struct ocxlflash_irqs {
 	int hwirq;
 	u32 virq;
-	u64 ptrig;
 	void __iomem *vtrig;
 };
 
-- 
2.25.1

