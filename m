Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B92B824460E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Aug 2020 10:01:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BSbVN5QxZzDqlB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Aug 2020 18:01:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ljp@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=EXFUwVdz; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BSbSL4SJgzDqd3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Aug 2020 17:59:27 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07E7XTXc021608; Fri, 14 Aug 2020 03:59:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=vwr/HM6Tx4UUYPe1DHe4AhZf2+E+q7+xfzMK4iL5iQE=;
 b=EXFUwVdzUAp+Zshas1SfQcZ9MmG1NwEk27iAXRySJvv5EDm5m8SFxXytyFlQVDqkEGsW
 UUMhGLc7uyix0bZUutXn2vy0ognp6mrbvHL2Brrs2NC1jIEPKo2na8cPi6s7WJTmADmE
 k/xT22oFPDweEpA7gsssk7afvpkvJlKvDsQXj4e26rzmRN5Jla56YHjAdsfWkE1qAnMN
 njfO7VEH0o1o/uwBpbL1m+a8HZLw3+cp892JTrly9GvJUuY30Du8oCGJn1eyW4EznBE4
 +LMYsBW37gLR7qGLwkPWo1gI0qf6aOIxpkVSMOVuVoa8tqo4TLc3RTFb0cRI5qYQyWI3 ug== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32srauksvd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Aug 2020 03:59:24 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07E7t3Yx013560;
 Fri, 14 Aug 2020 07:59:23 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma04dal.us.ibm.com with ESMTP id 32skp9vn3a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Aug 2020 07:59:23 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07E7xNbF53871008
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Aug 2020 07:59:23 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EF831AC059;
 Fri, 14 Aug 2020 07:59:22 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8FAB5AC05B;
 Fri, 14 Aug 2020 07:59:22 +0000 (GMT)
Received: from pompom.ibm.com (unknown [9.160.68.30])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 14 Aug 2020 07:59:22 +0000 (GMT)
From: Lijun Pan <ljp@linux.ibm.com>
To: netdev@vger.kernel.org
Subject: [PATCH net 1/5] ibmvnic: print caller in several error messages
Date: Fri, 14 Aug 2020 02:59:17 -0500
Message-Id: <20200814075921.88745-2-ljp@linux.ibm.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200814075921.88745-1-ljp@linux.ibm.com>
References: <20200814075921.88745-1-ljp@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-14_04:2020-08-13,
 2020-08-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 suspectscore=1 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0
 malwarescore=0 spamscore=0 mlxscore=0 lowpriorityscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008140058
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

The error messages in the changed functions are exactly the same.
In order to differentiate them and make debugging easier,
we print the function names in the error messages.

Signed-off-by: Lijun Pan <ljp@linux.ibm.com>
---
 drivers/net/ethernet/ibm/ibmvnic.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
index 5afb3c9c52d2..aba1cd9862ac 100644
--- a/drivers/net/ethernet/ibm/ibmvnic.c
+++ b/drivers/net/ethernet/ibm/ibmvnic.c
@@ -1864,7 +1864,7 @@ static int do_change_param_reset(struct ibmvnic_adapter *adapter,
 
 	if (rc) {
 		netdev_err(adapter->netdev,
-			   "Couldn't initialize crq. rc=%d\n", rc);
+			   "%s: Couldn't initialize crq. rc=%d\n", __func__, rc);
 		return rc;
 	}
 
@@ -2089,7 +2089,7 @@ static int do_hard_reset(struct ibmvnic_adapter *adapter,
 	rc = init_crq_queue(adapter);
 	if (rc) {
 		netdev_err(adapter->netdev,
-			   "Couldn't initialize crq. rc=%d\n", rc);
+			   "%s: Couldn't initialize crq. rc=%d\n", __func__, rc);
 		return rc;
 	}
 
@@ -2912,7 +2912,7 @@ static struct ibmvnic_sub_crq_queue *init_sub_crq_queue(struct ibmvnic_adapter
 		rc = ibmvnic_reset_crq(adapter);
 
 	if (rc == H_CLOSED) {
-		dev_warn(dev, "Partner adapter not ready, waiting.\n");
+		dev_warn(dev, "%s: Partner adapter not ready, waiting.\n", __func__);
 	} else if (rc) {
 		dev_warn(dev, "Error %d registering sub-crq\n", rc);
 		goto reg_failed;
@@ -4865,7 +4865,7 @@ static int ibmvnic_reset_crq(struct ibmvnic_adapter *adapter)
 
 	if (rc == H_CLOSED)
 		/* Adapter is good, but other end is not ready */
-		dev_warn(dev, "Partner adapter not ready\n");
+		dev_warn(dev, "%s: Partner adapter not ready\n", __func__);
 	else if (rc != 0)
 		dev_warn(dev, "Couldn't register crq (rc=%d)\n", rc);
 
@@ -4926,7 +4926,7 @@ static int init_crq_queue(struct ibmvnic_adapter *adapter)
 	retrc = rc;
 
 	if (rc == H_CLOSED) {
-		dev_warn(dev, "Partner adapter not ready\n");
+		dev_warn(dev, "%s: Partner adapter not ready\n", __func__);
 	} else if (rc) {
 		dev_warn(dev, "Error %d opening adapter\n", rc);
 		goto reg_crq_failed;
@@ -5129,8 +5129,8 @@ static int ibmvnic_probe(struct vio_dev *dev, const struct vio_device_id *id)
 	do {
 		rc = init_crq_queue(adapter);
 		if (rc) {
-			dev_err(&dev->dev, "Couldn't initialize crq. rc=%d\n",
-				rc);
+			dev_err(&dev->dev, "%s: Couldn't initialize crq. rc=%d\n",
+				__func__, rc);
 			goto ibmvnic_init_fail;
 		}
 
-- 
2.23.0

