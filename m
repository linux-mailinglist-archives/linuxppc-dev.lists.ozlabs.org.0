Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B1624463A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Aug 2020 10:11:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BSbkJ2w9qzDqkD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Aug 2020 18:11:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ljp@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=QW68ifFv; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BSbbz0XJNzDqlQ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Aug 2020 18:06:06 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07E83ii2036137; Fri, 14 Aug 2020 04:06:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=NsfJGMR2MfwEEB1xinhwp5fiwTAL2W92XoiCt1dXzEs=;
 b=QW68ifFvLlj8Gw9dvuyIHgU4RDOL/Hb0JOWzFA+VvuxgMA5YeLqfI+F+3OuZcthksJ+O
 hj7bJcyX/ecNdzvXCZQhbD71pXQB9iNihj49Bn5dPpwkFtVBIbQRbIOBgAEIXA+L4Dhm
 pfd/sDlr/19YqcTKqRKZ54dTQu7aAjC7JPXjM0zjFF7SizfuiOvLi/JkU5DQ6p0eykhW
 bD5okDnU27BvQa565+78s5//sN/1BMCfMOPfhWetRshvSsmXCZ7tU3XFyy/ilxSf9HcM
 fEhlhFaXHRzBIr3QOVgh04ziGgNJiN/rsmVQO70LSWYmCTpRlKWuB2rOFnJnYqknIkEy 7w== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32w5mx4u4v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Aug 2020 04:06:04 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07E7sYkO015822;
 Fri, 14 Aug 2020 07:59:25 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma01wdc.us.ibm.com with ESMTP id 32skp9rj2a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Aug 2020 07:59:25 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07E7xPci52298210
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Aug 2020 07:59:25 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 361FCAC059;
 Fri, 14 Aug 2020 07:59:25 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CAA0DAC05B;
 Fri, 14 Aug 2020 07:59:24 +0000 (GMT)
Received: from pompom.ibm.com (unknown [9.160.68.30])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 14 Aug 2020 07:59:24 +0000 (GMT)
From: Lijun Pan <ljp@linux.ibm.com>
To: netdev@vger.kernel.org
Subject: [PATCH net 5/5] ibmvnic: merge ibmvnic_reset_init and ibmvnic_init
Date: Fri, 14 Aug 2020 02:59:21 -0500
Message-Id: <20200814075921.88745-6-ljp@linux.ibm.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200814075921.88745-1-ljp@linux.ibm.com>
References: <20200814075921.88745-1-ljp@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-14_04:2020-08-14,
 2020-08-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 suspectscore=1 clxscore=1015 impostorscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2008140060
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
Cc: Lijun Pan <ljp@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

These two functions share the majority of the code, hence merge
them together. In the meanwhile, add a reset pass-in parameter
to differentiate them. Thus, the code is easier to read and to tell
the difference between reset_init and regular init.

Signed-off-by: Lijun Pan <ljp@linux.ibm.com>
---
 drivers/net/ethernet/ibm/ibmvnic.c | 65 ++++++------------------------
 1 file changed, 13 insertions(+), 52 deletions(-)

diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
index 280358dce8ba..c92615b74833 100644
--- a/drivers/net/ethernet/ibm/ibmvnic.c
+++ b/drivers/net/ethernet/ibm/ibmvnic.c
@@ -104,8 +104,7 @@ static int send_login(struct ibmvnic_adapter *adapter);
 static void send_cap_queries(struct ibmvnic_adapter *adapter);
 static int init_sub_crqs(struct ibmvnic_adapter *);
 static int init_sub_crq_irqs(struct ibmvnic_adapter *adapter);
-static int ibmvnic_init(struct ibmvnic_adapter *);
-static int ibmvnic_reset_init(struct ibmvnic_adapter *);
+static int ibmvnic_reset_init(struct ibmvnic_adapter *, bool reset);
 static void release_crq_queue(struct ibmvnic_adapter *);
 static int __ibmvnic_set_mac(struct net_device *, u8 *);
 static int init_crq_queue(struct ibmvnic_adapter *adapter);
@@ -1868,7 +1867,7 @@ static int do_change_param_reset(struct ibmvnic_adapter *adapter,
 		return rc;
 	}
 
-	rc = ibmvnic_reset_init(adapter);
+	rc = ibmvnic_reset_init(adapter, true);
 	if (rc)
 		return IBMVNIC_INIT_FAILED;
 
@@ -1986,7 +1985,7 @@ static int do_reset(struct ibmvnic_adapter *adapter,
 			goto out;
 		}
 
-		rc = ibmvnic_reset_init(adapter);
+		rc = ibmvnic_reset_init(adapter, true);
 		if (rc) {
 			rc = IBMVNIC_INIT_FAILED;
 			goto out;
@@ -2093,7 +2092,7 @@ static int do_hard_reset(struct ibmvnic_adapter *adapter,
 		return rc;
 	}
 
-	rc = ibmvnic_init(adapter);
+	rc = ibmvnic_reset_init(adapter, false);
 	if (rc)
 		return rc;
 
@@ -4970,7 +4969,7 @@ static int init_crq_queue(struct ibmvnic_adapter *adapter)
 	return retrc;
 }
 
-static int ibmvnic_reset_init(struct ibmvnic_adapter *adapter)
+static int ibmvnic_reset_init(struct ibmvnic_adapter *adapter, bool reset)
 {
 	struct device *dev = &adapter->vdev->dev;
 	unsigned long timeout = msecs_to_jiffies(30000);
@@ -4979,10 +4978,12 @@ static int ibmvnic_reset_init(struct ibmvnic_adapter *adapter)
 
 	adapter->from_passive_init = false;
 
-	old_num_rx_queues = adapter->req_rx_queues;
-	old_num_tx_queues = adapter->req_tx_queues;
+	if (reset) {
+		old_num_rx_queues = adapter->req_rx_queues;
+		old_num_tx_queues = adapter->req_tx_queues;
+		reinit_completion(&adapter->init_done);
+	}
 
-	reinit_completion(&adapter->init_done);
 	adapter->init_done_rc = 0;
 	rc = ibmvnic_send_crq_init(adapter);
 	if (rc) {
@@ -5000,7 +5001,8 @@ static int ibmvnic_reset_init(struct ibmvnic_adapter *adapter)
 		return adapter->init_done_rc;
 	}
 
-	if (test_bit(0, &adapter->resetting) && !adapter->wait_for_reset &&
+	if (reset &&
+	    test_bit(0, &adapter->resetting) && !adapter->wait_for_reset &&
 	    adapter->reset_reason != VNIC_RESET_MOBILITY) {
 		if (adapter->req_rx_queues != old_num_rx_queues ||
 		    adapter->req_tx_queues != old_num_tx_queues) {
@@ -5028,47 +5030,6 @@ static int ibmvnic_reset_init(struct ibmvnic_adapter *adapter)
 	return rc;
 }
 
-static int ibmvnic_init(struct ibmvnic_adapter *adapter)
-{
-	struct device *dev = &adapter->vdev->dev;
-	unsigned long timeout = msecs_to_jiffies(30000);
-	int rc;
-
-	adapter->from_passive_init = false;
-
-	adapter->init_done_rc = 0;
-	rc = ibmvnic_send_crq_init(adapter);
-	if (rc) {
-		dev_err(dev, "%s: Send crq init failed with error %d\n", __func__, rc);
-		return rc;
-	}
-
-	if (!wait_for_completion_timeout(&adapter->init_done, timeout)) {
-		dev_err(dev, "Initialization sequence timed out\n");
-		return -1;
-	}
-
-	if (adapter->init_done_rc) {
-		release_crq_queue(adapter);
-		return adapter->init_done_rc;
-	}
-
-	rc = init_sub_crqs(adapter);
-	if (rc) {
-		dev_err(dev, "Initialization of sub crqs failed\n");
-		release_crq_queue(adapter);
-		return rc;
-	}
-
-	rc = init_sub_crq_irqs(adapter);
-	if (rc) {
-		dev_err(dev, "Failed to initialize sub crq irqs\n");
-		release_crq_queue(adapter);
-	}
-
-	return rc;
-}
-
 static struct device_attribute dev_attr_failover;
 
 static int ibmvnic_probe(struct vio_dev *dev, const struct vio_device_id *id)
@@ -5131,7 +5092,7 @@ static int ibmvnic_probe(struct vio_dev *dev, const struct vio_device_id *id)
 			goto ibmvnic_init_fail;
 		}
 
-		rc = ibmvnic_init(adapter);
+		rc = ibmvnic_reset_init(adapter, false);
 		if (rc && rc != EAGAIN)
 			goto ibmvnic_init_fail;
 	} while (rc == EAGAIN);
-- 
2.23.0

