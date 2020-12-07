Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FB12D1D5A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Dec 2020 23:32:48 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CqdNr68P7zDqML
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Dec 2020 09:32:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Bc8HaV5a; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CqcV956V6zDqTJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Dec 2020 08:52:17 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B7LXjT8109553
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 7 Dec 2020 16:52:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=r7kPglhuh93Viz2y5EFHHNhspbCuRRG4gCLv27zG1Dw=;
 b=Bc8HaV5ashxxN4ZsUdWb6PQWMHwOyYy6aQP26l9cSgczs7CV7qXDMyXRo/jriDUBWKmN
 953W8TqUUP+EcdnJx2f2FcGdEP3X7l1NwXfU/MHUpnxdUYIgh4yk6QjY/OQuCcqQMpLP
 P+Wt5M4JjbxP0jBD1zGew8Yd5T1tp7cUWOWkOe0TARO0AXFI+HwVnToF3pTE2xdSsiU1
 CziOqlHIh+CFsAfnzZENBLEGmaHFR8oSz7rLabDectMEGgBVHwaAzl7P2PTJgPtaYIYP
 fSkZQS+u27YhYUbqWHXsVuJMiWVbMGEJ5/y1fSDJSM7tV+7Qssw/CQTGsEReTtpxCb+v 6w== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 359qunrafc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Dec 2020 16:52:15 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B7Lm192031525
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 7 Dec 2020 21:52:14 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma02dal.us.ibm.com with ESMTP id 3581u9fq4p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Dec 2020 21:52:14 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B7LqDRf61473188
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 7 Dec 2020 21:52:13 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 95D80AC05B;
 Mon,  7 Dec 2020 21:52:13 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5E741AC059;
 Mon,  7 Dec 2020 21:52:13 +0000 (GMT)
Received: from localhost (unknown [9.160.57.67])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  7 Dec 2020 21:52:13 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 17/28] powerpc/pseries/hibernation: drop
 pseries_suspend_begin() from suspend ops
Date: Mon,  7 Dec 2020 15:51:49 -0600
Message-Id: <20201207215200.1785968-18-nathanl@linux.ibm.com>
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
 impostorscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=755 adultscore=0 priorityscore=1501
 spamscore=0 clxscore=1015 suspectscore=1 bulkscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

There are three ways pseries_suspend_begin() can be reached:

1. When "mem" is written to /sys/power/state:

kobj_attr_store()
-> state_store()
  -> pm_suspend()
    -> suspend_devices_and_enter()
      -> pseries_suspend_begin()

This never works because there is no way to supply a valid stream id
using this interface, and H_VASI_STATE is called with a stream id of
zero. So this call path is useless at best.

2. When a stream id is written to /sys/devices/system/power/hibernate.
pseries_suspend_begin() is polled directly from store_hibernate()
until the stream is in the "Suspending" state (i.e. the platform is
ready for the OS to suspend execution):

dev_attr_store()
-> store_hibernate()
  -> pseries_suspend_begin()

3. When a stream id is written to /sys/devices/system/power/hibernate
(continued). After #2, pseries_suspend_begin() is called once again
from the pm core:

dev_attr_store()
-> store_hibernate()
  -> pm_suspend()
    -> suspend_devices_and_enter()
      -> pseries_suspend_begin()

This is redundant because the VASI suspend state is already known to
be Suspending.

The begin() callback of platform_suspend_ops is optional, so we can
simply remove that assignment with no loss of function.

Fixes: 32d8ad4e621d ("powerpc/pseries: Partition hibernation support")
Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/suspend.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/suspend.c b/arch/powerpc/platforms/pseries/suspend.c
index 81e0ac58d620..3eaa9d59dc7a 100644
--- a/arch/powerpc/platforms/pseries/suspend.c
+++ b/arch/powerpc/platforms/pseries/suspend.c
@@ -187,7 +187,6 @@ static struct bus_type suspend_subsys = {
 
 static const struct platform_suspend_ops pseries_suspend_ops = {
 	.valid		= suspend_valid_only_mem,
-	.begin		= pseries_suspend_begin,
 	.prepare_late	= pseries_prepare_late,
 	.enter		= pseries_suspend_enter,
 };
-- 
2.28.0

