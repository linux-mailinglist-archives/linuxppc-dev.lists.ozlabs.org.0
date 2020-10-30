Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FAA629FAAF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 02:46:10 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMlWz3VMbzDr3R
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 12:46:07 +1100 (AEDT)
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
 header.s=pp1 header.b=hitmdLx9; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMkw30nJ2zDqkg
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 12:18:26 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09U1353q185308
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 21:18:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=NmYsg9nzKcbY87bqi/VPPLppUTeQ/HtSqmxu0fq7ZQQ=;
 b=hitmdLx934iP55BKjKIwDIup6oPiK7bfyF5CziIDI4lI95IEFRRbxpysjohs5NhrqiAf
 /PueyYJXp1iEttz5oMscmcqpTBHgEMPL4QJXTx2437a526KykOnRkZvTRGmsiD1XXny/
 jUZiUMF/FVemChe9XpIagZmxhzhAMNdZKsc+uYx1tvqfOWFZmGTKg+qCjnA8krD83flw
 9lIu58sBH11PB68bfbY+xpouZ3fZUxmuE6MZMSNz+b4UCLDr5/z+Azc1Z1PVMCBIO25N
 DvWmO788ywtpbPMis5DThRX37cvgui1y5J6wCsX9EK761Sz2VBm/q55hhsR4MM7ybhhS 1w== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34fydhj62v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 21:18:24 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09U1GkPg016248
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 01:18:23 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma03wdc.us.ibm.com with ESMTP id 34ernqunyu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 01:18:23 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09U1IMs727328886
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Oct 2020 01:18:22 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8FB03AE05F;
 Fri, 30 Oct 2020 01:18:22 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4C26CAE05C;
 Fri, 30 Oct 2020 01:18:22 +0000 (GMT)
Received: from localhost (unknown [9.65.225.148])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 30 Oct 2020 01:18:22 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 19/29] powerpc/pseries/hibernation: pass stream id via
 function arguments
Date: Thu, 29 Oct 2020 20:17:55 -0500
Message-Id: <20201030011805.1224603-20-nathanl@linux.ibm.com>
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
 spamscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=1 mlxlogscore=821
 clxscore=1015 phishscore=0 mlxscore=0 malwarescore=0 adultscore=0
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

There is no need for the stream id to be a file-global variable; pass
it from hibernate_store() to pseries_suspend_begin() for the
H_VASI_STATE call.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/suspend.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/suspend.c b/arch/powerpc/platforms/pseries/suspend.c
index 3eaa9d59dc7a..232621f33510 100644
--- a/arch/powerpc/platforms/pseries/suspend.c
+++ b/arch/powerpc/platforms/pseries/suspend.c
@@ -15,7 +15,6 @@
 #include <asm/topology.h>
 #include "../../kernel/cacheinfo.h"
 
-static u64 stream_id;
 static struct device suspend_dev;
 static DECLARE_COMPLETION(suspend_work);
 static struct rtas_suspend_me_data suspend_data;
@@ -29,7 +28,7 @@ static atomic_t suspending;
  * Return value:
  * 	0 on success / other on failure
  **/
-static int pseries_suspend_begin(suspend_state_t state)
+static int pseries_suspend_begin(u64 stream_id)
 {
 	long vasi_state, rc;
 	unsigned long retbuf[PLPAR_HCALL_BUFSIZE];
@@ -132,6 +131,7 @@ static ssize_t store_hibernate(struct device *dev,
 			       struct device_attribute *attr,
 			       const char *buf, size_t count)
 {
+	u64 stream_id;
 	int rc;
 
 	if (!capable(CAP_SYS_ADMIN))
@@ -140,7 +140,7 @@ static ssize_t store_hibernate(struct device *dev,
 	stream_id = simple_strtoul(buf, NULL, 16);
 
 	do {
-		rc = pseries_suspend_begin(PM_SUSPEND_MEM);
+		rc = pseries_suspend_begin(stream_id);
 		if (rc == -EAGAIN)
 			ssleep(1);
 	} while (rc == -EAGAIN);
@@ -148,8 +148,6 @@ static ssize_t store_hibernate(struct device *dev,
 	if (!rc)
 		rc = pm_suspend(PM_SUSPEND_MEM);
 
-	stream_id = 0;
-
 	if (!rc)
 		rc = count;
 
-- 
2.25.4

