Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 278C8180044
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Mar 2020 15:33:52 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48cHdm6qTZzDqRs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Mar 2020 01:33:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=julietk@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48cHXs0yXWzDqQr
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Mar 2020 01:29:29 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02AEMSHj001388; Tue, 10 Mar 2020 10:29:18 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ym8cap9g5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Mar 2020 10:29:18 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 02AESnQk007625;
 Tue, 10 Mar 2020 14:29:18 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma05wdc.us.ibm.com with ESMTP id 2ym386ka9u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Mar 2020 14:29:18 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02AETHnk37159180
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Mar 2020 14:29:17 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8E74428059;
 Tue, 10 Mar 2020 14:29:17 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3B9F628058;
 Tue, 10 Mar 2020 14:29:17 +0000 (GMT)
Received: from ltcalpine2-lp14.aus.stglabs.ibm.com (unknown [9.40.195.197])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 10 Mar 2020 14:29:17 +0000 (GMT)
From: Juliet Kim <julietk@linux.vnet.ibm.com>
To: netdev@vger.kernel.org
Subject: [PATCH net v2] ibmvnic: Do not process device remove during device
 reset
Date: Tue, 10 Mar 2020 09:23:58 -0500
Message-Id: <20200310142358.61392-1-julietk@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-10_08:2020-03-10,
 2020-03-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 suspectscore=3
 impostorscore=0 spamscore=0 adultscore=0 mlxlogscore=999 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003100097
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
Cc: julietk@linux.vnet.ibm.com, tlfalcon@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The ibmvnic driver does not check the device state when the device
is removed. If the device is removed while a device reset is being
processed, the remove may free structures needed by the reset,
causing an oops.

Fix this by checking the device state before processing device remove.

Signed-off-by: Juliet Kim <julietk@linux.vnet.ibm.com>
---
 drivers/net/ethernet/ibm/ibmvnic.c | 24 ++++++++++++++++++++++--
 drivers/net/ethernet/ibm/ibmvnic.h |  6 +++++-
 2 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
index c75239d8820f..4bd33245bad6 100644
--- a/drivers/net/ethernet/ibm/ibmvnic.c
+++ b/drivers/net/ethernet/ibm/ibmvnic.c
@@ -2142,6 +2142,8 @@ static void __ibmvnic_reset(struct work_struct *work)
 {
 	struct ibmvnic_rwi *rwi;
 	struct ibmvnic_adapter *adapter;
+	bool saved_state = false;
+	unsigned long flags;
 	u32 reset_state;
 	int rc = 0;
 
@@ -2153,17 +2155,25 @@ static void __ibmvnic_reset(struct work_struct *work)
 		return;
 	}
 
-	reset_state = adapter->state;
-
 	rwi = get_next_rwi(adapter);
 	while (rwi) {
+		spin_lock_irqsave(&adapter->state_lock, flags);
+
 		if (adapter->state == VNIC_REMOVING ||
 		    adapter->state == VNIC_REMOVED) {
+			spin_unlock_irqrestore(&adapter->state_lock, flags);
 			kfree(rwi);
 			rc = EBUSY;
 			break;
 		}
 
+		if (!saved_state) {
+			reset_state = adapter->state;
+			adapter->state = VNIC_RESETTING;
+			saved_state = true;
+		}
+		spin_unlock_irqrestore(&adapter->state_lock, flags);
+
 		if (rwi->reset_reason == VNIC_RESET_CHANGE_PARAM) {
 			/* CHANGE_PARAM requestor holds rtnl_lock */
 			rc = do_change_param_reset(adapter, rwi, reset_state);
@@ -5091,6 +5101,7 @@ static int ibmvnic_probe(struct vio_dev *dev, const struct vio_device_id *id)
 			  __ibmvnic_delayed_reset);
 	INIT_LIST_HEAD(&adapter->rwi_list);
 	spin_lock_init(&adapter->rwi_lock);
+	spin_lock_init(&adapter->state_lock);
 	mutex_init(&adapter->fw_lock);
 	init_completion(&adapter->init_done);
 	init_completion(&adapter->fw_done);
@@ -5163,8 +5174,17 @@ static int ibmvnic_remove(struct vio_dev *dev)
 {
 	struct net_device *netdev = dev_get_drvdata(&dev->dev);
 	struct ibmvnic_adapter *adapter = netdev_priv(netdev);
+	unsigned long flags;
+
+	spin_lock_irqsave(&adapter->state_lock, flags);
+	if (adapter->state == VNIC_RESETTING) {
+		spin_unlock_irqrestore(&adapter->state_lock, flags);
+		return -EBUSY;
+	}
 
 	adapter->state = VNIC_REMOVING;
+	spin_unlock_irqrestore(&adapter->state_lock, flags);
+
 	rtnl_lock();
 	unregister_netdevice(netdev);
 
diff --git a/drivers/net/ethernet/ibm/ibmvnic.h b/drivers/net/ethernet/ibm/ibmvnic.h
index 60eccaf91b12..f8416e1d4cf0 100644
--- a/drivers/net/ethernet/ibm/ibmvnic.h
+++ b/drivers/net/ethernet/ibm/ibmvnic.h
@@ -941,7 +941,8 @@ enum vnic_state {VNIC_PROBING = 1,
 		 VNIC_CLOSING,
 		 VNIC_CLOSED,
 		 VNIC_REMOVING,
-		 VNIC_REMOVED};
+		 VNIC_REMOVED,
+		 VNIC_RESETTING};
 
 enum ibmvnic_reset_reason {VNIC_RESET_FAILOVER = 1,
 			   VNIC_RESET_MOBILITY,
@@ -1090,4 +1091,7 @@ struct ibmvnic_adapter {
 
 	struct ibmvnic_tunables desired;
 	struct ibmvnic_tunables fallback;
+
+	/* Used for serializatin of state field */
+	spinlock_t state_lock;
 };
-- 
2.25.0

