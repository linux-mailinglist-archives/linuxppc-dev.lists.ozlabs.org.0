Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A011F62F8EA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Nov 2022 16:10:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NDKwW4mnKz3dtt
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Nov 2022 02:10:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OCbxc/k2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OCbxc/k2;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NDKsV4df0z3bZY
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Nov 2022 02:07:58 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AIE7oQn010972
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Nov 2022 15:07:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=EEgu1nalrqG9sem+zUqYR22MjLKJmimIMMUhSSfB89E=;
 b=OCbxc/k2/ThXQxJnuyBUk59kNxibQNvmIeVm3w3BSXIBzLnrijeXGzoGYdxknf+xgmzE
 ZYoWS1ZCB+W/bB6qzlFi9tqRkbbIflGWeImTCiCjLSBlh026zJT+dLEHp+fSXwozZ7zt
 SEBX2tb+ZD6FpRcYi5/aaZW8GSuUWt3XB4GM2AV0+jcl0A/6v6XDVlUZG5lf/7LW2Hfc
 2GhT6LuUxEZhR525ms4ue2X6vXKYq3+ZOh+5Yy8r/Dz2x6LrM+PX0aU3y+4rsj66hIzz
 Ix6pavLAasXtRq6tRLKGxmXszx6HO5XqrRlJbgyD99HpQ9pZNwiU1WW7bLKMr5+l+120 Cg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kx156fwhe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Nov 2022 15:07:55 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AIE9wLi017743
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Nov 2022 15:07:54 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com [169.47.144.27])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kx156fwhb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Nov 2022 15:07:54 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
	by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AIF6rgZ015384;
	Fri, 18 Nov 2022 15:07:54 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
	by ppma05wdc.us.ibm.com with ESMTP id 3kt34ag7tv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Nov 2022 15:07:54 +0000
Received: from smtpav04.dal12v.mail.ibm.com ([9.208.128.131])
	by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AIF7pdb39780880
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Nov 2022 15:07:51 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AC83358064;
	Fri, 18 Nov 2022 15:07:52 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 92B6558056;
	Fri, 18 Nov 2022 15:07:52 +0000 (GMT)
Received: from localhost (unknown [9.211.69.164])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 18 Nov 2022 15:07:52 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 02/13] powerpc/rtasd: use correct OF API for event scan rate
Date: Fri, 18 Nov 2022 09:07:40 -0600
Message-Id: <20221118150751.469393-3-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221118150751.469393-1-nathanl@linux.ibm.com>
References: <20221118150751.469393-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: iypr4WI1wSDQwb4R7FLdneWk8KmCvfPU
X-Proofpoint-GUID: KtRPaqZvy-w2pVMp4E5A7viAgBqe2rb0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-18_02,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 bulkscore=0 clxscore=1011 mlxscore=0 malwarescore=0 mlxlogscore=999
 impostorscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211180084
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
Cc: tyreld@linux.ibm.com, nnac123@linux.ibm.com, ldufour@linux.ibm.com, ajd@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

rtas_token() should be used only for properties that are RTAS function
tokens. "rtas-event-scan-rate" does not contain a function token, but it
has the same size/format as token properties so reading it with
rtas_token() happens to work.

Convert to of_property_read_u32().

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/kernel/rtasd.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/rtasd.c b/arch/powerpc/kernel/rtasd.c
index 5270b450bbde..cc56ac6ba4b0 100644
--- a/arch/powerpc/kernel/rtasd.c
+++ b/arch/powerpc/kernel/rtasd.c
@@ -9,6 +9,7 @@
 #include <linux/errno.h>
 #include <linux/sched.h>
 #include <linux/kernel.h>
+#include <linux/of.h>
 #include <linux/poll.h>
 #include <linux/proc_fs.h>
 #include <linux/init.h>
@@ -499,6 +500,8 @@ EXPORT_SYMBOL_GPL(rtas_cancel_event_scan);
 
 static int __init rtas_event_scan_init(void)
 {
+	int err;
+
 	if (!machine_is(pseries) && !machine_is(chrp))
 		return 0;
 
@@ -509,8 +512,8 @@ static int __init rtas_event_scan_init(void)
 		return -ENODEV;
 	}
 
-	rtas_event_scan_rate = rtas_token("rtas-event-scan-rate");
-	if (rtas_event_scan_rate == RTAS_UNKNOWN_SERVICE) {
+	err = of_property_read_u32(rtas.dev, "rtas-event-scan-rate", &rtas_event_scan_rate);
+	if (err) {
 		printk(KERN_ERR "rtasd: no rtas-event-scan-rate on system\n");
 		return -ENODEV;
 	}
-- 
2.37.1

