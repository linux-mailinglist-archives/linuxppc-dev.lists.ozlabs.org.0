Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2E71F9C01
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 17:32:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49lwLw2GqwzDqbX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jun 2020 01:32:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=tlfalcon@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49lwHQ19DXzDqGS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jun 2020 01:29:36 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05FE1AmU050241; Mon, 15 Jun 2020 11:29:31 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31n42ka56j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jun 2020 11:29:30 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05FFPBQi012655;
 Mon, 15 Jun 2020 15:29:30 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02dal.us.ibm.com with ESMTP id 31mpe9ejw9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jun 2020 15:29:30 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05FFTQ1o14615026
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Jun 2020 15:29:26 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ACA4E6E04C;
 Mon, 15 Jun 2020 15:29:27 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C9A5A6E04E;
 Mon, 15 Jun 2020 15:29:26 +0000 (GMT)
Received: from oc7186267434.ibm.com (unknown [9.65.236.85])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 15 Jun 2020 15:29:26 +0000 (GMT)
From: Thomas Falcon <tlfalcon@linux.ibm.com>
To: davem@davemloft.net
Subject: [PATCH net v2] ibmvnic: Harden device login requests
Date: Mon, 15 Jun 2020 10:29:23 -0500
Message-Id: <1592234963-9535-1-git-send-email-tlfalcon@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-15_03:2020-06-15,
 2020-06-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 malwarescore=0 bulkscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 mlxscore=0 spamscore=0 suspectscore=1
 cotscore=-2147483648 adultscore=0 impostorscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006150111
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
Cc: netdev@vger.kernel.org, Thomas Falcon <tlfalcon@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, danymadden@us.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The VNIC driver's "login" command sequence is the final step
in the driver's initialization process with device firmware,
confirming the available device queue resources to be utilized
by the driver. Under high system load, firmware may not respond
to the request in a timely manner or may abort the request. In
such cases, the driver should reattempt the login command
sequence. In case of a device error, the number of retries
is bounded.

Signed-off-by: Thomas Falcon <tlfalcon@linux.ibm.com>
---
v2: declare variables in Reverse Christmas tree format
---
 drivers/net/ethernet/ibm/ibmvnic.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
index 1b4d04e..2baf7b3 100644
--- a/drivers/net/ethernet/ibm/ibmvnic.c
+++ b/drivers/net/ethernet/ibm/ibmvnic.c
@@ -842,12 +842,13 @@ static int ibmvnic_login(struct net_device *netdev)
 	struct ibmvnic_adapter *adapter = netdev_priv(netdev);
 	unsigned long timeout = msecs_to_jiffies(30000);
 	int retry_count = 0;
+	int retries = 10;
 	bool retry;
 	int rc;
 
 	do {
 		retry = false;
-		if (retry_count > IBMVNIC_MAX_QUEUES) {
+		if (retry_count > retries) {
 			netdev_warn(netdev, "Login attempts exceeded\n");
 			return -1;
 		}
@@ -862,11 +863,23 @@ static int ibmvnic_login(struct net_device *netdev)
 
 		if (!wait_for_completion_timeout(&adapter->init_done,
 						 timeout)) {
-			netdev_warn(netdev, "Login timed out\n");
-			return -1;
+			netdev_warn(netdev, "Login timed out, retrying...\n");
+			retry = true;
+			adapter->init_done_rc = 0;
+			retry_count++;
+			continue;
 		}
 
-		if (adapter->init_done_rc == PARTIALSUCCESS) {
+		if (adapter->init_done_rc == ABORTED) {
+			netdev_warn(netdev, "Login aborted, retrying...\n");
+			retry = true;
+			adapter->init_done_rc = 0;
+			retry_count++;
+			/* FW or device may be busy, so
+			 * wait a bit before retrying login
+			 */
+			msleep(500);
+		} else if (adapter->init_done_rc == PARTIALSUCCESS) {
 			retry_count++;
 			release_sub_crqs(adapter, 1);
 
-- 
1.8.3.1

