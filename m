Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F245F2D1D52
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Dec 2020 23:30:48 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CqdLY75ltzDqLC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Dec 2020 09:30:45 +1100 (AEDT)
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
 header.s=pp1 header.b=iG/YqNJe; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CqcV924JhzDqK1
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Dec 2020 08:52:17 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B7LTLB2106550
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 7 Dec 2020 16:52:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=RbzOvBXsMowzHO/hra6xVBMUdmCIziZa0MaDkTI+qDA=;
 b=iG/YqNJeAu+ZwOUaSb03Cjr14EKPnBmRKT7Ku3hBlCZ9PY5w3qFbZdVFdH6yGQsIzmHF
 GncdTDsPHf5+S21WtPGwApZkW7zPj+HhjAZ2W4YgwhrplcE2bLbJTRpyegVNbvkrZ9bS
 7P94P0u9FXv+s3rBVIYrumWqvksgaqnkPVci8MKWoniM5YgCfAWSCmaszkQ3WgVqIW/e
 JXV8PY+KmqVGu/yqvHr5LYT6X8tS8QCPAUNmbn2obGoom8eFnnxunsd8dpvWx8vLGLSH
 +0eSW79ohAIWwF89Abz0Dq+zIskhckoCGA/QeVvKM3BZwC2T//sbAVxXOTwhZ4OKM5Q2 gA== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 359s0r6c1x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Dec 2020 16:52:15 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B7LlbJH010822
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 7 Dec 2020 21:52:14 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma03wdc.us.ibm.com with ESMTP id 3581u8u0dc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Dec 2020 21:52:14 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B7LqEqN9962180
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 7 Dec 2020 21:52:14 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 50B9CAC05E;
 Mon,  7 Dec 2020 21:52:14 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 11FD3AC05B;
 Mon,  7 Dec 2020 21:52:14 +0000 (GMT)
Received: from localhost (unknown [9.160.57.67])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  7 Dec 2020 21:52:13 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 18/28] powerpc/pseries/hibernation: pass stream id via
 function arguments
Date: Mon,  7 Dec 2020 15:51:50 -0600
Message-Id: <20201207215200.1785968-19-nathanl@linux.ibm.com>
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
 priorityscore=1501
 adultscore=0 clxscore=1015 mlxlogscore=851 lowpriorityscore=0
 suspectscore=1 spamscore=0 malwarescore=0 bulkscore=0 mlxscore=0
 phishscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2012070132
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
2.28.0

