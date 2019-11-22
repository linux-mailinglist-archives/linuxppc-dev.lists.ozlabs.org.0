Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 638841078D2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Nov 2019 20:54:10 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47KRvg1y7LzDrN4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Nov 2019 06:54:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47KRdm4BgNzDrJB
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Nov 2019 06:42:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 47KRdm2nrCz8wHt
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Nov 2019 06:42:04 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 47KRdm1q1Gz9sPW; Sat, 23 Nov 2019 06:42:04 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tlfalcon@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 47KRdl3T09z9sPn
 for <linuxppc-dev@ozlabs.org>; Sat, 23 Nov 2019 06:42:03 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAMJXLnQ140642; Fri, 22 Nov 2019 14:41:59 -0500
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wdv0wdshp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Nov 2019 14:41:59 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xAMJYtEA023740;
 Fri, 22 Nov 2019 19:41:58 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma04wdc.us.ibm.com with ESMTP id 2wa8r7tafs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Nov 2019 19:41:58 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xAMJfuLg44499392
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 22 Nov 2019 19:41:57 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DE5F7C6059;
 Fri, 22 Nov 2019 19:41:56 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0108FC6055;
 Fri, 22 Nov 2019 19:41:56 +0000 (GMT)
Received: from oc7186267434.ibm.com (unknown [9.85.142.37])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 22 Nov 2019 19:41:55 +0000 (GMT)
From: Thomas Falcon <tlfalcon@linux.ibm.com>
To: netdev@vger.kernel.org
Subject: [PATCH net 4/4] ibmvnic: Serialize device queries
Date: Fri, 22 Nov 2019 13:41:46 -0600
Message-Id: <1574451706-19058-5-git-send-email-tlfalcon@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1574451706-19058-1-git-send-email-tlfalcon@linux.ibm.com>
References: <1574451706-19058-1-git-send-email-tlfalcon@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-22_04:2019-11-21,2019-11-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=999 clxscore=1015 impostorscore=0 mlxscore=0 phishscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=3 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911220162
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
Cc: brking@linux.vnet.ibm.com, linuxppc-dev@ozlabs.org,
 julietk@linux.vnet.ibm.com, Thomas Falcon <tlfalcon@linux.ibm.com>,
 dnbanerg@us.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Provide some serialization for device CRQ commands
and queries to ensure that the shared variable used for
storing return codes is properly synchronized.

Signed-off-by: Thomas Falcon <tlfalcon@linux.ibm.com>
---
 drivers/net/ethernet/ibm/ibmvnic.c | 51 ++++++++++++++++++++++++++++++++++----
 drivers/net/ethernet/ibm/ibmvnic.h |  1 +
 2 files changed, 47 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
index 9806eccc5670..5e9b7711cd2e 100644
--- a/drivers/net/ethernet/ibm/ibmvnic.c
+++ b/drivers/net/ethernet/ibm/ibmvnic.c
@@ -207,11 +207,14 @@ static int alloc_long_term_buff(struct ibmvnic_adapter *adapter,
 	ltb->map_id = adapter->map_id;
 	adapter->map_id++;
 
+	mutex_lock(&adapter->fw_lock);
+	adapter->fw_done_rc = 0;
 	reinit_completion(&adapter->fw_done);
 	rc = send_request_map(adapter, ltb->addr,
 			      ltb->size, ltb->map_id);
 	if (rc) {
 		dma_free_coherent(dev, ltb->size, ltb->buff, ltb->addr);
+		mutex_unlock(&adapter->fw_lock);
 		return rc;
 	}
 
@@ -222,6 +225,7 @@ static int alloc_long_term_buff(struct ibmvnic_adapter *adapter,
 			"Long term map request aborted or timed out,rc = %d\n",
 			rc);
 		dma_free_coherent(dev, ltb->size, ltb->buff, ltb->addr);
+		mutex_unlock(&adapter->fw_lock);
 		return rc;
 	}
 
@@ -229,8 +233,10 @@ static int alloc_long_term_buff(struct ibmvnic_adapter *adapter,
 		dev_err(dev, "Couldn't map long term buffer,rc = %d\n",
 			adapter->fw_done_rc);
 		dma_free_coherent(dev, ltb->size, ltb->buff, ltb->addr);
+		mutex_unlock(&adapter->fw_lock);
 		return -1;
 	}
+	mutex_unlock(&adapter->fw_lock);
 	return 0;
 }
 
@@ -256,16 +262,21 @@ static int reset_long_term_buff(struct ibmvnic_adapter *adapter,
 
 	memset(ltb->buff, 0, ltb->size);
 
+	mutex_lock(&adapter->fw_lock);
+	adapter->fw_done_rc = 0;
 	reinit_completion(&adapter->fw_done);
 	rc = send_request_map(adapter, ltb->addr, ltb->size, ltb->map_id);
-	if (rc)
+	if (rc) {
+		mutex_unlock(&adapter->fw_lock);
 		return rc;
+	}
 
 	rc = ibmvnic_wait_for_completion(adapter, &adapter->fw_done,
 					 msecs_to_jiffies(10000));
 	if (rc) {
 		dev_info(dev,
 			 "Reset failed, long term map request timed out or aborted\n");
+		mutex_unlock(&adapter->fw_lock);
 		return rc;
 	}
 
@@ -273,8 +284,10 @@ static int reset_long_term_buff(struct ibmvnic_adapter *adapter,
 		dev_info(dev,
 			 "Reset failed, attempting to free and reallocate buffer\n");
 		free_long_term_buff(adapter, ltb);
+		mutex_unlock(&adapter->fw_lock);
 		return alloc_long_term_buff(adapter, ltb, ltb->size);
 	}
+	mutex_unlock(&adapter->fw_lock);
 	return 0;
 }
 
@@ -991,19 +1004,26 @@ static int ibmvnic_get_vpd(struct ibmvnic_adapter *adapter)
 	if (adapter->vpd->buff)
 		len = adapter->vpd->len;
 
+	mutex_lock(&adapter->fw_lock);
+	adapter->fw_done_rc = 0;
 	reinit_completion(&adapter->fw_done);
+
 	crq.get_vpd_size.first = IBMVNIC_CRQ_CMD;
 	crq.get_vpd_size.cmd = GET_VPD_SIZE;
 	rc = ibmvnic_send_crq(adapter, &crq);
-	if (rc)
+	if (rc) {
+		mutex_unlock(&adapter->fw_lock);
 		return rc;
+	}
 
 	rc = ibmvnic_wait_for_completion(adapter, &adapter->fw_done,
 					 msecs_to_jiffies(10000));
 	if (rc) {
 		dev_err(dev, "Could not retrieve VPD size, rc = %d\n", rc);
+		mutex_unlock(&adapter->fw_lock);
 		return rc;
 	}
+	mutex_unlock(&adapter->fw_lock);
 
 	if (!adapter->vpd->len)
 		return -ENODATA;
@@ -1030,7 +1050,10 @@ static int ibmvnic_get_vpd(struct ibmvnic_adapter *adapter)
 		return -ENOMEM;
 	}
 
+	mutex_lock(&adapter->fw_lock);
+	adapter->fw_done_rc = 0;
 	reinit_completion(&adapter->fw_done);
+
 	crq.get_vpd.first = IBMVNIC_CRQ_CMD;
 	crq.get_vpd.cmd = GET_VPD;
 	crq.get_vpd.ioba = cpu_to_be32(adapter->vpd->dma_addr);
@@ -1039,6 +1062,7 @@ static int ibmvnic_get_vpd(struct ibmvnic_adapter *adapter)
 	if (rc) {
 		kfree(adapter->vpd->buff);
 		adapter->vpd->buff = NULL;
+		mutex_unlock(&adapter->fw_lock);
 		return rc;
 	}
 
@@ -1048,9 +1072,11 @@ static int ibmvnic_get_vpd(struct ibmvnic_adapter *adapter)
 		dev_err(dev, "Unable to retrieve VPD, rc = %d\n", rc);
 		kfree(adapter->vpd->buff);
 		adapter->vpd->buff = NULL;
+		mutex_unlock(&adapter->fw_lock);
 		return rc;
 	}
 
+	mutex_unlock(&adapter->fw_lock);
 	return 0;
 }
 
@@ -1751,10 +1777,14 @@ static int __ibmvnic_set_mac(struct net_device *netdev, u8 *dev_addr)
 	crq.change_mac_addr.cmd = CHANGE_MAC_ADDR;
 	ether_addr_copy(&crq.change_mac_addr.mac_addr[0], dev_addr);
 
+	mutex_lock(&adapter->fw_lock);
+	adapter->fw_done_rc = 0;
 	reinit_completion(&adapter->fw_done);
+
 	rc = ibmvnic_send_crq(adapter, &crq);
 	if (rc) {
 		rc = -EIO;
+		mutex_unlock(&adapter->fw_lock);
 		goto err;
 	}
 
@@ -1763,9 +1793,10 @@ static int __ibmvnic_set_mac(struct net_device *netdev, u8 *dev_addr)
 	/* netdev->dev_addr is changed in handle_change_mac_rsp function */
 	if (rc || adapter->fw_done_rc) {
 		rc = -EIO;
+		mutex_unlock(&adapter->fw_lock);
 		goto err;
 	}
-
+	mutex_unlock(&adapter->fw_lock);
 	return 0;
 err:
 	ether_addr_copy(adapter->mac_addr, netdev->dev_addr);
@@ -4485,16 +4516,25 @@ static int send_query_phys_parms(struct ibmvnic_adapter *adapter)
 	memset(&crq, 0, sizeof(crq));
 	crq.query_phys_parms.first = IBMVNIC_CRQ_CMD;
 	crq.query_phys_parms.cmd = QUERY_PHYS_PARMS;
+
+	mutex_lock(&adapter->fw_lock);
+	adapter->fw_done_rc = 0;
 	reinit_completion(&adapter->fw_done);
+
 	rc = ibmvnic_send_crq(adapter, &crq);
-	if (rc)
+	if (rc) {
+		mutex_unlock(&adapter->fw_lock);
 		return rc;
+	}
 
 	rc = ibmvnic_wait_for_completion(adapter, &adapter->fw_done,
 					 msecs_to_jiffies(10000));
-	if (rc)
+	if (rc) {
+		mutex_unlock(&adapter->fw_lock);
 		return rc;
+	}
 
+	mutex_unlock(&adapter->fw_lock);
 	return adapter->fw_done_rc ? -EIO : 0;
 }
 
@@ -5050,6 +5090,7 @@ static int ibmvnic_probe(struct vio_dev *dev, const struct vio_device_id *id)
 			  __ibmvnic_delayed_reset);
 	INIT_LIST_HEAD(&adapter->rwi_list);
 	spin_lock_init(&adapter->rwi_lock);
+	mutex_init(&adapter->fw_lock);
 	init_completion(&adapter->init_done);
 	init_completion(&adapter->fw_done);
 	init_completion(&adapter->reset_done);
diff --git a/drivers/net/ethernet/ibm/ibmvnic.h b/drivers/net/ethernet/ibm/ibmvnic.h
index ebc39248b334..94d58dd22fec 100644
--- a/drivers/net/ethernet/ibm/ibmvnic.h
+++ b/drivers/net/ethernet/ibm/ibmvnic.h
@@ -1026,6 +1026,7 @@ struct ibmvnic_adapter {
 	int init_done_rc;
 
 	struct completion fw_done;
+	struct mutex fw_lock;
 	int fw_done_rc;
 
 	struct completion reset_done;
-- 
2.12.3

