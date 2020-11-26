Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B84F32C4BEF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 01:18:52 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ChJJm6b1czDqwM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 11:18:48 +1100 (AEDT)
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
 header.s=pp1 header.b=ADFpXKQ/; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ChJ6D5fH7zDr2j
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Nov 2020 11:09:40 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AQ04O4o131415; Wed, 25 Nov 2020 19:09:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=hS/O9oko7cMPTPnm8CEazRg2cfwhVlziRShqKg7dlj0=;
 b=ADFpXKQ/xNTh52P7n4xP9vWZr1MwQtTIjmPFkdaIcGiJSdDTZfgWvzx2H5Kuw1ygJkS9
 kcEoH/b/TQryzJVksKV9qOz0fHXibcwcIbCTaJfO9WOk+SpENH9UuvG/fvLfJAAhwW92
 xFlKiBAE6Z+8u+iK7Iz/6F0Kec4S5tYfQhZvu6QWlb45jpsDZL79g8yanT3rK/TamiQw
 HvzL6GrZ5Ktfn6E7lsJFT0UHtdrZJ0kUjKnfYC6Tfz2qJ1sld8HHLrsNJKm6bjMnQ7Hj
 7jh8nbcDJ3k3T1GG8K9NuQHKZg31nqHlkCvANB9WWAygHli3pEuz7We1x80+H2TU24iX sQ== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 351suemd9t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Nov 2020 19:09:37 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AQ07bXt027081;
 Thu, 26 Nov 2020 00:09:36 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma01dal.us.ibm.com with ESMTP id 34xth9mann-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Nov 2020 00:09:36 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AQ09ZaP721658
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Nov 2020 00:09:35 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9F569AC05B;
 Thu, 26 Nov 2020 00:09:35 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 402B0AC059;
 Thu, 26 Nov 2020 00:09:35 +0000 (GMT)
Received: from linux-i8xm.aus.stglabs.ibm.com (unknown [9.40.195.200])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 26 Nov 2020 00:09:35 +0000 (GMT)
From: Dany Madden <drt@linux.ibm.com>
To: netdev@vger.kernel.org
Subject: [PATCH net v3 2/9] ibmvnic: stop free_all_rwi on failed reset
Date: Wed, 25 Nov 2020 18:04:25 -0600
Message-Id: <20201126000432.29897-3-drt@linux.ibm.com>
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
 adultscore=0 mlxlogscore=999
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 suspectscore=3 phishscore=0 priorityscore=1501 spamscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

When ibmvnic fails to reset, it breaks out of the reset loop and frees
all of the remaining resets from the workqueue. Doing so prevents the
adapter from recovering if no reset is scheduled after that. Instead,
have the driver continue to process resets on the workqueue.

Remove the no longer need free_all_rwi().

Fixes: ed651a10875f1 ("ibmvnic: Updated reset handling")
Signed-off-by: Dany Madden <drt@linux.ibm.com>
---
 drivers/net/ethernet/ibm/ibmvnic.c | 22 +++-------------------
 1 file changed, 3 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
index dcb23015b6b4..d5a927bb4954 100644
--- a/drivers/net/ethernet/ibm/ibmvnic.c
+++ b/drivers/net/ethernet/ibm/ibmvnic.c
@@ -2173,17 +2173,6 @@ static struct ibmvnic_rwi *get_next_rwi(struct ibmvnic_adapter *adapter)
 	return rwi;
 }
 
-static void free_all_rwi(struct ibmvnic_adapter *adapter)
-{
-	struct ibmvnic_rwi *rwi;
-
-	rwi = get_next_rwi(adapter);
-	while (rwi) {
-		kfree(rwi);
-		rwi = get_next_rwi(adapter);
-	}
-}
-
 static void __ibmvnic_reset(struct work_struct *work)
 {
 	struct ibmvnic_rwi *rwi;
@@ -2253,9 +2242,9 @@ static void __ibmvnic_reset(struct work_struct *work)
 			else
 				adapter->state = reset_state;
 			rc = 0;
-		} else if (rc && rc != IBMVNIC_INIT_FAILED &&
-		    !adapter->force_reset_recovery)
-			break;
+		}
+		if (rc)
+			netdev_dbg(adapter->netdev, "Reset failed, rc=%d\n", rc);
 
 		rwi = get_next_rwi(adapter);
 
@@ -2269,11 +2258,6 @@ static void __ibmvnic_reset(struct work_struct *work)
 		complete(&adapter->reset_done);
 	}
 
-	if (rc) {
-		netdev_dbg(adapter->netdev, "Reset failed\n");
-		free_all_rwi(adapter);
-	}
-
 	clear_bit_unlock(0, &adapter->resetting);
 }
 
-- 
2.26.2

