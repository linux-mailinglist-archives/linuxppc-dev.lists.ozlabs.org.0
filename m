Return-Path: <linuxppc-dev+bounces-7710-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B95A90D77
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Apr 2025 22:58:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZdCzK6mYyz3c13;
	Thu, 17 Apr 2025 06:58:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744837085;
	cv=none; b=LgsjAWXSLlN35QaXpS3q/aB5bNpmRnAehBEd2R+EGlCZn8o2O08Q1RGbaUM7gXXfggRv540xguOPJr+VqyrdG9Xqe0xBoT4DBZ6lBa+MxSbKFLgeWTz3RE9lyD4Gj+3uBG3y28OAjqXfcq2Buw45ZNEzyFLX3xV1ivcOHGq9vmCNmi6b0miVu6Ks7xty6poQqSClkhzE3k103SeYkyyQMzIWpVE82cj/g70H7ZRJYVA3nEbP3HcScpzQcB+D2kfYeq5Er2KKhAvqjqAN+HQjVQCNfrNQpX00rLBcQTONFcf9UhQW/VoAqAX6jKhhUTg9Lxq30btM8azaivR9FVju0A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744837085; c=relaxed/relaxed;
	bh=0djFjwYT4onUx2O7PfFT+bqOXsPsHh3Ifu78dNdgvw4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JX6RLJt1F74d87mdupS9mSJh9Mo0Tn1sW6J5q8Q25KSvwdETqQPnhxT6VbmHBjbplGm4YigYQ5R3G8vt8nNsFXQASX0j5JWze7nudxxydwG6icNehHiPtywUnflgbACu64IVgYuzdmYV3mrvF6aE1w+dU2R88w3p64gHI7mt1HF4OC2GsIbVzktg+OXt8RfHtnsqtK8SH+2mOn1N71fG99u1cy3X/U4kpi6TT+El9NQhn3Xq+XjKMdTJ7E9jxNetRbmqt2OjE+zx0KU3EB/YgEIxvWpXSW+VvskfHQ0nCf0e5VRdQnv8p1YIRm0YCCJOz+aoS1omyukejH8Agz+E5g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AUqAvqTr; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=davemarq@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AUqAvqTr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=davemarq@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZdCzJ3LFQz3byt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Apr 2025 06:58:04 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GG7PHj018966;
	Wed, 16 Apr 2025 20:58:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=0djFjwYT4onUx2O7P
	fFT+bqOXsPsHh3Ifu78dNdgvw4=; b=AUqAvqTr/RNa3mSpArE/e1qlwufzpdT1I
	hEbDUO4Sk0Pc2GwWYrXW6iaZynKowbhvD18cXzAwlH5bCbpqPxGeJsCsILIUT1ul
	uU3eVRjVqzeUE14uM4+jWhSEaGcS+Yky/Xri5g96wO2+hFr/b6SdP+D++OyMYVc+
	TYZkgwJfxcKQH4EVNiS6KtlHtRc76muA6lqWWB+VLk0oQ8ykTjjlib2ILVqPAa7t
	EmgwZwHtakvp42ShsktCcptAjpN45ILUBcgYC3YoRAOeZEy5w/qc/YS3V/xDWAaR
	cSN0RJ5RJGgk//S2pIpMXFWoKcvtWvclDAhoyClqUGunhX0gqV2gQ==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 461yj567hg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 20:57:59 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53GKSRNv024900;
	Wed, 16 Apr 2025 20:57:58 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4602gtjmys-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 20:57:58 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53GKvt0T12714622
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 20:57:55 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D305F58058;
	Wed, 16 Apr 2025 20:57:57 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A303558057;
	Wed, 16 Apr 2025 20:57:57 +0000 (GMT)
Received: from d.attlocal.net (unknown [9.61.183.42])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 16 Apr 2025 20:57:57 +0000 (GMT)
From: Dave Marquardt <davemarq@linux.ibm.com>
To: netdev@vger.kernel.org
Cc: michal.swiatkowski@linux.intel.com, horms@kernel.org,
        Dave Marquardt <davemarq@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH net-next v3 2/3] net: ibmveth: Reset the adapter when unexpected states are detected
Date: Wed, 16 Apr 2025 15:57:50 -0500
Message-ID: <20250416205751.66365-3-davemarq@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250416205751.66365-1-davemarq@linux.ibm.com>
References: <20250416205751.66365-1-davemarq@linux.ibm.com>
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -RTq5g5OvV5wTeFeZF7mfvEj9zgi2rYm
X-Proofpoint-ORIG-GUID: -RTq5g5OvV5wTeFeZF7mfvEj9zgi2rYm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_08,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160168
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Reset the adapter through new function ibmveth_reset, called in
WARN_ON situations. Removed conflicting and unneeded forward
declaration.

Signed-off-by: Dave Marquardt <davemarq@linux.ibm.com>
---
 drivers/net/ethernet/ibm/ibmveth.c | 116 ++++++++++++++++++++++++-----
 drivers/net/ethernet/ibm/ibmveth.h |   1 +
 2 files changed, 98 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/ibm/ibmveth.c b/drivers/net/ethernet/ibm/ibmveth.c
index 04192190beba..59158284ec43 100644
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


