Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5962C4BDB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 01:13:05 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ChJB62pnXzDr2k
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 11:13:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=drt@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=R1NuxDwt; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ChJ6C50BCzDr2h
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Nov 2020 11:09:39 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AQ02p8l127529; Wed, 25 Nov 2020 19:09:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=ufFDuUsOLLTxrA0S0tG0aMXmRaCyLMJ842UgHxqusag=;
 b=R1NuxDwtRFk+a/FnvSnYmB+9TBEDwOBMNJI+Yh1AdGJ0vBdj+2Y7D/9UZT7Yewtf3Ux8
 XG1F697xt0cBaCmvbhKjXLJ2NCa5ru3gzx+CZqezEzjzY9sPzDfnll32ugc41N8f+ZRY
 NnFmLXtRDmtDRYnmcYNqI+U3VDlQjr0Q4ICZK3mbirsnGBqy+NeshhqaqzrKWy/lTVgR
 45Om0RY2J1WmPCXiZAg+FHk1BqX3EMsimiEmW7zjUBQSbn40+h4nP2raUsbvrSSllYGB
 Y2FwCXk4ln/v8Ro7vH/VZJFYEYdn+AzPIJUokKV8f8aLLtVzoM99egYctjeAW+ejQm3p cw== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 351yjcjkyh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Nov 2020 19:09:37 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AQ07CNO009967;
 Thu, 26 Nov 2020 00:09:37 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma03wdc.us.ibm.com with ESMTP id 35133p3hpg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Nov 2020 00:09:37 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AQ09ali2884228
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Nov 2020 00:09:36 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A5A76AC05B;
 Thu, 26 Nov 2020 00:09:36 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 471FAAC067;
 Thu, 26 Nov 2020 00:09:36 +0000 (GMT)
Received: from linux-i8xm.aus.stglabs.ibm.com (unknown [9.40.195.200])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 26 Nov 2020 00:09:36 +0000 (GMT)
From: Dany Madden <drt@linux.ibm.com>
To: netdev@vger.kernel.org
Subject: [PATCH net v3 4/9] ibmvnic: restore adapter state on failed reset
Date: Wed, 25 Nov 2020 18:04:27 -0600
Message-Id: <20201126000432.29897-5-drt@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201126000432.29897-1-drt@linux.ibm.com>
References: <20201126000432.29897-1-drt@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-24_07:2020-11-24,
 2020-11-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 suspectscore=1 mlxscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 priorityscore=1501 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011240121
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
Cc: Dany Madden <drt@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 sukadev@linux.ibm.com, ljp@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In a failed reset, driver could end up in VNIC_PROBED or VNIC_CLOSED
state and cannot recover in subsequent resets, leaving it offline.
This patch restores the adapter state to reset_state, the original
state when reset was called.

Fixes: b27507bb59ed5 ("net/ibmvnic: unlock rtnl_lock in reset so linkwatch_event can run")
Fixes: 2770a7984db58 ("ibmvnic: Introduce hard reset recovery")
Signed-off-by: Dany Madden <drt@linux.ibm.com>
---
 drivers/net/ethernet/ibm/ibmvnic.c | 67 ++++++++++++++++--------------
 1 file changed, 36 insertions(+), 31 deletions(-)

diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
index b08f95017825..ff474a790181 100644
--- a/drivers/net/ethernet/ibm/ibmvnic.c
+++ b/drivers/net/ethernet/ibm/ibmvnic.c
@@ -1857,7 +1857,7 @@ static int do_change_param_reset(struct ibmvnic_adapter *adapter,
 	if (reset_state == VNIC_OPEN) {
 		rc = __ibmvnic_close(netdev);
 		if (rc)
-			return rc;
+			goto out;
 	}
 
 	release_resources(adapter);
@@ -1875,24 +1875,25 @@ static int do_change_param_reset(struct ibmvnic_adapter *adapter,
 	}
 
 	rc = ibmvnic_reset_init(adapter, true);
-	if (rc)
-		return IBMVNIC_INIT_FAILED;
+	if (rc) {
+		rc = IBMVNIC_INIT_FAILED;
+		goto out;
+	}
 
 	/* If the adapter was in PROBE state prior to the reset,
 	 * exit here.
 	 */
 	if (reset_state == VNIC_PROBED)
-		return 0;
+		goto out;
 
 	rc = ibmvnic_login(netdev);
 	if (rc) {
-		adapter->state = reset_state;
-		return rc;
+		goto out;
 	}
 
 	rc = init_resources(adapter);
 	if (rc)
-		return rc;
+		goto out;
 
 	ibmvnic_disable_irqs(adapter);
 
@@ -1902,8 +1903,10 @@ static int do_change_param_reset(struct ibmvnic_adapter *adapter,
 		return 0;
 
 	rc = __ibmvnic_open(netdev);
-	if (rc)
-		return IBMVNIC_OPEN_FAILED;
+	if (rc) {
+		rc = IBMVNIC_OPEN_FAILED;
+		goto out;
+	}
 
 	/* refresh device's multicast list */
 	ibmvnic_set_multi(netdev);
@@ -1912,7 +1915,10 @@ static int do_change_param_reset(struct ibmvnic_adapter *adapter,
 	for (i = 0; i < adapter->req_rx_queues; i++)
 		napi_schedule(&adapter->napi[i]);
 
-	return 0;
+out:
+	if (rc)
+		adapter->state = reset_state;
+	return rc;
 }
 
 /**
@@ -2015,7 +2021,6 @@ static int do_reset(struct ibmvnic_adapter *adapter,
 
 		rc = ibmvnic_login(netdev);
 		if (rc) {
-			adapter->state = reset_state;
 			goto out;
 		}
 
@@ -2083,6 +2088,9 @@ static int do_reset(struct ibmvnic_adapter *adapter,
 	rc = 0;
 
 out:
+	/* restore the adapter state if reset failed */
+	if (rc)
+		adapter->state = reset_state;
 	rtnl_unlock();
 
 	return rc;
@@ -2115,43 +2123,46 @@ static int do_hard_reset(struct ibmvnic_adapter *adapter,
 	if (rc) {
 		netdev_err(adapter->netdev,
 			   "Couldn't initialize crq. rc=%d\n", rc);
-		return rc;
+		goto out;
 	}
 
 	rc = ibmvnic_reset_init(adapter, false);
 	if (rc)
-		return rc;
+		goto out;
 
 	/* If the adapter was in PROBE state prior to the reset,
 	 * exit here.
 	 */
 	if (reset_state == VNIC_PROBED)
-		return 0;
+		goto out;
 
 	rc = ibmvnic_login(netdev);
-	if (rc) {
-		adapter->state = VNIC_PROBED;
-		return 0;
-	}
+	if (rc)
+		goto out;
 
 	rc = init_resources(adapter);
 	if (rc)
-		return rc;
+		goto out;
 
 	ibmvnic_disable_irqs(adapter);
 	adapter->state = VNIC_CLOSED;
 
 	if (reset_state == VNIC_CLOSED)
-		return 0;
+		goto out;
 
 	rc = __ibmvnic_open(netdev);
-	if (rc)
-		return IBMVNIC_OPEN_FAILED;
+	if (rc) {
+		rc = IBMVNIC_OPEN_FAILED;
+		goto out;
+	}
 
 	call_netdevice_notifiers(NETDEV_NOTIFY_PEERS, netdev);
 	call_netdevice_notifiers(NETDEV_RESEND_IGMP, netdev);
-
-	return 0;
+out:
+	/* restore adapter state if reset failed */
+	if (rc)
+		adapter->state = reset_state;
+	return rc;
 }
 
 static struct ibmvnic_rwi *get_next_rwi(struct ibmvnic_adapter *adapter)
@@ -2236,13 +2247,7 @@ static void __ibmvnic_reset(struct work_struct *work)
 			rc = do_reset(adapter, rwi, reset_state);
 		}
 		kfree(rwi);
-		if (rc == IBMVNIC_OPEN_FAILED) {
-			if (list_empty(&adapter->rwi_list))
-				adapter->state = VNIC_CLOSED;
-			else
-				adapter->state = reset_state;
-			rc = 0;
-		}
+
 		if (rc)
 			netdev_dbg(adapter->netdev, "Reset failed, rc=%d\n", rc);
 
-- 
2.26.2

