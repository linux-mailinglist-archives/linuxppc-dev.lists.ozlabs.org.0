Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3B22B0E0D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Nov 2020 20:30:10 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CXBWg5Kv7zDqs8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Nov 2020 06:30:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=tlfalcon@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=OyQcvvAA; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CXB593CRmzDqrT
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Nov 2020 06:10:37 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0ACJ3L91189212; Thu, 12 Nov 2020 14:10:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=22iEbyHcksRTaVOTux7kjaif80Xc0DapVVPnvXtImok=;
 b=OyQcvvAAWEwr/H6aPAqDRt2SbXmgQ8oHlirsdFaUCxevF5lLJAqy8QgzhUlkeM2pFsCy
 MR6xTUFLkSxMmbOZDwgTAEsb5iLvYJsDTOdCMKLl7YM+ftXx6xqQ/wEanvCyOWtxvuiy
 r1JALOFzhEfYvzdH6zgcd6/04GB1US1HqaBXAVUv1zZdsMKnNsFuDaffs+xSaP5q1wdu
 8E6vtmO1fZgOkhRBTuDYMZnxRhhCPZNdtFxARfpQJuSRFc3iY5AamRtFQYpyFzjP0VsT
 +pXW5fNvU01W+2akL7VhHpbEx7d3Qok90JpqwLg3mgMKRucGbuzYTmik7sLCqgmD2LOP 9w== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34s5jwv651-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Nov 2020 14:10:34 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0ACJ8BUm016294;
 Thu, 12 Nov 2020 19:10:34 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma01dal.us.ibm.com with ESMTP id 34nk7b013m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Nov 2020 19:10:34 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0ACJAWW67340556
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Nov 2020 19:10:32 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 20D71AE07D;
 Thu, 12 Nov 2020 19:10:32 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2C83EAE08E;
 Thu, 12 Nov 2020 19:10:31 +0000 (GMT)
Received: from oc7186267434.ibm.com (unknown [9.160.10.22])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 12 Nov 2020 19:10:31 +0000 (GMT)
From: Thomas Falcon <tlfalcon@linux.ibm.com>
To: netdev@vger.kernel.org
Subject: [PATCH net-next 10/12] ibmvnic: Correctly re-enable interrupts in
 NAPI polling routine
Date: Thu, 12 Nov 2020 13:10:05 -0600
Message-Id: <1605208207-1896-11-git-send-email-tlfalcon@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1605208207-1896-1-git-send-email-tlfalcon@linux.ibm.com>
References: <1605208207-1896-1-git-send-email-tlfalcon@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-12_10:2020-11-12,
 2020-11-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=897
 suspectscore=1 spamscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011120112
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

If the current NAPI polling loop exits without completing it's
budget, only re-enable interrupts if there are no entries remaining
in the queue and napi_complete_done is successful. If there are entries
remaining on the queue that were missed, restart the polling loop.

Signed-off-by: Dwip N. Banerjee <dnbanerg@us.ibm.com>
---
 drivers/net/ethernet/ibm/ibmvnic.c | 37 +++++++++++++++++++-----------
 1 file changed, 23 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
index dc42bdc6d3e1..e48a44d8884c 100644
--- a/drivers/net/ethernet/ibm/ibmvnic.c
+++ b/drivers/net/ethernet/ibm/ibmvnic.c
@@ -2387,10 +2387,17 @@ static void remove_buff_from_pool(struct ibmvnic_adapter *adapter,
 
 static int ibmvnic_poll(struct napi_struct *napi, int budget)
 {
-	struct net_device *netdev = napi->dev;
-	struct ibmvnic_adapter *adapter = netdev_priv(netdev);
-	int scrq_num = (int)(napi - adapter->napi);
-	int frames_processed = 0;
+	struct ibmvnic_sub_crq_queue *rx_scrq;
+	struct ibmvnic_adapter *adapter;
+	struct net_device *netdev;
+	int frames_processed;
+	int scrq_num;
+
+	netdev = napi->dev;
+	adapter = netdev_priv(netdev);
+	scrq_num = (int)(napi - adapter->napi);
+	frames_processed = 0;
+	rx_scrq = adapter->rx_scrq[scrq_num];
 
 restart_poll:
 	while (frames_processed < budget) {
@@ -2403,16 +2410,16 @@ static int ibmvnic_poll(struct napi_struct *napi, int budget)
 
 		if (unlikely(test_bit(0, &adapter->resetting) &&
 			     adapter->reset_reason != VNIC_RESET_NON_FATAL)) {
-			enable_scrq_irq(adapter, adapter->rx_scrq[scrq_num]);
+			enable_scrq_irq(adapter, rx_scrq);
 			napi_complete_done(napi, frames_processed);
 			return frames_processed;
 		}
 
-		if (!pending_scrq(adapter, adapter->rx_scrq[scrq_num]))
+		if (!pending_scrq(adapter, rx_scrq))
 			break;
 		/* ensure that we do not prematurely exit the polling loop */
 		dma_rmb();
-		next = ibmvnic_next_scrq(adapter, adapter->rx_scrq[scrq_num]);
+		next = ibmvnic_next_scrq(adapter, rx_scrq);
 		rx_buff =
 		    (struct ibmvnic_rx_buff *)be64_to_cpu(next->
 							  rx_comp.correlator);
@@ -2471,14 +2478,16 @@ static int ibmvnic_poll(struct napi_struct *napi, int budget)
 
 	if (adapter->state != VNIC_CLOSING)
 		replenish_rx_pool(adapter, &adapter->rx_pool[scrq_num]);
-
 	if (frames_processed < budget) {
-		enable_scrq_irq(adapter, adapter->rx_scrq[scrq_num]);
-		napi_complete_done(napi, frames_processed);
-		if (pending_scrq(adapter, adapter->rx_scrq[scrq_num]) &&
-		    napi_reschedule(napi)) {
-			disable_scrq_irq(adapter, adapter->rx_scrq[scrq_num]);
-			goto restart_poll;
+		if (napi_complete_done(napi, frames_processed)) {
+			enable_scrq_irq(adapter, rx_scrq);
+			if (pending_scrq(adapter, rx_scrq)) {
+				rmb();
+				if (napi_reschedule(napi)) {
+					disable_scrq_irq(adapter, rx_scrq);
+					goto restart_poll;
+				}
+			}
 		}
 	}
 	return frames_processed;
-- 
2.26.2

