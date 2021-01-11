Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8937D2F2312
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jan 2021 00:23:15 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DF8rw4lKpzDqrF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jan 2021 10:23:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=r3PmpfOu; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DF8ch3pKtzDqbr
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jan 2021 10:12:35 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10BNBrbs017938; Mon, 11 Jan 2021 18:12:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=tW30Dz7n8q+6qhgZvSJ2mdmZP94XSZx4NCukQuMrLos=;
 b=r3PmpfOuffHCHW/Mya3jDFb5U8ZFAMwJJCyaCIJrOVxbJwxc2K7lF29qxHZ3iyQT3AYm
 FQl3qahFR4K/wA54X0LDGKPQL0n+ZaIrIDm+85IIC3E2/hHnKrkZmwbP5BeB+juYaghR
 wFk44a9tF/zZiEdqFFHQsxAjCEYeYGV0sKjsUNqzmwDRK0PA+zDiAvprtv631iJyIPKy
 mompwZeYbWflFX9hTGq+i3z1PMSWvrbxdj0kt/ytoQVvFuNbgJvQ34SaZKKREzqsOaHf
 rk1Bnrw6JswYrAghRFbGKwpbZxV0ECfHOpam+kvnhQdN+SF4dbqE+KiZqf5h82N3HZp2 Ew== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36104wg083-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Jan 2021 18:12:31 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10BN8Who022027;
 Mon, 11 Jan 2021 23:12:30 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma04dal.us.ibm.com with ESMTP id 35y448xfh4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Jan 2021 23:12:30 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10BNCSUM28180986
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Jan 2021 23:12:28 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BDE4578064;
 Mon, 11 Jan 2021 23:12:28 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5C56678063;
 Mon, 11 Jan 2021 23:12:28 +0000 (GMT)
Received: from vios4361.aus.stglabs.ibm.com (unknown [9.3.43.61])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 11 Jan 2021 23:12:28 +0000 (GMT)
From: Tyrel Datwyler <tyreld@linux.ibm.com>
To: james.bottomley@hansenpartnership.com
Subject: [PATCH v4 02/21] ibmvfc: move event pool init/free routines
Date: Mon, 11 Jan 2021 17:12:06 -0600
Message-Id: <20210111231225.105347-3-tyreld@linux.ibm.com>
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
 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 impostorscore=0 adultscore=0 phishscore=0
 bulkscore=0 suspectscore=0 mlxlogscore=947 clxscore=1015 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101110126
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

The next patch in this series reworks the event pool allocation calls to
happen within the individual queue allocation routines instead of as
independent calls.

Move the init/free routines earlier in ibmvfc.c to prevent undefined
reference errors when calling these functions from the queue allocation
code. No functional change.

Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
---
 drivers/scsi/ibmvscsi/ibmvfc.c | 151 +++++++++++++++++----------------
 1 file changed, 76 insertions(+), 75 deletions(-)

diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
index 9200fe49c57e..cd9273a5fadb 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.c
+++ b/drivers/scsi/ibmvscsi/ibmvfc.c
@@ -716,6 +716,82 @@ static int ibmvfc_send_crq_init_complete(struct ibmvfc_host *vhost)
 	return ibmvfc_send_crq(vhost, 0xC002000000000000LL, 0);
 }
 
+/**
+ * ibmvfc_init_event_pool - Allocates and initializes the event pool for a host
+ * @vhost:	ibmvfc host who owns the event pool
+ *
+ * Returns zero on success.
+ **/
+static int ibmvfc_init_event_pool(struct ibmvfc_host *vhost,
+				  struct ibmvfc_queue *queue)
+{
+	int i;
+	struct ibmvfc_event_pool *pool = &queue->evt_pool;
+
+	ENTER;
+	pool->size = max_requests + IBMVFC_NUM_INTERNAL_REQ;
+	pool->events = kcalloc(pool->size, sizeof(*pool->events), GFP_KERNEL);
+	if (!pool->events)
+		return -ENOMEM;
+
+	pool->iu_storage = dma_alloc_coherent(vhost->dev,
+					      pool->size * sizeof(*pool->iu_storage),
+					      &pool->iu_token, 0);
+
+	if (!pool->iu_storage) {
+		kfree(pool->events);
+		return -ENOMEM;
+	}
+
+	INIT_LIST_HEAD(&queue->sent);
+	INIT_LIST_HEAD(&queue->free);
+	spin_lock_init(&queue->l_lock);
+
+	for (i = 0; i < pool->size; ++i) {
+		struct ibmvfc_event *evt = &pool->events[i];
+
+		atomic_set(&evt->free, 1);
+		evt->crq.valid = 0x80;
+		evt->crq.ioba = cpu_to_be64(pool->iu_token + (sizeof(*evt->xfer_iu) * i));
+		evt->xfer_iu = pool->iu_storage + i;
+		evt->vhost = vhost;
+		evt->queue = queue;
+		evt->ext_list = NULL;
+		list_add_tail(&evt->queue_list, &queue->free);
+	}
+
+	LEAVE;
+	return 0;
+}
+
+/**
+ * ibmvfc_free_event_pool - Frees memory of the event pool of a host
+ * @vhost:	ibmvfc host who owns the event pool
+ *
+ **/
+static void ibmvfc_free_event_pool(struct ibmvfc_host *vhost,
+				   struct ibmvfc_queue *queue)
+{
+	int i;
+	struct ibmvfc_event_pool *pool = &queue->evt_pool;
+
+	ENTER;
+	for (i = 0; i < pool->size; ++i) {
+		list_del(&pool->events[i].queue_list);
+		BUG_ON(atomic_read(&pool->events[i].free) != 1);
+		if (pool->events[i].ext_list)
+			dma_pool_free(vhost->sg_pool,
+				      pool->events[i].ext_list,
+				      pool->events[i].ext_list_token);
+	}
+
+	kfree(pool->events);
+	dma_free_coherent(vhost->dev,
+			  pool->size * sizeof(*pool->iu_storage),
+			  pool->iu_storage, pool->iu_token);
+	LEAVE;
+}
+
 /**
  * ibmvfc_free_queue - Deallocate queue
  * @vhost:	ibmvfc host struct
@@ -1312,81 +1388,6 @@ static void ibmvfc_set_login_info(struct ibmvfc_host *vhost)
 	strncpy(login_info->drc_name, location, IBMVFC_MAX_NAME);
 }
 
-/**
- * ibmvfc_init_event_pool - Allocates and initializes the event pool for a host
- * @vhost:	ibmvfc host who owns the event pool
- *
- * Returns zero on success.
- **/
-static int ibmvfc_init_event_pool(struct ibmvfc_host *vhost,
-				  struct ibmvfc_queue *queue)
-{
-	int i;
-	struct ibmvfc_event_pool *pool = &queue->evt_pool;
-
-	ENTER;
-	pool->size = max_requests + IBMVFC_NUM_INTERNAL_REQ;
-	pool->events = kcalloc(pool->size, sizeof(*pool->events), GFP_KERNEL);
-	if (!pool->events)
-		return -ENOMEM;
-
-	pool->iu_storage = dma_alloc_coherent(vhost->dev,
-					      pool->size * sizeof(*pool->iu_storage),
-					      &pool->iu_token, 0);
-
-	if (!pool->iu_storage) {
-		kfree(pool->events);
-		return -ENOMEM;
-	}
-
-	INIT_LIST_HEAD(&queue->sent);
-	INIT_LIST_HEAD(&queue->free);
-	spin_lock_init(&queue->l_lock);
-
-	for (i = 0; i < pool->size; ++i) {
-		struct ibmvfc_event *evt = &pool->events[i];
-		atomic_set(&evt->free, 1);
-		evt->crq.valid = 0x80;
-		evt->crq.ioba = cpu_to_be64(pool->iu_token + (sizeof(*evt->xfer_iu) * i));
-		evt->xfer_iu = pool->iu_storage + i;
-		evt->vhost = vhost;
-		evt->queue = queue;
-		evt->ext_list = NULL;
-		list_add_tail(&evt->queue_list, &queue->free);
-	}
-
-	LEAVE;
-	return 0;
-}
-
-/**
- * ibmvfc_free_event_pool - Frees memory of the event pool of a host
- * @vhost:	ibmvfc host who owns the event pool
- *
- **/
-static void ibmvfc_free_event_pool(struct ibmvfc_host *vhost,
-				   struct ibmvfc_queue *queue)
-{
-	int i;
-	struct ibmvfc_event_pool *pool = &queue->evt_pool;
-
-	ENTER;
-	for (i = 0; i < pool->size; ++i) {
-		list_del(&pool->events[i].queue_list);
-		BUG_ON(atomic_read(&pool->events[i].free) != 1);
-		if (pool->events[i].ext_list)
-			dma_pool_free(vhost->sg_pool,
-				      pool->events[i].ext_list,
-				      pool->events[i].ext_list_token);
-	}
-
-	kfree(pool->events);
-	dma_free_coherent(vhost->dev,
-			  pool->size * sizeof(*pool->iu_storage),
-			  pool->iu_storage, pool->iu_token);
-	LEAVE;
-}
-
 /**
  * ibmvfc_get_event - Gets the next free event in pool
  * @vhost:	ibmvfc host struct
-- 
2.27.0

