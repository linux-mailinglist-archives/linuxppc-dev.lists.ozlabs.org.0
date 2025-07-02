Return-Path: <linuxppc-dev+bounces-10059-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C1033AF64EC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jul 2025 00:16:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bXZ2n4rFRz30Wg;
	Thu,  3 Jul 2025 08:15:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751494511;
	cv=none; b=fhFfgcoPMuM+DXXtshvaw5bAXEPg6JO6DyNo/FbjZV90/7GiGvjanBoMHlD7mG1u5E89FEWpkj/V0ukF88HMrp7ZhvTDaQ3rALUjf40cMLGzVG96YwCCB2hX4woyn1ir3bUfdzFZvg1m8xMsysxTYj/2Cw4/xlIR02tYlbhYYrM0X25501+oD8XGt3OoYbP5fwIOdqBbvorGR7wQO/56eJOUcAWk80jmgVztlIef8y+vU4BkG7jW/AyslGpbj/B88s4SfPCzaTDibrKbLlxKh+jtbQDH1g+Vf3E6VyUjlnvaUkgWSdvYzsDv/SGSc/rVikq28ls7nzCfTIuZ7+3kEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751494511; c=relaxed/relaxed;
	bh=I7N+/jPEv0U8eJ5xO7ldzCQN9xrpZf7gCsNsxKoK2qI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nL5Xn1jSUxENpSUOYwlmFwAm6NYswUJk8eqC6ryuoynVmcivgMn4GZwV67HkUWlUZgHJNAUNXeerZO4aj3D4r55w4tZ7mkFfqOpTffcYRMGZx1HvxAgunGIOmIQnrVxYD130yTHTaHAyvguExl7faP8cTzWg0vEagT1S2Hbb6n4VfpVvnzldeifY4BQPQZJay3YryzVO4By/Fs9WyCgDQ33OGOspRDMRRZAUQ+3uEZ1+VjbgqTlAhl8Bfuh3OcevWpsqP11a8a4XIvrIhV82oui7ot/vRy1q9zxBKxJy0M0sDw/9u6xo2ye7WDqYtC8us08hB4ZUL6Vt+3DzU7WLOw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kYLq7Tt/; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kYLq7Tt/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bXZ2j5mKnz30W1
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Jul 2025 08:15:09 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562H7Bod025176;
	Wed, 2 Jul 2025 22:15:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=I7N+/j
	PEv0U8eJ5xO7ldzCQN9xrpZf7gCsNsxKoK2qI=; b=kYLq7Tt/hUoupHPwe3l/mp
	+5Xia1iNr548dPPgyQzHXZYzmV7FGWkNS3CmxrPMfLDcBsVqtlQ/YtDqDECUycc/
	fZNLt0iaCXS1giTlzTvmPCFLcdvHr8bKy2/str7VtPaySIzHPMIojj7DLuFjvFlb
	auD6IsPbPxRNaqXW76CHwktpL/NP95ndsFB2e8/CP69RGbBsbaorU5EnD46fS1B4
	pP829ysgiHeGJJpg82ksN4rMkwU6HJ43d8xcjqWuhLAxoMDLMhf8yCy+Cy6RPYv2
	WqM3r8PPAQbiRNNBMOJT3MkKw7+2lFab9SoiCNfCk0WxRN1YlDTlcN0zRvgo4sSA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47j6u1yy7x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 22:15:02 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 562M5dcJ021621;
	Wed, 2 Jul 2025 22:15:01 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47j6u1yy7u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 22:15:01 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 562L4NSN032216;
	Wed, 2 Jul 2025 22:15:01 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 47ju40sx9p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 22:15:01 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 562MEx2j24838744
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 2 Jul 2025 22:14:59 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 63A1B58056;
	Wed,  2 Jul 2025 22:14:59 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B5F975803F;
	Wed,  2 Jul 2025 22:14:58 +0000 (GMT)
Received: from li-4910aacc-2eed-11b2-a85c-d93b702d4d28.ibm.com.com (unknown [9.61.17.45])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  2 Jul 2025 22:14:58 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        msuchanek@suse.de, mahesh@linux.ibm.com, tyreld@linux.ibm.com,
        hbabu@us.ibm.com, haren@linux.ibm.com
Subject: [PATCH RFC 8/9] powerpc/pseries: Enable hvpipe with ibm,set-system-parameter RTAS
Date: Wed,  2 Jul 2025 15:14:42 -0700
Message-ID: <20250702221444.879256-9-haren@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250702221444.879256-1-haren@linux.ibm.com>
References: <20250702221444.879256-1-haren@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: SgMJw1sfuovKdKfypejsPLbcdA5nGJOk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDE4MSBTYWx0ZWRfX7IAqtx4EcjDX SblzsJYBg4DDqavIrC7Fomj1T0RAxDJ6EYIMDyRIsIdXHpeWZmjFk3BQDdCX3YX3JjF6lwF3kkM RJqBZf/YqnWUUzgCD0bHaU+LEj9KNvYIfhYHKsnaL69hDLSxRaIBYuGlY3IdC2MpvI1575ZSrIt
 VlRwOWFjh0vQtoMa62T6ElXXtZh1XwOlvlhVVMVSqZIinzjGm8GAwvTtWL51i/SAlIh/f1lNbQB YvmctyE5DT36qvcb9Y1i1ts9hMvG3ry0g0sEaHXGyBnKJbWf4pSXn5KPJyeF4YGedfbIJv1CkWh qWqLEyuopn0fXgLaCVVFZdZGg/TSjdNEBlklZCPHELhKnBct8qKp3hfCkJPCzJupu+fesW2Rhas
 Ud4B7QvQwwpIZK8Z2X2I/7pqwZKWKa+OaNkljogtcY833izrWj0iZt7PTQ9Ot2bFLDz9MNsS
X-Proofpoint-GUID: tCgP3-lgOrkxj3E1wHzDoJm7v772lhgd
X-Authority-Analysis: v=2.4 cv=GrRC+l1C c=1 sm=1 tr=0 ts=6865af66 cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VnNF1IyMAAAA:8 a=fbHa879tV7MQQsezulwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 adultscore=0 mlxlogscore=999 mlxscore=0 impostorscore=0
 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020181
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
index c3cd5b131033..11430e5a7224 100644
--- a/arch/powerpc/include/asm/papr-sysparm.h
+++ b/arch/powerpc/include/asm/papr-sysparm.h
@@ -21,6 +21,7 @@ typedef struct {
 #define PAPR_SYSPARM_COOP_MEM_OVERCOMMIT_ATTRS     mk_papr_sysparm(44)
 #define PAPR_SYSPARM_TLB_BLOCK_INVALIDATE_ATTRS    mk_papr_sysparm(50)
 #define PAPR_SYSPARM_LPAR_NAME                     mk_papr_sysparm(55)
+#define PAPR_SYS_PARAM_HVPIPE_ENABLE               mk_papr_sysparm(64)
 
 /**
  * struct papr_sysparm_buf - RTAS work area layout for system parameter functions.
diff --git a/arch/powerpc/platforms/pseries/papr-hvpipe.c b/arch/powerpc/platforms/pseries/papr-hvpipe.c
index ebccd6a70ab6..b103dde7d584 100644
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
+	ret = papr_sysparm_set(PAPR_SYS_PARAM_HVPIPE_ENABLE, buf);
+	if (!ret)
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


