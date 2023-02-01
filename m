Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA52686F85
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 21:04:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P6Xtd501zz3fJg
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Feb 2023 07:04:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IQYlCJIU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=brking@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IQYlCJIU;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P6Xlb0Wqlz3cfZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Feb 2023 06:58:02 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 311Jqw7T004038;
	Wed, 1 Feb 2023 19:58:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=11jsw3bf4Kklb9Hv1uoFRsiJRYOXiYZundBhyj4+MSg=;
 b=IQYlCJIUDefXVAdawpD5cEdpdGxzekXuzq7KntzOaTvC/kGEcbRRwN4AYKzAXZhQ8+Br
 N4/ijcCMyQ6yvWwqaU0PZD8jzQQAs6Vc5lwK4Ekwwls3lJo2gL9o2NBQIxoDnGx+ciU3
 Pm0dI2dKa+Yj2xZtlclCZs174aD09MDQ/96nJ4KBxhmzboj2KiXO4ylGKYddZVr8b+83
 fWY/4d1Xr16j1tObaB1jHVvXXDEknk7fvaOh6H2Vcb38ruyvP0wgtuMxNxuOoKvrvOzF
 wUeRXpKXKq8Gf8tu637vBCnaF3SW0+Jr+Tc3rHMud7kkWnqQ6X1DIk02fi1qXyoMjYVT 3g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nfxmng325-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Feb 2023 19:57:59 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 311JrVLw005595;
	Wed, 1 Feb 2023 19:57:59 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nfxmng31x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Feb 2023 19:57:59 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
	by ppma04dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 311ISKek008456;
	Wed, 1 Feb 2023 19:57:58 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([9.208.129.116])
	by ppma04dal.us.ibm.com (PPS) with ESMTPS id 3ncvw2wdde-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Feb 2023 19:57:58 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 311JvvCW41484558
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 Feb 2023 19:57:57 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 091845805D;
	Wed,  1 Feb 2023 19:57:57 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8138058057;
	Wed,  1 Feb 2023 19:57:56 +0000 (GMT)
Received: from li-6bf4d4cc-31f5-11b2-a85c-838e9310af65.ibm.com.com (unknown [9.211.132.88])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  1 Feb 2023 19:57:56 +0000 (GMT)
From: Brian King <brking@linux.vnet.ibm.com>
To: gregkh@linuxfoundation.org
Subject: [PATCH 6/6] hvcs: Synchronize hotplug remove with port free
Date: Wed,  1 Feb 2023 13:57:43 -0600
Message-Id: <20230201195743.303163-7-brking@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230201195743.303163-1-brking@linux.vnet.ibm.com>
References: <20230201195743.303163-1-brking@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 3PMwp-rfG3qQ8P2nR3fiQXRJ_WoSc-5w
X-Proofpoint-ORIG-GUID: 0sF9fk-RbrAnzrWH8YijpV8pW_V514kE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-01_04,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999
 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302010166
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
index 24541fc53625..2b038d4b3a63 100644
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
@@ -658,11 +660,13 @@ static void hvcs_destruct_port(struct tty_port *p)
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
 
@@ -682,6 +686,7 @@ static void hvcs_destruct_port(struct tty_port *p)
 
 	hvcsd->p_unit_address = 0;
 	hvcsd->p_partition_ID = 0;
+	hvcsd->destroyed = NULL;
 	hvcs_return_index(hvcsd->index);
 	memset(&hvcsd->p_location_code[0], 0x00, HVCS_CLC_LENGTH + 1);
 
@@ -689,6 +694,8 @@ static void hvcs_destruct_port(struct tty_port *p)
 	spin_unlock(&hvcs_structs_lock);
 
 	kfree(hvcsd);
+	if (comp)
+		complete(comp);
 }
 
 static const struct tty_port_operations hvcs_port_ops = {
@@ -795,6 +802,7 @@ static int hvcs_probe(
 static void hvcs_remove(struct vio_dev *dev)
 {
 	struct hvcs_struct *hvcsd = dev_get_drvdata(&dev->dev);
+	DECLARE_COMPLETION_ONSTACK(comp);
 	unsigned long flags;
 	struct tty_struct *tty;
 
@@ -802,16 +810,11 @@ static void hvcs_remove(struct vio_dev *dev)
 
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
 	sysfs_remove_group(&dev->dev.kobj, &hvcs_attr_group);
 
 	/*
@@ -823,6 +826,8 @@ static void hvcs_remove(struct vio_dev *dev)
 		tty_kref_put(tty);
 	}
 
+	tty_port_put(&hvcsd->port);
+	wait_for_completion(&comp);
 	printk(KERN_INFO "HVCS: vty-server@%X removed from the"
 			" vio bus.\n", dev->unit_address);
 };
@@ -1172,7 +1177,10 @@ static void hvcs_close(struct tty_struct *tty, struct file *filp)
 	hvcsd = tty->driver_data;
 
 	spin_lock_irqsave(&hvcsd->lock, flags);
-	if (--hvcsd->port.count == 0) {
+	if (hvcsd->port.count == 0) {
+		spin_unlock_irqrestore(&hvcsd->lock, flags);
+		return;
+	} else if (--hvcsd->port.count == 0) {
 
 		vio_disable_interrupts(hvcsd->vdev);
 
@@ -1228,11 +1236,7 @@ static void hvcs_hangup(struct tty_struct * tty)
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

