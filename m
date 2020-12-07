Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 519EF2D1D8B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Dec 2020 23:42:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cqdc44LqkzDqHP
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Dec 2020 09:42:28 +1100 (AEDT)
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
 header.s=pp1 header.b=VysZeRiN; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CqcVJ4l4LzDqRg
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Dec 2020 08:52:24 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B7LX4V6062702
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 7 Dec 2020 16:52:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=vX3eXf1DaVk7B6pgB+UH3wLn05S8ugiW3JG1d7HTXI8=;
 b=VysZeRiNTmPT6PAqeKLX1xf0fgyno2JJFAXLC/hy8GjMsIssqxr67rCiY2ARSa/wRNI3
 vxVvR2dWHH9/owEB/GJUXabWjlYfOsoXZfsmkk+FcTs1yA+XOoqoZwqKPz4Leqp26xAC
 pinwQp2J0mhGhVXbjhu6eE+Lm0JhsMEZuI8OD1qJRBVzG0HHXXSB5e0mnI9cCNw1Rl7c
 LXvIZZ2yGlPjkbaWBMuoJMC2A86zG6jDFEDiGusk2E1hSTUoc1OSpRqhEcR09iMmS7ds
 aNYddfGMRWUWkYXzHRX/1xGYi8bp/bARaFFTzI35mEMEpXkfSz73F3VjBNpOws0jo2Gs 2A== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 359p7xdgmm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Dec 2020 16:52:21 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B7LlxZ8031517
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 7 Dec 2020 21:52:20 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma02dal.us.ibm.com with ESMTP id 3581u9fq55-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Dec 2020 21:52:20 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B7LqKeW24248658
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 7 Dec 2020 21:52:20 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EDBDBAC05E;
 Mon,  7 Dec 2020 21:52:19 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BE083AC059;
 Mon,  7 Dec 2020 21:52:19 +0000 (GMT)
Received: from localhost (unknown [9.160.57.67])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  7 Dec 2020 21:52:19 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 26/28] powerpc/pseries/hibernation: remove prepare_late()
 callback
Date: Mon,  7 Dec 2020 15:51:58 -0600
Message-Id: <20201207215200.1785968-27-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201207215200.1785968-1-nathanl@linux.ibm.com>
References: <20201207215200.1785968-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-07_16:2020-12-04,
 2020-12-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=1
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012070140
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
2.28.0

