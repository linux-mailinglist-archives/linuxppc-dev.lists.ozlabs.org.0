Return-Path: <linuxppc-dev+bounces-10527-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3384B18A7C
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Aug 2025 04:42:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bv6Xm0wjcz3bnx;
	Sat,  2 Aug 2025 12:42:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754102520;
	cv=none; b=Xv7IMbWkw0bqVdWwAm+He5cBykxZ70ZAS08qBz2MzTlsPTyETRstkt1LJwkjgbXshEv4s+K9WWfv4vE0zRyhiqZNzEGD6CfA7W0c3psROX5xt8CgF6LLdYZfrlNTkCcQzT9R9dgLhpQvdMAdtw2y7g2ZHTVl7cv2zjcFl8WzetuI5UTKkqCIBMeruK27CmS0h/T4fM3UdelMyX/s+yvUzGIZE5PCt5LlW2ix4GncWU5QRdOYUpw4zivKJX8JsOy4SOBo4zuerA71BCne0K9D8VlQsSh24T45aI23BDJSP6nV0g3VixySfz2A4KTvv/xqu79yr7RKMC3/Es4e5+ZqVg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754102520; c=relaxed/relaxed;
	bh=HWDZ4ZdhgmT4DeTi1gwggfGnyBYXNHOgJREvr6i9lto=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g9q0y8l6M2uzNXetk60JmNRNe496woYL/xBlRx23TqlKrfLm4e3Awd7beIDV3VWr5a6nS7DYhvpzDYYbgX2lqA2jTo4iWoka3Jehem5VtqjHeh+7BWFBcH59mlKtDC+F7lzX7LVqpAvob6KjTm8nn4QWXtprr3uC7bHOPQOQ0CWsFpGDLW7gUj1WMDflCrY/RPyzWXyJ/qwdVsblBeuksbXw3ZJwpa7sfv2eFmGg1tz0QQN6MkYiAlZGpaxvms2zkXyKEJ2IQg8cRRFok30y4fTmRhWNHlx9NC9Ny35+OW0mHbSh3qTF5oLDjKKqZ+6DqnJs0exGsTbeiKKMrDaMVA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sFD6tHhV; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sFD6tHhV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bv6Xl3PsZz30Wg
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Aug 2025 12:41:59 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 571M5HJV015630;
	Sat, 2 Aug 2025 02:41:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=HWDZ4Z
	dhgmT4DeTi1gwggfGnyBYXNHOgJREvr6i9lto=; b=sFD6tHhVOi1/Od9dRGqrPD
	gXT9PhbhY8yB6sOpad/pJN58iOS0V6vA35Qt5RMWm2KHHy2QN8rL/UI1+Z0qWbx0
	zDvxrS6mti53Fg6FoRZkxxEVZr90i5Z4+rHiMYto20D4r3LMdspkwf2lDjw1j3YB
	ZNXD3joXt6kdeA+fgJ/T32i7vshBi0GzCsb/mJnxFvxBDR9sZ6UZ270vo8gEEpCk
	oLMtREtzS59V32MOXEHlMKxB2MwO0yjQygm+g9N6MCrjcUW8yorxkhcIFquG0zER
	Nz1lidoF/TIRby911DJL5h1d0W1Ph/FlU2jb4795BiNBcH36rAT6VosL+TKBYipA
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 484qfrbudd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 02 Aug 2025 02:41:52 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57228X41017977;
	Sat, 2 Aug 2025 02:41:51 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4859bu47mu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 02 Aug 2025 02:41:51 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5722fnGO19923564
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 2 Aug 2025 02:41:49 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F069A5804B;
	Sat,  2 Aug 2025 02:41:48 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 10EA758055;
	Sat,  2 Aug 2025 02:41:48 +0000 (GMT)
Received: from li-4910aacc-2eed-11b2-a85c-d93b702d4d28.ibm.com.com (unknown [9.61.171.135])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Sat,  2 Aug 2025 02:41:47 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, msuchanek@suse.de,
        mahesh@linux.ibm.com, tyreld@linux.ibm.com, hbabu@us.ibm.com,
        haren@linux.ibm.com
Subject: [PATCH 8/9] powerpc/pseries: Enable hvpipe with ibm,set-system-parameter RTAS
Date: Fri,  1 Aug 2025 19:41:18 -0700
Message-ID: <20250802024121.955274-9-haren@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250802024121.955274-1-haren@linux.ibm.com>
References: <20250802024121.955274-1-haren@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAyMDAxOCBTYWx0ZWRfX0S0xWHFEMpGn
 pyZ1xFjhGyyCNB7q+a3/8UQI52JKWit7UAbyvKvwVb2APpLoOhmxWBVjAW7xlbhi/Q0LcRsG5ZF
 +svd1WAyaWiTtivSZZUuqtkRUxGjCLKJiroTfBDIM7BzOWzsS/VPghIROnA2Yyf2S5m7LCYbSF+
 PPYEy0XhP4OYMK4l5L1ZCtkDIUFQcJli6EmFWif9X2Hw/tFETl0Of0pmxfnPRfwc0eRRNw1UJX8
 ix5nmKSf6akM+Y9du2fX9bE50ljnlE7Bsz9ktQRuFvyYdnoQp3Ld+NiS7lbLnP4TlWTrYxeQNlZ
 VS0DFfrXlVwAW3LRaWn8ligDKSzMv2Tj4C9I1dmwp4z9yMulTN09XoAa/4xtN2k756Z/IrflqbF
 9raJFAZT7Uw4vxmsjAz0bzDuvJHPdOCMblUJIVyalFO9NB8XtSDpatha2sx6qiPTJcVLPyYB
X-Authority-Analysis: v=2.4 cv=Je28rVKV c=1 sm=1 tr=0 ts=688d7af0 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VnNF1IyMAAAA:8 a=fbHa879tV7MQQsezulwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: ZDFgNJwpFpgzwoBSMLDuzBlw3iEgGZv-
X-Proofpoint-ORIG-GUID: ZDFgNJwpFpgzwoBSMLDuzBlw3iEgGZv-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_08,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 mlxscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508020018
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The partition uses “Hypervisor Pipe OS Enablement Notification”
system parameter token (value = 64) to enable / disable hvpipe in
the hypervisor. Once hvpipe is enabled, the hypervisor notifies
OS if the payload is pending for that partition from any source.
This system parameter token takes 1 byte length of data with
1 = Enable and 0 = Disable.

Enable hvpipe in the hypervisor with ibm,set-system-parameter
RTAS after registering hvpipe event source interrupt.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/include/asm/papr-sysparm.h      |  1 +
 arch/powerpc/platforms/pseries/papr-hvpipe.c | 29 +++++++++++++++++++-
 2 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/papr-sysparm.h b/arch/powerpc/include/asm/papr-sysparm.h
index c3cd5b131033..a3b5a0d05db6 100644
--- a/arch/powerpc/include/asm/papr-sysparm.h
+++ b/arch/powerpc/include/asm/papr-sysparm.h
@@ -21,6 +21,7 @@ typedef struct {
 #define PAPR_SYSPARM_COOP_MEM_OVERCOMMIT_ATTRS     mk_papr_sysparm(44)
 #define PAPR_SYSPARM_TLB_BLOCK_INVALIDATE_ATTRS    mk_papr_sysparm(50)
 #define PAPR_SYSPARM_LPAR_NAME                     mk_papr_sysparm(55)
+#define PAPR_SYSPARM_HVPIPE_ENABLE                 mk_papr_sysparm(64)
 
 /**
  * struct papr_sysparm_buf - RTAS work area layout for system parameter functions.
diff --git a/arch/powerpc/platforms/pseries/papr-hvpipe.c b/arch/powerpc/platforms/pseries/papr-hvpipe.c
index ebccd6a70ab6..8d0b1e78d223 100644
--- a/arch/powerpc/platforms/pseries/papr-hvpipe.c
+++ b/arch/powerpc/platforms/pseries/papr-hvpipe.c
@@ -15,6 +15,7 @@
 #include <asm/machdep.h>
 #include <asm/rtas.h>
 #include <asm/rtas-work-area.h>
+#include <asm/papr-sysparm.h>
 #include <uapi/asm/papr-hvpipe.h>
 #include "pseries.h"
 #include "papr-hvpipe.h"
@@ -639,6 +640,32 @@ static irqreturn_t hvpipe_event_interrupt(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+/*
+ * Enable hvpipe by system parameter set with parameter
+ * token = 64 and with 1 byte buffer data:
+ * 0 = hvpipe not in use/disabled
+ * 1 = hvpipe in use/enabled
+ */
+static int set_hvpipe_sys_param(u8 val)
+{
+	struct papr_sysparm_buf *buf;
+	int ret;
+
+	buf = papr_sysparm_buf_alloc();
+	if (!buf)
+		return -ENOMEM;
+
+	buf->len = cpu_to_be16(1);
+	buf->val[0] = val;
+	ret = papr_sysparm_set(PAPR_SYSPARM_HVPIPE_ENABLE, buf);
+	if (ret)
+		pr_err("Can not enable hvpipe %d\n", ret);
+
+	papr_sysparm_buf_free(buf);
+
+	return ret;
+}
+
 static int __init enable_hvpipe_IRQ(void)
 {
 	struct device_node *np;
@@ -695,7 +722,7 @@ static int __init papr_hvpipe_init(void)
 		goto out;
 	}
 
-	if (!enable_hvpipe_IRQ()) {
+	if (!enable_hvpipe_IRQ() && !set_hvpipe_sys_param(1)) {
 		ret = misc_register(&papr_hvpipe_dev);
 		if (!ret) {
 			pr_info("hvpipe feature is enabled\n");
-- 
2.43.5


