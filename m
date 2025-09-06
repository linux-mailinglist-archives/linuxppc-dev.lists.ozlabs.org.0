Return-Path: <linuxppc-dev+bounces-11829-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5BAB472FA
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Sep 2025 17:54:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cJyRz1P9kz3cjb;
	Sun,  7 Sep 2025 01:53:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757174015;
	cv=none; b=Ow5CAEPIDr5ig87TgELVBrcrNU1gzU3ydkYZ3wBGiyjvfp5CBmixTPst0lNn582+rLhaUJ2UucpJRJJv9nklSDpxy7qfYIKUOi3bI9wShuXDxvRDhdHBGHbfhOul8Z+psUuRnrQc/xCHBQFVXP9kPcSg5hoJ9NKMQyG+9MmmpY27eCdEwdcJVTdDei+5ZORIqLDjCVtZarp7nAtkVaqctzJJ6fdslMzfy25XFr3d4GI10SZN2GMp2+u7rNjLn9vUFDGDMe6sEstV3FlcbeeBpvwbG3NVuQrycgtEkSFp9kEDdrP4HlRuiq9Aa55JVh2ipIU9Ju21TWfgmTegUjkjvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757174015; c=relaxed/relaxed;
	bh=+V6wgn9gOMgcgBTcXSZy1la8FI3XzmjRz8oKLPfptfM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jQX2mqEqQzn1NdkOSxBbfgdXBtN2p+pPRjV5TFqj1y607LsqHU7jFanK/n2MLJ4TLBRQFQezc9ZazUmjjPNPb1VeNd3cvzLQfp3OYOsfT6IWquyR3Hq7Y27S0HxDschBLMCJ24XQoUPI6jlqQDZWrIAkgzyY4xer7yLdijnq/9RR7ImoJLVdISxy2rwPsuHJ8b1bEdGCNnhKbCAjU6bJ2wQyw9MF5EnE3ggmqa1VGLS3wnO+Eo1HxHlzx327foi4dHBgFeu0k3cUiaLqJeu2Oq9j3QXcVL4ZhTxo1bSCvyNaxtwFjK+VQTfEuS4UuUg5Sr3qJRD/zvQW7zEKIGSaSQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lQtqG18L; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lQtqG18L;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cJyRy4Bntz3cj1
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  7 Sep 2025 01:53:34 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 586CQWA7032136;
	Sat, 6 Sep 2025 15:53:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=+V6wgn
	9gOMgcgBTcXSZy1la8FI3XzmjRz8oKLPfptfM=; b=lQtqG18L+22E6URB08I9Bp
	6mMTyxj+O89Ta8/Kp1UlWy22g6rFARiaDsMZF11KpEW/tC50LaDU75LiXSJY1Q5W
	BT/1QR577r7IO9b6tg10kcaYkMDdFl9hCk/uCGXkk+EbzZsPmWE4ISnY8NHmVdcc
	LawlSPFnUhI5UEPE2+xpjWdPZYhq+rI9fQu4Eb1BDrz+LDOuuQiH1cuWt/fUvRWM
	2D4vdwIIEIaaOseyWi6b8zQbfEG8W4UWm2rIgXvarGIhYY/TxE1TVG90x+Wx7Egk
	l2r7vqsiM/QQIHpFVeefTg9TLXnO14VVdN1hgdkDbm/qnQz9Q60YWs1zcVNq5Y8A
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490cmw9w8f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 06 Sep 2025 15:53:28 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 586FrRlH010847;
	Sat, 6 Sep 2025 15:53:27 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490cmw9w8d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 06 Sep 2025 15:53:27 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 586FdMDe014345;
	Sat, 6 Sep 2025 15:53:26 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 48veb3wytx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 06 Sep 2025 15:53:26 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 586FrEY221430858
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 6 Sep 2025 15:53:14 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D41035805A;
	Sat,  6 Sep 2025 15:53:23 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0C6295803F;
	Sat,  6 Sep 2025 15:53:23 +0000 (GMT)
Received: from li-4c4c4544-0038-3410-8038-c4c04f423534.ibm.com (unknown [9.61.139.105])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Sat,  6 Sep 2025 15:53:22 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        msuchanek@suse.de, mahesh@linux.ibm.com, tyreld@linux.ibm.com,
        hbabu@us.ibm.com, haren@linux.ibm.com, shashank.gowda@in.ibm.com,
        bjking1@linux.ibm.com
Subject: [PATCH v5 8/9] powerpc/pseries: Enable hvpipe with ibm,set-system-parameter RTAS
Date: Sat,  6 Sep 2025 08:53:06 -0700
Message-ID: <20250906155308.705926-9-haren@linux.ibm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250906155308.705926-1-haren@linux.ibm.com>
References: <20250906155308.705926-1-haren@linux.ibm.com>
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
X-Proofpoint-GUID: TPLEzBRTbez5LY-YIB8BCC6ys6JpVHCe
X-Proofpoint-ORIG-GUID: dqHcY96Lph65cXElTIWFRlI_sBjrAneZ
X-Authority-Analysis: v=2.4 cv=J52q7BnS c=1 sm=1 tr=0 ts=68bc58f8 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VnNF1IyMAAAA:8 a=L9SJR8mG7j7vUmVWBfwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNSBTYWx0ZWRfXzQbMIa3tD7tj
 uI+nsjuaAZqJNwuILmDQ7ZfByPPU69HIisRG8yrifA9VqLfk5SEfXcO4dqzx57hn4uFgi4wz7za
 d3blKtTpqmmBbtpRAEbxwXWg5bNDOTO+Rw93x2p8zoBdcC55OeDS19L/W9BXWySGy8aqOJjhFg5
 zqe8D0AC4zNdXeBxdnlQHNhUxwSjfFub9hk4JkLhG29pO+C9fR+HQO1AdDIraH/eoqxfR2UGKpf
 fW2SEhCIutZrdWOQ78oA6GcNU5pyDKahxmJlRGwxJUO2sQ51s3uZkjE9lUADpmqqOwcnozWtS+I
 PaurnBokh83sxEoevAac+af0JL0alUNpwSGHv24l0dKo8GiqLav0FKanDS6T/+iyiK9hVSraPOb
 GAISe0Nf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-06_05,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060025
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
index fb4234c0335b..43f5dfb8b6af 100644
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


