Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4369542F68
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 20:57:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45PGMb62kCzDrBf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2019 04:57:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=naveen.n.rao@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45PGFF03tVzDqvZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2019 04:52:00 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5CIlQBJ086248
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 14:51:58 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2t35w8jqfx-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 14:51:58 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.vnet.ibm.com>;
 Wed, 12 Jun 2019 19:51:56 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 12 Jun 2019 19:51:52 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x5CIppiA40436118
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jun 2019 18:51:51 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C66F911C04A;
 Wed, 12 Jun 2019 18:51:51 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4408A11C04C;
 Wed, 12 Jun 2019 18:51:50 +0000 (GMT)
Received: from naverao1-tp.ibmuc.com (unknown [9.199.37.223])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 12 Jun 2019 18:51:50 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Daniel Borkmann <daniel@iogearbox.net>
Subject: [PATCH 2/2] powerpc/bpf: use unsigned division instruction for 64-bit
 operations
Date: Thu, 13 Jun 2019 00:21:40 +0530
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1560364574.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1560364574.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19061218-0028-0000-0000-00000379C105
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19061218-0029-0000-0000-00002439B6C5
Message-Id: <1cc07782f4f09389e6c0df52e93a6db1ce6710d3.1560364574.git.naveen.n.rao@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-12_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906120127
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
Cc: netdev@vger.kernel.org, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

BPF_ALU64 div/mod operations are currently using signed division, unlike
BPF_ALU32 operations. Fix the same. DIV64 and MOD64 overflow tests pass
with this fix.

Fixes: 156d0e290e969c ("powerpc/ebpf/jit: Implement JIT compiler for extended BPF")
Cc: stable@vger.kernel.org # v4.8+
Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/ppc-opcode.h | 1 +
 arch/powerpc/net/bpf_jit.h            | 2 +-
 arch/powerpc/net/bpf_jit_comp64.c     | 8 ++++----
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/asm/ppc-opcode.h
index 23f7ed796f38..49d65cd08ee0 100644
--- a/arch/powerpc/include/asm/ppc-opcode.h
+++ b/arch/powerpc/include/asm/ppc-opcode.h
@@ -342,6 +342,7 @@
 #define PPC_INST_MADDLD			0x10000033
 #define PPC_INST_DIVWU			0x7c000396
 #define PPC_INST_DIVD			0x7c0003d2
+#define PPC_INST_DIVDU			0x7c000392
 #define PPC_INST_RLWINM			0x54000000
 #define PPC_INST_RLWINM_DOT		0x54000001
 #define PPC_INST_RLWIMI			0x50000000
diff --git a/arch/powerpc/net/bpf_jit.h b/arch/powerpc/net/bpf_jit.h
index dcac37745b05..1e932898d430 100644
--- a/arch/powerpc/net/bpf_jit.h
+++ b/arch/powerpc/net/bpf_jit.h
@@ -116,7 +116,7 @@
 				     ___PPC_RA(a) | IMM_L(i))
 #define PPC_DIVWU(d, a, b)	EMIT(PPC_INST_DIVWU | ___PPC_RT(d) |	      \
 				     ___PPC_RA(a) | ___PPC_RB(b))
-#define PPC_DIVD(d, a, b)	EMIT(PPC_INST_DIVD | ___PPC_RT(d) |	      \
+#define PPC_DIVDU(d, a, b)	EMIT(PPC_INST_DIVDU | ___PPC_RT(d) |	      \
 				     ___PPC_RA(a) | ___PPC_RB(b))
 #define PPC_AND(d, a, b)	EMIT(PPC_INST_AND | ___PPC_RA(d) |	      \
 				     ___PPC_RS(a) | ___PPC_RB(b))
diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index 0ebd946f178b..b0fa4723d6fb 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -399,12 +399,12 @@ static int bpf_jit_build_body(struct bpf_prog *fp, u32 *image,
 		case BPF_ALU64 | BPF_DIV | BPF_X: /* dst /= src */
 		case BPF_ALU64 | BPF_MOD | BPF_X: /* dst %= src */
 			if (BPF_OP(code) == BPF_MOD) {
-				PPC_DIVD(b2p[TMP_REG_1], dst_reg, src_reg);
+				PPC_DIVDU(b2p[TMP_REG_1], dst_reg, src_reg);
 				PPC_MULD(b2p[TMP_REG_1], src_reg,
 						b2p[TMP_REG_1]);
 				PPC_SUB(dst_reg, dst_reg, b2p[TMP_REG_1]);
 			} else
-				PPC_DIVD(dst_reg, dst_reg, src_reg);
+				PPC_DIVDU(dst_reg, dst_reg, src_reg);
 			break;
 		case BPF_ALU | BPF_MOD | BPF_K: /* (u32) dst %= (u32) imm */
 		case BPF_ALU | BPF_DIV | BPF_K: /* (u32) dst /= (u32) imm */
@@ -432,7 +432,7 @@ static int bpf_jit_build_body(struct bpf_prog *fp, u32 *image,
 				break;
 			case BPF_ALU64:
 				if (BPF_OP(code) == BPF_MOD) {
-					PPC_DIVD(b2p[TMP_REG_2], dst_reg,
+					PPC_DIVDU(b2p[TMP_REG_2], dst_reg,
 							b2p[TMP_REG_1]);
 					PPC_MULD(b2p[TMP_REG_1],
 							b2p[TMP_REG_1],
@@ -440,7 +440,7 @@ static int bpf_jit_build_body(struct bpf_prog *fp, u32 *image,
 					PPC_SUB(dst_reg, dst_reg,
 							b2p[TMP_REG_1]);
 				} else
-					PPC_DIVD(dst_reg, dst_reg,
+					PPC_DIVDU(dst_reg, dst_reg,
 							b2p[TMP_REG_1]);
 				break;
 			}
-- 
2.21.0

