Return-Path: <linuxppc-dev+bounces-11531-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D17B3C86E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Aug 2025 08:05:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cDPjD0JNqz2xgX;
	Sat, 30 Aug 2025 16:04:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756533856;
	cv=none; b=O/zh+o0DxjVuFq4WGv5onHGkwYNyPfqJ+PVqxQGYR8MrOfgW/n0rAJH9ZLHkwoZeavQVOBpXs6+4ZdfusWGfGLtrVVnNrTunaZg2LsONBcm0KDiWGsPiw6HDP4NTVExKV33QQmNSyrBCVJ/CDRElzXWXTJKPHmCTLeWYNbjXoeHO2bR27hLcMViTUJxD738B5xmMoDDukcoDiyJDslThkEYEZci0+am80DKqntcVwrR4P/dovovMWf739MH4QE2vvdYdnSIWDkHc1+DP9PywAByEsGipaohNoQ0vDGbCXNsE/CYAdeER+W2y5kOxUvdnyDmcJzB3GOnbCbMA/F5s0A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756533856; c=relaxed/relaxed;
	bh=oySr6A2lHdj3iIFDCesXGC/pz+R35kr6swXK9ImaJLs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oPKI1mee0O0MpvpOcTmXfx30chqHyRmh7RTxR2LRVEdIqtYWSSklspAB+okoz4mEDYmiEseildGCn5NwIebDjGIREkQJ8LUlYrVXRG5gBH3wCkQaW6fBKgMNkL5fuLqXc3zG0dfUCdGRyGtGJdgMMYckoiZwFPhdDAlYR/zb6BEcAH+sGltBJLc90opfV8AK4B8UFeaUFFC3lstj1l5liMilUzGyXw4kvXp9OmiB5Du2WCyyI9mGthMH+3SuLjwlG6V8feSdkA7UzAd/kiqMWy9B9oX97csIPfFP36EOTXdFMzTV2149Y1X1WlHEbD3QqGVGdof098zogGc86UzDZQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kVNHq3l9; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kVNHq3l9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cDPjC29sRz2xd6
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Aug 2025 16:04:15 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57U3tuHq017722;
	Sat, 30 Aug 2025 06:04:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=oySr6A
	2lHdj3iIFDCesXGC/pz+R35kr6swXK9ImaJLs=; b=kVNHq3l9t0K+/XrW6e2YEi
	2TUSNuyC3cE7bJeM3wKFHOIP1d4sCV/vltsFUXNXLW1AiAyg4TPJvZ/nT4vwh8jw
	DJHdkAns65QMjySHULSkEkjiAo3BH5CixkqoR/IxoSXfXLumNOq+WApvouQo/5Jn
	2HeKo6fzi3huW2cgX/Arm2T7ddFh8dAfB/ooNi+Fa3J2rJTAWKgy6ukSNtfZ2yAg
	JkGk6n/+PPvUwDydZmjw3D6BCNv1X//TABW+1m5S7ZKnTU/HF8uWHxfuuxRw4PzY
	z0hPsTagSrCYmslapn5r9nXQFZQYpZGVAurdxK3qX0/rCg+4VnJEb4vZ9PjwdE0w
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48ustsg9fn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 30 Aug 2025 06:04:07 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57U6474C016151;
	Sat, 30 Aug 2025 06:04:07 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48ustsg9fk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 30 Aug 2025 06:04:07 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57U3Y4gR032637;
	Sat, 30 Aug 2025 06:04:06 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 48qrc1567b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 30 Aug 2025 06:04:06 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57U643jR15401694
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 30 Aug 2025 06:04:03 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3748758059;
	Sat, 30 Aug 2025 06:04:03 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0EB3E5805B;
	Sat, 30 Aug 2025 06:04:02 +0000 (GMT)
Received: from li-4c4c4544-0038-3410-8038-c4c04f423534.ibm.com (unknown [9.61.165.221])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 30 Aug 2025 06:04:01 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        msuchanek@suse.de, mahesh@linux.ibm.com, tyreld@linux.ibm.com,
        hbabu@us.ibm.com, haren@linux.ibm.com, shashank.gowda@in.ibm.com,
        bjking1@linux.ibm.com
Subject: [PATCH v4 8/9] powerpc/pseries: Enable hvpipe with ibm,set-system-parameter RTAS
Date: Fri, 29 Aug 2025 23:03:41 -0700
Message-ID: <20250830060343.2656729-9-haren@linux.ibm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250830060343.2656729-1-haren@linux.ibm.com>
References: <20250830060343.2656729-1-haren@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: NTg30DJv2BGbvkzl7kuHbsh_F5Nxt7I-
X-Authority-Analysis: v=2.4 cv=QuJe3Uyd c=1 sm=1 tr=0 ts=68b29457 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VnNF1IyMAAAA:8 a=L9SJR8mG7j7vUmVWBfwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzNCBTYWx0ZWRfX+rDCEyoOmQ3A
 Vusho5zu+J0cfnYfFsHvn7gAveWHMZYy9MBpmhmsy5bS5zswBZmpXjA0IMl9quaMfURMjTr2Rfq
 uz8Ehrzq+H1315Qtoen9W1Awa1IkR3DI8Rag3aTFht2I5gEbyXDrAyzfWbawpeJtqhm41Z4ymYh
 iFT5BA/oNUVdKiwlY8MeNtEIq3gdrzTvnvCiDV2W9JQY7HaoOZjpqco8A6y9AZj8aqvHDoLIKKA
 IGtz+4/4BtNVtSpHK+tVke0NWxMHtk3md9aoxWnUJ1uaq5a8Ie4Qb654/sheVXKmTYnT+MfBtQ9
 EuhLq9JHq66XOew/oYjQ/3Xp8ikNG3HWWk6dMbzEHz899zfjFwMt6fjZKlG77SkIw6NIpjA/Mc2
 rRFU7KqG
X-Proofpoint-GUID: 7Wgbi9_mD0K-vuASxRPyn9LmYJJ9d1vT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-30_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300034
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
Reviewed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Reviewed-by: Tyrel Datwyler <tyreld@linux.ibm.com>
Tested-by: Shashank MS <shashank.gowda@in.ibm.com>
---
 arch/powerpc/include/asm/papr-sysparm.h      |  1 +
 arch/powerpc/platforms/pseries/papr-hvpipe.c | 34 ++++++++++++++++++--
 2 files changed, 33 insertions(+), 2 deletions(-)

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
index 0969efb39d95..504d7f20f0b1 100644
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
@@ -650,6 +651,32 @@ static irqreturn_t hvpipe_event_interrupt(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+/*
+ * Enable hvpipe by system parameter set with parameter
+ * token = 64 and with 1 byte buffer data:
+ * 0 = hvpipe not in use/disable
+ * 1 = hvpipe in use/enable
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
@@ -707,8 +734,11 @@ static int __init papr_hvpipe_init(void)
 	}
 
 	ret = enable_hvpipe_IRQ();
-	if (!ret)
-		ret = misc_register(&papr_hvpipe_dev);
+	if (!ret) {
+		ret = set_hvpipe_sys_param(1);
+		if (!ret)
+			ret = misc_register(&papr_hvpipe_dev);
+	}
 
 	if (!ret) {
 		pr_info("hvpipe feature is enabled\n");
-- 
2.50.1


