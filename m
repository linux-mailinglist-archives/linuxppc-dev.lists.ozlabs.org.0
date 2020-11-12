Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8C22B0E00
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Nov 2020 20:26:38 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CXBRb3DykzDqhD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Nov 2020 06:26:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tlfalcon@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=KASA8SPl; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CXB580l1XzDqrT
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Nov 2020 06:10:35 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0ACJ4IQw047694; Thu, 12 Nov 2020 14:10:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=xoEui7mB+yB5Fx4LcLgEKL72eF4/IBHCznwS6I84zX8=;
 b=KASA8SPlrbWMN+hnJrFQ2m+NtTLBfS6Fsx4ya1QURrP65MlFkdqNQijvCfEbQAcbyg++
 ZyyTenpfUGnk43QAABBCLs6ry087ArjlzdXpVOEUp32tFdSd0Tm4yszLyTPH2EaVjoi+
 7JdnI3YXC5zfzICB9biSt/RZmZG+5UCW+6qBJfL1b3uNcMHRvhi4UdTGy+t5sCTuAwcn
 u/JbzWqQZ1RKN8P9wU9x6AizdsZCekuiwHj0U3SaqA2vvpX0kEZWE88HDo3QTYFqoQ1a
 nHnNeNWWaa/inFH4VveZ8eJjUI+o6Ni9kqgY1X0UT0y9qXlOUe9DMxfqUzNLiXow1JCM Sw== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34s9taa8wd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Nov 2020 14:10:33 -0500
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0ACJ700D011319;
 Thu, 12 Nov 2020 19:10:32 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma05wdc.us.ibm.com with ESMTP id 34nk79mv5t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Nov 2020 19:10:32 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0ACJAVnL8389274
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Nov 2020 19:10:31 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F3EE2AE081;
 Thu, 12 Nov 2020 19:10:30 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 121D3AE05C;
 Thu, 12 Nov 2020 19:10:30 +0000 (GMT)
Received: from oc7186267434.ibm.com (unknown [9.160.10.22])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 12 Nov 2020 19:10:29 +0000 (GMT)
From: Thomas Falcon <tlfalcon@linux.ibm.com>
To: netdev@vger.kernel.org
Subject: [PATCH net-next 09/12] ibmvnic: Ensure that device queue memory is
 cache-line aligned
Date: Thu, 12 Nov 2020 13:10:04 -0600
Message-Id: <1605208207-1896-10-git-send-email-tlfalcon@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1605208207-1896-1-git-send-email-tlfalcon@linux.ibm.com>
References: <1605208207-1896-1-git-send-email-tlfalcon@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-12_10:2020-11-12,
 2020-11-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 malwarescore=0 suspectscore=3 clxscore=1015 mlxscore=0
 spamscore=0 mlxlogscore=999 priorityscore=1501 phishscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011120112
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
Cc: cforno12@linux.ibm.com, ljp@linux.vnet.ibm.com, ricklind@linux.ibm.com,
 dnbanerg@us.ibm.com, tlfalcon@linux.ibm.com, drt@linux.vnet.ibm.com,
 brking@linux.vnet.ibm.com, sukadev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Dwip N. Banerjee" <dnbanerg@us.ibm.com>

PCI bus slowdowns were observed on IBM VNIC devices as a result
of partial cache line writes and non-cache aligned full cache line writes.
Ensure that packet data buffers are cache-line aligned to avoid these
slowdowns.

Signed-off-by: Dwip N. Banerjee <dnbanerg@us.ibm.com>
---
 drivers/net/ethernet/ibm/ibmvnic.c |  9 ++++++---
 drivers/net/ethernet/ibm/ibmvnic.h | 10 +++++-----
 2 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
index b2ca34e94078..dc42bdc6d3e1 100644
--- a/drivers/net/ethernet/ibm/ibmvnic.c
+++ b/drivers/net/ethernet/ibm/ibmvnic.c
@@ -498,7 +498,7 @@ static int reset_rx_pools(struct ibmvnic_adapter *adapter)
 
 		if (rx_pool->buff_size != buff_size) {
 			free_long_term_buff(adapter, &rx_pool->long_term_buff);
-			rx_pool->buff_size = buff_size;
+			rx_pool->buff_size = ALIGN(buff_size, L1_CACHE_BYTES);
 			rc = alloc_long_term_buff(adapter,
 						  &rx_pool->long_term_buff,
 						  rx_pool->size *
@@ -592,7 +592,7 @@ static int init_rx_pools(struct net_device *netdev)
 
 		rx_pool->size = adapter->req_rx_add_entries_per_subcrq;
 		rx_pool->index = i;
-		rx_pool->buff_size = buff_size;
+		rx_pool->buff_size = ALIGN(buff_size, L1_CACHE_BYTES);
 		rx_pool->active = 1;
 
 		rx_pool->free_map = kcalloc(rx_pool->size, sizeof(int),
@@ -745,6 +745,7 @@ static int init_tx_pools(struct net_device *netdev)
 {
 	struct ibmvnic_adapter *adapter = netdev_priv(netdev);
 	int tx_subcrqs;
+	u64 buff_size;
 	int i, rc;
 
 	tx_subcrqs = adapter->num_active_tx_scrqs;
@@ -761,9 +762,11 @@ static int init_tx_pools(struct net_device *netdev)
 	adapter->num_active_tx_pools = tx_subcrqs;
 
 	for (i = 0; i < tx_subcrqs; i++) {
+		buff_size = adapter->req_mtu + VLAN_HLEN;
+		buff_size = ALIGN(buff_size, L1_CACHE_BYTES);
 		rc = init_one_tx_pool(netdev, &adapter->tx_pool[i],
 				      adapter->req_tx_entries_per_subcrq,
-				      adapter->req_mtu + VLAN_HLEN);
+				      buff_size);
 		if (rc) {
 			release_tx_pools(adapter);
 			return rc;
diff --git a/drivers/net/ethernet/ibm/ibmvnic.h b/drivers/net/ethernet/ibm/ibmvnic.h
index c6f1842d2023..1e4c7702402b 100644
--- a/drivers/net/ethernet/ibm/ibmvnic.h
+++ b/drivers/net/ethernet/ibm/ibmvnic.h
@@ -884,7 +884,7 @@ struct ibmvnic_sub_crq_queue {
 	atomic_t used;
 	char name[32];
 	u64 handle;
-};
+} ____cacheline_aligned;
 
 struct ibmvnic_long_term_buff {
 	unsigned char *buff;
@@ -908,7 +908,7 @@ struct ibmvnic_tx_pool {
 	struct ibmvnic_long_term_buff long_term_buff;
 	int num_buffers;
 	int buf_size;
-};
+} ____cacheline_aligned;
 
 struct ibmvnic_rx_buff {
 	struct sk_buff *skb;
@@ -929,7 +929,7 @@ struct ibmvnic_rx_pool {
 	int next_alloc;
 	int active;
 	struct ibmvnic_long_term_buff long_term_buff;
-};
+} ____cacheline_aligned;
 
 struct ibmvnic_vpd {
 	unsigned char *buff;
@@ -1014,8 +1014,8 @@ struct ibmvnic_adapter {
 	atomic_t running_cap_crqs;
 	bool wait_capability;
 
-	struct ibmvnic_sub_crq_queue **tx_scrq;
-	struct ibmvnic_sub_crq_queue **rx_scrq;
+	struct ibmvnic_sub_crq_queue **tx_scrq ____cacheline_aligned;
+	struct ibmvnic_sub_crq_queue **rx_scrq ____cacheline_aligned;
 
 	/* rx structs */
 	struct napi_struct *napi;
-- 
2.26.2

