Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DF812373088
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 21:12:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZTy16gdcz3bTZ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 May 2021 05:12:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pRnWiQvl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=drt@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=pRnWiQvl; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZTxZ2T2bz2yjP
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 May 2021 05:12:33 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 144J2eau017279; Tue, 4 May 2021 15:12:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject : date : message-id; s=pp1;
 bh=W/DDofSv+SSI5N7+3mGgxYdQHMS5JRW9elxDZ9ZXkok=;
 b=pRnWiQvl3fyBOLfv3h0K/Kc9Kt4pjSo9TeMOUITFuaqzebePi3AhsHEGNDwtVDN+2OjC
 Xza8Qr0eOCa2NVlc5AX2uFDdTQF8mg89C+apDvIxFT0BSk2awYjqfbUcC6t+VbTzqkld
 6gUCsnkBAC0m9LoPrgUNQgrswjf0vMdWxu5HkLpSIgdGmcNWrNvMriR68Lzddw+3NlFb
 ygPR+f4g6bovo4WgRUoRqpmmkGbw3/L5SwB4ofVmjFP4OBRfkMNLb+cv5vZz/9G/j+Fc
 EYA1+jBqGH/RI9g14jtYBRRcWpXN1JfhPopNwawiuXR0Qd1yO0Wj0XWfzROX/PY0AvBp Lg== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38b99t616a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 May 2021 15:12:23 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 144J7ShL012422;
 Tue, 4 May 2021 19:12:22 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma03wdc.us.ibm.com with ESMTP id 38aym44k1j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 May 2021 19:12:22 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 144JCM7Y41877976
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 4 May 2021 19:12:22 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F20DAAC05B;
 Tue,  4 May 2021 19:12:21 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 41021AC05E;
 Tue,  4 May 2021 19:12:21 +0000 (GMT)
Received: from ltcalpine2-lp16.aus.stglabs.ibm.com (unknown [9.40.193.182])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  4 May 2021 19:12:21 +0000 (GMT)
From: Dany Madden <drt@linux.ibm.com>
To: davem@davemloft.net, kuba@kernel.org
Subject: [PATCH net v3] ibmvnic: Continue with reset if set link down failed
Date: Tue,  4 May 2021 15:11:42 -0400
Message-Id: <20210504191142.2872696-1-drt@linux.ibm.com>
X-Mailer: git-send-email 2.18.2
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: KEU1bcz2c0iIzLtgR32U2QCCkATpsV0g
X-Proofpoint-GUID: KEU1bcz2c0iIzLtgR32U2QCCkATpsV0g
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-04_12:2021-05-04,
 2021-05-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=999 suspectscore=0 mlxscore=0 bulkscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 lowpriorityscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104060000 definitions=main-2105040125
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
Changes in V3:
- Add comment above the code change
---
 drivers/net/ethernet/ibm/ibmvnic.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
index 5788bb956d73..9e005a08d43b 100644
--- a/drivers/net/ethernet/ibm/ibmvnic.c
+++ b/drivers/net/ethernet/ibm/ibmvnic.c
@@ -2017,8 +2017,15 @@ static int do_reset(struct ibmvnic_adapter *adapter,
 			rtnl_unlock();
 			rc = set_link_state(adapter, IBMVNIC_LOGICAL_LNK_DN);
 			rtnl_lock();
-			if (rc)
-				goto out;
+
+			/* Attempted to set the link down. It could fail if the
+			 * vnicserver has already torn down the CRQ. We will
+			 * note it and continue with reset to reinit the CRQ.
+			 */
+			if (rc) {
+				netdev_dbg(netdev,
+					   "Setting link down failed rc=%d. Continue anyway\n", rc);
+			}
 
 			if (adapter->state == VNIC_OPEN) {
 				/* When we dropped rtnl, ibmvnic_open() got
-- 
2.18.2

