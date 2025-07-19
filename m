Return-Path: <linuxppc-dev+bounces-10328-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC5FB0AEF1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Jul 2025 11:14:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bkgvx3Xqkz30VZ;
	Sat, 19 Jul 2025 19:14:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752916461;
	cv=none; b=NcHb3lgWRemuMxGTDGJb4MQGT6uDyLftz/fJiP4aaEow7YSnZIt3XXoD5O2fm3pKCO+QmVl+5XBLFO3PFSH341IljlYd1wFPzRFC9gG9vnMMYum5efWAFSFKCgRETdeeliG/0jS+BOjESCmIz1lQdIBn7M41GjRG09r6gma34DwZ7hEE+WTYl1STnc4ww5k9i24MnEN0/ROwMNkZ4vAADNRZXcFebbnGGSq2scL+ypoKcuXYdZaErTb8FGJXGSSh8N7hkilp57HbW1YxFJxSUcRfgqdGzom1Gd2DSwOxPXV/YK0nsF9RoR49zZBD8pu2vT4QaIUEaxjD0Ws0qOl6Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752916461; c=relaxed/relaxed;
	bh=v2sZY0f0KtfxtIWOixGUTxeWwWGnaOoGQS5HE8Mt42E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=czOdbFJb7MXnIKK41JZFiS3yzKvDMm4cIfusJ8p9wtt2dwFnsaOa7TY9wXG5e0CmAUe/OkSPuzTOIF1DARbYA5VyUkcbyzdWmSgbMEpUwdrGUNW7/AF8HNQ98OZGbKTM6szU74V6WmFkPj1puUxaTn3Ccobz6lzA/Nmkjyx0Ef86E7B2S0RAIoMz6eUTKaY8li1XbSdHQDwpV+uvt4fVlcVLBIjX4W0V+XxY3Ny+Jt6YIWGW/IsAOlST0iiL4bAUJdWD0ynooEGOdb39rRwQ2Y5TwaSuzN0XyBpS8N3zFbyinoytaP0LNs9629oInFhCYOvw+PmIBrQkU3i1lPgQbw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AgvGYcQn; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mmc@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AgvGYcQn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mmc@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bkgvw15Gfz30VV
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Jul 2025 19:14:19 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56J5xvmj020232;
	Sat, 19 Jul 2025 09:14:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=v2sZY0f0KtfxtIWOixGUTxeWwWGn
	aOoGQS5HE8Mt42E=; b=AgvGYcQniMRUrtTlgB5vu23SHUucWms7EbCs1+98FYTL
	yp0s851ztXEtAQSBtslr1Nr2pNJymQnRXWbUuRK2AT2w9l4gZTUbyM4Gk+YuU26i
	8JU/pH64SFpyLXmx+Ic8dcQBG/w9MRWmj5BO26ki9fFupZsTOP98rvqEmB/gpdYY
	NDxza/74WWFYE9smGe8+6kpB9TwaA1Ahq7WGdTsmyijZKP3vJie/tCdwfYnqmpJJ
	7G3su6lZ740NbjweDR4atihaEvhwYUD2k/Js9gLfRZqloHL8ndQFUMcm3Z4fzg+X
	MT/Ln/xuCXQKOoeEzGZVPSKKJsfGxN62goBqhdKoeA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4805hfggvq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 19 Jul 2025 09:14:03 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 56J9E2Om012008;
	Sat, 19 Jul 2025 09:14:02 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4805hfggvn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 19 Jul 2025 09:14:02 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 56J7UGpl031922;
	Sat, 19 Jul 2025 09:14:01 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 47v21uncma-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 19 Jul 2025 09:14:01 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 56J9E0dc9699982
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 19 Jul 2025 09:14:00 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B38A858058;
	Sat, 19 Jul 2025 09:14:00 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7C9EE58057;
	Sat, 19 Jul 2025 09:13:59 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.243.79])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 19 Jul 2025 09:13:59 +0000 (GMT)
From: Mingming Cao <mmc@linux.ibm.com>
To: netdev@vger.kernel.org
Cc: horms@kernel.org, bjking1@linux.ibm.com, haren@linux.ibm.com,
        ricklind@linux.ibm.com, davemarq@linux.ibm.com, mmc@linux.ibm.com,
        maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, andrew+netdev@lunn.ch,
        davem@davemloft.net, kuba@kernel.org, edumazet@google.com,
        pabeni@redhat.com, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH net-next v2] ibmveth: Add multi buffers rx replenishment hcall support
Date: Sat, 19 Jul 2025 05:13:56 -0400
Message-Id: <20250719091356.57252-1-mmc@linux.ibm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE5MDA5MCBTYWx0ZWRfX5N4MpLAQ8hiC
 dSuNX1wlk/zxewohe3Ors/GIGIm2hTujEAv897yHac0IJAzdTEyglNNR1QO2qeA1tX/NZtyEMpY
 G3K8lJFARAIvQb5+soiwWaqsnCxe6LJ65UOAPvACTRSGKx4v8Vl2qdUZfVSo5G35d8ZIeOL90BB
 ripn8VU75FE6KnstzbWF5J8OMR6GhwdQSL+mXR5pz6Pzns19azCgfu5l0lxc8t6PS2NkOY7SZ5y
 jMVEoeiJyy6mqmgg6SU/qmtmyfj+Pz2YexxPUQMNLAG3xBjDuscmLz7YY1rXmtAg7Ui5nLYhm2b
 04kLKoMqqTBDvMdTy5YhqbuiafbjJk5nMLnGhhW8cr0B4AZgY/2hazM4DGLU/hj8Fqoc/OvSNaS
 JpMpwqwymJEZYkRvhPmMo7CviTxPjmILAjkc81fcDNXYlflM+9tKF9gsZKQB/kP/hwruocSn
X-Proofpoint-GUID: aO8YaWJmtWbVP4eprk-VbRVCMXRExj7r
X-Proofpoint-ORIG-GUID: RHvBNk0w3JB9BygYSIGj_5RDZTMIEfW0
X-Authority-Analysis: v=2.4 cv=X9RSKHTe c=1 sm=1 tr=0 ts=687b61db cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VnNF1IyMAAAA:8 a=fljhNFjLKTGLiRJvVM8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 clxscore=1015 mlxscore=0 spamscore=0
 suspectscore=0 mlxlogscore=999 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507190090
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This patch enables batched RX buffer replenishment in ibmveth by
using the new firmware-supported h_add_logical_lan_buffers() hcall
 to submit up to 8 RX buffers in a single call, instead of repeatedly
calling the single-buffer h_add_logical_lan_buffer() hcall.

During the probe, with the patch, the driver queries ILLAN attributes
to detect IBMVETH_ILLAN_RX_MULTI_BUFF_SUPPORT bit. If the attribute is
present, rx_buffers_per_hcall is set to 8, enabling batched replenishment.
Otherwise, it defaults to 1, preserving the original upstream behavior
 with no change in code flow for unsupported systems.

The core rx replenish logic remains the same. But when batching
is enabled, the driver aggregates up to 8 fully prepared descriptors
into a single h_add_logical_lan_buffers() hypercall. If any allocation
or DMA mapping fails while preparing a batch, only the successfully
prepared buffers are submitted, and the remaining are deferred for
the next replenish cycle.

If at runtime the firmware stops accepting the batched hcall—e,g,
after a Live Partition Migration (LPM) to a host that does not
support h_add_logical_lan_buffers(), the hypercall returns H_FUNCTION.
In that case, the driver transparently disables batching, resets
rx_buffers_per_hcall to 1, and falls back to the single-buffer hcall
in next future replenishments to take care of these and future buffers.

Test were done on systems with firmware that both supports and
does not support the new h_add_logical_lan_buffers hcall.

On supported firmware, this reduces hypercall overhead significantly
over multiple buffers. SAR measurements showed about a 15% improvement
in packet processing rate under moderate RX load, with heavier traffic
seeing gains more than 30%

Signed-off-by: Mingming Cao <mmc@linux.ibm.com>
Reviewed-by: Brian King <bjking1@linux.ibm.com>
Reviewed-by: Haren Myneni <haren@linux.ibm.com>
Reviewed-by: Dave Marquardt <davemarq@linux.ibm.com>
---
 arch/powerpc/include/asm/hvcall.h  |   1 +
 drivers/net/ethernet/ibm/ibmveth.c | 220 ++++++++++++++++++++---------
 drivers/net/ethernet/ibm/ibmveth.h |  21 +++
 3 files changed, 174 insertions(+), 68 deletions(-)

diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm/hvcall.h
index 6df6dbbe1e7c..ea6c8dc400d2 100644
--- a/arch/powerpc/include/asm/hvcall.h
+++ b/arch/powerpc/include/asm/hvcall.h
@@ -270,6 +270,7 @@
 #define H_QUERY_INT_STATE       0x1E4
 #define H_POLL_PENDING		0x1D8
 #define H_ILLAN_ATTRIBUTES	0x244
+#define H_ADD_LOGICAL_LAN_BUFFERS 0x248
 #define H_MODIFY_HEA_QP		0x250
 #define H_QUERY_HEA_QP		0x254
 #define H_QUERY_HEA		0x258
diff --git a/drivers/net/ethernet/ibm/ibmveth.c b/drivers/net/ethernet/ibm/ibmveth.c
index 24046fe16634..6f0821f1e798 100644
--- a/drivers/net/ethernet/ibm/ibmveth.c
+++ b/drivers/net/ethernet/ibm/ibmveth.c
@@ -211,98 +211,169 @@ static inline void ibmveth_flush_buffer(void *addr, unsigned long length)
 static void ibmveth_replenish_buffer_pool(struct ibmveth_adapter *adapter,
 					  struct ibmveth_buff_pool *pool)
 {
-	u32 i;
-	u32 count = pool->size - atomic_read(&pool->available);
-	u32 buffers_added = 0;
-	struct sk_buff *skb;
-	unsigned int free_index, index;
-	u64 correlator;
+	union ibmveth_buf_desc descs[IBMVETH_MAX_RX_PER_HCALL] = {0};
+	u32 remaining = pool->size - atomic_read(&pool->available);
+	u64 correlators[IBMVETH_MAX_RX_PER_HCALL] = {0};
 	unsigned long lpar_rc;
+	u32 buffers_added = 0;
+	u32 i, filled, batch;
+	struct vio_dev *vdev;
 	dma_addr_t dma_addr;
+	struct device *dev;
+	u32 index;
+
+	vdev = adapter->vdev;
+	dev = &vdev->dev;
 
 	mb();
 
-	for (i = 0; i < count; ++i) {
-		union ibmveth_buf_desc desc;
+	batch = adapter->rx_buffers_per_hcall;
 
-		free_index = pool->consumer_index;
-		index = pool->free_map[free_index];
-		skb = NULL;
+	while (remaining > 0) {
+		unsigned int free_index = pool->consumer_index;
 
-		if (WARN_ON(index == IBM_VETH_INVALID_MAP)) {
-			schedule_work(&adapter->work);
-			goto bad_index_failure;
-		}
+		/* Fill a batch of descriptors */
+		for (filled = 0; filled < min(remaining, batch); filled++) {
+			index = pool->free_map[free_index];
+			if (WARN_ON(index == IBM_VETH_INVALID_MAP)) {
+				adapter->replenish_add_buff_failure++;
+				netdev_info(adapter->netdev,
+					    "Invalid map index %u, reset\n",
+					    index);
+				schedule_work(&adapter->work);
+				break;
+			}
+
+			if (!pool->skbuff[index]) {
+				struct sk_buff *skb = NULL;
 
-		/* are we allocating a new buffer or recycling an old one */
-		if (pool->skbuff[index])
-			goto reuse;
+				skb = netdev_alloc_skb(adapter->netdev,
+						       pool->buff_size);
+				if (!skb) {
+					adapter->replenish_no_mem++;
+					adapter->replenish_add_buff_failure++;
+					break;
+				}
+
+				dma_addr = dma_map_single(dev, skb->data,
+							  pool->buff_size,
+							  DMA_FROM_DEVICE);
+				if (dma_mapping_error(dev, dma_addr)) {
+					dev_kfree_skb_any(skb);
+					adapter->replenish_add_buff_failure++;
+					break;
+				}
 
-		skb = netdev_alloc_skb(adapter->netdev, pool->buff_size);
+				pool->dma_addr[index] = dma_addr;
+				pool->skbuff[index] = skb;
+			} else {
+				/* re-use case */
+				dma_addr = pool->dma_addr[index];
+			}
 
-		if (!skb) {
-			netdev_dbg(adapter->netdev,
-				   "replenish: unable to allocate skb\n");
-			adapter->replenish_no_mem++;
-			break;
-		}
+			if (rx_flush) {
+				unsigned int len;
 
-		dma_addr = dma_map_single(&adapter->vdev->dev, skb->data,
-				pool->buff_size, DMA_FROM_DEVICE);
+				len = adapter->netdev->mtu + IBMVETH_BUFF_OH;
+				len = min(pool->buff_size, len);
+				ibmveth_flush_buffer(pool->skbuff[index]->data,
+						     len);
+			}
 
-		if (dma_mapping_error(&adapter->vdev->dev, dma_addr))
-			goto failure;
+			descs[filled].fields.flags_len = IBMVETH_BUF_VALID |
+							  pool->buff_size;
+			descs[filled].fields.address = dma_addr;
 
-		pool->dma_addr[index] = dma_addr;
-		pool->skbuff[index] = skb;
+			correlators[filled] = ((u64)pool->index << 32) | index;
+			*(u64 *)pool->skbuff[index]->data = correlators[filled];
 
-		if (rx_flush) {
-			unsigned int len = min(pool->buff_size,
-					       adapter->netdev->mtu +
-					       IBMVETH_BUFF_OH);
-			ibmveth_flush_buffer(skb->data, len);
+			free_index++;
+			if (free_index >= pool->size)
+				free_index = 0;
 		}
-reuse:
-		dma_addr = pool->dma_addr[index];
-		desc.fields.flags_len = IBMVETH_BUF_VALID | pool->buff_size;
-		desc.fields.address = dma_addr;
-
-		correlator = ((u64)pool->index << 32) | index;
-		*(u64 *)pool->skbuff[index]->data = correlator;
 
-		lpar_rc = h_add_logical_lan_buffer(adapter->vdev->unit_address,
-						   desc.desc);
+		if (!filled)
+			break;
 
+		/* single buffer case*/
+		if (filled == 1)
+			lpar_rc = h_add_logical_lan_buffer(vdev->unit_address,
+							   descs[0].desc);
+		else
+			/* Multi-buffer hcall */
+			lpar_rc = h_add_logical_lan_buffers(vdev->unit_address,
+							    descs[0].desc,
+							    descs[1].desc,
+							    descs[2].desc,
+							    descs[3].desc,
+							    descs[4].desc,
+							    descs[5].desc,
+							    descs[6].desc,
+							    descs[7].desc);
 		if (lpar_rc != H_SUCCESS) {
-			netdev_warn(adapter->netdev,
-				    "%sadd_logical_lan failed %lu\n",
-				    skb ? "" : "When recycling: ", lpar_rc);
-			goto failure;
+			dev_warn_ratelimited(dev,
+					     "RX h_add_logical_lan failed: filled=%u, rc=%lu, batch=%u\n",
+					     filled, lpar_rc, batch);
+			goto hcall_failure;
 		}
 
-		pool->free_map[free_index] = IBM_VETH_INVALID_MAP;
-		pool->consumer_index++;
-		if (pool->consumer_index >= pool->size)
-			pool->consumer_index = 0;
+		/* Only update pool state after hcall succeeds */
+		for (i = 0; i < filled; i++) {
+			free_index = pool->consumer_index;
+			pool->free_map[free_index] = IBM_VETH_INVALID_MAP;
 
-		buffers_added++;
-		adapter->replenish_add_buff_success++;
-	}
+			pool->consumer_index++;
+			if (pool->consumer_index >= pool->size)
+				pool->consumer_index = 0;
+		}
 
-	mb();
-	atomic_add(buffers_added, &(pool->available));
-	return;
+		buffers_added += filled;
+		adapter->replenish_add_buff_success += filled;
+		remaining -= filled;
 
-failure:
+		memset(&descs, 0, sizeof(descs));
+		memset(&correlators, 0, sizeof(correlators));
+		continue;
 
-	if (dma_addr && !dma_mapping_error(&adapter->vdev->dev, dma_addr))
-		dma_unmap_single(&adapter->vdev->dev,
-		                 pool->dma_addr[index], pool->buff_size,
-		                 DMA_FROM_DEVICE);
-	dev_kfree_skb_any(pool->skbuff[index]);
-	pool->skbuff[index] = NULL;
-bad_index_failure:
-	adapter->replenish_add_buff_failure++;
+hcall_failure:
+		for (i = 0; i < filled; i++) {
+			index = correlators[i] & 0xffffffffUL;
+			dma_addr =  pool->dma_addr[index];
+
+			if (pool->skbuff[index]) {
+				if (dma_addr &&
+				    !dma_mapping_error(dev, dma_addr))
+					dma_unmap_single(dev, dma_addr,
+							 pool->buff_size,
+							 DMA_FROM_DEVICE);
+
+				dev_kfree_skb_any(pool->skbuff[index]);
+				pool->skbuff[index] = NULL;
+			}
+		}
+		adapter->replenish_add_buff_failure += filled;
+
+		/*
+		 * If multi rx buffers hcall is no longer supported by FW
+		 * e.g. in the case of Live Parttion Migration
+		 */
+		if (batch > 1 && lpar_rc == H_FUNCTION) {
+			/*
+			 * Instead of retry submit single buffer individually
+			 * here just set the max rx buffer per hcall to 1
+			 * buffers will be respleshed next time
+			 * when ibmveth_replenish_buffer_pool() is called again
+			 * with single-buffer case
+			 */
+			netdev_info(adapter->netdev,
+				    "RX Multi buffers not supported by FW, rc=%lu\n",
+				    lpar_rc);
+			adapter->rx_buffers_per_hcall = 1;
+			netdev_info(adapter->netdev,
+				    "Next rx replesh will fall back to single-buffer hcall\n");
+		}
+		break;
+	}
 
 	mb();
 	atomic_add(buffers_added, &(pool->available));
@@ -1783,6 +1854,19 @@ static int ibmveth_probe(struct vio_dev *dev, const struct vio_device_id *id)
 		netdev->features |= NETIF_F_FRAGLIST;
 	}
 
+	if (ret == H_SUCCESS &&
+	    (ret_attr & IBMVETH_ILLAN_RX_MULTI_BUFF_SUPPORT)) {
+		adapter->rx_buffers_per_hcall = IBMVETH_MAX_RX_PER_HCALL;
+		netdev_dbg(netdev,
+			   "RX Multi-buffer hcall supported by FW, batch set to %u\n",
+			    adapter->rx_buffers_per_hcall);
+	} else {
+		adapter->rx_buffers_per_hcall = 1;
+		netdev_dbg(netdev,
+			   "RX Single-buffer hcall mode, batch set to %u\n",
+			   adapter->rx_buffers_per_hcall);
+	}
+
 	netdev->min_mtu = IBMVETH_MIN_MTU;
 	netdev->max_mtu = ETH_MAX_MTU - IBMVETH_BUFF_OH;
 
diff --git a/drivers/net/ethernet/ibm/ibmveth.h b/drivers/net/ethernet/ibm/ibmveth.h
index b0a2460ec9f9..068f99df133e 100644
--- a/drivers/net/ethernet/ibm/ibmveth.h
+++ b/drivers/net/ethernet/ibm/ibmveth.h
@@ -28,6 +28,7 @@
 #define IbmVethMcastRemoveFilter     0x2UL
 #define IbmVethMcastClearFilterTable 0x3UL
 
+#define IBMVETH_ILLAN_RX_MULTI_BUFF_SUPPORT	0x0000000000040000UL
 #define IBMVETH_ILLAN_LRG_SR_ENABLED	0x0000000000010000UL
 #define IBMVETH_ILLAN_LRG_SND_SUPPORT	0x0000000000008000UL
 #define IBMVETH_ILLAN_PADDED_PKT_CSUM	0x0000000000002000UL
@@ -46,6 +47,24 @@
 #define h_add_logical_lan_buffer(ua, buf) \
   plpar_hcall_norets(H_ADD_LOGICAL_LAN_BUFFER, ua, buf)
 
+static inline long h_add_logical_lan_buffers(unsigned long unit_address,
+					     unsigned long desc1,
+					     unsigned long desc2,
+					     unsigned long desc3,
+					     unsigned long desc4,
+					     unsigned long desc5,
+					     unsigned long desc6,
+					     unsigned long desc7,
+					     unsigned long desc8)
+{
+	unsigned long retbuf[PLPAR_HCALL9_BUFSIZE];
+
+	return plpar_hcall9(H_ADD_LOGICAL_LAN_BUFFERS,
+			    retbuf, unit_address,
+			    desc1, desc2, desc3, desc4,
+			    desc5, desc6, desc7, desc8);
+}
+
 /* FW allows us to send 6 descriptors but we only use one so mark
  * the other 5 as unused (0)
  */
@@ -101,6 +120,7 @@ static inline long h_illan_attributes(unsigned long unit_address,
 #define IBMVETH_MAX_TX_BUF_SIZE (1024 * 64)
 #define IBMVETH_MAX_QUEUES 16U
 #define IBMVETH_DEFAULT_QUEUES 8U
+#define IBMVETH_MAX_RX_PER_HCALL 8U
 
 static int pool_size[] = { 512, 1024 * 2, 1024 * 16, 1024 * 32, 1024 * 64 };
 static int pool_count[] = { 256, 512, 256, 256, 256 };
@@ -151,6 +171,7 @@ struct ibmveth_adapter {
 	int rx_csum;
 	int large_send;
 	bool is_active_trunk;
+	unsigned int rx_buffers_per_hcall;
 
 	u64 fw_ipv6_csum_support;
 	u64 fw_ipv4_csum_support;
-- 
2.39.3 (Apple Git-146)


