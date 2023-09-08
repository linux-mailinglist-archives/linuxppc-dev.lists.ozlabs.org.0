Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2D77987EB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Sep 2023 15:33:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YSP9o9FC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RhxrH1HRFz3dTN
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Sep 2023 23:33:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YSP9o9FC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rhxkq719Vz3c7s
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Sep 2023 23:28:19 +1000 (AEST)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 388D8ftf004868;
	Fri, 8 Sep 2023 13:28:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=xtWIABgiVrD0T5myOpr++O1iK45Hp5XBO9XdOGCmMt4=;
 b=YSP9o9FCR/sZdow8ZkHfHnOfmxKF77z0UTbXlbJbQXpv9Ux1ytd2MNuHt4fqbpnMoBLx
 9RyryqUZwQYzjTTTNHCB6UZm0AQ3BuxkXywfYLki8T5TujPX/kxbvKvSG40s+2Jb1YVj
 Dl82JERPunZfVDsam8VOM+jpdLrFsvTxi6/DxSzKfGj2d/DEDe3ds0hBLvQ0lbUYzRaG
 46NQMduVXcOV8KAJJ9+ieZgBD5XuGvnLFxVMoBdOxBQlpBTZ16r+LhUVcEIiILw/pW2c
 rwUrb9lOH5495feAif/Ls6KFyPWtaH8obF1FExKDkheQdnNqRUyo+TGQuLqJD/WiQVSR 3A== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t03yyru5e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Sep 2023 13:28:00 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 388BJuum006625;
	Fri, 8 Sep 2023 13:27:59 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3svgvm3nyv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Sep 2023 13:27:59 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 388DRv9t23003698
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 8 Sep 2023 13:27:57 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6260520049;
	Fri,  8 Sep 2023 13:27:57 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2D53920040;
	Fri,  8 Sep 2023 13:27:55 +0000 (GMT)
Received: from li-bd3f974c-2712-11b2-a85c-df1cec4d728e.ibm.com.com (unknown [9.43.29.230])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  8 Sep 2023 13:27:54 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, bpf@vger.kernel.org
Subject: [PATCH v4 5/5] powerpc/bpf: use patch_instructions()
Date: Fri,  8 Sep 2023 18:57:40 +0530
Message-ID: <20230908132740.718103-6-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230908132740.718103-1-hbathini@linux.ibm.com>
References: <20230908132740.718103-1-hbathini@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: JgllrVCUwflaJkgdZgKicC0TDJtVU2ID
X-Proofpoint-ORIG-GUID: JgllrVCUwflaJkgdZgKicC0TDJtVU2ID
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-08_09,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 mlxlogscore=850 spamscore=0 impostorscore=0 mlxscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309080121
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
 arch/powerpc/net/bpf_jit_comp.c | 34 ++++++---------------------------
 1 file changed, 6 insertions(+), 28 deletions(-)

diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
index c89ff34504a1..1e5000d18321 100644
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
@@ -330,31 +308,31 @@ int bpf_add_extable_entry(struct bpf_prog *fp, u32 *image, u32 *fimage, int pass
 
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
 {
 	u32 insn = BREAKPOINT_INSTRUCTION;
-	void *ret;
+	int ret;
 
 	if (WARN_ON_ONCE(core_kernel_text((unsigned long)dst)))
 		return -EINVAL;
 
 	mutex_lock(&text_mutex);
-	ret = bpf_patch_instructions(dst, &insn, len, true);
+	ret = patch_instructions(dst, &insn, len, true);
 	mutex_unlock(&text_mutex);
 
-	return IS_ERR(ret) ? PTR_ERR(ret) : 0;
+	return ret;
 }
 
 void bpf_jit_free(struct bpf_prog *fp)
-- 
2.41.0

