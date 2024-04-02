Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E977689511D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Apr 2024 12:59:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Do1DuaqF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V84dK3p83z3dVb
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Apr 2024 21:59:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Do1DuaqF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V84cY3s0rz2xPW
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Apr 2024 21:58:37 +1100 (AEDT)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 4329q3xF027927;
	Tue, 2 Apr 2024 10:58:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=HXJywvJ8h1L2hokQDmarX8Smkzv5YFT3TxW2MlAzZSU=;
 b=Do1DuaqFXi/+qr2bhcqsCvCAc0JdFaljcYwMe65RphvnTtYk9ClpHxSdQo5e6fXkYCT5
 WxzpMX9pmXZTx9kowE/MMzM8d8AlQtO3N3ficHMTFyKQhmxWassl2W8lNigJJqwDJS/z
 NajTLppFfJglpS87nDV51Clare6vnqez97C8IOpUpaZQFXEZ0CKM3EHBCg5C4/hdg8n0
 u/7kwQ2cHEUCu2zjtiYexQ22ZGzkQATIIzUfCklXhbEJdUIHNLv6XbkZVnJwu1Bo7di/
 6N0r1TjCjnRa1XjnDmD4QWHyfakqrbNBBgp2lGZdMX7FGdmVHhC4OpQQ2W8DNvZAusAf CQ== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3x8frwr6bd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Apr 2024 10:58:17 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 4328DlJC025770;
	Tue, 2 Apr 2024 10:58:15 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3x6x2p5xph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Apr 2024 10:58:15 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 432AwBVH32703202
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 2 Apr 2024 10:58:13 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A89EE20043;
	Tue,  2 Apr 2024 10:58:11 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B588D20040;
	Tue,  2 Apr 2024 10:58:09 +0000 (GMT)
Received: from li-bd3f974c-2712-11b2-a85c-df1cec4d728e.in.ibm.com (unknown [9.203.115.195])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  2 Apr 2024 10:58:09 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, bpf@vger.kernel.org
Subject: [PATCH v3 2/2] powerpc/bpf: enable kfunc call
Date: Tue,  2 Apr 2024 16:28:06 +0530
Message-ID: <20240402105806.352037-2-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240402105806.352037-1-hbathini@linux.ibm.com>
References: <20240402105806.352037-1-hbathini@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: AkUoj42BhHnMAckCHyBUXsZSa8cek-ih
X-Proofpoint-GUID: AkUoj42BhHnMAckCHyBUXsZSa8cek-ih
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-02_04,2024-04-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2403210000
 definitions=main-2404020079
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
Cc: Song Liu <songliubraving@fb.com>, Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Martin KaFai Lau <martin.lau@linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently, bpf jit code on powerpc assumes all the bpf functions and
helpers to be kernel text. This is false for kfunc case, as function
addresses can be module addresses as well. So, ensure module addresses
are supported to enable kfunc support.

Emit instructions based on whether the function address is kernel text
address or module address to retain optimized instruction sequence for
kernel text address case.

Also, as bpf programs are always module addresses and a bpf helper can
be within kernel address as well, using relative addressing often fails
with "out of range of pcrel address" error. Use unoptimized instruction
sequence for both kernel and module addresses to work around this, when
PCREL addressing is used.

With module addresses supported, override bpf_jit_supports_kfunc_call()
to enable kfunc support. Since module address offsets can be more than
32-bit long on PPC64, override bpf_jit_supports_far_kfunc_call() to
enable 64-bit pointers.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---

* Changes in v3:
  - Retained optimized instruction sequence when function address is
    a core kernel address as suggested by Naveen.
  - Used unoptimized instruction sequence for PCREL addressing to
    avoid out of range errors for core kernel function addresses.
  - Folded patch that adds support for kfunc calls with patch that
    enables/advertises this support as suggested by Naveen.


 arch/powerpc/net/bpf_jit_comp.c   | 10 +++++++
 arch/powerpc/net/bpf_jit_comp64.c | 48 ++++++++++++++++++++-----------
 2 files changed, 42 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
index 0f9a21783329..dc7ffafd7441 100644
--- a/arch/powerpc/net/bpf_jit_comp.c
+++ b/arch/powerpc/net/bpf_jit_comp.c
@@ -359,3 +359,13 @@ void bpf_jit_free(struct bpf_prog *fp)
 
 	bpf_prog_unlock_free(fp);
 }
+
+bool bpf_jit_supports_kfunc_call(void)
+{
+	return true;
+}
+
+bool bpf_jit_supports_far_kfunc_call(void)
+{
+	return IS_ENABLED(CONFIG_PPC64) ? true : false;
+}
diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index 7f62ac4b4e65..ec3adf715c55 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -207,24 +207,14 @@ static int bpf_jit_emit_func_call_hlp(u32 *image, struct codegen_context *ctx, u
 	unsigned long func_addr = func ? ppc_function_entry((void *)func) : 0;
 	long reladdr;
 
-	if (WARN_ON_ONCE(!core_kernel_text(func_addr)))
+	/*
+	 * With the introduction of kfunc feature, BPF helpers can be part of kernel as
+	 * well as module text address.
+	 */
+	if (WARN_ON_ONCE(!kernel_text_address(func_addr)))
 		return -EINVAL;
 
-	if (IS_ENABLED(CONFIG_PPC_KERNEL_PCREL)) {
-		reladdr = func_addr - CTX_NIA(ctx);
-
-		if (reladdr >= (long)SZ_8G || reladdr < -(long)SZ_8G) {
-			pr_err("eBPF: address of %ps out of range of pcrel address.\n",
-				(void *)func);
-			return -ERANGE;
-		}
-		/* pla r12,addr */
-		EMIT(PPC_PREFIX_MLS | __PPC_PRFX_R(1) | IMM_H18(reladdr));
-		EMIT(PPC_INST_PADDI | ___PPC_RT(_R12) | IMM_L(reladdr));
-		EMIT(PPC_RAW_MTCTR(_R12));
-		EMIT(PPC_RAW_BCTR());
-
-	} else {
+	if (core_kernel_text(func_addr) && !IS_ENABLED(CONFIG_PPC_KERNEL_PCREL)) {
 		reladdr = func_addr - kernel_toc_addr();
 		if (reladdr > 0x7FFFFFFF || reladdr < -(0x80000000L)) {
 			pr_err("eBPF: address of %ps out of range of kernel_toc.\n", (void *)func);
@@ -235,6 +225,32 @@ static int bpf_jit_emit_func_call_hlp(u32 *image, struct codegen_context *ctx, u
 		EMIT(PPC_RAW_ADDI(_R12, _R12, PPC_LO(reladdr)));
 		EMIT(PPC_RAW_MTCTR(_R12));
 		EMIT(PPC_RAW_BCTRL());
+	} else {
+		if (IS_ENABLED(CONFIG_PPC64_ELF_ABI_V1)) {
+			/* func points to the function descriptor */
+			PPC_LI64(bpf_to_ppc(TMP_REG_2), func);
+			/* Load actual entry point from function descriptor */
+			EMIT(PPC_RAW_LD(bpf_to_ppc(TMP_REG_1), bpf_to_ppc(TMP_REG_2), 0));
+			/* ... and move it to CTR */
+			EMIT(PPC_RAW_MTCTR(bpf_to_ppc(TMP_REG_1)));
+			/*
+			 * Load TOC from function descriptor at offset 8.
+			 * We can clobber r2 since we get called through a
+			 * function pointer (so caller will save/restore r2)
+			 * and since we don't use a TOC ourself.
+			 */
+			EMIT(PPC_RAW_LD(2, bpf_to_ppc(TMP_REG_2), 8));
+			EMIT(PPC_RAW_BCTRL());
+		} else {
+			/* We can clobber r12 */
+			PPC_LI64(12, func);
+			EMIT(PPC_RAW_MTCTR(12));
+			EMIT(PPC_RAW_BCTRL());
+#ifndef CONFIG_PPC_KERNEL_PCREL
+			/* Restore kernel TOC */
+			EMIT(PPC_RAW_LD(2, 13, offsetof(struct paca_struct, kernel_toc)));
+#endif
+		}
 	}
 
 	return 0;
-- 
2.44.0

