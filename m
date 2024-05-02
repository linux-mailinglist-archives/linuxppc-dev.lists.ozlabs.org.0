Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D22158B9F95
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2024 19:34:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GBt2AHgZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VVgz73Lwdz3ckN
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2024 03:34:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GBt2AHgZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VVgxc2dzwz3cVm
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2024 03:32:51 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 442HRCti021266;
	Thu, 2 May 2024 17:32:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=JIL5lk6UNm+SMBzpIAyATQq6e3XKM7ByRDdvdp+Nd6U=;
 b=GBt2AHgZy2ljW+aV4fCT/SgKow/iYqbWiusf4yRCqk/Z4b4nlO8dYhquVDp2Kds8FLqn
 CI76xWPfVSd1WjGyzfNoXMejjii3/iZKJiFIqeFoZTbtzbSFKRbDiQ/ck90jIzGmZcKa
 gCliM7lhw6sIPDVCDCXuvTD/h81CIb4AeJay//Mm3A7OUvqgcB+FXvux/SWixZ1iBACe
 W0laFeQTPR5RaLdUh6jvHZMBBSyB8+bfHatBk4qsHEEQB4bc983z8FunJmWHc6A6l7k+
 TeaOTLUoESXpR9NHXNdE7hlvvqDKEyHjLVQSa8nM2O5WfsWneNGpV77Hssfc2qkkU3fm Sw== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xvf87r0eb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 May 2024 17:32:14 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 442EsJdi027556;
	Thu, 2 May 2024 17:32:13 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3xsc30sc95-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 May 2024 17:32:13 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 442HW9wO30605740
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 2 May 2024 17:32:11 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A65BF20065;
	Thu,  2 May 2024 17:32:09 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E144F2004D;
	Thu,  2 May 2024 17:32:06 +0000 (GMT)
Received: from li-bd3f974c-2712-11b2-a85c-df1cec4d728e.ibm.com.com (unknown [9.43.113.195])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  2 May 2024 17:32:06 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, bpf@vger.kernel.org
Subject: [PATCH v4 1/2] powerpc64/bpf: fix tail calls for PCREL addressing
Date: Thu,  2 May 2024 23:02:04 +0530
Message-ID: <20240502173205.142794-1-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: jYrSV768ZNXbY9FSJdfTlD6fTHVxz4kW
X-Proofpoint-GUID: jYrSV768ZNXbY9FSJdfTlD6fTHVxz4kW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-02_09,2024-05-02_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0 clxscore=1011
 impostorscore=0 spamscore=0 bulkscore=0 mlxscore=0 adultscore=0
 phishscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2404010000 definitions=main-2405020115
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
Cc: Song Liu <songliubraving@fb.com>, Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, stable@vger.kernel.org, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Martin KaFai Lau <martin.lau@linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With PCREL addressing, there is no kernel TOC. So, it is not setup in
prologue when PCREL addressing is used. But the number of instructions
to skip on a tail call was not adjusted accordingly. That resulted in
not so obvious failures while using tailcalls. 'tailcalls' selftest
crashed the system with the below call trace:

  bpf_test_run+0xe8/0x3cc (unreliable)
  bpf_prog_test_run_skb+0x348/0x778
  __sys_bpf+0xb04/0x2b00
  sys_bpf+0x28/0x38
  system_call_exception+0x168/0x340
  system_call_vectored_common+0x15c/0x2ec

Also, as bpf programs are always module addresses and a bpf helper in
general is a core kernel text address, using PC relative addressing
often fails with "out of range of pcrel address" error. Switch to
using kernel base for relative addressing to handle this better.

Fixes: 7e3a68be42e1 ("powerpc/64: vmlinux support building with PCREL addresing")
Cc: stable@vger.kernel.org
Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---

* Changes in v4:
  - Fix out of range errors by switching to kernelbase instead of PC
    for relative addressing.

* Changes in v3:
  - New patch to fix tailcall issues with PCREL addressing.


 arch/powerpc/net/bpf_jit_comp64.c | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index 79f23974a320..4de08e35e284 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -202,7 +202,8 @@ void bpf_jit_build_epilogue(u32 *image, struct codegen_context *ctx)
 	EMIT(PPC_RAW_BLR());
 }
 
-static int bpf_jit_emit_func_call_hlp(u32 *image, struct codegen_context *ctx, u64 func)
+static int
+bpf_jit_emit_func_call_hlp(u32 *image, u32 *fimage, struct codegen_context *ctx, u64 func)
 {
 	unsigned long func_addr = func ? ppc_function_entry((void *)func) : 0;
 	long reladdr;
@@ -211,19 +212,20 @@ static int bpf_jit_emit_func_call_hlp(u32 *image, struct codegen_context *ctx, u
 		return -EINVAL;
 
 	if (IS_ENABLED(CONFIG_PPC_KERNEL_PCREL)) {
-		reladdr = func_addr - CTX_NIA(ctx);
+		reladdr = func_addr - local_paca->kernelbase;
 
 		if (reladdr >= (long)SZ_8G || reladdr < -(long)SZ_8G) {
-			pr_err("eBPF: address of %ps out of range of pcrel address.\n",
-				(void *)func);
+			pr_err("eBPF: address of %ps out of range of 34-bit relative address.\n",
+			       (void *)func);
 			return -ERANGE;
 		}
-		/* pla r12,addr */
-		EMIT(PPC_PREFIX_MLS | __PPC_PRFX_R(1) | IMM_H18(reladdr));
-		EMIT(PPC_INST_PADDI | ___PPC_RT(_R12) | IMM_L(reladdr));
-		EMIT(PPC_RAW_MTCTR(_R12));
-		EMIT(PPC_RAW_BCTR());
-
+		EMIT(PPC_RAW_LD(_R12, _R13, offsetof(struct paca_struct, kernelbase)));
+		/* Align for subsequent prefix instruction */
+		if (!IS_ALIGNED((unsigned long)fimage + CTX_NIA(ctx), 8))
+			EMIT(PPC_RAW_NOP());
+		/* paddi r12,r12,addr */
+		EMIT(PPC_PREFIX_MLS | __PPC_PRFX_R(0) | IMM_H18(reladdr));
+		EMIT(PPC_INST_PADDI | ___PPC_RT(_R12) | ___PPC_RA(_R12) | IMM_L(reladdr));
 	} else {
 		reladdr = func_addr - kernel_toc_addr();
 		if (reladdr > 0x7FFFFFFF || reladdr < -(0x80000000L)) {
@@ -233,9 +235,9 @@ static int bpf_jit_emit_func_call_hlp(u32 *image, struct codegen_context *ctx, u
 
 		EMIT(PPC_RAW_ADDIS(_R12, _R2, PPC_HA(reladdr)));
 		EMIT(PPC_RAW_ADDI(_R12, _R12, PPC_LO(reladdr)));
-		EMIT(PPC_RAW_MTCTR(_R12));
-		EMIT(PPC_RAW_BCTRL());
 	}
+	EMIT(PPC_RAW_MTCTR(_R12));
+	EMIT(PPC_RAW_BCTRL());
 
 	return 0;
 }
@@ -285,7 +287,7 @@ static int bpf_jit_emit_tail_call(u32 *image, struct codegen_context *ctx, u32 o
 	int b2p_index = bpf_to_ppc(BPF_REG_3);
 	int bpf_tailcall_prologue_size = 8;
 
-	if (IS_ENABLED(CONFIG_PPC64_ELF_ABI_V2))
+	if (!IS_ENABLED(CONFIG_PPC_KERNEL_PCREL) && IS_ENABLED(CONFIG_PPC64_ELF_ABI_V2))
 		bpf_tailcall_prologue_size += 4; /* skip past the toc load */
 
 	/*
@@ -993,7 +995,7 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, struct code
 				return ret;
 
 			if (func_addr_fixed)
-				ret = bpf_jit_emit_func_call_hlp(image, ctx, func_addr);
+				ret = bpf_jit_emit_func_call_hlp(image, fimage, ctx, func_addr);
 			else
 				ret = bpf_jit_emit_func_call_rel(image, fimage, ctx, func_addr);
 
-- 
2.44.0

