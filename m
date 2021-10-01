Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C9F41F6D2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Oct 2021 23:21:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HLjjD6BFrz3ckP
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Oct 2021 07:21:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WsXGEtHr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=WsXGEtHr; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HLjZy1xNQz3bXP
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Oct 2021 07:16:10 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 191Km1pm001023; 
 Fri, 1 Oct 2021 17:15:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=xJu39RyhWcLezfza2Ro0r8fgSJGBqiE5rg6KnvD2dTA=;
 b=WsXGEtHrsT90SGCA6ZzgIrQ8lbv+shCAUBC/DV/YZ1pEcvD2X3UHmn96W810P585kMrN
 P5FQc1MsilARFkR0OWnvEQMLMLnzb106GYwm8uG9KXPyZEfCe+81ogH9tL4pAJyI9GE5
 3v/aUyogLHTolAaQIyL7xPg1W7Tq/bxTRJEIOQbkTkFdo1pVdLjpmrdGW2XaqjalxDSy
 g5ia+e1YYX1WPB5MS1wLqFm0JhSsECFpjOCOZgbKdRmZd23ealj/Rmubkhs6aRQsg45u
 wlj0AKaTUE34aKlhKjAlygX+dBeq61sE2OYY6rRALCnlKmnDpHKmt/LUqB1fDSEzvn6F 8A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3be9p60f3v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Oct 2021 17:15:49 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 191LDu8d006046;
 Fri, 1 Oct 2021 17:15:48 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3be9p60f3c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Oct 2021 17:15:48 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 191L6UmY019880;
 Fri, 1 Oct 2021 21:15:46 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma02fra.de.ibm.com with ESMTP id 3b9udae6kx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Oct 2021 21:15:46 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 191LFhWL43647234
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 1 Oct 2021 21:15:43 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4C74E4C04A;
 Fri,  1 Oct 2021 21:15:43 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7BD194C059;
 Fri,  1 Oct 2021 21:15:40 +0000 (GMT)
Received: from naverao1-tp.ibm.com (unknown [9.43.54.98])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  1 Oct 2021 21:15:40 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Johan Almbladh <johan.almbladh@anyfinetworks.com>
Subject: [PATCH 7/9] powerpc/bpf: Limit 'ldbrx' to processors compliant with
 ISA v2.06
Date: Sat,  2 Oct 2021 02:44:53 +0530
Message-Id: <b7024b63a5501bbb67699da2345250deeea03d7e.1633104510.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1633104510.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1633104510.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: YgdJxNf6O_MA0H_OToDO_z_px3GA3gZk
X-Proofpoint-ORIG-GUID: rxhKdQGdXmZQSEYaBzn0STv6XLnIwxEy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-01_05,2021-10-01_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 adultscore=0 mlxscore=0 mlxlogscore=899 lowpriorityscore=0 malwarescore=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110010147
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
Cc: bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Johan reported the below crash with test_bpf on ppc64 e5500:

  test_bpf: #296 ALU_END_FROM_LE 64: 0x0123456789abcdef -> 0x67452301 jited:1
  Oops: Exception in kernel mode, sig: 4 [#1]
  BE PAGE_SIZE=4K SMP NR_CPUS=24 QEMU e500
  Modules linked in: test_bpf(+)
  CPU: 0 PID: 76 Comm: insmod Not tainted 5.14.0-03771-g98c2059e008a-dirty #1
  NIP:  8000000000061c3c LR: 80000000006dea64 CTR: 8000000000061c18
  REGS: c0000000032d3420 TRAP: 0700   Not tainted (5.14.0-03771-g98c2059e008a-dirty)
  MSR:  0000000080089000 <EE,ME>  CR: 88002822  XER: 20000000 IRQMASK: 0
  <...>
  NIP [8000000000061c3c] 0x8000000000061c3c
  LR [80000000006dea64] .__run_one+0x104/0x17c [test_bpf]
  Call Trace:
   .__run_one+0x60/0x17c [test_bpf] (unreliable)
   .test_bpf_init+0x6a8/0xdc8 [test_bpf]
   .do_one_initcall+0x6c/0x28c
   .do_init_module+0x68/0x28c
   .load_module+0x2460/0x2abc
   .__do_sys_init_module+0x120/0x18c
   .system_call_exception+0x110/0x1b8
   system_call_common+0xf0/0x210
  --- interrupt: c00 at 0x101d0acc
  <...>
  ---[ end trace 47b2bf19090bb3d0 ]---

  Illegal instruction

The illegal instruction turned out to be 'ldbrx' emitted for
BPF_FROM_[L|B]E, which was only introduced in ISA v2.06. Guard use of
the same and implement an alternative approach for older processors.

Fixes: 156d0e290e969c ("powerpc/ebpf/jit: Implement JIT compiler for extended BPF")
Reported-by: Johan Almbladh <johan.almbladh@anyfinetworks.com>
Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/ppc-opcode.h |  1 +
 arch/powerpc/net/bpf_jit_comp64.c     | 22 +++++++++++++---------
 2 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/asm/ppc-opcode.h
index baea657bc8687e..bca31a61e57f88 100644
--- a/arch/powerpc/include/asm/ppc-opcode.h
+++ b/arch/powerpc/include/asm/ppc-opcode.h
@@ -498,6 +498,7 @@
 #define PPC_RAW_LDX(r, base, b)		(0x7c00002a | ___PPC_RT(r) | ___PPC_RA(base) | ___PPC_RB(b))
 #define PPC_RAW_LHZ(r, base, i)		(0xa0000000 | ___PPC_RT(r) | ___PPC_RA(base) | IMM_L(i))
 #define PPC_RAW_LHBRX(r, base, b)	(0x7c00062c | ___PPC_RT(r) | ___PPC_RA(base) | ___PPC_RB(b))
+#define PPC_RAW_LWBRX(r, base, b)	(0x7c00042c | ___PPC_RT(r) | ___PPC_RA(base) | ___PPC_RB(b))
 #define PPC_RAW_LDBRX(r, base, b)	(0x7c000428 | ___PPC_RT(r) | ___PPC_RA(base) | ___PPC_RB(b))
 #define PPC_RAW_STWCX(s, a, b)		(0x7c00012d | ___PPC_RS(s) | ___PPC_RA(a) | ___PPC_RB(b))
 #define PPC_RAW_CMPWI(a, i)		(0x2c000000 | ___PPC_RA(a) | IMM_L(i))
diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index 4641a50e82d50d..097d1ecfb9f562 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -601,17 +601,21 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 				EMIT(PPC_RAW_MR(dst_reg, b2p[TMP_REG_1]));
 				break;
 			case 64:
-				/*
-				 * Way easier and faster(?) to store the value
-				 * into stack and then use ldbrx
-				 *
-				 * ctx->seen will be reliable in pass2, but
-				 * the instructions generated will remain the
-				 * same across all passes
-				 */
+				/* Store the value to stack and then use byte-reverse loads */
 				PPC_BPF_STL(dst_reg, 1, bpf_jit_stack_local(ctx));
 				EMIT(PPC_RAW_ADDI(b2p[TMP_REG_1], 1, bpf_jit_stack_local(ctx)));
-				EMIT(PPC_RAW_LDBRX(dst_reg, 0, b2p[TMP_REG_1]));
+				if (cpu_has_feature(CPU_FTR_ARCH_206)) {
+					EMIT(PPC_RAW_LDBRX(dst_reg, 0, b2p[TMP_REG_1]));
+				} else {
+					EMIT(PPC_RAW_LWBRX(dst_reg, 0, b2p[TMP_REG_1]));
+					if (IS_ENABLED(CONFIG_CPU_LITTLE_ENDIAN))
+						EMIT(PPC_RAW_SLDI(dst_reg, dst_reg, 32));
+					EMIT(PPC_RAW_LI(b2p[TMP_REG_2], 4));
+					EMIT(PPC_RAW_LWBRX(b2p[TMP_REG_2], b2p[TMP_REG_2], b2p[TMP_REG_1]));
+					if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN))
+						EMIT(PPC_RAW_SLDI(b2p[TMP_REG_2], b2p[TMP_REG_2], 32));
+					EMIT(PPC_RAW_OR(dst_reg, dst_reg, b2p[TMP_REG_2]));
+				}
 				break;
 			}
 			break;
-- 
2.33.0

