Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B54107826
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Nov 2019 20:47:57 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47KRmT625XzDqQS
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Nov 2019 06:47:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47KRdm0Nr7zDrJC
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Nov 2019 06:42:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 47KRdl0xwFz8wHx
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Nov 2019 06:42:03 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 47KRdl0LGtz9sPn; Sat, 23 Nov 2019 06:42:03 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tlfalcon@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 47KRdk2tG0z9sPf
 for <linuxppc-dev@ozlabs.org>; Sat, 23 Nov 2019 06:42:01 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAMJWJ2R020729; Fri, 22 Nov 2019 14:41:56 -0500
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wdfxvv015-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Nov 2019 14:41:56 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xAMJYtaE008764;
 Fri, 22 Nov 2019 19:41:55 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma01dal.us.ibm.com with ESMTP id 2wa8r80ux6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Nov 2019 19:41:55 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xAMJfreR51183950
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 22 Nov 2019 19:41:53 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 71BBBC6059;
 Fri, 22 Nov 2019 19:41:53 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 84F7CC6057;
 Fri, 22 Nov 2019 19:41:52 +0000 (GMT)
Received: from oc7186267434.ibm.com (unknown [9.85.142.37])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 22 Nov 2019 19:41:52 +0000 (GMT)
From: Thomas Falcon <tlfalcon@linux.ibm.com>
To: netdev@vger.kernel.org
Subject: [PATCH net 1/4] ibmvnic: Fix completion structure initialization
Date: Fri, 22 Nov 2019 13:41:43 -0600
Message-Id: <1574451706-19058-2-git-send-email-tlfalcon@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1574451706-19058-1-git-send-email-tlfalcon@linux.ibm.com>
References: <1574451706-19058-1-git-send-email-tlfalcon@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-22_04:2019-11-21,2019-11-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999
 clxscore=1015 spamscore=0 mlxscore=0 suspectscore=1 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Fix multiple calls to init_completion for device completion
structures. Instead, initialize them during device probe and
reinitialize them later as needed.

Signed-off-by: Thomas Falcon <tlfalcon@linux.ibm.com>
---
 drivers/net/ethernet/ibm/ibmvnic.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
index f59d9a8e35e2..48225297a5e2 100644
--- a/drivers/net/ethernet/ibm/ibmvnic.c
+++ b/drivers/net/ethernet/ibm/ibmvnic.c
@@ -176,7 +176,7 @@ static int alloc_long_term_buff(struct ibmvnic_adapter *adapter,
 	ltb->map_id = adapter->map_id;
 	adapter->map_id++;
 
-	init_completion(&adapter->fw_done);
+	reinit_completion(&adapter->fw_done);
 	rc = send_request_map(adapter, ltb->addr,
 			      ltb->size, ltb->map_id);
 	if (rc) {
@@ -215,7 +215,7 @@ static int reset_long_term_buff(struct ibmvnic_adapter *adapter,
 
 	memset(ltb->buff, 0, ltb->size);
 
-	init_completion(&adapter->fw_done);
+	reinit_completion(&adapter->fw_done);
 	rc = send_request_map(adapter, ltb->addr, ltb->size, ltb->map_id);
 	if (rc)
 		return rc;
@@ -943,7 +943,7 @@ static int ibmvnic_get_vpd(struct ibmvnic_adapter *adapter)
 	if (adapter->vpd->buff)
 		len = adapter->vpd->len;
 
-	init_completion(&adapter->fw_done);
+	reinit_completion(&adapter->fw_done);
 	crq.get_vpd_size.first = IBMVNIC_CRQ_CMD;
 	crq.get_vpd_size.cmd = GET_VPD_SIZE;
 	rc = ibmvnic_send_crq(adapter, &crq);
@@ -1689,7 +1689,7 @@ static int __ibmvnic_set_mac(struct net_device *netdev, u8 *dev_addr)
 	crq.change_mac_addr.cmd = CHANGE_MAC_ADDR;
 	ether_addr_copy(&crq.change_mac_addr.mac_addr[0], dev_addr);
 
-	init_completion(&adapter->fw_done);
+	reinit_completion(&adapter->fw_done);
 	rc = ibmvnic_send_crq(adapter, &crq);
 	if (rc) {
 		rc = -EIO;
@@ -2316,7 +2316,7 @@ static int wait_for_reset(struct ibmvnic_adapter *adapter)
 	adapter->fallback.rx_entries = adapter->req_rx_add_entries_per_subcrq;
 	adapter->fallback.tx_entries = adapter->req_tx_entries_per_subcrq;
 
-	init_completion(&adapter->reset_done);
+	reinit_completion(&adapter->reset_done);
 	adapter->wait_for_reset = true;
 	rc = ibmvnic_reset(adapter, VNIC_RESET_CHANGE_PARAM);
 	if (rc)
@@ -2332,7 +2332,7 @@ static int wait_for_reset(struct ibmvnic_adapter *adapter)
 		adapter->desired.rx_entries = adapter->fallback.rx_entries;
 		adapter->desired.tx_entries = adapter->fallback.tx_entries;
 
-		init_completion(&adapter->reset_done);
+		reinit_completion(&adapter->reset_done);
 		adapter->wait_for_reset = true;
 		rc = ibmvnic_reset(adapter, VNIC_RESET_CHANGE_PARAM);
 		if (rc)
@@ -2603,7 +2603,7 @@ static void ibmvnic_get_ethtool_stats(struct net_device *dev,
 	    cpu_to_be32(sizeof(struct ibmvnic_statistics));
 
 	/* Wait for data to be written */
-	init_completion(&adapter->stats_done);
+	reinit_completion(&adapter->stats_done);
 	rc = ibmvnic_send_crq(adapter, &crq);
 	if (rc)
 		return;
@@ -4403,7 +4403,7 @@ static int send_query_phys_parms(struct ibmvnic_adapter *adapter)
 	memset(&crq, 0, sizeof(crq));
 	crq.query_phys_parms.first = IBMVNIC_CRQ_CMD;
 	crq.query_phys_parms.cmd = QUERY_PHYS_PARMS;
-	init_completion(&adapter->fw_done);
+	reinit_completion(&adapter->fw_done);
 	rc = ibmvnic_send_crq(adapter, &crq);
 	if (rc)
 		return rc;
@@ -4955,6 +4955,9 @@ static int ibmvnic_probe(struct vio_dev *dev, const struct vio_device_id *id)
 	INIT_LIST_HEAD(&adapter->rwi_list);
 	spin_lock_init(&adapter->rwi_lock);
 	init_completion(&adapter->init_done);
+	init_completion(&adapter->fw_done);
+	init_completion(&adapter->reset_done);
+	init_completion(&adapter->stats_done);
 	clear_bit(0, &adapter->resetting);
 
 	do {
-- 
2.12.3

