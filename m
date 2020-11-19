Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8452B896D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Nov 2020 02:19:12 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cc1zc5LgmzDqdS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Nov 2020 12:19:08 +1100 (AEDT)
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
 header.s=pp1 header.b=dmnsxzS7; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cc1rH4NFVzDqdc
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Nov 2020 12:12:47 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AJ11daA055059; Wed, 18 Nov 2020 20:12:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=EJBEyOkIh8tKc7bimq9/HeD6q4q76kj4tjXXsKXfZ0M=;
 b=dmnsxzS7rEBhykaaD0LMjqoZt9C76DoEJ5suWvtld6Kd5OCXpf0Odm0XZmo3otU4J1F8
 SHr5KM+2plnGQsLuSC5qMz5c36JpZLK9WPs7ES4Fvp/PqG+ag//yidMIT145jmM6n4l5
 GpfYs7IHYa07lLvY/y+QsCWCQReMxfA5enizq/ssjyqK/lkyLs58jYRL175oqBJX2KsA
 Siq/ASiCCNMrH4E5LfcWoxRTqR9X4C0su19Vh1sRzsIIw+cfWzVaCjS9IYj5UbI1sc2I
 t0Smb+QtOadvgiApY2VYANEwG3ZF9ef69kzDTpSuw2tEUPXEOmC5AvjoeHuKVXycfTgG Iw== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34w8pc26vj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Nov 2020 20:12:43 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AJ1CQSq008189;
 Thu, 19 Nov 2020 01:12:42 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma04dal.us.ibm.com with ESMTP id 34t6v9k6mb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Nov 2020 01:12:42 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AJ1CYc329032814
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Nov 2020 01:12:34 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 753256A04D;
 Thu, 19 Nov 2020 01:12:40 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AE1726A051;
 Thu, 19 Nov 2020 01:12:38 +0000 (GMT)
Received: from oc7186267434.ibm.com (unknown [9.65.199.179])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 19 Nov 2020 01:12:38 +0000 (GMT)
From: Thomas Falcon <tlfalcon@linux.ibm.com>
To: kuba@kernel.org
Subject: [PATCH net-next v2 1/9] ibmvnic: Introduce indirect subordinate
 Command Response Queue buffer
Date: Wed, 18 Nov 2020 19:12:17 -0600
Message-Id: <1605748345-32062-2-git-send-email-tlfalcon@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1605748345-32062-1-git-send-email-tlfalcon@linux.ibm.com>
References: <1605748345-32062-1-git-send-email-tlfalcon@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-18_10:2020-11-17,
 2020-11-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 suspectscore=3 bulkscore=0 impostorscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011190000
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
Cc: cforno12@linux.ibm.com, netdev@vger.kernel.org, ljp@linux.vnet.ibm.com,
 ricklind@linux.ibm.com, dnbanerg@us.ibm.com, tlfalcon@linux.ibm.com,
 drt@linux.vnet.ibm.com, brking@linux.vnet.ibm.com, sukadev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch introduces the infrastructure to send batched subordinate
Command Response Queue descriptors, which are used by the ibmvnic
driver to send TX frame and RX buffer descriptors.

Signed-off-by: Thomas Falcon <tlfalcon@linux.ibm.com>
---
 drivers/net/ethernet/ibm/ibmvnic.c | 23 +++++++++++++++++++++++
 drivers/net/ethernet/ibm/ibmvnic.h |  9 +++++++++
 2 files changed, 32 insertions(+)

diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
index da15913879f8..3884f8a683a7 100644
--- a/drivers/net/ethernet/ibm/ibmvnic.c
+++ b/drivers/net/ethernet/ibm/ibmvnic.c
@@ -2858,6 +2858,7 @@ static int reset_one_sub_crq_queue(struct ibmvnic_adapter *adapter,
 	memset(scrq->msgs, 0, 4 * PAGE_SIZE);
 	atomic_set(&scrq->used, 0);
 	scrq->cur = 0;
+	scrq->ind_buf.index = 0;
 
 	rc = h_reg_sub_crq(adapter->vdev->unit_address, scrq->msg_token,
 			   4 * PAGE_SIZE, &scrq->crq_num, &scrq->hw_irq);
@@ -2909,6 +2910,11 @@ static void release_sub_crq_queue(struct ibmvnic_adapter *adapter,
 		}
 	}
 
+	dma_free_coherent(dev,
+			  IBMVNIC_IND_ARR_SZ,
+			  scrq->ind_buf.indir_arr,
+			  scrq->ind_buf.indir_dma);
+
 	dma_unmap_single(dev, scrq->msg_token, 4 * PAGE_SIZE,
 			 DMA_BIDIRECTIONAL);
 	free_pages((unsigned long)scrq->msgs, 2);
@@ -2955,6 +2961,17 @@ static struct ibmvnic_sub_crq_queue *init_sub_crq_queue(struct ibmvnic_adapter
 
 	scrq->adapter = adapter;
 	scrq->size = 4 * PAGE_SIZE / sizeof(*scrq->msgs);
+	scrq->ind_buf.index = 0;
+
+	scrq->ind_buf.indir_arr =
+		dma_alloc_coherent(dev,
+				   IBMVNIC_IND_ARR_SZ,
+				   &scrq->ind_buf.indir_dma,
+				   GFP_KERNEL);
+
+	if (!scrq->ind_buf.indir_arr)
+		goto indir_failed;
+
 	spin_lock_init(&scrq->lock);
 
 	netdev_dbg(adapter->netdev,
@@ -2963,6 +2980,12 @@ static struct ibmvnic_sub_crq_queue *init_sub_crq_queue(struct ibmvnic_adapter
 
 	return scrq;
 
+indir_failed:
+	do {
+		rc = plpar_hcall_norets(H_FREE_SUB_CRQ,
+					adapter->vdev->unit_address,
+					scrq->crq_num);
+	} while (rc == H_BUSY || rc == H_IS_LONG_BUSY(rc));
 reg_failed:
 	dma_unmap_single(dev, scrq->msg_token, 4 * PAGE_SIZE,
 			 DMA_BIDIRECTIONAL);
diff --git a/drivers/net/ethernet/ibm/ibmvnic.h b/drivers/net/ethernet/ibm/ibmvnic.h
index 217dcc7ded70..4a63e9886719 100644
--- a/drivers/net/ethernet/ibm/ibmvnic.h
+++ b/drivers/net/ethernet/ibm/ibmvnic.h
@@ -31,6 +31,8 @@
 #define IBMVNIC_BUFFS_PER_POOL	100
 #define IBMVNIC_MAX_QUEUES	16
 #define IBMVNIC_MAX_QUEUE_SZ   4096
+#define IBMVNIC_MAX_IND_DESCS  128
+#define IBMVNIC_IND_ARR_SZ	(IBMVNIC_MAX_IND_DESCS * 32)
 
 #define IBMVNIC_TSO_BUF_SZ	65536
 #define IBMVNIC_TSO_BUFS	64
@@ -861,6 +863,12 @@ union sub_crq {
 	struct ibmvnic_rx_buff_add_desc rx_add;
 };
 
+struct ibmvnic_ind_xmit_queue {
+	union sub_crq *indir_arr;
+	dma_addr_t indir_dma;
+	int index;
+};
+
 struct ibmvnic_sub_crq_queue {
 	union sub_crq *msgs;
 	int size, cur;
@@ -873,6 +881,7 @@ struct ibmvnic_sub_crq_queue {
 	spinlock_t lock;
 	struct sk_buff *rx_skb_top;
 	struct ibmvnic_adapter *adapter;
+	struct ibmvnic_ind_xmit_queue ind_buf;
 	atomic_t used;
 	char name[32];
 	u64 handle;
-- 
2.26.2

