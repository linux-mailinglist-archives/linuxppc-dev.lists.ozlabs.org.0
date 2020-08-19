Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B2224A9C5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Aug 2020 00:59:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BX3Bc4CvnzDqxc
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Aug 2020 08:59:36 +1000 (AEST)
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
 header.s=pp1 header.b=lvXhdGnP; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BX32V2zvnzDqxb
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Aug 2020 08:52:34 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07JMXXeA121849; Wed, 19 Aug 2020 18:52:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=tNOqLGP6A+0qxqSMt8yMmP7gRFO6NdEi2uxox3wqz20=;
 b=lvXhdGnPakhQUZ4iorsItcfP335lguntQhNCcvrUdbEdsfCb6tJLYJKIjqvK40bfIKY+
 x2+t0los1uafDQ26A06mBpLXMX2zhEb3aFEEEjbTlRVgMC2xbbJtAZ51K7454CCj3BAp
 8NEbj8xMmedmE4Z40Lbmk0CFSOQQVEMGwEFBxv50CphHmI158QvfWOFf4iiBJlEDx3I9
 2pICuRBk9nmcY7GLdp4apcwKrt3OMm79XRxMJ7yPAsVDm9N2ZxDNAvIgNjWa8AfLNZ+O
 Cmr6yFSyobQQS6XH3IUjfPNx9hJ7V8KAc3AeMRzdk4fqQxRF2Z5odEWkjwALzjqD5yh2 ng== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3310eyrnvu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Aug 2020 18:52:32 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07JMoGlx000385;
 Wed, 19 Aug 2020 22:52:31 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma02wdc.us.ibm.com with ESMTP id 3304scyegr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Aug 2020 22:52:31 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07JMqPnE61014408
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Aug 2020 22:52:25 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0E1EEBE054;
 Wed, 19 Aug 2020 22:52:30 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 827FCBE053;
 Wed, 19 Aug 2020 22:52:29 +0000 (GMT)
Received: from pompom.ibm.com (unknown [9.160.63.43])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 19 Aug 2020 22:52:29 +0000 (GMT)
From: Lijun Pan <ljp@linux.ibm.com>
To: netdev@vger.kernel.org
Subject: [PATCH net-next v2 3/4] ibmvnic: remove never executed if statement
Date: Wed, 19 Aug 2020 17:52:25 -0500
Message-Id: <20200819225226.10152-4-ljp@linux.ibm.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200819225226.10152-1-ljp@linux.ibm.com>
References: <20200819225226.10152-1-ljp@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-19_13:2020-08-19,
 2020-08-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0
 priorityscore=1501 mlxlogscore=999 mlxscore=0 suspectscore=1
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008190182
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

At the beginning of the function, from_passive_init is set false by
"adapter->from_passive_init = false;",
hence the if statement will never run.

Signed-off-by: Lijun Pan <ljp@linux.ibm.com>
---
 drivers/net/ethernet/ibm/ibmvnic.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
index 644352e5056d..4ca4647db72a 100644
--- a/drivers/net/ethernet/ibm/ibmvnic.c
+++ b/drivers/net/ethernet/ibm/ibmvnic.c
@@ -5000,12 +5000,6 @@ static int ibmvnic_reset_init(struct ibmvnic_adapter *adapter)
 		return adapter->init_done_rc;
 	}
 
-	if (adapter->from_passive_init) {
-		adapter->state = VNIC_OPEN;
-		adapter->from_passive_init = false;
-		return -1;
-	}
-
 	if (test_bit(0, &adapter->resetting) && !adapter->wait_for_reset &&
 	    adapter->reset_reason != VNIC_RESET_MOBILITY) {
 		if (adapter->req_rx_queues != old_num_rx_queues ||
@@ -5059,12 +5053,6 @@ static int ibmvnic_init(struct ibmvnic_adapter *adapter)
 		return adapter->init_done_rc;
 	}
 
-	if (adapter->from_passive_init) {
-		adapter->state = VNIC_OPEN;
-		adapter->from_passive_init = false;
-		return -1;
-	}
-
 	rc = init_sub_crqs(adapter);
 	if (rc) {
 		dev_err(dev, "Initialization of sub crqs failed\n");
-- 
2.23.0

