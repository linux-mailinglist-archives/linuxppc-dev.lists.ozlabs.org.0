Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 720CE3661AE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 23:36:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPxpR2f3nz304J
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 07:36:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EHWjaaxG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=drt@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=EHWjaaxG; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPxp14s2Yz2yZC
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Apr 2021 07:36:24 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13KLYiOp019260; Tue, 20 Apr 2021 17:36:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject : date : message-id; s=pp1;
 bh=279KTkTlVNPPXoGes996qXDFJXDvMSQYOJw4ZGTV3gY=;
 b=EHWjaaxGrMGntr/+VSIrQxMsz0q421GO73ws/1oW6RpdeBp+TElZfzO4p27T5Hx6sHit
 pJd8+qw5SqzjtN4j+GxHed4KnjOqlREnUD+elISQFNq6uE2JhBdbSd2DYjAp+cbn8Hyd
 hojDvaepr1LL2vx6oAf40nN4x7N16VF0VFC1qoKIpLs07stBJwjshyWJ+lhWZ1Tn05oP
 uGccHqcNZ8VKcALv8+68b3CXkkIajlZpPhZkvij0DOWd6yT/Q57NXgQ1H4Grk3CrMwpz
 UXeFvCOKLdEqnueCSHVWci5ZTzy7qeFAcNCF1hbbXKCWzPIHbBEMP+VWNYco1SdqTdol Ew== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3821dk24m1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Apr 2021 17:36:12 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13KLShBw031741;
 Tue, 20 Apr 2021 21:36:11 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma01dal.us.ibm.com with ESMTP id 37yqaa4hjp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Apr 2021 21:36:11 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13KLaBu532244124
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Apr 2021 21:36:11 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E8DFBAE060;
 Tue, 20 Apr 2021 21:36:10 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 52FC6AE05F;
 Tue, 20 Apr 2021 21:36:10 +0000 (GMT)
Received: from ltcalpine2-lp16.aus.stglabs.ibm.com (unknown [9.40.195.199])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 20 Apr 2021 21:36:10 +0000 (GMT)
From: Dany Madden <drt@linux.ibm.com>
To: davem@davemloft.net, kuba@kernel.org
Subject: [PATCH V2 net] ibmvnic: Continue with reset if set link down failed
Date: Tue, 20 Apr 2021 17:35:17 -0400
Message-Id: <20210420213517.24171-1-drt@linux.ibm.com>
X-Mailer: git-send-email 2.18.2
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: eAGn6iyy4PhayeiLV7RrjpBpq3V1izUI
X-Proofpoint-ORIG-GUID: eAGn6iyy4PhayeiLV7RrjpBpq3V1izUI
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-20_11:2021-04-20,
 2021-04-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 clxscore=1011 impostorscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104200150
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
Cc: tlfalcon@linux.ibm.com, netdev@vger.kernel.org, paulus@samba.org,
 drt@linux.ibm.com, sukadev@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When ibmvnic gets a FATAL error message from the vnicserver, it marks
the Command Respond Queue (CRQ) inactive and resets the adapter. If this
FATAL reset fails and a transmission timeout reset follows, the CRQ is
still inactive, ibmvnic's attempt to set link down will also fail. If
ibmvnic abandons the reset because of this failed set link down and this
is the last reset in the workqueue, then this adapter will be left in an
inoperable state.

Instead, make the driver ignore this link down failure and continue to
free and re-register CRQ so that the adapter has an opportunity to
recover.

Fixes: ed651a10875f ("ibmvnic: Updated reset handling")
Signed-off-by: Dany Madden <drt@linux.ibm.com>
Reviewed-by: Rick Lindsley <ricklind@linux.ibm.com>
Reviewed-by: Sukadev Bhattiprolu <sukadev@linux.ibm.com>
---
Changes in V2:
- Update description to clarify background for the patch
- Include Reviewed-by tags
---
 drivers/net/ethernet/ibm/ibmvnic.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
index ffb2a91750c7..4bd8c5d1a275 100644
--- a/drivers/net/ethernet/ibm/ibmvnic.c
+++ b/drivers/net/ethernet/ibm/ibmvnic.c
@@ -1970,8 +1970,10 @@ static int do_reset(struct ibmvnic_adapter *adapter,
 			rtnl_unlock();
 			rc = set_link_state(adapter, IBMVNIC_LOGICAL_LNK_DN);
 			rtnl_lock();
-			if (rc)
-				goto out;
+			if (rc) {
+				netdev_dbg(netdev,
+					   "Setting link down failed rc=%d. Continue anyway\n", rc);
+			}
 
 			if (adapter->state == VNIC_OPEN) {
 				/* When we dropped rtnl, ibmvnic_open() got
-- 
2.26.2

