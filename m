Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1622FC018
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Jan 2021 20:36:23 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DKzRR0qc5zDr31
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jan 2021 06:36:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ljp@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Z3yF+SQL; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DKzNw2vzzzDr27
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jan 2021 06:34:01 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10JJXp3q068453; Tue, 19 Jan 2021 14:33:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=BqlUlWxzlpConIcDVjlIxPUOZbHqoqdhaaTBtv0arSs=;
 b=Z3yF+SQLpukAXsAFSJhk6mG6JY6pN+YaSQovbVAm8dwj8z4uN8U93kSE07WDzLPtBhc0
 RXx2ohDLxccLhXYJUflYfXMdCO3/Cx1/hafX1HEhYj7AXVAbTmxK8y+JPQR/zxsjydkc
 6ZOZLDKvsxuHO5VLX88jSMVY3H9dLIsO7dBkiFNFOM3VtGgFNSd/+Qp1VMGiyLtKV/g9
 uBxc60OSyQQlQNLceAl6uIfr+V4F3Xj+ysBK7zklp9fvsbR04wW2Zxp1CdsUNKCxKWJS
 6+Bh74AKev+64x3UXqcYVrtuCdztosVVBzIo4UHZy2fT4XXZMNd5ldG0YfqWqH3FTF2a ow== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36621p77rx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Jan 2021 14:33:52 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10JJQN88027002;
 Tue, 19 Jan 2021 19:33:18 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma02dal.us.ibm.com with ESMTP id 363qs96p1d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Jan 2021 19:33:17 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10JJXGKd20709728
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jan 2021 19:33:16 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1EC1478064;
 Tue, 19 Jan 2021 19:33:16 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 89F3C78063;
 Tue, 19 Jan 2021 19:33:14 +0000 (GMT)
Received: from pompom.ibm.com (unknown [9.85.129.242])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 19 Jan 2021 19:33:14 +0000 (GMT)
From: Lijun Pan <ljp@linux.ibm.com>
To: netdev@vger.kernel.org
Subject: [PATCH net RFC] ibmvnic: device remove has higher precedence over
 reset
Date: Tue, 19 Jan 2021 13:33:13 -0600
Message-Id: <20210119193313.43791-1-ljp@linux.ibm.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-19_09:2021-01-18,
 2021-01-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0 mlxlogscore=952
 clxscore=1011 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101190106
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
Cc: Lijun Pan <ljp@linux.ibm.com>, gregkh@linuxfoundation.org,
 julietk@linux.vnet.ibm.com,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 paulus@samba.org, kernel@pengutronix.de, drt@linux.ibm.com, kuba@kernel.org,
 sukadev@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Returning -EBUSY in ibmvnic_remove() does not actually hold the
removal procedure since driver core doesn't care for the return
value (see __device_release_driver() in drivers/base/dd.c
calling dev->bus->remove()) though vio_bus_remove
(in arch/powerpc/platforms/pseries/vio.c) records the
return value and passes it on. [1]

During the device removal precedure, we should not schedule
any new reset, and rely on the flush_work and flush_delayed_work
to complete the pending resets, and specifically we need to
let __ibmvnic_reset() keep running while in REMOVING state since
flush_work and flush_delayed_work shall call __ibmvnic_reset finally.

[1] https://lore.kernel.org/linuxppc-dev/20210117101242.dpwayq6wdgfdzirl@pengutronix.de/T/#m48f5befd96bc9842ece2a3ad14f4c27747206a53
Reported-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Fixes: 7d7195a026ba ("ibmvnic: Do not process device remove during device reset")
Signed-off-by: Lijun Pan <ljp@linux.ibm.com>
---
 drivers/net/ethernet/ibm/ibmvnic.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
index aed985e08e8a..11f28fd03057 100644
--- a/drivers/net/ethernet/ibm/ibmvnic.c
+++ b/drivers/net/ethernet/ibm/ibmvnic.c
@@ -2235,8 +2235,7 @@ static void __ibmvnic_reset(struct work_struct *work)
 	while (rwi) {
 		spin_lock_irqsave(&adapter->state_lock, flags);
 
-		if (adapter->state == VNIC_REMOVING ||
-		    adapter->state == VNIC_REMOVED) {
+		if (adapter->state == VNIC_REMOVED) {
 			spin_unlock_irqrestore(&adapter->state_lock, flags);
 			kfree(rwi);
 			rc = EBUSY;
@@ -5372,11 +5371,6 @@ static int ibmvnic_remove(struct vio_dev *dev)
 	unsigned long flags;
 
 	spin_lock_irqsave(&adapter->state_lock, flags);
-	if (test_bit(0, &adapter->resetting)) {
-		spin_unlock_irqrestore(&adapter->state_lock, flags);
-		return -EBUSY;
-	}
-
 	adapter->state = VNIC_REMOVING;
 	spin_unlock_irqrestore(&adapter->state_lock, flags);
 
-- 
2.22.0

