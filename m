Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D032C4BE9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 01:17:14 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ChJGv2Y0pzDr49
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 11:17:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=drt@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ik9Z2ugU; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ChJ6D3HwVzDqwp
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Nov 2020 11:09:39 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AQ01ngf084748; Wed, 25 Nov 2020 19:09:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=cyXkgWoUxwG2aTyA95OgnCiMIPfUWZNIxMPqUAeOkSE=;
 b=ik9Z2ugUEXjuKY9N8y6ORrGypd4bjqBmkHFXk5tnWlUBP6uSiQNvCVL/41B1M3wlB8qy
 JP43GtzbMkaRRSJIzZrPn8apcLhPTKFlIE9mxHs4x9z8gco+kbhuvp4y/RRHwMdMoh2j
 IC7wHZJ06xIthCgoiF2TFIaT8mBQo0oxpWKTaGMmwNhKj01EQJAMU6/EU7+iMoIoAi1q
 H6NmEvmDU9c/xrLR+UKccO0jNYR161CojOb6+kXNwzW8v+gJGV48slEK4ywtOsvDSTwF
 ShGIkJI4hAk4d9Hastp2BfkiTjouVQCe4jHNt7SC0mYNEypZIbK37YSkGXzrvqFhBj8p dQ== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 35200dhxtv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Nov 2020 19:09:37 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AQ07Doq010147;
 Thu, 26 Nov 2020 00:09:36 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma03wdc.us.ibm.com with ESMTP id 35133p3hpf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Nov 2020 00:09:36 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AQ09ahJ64094642
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Nov 2020 00:09:36 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2E778AC05E;
 Thu, 26 Nov 2020 00:09:36 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BAAB9AC064;
 Thu, 26 Nov 2020 00:09:35 +0000 (GMT)
Received: from linux-i8xm.aus.stglabs.ibm.com (unknown [9.40.195.200])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 26 Nov 2020 00:09:35 +0000 (GMT)
From: Dany Madden <drt@linux.ibm.com>
To: netdev@vger.kernel.org
Subject: [PATCH net v3 3/9] ibmvnic: avoid memset null scrq msgs
Date: Wed, 25 Nov 2020 18:04:26 -0600
Message-Id: <20201126000432.29897-4-drt@linux.ibm.com>
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
 lowpriorityscore=0
 mlxlogscore=999 suspectscore=3 mlxscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

scrq->msgs could be NULL during device reset, causing Linux to crash.
So, check before memset scrq->msgs.

Fixes: c8b2ad0a4a901 ("ibmvnic: Sanitize entire SCRQ buffer on reset")
Signed-off-by: Dany Madden <drt@linux.ibm.com>
Signed-off-by: Lijun Pan <ljp@linux.ibm.com>
---
 drivers/net/ethernet/ibm/ibmvnic.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
index d5a927bb4954..b08f95017825 100644
--- a/drivers/net/ethernet/ibm/ibmvnic.c
+++ b/drivers/net/ethernet/ibm/ibmvnic.c
@@ -2845,15 +2845,26 @@ static int reset_one_sub_crq_queue(struct ibmvnic_adapter *adapter,
 {
 	int rc;
 
+	if (!scrq) {
+		netdev_dbg(adapter->netdev,
+			   "Invalid scrq reset. irq (%d) or msgs (%p).\n",
+			   scrq->irq, scrq->msgs);
+		return -EINVAL;
+	}
+
 	if (scrq->irq) {
 		free_irq(scrq->irq, scrq);
 		irq_dispose_mapping(scrq->irq);
 		scrq->irq = 0;
 	}
-
-	memset(scrq->msgs, 0, 4 * PAGE_SIZE);
-	atomic_set(&scrq->used, 0);
-	scrq->cur = 0;
+	if (scrq->msgs) {
+		memset(scrq->msgs, 0, 4 * PAGE_SIZE);
+		atomic_set(&scrq->used, 0);
+		scrq->cur = 0;
+	} else {
+		netdev_dbg(adapter->netdev, "Invalid scrq reset\n");
+		return -EINVAL;
+	}
 
 	rc = h_reg_sub_crq(adapter->vdev->unit_address, scrq->msg_token,
 			   4 * PAGE_SIZE, &scrq->crq_num, &scrq->hw_irq);
-- 
2.26.2

