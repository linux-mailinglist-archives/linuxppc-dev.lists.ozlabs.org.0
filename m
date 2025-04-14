Return-Path: <linuxppc-dev+bounces-7659-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54104A88C5E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Apr 2025 21:40:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZbyLr5kzfz3bby;
	Tue, 15 Apr 2025 05:40:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744659634;
	cv=none; b=KRns4wRmpvwCNRFsYzTXIrpWg2Tm6JkDt4RropXbeAgZq0ABhuE/TSQr/35DeUSNWp1IPES7EiYsF4gkPzv5qlMZSSZKF1diX9hvPam5tVjMy7EYBeVgxOZ3BOZI9uNKzQF6SeXDzbibmOGh8UqOMPDlSUfweAJwbDzEDNs+91F3ukHBhLz0kLe5poOFFIIm9UM/o3Fjpvp8o+QLpKiYwEInZzoCEERwmL99vCy1r2TgY64F9nuWbswmdSRYU+X7+XYaDWrDwcO6YnT6kx3j9REi24ufv6qoJKtMLjRSwGYTaAzGXbG2bV1W68slmuJvbGkdZ2PZjhWVtTkNcY11Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744659634; c=relaxed/relaxed;
	bh=S7WapPef7pjeXpo4HS69YemoGW/rWRmBO57pjpQqwCQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SZxCJrHbI1UPYrOwOPB9T4gp+unj2pICYYHXCdruutySO+l4Wi4ujQhQH5ISoayQTq6EAACWCrfO62VZpCNB0NblIGncMFsjCR243waiQIoIzdGOLZsDjkzDPyVyC24CFFfSudeXDu5NJ218JyhkVkYQJ5VYnPj14CsU9T3AmDHhvxbjIKJN4HdMqmfGI+JDOaKebK4hpjTHWCGXFKr6Tzx6O7U6xy8OYlogfwIR5Aj7V7KFmWqes7fYoxWx+MsaY28G1RHWePkjjUm1a0zDLjpu3MqY7Zsj+48zwXU5ydcL8V223yw/FJ98DRMgzFAuh+ZzFj9CWDh/pm0XXjgNaA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kt9iRDcO; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=davemarq@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kt9iRDcO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=davemarq@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZbyLn35V0z30BW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Apr 2025 05:40:32 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53EJOx3Y014052;
	Mon, 14 Apr 2025 19:40:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=S7WapPef7pjeXpo4H
	S69YemoGW/rWRmBO57pjpQqwCQ=; b=kt9iRDcOpK5NHDBGLTRMU0aFuXdS9iy8f
	e4CUhv+Jkqupvu3KZdYsOovBKkUVukNJ/7kUdW2w+2O+ODF2EoeMowBRW5gOv0Le
	uuMWkeusY2fgOZ750fq57HL+Jf9EDvb277B1+Ed8YrcXyL2I9BA6gTxyn03yZag8
	66QthtoVrgJBG2t2VOf0z+/juGuFWzC1eK6AZ8E0/DgX6R4tk0+dlayDz6HzMcVR
	hN59yhg11BWngFs2niQyauFFbiGcl76+baqlxYX7q7N+W3mi+rY/8VWg65X+/X3T
	xF74Ci3oDOKAwxMF9aX16nafaokGPtsDGOmbu4Dmzlf2yR90aXYlQ==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4610tpafft-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Apr 2025 19:40:27 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53EGkwKv017170;
	Mon, 14 Apr 2025 19:40:27 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46040kqm17-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Apr 2025 19:40:27 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53EJeQ0530278350
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Apr 2025 19:40:26 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 74F0158057;
	Mon, 14 Apr 2025 19:40:26 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4C57D5805D;
	Mon, 14 Apr 2025 19:40:26 +0000 (GMT)
Received: from d.attlocal.net (unknown [9.61.98.8])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 14 Apr 2025 19:40:26 +0000 (GMT)
From: Dave Marquardt <davemarq@linux.ibm.com>
To: netdev@vger.kernel.org
Cc: michal.swiatkowski@linux.intel.com,
        Dave Marquardt <davemarq@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH net-next v2 1/2] net: ibmveth: make ibmveth use WARN_ON instead of BUG_ON
Date: Mon, 14 Apr 2025 14:40:15 -0500
Message-ID: <20250414194016.437838-2-davemarq@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250414194016.437838-1-davemarq@linux.ibm.com>
References: <20250414194016.437838-1-davemarq@linux.ibm.com>
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
X-Proofpoint-GUID: 39BrxAtXhP-EkLg2BeKP57RKn8W-H6v4
X-Proofpoint-ORIG-GUID: 39BrxAtXhP-EkLg2BeKP57RKn8W-H6v4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_07,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 clxscore=1015 mlxlogscore=999 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504140142
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Replaced BUG_ON calls with WARN_ON calls with error handling, with
calls to a new ibmveth_reset routine, which resets the device. Removed
conflicting and unneeded forward declaration.

Signed-off-by: Dave Marquardt <davemarq@linux.ibm.com>
---
 drivers/net/ethernet/ibm/ibmveth.c | 116 ++++++++++++++++++++++++-----
 drivers/net/ethernet/ibm/ibmveth.h |  65 ++++++++--------
 2 files changed, 130 insertions(+), 51 deletions(-)

diff --git a/drivers/net/ethernet/ibm/ibmveth.c b/drivers/net/ethernet/ibm/ibmveth.c
index 04192190beba..e005caf5874d 100644
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
+ * @adapter - pointer to adapter
+ * @reuse   - whether to reuse buffer
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
+ * @w - pointer to work_struct embedded in adapter structure
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
index 8468e2c59d7a..b0a2460ec9f9 100644
--- a/drivers/net/ethernet/ibm/ibmveth.h
+++ b/drivers/net/ethernet/ibm/ibmveth.h
@@ -134,38 +134,39 @@ struct ibmveth_rx_q {
 };
 
 struct ibmveth_adapter {
-    struct vio_dev *vdev;
-    struct net_device *netdev;
-    struct napi_struct napi;
-    unsigned int mcastFilterSize;
-    void * buffer_list_addr;
-    void * filter_list_addr;
-    void *tx_ltb_ptr[IBMVETH_MAX_QUEUES];
-    unsigned int tx_ltb_size;
-    dma_addr_t tx_ltb_dma[IBMVETH_MAX_QUEUES];
-    dma_addr_t buffer_list_dma;
-    dma_addr_t filter_list_dma;
-    struct ibmveth_buff_pool rx_buff_pool[IBMVETH_NUM_BUFF_POOLS];
-    struct ibmveth_rx_q rx_queue;
-    int rx_csum;
-    int large_send;
-    bool is_active_trunk;
-
-    u64 fw_ipv6_csum_support;
-    u64 fw_ipv4_csum_support;
-    u64 fw_large_send_support;
-    /* adapter specific stats */
-    u64 replenish_task_cycles;
-    u64 replenish_no_mem;
-    u64 replenish_add_buff_failure;
-    u64 replenish_add_buff_success;
-    u64 rx_invalid_buffer;
-    u64 rx_no_buffer;
-    u64 tx_map_failed;
-    u64 tx_send_failed;
-    u64 tx_large_packets;
-    u64 rx_large_packets;
-    /* Ethtool settings */
+	struct vio_dev *vdev;
+	struct net_device *netdev;
+	struct napi_struct napi;
+	struct work_struct work;
+	unsigned int mcastFilterSize;
+	void *buffer_list_addr;
+	void *filter_list_addr;
+	void *tx_ltb_ptr[IBMVETH_MAX_QUEUES];
+	unsigned int tx_ltb_size;
+	dma_addr_t tx_ltb_dma[IBMVETH_MAX_QUEUES];
+	dma_addr_t buffer_list_dma;
+	dma_addr_t filter_list_dma;
+	struct ibmveth_buff_pool rx_buff_pool[IBMVETH_NUM_BUFF_POOLS];
+	struct ibmveth_rx_q rx_queue;
+	int rx_csum;
+	int large_send;
+	bool is_active_trunk;
+
+	u64 fw_ipv6_csum_support;
+	u64 fw_ipv4_csum_support;
+	u64 fw_large_send_support;
+	/* adapter specific stats */
+	u64 replenish_task_cycles;
+	u64 replenish_no_mem;
+	u64 replenish_add_buff_failure;
+	u64 replenish_add_buff_success;
+	u64 rx_invalid_buffer;
+	u64 rx_no_buffer;
+	u64 tx_map_failed;
+	u64 tx_send_failed;
+	u64 tx_large_packets;
+	u64 rx_large_packets;
+	/* Ethtool settings */
 	u8 duplex;
 	u32 speed;
 };
-- 
2.49.0


