Return-Path: <linuxppc-dev+bounces-10700-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 84DA9B1CC6B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Aug 2025 21:17:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4by0R51606z3bnx;
	Thu,  7 Aug 2025 05:17:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754507825;
	cv=none; b=iMygJIVdjfS6Z0+YjLPtG0l817VtJj+UEyxUBx/ejxb6lpAhTk6ZFGvuVNKRohbvyFaTOMxeX+PCwmvxU1n4ALrOoV1EJGVGQa/VbKnZg5enbPD5N+4YhiixwBQIX2bqqaA4OFdNBasn8SWIdWo5MteI2RKHLJm9VnxmkhaKi8Cp8xQ5S8bucdpBQc1OZKy67GywBW4FCWd2ugRjq9XzvoCDXPXZlijVd3dhQaqmasys+KXZ+UutlnaxD+pE3vH+K7HrdE26eFL3MFb3uGQp2bwyiUr4C9mJlUjfUXWNZbBBf8ia1CgAYZSGqZAjy1mPBZzFA8ZpjwR1SoTDWyMpig==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754507825; c=relaxed/relaxed;
	bh=zRnIT9KZEUtsie332QmMWce+pbj1uFLS7KHLr+p66r8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=VQbEqLFBt0XhRgWXYXkeregQbPkSzG6ONKbRp8DGdm9Uq04qIrC9zQHaFU9o3Y6lXySOCqVlKMuU68JbPjVekq2yMiLLG1w+8chhiVhxXSSg4wE2BA0hWu1kPWk3SbqzYtu6oV03YyoTdU4d7t+3O1S+IGfqFa6rr67WduU2FovfkU96ksBpSrTtEerDasHinfBVWleoqWviedCWudgrkdrpiu4KNHJha0z/mr3pXia9k75eU4VIG8t/MwxBg1IhIabVXM8ITS6poBTY1rkvdSIkLfVHym5QAN9fHZnvXAUBpZJ9EmCpC8oxhdlJkapcTGHNGcsZo03R6ByWi7AT+w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pmf1JXvf; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mmc@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pmf1JXvf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mmc@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4by0R155nQz30W5
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Aug 2025 05:17:00 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 576H9jhD017953;
	Wed, 6 Aug 2025 18:44:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=zRnIT9KZEUtsie332QmMWce+pbj1
	uFLS7KHLr+p66r8=; b=pmf1JXvfpZxj5vy080MN+KozgpFoWIPD34ukNLXUZy3o
	l/nEtR8zkxkfQrs6RnJj1WtSeo252tAmyd0Ou3VnF/HzSMWI7fj/lpKYa3mndf5U
	S0tucA0ntpgAQMORkEUlgQeeqJFuca9bZ2Vw5QHgrYsxREGnS1iTHVJsbgesQ0ie
	02NtJDdu5Q6lIXU105sj149O7X2JlavpFE2gLs9d9VSee0EnpEZPSKUeEmMBf3E2
	44sctO0GKW2mx4t3RmV3am0tatE2c5Iut6/MdrpF2FHHZUEBlniOTfdt2dmrbZW4
	0dSKonIDPd+YYby7HK5CmtCi17pLjfDd84WXOivrAw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48bq635wmq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Aug 2025 18:44:56 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 576Ic6Wt004036;
	Wed, 6 Aug 2025 18:44:56 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48bq635wmn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Aug 2025 18:44:56 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 576GA7ER020626;
	Wed, 6 Aug 2025 18:44:55 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 48bpwmw1av-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Aug 2025 18:44:55 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 576Iirpb15663746
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 6 Aug 2025 18:44:54 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DA22F58060;
	Wed,  6 Aug 2025 18:44:53 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A9A225805C;
	Wed,  6 Aug 2025 18:44:52 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.249.43])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  6 Aug 2025 18:44:52 +0000 (GMT)
From: Mingming Cao <mmc@linux.ibm.com>
To: netdev@vger.kernel.org
Cc: horms@kernel.org, bjking1@linux.ibm.com, haren@linux.ibm.com,
        ricklind@linux.ibm.com, mmc@linux.ibm.com, kuba@kernel.org,
        edumazet@google.com, pabeni@redhat.com, linuxppc-dev@lists.ozlabs.org,
        maddy@linux.ibm.com, mpe@ellerman.id.au
Subject: [PATCH net-next v4] ibmvnic: Increase max subcrq indirect entries with fallback
Date: Wed,  6 Aug 2025 11:44:49 -0700
Message-Id: <20250806184449.94278-1-mmc@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDEyMSBTYWx0ZWRfXzwQMV80PausI
 aKNqN08VNcfce8ybnkS5GWmJkZsEuMqiNCAzVaeAbsrts+7+BrADuHQecvwkBqGvHNK5pm+Efv8
 0nckAIj2lVvzUG6Arx2t4hXNE6EyMGm7VWqQCxHRDV06uyp/IKvumX66Qw522s03bXfERjgbsT/
 fFUm19sInknsmSzqk7vkZ6aDg23RFGbpX4JPCeY1V/y25JkMNJbDo3CMlA6p1xeAbV3iiPAVzaX
 ViIsYqQ9LEZ5brhp3i5tum6OleeNpcC7oQ+yIxbQuNm7l9mcqajwGWZEWdOX3DToJ54cJzWM11n
 HmNGxPaTKDNRo7GXDkS5YuT64yHS2X9c/MF0GQhp4hQw+Zx6QFsFbJ0Rk40otGeroK9c9lqP37F
 lTdwhjCaskVETsTQaOw03d7jcBlHTUcdw3w19xhDYRo6iiCTTeKi/JwINz2Nu6oMmzhuVuMR
X-Proofpoint-GUID: MX7lo53zy9sQuUM3JDbVanmx1D93oaUj
X-Authority-Analysis: v=2.4 cv=PoCTbxM3 c=1 sm=1 tr=0 ts=6893a2a8 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=OLL_FvSJAAAA:8 a=VnNF1IyMAAAA:8
 a=w0uWSLrWK22mGSI73woA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=sBcVD6HgrJwA:10 a=S0tEaOFY4U4A:10 a=om6-3txeEIcA:10 a=0HqUTnTcdJQA:10
 a=oIrB72frpwYPwTMnlWqB:22
X-Proofpoint-ORIG-GUID: 5ycY1sU4GGhxph_It47AF8BNim0P-Ke5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_04,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=999 mlxscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2507300000
 definitions=main-2508060121
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
Changes since v3:
Link to v3: https://www.spinics.net/lists/netdev/msg1112828.html
- consolidate H_PARAMTER handling & subcrq ind desc limit reset for RX/TX
  into a helper function
- Cleanup and clarify comments in post migration case
- Renamed the limits to be a clear and simple name

Changes since v2:
link to v2: https://www.spinics.net/lists/netdev/msg1104669.html

-- was Patch 4 from a patch series v2. v2 introduced a module parameter
for backward compatibility. Based on review feedback, This patch handles
older systems fall back case without adding a module parameter.

Signed-off-by: Mingming Cao <mmc@linux.ibm.com>
Reviewed-by: Brian King <bjking1@linux.ibm.com>
Reviewed-by: Haren Myneni <haren@linux.ibm.com>
---
 drivers/net/ethernet/ibm/ibmvnic.c | 59 ++++++++++++++++++++++++++----
 drivers/net/ethernet/ibm/ibmvnic.h |  6 ++-
 2 files changed, 56 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
index eec971567aac..244b2bce0047 100644
--- a/drivers/net/ethernet/ibm/ibmvnic.c
+++ b/drivers/net/ethernet/ibm/ibmvnic.c
@@ -756,6 +756,17 @@ static void deactivate_rx_pools(struct ibmvnic_adapter *adapter)
 		adapter->rx_pool[i].active = 0;
 }
 
+static void ibmvnic_set_safe_max_ind_descs(struct ibmvnic_adapter *adapter)
+{
+	if (adapter->cur_max_ind_descs > IBMVNIC_SAFE_IND_DESC) {
+		netdev_info(adapter->netdev,
+			    "set max ind descs from %u to safe limit %u\n",
+			    adapter->cur_max_ind_descs,
+			    IBMVNIC_SAFE_IND_DESC);
+		adapter->cur_max_ind_descs = IBMVNIC_SAFE_IND_DESC;
+	}
+}
+
 static void replenish_rx_pool(struct ibmvnic_adapter *adapter,
 			      struct ibmvnic_rx_pool *pool)
 {
@@ -843,7 +854,7 @@ static void replenish_rx_pool(struct ibmvnic_adapter *adapter,
 		sub_crq->rx_add.len = cpu_to_be32(pool->buff_size << shift);
 
 		/* if send_subcrq_indirect queue is full, flush to VIOS */
-		if (ind_bufp->index == IBMVNIC_MAX_IND_DESCS ||
+		if (ind_bufp->index == adapter->cur_max_ind_descs ||
 		    i == count - 1) {
 			lpar_rc =
 				send_subcrq_indirect(adapter, handle,
@@ -862,6 +873,14 @@ static void replenish_rx_pool(struct ibmvnic_adapter *adapter,
 failure:
 	if (lpar_rc != H_PARAMETER && lpar_rc != H_CLOSED)
 		dev_err_ratelimited(dev, "rx: replenish packet buffer failed\n");
+
+	/* Detect platform limit H_PARAMETER */
+	if (lpar_rc == H_PARAMETER)
+		ibmvnic_set_safe_max_ind_descs(adapter);
+
+	/* For all error case, temporarily drop only this batch
+	 * Rely on TCP/IP retransmissions to retry and recover
+	 */
 	for (i = ind_bufp->index - 1; i >= 0; --i) {
 		struct ibmvnic_rx_buff *rx_buff;
 
@@ -2381,16 +2400,28 @@ static int ibmvnic_tx_scrq_flush(struct ibmvnic_adapter *adapter,
 		rc = send_subcrq_direct(adapter, handle,
 					(u64 *)ind_bufp->indir_arr);
 
-	if (rc)
+	if (rc) {
+		dev_err_ratelimited(&adapter->vdev->dev,
+				    "tx_flush failed, rc=%u (%llu entries dma=%pad handle=%llx)\n",
+				    rc, entries, &dma_addr, handle);
+		/* Detect platform limit H_PARAMETER */
+		if (rc == H_PARAMETER)
+			ibmvnic_set_safe_max_ind_descs(adapter);
+
+		/* For all error case, temporarily drop only this batch
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
@@ -2590,7 +2621,7 @@ static netdev_tx_t ibmvnic_xmit(struct sk_buff *skb, struct net_device *netdev)
 	tx_crq.v1.n_crq_elem = num_entries;
 	tx_buff->num_entries = num_entries;
 	/* flush buffer if current entry can not fit */
-	if (num_entries + ind_bufp->index > IBMVNIC_MAX_IND_DESCS) {
+	if (num_entries + ind_bufp->index > cur_max_ind_descs) {
 		lpar_rc = ibmvnic_tx_scrq_flush(adapter, tx_scrq, true);
 		if (lpar_rc != H_SUCCESS)
 			goto tx_flush_err;
@@ -2603,7 +2634,7 @@ static netdev_tx_t ibmvnic_xmit(struct sk_buff *skb, struct net_device *netdev)
 	ind_bufp->index += num_entries;
 	if (__netdev_tx_sent_queue(txq, skb->len,
 				   netdev_xmit_more() &&
-				   ind_bufp->index < IBMVNIC_MAX_IND_DESCS)) {
+				   ind_bufp->index < cur_max_ind_descs)) {
 		lpar_rc = ibmvnic_tx_scrq_flush(adapter, tx_scrq, true);
 		if (lpar_rc != H_SUCCESS)
 			goto tx_err;
@@ -4006,7 +4037,7 @@ static void release_sub_crq_queue(struct ibmvnic_adapter *adapter,
 	}
 
 	dma_free_coherent(dev,
-			  IBMVNIC_IND_ARR_SZ,
+			  IBMVNIC_IND_MAX_ARR_SZ,
 			  scrq->ind_buf.indir_arr,
 			  scrq->ind_buf.indir_dma);
 
@@ -4063,7 +4094,7 @@ static struct ibmvnic_sub_crq_queue *init_sub_crq_queue(struct ibmvnic_adapter
 
 	scrq->ind_buf.indir_arr =
 		dma_alloc_coherent(dev,
-				   IBMVNIC_IND_ARR_SZ,
+				   IBMVNIC_IND_MAX_ARR_SZ,
 				   &scrq->ind_buf.indir_dma,
 				   GFP_KERNEL);
 
@@ -6369,6 +6400,19 @@ static int ibmvnic_reset_init(struct ibmvnic_adapter *adapter, bool reset)
 			rc = reset_sub_crq_queues(adapter);
 		}
 	} else {
+		if (adapter->reset_reason == VNIC_RESET_MOBILITY) {
+			/* After an LPM, reset the max number of indirect
+			 * subcrq descriptors per H_SEND_SUB_CRQ_INDIRECT
+			 * hcall to the default max (e.g POWER8 -> POWER10)
+			 *
+			 * If the new destination platform does not support
+			 * the higher limit max (e.g. POWER10-> POWER8 LPM)
+			 * H_PARAMETER will trigger automatic fallback to the
+			 * safe minimium limit.
+			 */
+			adapter->cur_max_ind_descs = IBMVNIC_MAX_IND_DESCS;
+		}
+
 		rc = init_sub_crqs(adapter);
 	}
 
@@ -6520,6 +6564,7 @@ static int ibmvnic_probe(struct vio_dev *dev, const struct vio_device_id *id)
 
 	adapter->wait_for_reset = false;
 	adapter->last_reset_time = jiffies;
+	adapter->cur_max_ind_descs = IBMVNIC_MAX_IND_DESCS;
 
 	rc = register_netdev(netdev);
 	if (rc) {
diff --git a/drivers/net/ethernet/ibm/ibmvnic.h b/drivers/net/ethernet/ibm/ibmvnic.h
index 246ddce753f9..480dc587078f 100644
--- a/drivers/net/ethernet/ibm/ibmvnic.h
+++ b/drivers/net/ethernet/ibm/ibmvnic.h
@@ -29,8 +29,9 @@
 #define IBMVNIC_BUFFS_PER_POOL	100
 #define IBMVNIC_MAX_QUEUES	16
 #define IBMVNIC_MAX_QUEUE_SZ   4096
-#define IBMVNIC_MAX_IND_DESCS  16
-#define IBMVNIC_IND_ARR_SZ	(IBMVNIC_MAX_IND_DESCS * 32)
+#define IBMVNIC_MAX_IND_DESCS 128
+#define IBMVNIC_SAFE_IND_DESC 16
+#define IBMVNIC_IND_MAX_ARR_SZ (IBMVNIC_MAX_IND_DESCS * 32)
 
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


