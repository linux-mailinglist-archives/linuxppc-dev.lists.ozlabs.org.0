Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2222D19C67E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 17:53:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tSK453WVzDrVV
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 02:53:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tS6F3N8ZzDrJF
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 02:44:05 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 032F43Uf040694
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 2 Apr 2020 11:44:02 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 304g87k7gm-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Apr 2020 11:44:02 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <fbarrat@linux.ibm.com>;
 Thu, 2 Apr 2020 16:43:52 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 2 Apr 2020 16:43:48 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 032FgnW135520942
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 Apr 2020 15:42:49 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6D9F8A4051;
 Thu,  2 Apr 2020 15:43:53 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 16D48A4040;
 Thu,  2 Apr 2020 15:43:53 +0000 (GMT)
Received: from pic2.home (unknown [9.145.68.77])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  2 Apr 2020 15:43:53 +0000 (GMT)
From: Frederic Barrat <fbarrat@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, clg@kaod.org, christophe_lombard@fr.ibm.com,
 ajd@linux.ibm.com, ukrishn@linux.ibm.com, mrochs@linux.ibm.com
Subject: [PATCH 2/4] ocxl: Access interrupt trigger page from xive directly
Date: Thu,  2 Apr 2020 17:43:50 +0200
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200402154352.586166-1-fbarrat@linux.ibm.com>
References: <20200402154352.586166-1-fbarrat@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20040215-0012-0000-0000-0000039CFBE4
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20040215-0013-0000-0000-000021DA1060
Message-Id: <20200402154352.586166-3-fbarrat@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-02_05:2020-04-02,
 2020-04-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 mlxlogscore=909 bulkscore=0 suspectscore=2 adultscore=0 mlxscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004020131
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

We can access the trigger page through standard APIs so let's use it
and avoid saving it when allocating the interrupt. It will also allow
to simplify allocation in a later patch.

Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
---
 drivers/misc/ocxl/afu_irq.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/ocxl/afu_irq.c b/drivers/misc/ocxl/afu_irq.c
index 70f8f1c3929d..b30ec0ef7be7 100644
--- a/drivers/misc/ocxl/afu_irq.c
+++ b/drivers/misc/ocxl/afu_irq.c
@@ -2,6 +2,7 @@
 // Copyright 2017 IBM Corp.
 #include <linux/interrupt.h>
 #include <asm/pnv-ocxl.h>
+#include <asm/xive.h>
 #include "ocxl_internal.h"
 #include "trace.h"
 
@@ -196,13 +197,16 @@ void ocxl_afu_irq_free_all(struct ocxl_context *ctx)
 
 u64 ocxl_afu_irq_get_addr(struct ocxl_context *ctx, int irq_id)
 {
+	struct xive_irq_data *xd;
 	struct afu_irq *irq;
 	u64 addr = 0;
 
 	mutex_lock(&ctx->irq_lock);
 	irq = idr_find(&ctx->irq_idr, irq_id);
-	if (irq)
-		addr = irq->trigger_page;
+	if (irq) {
+		xd = irq_get_handler_data(irq->virq);
+		addr = xd ? xd->trig_page : 0;
+	}
 	mutex_unlock(&ctx->irq_lock);
 	return addr;
 }
-- 
2.25.1

