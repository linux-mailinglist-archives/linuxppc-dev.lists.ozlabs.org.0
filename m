Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5D12CA785
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 16:58:25 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ClmwZ49ZSzDr13
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 02:58:22 +1100 (AEDT)
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
 header.s=pp1 header.b=g1I6hVOV; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Clmq94K8tzDqrM
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Dec 2020 02:53:41 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B1FY2f5030876; Tue, 1 Dec 2020 10:53:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=IBKM0Df/EFcfWmcCVwG4DN99odCfjQv2QLF0wy5UHvk=;
 b=g1I6hVOV8ANq0jx/0LK7Oy9v8r8BDnOKkMF9sj/CyL1pjsL5Obpu+tuodqCY0pUKftHL
 cpWq33ovg2s6jQ9PjCeF6VIWRGLUtWIAtgXSezTKKobqjZIDSulHDmySMBKnVTjXa65r
 qSp5N+BZyhNYnoZX8eVLA9OU+bEkULfs9mmKvhI/4AzVvulo6Jv4j123LIXZi931CAEf
 xOMYl468XFN2yn57Ytv7ax7mB6ALPUAtjcmd66SJ4sL0H3iSzNXTEzDkyFVY4iCsFVRi
 qPhjaxq07XQ2AHa7FXB2EUhnyfmIAX9U2+BctCo/kq0hWPP8fCNiHqnuUkT/00A+vJtI OQ== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 355jjnndt9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Dec 2020 10:53:38 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B1FX5Ug007300;
 Tue, 1 Dec 2020 15:53:37 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma01wdc.us.ibm.com with ESMTP id 353e69332r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Dec 2020 15:53:37 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B1FqMqt25297212
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Dec 2020 15:52:22 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E4B49AE062;
 Tue,  1 Dec 2020 15:52:21 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BB19BAE060;
 Tue,  1 Dec 2020 15:52:20 +0000 (GMT)
Received: from oc7186267434.ibm.com (unknown [9.160.5.242])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  1 Dec 2020 15:52:20 +0000 (GMT)
From: Thomas Falcon <tlfalcon@linux.ibm.com>
To: kuba@kernel.org
Subject: [PATCH net v3 1/2] ibmvnic: Ensure that SCRQ entry reads are
 correctly ordered
Date: Tue,  1 Dec 2020 09:52:10 -0600
Message-Id: <1606837931-22676-2-git-send-email-tlfalcon@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1606837931-22676-1-git-send-email-tlfalcon@linux.ibm.com>
References: <1606837931-22676-1-git-send-email-tlfalcon@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-01_07:2020-11-30,
 2020-12-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=1 spamscore=0 bulkscore=0 adultscore=0 mlxscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 mlxlogscore=999
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012010099
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
 netdev@vger.kernel.org, brking@linux.vnet.ibm.com, sukadev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ensure that received Subordinate Command-Response Queue (SCRQ)
entries are properly read in order by the driver. These queues
are used in the ibmvnic device to process RX buffer and TX completion
descriptors. dma_rmb barriers have been added after checking for a
pending descriptor to ensure the correct descriptor entry is checked
and after reading the SCRQ descriptor to ensure the entire
descriptor is read before processing.

Fixes: 032c5e82847a ("Driver for IBM System i/p VNIC protocol")
Signed-off-by: Thomas Falcon <tlfalcon@linux.ibm.com>
---
 drivers/net/ethernet/ibm/ibmvnic.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
index 2aa40b2..5ea9f5c 100644
--- a/drivers/net/ethernet/ibm/ibmvnic.c
+++ b/drivers/net/ethernet/ibm/ibmvnic.c
@@ -2403,6 +2403,12 @@ static int ibmvnic_poll(struct napi_struct *napi, int budget)
 
 		if (!pending_scrq(adapter, adapter->rx_scrq[scrq_num]))
 			break;
+		/* The queue entry at the current index is peeked at above
+		 * to determine that there is a valid descriptor awaiting
+		 * processing. We want to be sure that the current slot
+		 * holds a valid descriptor before reading its contents.
+		 */
+		dma_rmb();
 		next = ibmvnic_next_scrq(adapter, adapter->rx_scrq[scrq_num]);
 		rx_buff =
 		    (struct ibmvnic_rx_buff *)be64_to_cpu(next->
@@ -3098,6 +3104,13 @@ static int ibmvnic_complete_tx(struct ibmvnic_adapter *adapter,
 		unsigned int pool = scrq->pool_index;
 		int num_entries = 0;
 
+		/* The queue entry at the current index is peeked at above
+		 * to determine that there is a valid descriptor awaiting
+		 * processing. We want to be sure that the current slot
+		 * holds a valid descriptor before reading its contents.
+		 */
+		dma_rmb();
+
 		next = ibmvnic_next_scrq(adapter, scrq);
 		for (i = 0; i < next->tx_comp.num_comps; i++) {
 			if (next->tx_comp.rcs[i]) {
@@ -3498,6 +3511,11 @@ static union sub_crq *ibmvnic_next_scrq(struct ibmvnic_adapter *adapter,
 	}
 	spin_unlock_irqrestore(&scrq->lock, flags);
 
+	/* Ensure that the entire buffer descriptor has been
+	 * loaded before reading its contents
+	 */
+	dma_rmb();
+
 	return entry;
 }
 
-- 
1.8.3.1

