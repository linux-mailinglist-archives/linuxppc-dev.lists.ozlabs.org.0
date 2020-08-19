Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AB06F24A9C2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Aug 2020 00:57:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BX38Y69CBzDr27
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Aug 2020 08:57:49 +1000 (AEST)
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
 header.s=pp1 header.b=r9J7aHyy; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BX32T6ZBWzDqxf
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Aug 2020 08:52:33 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07JMXWaK121829; Wed, 19 Aug 2020 18:52:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=po7/URcOScYi95ISmj/D4tJBLGEf6ZhPQJJu9sNPcgM=;
 b=r9J7aHyySa8ZqcbbXpS69lGUJpAipOCuQGUMHNsssSIMWl2cnR3uJRILBElYVfjZaY9J
 DzDJMJGsgvJrj04JXin2wuFtBUA7QY9BMy+gPmTpz3Z8heCzIiqhvuK5dG2F+fH69nL4
 0LB6SHMvW9eD+0fYW5DshfJzmbRSF+OokI2hRY/7KD8zlkoHSsXK8eKJEECKNOtjqxJn
 N9vDKnYHu3iwfmNoe5WSiloL1fPhvzgG7Ktd0ufA3LsUvWI7zj5oD/5xD+mTuW9DIzC4
 ydacTE/BxlkOjZROhPU9+N2fV2kztSLspqyyGLkHalP1LBPBiPEbx3Plz2MWc3sRDTeH ig== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3310eyrnvk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Aug 2020 18:52:31 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07JMoeaU020497;
 Wed, 19 Aug 2020 22:52:30 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma01dal.us.ibm.com with ESMTP id 3304ccke4m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Aug 2020 22:52:30 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07JMqTiV39256430
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Aug 2020 22:52:29 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 56BDABE053;
 Wed, 19 Aug 2020 22:52:29 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CBD79BE04F;
 Wed, 19 Aug 2020 22:52:28 +0000 (GMT)
Received: from pompom.ibm.com (unknown [9.160.63.43])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 19 Aug 2020 22:52:28 +0000 (GMT)
From: Lijun Pan <ljp@linux.ibm.com>
To: netdev@vger.kernel.org
Subject: [PATCH net-next v2 2/4] ibmvnic: improve ibmvnic_init and
 ibmvnic_reset_init
Date: Wed, 19 Aug 2020 17:52:24 -0500
Message-Id: <20200819225226.10152-3-ljp@linux.ibm.com>
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

When H_SEND_CRQ command returns with H_CLOSED, it means the
server's CRQ is not ready yet. Instead of resetting immediately,
we wait for the server to launch passive init.
ibmvnic_init() and ibmvnic_reset_init() should also return the
error code from ibmvnic_send_crq_init() call.

Signed-off-by: Lijun Pan <ljp@linux.ibm.com>
---
v2: removes __func__ in error messages.

 drivers/net/ethernet/ibm/ibmvnic.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
index 65f5d99f97dc..644352e5056d 100644
--- a/drivers/net/ethernet/ibm/ibmvnic.c
+++ b/drivers/net/ethernet/ibm/ibmvnic.c
@@ -3568,8 +3568,7 @@ static int ibmvnic_send_crq(struct ibmvnic_adapter *adapter,
 	if (rc) {
 		if (rc == H_CLOSED) {
 			dev_warn(dev, "CRQ Queue closed\n");
-			if (test_bit(0, &adapter->resetting))
-				ibmvnic_reset(adapter, VNIC_RESET_FATAL);
+			/* do not reset, report the fail, wait for passive init from server */
 		}
 
 		dev_warn(dev, "Send error (rc=%d)\n", rc);
@@ -4985,7 +4984,12 @@ static int ibmvnic_reset_init(struct ibmvnic_adapter *adapter)
 
 	reinit_completion(&adapter->init_done);
 	adapter->init_done_rc = 0;
-	ibmvnic_send_crq_init(adapter);
+	rc = ibmvnic_send_crq_init(adapter);
+	if (rc) {
+		dev_err(dev, "Send crq init failed with error %d\n", rc);
+		return rc;
+	}
+
 	if (!wait_for_completion_timeout(&adapter->init_done, timeout)) {
 		dev_err(dev, "Initialization sequence timed out\n");
 		return -1;
@@ -5039,7 +5043,12 @@ static int ibmvnic_init(struct ibmvnic_adapter *adapter)
 	adapter->from_passive_init = false;
 
 	adapter->init_done_rc = 0;
-	ibmvnic_send_crq_init(adapter);
+	rc = ibmvnic_send_crq_init(adapter);
+	if (rc) {
+		dev_err(dev, "Send crq init failed with error %d\n", rc);
+		return rc;
+	}
+
 	if (!wait_for_completion_timeout(&adapter->init_done, timeout)) {
 		dev_err(dev, "Initialization sequence timed out\n");
 		return -1;
-- 
2.23.0

