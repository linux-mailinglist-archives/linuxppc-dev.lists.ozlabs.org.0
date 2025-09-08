Return-Path: <linuxppc-dev+bounces-11860-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D0EB482C8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Sep 2025 05:06:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cKsJq0MfCz3cjR;
	Mon,  8 Sep 2025 13:05:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757300730;
	cv=none; b=fqmUwW3/gZIYiIKWzicqVFNzon7K218SMthdcrv2BMF1gNT4lVexAWjLTalp+tignbM605OJmbdqX6w7Ra52nFMFSFGLgrWahOqstp1qRNLI0tPEaLm9O2d3IyYsehy5dUzEkXKmJqWrh+jPPUnGoTCg/lKZrmydQkNaMgSe6lxnMrlkACwp8A2B9gH4g7bxhuk4EOtdy7Cv4MyXS05vSOJLbRz8H1TYddaxLnJYGrmSk0xkEr6aXODt6SIGRVDqE2t5sAUZn2xgljnevBv5ua4sn9+kQPrBeAw9UqSzaKA7jdiwQ4tYthdGnnpnZkr6sdjNHlBBcZqX3cGJgLY0pw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757300730; c=relaxed/relaxed;
	bh=F07C9jrYuH14eTGy+YYC/lhg7A95uYoFM6/rtkv7xR4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W7HTr6cM7KBX4/e9/KPUElOzS3EW5DhusbiF7B5/wQxi3Lz8Q3MeP55owU7zFcCJsWPZ1a/5AB+4gXqltuqt8OM8FoUuVF9sjifaNiFtiR9jf2AwJ/MsSd/BwORrq/lR02IMQZLdM8FbaxpiW/voAel7LxZjqLd2WuKx5yxI1OAr5C+Jwr9S/o8bqycUu6ghSuuZM5NXF8ftmQp2Bg+J4Bt+gD4g6iU6rhxCfny5F3R+2uxact04gY1NkhddOncuCrzyVpOpJ1QlaArLv6tnmzF3h0r2g0hqtLWlNG37pEnn2/SMt4Udz5FJPbvayOVTn1NkOK7iHRC/9p6ean8aKw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XFu5e/R4; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XFu5e/R4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cKsJp1hBCz3cj7
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Sep 2025 13:05:29 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587JEreS021580;
	Mon, 8 Sep 2025 03:05:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=F07C9j
	rYuH14eTGy+YYC/lhg7A95uYoFM6/rtkv7xR4=; b=XFu5e/R4jmX6FDs70H3Cyt
	pBHc2z/hLLENoJFtgaYs/r+j10Rv8TMxPcemuxfA0sNpN9DFLrLZymnS+7dJCCVo
	UhqL6L3nPRpknkh3nwhYnrb7xBCnHw5RbDang6TkJsyttEAdhRfW4FPFUH+vxRd9
	TtYe/H2zqVlS0iv3LXUZ7B3cbJVw/JS71iyRqOU6ZD2eIgK3/gcdiRjumbGrc6yx
	9SPzPKQOwJ6E7nf73uTTnTgagnOn8aUSEYEqEQjJIlMD1ixQh6NJYur16FnrP/tS
	ii0v7VjVvs6bSxXH3PXdzfhA0jZoUgcUhB85gKmAcfq0sc3+iOD0nviFxXyJlh8w
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490bcseu2j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Sep 2025 03:05:22 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58831UvH015959;
	Mon, 8 Sep 2025 03:05:22 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490bcseu2d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Sep 2025 03:05:22 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5880qLMs017172;
	Mon, 8 Sep 2025 03:05:21 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4911gm3ugs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Sep 2025 03:05:21 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58835IrO32506566
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 Sep 2025 03:05:19 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B7BCE58055;
	Mon,  8 Sep 2025 03:05:18 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 95B635805B;
	Mon,  8 Sep 2025 03:05:17 +0000 (GMT)
Received: from li-4c4c4544-0038-3410-8038-c4c04f423534.ibm.com (unknown [9.61.139.105])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  8 Sep 2025 03:05:17 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        msuchanek@suse.de, mahesh@linux.ibm.com, tyreld@linux.ibm.com,
        hbabu@us.ibm.com, haren@linux.ibm.com, shashank.gowda@in.ibm.com,
        bjking1@linux.ibm.com
Subject: [PATCH v6 8/9] powerpc/pseries: Enable hvpipe with ibm,set-system-parameter RTAS
Date: Sun,  7 Sep 2025 20:04:56 -0700
Message-ID: <20250908030458.1139163-9-haren@linux.ibm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250908030458.1139163-1-haren@linux.ibm.com>
References: <20250908030458.1139163-1-haren@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxMCBTYWx0ZWRfX8RrtlbyzJBF8
 FK/OMWXZsd/Y4lvU1b98NSb65NH5AOc5E5jArz50LebSSxBUoRD5GGbc4gZqWTeWMiQczK2Nww3
 PmDmVHpAqyToO1c1ekvuuaLLHR5yqxngMOp/QElMybs2egL26b60PRakI4cIl3ms4wwiNZBhRS3
 sMnwCxY5FSONQIX2c6mAqs26RS/nxUe+swI4QFrqcGqtvRFWSwIidrpB1H1MZXIk+pWil6TkfJB
 AhIxkjB05nQdQFsH3012yYlHKtHQrovLMWYYZI25Bdil6NdDEkp2wkDDqNMy5w4+eR2NDfo+xOD
 xIYKyaFRm253Uog1XcWNmcU+KIMe7z1HHZnyM77SadMotjf95dJwqHcLpVTfGs2ydhp2KuuGUK8
 tdmGuqaR
X-Authority-Analysis: v=2.4 cv=SKNCVPvH c=1 sm=1 tr=0 ts=68be47f2 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VnNF1IyMAAAA:8 a=L9SJR8mG7j7vUmVWBfwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 9rTrCX-NzahuvTsL1AMgwuoGOatatLGs
X-Proofpoint-ORIG-GUID: uyGruB1g8N4X5e_63RCy3chtE2kuursM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-07_10,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 adultscore=0 suspectscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060010
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
index 5cf499d17d8f..cc6b0877f191 100644
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
@@ -648,6 +649,32 @@ static irqreturn_t hvpipe_event_interrupt(int irq, void *dev_id)
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
@@ -705,8 +732,11 @@ static int __init papr_hvpipe_init(void)
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


