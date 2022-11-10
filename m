Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F24EE6249DE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 19:46:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N7W5G6FtBz3f6y
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Nov 2022 05:46:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=F+Yhx1w4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=F+Yhx1w4;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N7W2L4zx4z3cKk
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Nov 2022 05:43:54 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2AAIUM9e004370;
	Thu, 10 Nov 2022 18:43:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=IcjDqd6cS4URn1Bismg4c78V21ACIjL41b+XP+SW6a0=;
 b=F+Yhx1w4R7wd/io8ikrqPHhPQVnkvLMkwgeNXmBLe04kBzeLYuSjh+7/uMTvJNI1a9Lf
 rHoXb6F2Vs7O4s8qDMLLnd5SAdIA+0WYJ3BIqLnaTkQlYhXgem/jIfiPjIXVLdbiK4hZ
 HF+CyiD4s7Y48u/UUDFLlb9nqLz7lFtDPUgsMFgcuKUR0C2avA6NXh25N48+oZ2oeK23
 YqmNA8bl21k4frXVgayr3CqZnFAp5Jas28+sNfDSoOMklMHCr5/NQH3DVFg7WL3BX+00
 ONNu4S/XQouJP/cxG9jmsYDQcRzkBEew1TblQwZuKjw3MCwpT81+iU+KXWGXSAWCmtA6 Hg== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3ks6mx8ac9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Nov 2022 18:43:28 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AAIaB9c000740;
	Thu, 10 Nov 2022 18:43:26 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma03ams.nl.ibm.com with ESMTP id 3kngqgfp8u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Nov 2022 18:43:26 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AAIhOum64553404
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Nov 2022 18:43:24 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 42BDBA404D;
	Thu, 10 Nov 2022 18:43:24 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2A742A4040;
	Thu, 10 Nov 2022 18:43:20 +0000 (GMT)
Received: from hbathini-workstation.ibm.com.com (unknown [9.163.72.10])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu, 10 Nov 2022 18:43:19 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, bpf@vger.kernel.org
Subject: [RFC PATCH 1/3] powerpc/bpf: implement bpf_arch_text_copy
Date: Fri, 11 Nov 2022 00:13:01 +0530
Message-Id: <20221110184303.393179-2-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221110184303.393179-1-hbathini@linux.ibm.com>
References: <20221110184303.393179-1-hbathini@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: o4Zeof7riaH8CMvSH6KGbmNGkeRMnagR
X-Proofpoint-ORIG-GUID: o4Zeof7riaH8CMvSH6KGbmNGkeRMnagR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-10_12,2022-11-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 mlxlogscore=999 clxscore=1015
 priorityscore=1501 mlxscore=0 suspectscore=0 malwarescore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211100129
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
multiple BPF programs to share the same page. Using patch_instruction
to implement it.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---
 arch/powerpc/net/bpf_jit_comp.c | 39 ++++++++++++++++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
index 43e634126514..7383e0effad2 100644
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
@@ -23,6 +26,35 @@ static void bpf_jit_fill_ill_insns(void *area, unsigned int size)
 	memset32(area, BREAKPOINT_INSTRUCTION, size / 4);
 }
 
+/*
+ * Patch 'len' bytes of instructions from opcode to addr, one instruction
+ * at a time. Returns addr on success. ERR_PTR(-EINVAL), otherwise.
+ */
+static void *bpf_patch_instructions(void *addr, void *opcode, size_t len)
+{
+	void *ret = ERR_PTR(-EINVAL);
+	size_t patched = 0;
+	u32 *inst = opcode;
+	u32 *start = addr;
+
+	if (WARN_ON_ONCE(core_kernel_text((unsigned long)addr)))
+		return ret;
+
+	mutex_lock(&text_mutex);
+	while (patched < len) {
+		if (patch_instruction(start++, ppc_inst(*inst)))
+			goto error;
+
+		inst++;
+		patched += 4;
+	}
+
+	ret = addr;
+error:
+	mutex_unlock(&text_mutex);
+	return ret;
+}
+
 /* Fix updated addresses (for subprog calls, ldimm64, et al) during extra pass */
 static int bpf_jit_fixup_addresses(struct bpf_prog *fp, u32 *image,
 				   struct codegen_context *ctx, u32 *addrs)
@@ -357,3 +389,8 @@ int bpf_add_extable_entry(struct bpf_prog *fp, u32 *image, int pass, struct code
 	ctx->exentry_idx++;
 	return 0;
 }
+
+void *bpf_arch_text_copy(void *dst, void *src, size_t len)
+{
+	return bpf_patch_instructions(dst, src, len);
+}
-- 
2.37.3

