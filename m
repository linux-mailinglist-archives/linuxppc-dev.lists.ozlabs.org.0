Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C736116B93
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Dec 2019 11:57:21 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47WgBQ527DzDqQQ
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Dec 2019 21:57:18 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Wg8G10GjzDqGZ
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Dec 2019 21:55:25 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB9AqPZc006956
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 9 Dec 2019 05:55:22 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wr8kw1bde-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Dec 2019 05:55:21 -0500
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <fbarrat@linux.ibm.com>;
 Mon, 9 Dec 2019 10:55:16 -0000
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 9 Dec 2019 10:55:15 -0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id xB9AtDSY40305134
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Dec 2019 10:55:13 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A95114203F;
 Mon,  9 Dec 2019 10:55:13 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 68DD24204F;
 Mon,  9 Dec 2019 10:55:13 +0000 (GMT)
Received: from pic2.home (unknown [9.145.56.110])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  9 Dec 2019 10:55:13 +0000 (GMT)
From: Frederic Barrat <fbarrat@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, andrew.donnellan@au1.ibm.com,
 alastair@au1.ibm.com
Subject: [PATCH v3] ocxl: Fix potential memory leak on context creation
Date: Mon,  9 Dec 2019 11:55:13 +0100
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19120910-0008-0000-0000-0000033F125D
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19120910-0009-0000-0000-00004A5E3E8C
Message-Id: <20191209105513.8566-1-fbarrat@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-09_02:2019-12-09,2019-12-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=714
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912090093
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
Cc: clombard@linux.ibm.com, groug@kaod.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If we couldn't fully init a context, we were leaking memory.

Fixes: b9721d275cc2 ("ocxl: Allow external drivers to use OpenCAPI contexts")
Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
---
Changlog:
v3:
	code cleanup (Greg)
v2:
	reset context pointer in case of allocation failure (Andrew)


 drivers/misc/ocxl/context.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/ocxl/context.c b/drivers/misc/ocxl/context.c
index 994563a078eb..de8a66b9d76b 100644
--- a/drivers/misc/ocxl/context.c
+++ b/drivers/misc/ocxl/context.c
@@ -10,18 +10,17 @@ int ocxl_context_alloc(struct ocxl_context **context, struct ocxl_afu *afu,
 	int pasid;
 	struct ocxl_context *ctx;
 
-	*context = kzalloc(sizeof(struct ocxl_context), GFP_KERNEL);
-	if (!*context)
+	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
 		return -ENOMEM;
 
-	ctx = *context;
-
 	ctx->afu = afu;
 	mutex_lock(&afu->contexts_lock);
 	pasid = idr_alloc(&afu->contexts_idr, ctx, afu->pasid_base,
 			afu->pasid_base + afu->pasid_max, GFP_KERNEL);
 	if (pasid < 0) {
 		mutex_unlock(&afu->contexts_lock);
+		kfree(ctx);
 		return pasid;
 	}
 	afu->pasid_count++;
@@ -43,6 +42,7 @@ int ocxl_context_alloc(struct ocxl_context **context, struct ocxl_afu *afu,
 	 * duration of the life of the context
 	 */
 	ocxl_afu_get(afu);
+	*context = ctx;
 	return 0;
 }
 EXPORT_SYMBOL_GPL(ocxl_context_alloc);
-- 
2.21.0

