Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA042C4BFA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 01:22:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ChJP44dt6zDr1g
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 11:22:32 +1100 (AEDT)
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
 header.s=pp1 header.b=Kjt31/yB; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ChJ6G2FLqzDr1g
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Nov 2020 11:09:41 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AQ01pIs084854; Wed, 25 Nov 2020 19:09:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=CPDQiYtOmUnY41iJbFpa2/GoZGRQL52GZ7KNyHDGLAU=;
 b=Kjt31/yBDvEUKlff5SE/haCP67rapzXXS0vsiSP5KruVQAVcgPXxtvP47+xuIxphnyTS
 /Idp1Mk3JLtrF40ik9uLRRScPthVGb8hETkvccQ1Yil+BzCa+GbI9ZnmJnuNjwulKvXD
 GPfep4MncJhFqoaF03W7PkZUO1YVyv3aVxAX1NTanMsRl7i9pxwOkpNyCgy2k4YNvDzk
 //Ozr4q2uu1NdFnHTGoyHovxUfnfa/wbSAc//KTVRV29YIU61MmNuHzCUC566ziHrHxt
 /d0xAYlhiGe6nS8dmkGz0uC2UEH+lRuMn2CT2F+GoSOlmaHQEKSI+0zA/1pAT3MW+Tu0 Qw== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 35200dhxuu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Nov 2020 19:09:39 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AQ083dZ023017;
 Thu, 26 Nov 2020 00:09:39 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma04dal.us.ibm.com with ESMTP id 351uh82pfy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Nov 2020 00:09:39 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AQ09ck114549496
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Nov 2020 00:09:38 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8B151AC059;
 Thu, 26 Nov 2020 00:09:38 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2C68FAC05B;
 Thu, 26 Nov 2020 00:09:38 +0000 (GMT)
Received: from linux-i8xm.aus.stglabs.ibm.com (unknown [9.40.195.200])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 26 Nov 2020 00:09:38 +0000 (GMT)
From: Dany Madden <drt@linux.ibm.com>
To: netdev@vger.kernel.org
Subject: [PATCH net v3 8/9] ibmvnic: no reset timeout for 5 seconds after reset
Date: Wed, 25 Nov 2020 18:04:31 -0600
Message-Id: <20201126000432.29897-9-drt@linux.ibm.com>
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
 mlxlogscore=999 suspectscore=1 mlxscore=0 malwarescore=0 impostorscore=0
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

Reset timeout is going off right after adapter reset. This patch ensures
that timeout is scheduled if it has been 5 seconds since the last reset.
5 seconds is the default watchdog timeout.

Fixes: ed651a10875f1 ("ibmvnic: Updated reset handling")
Signed-off-by: Dany Madden <drt@linux.ibm.com>
---
 drivers/net/ethernet/ibm/ibmvnic.c | 11 +++++++++--
 drivers/net/ethernet/ibm/ibmvnic.h |  2 ++
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
index 9005fab09e15..a17856be2828 100644
--- a/drivers/net/ethernet/ibm/ibmvnic.c
+++ b/drivers/net/ethernet/ibm/ibmvnic.c
@@ -2253,6 +2253,7 @@ static void __ibmvnic_reset(struct work_struct *work)
 			rc = do_reset(adapter, rwi, reset_state);
 		}
 		kfree(rwi);
+		adapter->last_reset_time = jiffies;
 
 		if (rc)
 			netdev_dbg(adapter->netdev, "Reset failed, rc=%d\n", rc);
@@ -2356,7 +2357,13 @@ static void ibmvnic_tx_timeout(struct net_device *dev, unsigned int txqueue)
 			   "Adapter is resetting, skip timeout reset\n");
 		return;
 	}
-
+	/* No queuing up reset until at least 5 seconds (default watchdog val)
+	 * after last reset
+	 */
+	if (time_before(jiffies, (adapter->last_reset_time + dev->watchdog_timeo))) {
+		netdev_dbg(dev, "Not yet time to tx timeout.\n");
+		return;
+	}
 	ibmvnic_reset(adapter, VNIC_RESET_TIMEOUT);
 }
 
@@ -5277,7 +5284,7 @@ static int ibmvnic_probe(struct vio_dev *dev, const struct vio_device_id *id)
 	adapter->state = VNIC_PROBED;
 
 	adapter->wait_for_reset = false;
-
+	adapter->last_reset_time = jiffies;
 	return 0;
 
 ibmvnic_register_fail:
diff --git a/drivers/net/ethernet/ibm/ibmvnic.h b/drivers/net/ethernet/ibm/ibmvnic.h
index 6f0a701c4a38..b21092f5f9c1 100644
--- a/drivers/net/ethernet/ibm/ibmvnic.h
+++ b/drivers/net/ethernet/ibm/ibmvnic.h
@@ -1088,6 +1088,8 @@ struct ibmvnic_adapter {
 	unsigned long resetting;
 	bool napi_enabled, from_passive_init;
 	bool login_pending;
+	/* last device reset time */
+	unsigned long last_reset_time;
 
 	bool failover_pending;
 	bool force_reset_recovery;
-- 
2.26.2

