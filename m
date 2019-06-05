Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3444435BFC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2019 13:48:20 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Jn9Y5fLJzDqWt
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2019 21:48:17 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Jn8L5JD3zDqZm
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jun 2019 21:47:14 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x55Bl8Bf026245
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 5 Jun 2019 07:47:11 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2sxb01w4nb-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Jun 2019 07:47:09 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <hegdevasant@linux.vnet.ibm.com>;
 Wed, 5 Jun 2019 12:47:01 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 5 Jun 2019 12:46:59 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x55BkwbN41680898
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 5 Jun 2019 11:46:58 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 927B95204F;
 Wed,  5 Jun 2019 11:46:58 +0000 (GMT)
Received: from hegdevasant.in.ibm.com (unknown [9.85.91.251])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 4EAC152050;
 Wed,  5 Jun 2019 11:46:57 +0000 (GMT)
From: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 1/2] powerpc/powernv: Enhance opal message read interface
Date: Wed,  5 Jun 2019 17:16:49 +0530
X-Mailer: git-send-email 2.14.3
X-TM-AS-GCONF: 00
x-cbid: 19060511-0016-0000-0000-000002850D93
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19060511-0017-0000-0000-000032E2223F
Message-Id: <20190605114650.19163-1-hegdevasant@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-05_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
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
Cc: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>, jk@ozlabs.org,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use "opal-msg-size" device tree property to allocate memory for "opal_msg".

Cc: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>
Cc: Jeremy Kerr <jk@ozlabs.org>
Signed-off-by: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
---
 arch/powerpc/platforms/powernv/opal.c | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/opal.c b/arch/powerpc/platforms/powernv/opal.c
index 98c5d94b17fb..e6ea32f3b3c8 100644
--- a/arch/powerpc/platforms/powernv/opal.c
+++ b/arch/powerpc/platforms/powernv/opal.c
@@ -58,6 +58,8 @@ static DEFINE_SPINLOCK(opal_write_lock);
 static struct atomic_notifier_head opal_msg_notifier_head[OPAL_MSG_TYPE_MAX];
 static uint32_t opal_heartbeat;
 static struct task_struct *kopald_tsk;
+static struct opal_msg *opal_msg;
+static uint64_t opal_msg_size;
 
 void opal_configure_cores(void)
 {
@@ -264,14 +266,9 @@ static void opal_message_do_notify(uint32_t msg_type, void *msg)
 static void opal_handle_message(void)
 {
 	s64 ret;
-	/*
-	 * TODO: pre-allocate a message buffer depending on opal-msg-size
-	 * value in /proc/device-tree.
-	 */
-	static struct opal_msg msg;
 	u32 type;
 
-	ret = opal_get_msg(__pa(&msg), sizeof(msg));
+	ret = opal_get_msg(__pa(opal_msg), opal_msg_size);
 	/* No opal message pending. */
 	if (ret == OPAL_RESOURCE)
 		return;
@@ -283,14 +280,14 @@ static void opal_handle_message(void)
 		return;
 	}
 
-	type = be32_to_cpu(msg.msg_type);
+	type = be32_to_cpu(opal_msg->msg_type);
 
 	/* Sanity check */
 	if (type >= OPAL_MSG_TYPE_MAX) {
 		pr_warn_once("%s: Unknown message type: %u\n", __func__, type);
 		return;
 	}
-	opal_message_do_notify(type, (void *)&msg);
+	opal_message_do_notify(type, (void *)opal_msg);
 }
 
 static irqreturn_t opal_message_notify(int irq, void *data)
@@ -299,9 +296,22 @@ static irqreturn_t opal_message_notify(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static int __init opal_message_init(void)
+static int __init opal_message_init(struct device_node *opal_node)
 {
 	int ret, i, irq;
+	const __be32 *val;
+
+	val = of_get_property(opal_node, "opal-msg-size", NULL);
+	if (val)
+		opal_msg_size = be32_to_cpup(val);
+
+	/* If opal-msg-size property is not available then use default size */
+	if (!opal_msg_size)
+		opal_msg_size = sizeof(struct opal_msg);
+
+	opal_msg = kmalloc(opal_msg_size, GFP_KERNEL);
+	if (!opal_msg)
+		return -ENOMEM;
 
 	for (i = 0; i < OPAL_MSG_TYPE_MAX; i++)
 		ATOMIC_INIT_NOTIFIER_HEAD(&opal_msg_notifier_head[i]);
@@ -903,7 +913,7 @@ static int __init opal_init(void)
 	}
 
 	/* Initialise OPAL messaging system */
-	opal_message_init();
+	opal_message_init(opal_node);
 
 	/* Initialise OPAL asynchronous completion interface */
 	opal_async_comp_init();
-- 
2.14.3

