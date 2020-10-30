Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5591329FB03
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 03:04:02 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMlwb408wzDr09
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 13:03:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Wuuzn/nj; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMkwD1HmCzDqlF
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 12:18:35 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09U12I9w036962
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 21:18:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=fbp7l6K/FD7JoW/xtxmx5i01zC7SJQfwhZcORN3EOjs=;
 b=Wuuzn/njzvWAwR3x1LV/9oPE0PQoxWXGPKDYyiQaPuK9HQoLDVcdqPzDdZjtfV3tyraT
 TD6SaUOd4tFRbJKSPCqWeJk7lO3W2zvSiC30tzjny70ncUPt/yw1nAuii/+cj2QObDs0
 Oz6/ws2v6ItNveOsMjXYTjxect8LYIBGsZx7lYz+78ikjK0mn2Vr3s5hg0k78tFmShn1
 mzsu+hDusjCS0mrdzBZtQ8NQPdivgCxSDz3dHG6O9ERiI75sVk8uyUDmQ4xWNfuDxDIt
 ABCO8YZC+DD5gJeBGrcd1S7Bn4J/7LL0TYsYJti+YQldpFHaS1kYwFXG8O0tOCoiq15D Nw== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34fyqs9bjh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 21:18:33 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09U1HXx0006730
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 01:18:32 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma04wdc.us.ibm.com with ESMTP id 34fv3f626h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 01:18:32 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09U1IVWR48234782
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Oct 2020 01:18:32 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DC60B2805A;
 Fri, 30 Oct 2020 01:18:31 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9704528058;
 Fri, 30 Oct 2020 01:18:31 +0000 (GMT)
Received: from localhost (unknown [9.65.225.148])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 30 Oct 2020 01:18:31 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 27/29] powerpc/pseries/hibernation: remove prepare_late()
 callback
Date: Thu, 29 Oct 2020 20:18:03 -0500
Message-Id: <20201030011805.1224603-28-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201030011805.1224603-1-nathanl@linux.ibm.com>
References: <20201030011805.1224603-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-10-29_12:2020-10-29,
 2020-10-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=1
 adultscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 impostorscore=0 phishscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010300001
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
Cc: tyreld@linux.ibm.com, ajd@linux.ibm.com, mmc@linux.vnet.ibm.com,
 cforno12@linux.vnet.ibm.com, drt@linux.vnet.ibm.com, brking@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pseries hibernate code no longer calls into the original
join/suspend code in kernel/rtas.c, so pseries_prepare_late() and
related code don't accomplish anything now.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/suspend.c | 25 ------------------------
 1 file changed, 25 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/suspend.c b/arch/powerpc/platforms/pseries/suspend.c
index 589a91730db8..1b902cbf85c5 100644
--- a/arch/powerpc/platforms/pseries/suspend.c
+++ b/arch/powerpc/platforms/pseries/suspend.c
@@ -15,9 +15,6 @@
 #include <asm/topology.h>
 
 static struct device suspend_dev;
-static DECLARE_COMPLETION(suspend_work);
-static struct rtas_suspend_me_data suspend_data;
-static atomic_t suspending;
 
 /**
  * pseries_suspend_begin - First phase of hibernation
@@ -61,23 +58,6 @@ static int pseries_suspend_enter(suspend_state_t state)
 	return rtas_ibm_suspend_me(NULL);
 }
 
-/**
- * pseries_prepare_late - Prepare to suspend all other CPUs
- *
- * Return value:
- * 	0 on success / other on failure
- **/
-static int pseries_prepare_late(void)
-{
-	atomic_set(&suspending, 1);
-	atomic_set(&suspend_data.working, 0);
-	atomic_set(&suspend_data.done, 0);
-	atomic_set(&suspend_data.error, 0);
-	suspend_data.complete = &suspend_work;
-	reinit_completion(&suspend_work);
-	return 0;
-}
-
 /**
  * store_hibernate - Initiate partition hibernation
  * @dev:		subsys root device
@@ -152,7 +132,6 @@ static struct bus_type suspend_subsys = {
 
 static const struct platform_suspend_ops pseries_suspend_ops = {
 	.valid		= suspend_valid_only_mem,
-	.prepare_late	= pseries_prepare_late,
 	.enter		= pseries_suspend_enter,
 };
 
@@ -195,10 +174,6 @@ static int __init pseries_suspend_init(void)
 	if (!firmware_has_feature(FW_FEATURE_LPAR))
 		return 0;
 
-	suspend_data.token = rtas_token("ibm,suspend-me");
-	if (suspend_data.token == RTAS_UNKNOWN_SERVICE)
-		return 0;
-
 	if ((rc = pseries_suspend_sysfs_register(&suspend_dev)))
 		return rc;
 
-- 
2.25.4

