Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC8A2B899E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Nov 2020 02:32:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cc2H0125QzDqN0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Nov 2020 12:32:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tlfalcon@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=nGakTAI0; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cc1rX1gkQzDqdL
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Nov 2020 12:12:59 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AJ11idc021075; Wed, 18 Nov 2020 20:12:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=UjK1G+7TbmzZ9u3BrM1GaACBcldFMnTWRNTPHZhHRIo=;
 b=nGakTAI0JS4LUHsJ6fGU5Cr7Z9Pwc7Y1Kl8ZAaPCDZDjqB1C5WOg7W1DMYOx7gvV75Ec
 V5NCZjSvflT6MflO9B7lpVhM71ePnXqkYOHFt4YCK3/9GkAMZsrxyhSt//i0uS+dLqQv
 JDyDDSfowF9QJAh6cbYaGHWA1PwccuUKVlUsurwulZV/niFWF/SJuBoh3qk94eSw4t0X
 gnK9yX15v81Q9LtwfWbvfSfQ3CLh2VMc3UPI2mdKatOlQRUzFJcQIApR4tkIOy0vevul
 7HXN0tRDq/g0f2jroFoZtxhvpb4zkvjTpSZxe990gKSPrgPa+ydfeGeom5vsZN5BhjTb hA== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34wc6s3r48-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Nov 2020 20:12:55 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AJ1CiFQ013789;
 Thu, 19 Nov 2020 01:12:55 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma02dal.us.ibm.com with ESMTP id 34vgjmp43d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Nov 2020 01:12:55 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AJ1CrSH27132304
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Nov 2020 01:12:53 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1EE296A04D;
 Thu, 19 Nov 2020 01:12:53 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 420046A04F;
 Thu, 19 Nov 2020 01:12:51 +0000 (GMT)
Received: from oc7186267434.ibm.com (unknown [9.65.199.179])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 19 Nov 2020 01:12:51 +0000 (GMT)
From: Thomas Falcon <tlfalcon@linux.ibm.com>
To: kuba@kernel.org
Subject: [PATCH net-next v2 7/9] ibmvnic: Correctly re-enable interrupts in
 NAPI polling routine
Date: Wed, 18 Nov 2020 19:12:23 -0600
Message-Id: <1605748345-32062-8-git-send-email-tlfalcon@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1605748345-32062-1-git-send-email-tlfalcon@linux.ibm.com>
References: <1605748345-32062-1-git-send-email-tlfalcon@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-18_10:2020-11-17,
 2020-11-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 impostorscore=0 mlxlogscore=891
 adultscore=0 lowpriorityscore=0 suspectscore=1 bulkscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
index 85df91c9861b..596546f0614d 100644
--- a/drivers/net/ethernet/ibm/ibmvnic.c
+++ b/drivers/net/ethernet/ibm/ibmvnic.c
@@ -2450,10 +2450,17 @@ static void remove_buff_from_pool(struct ibmvnic_adapter *adapter,
 
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
@@ -2466,14 +2473,14 @@ static int ibmvnic_poll(struct napi_struct *napi, int budget)
 
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
-		next = ibmvnic_next_scrq(adapter, adapter->rx_scrq[scrq_num]);
+		next = ibmvnic_next_scrq(adapter, rx_scrq);
 		rx_buff =
 		    (struct ibmvnic_rx_buff *)be64_to_cpu(next->
 							  rx_comp.correlator);
@@ -2532,14 +2539,16 @@ static int ibmvnic_poll(struct napi_struct *napi, int budget)
 
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

