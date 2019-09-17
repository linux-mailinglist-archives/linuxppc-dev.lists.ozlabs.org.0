Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 18922B5454
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 19:34:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Xqx74PP0zF34K
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Sep 2019 03:34:35 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46XqmB4ygJzF3rf
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Sep 2019 03:26:50 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8HHMrx4142601; Tue, 17 Sep 2019 13:26:48 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2v327rd1aw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Sep 2019 13:26:48 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8HHPLnG008837;
 Tue, 17 Sep 2019 17:26:47 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma01dal.us.ibm.com with ESMTP id 2v0t5u8xvy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Sep 2019 17:26:47 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8HHQkB434931068
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Sep 2019 17:26:46 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3572FB2070;
 Tue, 17 Sep 2019 17:26:46 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CF938B2064;
 Tue, 17 Sep 2019 17:26:45 +0000 (GMT)
Received: from ltcfleet2-lp9.aus.stglabs.ibm.com (unknown [9.40.195.116])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 17 Sep 2019 17:26:45 +0000 (GMT)
From: Juliet Kim <julietk@linux.vnet.ibm.com>
To: netdev@vger.kernel.org
Subject: [PATCH v3 2/2] net/ibmvnic: prevent more than one thread from running
 in reset
Date: Tue, 17 Sep 2019 13:15:52 -0400
Message-Id: <20190917171552.32498-3-julietk@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190917171552.32498-1-julietk@linux.vnet.ibm.com>
References: <20190917171552.32498-1-julietk@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-17_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909170167
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

Signed-off-by: Juliet Kim <julietk@linux.vnet.ibm.com>
---
 drivers/net/ethernet/ibm/ibmvnic.c | 23 ++++++++++++++++++++++-
 drivers/net/ethernet/ibm/ibmvnic.h |  3 +++
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
index ba340aaff1b3..f344ccd68ad9 100644
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
@@ -2095,6 +2102,10 @@ static void __ibmvnic_reset(struct work_struct *work)
 			break;
 
 		rwi = get_next_rwi(adapter);
+
+		if (rwi && (rwi->reset_reason == VNIC_RESET_FAILOVER ||
+			    rwi->reset_reason == VNIC_RESET_MOBILITY))
+			adapter->force_reset_recovery = true;
 	}
 
 	if (adapter->wait_for_reset) {
@@ -2110,6 +2121,15 @@ static void __ibmvnic_reset(struct work_struct *work)
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
@@ -2162,7 +2182,6 @@ static int ibmvnic_reset(struct ibmvnic_adapter *adapter,
 	rwi->reset_reason = reason;
 	list_add_tail(&rwi->list, &adapter->rwi_list);
 	spin_unlock_irqrestore(&adapter->rwi_lock, flags);
-	adapter->resetting = true;
 	netdev_dbg(adapter->netdev, "Scheduling reset (reason %d)\n", reason);
 	schedule_work(&adapter->ibmvnic_reset);
 
@@ -4933,6 +4952,8 @@ static int ibmvnic_probe(struct vio_dev *dev, const struct vio_device_id *id)
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

