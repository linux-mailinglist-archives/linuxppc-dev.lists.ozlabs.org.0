Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 776972F230F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jan 2021 00:18:18 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DF8l85WLDzDqBg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jan 2021 10:18:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ITWcoSx8; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DF8ch2R0gzDqbW
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jan 2021 10:12:35 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10BN1fbS094000; Mon, 11 Jan 2021 18:12:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=QjcsI1qOMV2f2DMfiZGn6+ursQYzl5WtmahCDPBRtb4=;
 b=ITWcoSx898ZkAWnxWO6P7zT1k+EtL7IkFsWwLup68su8Vmg/vQX3goLU1b3zEJ7kzwyt
 453ylCBVBIo4hQpXeZi5lSk+D+sDJuM27JXRufso+aK9f890T1qRa20QKPHPlpO1dt4u
 E1DWtDIrOyAErgPVkPiDyCDaEID5vrqh+fRKfxt4QenDpLm3r/7tza92vkhzl5ROxBuk
 f4iRjl0HFosg8GonEKZNdERYqz418ZHAKMsfnXJcHIVuJduREA6wC2opcQBVn2cObbbx
 0JwxLZ/YmNg0BUWk0BOGq7VMewKFUYdl4rN760S4iDfa8gag3voL5aibRNPZpWJzQzMq RQ== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 360yexs1by-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Jan 2021 18:12:32 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10BN8UwZ022002;
 Mon, 11 Jan 2021 23:12:31 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma04dal.us.ibm.com with ESMTP id 35y448xfh9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Jan 2021 23:12:31 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10BNCT9328508434
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Jan 2021 23:12:29 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B4DD878063;
 Mon, 11 Jan 2021 23:12:29 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 527727805F;
 Mon, 11 Jan 2021 23:12:29 +0000 (GMT)
Received: from vios4361.aus.stglabs.ibm.com (unknown [9.3.43.61])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 11 Jan 2021 23:12:29 +0000 (GMT)
From: Tyrel Datwyler <tyreld@linux.ibm.com>
To: james.bottomley@hansenpartnership.com
Subject: [PATCH v4 04/21] ibmvfc: add size parameter to ibmvfc_init_event_pool
Date: Mon, 11 Jan 2021 17:12:08 -0600
Message-Id: <20210111231225.105347-5-tyreld@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210111231225.105347-1-tyreld@linux.ibm.com>
References: <20210111231225.105347-1-tyreld@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-11_32:2021-01-11,
 2021-01-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 priorityscore=1501
 mlxscore=0 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2101110126
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, martin.petersen@oracle.com,
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, brking@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With the upcoming addition of Sub-CRQs the event pool size may vary
per-queue.

Add a size parameter to ibmvfc_init_event_pool such that different size
event pools can be requested by ibmvfc_alloc_queue.

Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
---
 drivers/scsi/ibmvscsi/ibmvfc.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
index 9330f5a65a7e..524e81164d70 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.c
+++ b/drivers/scsi/ibmvscsi/ibmvfc.c
@@ -723,19 +723,23 @@ static int ibmvfc_send_crq_init_complete(struct ibmvfc_host *vhost)
  * Returns zero on success.
  **/
 static int ibmvfc_init_event_pool(struct ibmvfc_host *vhost,
-				  struct ibmvfc_queue *queue)
+				  struct ibmvfc_queue *queue,
+				  unsigned int size)
 {
 	int i;
 	struct ibmvfc_event_pool *pool = &queue->evt_pool;
 
 	ENTER;
-	pool->size = max_requests + IBMVFC_NUM_INTERNAL_REQ;
-	pool->events = kcalloc(pool->size, sizeof(*pool->events), GFP_KERNEL);
+	if (!size)
+		return 0;
+
+	pool->size = size;
+	pool->events = kcalloc(size, sizeof(*pool->events), GFP_KERNEL);
 	if (!pool->events)
 		return -ENOMEM;
 
 	pool->iu_storage = dma_alloc_coherent(vhost->dev,
-					      pool->size * sizeof(*pool->iu_storage),
+					      size * sizeof(*pool->iu_storage),
 					      &pool->iu_token, 0);
 
 	if (!pool->iu_storage) {
@@ -747,7 +751,7 @@ static int ibmvfc_init_event_pool(struct ibmvfc_host *vhost,
 	INIT_LIST_HEAD(&queue->free);
 	spin_lock_init(&queue->l_lock);
 
-	for (i = 0; i < pool->size; ++i) {
+	for (i = 0; i < size; ++i) {
 		struct ibmvfc_event *evt = &pool->events[i];
 
 		atomic_set(&evt->free, 1);
@@ -5013,6 +5017,7 @@ static int ibmvfc_alloc_queue(struct ibmvfc_host *vhost,
 {
 	struct device *dev = vhost->dev;
 	size_t fmt_size;
+	unsigned int pool_size = 0;
 
 	ENTER;
 	spin_lock_init(&queue->_lock);
@@ -5021,10 +5026,7 @@ static int ibmvfc_alloc_queue(struct ibmvfc_host *vhost,
 	switch (fmt) {
 	case IBMVFC_CRQ_FMT:
 		fmt_size = sizeof(*queue->msgs.crq);
-		if (ibmvfc_init_event_pool(vhost, queue)) {
-			dev_err(dev, "Couldn't initialize event pool.\n");
-			return -ENOMEM;
-		}
+		pool_size = max_requests + IBMVFC_NUM_INTERNAL_REQ;
 		break;
 	case IBMVFC_ASYNC_FMT:
 		fmt_size = sizeof(*queue->msgs.async);
@@ -5034,6 +5036,11 @@ static int ibmvfc_alloc_queue(struct ibmvfc_host *vhost,
 		return -EINVAL;
 	}
 
+	if (ibmvfc_init_event_pool(vhost, queue, pool_size)) {
+		dev_err(dev, "Couldn't initialize event pool.\n");
+		return -ENOMEM;
+	}
+
 	queue->msgs.handle = (void *)get_zeroed_page(GFP_KERNEL);
 	if (!queue->msgs.handle)
 		return -ENOMEM;
-- 
2.27.0

