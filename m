Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F1B788C63
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Aug 2023 17:22:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iHZFvnBr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RXNxT0Kg8z3dDg
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Aug 2023 01:22:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iHZFvnBr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RXNrp15jNz2ygq
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Aug 2023 01:18:49 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37PF26Qq029249;
	Fri, 25 Aug 2023 15:18:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=hepVXRKFiRIv4IdaE1nHxJMdgayn+XmVr4DAvmp/X/A=;
 b=iHZFvnBrgcv2yBa9a049mozeOEMp5nwifNfjvKJGjszW+8ibowUl2DbiI98hJDtgr3xW
 9TXXE8j6saDhtZuewv1OczrcvISDzDV0PghCAMULExhbyhU10F8pfe9VP+prpAAeymqh
 2Apfhh7LgeCaCGXA49P3LLgzfQM0/JhTvpu4/c3SwVKk4phi8sLHN3hrIJJCQ3Iszwnl
 rIC3j/PmmazcaT1ZRP+GwPeywi/jacf3KLkqypoRMcEjXAv+rUpRIU6u7VW/tOvJr5sV
 F6ejF/ceVcr39/dMucdaJZOVFvwG3llWA70CiKQZgbbU5pgy2azv7VwH9kNe6QMn2vCv fg== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3spxk48g0j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Aug 2023 15:18:29 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37PDK5tR004050;
	Fri, 25 Aug 2023 15:18:29 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3sn21s0g22-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Aug 2023 15:18:28 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 37PFIRFO46072528
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Aug 2023 15:18:27 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F0D1520043;
	Fri, 25 Aug 2023 15:18:26 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E526320040;
	Fri, 25 Aug 2023 15:18:24 +0000 (GMT)
Received: from li-bd3f974c-2712-11b2-a85c-df1cec4d728e.ibm.com.com (unknown [9.43.75.97])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 25 Aug 2023 15:18:24 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, bpf@vger.kernel.org
Subject: [PATCH v3 5/5] powerpc/bpf: use patch_instructions()
Date: Fri, 25 Aug 2023 20:48:10 +0530
Message-ID: <20230825151810.164418-6-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230825151810.164418-1-hbathini@linux.ibm.com>
References: <20230825151810.164418-1-hbathini@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: zW0Gs0G3hAgvPHrma_6ZckW5s_A8oHh-
X-Proofpoint-GUID: zW0Gs0G3hAgvPHrma_6ZckW5s_A8oHh-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-25_13,2023-08-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 mlxscore=0 adultscore=0 spamscore=0 impostorscore=0 mlxlogscore=879
 lowpriorityscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Use the newly introduced patch_instructions() that handles patching
multiple instructions with one call. This improves speed of exectution
for JIT'ing bpf programs.

Without this patch (on a POWER9 lpar):

  # time modprobe test_bpf
  real    2m59.681s
  user    0m0.000s
  sys     1m44.160s
  #

With this patch (on a POWER9 lpar):

  # time modprobe test_bpf
  real    0m5.013s
  user    0m0.000s
  sys     0m4.216s
  #

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---
 arch/powerpc/net/bpf_jit_comp.c | 30 ++++--------------------------
 1 file changed, 4 insertions(+), 26 deletions(-)

diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
index c60d7570e05d..1e5000d18321 100644
--- a/arch/powerpc/net/bpf_jit_comp.c
+++ b/arch/powerpc/net/bpf_jit_comp.c
@@ -26,28 +26,6 @@ static void bpf_jit_fill_ill_insns(void *area, unsigned int size)
 	memset32(area, BREAKPOINT_INSTRUCTION, size / 4);
 }
 
-/*
- * Patch 'len' bytes of instructions from opcode to addr, one instruction
- * at a time. Returns addr on success. ERR_PTR(-EINVAL), otherwise.
- */
-static void *bpf_patch_instructions(void *addr, void *opcode, size_t len, bool fill_insn)
-{
-	while (len > 0) {
-		ppc_inst_t insn = ppc_inst_read(opcode);
-		int ilen = ppc_inst_len(insn);
-
-		if (patch_instruction(addr, insn))
-			return ERR_PTR(-EINVAL);
-
-		len -= ilen;
-		addr = addr + ilen;
-		if (!fill_insn)
-			opcode = opcode + ilen;
-	}
-
-	return addr;
-}
-
 int bpf_jit_emit_exit_insn(u32 *image, struct codegen_context *ctx, int tmp_reg, long exit_addr)
 {
 	if (!exit_addr || is_offset_in_branch_range(exit_addr - (ctx->idx * 4))) {
@@ -330,16 +308,16 @@ int bpf_add_extable_entry(struct bpf_prog *fp, u32 *image, u32 *fimage, int pass
 
 void *bpf_arch_text_copy(void *dst, void *src, size_t len)
 {
-	void *ret;
+	int err;
 
 	if (WARN_ON_ONCE(core_kernel_text((unsigned long)dst)))
 		return ERR_PTR(-EINVAL);
 
 	mutex_lock(&text_mutex);
-	ret = bpf_patch_instructions(dst, src, len, false);
+	err = patch_instructions(dst, src, len, false);
 	mutex_unlock(&text_mutex);
 
-	return ret;
+	return err ? ERR_PTR(err) : dst;
 }
 
 int bpf_arch_text_invalidate(void *dst, size_t len)
@@ -351,7 +329,7 @@ int bpf_arch_text_invalidate(void *dst, size_t len)
 		return -EINVAL;
 
 	mutex_lock(&text_mutex);
-	ret = IS_ERR(bpf_patch_instructions(dst, &insn, len, true));
+	ret = patch_instructions(dst, &insn, len, true);
 	mutex_unlock(&text_mutex);
 
 	return ret;
-- 
2.41.0

