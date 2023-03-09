Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B596B2C8B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Mar 2023 19:02:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PXcTw0LTRz3f5q
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Mar 2023 05:02:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZgHSS83P;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZgHSS83P;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PXcRv5nC8z3cdB
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Mar 2023 05:00:59 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 329G6UI9029817;
	Thu, 9 Mar 2023 18:00:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=A5AKwOUs+uMWUCbUoTWVjEcmvjf7fiTJPjcDcCjwW4g=;
 b=ZgHSS83PaQWTdtrPubzYhtx7niLNFi35S0FmLOJJvMXpvP8r1cIyyVcbNafIh/d+v7Yc
 72kPjhexrSwK3ddQqRqihoon1VmB2SkzeqU40umjJsuqhx9toPrZnh4EXw8BlTcXU0cQ
 DfAlN3X9eapFVvrX0gOdsVTif7SCthNnIDAvxNi+vhkTmthP7RU6yn3lcxXZGCSFG0dY
 okp+H7sYpxXJswaASKWfFWwGW3H1krbecwE3RWjeIndpu98ErFE3cZ+Um6ipxIAuPmMq
 WBthFQebllf1DXmypI+H60yZNVHLBYc1U4eE0qENJc/9ZpuQVBTtMnOvZLMf84u/nj3c rg== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p6qyquykw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Mar 2023 18:00:40 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 329Cxjl1032318;
	Thu, 9 Mar 2023 18:00:38 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma02fra.de.ibm.com (PPS) with ESMTPS id 3p6g03a19k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Mar 2023 18:00:38 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 329I0aPB27722078
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 9 Mar 2023 18:00:36 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0F3F020065;
	Thu,  9 Mar 2023 18:00:36 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 12CA820049;
	Thu,  9 Mar 2023 18:00:34 +0000 (GMT)
Received: from li-bd3f974c-2712-11b2-a85c-df1cec4d728e.ibm.com.com (unknown [9.43.13.46])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  9 Mar 2023 18:00:33 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, bpf@vger.kernel.org
Subject: [PATCH v2 2/4] powerpc/bpf: implement bpf_arch_text_copy
Date: Thu,  9 Mar 2023 23:30:26 +0530
Message-Id: <20230309180028.180200-3-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230309180028.180200-1-hbathini@linux.ibm.com>
References: <20230309180028.180200-1-hbathini@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: mLD8JkM1oHAXnUTcUjwGXZhbE8UYXuZq
X-Proofpoint-ORIG-GUID: mLD8JkM1oHAXnUTcUjwGXZhbE8UYXuZq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-09_09,2023-03-09_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 clxscore=1015 phishscore=0 suspectscore=0 mlxlogscore=999
 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303090141
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
Cc: Song Liu <songliubraving@fb.com>, Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

bpf_arch_text_copy is used to dump JITed binary to RX page, allowing
multiple BPF programs to share the same page. Use the newly introduced
patch_instructions() to implement it. Around 5X improvement in speed
of execution observed, using the new patch_instructions() function
over patch_instruction(), while running the tests from test_bpf.ko.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---
 arch/powerpc/net/bpf_jit_comp.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
index e93aefcfb83f..0a70319116d1 100644
--- a/arch/powerpc/net/bpf_jit_comp.c
+++ b/arch/powerpc/net/bpf_jit_comp.c
@@ -13,9 +13,12 @@
 #include <linux/netdevice.h>
 #include <linux/filter.h>
 #include <linux/if_vlan.h>
-#include <asm/kprobes.h>
+#include <linux/memory.h>
 #include <linux/bpf.h>
 
+#include <asm/kprobes.h>
+#include <asm/code-patching.h>
+
 #include "bpf_jit.h"
 
 static void bpf_jit_fill_ill_insns(void *area, unsigned int size)
@@ -272,3 +275,21 @@ int bpf_add_extable_entry(struct bpf_prog *fp, u32 *image, int pass, struct code
 	ctx->exentry_idx++;
 	return 0;
 }
+
+void *bpf_arch_text_copy(void *dst, void *src, size_t len)
+{
+	void *ret = ERR_PTR(-EINVAL);
+	int err;
+
+	if (WARN_ON_ONCE(core_kernel_text((unsigned long)dst)))
+		return ret;
+
+	ret = dst;
+	mutex_lock(&text_mutex);
+	err = patch_instructions(dst, src, false, len);
+	if (err)
+		ret = ERR_PTR(err);
+	mutex_unlock(&text_mutex);
+
+	return ret;
+}
-- 
2.39.2

