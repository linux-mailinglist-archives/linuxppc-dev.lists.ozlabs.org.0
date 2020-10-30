Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4AD29FB0D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 03:10:07 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMm3c1f36zDr2N
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 13:10:04 +1100 (AEDT)
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
 header.s=pp1 header.b=oQAvXiBS; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMl2T1ddhzDqlW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 12:24:00 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09U13Mou058230
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 21:23:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=/8qLAC6rQiiY5NQ65YuU4qWG8zvyF3iP9sxd8IDzD6o=;
 b=oQAvXiBSp/NXzOG2gzoe4hkY/efi/APrhUsEC+2Fx6h6zONWJYeKitKVhwK/Tpjq58fX
 wg1R2l74NKQsTno5onPT6uHp8B1Dos0Kp+JW5/fEnoPFtihp9WiBoa5j4okIEKgIKAsA
 jj/yiKYYH8BFlsMYsL4XRQm0Eq+7f6Y2lgRleab33JXV/Jr+G9kRGWbXcxFhXAIUoRBn
 RrUMH82VrgrY7tFexCvidNOL9cq7pf0QwY49Es96vEHT0K0PRBsqpX5cVR2U3qgEwseP
 t8YbpQ3wa9aSwgQqJQ8sZ37+rpTayv/BFzfgE7qexeAbcO6i3DacdN5Tv5M+YKgCb1GE XA== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34fww7m5vk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 21:23:58 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09U1HNu7027674
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 01:18:32 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma01dal.us.ibm.com with ESMTP id 34cbw9s9xw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 01:18:32 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09U1IULD13959592
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Oct 2020 01:18:31 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E3DA2C6055;
 Fri, 30 Oct 2020 01:18:30 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 80138C6059;
 Fri, 30 Oct 2020 01:18:30 +0000 (GMT)
Received: from localhost (unknown [9.65.225.148])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 30 Oct 2020 01:18:30 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 26/29] powerpc/pseries/hibernation: perform post-suspend
 fixups later
Date: Thu, 29 Oct 2020 20:18:02 -0500
Message-Id: <20201030011805.1224603-27-nathanl@linux.ibm.com>
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
 suspectscore=1 spamscore=0
 clxscore=1015 mlxscore=0 priorityscore=1501 phishscore=0 adultscore=0
 malwarescore=0 mlxlogscore=567 bulkscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010300003
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
2.25.4

