Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B7FB5155
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 17:22:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Xn0k5xQczF43R
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Sep 2019 01:22:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=julietk@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46XmbK4h5rzDrpw
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Sep 2019 01:03:57 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8HEuNOD085107; Tue, 17 Sep 2019 11:03:51 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v315han28-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Sep 2019 11:03:50 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8HEjHpD028165;
 Tue, 17 Sep 2019 15:03:49 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma03dal.us.ibm.com with ESMTP id 2v0svqqy7w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Sep 2019 15:03:49 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8HF3m9d52822422
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Sep 2019 15:03:48 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 44D14124054;
 Tue, 17 Sep 2019 15:03:48 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E5606124058;
 Tue, 17 Sep 2019 15:03:47 +0000 (GMT)
Received: from ltcfleet2-lp9.aus.stglabs.ibm.com (unknown [9.40.195.116])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 17 Sep 2019 15:03:47 +0000 (GMT)
From: Juliet Kim <julietk@linux.vnet.ibm.com>
To: netdev@vger.kernel.org
Subject: [PATCH v2 2/2] net/ibmvnic: prevent more than one thread from running
 in reset
Date: Tue, 17 Sep 2019 10:52:49 -0400
Message-Id: <20190917145249.15334-3-julietk@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190917145249.15334-1-julietk@linux.vnet.ibm.com>
References: <20190917145249.15334-1-julietk@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-17_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909170144
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
Cc: julietk@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 tlfalcon@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The current code allows more than one thread to run in reset. This can 
corrupt struct adapter data. Check adapter->resetting before performing 
a reset, if there is another reset running delay (100 msec) before trying 
again.

Signed-off-by: Juliet Kim <julietk@linux.vnet.ibm.com>
---
 drivers/net/ethernet/ibm/ibmvnic.c | 23 ++++++++++++++++++++++-
 drivers/net/ethernet/ibm/ibmvnic.h |  3 +++
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
index fc760c1eb0b0..d3ebf4caa09c 100644
--- a/drivers/net/ethernet/ibm/ibmvnic.c
+++ b/drivers/net/ethernet/ibm/ibmvnic.c
@@ -2054,6 +2054,13 @@ static void __ibmvnic_reset(struct work_struct *work)
 
 	adapter = container_of(work, struct ibmvnic_adapter, ibmvnic_reset);
 
+	if (adapter->resetting) {
+		schedule_delayed_work(&adapter->ibmvnic_delayed_reset,
+				      IBMVNIC_RESET_DELAY);
+		return;
+	}
+
+	adapter->resetting = true;
 	reset_state = adapter->state;
 
 	rwi = get_next_rwi(adapter);
@@ -2094,6 +2101,10 @@ static void __ibmvnic_reset(struct work_struct *work)
 			break;
 
 		rwi = get_next_rwi(adapter);
+
+		if (rwi && (rwi->reset_reason == VNIC_RESET_FAILOVER ||
+			    rwi->reset_reason == VNIC_RESET_MOBILITY))
+			adapter->force_reset_recovery = true;
 	}
 
 	if (adapter->wait_for_reset) {
@@ -2109,6 +2120,15 @@ static void __ibmvnic_reset(struct work_struct *work)
 	adapter->resetting = false;
 }
 
+static void __ibmvnic_delayed_reset(struct work_struct *work)
+{
+	struct ibmvnic_adapter *adapter;
+
+	adapter = container_of(work, struct ibmvnic_adapter,
+			       ibmvnic_delayed_reset.work);
+	__ibmvnic_reset(&adapter->ibmvnic_reset);
+}
+
 static int ibmvnic_reset(struct ibmvnic_adapter *adapter,
 			 enum ibmvnic_reset_reason reason)
 {
@@ -2161,7 +2181,6 @@ static int ibmvnic_reset(struct ibmvnic_adapter *adapter,
 	rwi->reset_reason = reason;
 	list_add_tail(&rwi->list, &adapter->rwi_list);
 	spin_unlock_irqrestore(&adapter->rwi_lock, flags);
-	adapter->resetting = true;
 	netdev_dbg(adapter->netdev, "Scheduling reset (reason %d)\n", reason);
 	schedule_work(&adapter->ibmvnic_reset);
 
@@ -4932,6 +4951,8 @@ static int ibmvnic_probe(struct vio_dev *dev, const struct vio_device_id *id)
 	spin_lock_init(&adapter->stats_lock);
 
 	INIT_WORK(&adapter->ibmvnic_reset, __ibmvnic_reset);
+	INIT_DELAYED_WORK(&adapter->ibmvnic_delayed_reset,
+			  __ibmvnic_delayed_reset);
 	INIT_LIST_HEAD(&adapter->rwi_list);
 	spin_lock_init(&adapter->rwi_lock);
 	init_completion(&adapter->init_done);
diff --git a/drivers/net/ethernet/ibm/ibmvnic.h b/drivers/net/ethernet/ibm/ibmvnic.h
index 9d3d35cc91d6..4f4651d92cc1 100644
--- a/drivers/net/ethernet/ibm/ibmvnic.h
+++ b/drivers/net/ethernet/ibm/ibmvnic.h
@@ -39,6 +39,8 @@
 #define IBMVNIC_MAX_LTB_SIZE ((1 << (MAX_ORDER - 1)) * PAGE_SIZE)
 #define IBMVNIC_BUFFER_HLEN 500
 
+#define IBMVNIC_RESET_DELAY 100
+
 static const char ibmvnic_priv_flags[][ETH_GSTRING_LEN] = {
 #define IBMVNIC_USE_SERVER_MAXES 0x1
 	"use-server-maxes"
@@ -1077,6 +1079,7 @@ struct ibmvnic_adapter {
 	spinlock_t rwi_lock;
 	struct list_head rwi_list;
 	struct work_struct ibmvnic_reset;
+	struct delayed_work ibmvnic_delayed_reset;
 	bool resetting;
 	bool napi_enabled, from_passive_init;
 
-- 
2.16.4

