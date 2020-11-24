Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9212C2E8D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 18:30:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CgWHZ3mX1zDqJc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 04:30:02 +1100 (AEDT)
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
 header.s=pp1 header.b=Yf8LMoBQ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CgWCb5L5lzDqcQ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 04:26:35 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AOH1u0s057647; Tue, 24 Nov 2020 12:26:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=jgPr9DpKUXRYYRM7d5HIgT94yT1HbuulKGlIcP83Pcg=;
 b=Yf8LMoBQ10UDYOty31iYeBprYIFBv0EI4Cf2weJQphBNGlejlKbYu3lEdkixwG68Hnmh
 KqY1tWG8aaUe3+0aNHWbiC8eBcV2Zp6oxInI0cSeu/HbstJJKdIesGtjXnq2W2hEQGFP
 qJLIyqRmiQSEd18uJyx7p119W2oQCPlM2Cdaj+atMCPvvOxbhoec8aDnfl9uYKYwgTya
 juoO0n+goYdOoWHXJQSaDvpx5Jwh8TvlgNQsRrZL3mR2LxmpbGuUpGT5//H9eWZEwcT7
 Rz7rLBCeG+VA6t80j4ancOzvtlPpJM3gCc20PDUx+c7vn07Szoj7IgbfFQJyd2/qHrwn jg== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3513uwe7p9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Nov 2020 12:26:32 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AOHN7uN022134;
 Tue, 24 Nov 2020 17:26:31 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma02dal.us.ibm.com with ESMTP id 34xth9yb30-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Nov 2020 17:26:31 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AOHQUn955181624
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 Nov 2020 17:26:30 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 178B36A057;
 Tue, 24 Nov 2020 17:26:30 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ECF276A047;
 Tue, 24 Nov 2020 17:26:27 +0000 (GMT)
Received: from oc7186267434.ibm.com (unknown [9.160.17.166])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 24 Nov 2020 17:26:27 +0000 (GMT)
From: Thomas Falcon <tlfalcon@linux.ibm.com>
To: netdev@vger.kernel.org
Subject: [PATCH net 1/2] ibmvnic: Ensure that SCRQ entry reads are correctly
 ordered
Date: Tue, 24 Nov 2020 11:26:15 -0600
Message-Id: <1606238776-30259-2-git-send-email-tlfalcon@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1606238776-30259-1-git-send-email-tlfalcon@linux.ibm.com>
References: <1606238776-30259-1-git-send-email-tlfalcon@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-24_04:2020-11-24,
 2020-11-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=1
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0
 mlxscore=0 mlxlogscore=999 clxscore=1015 impostorscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011240103
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

Ensure that received Subordinate Command-Response Queue (SCRQ)
entries are properly read in order by the driver. These queues
are used in the ibmvnic device to process RX buffer and TX completion
descriptors. dma_rmb barriers have been added after checking for a
pending descriptor to ensure the correct descriptor entry is checked
and after reading the SCRQ descriptor to ensure the entire
descriptor is read before processing.

Fixes: 032c5e828 ("Driver for IBM System i/p VNIC protocol")
Signed-off-by: Thomas Falcon <tlfalcon@linux.ibm.com>
---
 drivers/net/ethernet/ibm/ibmvnic.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
index 2aa40b2..489ed5e 100644
--- a/drivers/net/ethernet/ibm/ibmvnic.c
+++ b/drivers/net/ethernet/ibm/ibmvnic.c
@@ -2403,6 +2403,8 @@ static int ibmvnic_poll(struct napi_struct *napi, int budget)
 
 		if (!pending_scrq(adapter, adapter->rx_scrq[scrq_num]))
 			break;
+		/* ensure that we do not prematurely exit the polling loop */
+		dma_rmb();
 		next = ibmvnic_next_scrq(adapter, adapter->rx_scrq[scrq_num]);
 		rx_buff =
 		    (struct ibmvnic_rx_buff *)be64_to_cpu(next->
@@ -3098,6 +3100,9 @@ static int ibmvnic_complete_tx(struct ibmvnic_adapter *adapter,
 		unsigned int pool = scrq->pool_index;
 		int num_entries = 0;
 
+		/* ensure that the correct descriptor entry is read */
+		dma_rmb();
+
 		next = ibmvnic_next_scrq(adapter, scrq);
 		for (i = 0; i < next->tx_comp.num_comps; i++) {
 			if (next->tx_comp.rcs[i]) {
@@ -3498,6 +3503,9 @@ static union sub_crq *ibmvnic_next_scrq(struct ibmvnic_adapter *adapter,
 	}
 	spin_unlock_irqrestore(&scrq->lock, flags);
 
+	/* ensure that the entire SCRQ descriptor is read */
+	dma_rmb();
+
 	return entry;
 }
 
-- 
1.8.3.1

