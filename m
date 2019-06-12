Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E273642F62
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 20:55:28 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45PGKB11tkzDr80
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2019 04:55:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=naveen.n.rao@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45PGFC3wJYzDqvw
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2019 04:51:59 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5CIlQb4003723
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 14:51:56 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2t36ev9bpg-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 14:51:56 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.vnet.ibm.com>;
 Wed, 12 Jun 2019 19:51:54 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 12 Jun 2019 19:51:50 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5CIpoo051445850
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jun 2019 18:51:50 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DBFD111C04A;
 Wed, 12 Jun 2019 18:51:49 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5D64611C04C;
 Wed, 12 Jun 2019 18:51:48 +0000 (GMT)
Received: from naverao1-tp.ibmuc.com (unknown [9.199.37.223])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 12 Jun 2019 18:51:48 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Daniel Borkmann <daniel@iogearbox.net>
Subject: [PATCH 1/2] bpf: fix div64 overflow tests to properly detect errors
Date: Thu, 13 Jun 2019 00:21:39 +0530
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1560364574.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1560364574.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19061218-0008-0000-0000-000002F3379A
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19061218-0009-0000-0000-000022603A9C
Message-Id: <bcbcf1c9af0250bdc6cf1e3ba5594583261c8d80.1560364574.git.naveen.n.rao@linux.vnet.ibm.com>
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

If the result of the division is LLONG_MIN, current tests do not detect
the error since the return value is truncated to a 32-bit value and ends
up being 0.

Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 .../testing/selftests/bpf/verifier/div_overflow.c  | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/bpf/verifier/div_overflow.c b/tools/testing/selftests/bpf/verifier/div_overflow.c
index bd3f38dbe796..acab4f00819f 100644
--- a/tools/testing/selftests/bpf/verifier/div_overflow.c
+++ b/tools/testing/selftests/bpf/verifier/div_overflow.c
@@ -29,8 +29,11 @@
 	"DIV64 overflow, check 1",
 	.insns = {
 	BPF_MOV64_IMM(BPF_REG_1, -1),
-	BPF_LD_IMM64(BPF_REG_0, LLONG_MIN),
-	BPF_ALU64_REG(BPF_DIV, BPF_REG_0, BPF_REG_1),
+	BPF_LD_IMM64(BPF_REG_2, LLONG_MIN),
+	BPF_ALU64_REG(BPF_DIV, BPF_REG_2, BPF_REG_1),
+	BPF_MOV32_IMM(BPF_REG_0, 0),
+	BPF_JMP_REG(BPF_JEQ, BPF_REG_0, BPF_REG_2, 1),
+	BPF_MOV32_IMM(BPF_REG_0, 1),
 	BPF_EXIT_INSN(),
 	},
 	.prog_type = BPF_PROG_TYPE_SCHED_CLS,
@@ -40,8 +43,11 @@
 {
 	"DIV64 overflow, check 2",
 	.insns = {
-	BPF_LD_IMM64(BPF_REG_0, LLONG_MIN),
-	BPF_ALU64_IMM(BPF_DIV, BPF_REG_0, -1),
+	BPF_LD_IMM64(BPF_REG_1, LLONG_MIN),
+	BPF_ALU64_IMM(BPF_DIV, BPF_REG_1, -1),
+	BPF_MOV32_IMM(BPF_REG_0, 0),
+	BPF_JMP_REG(BPF_JEQ, BPF_REG_0, BPF_REG_1, 1),
+	BPF_MOV32_IMM(BPF_REG_0, 1),
 	BPF_EXIT_INSN(),
 	},
 	.prog_type = BPF_PROG_TYPE_SCHED_CLS,
-- 
2.21.0

