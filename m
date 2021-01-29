Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D55DA308488
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jan 2021 05:35:58 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DRkzv2qlyzDrQM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jan 2021 15:35:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ljp@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=VuuTMWYV; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DRky207n7zDrR3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jan 2021 15:34:17 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10T4VcJG016469; Thu, 28 Jan 2021 23:34:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=NpvlBPIHVa5Cw0Brwc2kkYQevgXKGFwlzXiWleL2Ow8=;
 b=VuuTMWYVVxJyOYIjRFIBiqLRRCterIyvepGqr4sOjzjCTBPUQdhMaCKRtLYFfWiEImy2
 u6HH/hqZRpTibur5Bz12YWjx9aHptANkK+EisXBD3OYjN7aUSAsWT25ROZPkVqP81rLv
 jIQqzf+Xo/r1OwDHaHFI7LuLr5E6wlsHTrPC9VIbMswKlisukiL3lMujKLrxIOqXYrz5
 WImhJwspXHKCKFAv4DodGAJKmem0Vc+rRKuWIksGsIsDxnCg+SYdEF1AbfCROgVtw0tM
 V8PtYeeGHtBwKa9AWXAibOlV3QbR905f2IX4WQamKTz8ft3xdjoAC7iuTLGiU4cevUOB gw== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36c7sqvksk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Jan 2021 23:34:04 -0500
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10T4WspN032714;
 Fri, 29 Jan 2021 04:34:04 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma05wdc.us.ibm.com with ESMTP id 36a3qc9knb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Jan 2021 04:34:04 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10T4Y3Ww14025032
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Jan 2021 04:34:03 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2F731AE05C;
 Fri, 29 Jan 2021 04:34:03 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4EF4DAE05F;
 Fri, 29 Jan 2021 04:34:02 +0000 (GMT)
Received: from pompom.ibm.com (unknown [9.80.201.59])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 29 Jan 2021 04:34:02 +0000 (GMT)
From: Lijun Pan <ljp@linux.ibm.com>
To: netdev@vger.kernel.org
Subject: [PATCH net v2] ibmvnic: device remove has higher precedence over reset
Date: Thu, 28 Jan 2021 22:34:01 -0600
Message-Id: <20210129043402.95744-1-ljp@linux.ibm.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-29_02:2021-01-28,
 2021-01-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 adultscore=0 mlxlogscore=999 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101290019
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

During the device removal precedure, checking for resetting
bit is dropped so that we can continue executing all the
cleanup calls in the rest of the remove function. Otherwise,
it can cause latent memory leaks and kernel crashes.

[1] https://lore.kernel.org/linuxppc-dev/20210117101242.dpwayq6wdgfdzirl@pengutronix.de/T/#m48f5befd96bc9842ece2a3ad14f4c27747206a53
Reported-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Fixes: 7d7195a026ba ("ibmvnic: Do not process device remove during device reset")
Signed-off-by: Lijun Pan <ljp@linux.ibm.com>
---
v2: drop v1's deletion of REMOVING check in __ibmvnic_reset.

 drivers/net/ethernet/ibm/ibmvnic.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
index 9778c83150f1..e19fa8bc763c 100644
--- a/drivers/net/ethernet/ibm/ibmvnic.c
+++ b/drivers/net/ethernet/ibm/ibmvnic.c
@@ -5438,11 +5438,6 @@ static int ibmvnic_remove(struct vio_dev *dev)
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
2.23.0

