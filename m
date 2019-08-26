Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A8B9C9C1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2019 09:01:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46H2wN3KjkzDqcP
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2019 17:01:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=hegdevasant@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46H2rB3n74zDqTn
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2019 16:57:30 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7Q6qAQY142534
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2019 02:57:26 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2um8bcc512-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2019 02:57:26 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <hegdevasant@linux.vnet.ibm.com>;
 Mon, 26 Aug 2019 07:57:23 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 26 Aug 2019 07:57:20 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7Q6vJgj58523728
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 26 Aug 2019 06:57:19 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1C9E4A4055;
 Mon, 26 Aug 2019 06:57:19 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D2CA7A404D;
 Mon, 26 Aug 2019 06:57:17 +0000 (GMT)
Received: from hegdevasant.in.ibm.com (unknown [9.204.201.122])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 26 Aug 2019 06:57:17 +0000 (GMT)
From: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 1/2] powerpc/powernv: Enhance opal message read interface
Date: Mon, 26 Aug 2019 12:27:00 +0530
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19082606-0008-0000-0000-0000030D5AB8
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19082606-0009-0000-0000-00004A2B91B0
Message-Id: <20190826065701.8853-1-hegdevasant@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-26_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908260076
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
Cc: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>, oohall@gmail.com,
 Jeremy Kerr <jk@ozlabs.org>, Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use "opal-msg-size" device tree property to allocate memory for "opal_msg".

Cc: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>
Cc: Jeremy Kerr <jk@ozlabs.org>
Signed-off-by: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
---
 arch/powerpc/platforms/powernv/opal.c | 32 ++++++++++++++++++---------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/opal.c b/arch/powerpc/platforms/powernv/opal.c
index aba443be7daa..afa494849477 100644
--- a/arch/powerpc/platforms/powernv/opal.c
+++ b/arch/powerpc/platforms/powernv/opal.c
@@ -58,6 +58,8 @@ static DEFINE_SPINLOCK(opal_write_lock);
 static struct atomic_notifier_head opal_msg_notifier_head[OPAL_MSG_TYPE_MAX];
 static uint32_t opal_heartbeat;
 static struct task_struct *kopald_tsk;
+static struct opal_msg *opal_msg;
+static uint32_t opal_msg_size;
 
 void opal_configure_cores(void)
 {
@@ -271,14 +273,9 @@ static void opal_message_do_notify(uint32_t msg_type, void *msg)
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
@@ -290,14 +287,14 @@ static void opal_handle_message(void)
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
@@ -306,10 +303,25 @@ static irqreturn_t opal_message_notify(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static int __init opal_message_init(void)
+static int __init opal_message_init(struct device_node *opal_node)
 {
 	int ret, i, irq;
 
+	ret = of_property_read_u32(opal_node, "opal-msg-size", &opal_msg_size);
+	if (ret) {
+		pr_notice("%s: Failed to read opal-msg-size property\n",
+			  __func__);
+		opal_msg_size = sizeof(struct opal_msg);
+	}
+
+	opal_msg = kmalloc(opal_msg_size, GFP_KERNEL);
+	if (!opal_msg) {
+		opal_msg_size = sizeof(struct opal_msg);
+		/* Try to allocate fixed message size */
+		opal_msg = kmalloc(opal_msg_size, GFP_KERNEL);
+		BUG_ON(opal_msg == NULL);
+	}
+
 	for (i = 0; i < OPAL_MSG_TYPE_MAX; i++)
 		ATOMIC_INIT_NOTIFIER_HEAD(&opal_msg_notifier_head[i]);
 
@@ -910,7 +922,7 @@ static int __init opal_init(void)
 	}
 
 	/* Initialise OPAL messaging system */
-	opal_message_init();
+	opal_message_init(opal_node);
 
 	/* Initialise OPAL asynchronous completion interface */
 	opal_async_comp_init();
-- 
2.21.0

