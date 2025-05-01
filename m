Return-Path: <linuxppc-dev+bounces-8229-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF82CAA6452
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 May 2025 21:50:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZpPm56Hfqz3bjG;
	Fri,  2 May 2025 05:50:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746129013;
	cv=none; b=ii7fAW5mEs4/Gu4BAuyC/2e39s56PCcJuoPMe6P7ZwF8p0uBkxVbrgu35+vubtkX8eOZnhPjENNJ1bR88K7q1hHLcvUNCr76dZWpz1vq6VQbrxm/UUDLoI9PAvsw2yflodfoyH+A2G4/KfQnipRD8N1b283ue8Ze2+BbAr6T3hSLU2L/TK9ccCxf83uqyiE0q4zisrd0fWRZfqydiFznQwGk6x6eKciNNbTWopr34LNpNi2N6g9STUqU0A+ZwAn41MBPqa++LOJz1ZiZa5PTnvEaIjm8k0b9ksxcxQjVDE9IlyajuoZuXkup2+MJuK11dRYU0tcMhNQ/Sp19OD3mOA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746129013; c=relaxed/relaxed;
	bh=jv8duKOe5m4ZcxCT4PVebURlgI+c9MBZpeSO+6h25S0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lji8BTQzw1kcv5KE0o+2dmZJc/mcZr7AGkZ+HuieYvGiLOPVRYY7Wk9lPO/Gq4VOdXCGQLuzy0drx7Rw+jKoBShgZdVXN5/hpZQekrLuPGEkzj6O0IkjP0uec8aVr1NkU/p1G4TAf/5m6dYtRPpm1ztjFjmOMIosKlTGvThIxuSA+a8gg5pDuRPiEq2hQpSyHeuTbklgY9CdgvvFL/3k0lFogXTWiVP/a8grG+QL3dXcltNJ3gwvJbHf/Pn7+y5O1bnud5QnYUjbt8jlIGX6R8lYOneUsFalF2Ctptx1jbAYbxU/hzfCI926YWv73YwJJS48XUFwdPeotra538qaqw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZLrOTLrN; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=davemarq@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZLrOTLrN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=davemarq@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZpPm36Ymbz30DP
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 May 2025 05:50:11 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 541JUgQI005593;
	Thu, 1 May 2025 19:49:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=jv8duKOe5m4ZcxCT4
	PVebURlgI+c9MBZpeSO+6h25S0=; b=ZLrOTLrNgAU8AcaqxPa0RID97XuMMpMcc
	aADnrDGHGIBAu4Xyc362aof0sX4jNpoij0TA6/sg6WdtF7mmTZot7KwgoapVxnxm
	IkiKG/KuJ7MwCUbLNPZgHhmEwWpg578ZXDldzwBDNXG7RN56tZEc2xdcut7ni9YI
	vn0M/Y5b6eOZmZLLiR5BzlBJU8NZjiK3nbffKt5xyNt7qyI2pI6qK6lKGJ1V0Adj
	ztzqbuTnPAMe8oDp6PsQk4aSoujYdQYLmuaSvx+RdeOzKsIiTH4cLZC6+6FeF9m9
	9QQ0IvbtuBwZQRF1NdzmaDejCol1qEWrTgr33DKciyyBHUP0KvdZQ==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46bv0vvw57-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 May 2025 19:49:56 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 541HIJOw001880;
	Thu, 1 May 2025 19:49:56 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 469bamxkbf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 May 2025 19:49:56 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 541Jntda26870448
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 1 May 2025 19:49:55 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B8B3058059;
	Thu,  1 May 2025 19:49:55 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 54E6F58053;
	Thu,  1 May 2025 19:49:55 +0000 (GMT)
Received: from d.austin.ibm.com (unknown [9.41.102.181])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  1 May 2025 19:49:55 +0000 (GMT)
From: Dave Marquardt <davemarq@linux.ibm.com>
To: netdev@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org, michal.swiatkowski@linux.intel.com,
        horms@kernel.org, kuba@kernel.org,
        Dave Marquardt <davemarq@linux.ibm.com>
Subject: [PATCH v4 1/3] net: ibmveth: Indented struct ibmveth_adapter correctly
Date: Thu,  1 May 2025 14:49:42 -0500
Message-ID: <20250501194944.283729-2-davemarq@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=LJlmQIW9 c=1 sm=1 tr=0 ts=6813d064 cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=QyXUC8HyAAAA:8 a=VwQbUJbxAAAA:8 a=tDx_pM9AtCVaZWMooBsA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAxMDE1MCBTYWx0ZWRfX7pMj8TdM0Qxp YFkZmb9dBOyiX/p1xmSj3zUiV1J8qu3XWxDUoobypjVeNI6JrJqHrANgaFS2Lsx6jSwQQmCYfeS AgKh4yG0IXuf+2a7KFbrn1OBz9oVqM67/JbPEDhao1eNC1UIRn325uQ0m+Lyj1Drt3kp0uA0Njl
 N32gomBZ5yheL3fKbkQa2re8+jFxw4Dr88Pp/JzIhMmftF448Ht1vWh9uv7aGcTHfsALmvzuQvX lZVEQmToFsK2e+YADRRNCQ1CG8DE1XcrpRoD9Kdbhq87vb7WW+JEeEAjFqGV00V8GZqOh7PxBN1 BUyJ1uhp0BBCaFS31AKnowxqhm2mg4/6gRcpFqlZb3KIIeC42Y0FCYsJ+CGSk+OG2YwfMYzivya
 q9BsexdHYXktnl8vJ+WTXenmirOG60X3jTRx650rcq62Z+IQUcXCGCerkFFJowCOJCHLa/dK
X-Proofpoint-ORIG-GUID: eyxWl2G26zI7838ACUK8MqfcukYUw6Xw
X-Proofpoint-GUID: eyxWl2G26zI7838ACUK8MqfcukYUw6Xw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0
 lowpriorityscore=0 mlxscore=0 priorityscore=1501 adultscore=0 phishscore=0
 clxscore=1015 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505010150
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Made struct ibmveth_adapter follow indentation rules

Signed-off-by: Dave Marquardt <davemarq@linux.ibm.com>
Reviewed-by: Michal Swiatkowski <michal.swiatkowski@linux.intel.com>
Reviewed-by: Simon Horman <horms@kernel.org>
---
 drivers/net/ethernet/ibm/ibmveth.h | 64 +++++++++++++++---------------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/drivers/net/ethernet/ibm/ibmveth.h b/drivers/net/ethernet/ibm/ibmveth.h
index 8468e2c59d7a..0f72ce54e7cf 100644
--- a/drivers/net/ethernet/ibm/ibmveth.h
+++ b/drivers/net/ethernet/ibm/ibmveth.h
@@ -134,38 +134,38 @@ struct ibmveth_rx_q {
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


