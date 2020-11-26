Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D51892C4BFD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 01:24:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ChJRN4tMrzDr2K
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 11:24:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=drt@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=m5hZWpPM; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ChJ6G4XRxzDr1N
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Nov 2020 11:09:42 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AQ03FWu173437; Wed, 25 Nov 2020 19:09:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=3mCa3Nb8KMj3fP0a+OvdftlX8EylfVjNR1lqjuf7rxo=;
 b=m5hZWpPMPQJsqmcFVE0Nl5mJeYTdDyUTKwrZoKKkVcuFgOmvzsGPQKzOYlivRP1G9Dn9
 /xzMj1KEDEhuXW+cgdy2tNtWmSzOQJ5km0nTdDxfkuC5q7XajHwqq6n8IY4wsZe+IZBY
 G1NzhT2sxmQn6nYep6kr8WKCZ9lUGsqXcoiUcdv/2qiORRH4id+SEYtRm7S2BjTyF5qc
 JA9u6xN6NCbf9AA1ee+yfrWX8KllR8hboIYsrCodne2IV3TXOtvFue/R7e0C8ePkfh/1
 8PLJSXW6BXN1paHyQ5m3RItRdT+n9fZe9rgJ4SZ9yeA+5szDfEK6wjY3HXUg2RUCWaGS FA== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3520vd0s8j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Nov 2020 19:09:39 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AQ0874W017692;
 Thu, 26 Nov 2020 00:09:39 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma03dal.us.ibm.com with ESMTP id 34xth9v2j6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Nov 2020 00:09:38 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AQ09cJA17891984
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Nov 2020 00:09:38 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 13FFDAC05F;
 Thu, 26 Nov 2020 00:09:38 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A9C2FAC059;
 Thu, 26 Nov 2020 00:09:37 +0000 (GMT)
Received: from linux-i8xm.aus.stglabs.ibm.com (unknown [9.40.195.200])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 26 Nov 2020 00:09:37 +0000 (GMT)
From: Dany Madden <drt@linux.ibm.com>
To: netdev@vger.kernel.org
Subject: [PATCH net v3 7/9] ibmvnic: send_login should check for crq errors
Date: Wed, 25 Nov 2020 18:04:30 -0600
Message-Id: <20201126000432.29897-8-drt@linux.ibm.com>
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
 phishscore=0 mlxlogscore=999
 impostorscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 mlxscore=0 adultscore=0 clxscore=1015 suspectscore=1 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

send_login() does not check for the result of ibmvnic_send_crq() of the
login request. This results in the driver needlessly retrying the login
10 times even when CRQ is no longer active. Check the return code and
give up in case of errors in sending the CRQ.

The only time we want to retry is if we get a PARITALSUCCESS response
from the partner.

Fixes: 032c5e82847a2 ("Driver for IBM System i/p VNIC protocol")
Signed-off-by: Dany Madden <drt@linux.ibm.com>
Signed-off-by: Sukadev Bhattiprolu <sukadev@linux.ibm.com>
---
 drivers/net/ethernet/ibm/ibmvnic.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
index 55b07bd4c741..9005fab09e15 100644
--- a/drivers/net/ethernet/ibm/ibmvnic.c
+++ b/drivers/net/ethernet/ibm/ibmvnic.c
@@ -850,10 +850,8 @@ static int ibmvnic_login(struct net_device *netdev)
 		adapter->init_done_rc = 0;
 		reinit_completion(&adapter->init_done);
 		rc = send_login(adapter);
-		if (rc) {
-			netdev_warn(netdev, "Unable to login\n");
+		if (rc)
 			return rc;
-		}
 
 		if (!wait_for_completion_timeout(&adapter->init_done,
 						 timeout)) {
@@ -3727,15 +3725,16 @@ static int send_login(struct ibmvnic_adapter *adapter)
 	struct ibmvnic_login_rsp_buffer *login_rsp_buffer;
 	struct ibmvnic_login_buffer *login_buffer;
 	struct device *dev = &adapter->vdev->dev;
+	struct vnic_login_client_data *vlcd;
 	dma_addr_t rsp_buffer_token;
 	dma_addr_t buffer_token;
 	size_t rsp_buffer_size;
 	union ibmvnic_crq crq;
+	int client_data_len;
 	size_t buffer_size;
 	__be64 *tx_list_p;
 	__be64 *rx_list_p;
-	int client_data_len;
-	struct vnic_login_client_data *vlcd;
+	int rc;
 	int i;
 
 	if (!adapter->tx_scrq || !adapter->rx_scrq) {
@@ -3841,16 +3840,23 @@ static int send_login(struct ibmvnic_adapter *adapter)
 	crq.login.len = cpu_to_be32(buffer_size);
 
 	adapter->login_pending = true;
-	ibmvnic_send_crq(adapter, &crq);
+	rc = ibmvnic_send_crq(adapter, &crq);
+	if (rc) {
+		adapter->login_pending = false;
+		netdev_err(adapter->netdev, "Failed to send login, rc=%d\n", rc);
+		goto buf_rsp_map_failed;
+	}
 
 	return 0;
 
 buf_rsp_map_failed:
 	kfree(login_rsp_buffer);
+	adapter->login_rsp_buf = NULL;
 buf_rsp_alloc_failed:
 	dma_unmap_single(dev, buffer_token, buffer_size, DMA_TO_DEVICE);
 buf_map_failed:
 	kfree(login_buffer);
+	adapter->login_buf = NULL;
 buf_alloc_failed:
 	return -1;
 }
-- 
2.26.2

