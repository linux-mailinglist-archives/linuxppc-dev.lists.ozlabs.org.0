Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B57624948B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 07:42:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWcB513LxzDqwF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 15:42:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ljp@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=OQvYlomg; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWc1f0WwbzDqrF
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Aug 2020 15:35:17 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07J5Wi9q129447; Wed, 19 Aug 2020 01:35:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=O9IIOQ1K6JePfyVHDRPg/tI1B+Vg13ObJD4Fn8XH28w=;
 b=OQvYlomgeTth7cbQfBdXVs0/iOu9oIcXPP3iL7OwMjP0GoQ1axACRWXhmrfjYyhrMwok
 Ikqcf+tz4ktxUQDVDOpaRwV0nxqnGXnD8A5ieNdGQHNamNx/IpBsJYstPqeNgL2pdzen
 0lk7nB6SjlJiBZdranEUdswUHkfxxLd7kCoIJ22zrvdw8VG31VwG9OXRkhfrfTN/39Y/
 w58g5Qnwemiqhj06BFgWfNOmh2pn/n2AGM3ZI6wGYDC36orp/ck7oQeD2StJyds5qqy+
 lr8uOHHkBPmLlwyhMjHCR8637ydG83WtuW4K/7667LF0d3cGqd11nwCUJFpN+u6oAszL 2w== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3304t29swu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Aug 2020 01:35:15 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07J5UpqG026871;
 Wed, 19 Aug 2020 05:35:14 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma03wdc.us.ibm.com with ESMTP id 3304ce1kd6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Aug 2020 05:35:14 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07J5ZE1954591932
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Aug 2020 05:35:14 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6B5FFAC05E;
 Wed, 19 Aug 2020 05:35:14 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1498CAC05B;
 Wed, 19 Aug 2020 05:35:14 +0000 (GMT)
Received: from pompom.ibm.com (unknown [9.160.104.33])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 19 Aug 2020 05:35:13 +0000 (GMT)
From: Lijun Pan <ljp@linux.ibm.com>
To: netdev@vger.kernel.org
Subject: [PATCH net-next 3/5] ibmvnic: improve ibmvnic_init and
 ibmvnic_reset_init
Date: Wed, 19 Aug 2020 00:35:10 -0500
Message-Id: <20200819053512.3619-4-ljp@linux.ibm.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200819053512.3619-1-ljp@linux.ibm.com>
References: <20200819053512.3619-1-ljp@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-19_02:2020-08-18,
 2020-08-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0
 suspectscore=1 mlxscore=0 lowpriorityscore=0 mlxlogscore=999
 malwarescore=0 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008190042
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
 drivers/net/ethernet/ibm/ibmvnic.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
index 50e86e65961e..e366fd42a8c4 100644
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
+		dev_err(dev, "%s: Send crq init failed with error %d\n", __func__, rc);
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
+		dev_err(dev, "%s: Send crq init failed with error %d\n", __func__, rc);
+		return rc;
+	}
+
 	if (!wait_for_completion_timeout(&adapter->init_done, timeout)) {
 		dev_err(dev, "Initialization sequence timed out\n");
 		return -1;
-- 
2.23.0

