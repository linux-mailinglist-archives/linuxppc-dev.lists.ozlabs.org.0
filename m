Return-Path: <linuxppc-dev+bounces-8227-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 698DAAA644E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 May 2025 21:50:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZpPm02pBTz2ydQ;
	Fri,  2 May 2025 05:50:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746129005;
	cv=none; b=nuWoHErKRcQaP45iY1anlQBDgIqFZ98r8H3G4iynfbK6v3jDrYLc+hXV7EQSsp5qgoUsXhTnEVbvcIxhesuzAbbsB4khxYdyjiWK3O8BSr6IzQS5MRn3L9VTx+8hfMDbjEtb1/35GM8MOWbAGWT3cRbWJPL7ZmWG1Fr9vVABUGrlfNObZ14ExPcPJLRQVQBLJylwrou4VJ4cogHYjIn7rJiKPWLr4oxs19ZNLkaMa2wfXUduyvP84b2Bejm8YWHvaE4WOH8Ectv/bXvFMqaOFLbEV745+bq9P1EQBYLT1tPIH70J0AsPRWofP3svb2hdMnX1KxK5QpCLnVb4FAAmdw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746129005; c=relaxed/relaxed;
	bh=L+F0vnQeRR+zrmETaWiDvYnv23zmZ8SbVLeoI8KksSE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JyNWTr48zHmL7G75JlErHJ2K9dLk6+7jnCKoLjPw8bjpV4m4Pca3yS1ofoYvoN9aBLLWye5b/Vgs/BNiTc05Jil7UvnVHIr9zr1zRn10xD8UnaxUIY4UjQWj+GpHb4+V7es9MltlV/o0aURejYLuclIjVVqSkO8vwxbK5nfmxde4ZKSetWyMC7jssGu3maiNKIfPb62qKh0ojGpDSHzH/D6LKfIEEmzh9MWt3at7MXcI181/gJ+sK3Yv5Da0VI1H28bi1clDp+ShbGcwQu0Mn/JguPl3EdsGsgraFINj2WfCFEv37sX3gxVSxqKfAR7HbG2ZCQa+X8ft0VTHduOk6g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qO/K9z73; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=davemarq@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qO/K9z73;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=davemarq@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZpPlx1WFdz2ySm
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 May 2025 05:50:04 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 541Bptpa024009;
	Thu, 1 May 2025 19:50:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=L+F0vnQeRR+zrmETa
	WiDvYnv23zmZ8SbVLeoI8KksSE=; b=qO/K9z73ak3EA5V5UZN+uJoxbziVw3obd
	+dwgMPKViJjt80oDdt7ovyv0xhWhzz8aLHamgZRP0Rc33wRLT0/O5fQcFxnNhHJd
	wZIUvSSWP6b8iG+Xaj5Q15t15AuHMv4rCrnc7el8ypyW8SaKZDu1C9YpILCyP/Ey
	HVyckNGiwwgHiXbq3IoNBghl5B6amGAJVc87iSaSggCH94yZnmRszQT1JX16UQbA
	e8HuAnvbRkcD4VbKSZkdRz5fkZc4XAX3/mn4150pZDkjOpKNEFnOskMKyDnLzq0O
	3XuvDYpxkUmrTtOHVboAGQ8c0joE/ZToZiKFSyM7px5MpP55/BQvw==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46c6vjjnvc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 May 2025 19:49:59 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 541HYkN9001830;
	Thu, 1 May 2025 19:49:58 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 469bamxkbq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 May 2025 19:49:58 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 541JnwFm31916726
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 1 May 2025 19:49:58 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 079015805D;
	Thu,  1 May 2025 19:49:58 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 96DF558053;
	Thu,  1 May 2025 19:49:57 +0000 (GMT)
Received: from d.austin.ibm.com (unknown [9.41.102.181])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  1 May 2025 19:49:57 +0000 (GMT)
From: Dave Marquardt <davemarq@linux.ibm.com>
To: netdev@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org, michal.swiatkowski@linux.intel.com,
        horms@kernel.org, kuba@kernel.org,
        Dave Marquardt <davemarq@linux.ibm.com>
Subject: [PATCH v4 2/3] net: ibmveth: Reset the adapter when unexpected states are detected
Date: Thu,  1 May 2025 14:49:43 -0500
Message-ID: <20250501194944.283729-3-davemarq@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250501194944.283729-1-davemarq@linux.ibm.com>
References: <20250501194944.283729-1-davemarq@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAxMDE1MCBTYWx0ZWRfX6bspcri1I5Wu X1CCBJVekp61tp/h5YdRxfReRcjcEE+nBcPYjjlHg2tESjBa0HunDtcuzZku9dv6CstqOauzTEG Pre6D7PQtNdzNZyAlHIih6dUPnH/a1j0xfca0m1L7Q1txJmOF4dz7TIeiKD+Y8YRz5ITn5fZ9MR
 +RQtPiH2F5vU+lMuKF6QepJABzFl0ICxvG+OsYBVwwCYVboGcyr3Dt1dL7orNv+kqMtw6vgFeVQ wHkiT1Jh0OqDVjZJkJdm3ghKyQaX9qQPzkYle1RXoJWZoxCb+43Bb1cBFlWJnQxqnrjYIwrS5YI XxmIRLqRfnq98JdQn7/p9z4EkPt7tZkD6MPNwB7t95RiUOioJnctZCTkOmv9M0xj96JON7RVpig
 OPcoO+6n3nZ3nKNDW1wdWoeyB8TVXyR0TRsM9QmQyMOQ0OScknWPi82ZcTNfE14LE5JHg1ZS
X-Authority-Analysis: v=2.4 cv=GI8IEvNK c=1 sm=1 tr=0 ts=6813d067 cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=p5xwiLD6boTwWVqVSOUA:9
X-Proofpoint-GUID: -dYIlExtGEjh5NPYCs962gi-BK5gRepk
X-Proofpoint-ORIG-GUID: -dYIlExtGEjh5NPYCs962gi-BK5gRepk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505010150
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Reset the adapter through new function ibmveth_reset, called in
WARN_ON situations. Removed conflicting and unneeded forward
declaration.

Signed-off-by: Dave Marquardt <davemarq@linux.ibm.com>
---
 drivers/net/ethernet/ibm/ibmveth.c | 118 ++++++++++++++++++++++++-----
 drivers/net/ethernet/ibm/ibmveth.h |   1 +
 2 files changed, 100 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/ibm/ibmveth.c b/drivers/net/ethernet/ibm/ibmveth.c
index 04192190beba..cff494739bc9 100644
--- a/drivers/net/ethernet/ibm/ibmveth.c
+++ b/drivers/net/ethernet/ibm/ibmveth.c
@@ -39,8 +39,6 @@
 #include "ibmveth.h"
 
 static irqreturn_t ibmveth_interrupt(int irq, void *dev_instance);
-static void ibmveth_rxq_harvest_buffer(struct ibmveth_adapter *adapter,
-				       bool reuse);
 static unsigned long ibmveth_get_desired_dma(struct vio_dev *vdev);
 
 static struct kobj_type ktype_veth_pool;
@@ -231,7 +229,10 @@ static void ibmveth_replenish_buffer_pool(struct ibmveth_adapter *adapter,
 		index = pool->free_map[free_index];
 		skb = NULL;
 
-		BUG_ON(index == IBM_VETH_INVALID_MAP);
+		if (WARN_ON(index == IBM_VETH_INVALID_MAP)) {
+			schedule_work(&adapter->work);
+			goto bad_index_failure;
+		}
 
 		/* are we allocating a new buffer or recycling an old one */
 		if (pool->skbuff[index])
@@ -300,6 +301,7 @@ static void ibmveth_replenish_buffer_pool(struct ibmveth_adapter *adapter,
 		                 DMA_FROM_DEVICE);
 	dev_kfree_skb_any(pool->skbuff[index]);
 	pool->skbuff[index] = NULL;
+bad_index_failure:
 	adapter->replenish_add_buff_failure++;
 
 	mb();
@@ -370,20 +372,36 @@ static void ibmveth_free_buffer_pool(struct ibmveth_adapter *adapter,
 	}
 }
 
-/* remove a buffer from a pool */
-static void ibmveth_remove_buffer_from_pool(struct ibmveth_adapter *adapter,
-					    u64 correlator, bool reuse)
+/**
+ * ibmveth_remove_buffer_from_pool - remove a buffer from a pool
+ * @adapter: adapter instance
+ * @correlator: identifies pool and index
+ * @reuse: whether to reuse buffer
+ *
+ * Return:
+ * * %0       - success
+ * * %-EINVAL - correlator maps to pool or index out of range
+ * * %-EFAULT - pool and index map to null skb
+ */
+static int ibmveth_remove_buffer_from_pool(struct ibmveth_adapter *adapter,
+					   u64 correlator, bool reuse)
 {
 	unsigned int pool  = correlator >> 32;
 	unsigned int index = correlator & 0xffffffffUL;
 	unsigned int free_index;
 	struct sk_buff *skb;
 
-	BUG_ON(pool >= IBMVETH_NUM_BUFF_POOLS);
-	BUG_ON(index >= adapter->rx_buff_pool[pool].size);
+	if (WARN_ON(pool >= IBMVETH_NUM_BUFF_POOLS) ||
+	    WARN_ON(index >= adapter->rx_buff_pool[pool].size)) {
+		schedule_work(&adapter->work);
+		return -EINVAL;
+	}
 
 	skb = adapter->rx_buff_pool[pool].skbuff[index];
-	BUG_ON(skb == NULL);
+	if (WARN_ON(!skb)) {
+		schedule_work(&adapter->work);
+		return -EFAULT;
+	}
 
 	/* if we are going to reuse the buffer then keep the pointers around
 	 * but mark index as available. replenish will see the skb pointer and
@@ -411,6 +429,8 @@ static void ibmveth_remove_buffer_from_pool(struct ibmveth_adapter *adapter,
 	mb();
 
 	atomic_dec(&(adapter->rx_buff_pool[pool].available));
+
+	return 0;
 }
 
 /* get the current buffer on the rx queue */
@@ -420,24 +440,44 @@ static inline struct sk_buff *ibmveth_rxq_get_buffer(struct ibmveth_adapter *ada
 	unsigned int pool = correlator >> 32;
 	unsigned int index = correlator & 0xffffffffUL;
 
-	BUG_ON(pool >= IBMVETH_NUM_BUFF_POOLS);
-	BUG_ON(index >= adapter->rx_buff_pool[pool].size);
+	if (WARN_ON(pool >= IBMVETH_NUM_BUFF_POOLS) ||
+	    WARN_ON(index >= adapter->rx_buff_pool[pool].size)) {
+		schedule_work(&adapter->work);
+		return NULL;
+	}
 
 	return adapter->rx_buff_pool[pool].skbuff[index];
 }
 
-static void ibmveth_rxq_harvest_buffer(struct ibmveth_adapter *adapter,
-				       bool reuse)
+/**
+ * ibmveth_rxq_harvest_buffer - Harvest buffer from pool
+ *
+ * @adapter: pointer to adapter
+ * @reuse:   whether to reuse buffer
+ *
+ * Context: called from ibmveth_poll
+ *
+ * Return:
+ * * %0    - success
+ * * other - non-zero return from ibmveth_remove_buffer_from_pool
+ */
+static int ibmveth_rxq_harvest_buffer(struct ibmveth_adapter *adapter,
+				      bool reuse)
 {
 	u64 cor;
+	int rc;
 
 	cor = adapter->rx_queue.queue_addr[adapter->rx_queue.index].correlator;
-	ibmveth_remove_buffer_from_pool(adapter, cor, reuse);
+	rc = ibmveth_remove_buffer_from_pool(adapter, cor, reuse);
+	if (unlikely(rc))
+		return rc;
 
 	if (++adapter->rx_queue.index == adapter->rx_queue.num_slots) {
 		adapter->rx_queue.index = 0;
 		adapter->rx_queue.toggle = !adapter->rx_queue.toggle;
 	}
+
+	return 0;
 }
 
 static void ibmveth_free_tx_ltb(struct ibmveth_adapter *adapter, int idx)
@@ -709,6 +749,35 @@ static int ibmveth_close(struct net_device *netdev)
 	return 0;
 }
 
+/**
+ * ibmveth_reset - Handle scheduled reset work
+ *
+ * @w: pointer to work_struct embedded in adapter structure
+ *
+ * Context: This routine acquires rtnl_mutex and disables its NAPI through
+ *          ibmveth_close. It can't be called directly in a context that has
+ *          already acquired rtnl_mutex or disabled its NAPI, or directly from
+ *          a poll routine.
+ *
+ * Return: void
+ */
+static void ibmveth_reset(struct work_struct *w)
+{
+	struct ibmveth_adapter *adapter = container_of(w, struct ibmveth_adapter, work);
+	struct net_device *netdev = adapter->netdev;
+
+	netdev_dbg(netdev, "reset starting\n");
+
+	rtnl_lock();
+
+	dev_close(adapter->netdev);
+	dev_open(adapter->netdev, NULL);
+
+	rtnl_unlock();
+
+	netdev_dbg(netdev, "reset complete\n");
+}
+
 static int ibmveth_set_link_ksettings(struct net_device *dev,
 				      const struct ethtool_link_ksettings *cmd)
 {
@@ -1324,7 +1393,8 @@ static int ibmveth_poll(struct napi_struct *napi, int budget)
 			wmb(); /* suggested by larson1 */
 			adapter->rx_invalid_buffer++;
 			netdev_dbg(netdev, "recycling invalid buffer\n");
-			ibmveth_rxq_harvest_buffer(adapter, true);
+			if (unlikely(ibmveth_rxq_harvest_buffer(adapter, true)))
+				break;
 		} else {
 			struct sk_buff *skb, *new_skb;
 			int length = ibmveth_rxq_frame_length(adapter);
@@ -1334,6 +1404,8 @@ static int ibmveth_poll(struct napi_struct *napi, int budget)
 			__sum16 iph_check = 0;
 
 			skb = ibmveth_rxq_get_buffer(adapter);
+			if (unlikely(!skb))
+				break;
 
 			/* if the large packet bit is set in the rx queue
 			 * descriptor, the mss will be written by PHYP eight
@@ -1357,10 +1429,12 @@ static int ibmveth_poll(struct napi_struct *napi, int budget)
 				if (rx_flush)
 					ibmveth_flush_buffer(skb->data,
 						length + offset);
-				ibmveth_rxq_harvest_buffer(adapter, true);
+				if (unlikely(ibmveth_rxq_harvest_buffer(adapter, true)))
+					break;
 				skb = new_skb;
 			} else {
-				ibmveth_rxq_harvest_buffer(adapter, false);
+				if (unlikely(ibmveth_rxq_harvest_buffer(adapter, false)))
+					break;
 				skb_reserve(skb, offset);
 			}
 
@@ -1407,7 +1481,10 @@ static int ibmveth_poll(struct napi_struct *napi, int budget)
 	 * then check once more to make sure we are done.
 	 */
 	lpar_rc = h_vio_signal(adapter->vdev->unit_address, VIO_IRQ_ENABLE);
-	BUG_ON(lpar_rc != H_SUCCESS);
+	if (WARN_ON(lpar_rc != H_SUCCESS)) {
+		schedule_work(&adapter->work);
+		goto out;
+	}
 
 	if (ibmveth_rxq_pending_buffer(adapter) && napi_schedule(napi)) {
 		lpar_rc = h_vio_signal(adapter->vdev->unit_address,
@@ -1428,7 +1505,7 @@ static irqreturn_t ibmveth_interrupt(int irq, void *dev_instance)
 	if (napi_schedule_prep(&adapter->napi)) {
 		lpar_rc = h_vio_signal(adapter->vdev->unit_address,
 				       VIO_IRQ_DISABLE);
-		BUG_ON(lpar_rc != H_SUCCESS);
+		WARN_ON(lpar_rc != H_SUCCESS);
 		__napi_schedule(&adapter->napi);
 	}
 	return IRQ_HANDLED;
@@ -1670,6 +1747,7 @@ static int ibmveth_probe(struct vio_dev *dev, const struct vio_device_id *id)
 
 	adapter->vdev = dev;
 	adapter->netdev = netdev;
+	INIT_WORK(&adapter->work, ibmveth_reset);
 	adapter->mcastFilterSize = be32_to_cpu(*mcastFilterSize_p);
 	ibmveth_init_link_settings(netdev);
 
@@ -1762,6 +1840,8 @@ static void ibmveth_remove(struct vio_dev *dev)
 	struct ibmveth_adapter *adapter = netdev_priv(netdev);
 	int i;
 
+	cancel_work_sync(&adapter->work);
+
 	for (i = 0; i < IBMVETH_NUM_BUFF_POOLS; i++)
 		kobject_put(&adapter->rx_buff_pool[i].kobj);
 
diff --git a/drivers/net/ethernet/ibm/ibmveth.h b/drivers/net/ethernet/ibm/ibmveth.h
index 0f72ce54e7cf..b0a2460ec9f9 100644
--- a/drivers/net/ethernet/ibm/ibmveth.h
+++ b/drivers/net/ethernet/ibm/ibmveth.h
@@ -137,6 +137,7 @@ struct ibmveth_adapter {
 	struct vio_dev *vdev;
 	struct net_device *netdev;
 	struct napi_struct napi;
+	struct work_struct work;
 	unsigned int mcastFilterSize;
 	void *buffer_list_addr;
 	void *filter_list_addr;
-- 
2.49.0


