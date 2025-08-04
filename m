Return-Path: <linuxppc-dev+bounces-10628-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E44CEB1AB5B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Aug 2025 01:17:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bwssM47qYz2yPS;
	Tue,  5 Aug 2025 09:17:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754349447;
	cv=none; b=S/FYn3rICskzWG/2jdocSugYmUXuVS2IE1xGRyZQcnNBpLlL8bLiU3/q4VMB5/9y2D7TthnyFRwKvdRVafnmarV2i4GOwlVdiL6wC96IwkUPSKqqJ4XrM4+z0e2O8QIBhSyFzs8p42T95KSz2aC4Qe6QXMKqlK95R7k3LaxoRzQ8nZhX8KqKRTzVoxUjacu+SLnjnl7IgAODEhq8EgHHu9LFZ03KLdQsD+zJisldhnSSRjzTc87RhOAWHuX6t387tArd0RH9W9SILWGWxP+DzMMAfBVgBEUjX1905kkdutCOGoqnn9EyQiQRW1BB0s7zWddHW2KhNNJE0cciZBqqcA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754349447; c=relaxed/relaxed;
	bh=Dfzkp5UWUHQTCQ4oT77WA+rZ3ghmLwvDlJXLyLDlYDE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=DeMGp52AqyMeu09q5OYIO3BSc7bHwLGHVtKqIl6uslw9CdjyG/VhalpjqHm96kUWV2HjyDX1tM0JlDwa0zoK9i/QYp4KzEC+/Ou7v930YLUP6m/ZtYNuqUCiGFVQ0l/VF1azz5etUqadKNU2LXTz5i9J02hr3Vom0xS/XptnfyZO18AkcumiUzEJyMJfK4JixFPD/agpA6NGJEH5xnPU6aM5+u/C3OInVzeB3xdyvztH+bXf/RyTeawtcO2J2pgBLcBShovjjof+gQtnCjj9knCF1J3nPiVeOpjLpyeb8A1vY8FQV7V1UDtdb2qaiXmkwSr+9b9XNmvBHkngoi1VNA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cyRuyTQc; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mmc@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cyRuyTQc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mmc@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bwssL0rznz2xQ5
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Aug 2025 09:17:25 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 574Jjmv8010955;
	Mon, 4 Aug 2025 23:17:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=Dfzkp5UWUHQTCQ4oT77WA+rZ3ghm
	LwvDlJXLyLDlYDE=; b=cyRuyTQcKZNBzDUnKm0oY694b4uIRCMOJ1tV9eQg6c6G
	s9dzAtoeJt9G35a+PPaDGcdpkEuR1xkl/N4dVIihyJiyJHF2anzYLLiIRJc36abR
	k2MlgsXdgwyz3pTRYViGR/Kx4+9h4e32PM0F1eMmzek+bCrx2fdzRcujp16bjkqO
	TtGnyI8WXywb0fkCkm9bWpPArDdApIQiSMRXyjJ6imQPNpRufQYIepVr2zlZJoTg
	aMlFlxUiC4PrQlVjIwJzPmKXrRvT71sEH6ZWXlxAjIpKVmi8Soc/RuX03m+hyYSR
	haKPS5+Cz5PoDY1h9SYKiWVg20Ujn7uZHE4uj7m4tA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 489ab3kf7h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Aug 2025 23:17:11 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 574NCuhh023152;
	Mon, 4 Aug 2025 23:17:10 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 489ab3kf7f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Aug 2025 23:17:10 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 574MNtEk009767;
	Mon, 4 Aug 2025 23:17:09 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 489w0tg4j2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Aug 2025 23:17:09 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 574NH0gB17760772
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 4 Aug 2025 23:17:01 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 00A715805A;
	Mon,  4 Aug 2025 23:17:08 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 12D3D58051;
	Mon,  4 Aug 2025 23:17:07 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.252.198])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  4 Aug 2025 23:17:06 +0000 (GMT)
From: Mingming Cao <mmc@linux.ibm.com>
To: netdev@vger.kernel.org
Cc: horms@kernel.org, bjking1@linux.ibm.com, haren@linux.ibm.com,
        ricklind@linux.ibm.com, mmc@linux.ibm.com, kuba@kernel.org,
        edumazet@google.com, pabeni@redhat.com, linuxppc-dev@lists.ozlabs.org,
        maddy@linux.ibm.com, mpe@ellerman.id.au
Subject: [PATCH v3 net-next] ibmvnic: Increase max subcrq indirect entries with fallback
Date: Mon,  4 Aug 2025 16:17:04 -0700
Message-Id: <20250804231704.12309-1-mmc@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=Z+jsHGRA c=1 sm=1 tr=0 ts=68913f77 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=OLL_FvSJAAAA:8 a=VnNF1IyMAAAA:8
 a=cpcE9bPGk_YqXSbw9-wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=S0tEaOFY4U4A:10 a=0HqUTnTcdJQA:10 a=oIrB72frpwYPwTMnlWqB:22
X-Proofpoint-ORIG-GUID: z7AG0kfGS51kLZ7zNYOZmrBzE8R5XX4H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDE0MCBTYWx0ZWRfX0Btw+vqxV5jA
 KuAIYJZ2zXnKvvOSgYfvjPmovT6bUkP4LKFP4c4BG99zCN+VzKpI9GxEAmfNhby4AbERtdoQIwc
 22LHywpa82nqbB1c414Evt2aR9htyTnAdFaOG2xr3/FnWjP71w6gZw0UKBrTtrLXLj1sr6sREpK
 VVELoGXQ9jUO2etxBhPTOo4UvsXpO9hL+4y9V2eb3gIVd+Z8W0n9i8/FH/dWTeA/H+jaaxbadLl
 /bTPmvF4AdQqVy7Gw86rldcxkW9F2lQ85GwUh24GqBGA45ZjfrwGqhUKvnqk6O8Cej1hQPi27SK
 CLEzyiQiBFWx/VbDuSUwVy3nRZ/vdVG7aGMCYBBFQpsvxMsHdUz3YmpG3UMuXqb79+CRFdisy0R
 P6NvqX4x/guSgxHwsfLGcM96iWjoyQAvgWuChmQZ1jEQhXmws3orVreuAl4sR84yBlcM4yi1
X-Proofpoint-GUID: wgHmIUqEuC-ccaGcTM1BYnuvAZaKnWcA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_10,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 mlxlogscore=999 adultscore=0 phishscore=0 mlxscore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508040140
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

POWER8 support a maximum of 16 subcrq indirect descriptor entries per
 H_SEND_SUB_CRQ_INDIRECT call, while POWER9 and newer hypervisors
 support up to 128 entries. Increasing the max number of indirect
descriptor entries improves batching efficiency and reduces
hcall overhead, which enhances throughput under large workload on POWER9+.

Currently, ibmvnic driver always uses a fixed number of max indirect
descriptor entries (16). send_subcrq_indirect() treats all hypervisor
errors the same:
 - Cleanup and Drop the entire batch of descriptors.
 - Return an error to the caller.
 - Rely on TCP/IP retransmissions to recover.
 - If the hypervisor returns H_PARAMETER (e.g., because 128
   entries are not supported on POWER8), the driver will continue
   to drop batches, resulting in unnecessary packet loss.

In this patch:
Raise the default maximum indirect entries to 128 to improve ibmvnic
batching on morden platform. But also gracefully fall back to
16 entries for Power 8 systems.

Since there is no VIO interface to query the hypervisor’s supported
limit, vnic handles send_subcrq_indirect() H_PARAMETER errors:
 - On first H_PARAMETER failure, log the failure context
 - Reduce max_indirect_entries to 16 and allow the single batch to drop.
 - Subsequent calls automatically use the correct lower limit,
    avoiding repeated drops.

The goal is to  optimizes performance on modern systems while handles
falling back for older POWER8 hypervisors.

Performance shows 40% improvements with MTU (1500) on largework load.

--------------------------------------
Changes since v2:
link to v2: https://www.spinics.net/lists/netdev/msg1104669.html

-- was Patch 4 from a patch series v2. v2 introduced a module parameter
for backward compatibility. Based on review feedback, This patch handles
older systems fall back case without adding a module parameter.

Signed-off-by: Mingming Cao <mmc@linux.ibm.com>
Reviewed-by: Brian King <bjking1@linux.ibm.com>
Reviewed-by: Haren Myneni <haren@linux.ibm.com>
---
 drivers/net/ethernet/ibm/ibmvnic.c | 56 ++++++++++++++++++++++++++----
 drivers/net/ethernet/ibm/ibmvnic.h |  6 ++--
 2 files changed, 53 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
index eec971567aac..28d64e4b8071 100644
--- a/drivers/net/ethernet/ibm/ibmvnic.c
+++ b/drivers/net/ethernet/ibm/ibmvnic.c
@@ -843,7 +843,7 @@ static void replenish_rx_pool(struct ibmvnic_adapter *adapter,
 		sub_crq->rx_add.len = cpu_to_be32(pool->buff_size << shift);
 
 		/* if send_subcrq_indirect queue is full, flush to VIOS */
-		if (ind_bufp->index == IBMVNIC_MAX_IND_DESCS ||
+		if (ind_bufp->index == adapter->cur_max_ind_descs ||
 		    i == count - 1) {
 			lpar_rc =
 				send_subcrq_indirect(adapter, handle,
@@ -862,6 +862,19 @@ static void replenish_rx_pool(struct ibmvnic_adapter *adapter,
 failure:
 	if (lpar_rc != H_PARAMETER && lpar_rc != H_CLOSED)
 		dev_err_ratelimited(dev, "rx: replenish packet buffer failed\n");
+
+	/* Detect platform limit H_PARAMETER */
+	if (lpar_rc == H_PARAMETER &&
+	    adapter->cur_max_ind_descs > IBMVNIC_MAX_IND_DESC_MIN) {
+		netdev_info(adapter->netdev,
+			    "H_PARAMETER, set ind desc to safe limit %u\n",
+			    IBMVNIC_MAX_IND_DESC_MIN);
+		adapter->cur_max_ind_descs = IBMVNIC_MAX_IND_DESC_MIN;
+	}
+
+	/* for all error case, temporarily drop only this batch
+	 * Rely on TCP/IP retransmissions to retry and recover
+	 */
 	for (i = ind_bufp->index - 1; i >= 0; --i) {
 		struct ibmvnic_rx_buff *rx_buff;
 
@@ -2381,16 +2394,33 @@ static int ibmvnic_tx_scrq_flush(struct ibmvnic_adapter *adapter,
 		rc = send_subcrq_direct(adapter, handle,
 					(u64 *)ind_bufp->indir_arr);
 
-	if (rc)
+	if (rc) {
+		dev_err_ratelimited(&adapter->vdev->dev,
+				    "tx_flush failed, rc=%u (%llu entries dma=%pad handle=%llx)\n",
+				    rc, entries, &dma_addr, handle);
+		/* Detect platform limit H_PARAMETER */
+		if (rc == H_PARAMETER &&
+		    adapter->cur_max_ind_descs > IBMVNIC_MAX_IND_DESC_MIN) {
+			netdev_info(adapter->netdev,
+				    "H_PARAMETER, set ind descs to safe limit %u\n",
+				    IBMVNIC_MAX_IND_DESC_MIN);
+			adapter->cur_max_ind_descs = IBMVNIC_MAX_IND_DESC_MIN;
+		}
+
+		/* for all error case, temporarily drop only this batch
+		 * Rely on TCP/IP retransmissions to retry and recover
+		 */
 		ibmvnic_tx_scrq_clean_buffer(adapter, tx_scrq);
-	else
+	} else {
 		ind_bufp->index = 0;
+	}
 	return rc;
 }
 
 static netdev_tx_t ibmvnic_xmit(struct sk_buff *skb, struct net_device *netdev)
 {
 	struct ibmvnic_adapter *adapter = netdev_priv(netdev);
+	u32 cur_max_ind_descs = adapter->cur_max_ind_descs;
 	int queue_num = skb_get_queue_mapping(skb);
 	u8 *hdrs = (u8 *)&adapter->tx_rx_desc_req;
 	struct device *dev = &adapter->vdev->dev;
@@ -2590,7 +2620,7 @@ static netdev_tx_t ibmvnic_xmit(struct sk_buff *skb, struct net_device *netdev)
 	tx_crq.v1.n_crq_elem = num_entries;
 	tx_buff->num_entries = num_entries;
 	/* flush buffer if current entry can not fit */
-	if (num_entries + ind_bufp->index > IBMVNIC_MAX_IND_DESCS) {
+	if (num_entries + ind_bufp->index > cur_max_ind_descs) {
 		lpar_rc = ibmvnic_tx_scrq_flush(adapter, tx_scrq, true);
 		if (lpar_rc != H_SUCCESS)
 			goto tx_flush_err;
@@ -2603,7 +2633,7 @@ static netdev_tx_t ibmvnic_xmit(struct sk_buff *skb, struct net_device *netdev)
 	ind_bufp->index += num_entries;
 	if (__netdev_tx_sent_queue(txq, skb->len,
 				   netdev_xmit_more() &&
-				   ind_bufp->index < IBMVNIC_MAX_IND_DESCS)) {
+				   ind_bufp->index < cur_max_ind_descs)) {
 		lpar_rc = ibmvnic_tx_scrq_flush(adapter, tx_scrq, true);
 		if (lpar_rc != H_SUCCESS)
 			goto tx_err;
@@ -4006,7 +4036,7 @@ static void release_sub_crq_queue(struct ibmvnic_adapter *adapter,
 	}
 
 	dma_free_coherent(dev,
-			  IBMVNIC_IND_ARR_SZ,
+			  IBMVNIC_IND_MAX_ARR_SZ,
 			  scrq->ind_buf.indir_arr,
 			  scrq->ind_buf.indir_dma);
 
@@ -4063,7 +4093,7 @@ static struct ibmvnic_sub_crq_queue *init_sub_crq_queue(struct ibmvnic_adapter
 
 	scrq->ind_buf.indir_arr =
 		dma_alloc_coherent(dev,
-				   IBMVNIC_IND_ARR_SZ,
+				   IBMVNIC_IND_MAX_ARR_SZ,
 				   &scrq->ind_buf.indir_dma,
 				   GFP_KERNEL);
 
@@ -6369,6 +6399,17 @@ static int ibmvnic_reset_init(struct ibmvnic_adapter *adapter, bool reset)
 			rc = reset_sub_crq_queues(adapter);
 		}
 	} else {
+		if (adapter->reset_reason == VNIC_RESET_MOBILITY) {
+			/* post migrtione reset the max
+			 * indirect descriptors per hcall to be default max
+			 * (e.g p8 ->p10)
+			 * if the destination is on the platform supports
+			 * do not support max (e.g. p10->p8) the threshold
+			 * will be reduced to safe min limit for p8 later
+			 */
+			adapter->cur_max_ind_descs = IBMVNIC_MAX_IND_DESC_MAX;
+		}
+
 		rc = init_sub_crqs(adapter);
 	}
 
@@ -6520,6 +6561,7 @@ static int ibmvnic_probe(struct vio_dev *dev, const struct vio_device_id *id)
 
 	adapter->wait_for_reset = false;
 	adapter->last_reset_time = jiffies;
+	adapter->cur_max_ind_descs = IBMVNIC_MAX_IND_DESC_MAX;
 
 	rc = register_netdev(netdev);
 	if (rc) {
diff --git a/drivers/net/ethernet/ibm/ibmvnic.h b/drivers/net/ethernet/ibm/ibmvnic.h
index 246ddce753f9..829a16116812 100644
--- a/drivers/net/ethernet/ibm/ibmvnic.h
+++ b/drivers/net/ethernet/ibm/ibmvnic.h
@@ -29,8 +29,9 @@
 #define IBMVNIC_BUFFS_PER_POOL	100
 #define IBMVNIC_MAX_QUEUES	16
 #define IBMVNIC_MAX_QUEUE_SZ   4096
-#define IBMVNIC_MAX_IND_DESCS  16
-#define IBMVNIC_IND_ARR_SZ	(IBMVNIC_MAX_IND_DESCS * 32)
+#define IBMVNIC_MAX_IND_DESC_MAX 128
+#define IBMVNIC_MAX_IND_DESC_MIN 16
+#define IBMVNIC_IND_MAX_ARR_SZ (IBMVNIC_MAX_IND_DESC_MAX * 32)
 
 #define IBMVNIC_TSO_BUF_SZ	65536
 #define IBMVNIC_TSO_BUFS	64
@@ -930,6 +931,7 @@ struct ibmvnic_adapter {
 	struct ibmvnic_control_ip_offload_buffer ip_offload_ctrl;
 	dma_addr_t ip_offload_ctrl_tok;
 	u32 msg_enable;
+	u32 cur_max_ind_descs;
 
 	/* Vital Product Data (VPD) */
 	struct ibmvnic_vpd *vpd;
-- 
2.39.3 (Apple Git-146)


