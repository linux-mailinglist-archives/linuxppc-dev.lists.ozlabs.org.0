Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED59E02FC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Oct 2019 13:35:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46yBJF2jQ6zDqJl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Oct 2019 22:35:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hegdevasant@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46yBFQ1JTvzDqGP
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Oct 2019 22:32:41 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9MBRi8K019299
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Oct 2019 07:32:38 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2vsy8m44n3-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Oct 2019 07:32:38 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <hegdevasant@linux.vnet.ibm.com>;
 Tue, 22 Oct 2019 12:32:36 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 22 Oct 2019 12:32:33 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9MBWW5R48496732
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Oct 2019 11:32:32 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 753BAAE04D;
 Tue, 22 Oct 2019 11:32:32 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7C537AE051;
 Tue, 22 Oct 2019 11:32:31 +0000 (GMT)
Received: from hegdevasant.in.ibm.com (unknown [9.193.108.153])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 22 Oct 2019 11:32:31 +0000 (GMT)
From: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/powernv/prd: Allow copying partial data to user space
Date: Tue, 22 Oct 2019 17:02:13 +0530
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19102211-0012-0000-0000-0000035B7473
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19102211-0013-0000-0000-000021969F1E
Message-Id: <20191022113213.18295-1-hegdevasant@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-22_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=867 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910220105
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
Cc: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 Jeremy Kerr <jk@ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Allow copying partial data to user space. So that opal-prd daemon
can read message size, reallocate memory and make read call to
get rest of the data.

Cc: Jeremy Kerr <jk@ozlabs.org>
Cc: Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>
Signed-off-by: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
---
 arch/powerpc/platforms/powernv/opal-prd.c | 27 ++++++++---------------
 1 file changed, 9 insertions(+), 18 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/opal-prd.c b/arch/powerpc/platforms/powernv/opal-prd.c
index 45f4223a790f..dac9d18293d8 100644
--- a/arch/powerpc/platforms/powernv/opal-prd.c
+++ b/arch/powerpc/platforms/powernv/opal-prd.c
@@ -153,20 +153,15 @@ static __poll_t opal_prd_poll(struct file *file,
 static ssize_t opal_prd_read(struct file *file, char __user *buf,
 		size_t count, loff_t *ppos)
 {
-	struct opal_prd_msg_queue_item *item;
+	struct opal_prd_msg_queue_item *item = NULL;
 	unsigned long flags;
-	ssize_t size, err;
+	ssize_t size;
 	int rc;
 
 	/* we need at least a header's worth of data */
 	if (count < sizeof(item->msg))
 		return -EINVAL;
 
-	if (*ppos)
-		return -ESPIPE;
-
-	item = NULL;
-
 	for (;;) {
 
 		spin_lock_irqsave(&opal_prd_msg_queue_lock, flags);
@@ -190,27 +185,23 @@ static ssize_t opal_prd_read(struct file *file, char __user *buf,
 	}
 
 	size = be16_to_cpu(item->msg.size);
-	if (size > count) {
-		err = -EINVAL;
+	rc = simple_read_from_buffer(buf, count, ppos, &item->msg, size);
+	if (rc < 0)
 		goto err_requeue;
-	}
-
-	rc = copy_to_user(buf, &item->msg, size);
-	if (rc) {
-		err = -EFAULT;
+	if (*ppos < size)
 		goto err_requeue;
-	}
 
+	/* Reset position */
+	*ppos = 0;
 	kfree(item);
-
-	return size;
+	return rc;
 
 err_requeue:
 	/* eep! re-queue at the head of the list */
 	spin_lock_irqsave(&opal_prd_msg_queue_lock, flags);
 	list_add(&item->list, &opal_prd_msg_queue);
 	spin_unlock_irqrestore(&opal_prd_msg_queue_lock, flags);
-	return err;
+	return rc;
 }
 
 static ssize_t opal_prd_write(struct file *file, const char __user *buf,
-- 
2.21.0

