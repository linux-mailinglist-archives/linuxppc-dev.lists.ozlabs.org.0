Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9AE9788C65
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Aug 2023 17:23:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IMIFtCw3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RXNyQ2Hfqz3dRV
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Aug 2023 01:23:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IMIFtCw3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RXNrq0v0cz2yh2
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Aug 2023 01:18:50 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37PFI3rR008965;
	Fri, 25 Aug 2023 15:18:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=09MNY9PiuRvnqSPglkkiSskIQIWedRRnZALkKFuLvXM=;
 b=IMIFtCw3lOE58Ww1esklTug30UvsbO5+9/MP9YTJUN365hiQ7XHimCucT6OiridPLbiS
 EWiou7Pc9V5GeLjbzP9JpFeRoeSNDeub9rjZLhTPsW+4r9ugt1oDBkpuV171DheNSmFp
 /kIUkvn6IVuPONA8nqdHHSRexcwRZiA+OVeuD7YZiobQ32N72mDdXwKE3UyVTUjDo1LY
 zJXYNYeFUOFNrpO2+UYKQNen4jGbHMwSLLh0x+sUG0KrnHgkc32JwZ0chgevVvke3drX
 HyxUFUk4no2K5xNyfLP2bcASrBq1BQhiqWY2UjwHndonwbwx/jQSF1wUoe1Mft33nijy tg== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3spxtj804t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Aug 2023 15:18:22 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37PFGnfT016735;
	Fri, 25 Aug 2023 15:18:21 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3sn2288hfn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Aug 2023 15:18:21 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 37PFIJpG55181768
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Aug 2023 15:18:19 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BA19220043;
	Fri, 25 Aug 2023 15:18:19 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A5EA320040;
	Fri, 25 Aug 2023 15:18:17 +0000 (GMT)
Received: from li-bd3f974c-2712-11b2-a85c-df1cec4d728e.ibm.com.com (unknown [9.43.75.97])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 25 Aug 2023 15:18:17 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, bpf@vger.kernel.org
Subject: [PATCH v3 2/5] powerpc/bpf: implement bpf_arch_text_invalidate for bpf_prog_pack
Date: Fri, 25 Aug 2023 20:48:07 +0530
Message-ID: <20230825151810.164418-3-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230825151810.164418-1-hbathini@linux.ibm.com>
References: <20230825151810.164418-1-hbathini@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: w69WJ_0l5yW4enckGL6WzcUSANwOpf9T
X-Proofpoint-ORIG-GUID: w69WJ_0l5yW4enckGL6WzcUSANwOpf9T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-25_13,2023-08-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=938 phishscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 spamscore=0 impostorscore=0 clxscore=1015
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308250134
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

Implement bpf_arch_text_invalidate and use it to fill unused part of
the bpf_prog_pack with trap instructions when a BPF program is freed.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---
 arch/powerpc/net/bpf_jit_comp.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
index 170ebf8ac0f2..7cd4cf53d61c 100644
--- a/arch/powerpc/net/bpf_jit_comp.c
+++ b/arch/powerpc/net/bpf_jit_comp.c
@@ -30,7 +30,7 @@ static void bpf_jit_fill_ill_insns(void *area, unsigned int size)
  * Patch 'len' bytes of instructions from opcode to addr, one instruction
  * at a time. Returns addr on success. ERR_PTR(-EINVAL), otherwise.
  */
-static void *bpf_patch_instructions(void *addr, void *opcode, size_t len)
+static void *bpf_patch_instructions(void *addr, void *opcode, size_t len, bool fill_insn)
 {
 	while (len > 0) {
 		ppc_inst_t insn = ppc_inst_read(opcode);
@@ -41,7 +41,8 @@ static void *bpf_patch_instructions(void *addr, void *opcode, size_t len)
 
 		len -= ilen;
 		addr = addr + ilen;
-		opcode = opcode + ilen;
+		if (!fill_insn)
+			opcode = opcode + ilen;
 	}
 
 	return addr;
@@ -307,7 +308,22 @@ void *bpf_arch_text_copy(void *dst, void *src, size_t len)
 		return ERR_PTR(-EINVAL);
 
 	mutex_lock(&text_mutex);
-	ret = bpf_patch_instructions(dst, src, len);
+	ret = bpf_patch_instructions(dst, src, len, false);
+	mutex_unlock(&text_mutex);
+
+	return ret;
+}
+
+int bpf_arch_text_invalidate(void *dst, size_t len)
+{
+	u32 insn = BREAKPOINT_INSTRUCTION;
+	int ret;
+
+	if (WARN_ON_ONCE(core_kernel_text((unsigned long)dst)))
+		return -EINVAL;
+
+	mutex_lock(&text_mutex);
+	ret = IS_ERR(bpf_patch_instructions(dst, &insn, len, true));
 	mutex_unlock(&text_mutex);
 
 	return ret;
-- 
2.41.0

