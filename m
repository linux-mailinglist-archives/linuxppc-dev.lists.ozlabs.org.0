Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5F035C08
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2019 13:49:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45JnBw1kCdzDqjn
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2019 21:49:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=hegdevasant@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Jn8L5WfJzDqZx
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jun 2019 21:47:14 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x55BlBOD061408
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 5 Jun 2019 07:47:12 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2sxat6631m-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Jun 2019 07:47:11 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <hegdevasant@linux.vnet.ibm.com>;
 Wed, 5 Jun 2019 12:47:03 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 5 Jun 2019 12:47:01 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x55Bl0GV51052778
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 5 Jun 2019 11:47:00 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7780052057;
 Wed,  5 Jun 2019 11:47:00 +0000 (GMT)
Received: from hegdevasant.in.ibm.com (unknown [9.85.91.251])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id DCB305204F;
 Wed,  5 Jun 2019 11:46:58 +0000 (GMT)
From: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/2] powerpc/powernv: Add new opal message type
Date: Wed,  5 Jun 2019 17:16:50 +0530
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20190605114650.19163-1-hegdevasant@linux.vnet.ibm.com>
References: <20190605114650.19163-1-hegdevasant@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 19060511-0008-0000-0000-000002EF3F16
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19060511-0009-0000-0000-0000225C26DC
Message-Id: <20190605114650.19163-2-hegdevasant@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-05_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906050075
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
Cc: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>, jk@ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We have OPAL_MSG_PRD message type to pass prd related messages from OPAL
to `opal-prd`. It can handle messages upto 64 bytes. We have a requirement
to send bigger than 64 bytes of data from OPAL to `opal-prd`. Lets add new
message type (OPAL_MSG_PRD2) to pass bigger data.

Cc: Jeremy Kerr <jk@ozlabs.org>
Signed-off-by: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/opal-api.h       | 1 +
 arch/powerpc/platforms/powernv/opal-prd.c | 9 ++++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/opal-api.h b/arch/powerpc/include/asm/opal-api.h
index 09a8553833d1..428b5ef7db7b 100644
--- a/arch/powerpc/include/asm/opal-api.h
+++ b/arch/powerpc/include/asm/opal-api.h
@@ -453,6 +453,7 @@ enum opal_msg_type {
 	OPAL_MSG_DPO		= 5,
 	OPAL_MSG_PRD		= 6,
 	OPAL_MSG_OCC		= 7,
+	OPAL_MSG_PRD2		= 8,
 	OPAL_MSG_TYPE_MAX,
 };
 
diff --git a/arch/powerpc/platforms/powernv/opal-prd.c b/arch/powerpc/platforms/powernv/opal-prd.c
index e072bf157d62..50a735d77192 100644
--- a/arch/powerpc/platforms/powernv/opal-prd.c
+++ b/arch/powerpc/platforms/powernv/opal-prd.c
@@ -342,7 +342,7 @@ static int opal_prd_msg_notifier(struct notifier_block *nb,
 	int msg_size, item_size;
 	unsigned long flags;
 
-	if (msg_type != OPAL_MSG_PRD)
+	if (msg_type != OPAL_MSG_PRD && msg_type != OPAL_MSG_PRD2)
 		return 0;
 
 	/* Calculate total size of the message and item we need to store. The
@@ -393,6 +393,13 @@ static int opal_prd_probe(struct platform_device *pdev)
 		return rc;
 	}
 
+	rc = opal_message_notifier_register(OPAL_MSG_PRD2, &opal_prd_event_nb);
+	if (rc) {
+		pr_err("%s: Couldn't register event notifier (%d)\n",
+		       __func__, OPAL_MSG_PRD2);
+		return rc;
+	}
+
 	rc = misc_register(&opal_prd_dev);
 	if (rc) {
 		pr_err("failed to register miscdev\n");
-- 
2.14.3

