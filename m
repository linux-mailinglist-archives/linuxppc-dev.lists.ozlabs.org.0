Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A772D1D9D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Dec 2020 23:44:40 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CqdfY35jpzDqM7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Dec 2020 09:44:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=n2r2yPLu; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CqcVJ3pg9zDqLx
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Dec 2020 08:52:24 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B7LRrHk170860
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 7 Dec 2020 16:52:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=3XiDeQTRhInGcWLnt2U60XUTzrMF9SlAdHA+bD2+c3A=;
 b=n2r2yPLu5tbz+O7j9OyhOpSx4SBad4kYs4GnNe/i3oBv2VnNwV1PEY5LEy41D9WLF+X5
 836eteiXDJK6sXwDGGQhSa8I2VIrK1KDz02yTu0nJp/bG1ZhjKFXFAYjKHw9ukoHqcHv
 D8M05X6Pqc0RfFDLZFjXokfQlz8HEdsIBW98u8OBhODYQRyXIKW+WSb5oIO2qVeRe7Qt
 /Yw28LOJ0aHGAAGYvK+bb73qmLvmPyrKL4pV9/+oHGyOyc5wYU27WxtvIAv0bIJtaJ/M
 fF2lbSGjcAkDqVN5LuxKJcxLNMkJaOXp4gPNg/oRWcbLtME6gdh/wPMzrRoZlXxvONT8 PQ== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 359rg8741d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Dec 2020 16:52:20 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B7LmIRh024604
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 7 Dec 2020 21:52:20 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma03dal.us.ibm.com with ESMTP id 3581u8ymwe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Dec 2020 21:52:20 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B7LqJtX11141704
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 7 Dec 2020 21:52:19 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5693EAC05B;
 Mon,  7 Dec 2020 21:52:19 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 178F6AC059;
 Mon,  7 Dec 2020 21:52:19 +0000 (GMT)
Received: from localhost (unknown [9.160.57.67])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  7 Dec 2020 21:52:18 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 25/28] powerpc/pseries/hibernation: perform post-suspend
 fixups later
Date: Mon,  7 Dec 2020 15:51:57 -0600
Message-Id: <20201207215200.1785968-26-nathanl@linux.ibm.com>
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
 mlxscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=1 mlxlogscore=630
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012070132
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

The pseries hibernate code calls post_mobility_fixup() which is sort
of a dumping ground of fixups that need to run after resuming from
suspend regardless of whether suspend was a hibernation or a
migration. Calling post_mobility_fixup() from
pseries_suspend_enable_irqs() runs this code early in resume with
devices suspended and only one CPU up, while the much more commonly
used migration case runs these fixups in a more typical process
context.

Call post_mobility_fixup() after the suspend core returns a success
status to the hibernate sysfs store method and remove
pseries_suspend_enable_irqs().

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/suspend.c | 21 ++++-----------------
 1 file changed, 4 insertions(+), 17 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/suspend.c b/arch/powerpc/platforms/pseries/suspend.c
index 6a94cc0deb88..589a91730db8 100644
--- a/arch/powerpc/platforms/pseries/suspend.c
+++ b/arch/powerpc/platforms/pseries/suspend.c
@@ -50,21 +50,6 @@ static int pseries_suspend_begin(u64 stream_id)
 	return 0;
 }
 
-/**
- * pseries_suspend_enable_irqs
- *
- * Post suspend configuration updates
- *
- **/
-static void pseries_suspend_enable_irqs(void)
-{
-	/*
-	 * Update configuration which can be modified based on device tree
-	 * changes during resume.
-	 */
-	post_mobility_fixup();
-}
-
 /**
  * pseries_suspend_enter - Final phase of hibernation
  *
@@ -127,8 +112,11 @@ static ssize_t store_hibernate(struct device *dev,
 	if (!rc)
 		rc = pm_suspend(PM_SUSPEND_MEM);
 
-	if (!rc)
+	if (!rc) {
 		rc = count;
+		post_mobility_fixup();
+	}
+
 
 	return rc;
 }
@@ -214,7 +202,6 @@ static int __init pseries_suspend_init(void)
 	if ((rc = pseries_suspend_sysfs_register(&suspend_dev)))
 		return rc;
 
-	ppc_md.suspend_enable_irqs = pseries_suspend_enable_irqs;
 	suspend_set_ops(&pseries_suspend_ops);
 	return 0;
 }
-- 
2.28.0

