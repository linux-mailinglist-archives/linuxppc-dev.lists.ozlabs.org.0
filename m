Return-Path: <linuxppc-dev+bounces-11453-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E95B3AE22
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Aug 2025 01:10:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cCcXp5N0Hz2ywh;
	Fri, 29 Aug 2025 09:09:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756422554;
	cv=none; b=gQ5tOvUKdCXKbW/oQU7RB+OCf1TRWnisfIjjeFdzQ2bmANJ8FgzgI1YuivooJ4p8rpT4Lu1Er3NCDm3m1j0GLeiLUMug4bQYT22nc/j18kH4uu7MD8ehSwb8OAlEgiAGRvZ086wlpq+C1FTINLN9oPyhQbZuE+F0iUvMwW3GyxQ6o9jIbHtpC2M8BtExRj/ve+9FSZu3kKI65mXE1GP9Fz5dVNW/u/l0sKcZ+Tvekax7BYKWeE93dWRgyTPA8NU3nVVRsA93vfv9nPIok+/XLw22y039/i6R9HeauLxxKQ5AAZOPZYhvljjPtaa+E3Nxne8OsaIc8pL0qsleHnXqQw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756422554; c=relaxed/relaxed;
	bh=rXTRxVRNufv9CdpcY3/KoRms7sQTgNKyJV4zJpAlzNs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UtoRKoA2LKKMa+pJ3e0eE5pxshu58gf7nr8FI7dIqIWF8bMP4+dQ7d8g0xcSs5WwwT3WuW/mdA6RA5krZVRUHvKQDA1KGAN0mgZUokq1G/f7f0CspWHjb8+CXigzB7N05CIinIJyWxRewIGkBr/OWK4BsUOEo0Gsy6oOxVwjME/3mv6KPPvU/g9legxmXbQ8oPs2qU6wNt0HZKglu5pdgbNqireKi/cgM2EdNBpw3HxPt58D3AF1nF3ZokrLiMDh4AhVdknLoQZUlCA3ftHiEzWb3I8H+g96nCQlpTcqBzQdQ38EKhr8ndF+pvKr5fFYvuYBLnr2UvmD05mAj2hLEw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sHMXDqwF; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sHMXDqwF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cCcXp0Sxhz2yrl
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Aug 2025 09:09:13 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57SFY73h013232;
	Thu, 28 Aug 2025 23:09:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=rXTRxV
	RNufv9CdpcY3/KoRms7sQTgNKyJV4zJpAlzNs=; b=sHMXDqwFZEEelZ3up5hORn
	L3/fOaqNy4foCAVLwWAytWIGn/tCecyidVCTlvyGWzjUCrXxfZnKj3R0psXFMPla
	1RIGesht6sDEBqKaM36rV9vVVU1laIuQvu7941iBPeY5DgCQRFBsT0iMWNoNrFsy
	faq011mKVFhDXCeJgmNXNIG3zSto2Yf1qqF5DbsKo4ACVZvu0XgFEPJeaSSj2wR7
	JhNHoUcpSB3tHxfJreIx75HdIaxCdZ3sKxn/fEaFEKOFxFr8WvyUC1AGj2LipfBb
	GBUmm8qf2UpZJ0Yn9gsT0D0k1N3tDaOvefeyVrhorxartmiVO1FDBYEIQS3S3Sjg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48tsv99wa4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 23:09:06 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57SN960Z020546;
	Thu, 28 Aug 2025 23:09:06 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48tsv99wa0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 23:09:06 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57SMNTZ6002571;
	Thu, 28 Aug 2025 23:09:05 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 48qt6mq2sm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 23:09:05 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57SN91r365208782
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 28 Aug 2025 23:09:01 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7FB7F58068;
	Thu, 28 Aug 2025 23:09:01 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A832F58061;
	Thu, 28 Aug 2025 23:09:00 +0000 (GMT)
Received: from li-4c4c4544-0038-3410-8038-c4c04f423534.ibm.com (unknown [9.61.165.221])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 28 Aug 2025 23:09:00 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        msuchanek@suse.de, mahesh@linux.ibm.com, tyreld@linux.ibm.com,
        hbabu@us.ibm.com, haren@linux.ibm.com, shashank.gowda@in.ibm.com,
        bjking1@linux.ibm.com
Subject: [PATCH v3 8/9] powerpc/pseries: Enable hvpipe with ibm,set-system-parameter RTAS
Date: Thu, 28 Aug 2025 16:08:42 -0700
Message-ID: <20250828230845.2291249-9-haren@linux.ibm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250828230845.2291249-1-haren@linux.ibm.com>
References: <20250828230845.2291249-1-haren@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=GqtC+l1C c=1 sm=1 tr=0 ts=68b0e192 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VnNF1IyMAAAA:8 a=OgFZmHU11-_6YWlShJcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: y97b1N38RIFKVK_rwsxmUTNPr6W02Txa
X-Proofpoint-ORIG-GUID: 1lOGmYXdV5Q1A0YIC9sse5vfQ_FoI43l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI4MDEyNyBTYWx0ZWRfX95sg/Eygd33k
 q1nx4SoVJ8A7PfmWtrC7OJytCm3DCI6DQeaYgv7UCS2/UK7Bd4QZuHPh+/YdYtPeoG/1q/xCq2z
 +bpQ79PxtWxzCM6SY6dlB/fmSOEqn5k3Z1EWwI5HccTfetYHdnWxPTs0MAPgKsZoN7GPyBeYUYW
 n1X0nyekCaH79hPb+/DxHejVAKBQRfQFE36WuRcuVN21J4cOBgS1zyAIxlvSSuW9N0z94/0ElTv
 60hWi70LBz5Fddwzt2R7ADteIQThl0ylYudwYc0dtZMwuS5j+J8BjOtx0cjQUwlxqWfTSZYQ/Yx
 4qUkiqrSlcJ9ilQVMTlgh03tpEzmzh9ZHnxwf9CVO+/12/bJvnPkEFBX86cRfg4AO+MiZyWQNci
 SXZaqSTH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0
 adultscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508280127
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


