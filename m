Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDEE689EC9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 17:03:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P7gRz7118z3fSN
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Feb 2023 03:03:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VB19n7ZV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=brking@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VB19n7ZV;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P7gL10Z3tz3f6B
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Feb 2023 02:58:16 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 313Efw5e019843;
	Fri, 3 Feb 2023 15:58:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=XKd9IXJu6WajZTpMeR5fNtzh3X12+AZdL0P60/EEdj4=;
 b=VB19n7ZVYzUChTGQeXtHTkuRVYmq01j4LeUjRecgtQVoP0guPZR+sMlTvtLv2U5sOEzJ
 xotxPt07urgewRLWN63XlZnjZVfvirvgughrbC2rEU2nmpdnJ0mhg3md1wN+vOpAvCXc
 pT66bRW3W1uiJI6ZermwENqMpjqkKjfc4pM4IRxu6jD02y67eKtZLDbnFZmBELL/XuCK
 Y7UwzzQn+ZAR3AuiGEDQc439kHN13o1vFnO4OYN6dvUshfFlFyz/nCPjFBTTRdu9usdD
 As+eipHZQQr7/+qjZv7cdW3UdBVf6lVQegfPKob9JdwV9MJMEgBXXghoqTQnkckp0WYx 2Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nh48r1yw3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Feb 2023 15:58:13 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 313EgF7D020825;
	Fri, 3 Feb 2023 15:58:13 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nh48r1yvt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Feb 2023 15:58:13 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
	by ppma02dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 313EHbuH019280;
	Fri, 3 Feb 2023 15:58:12 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([9.208.129.113])
	by ppma02dal.us.ibm.com (PPS) with ESMTPS id 3ncvur9tue-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Feb 2023 15:58:12 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 313FwA8E61407694
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 3 Feb 2023 15:58:11 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8E78058061;
	Fri,  3 Feb 2023 15:58:10 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1B0C55803F;
	Fri,  3 Feb 2023 15:58:10 +0000 (GMT)
Received: from li-6bf4d4cc-31f5-11b2-a85c-838e9310af65.ibm.com.com (unknown [9.211.110.209])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  3 Feb 2023 15:58:10 +0000 (GMT)
From: Brian King <brking@linux.vnet.ibm.com>
To: gregkh@linuxfoundation.org
Subject: [PATCH v3 5/5] hvcs: Synchronize hotplug remove with port free
Date: Fri,  3 Feb 2023 09:58:02 -0600
Message-Id: <20230203155802.404324-6-brking@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230203155802.404324-1-brking@linux.vnet.ibm.com>
References: <20230203155802.404324-1-brking@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: gF7gUO72P36_NPqrHn7qzjPWt1NmjNBy
X-Proofpoint-ORIG-GUID: ADZMIGab6Ex_d95DljWIHvkXDkSGUWr1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-03_15,2023-02-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 mlxlogscore=999 lowpriorityscore=0 phishscore=0 mlxscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302030142
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
Cc: Brian King <brking@linux.vnet.ibm.com>, mmc@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, linux-serial@vger.kernel.org, brking@pobox.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Synchronizes hotplug remove with the freeing of the port.
This ensures we have freed all the memory associated with
this port and are not leaking memory.

Signed-off-by: Brian King <brking@linux.vnet.ibm.com>
---
 drivers/tty/hvc/hvcs.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/tty/hvc/hvcs.c b/drivers/tty/hvc/hvcs.c
index ecf24195b1e9..1de1a09bf82d 100644
--- a/drivers/tty/hvc/hvcs.c
+++ b/drivers/tty/hvc/hvcs.c
@@ -52,6 +52,7 @@
 
 #include <linux/device.h>
 #include <linux/init.h>
+#include <linux/completion.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/kref.h>
@@ -285,6 +286,7 @@ struct hvcs_struct {
 	char p_location_code[HVCS_CLC_LENGTH + 1]; /* CLC + Null Term */
 	struct list_head next; /* list management */
 	struct vio_dev *vdev;
+	struct completion *destroyed;
 };
 
 static LIST_HEAD(hvcs_structs);
@@ -663,11 +665,13 @@ static void hvcs_destruct_port(struct tty_port *p)
 {
 	struct hvcs_struct *hvcsd = container_of(p, struct hvcs_struct, port);
 	struct vio_dev *vdev;
+	struct completion *comp;
 	unsigned long flags;
 
 	spin_lock(&hvcs_structs_lock);
 	spin_lock_irqsave(&hvcsd->lock, flags);
 
+	comp = hvcsd->destroyed;
 	/* the list_del poisons the pointers */
 	list_del(&(hvcsd->next));
 
@@ -687,6 +691,7 @@ static void hvcs_destruct_port(struct tty_port *p)
 
 	hvcsd->p_unit_address = 0;
 	hvcsd->p_partition_ID = 0;
+	hvcsd->destroyed = NULL;
 	hvcs_return_index(hvcsd->index);
 	memset(&hvcsd->p_location_code[0], 0x00, HVCS_CLC_LENGTH + 1);
 
@@ -694,6 +699,8 @@ static void hvcs_destruct_port(struct tty_port *p)
 	spin_unlock(&hvcs_structs_lock);
 
 	kfree(hvcsd);
+	if (comp)
+		complete(comp);
 }
 
 static const struct tty_port_operations hvcs_port_ops = {
@@ -792,6 +799,7 @@ static int hvcs_probe(
 static void hvcs_remove(struct vio_dev *dev)
 {
 	struct hvcs_struct *hvcsd = dev_get_drvdata(&dev->dev);
+	DECLARE_COMPLETION_ONSTACK(comp);
 	unsigned long flags;
 	struct tty_struct *tty;
 
@@ -799,16 +807,11 @@ static void hvcs_remove(struct vio_dev *dev)
 
 	spin_lock_irqsave(&hvcsd->lock, flags);
 
+	hvcsd->destroyed = &comp;
 	tty = tty_port_tty_get(&hvcsd->port);
 
 	spin_unlock_irqrestore(&hvcsd->lock, flags);
 
-	/*
-	 * Let the last holder of this object cause it to be removed, which
-	 * would probably be tty_hangup below.
-	 */
-	tty_port_put(&hvcsd->port);
-
 	/*
 	 * The tty should always be valid at this time unless a
 	 * simultaneous tty close already cleaned up the hvcs_struct.
@@ -818,6 +821,8 @@ static void hvcs_remove(struct vio_dev *dev)
 		tty_kref_put(tty);
 	}
 
+	tty_port_put(&hvcsd->port);
+	wait_for_completion(&comp);
 	printk(KERN_INFO "HVCS: vty-server@%X removed from the"
 			" vio bus.\n", dev->unit_address);
 };
@@ -1171,7 +1176,10 @@ static void hvcs_close(struct tty_struct *tty, struct file *filp)
 	hvcsd = tty->driver_data;
 
 	spin_lock_irqsave(&hvcsd->lock, flags);
-	if (--hvcsd->port.count == 0) {
+	if (hvcsd->port.count == 0) {
+		spin_unlock_irqrestore(&hvcsd->lock, flags);
+		return;
+	} else if (--hvcsd->port.count == 0) {
 
 		vio_disable_interrupts(hvcsd->vdev);
 
@@ -1227,11 +1235,7 @@ static void hvcs_hangup(struct tty_struct * tty)
 	vio_disable_interrupts(hvcsd->vdev);
 
 	hvcsd->todo_mask = 0;
-
-	/* I don't think the tty needs the hvcs_struct pointer after a hangup */
-	tty->driver_data = NULL;
 	hvcsd->port.tty = NULL;
-
 	hvcsd->port.count = 0;
 
 	/* This will drop any buffered data on the floor which is OK in a hangup
-- 
2.31.1

