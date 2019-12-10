Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD7A118152
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2019 08:25:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47XBRw67gnzDqXG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2019 18:25:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bala24@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47XBKF1cV8zDqWv
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2019 18:20:00 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBA7Hf2e076431
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2019 02:19:56 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2wrt11wtwv-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2019 02:19:56 -0500
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bala24@linux.ibm.com>;
 Tue, 10 Dec 2019 07:19:54 -0000
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 10 Dec 2019 07:19:52 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id xBA7Jp9X46268718
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Dec 2019 07:19:51 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E88364C044;
 Tue, 10 Dec 2019 07:19:50 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 10E0B4C046;
 Tue, 10 Dec 2019 07:19:49 +0000 (GMT)
Received: from dhcp-9-120-237-107.in.ibm.com (unknown [9.120.237.107])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 10 Dec 2019 07:19:48 +0000 (GMT)
From: Balamuruhan S <bala24@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 2/3] powerpc sstep: add support for divde[.] and divdeu[.]
 instructions
Date: Tue, 10 Dec 2019 12:49:03 +0530
X-Mailer: git-send-email 2.14.5
In-Reply-To: <20191210071904.31013-1-bala24@linux.ibm.com>
References: <20191210071904.31013-1-bala24@linux.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 19121007-0012-0000-0000-000003736222
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19121007-0013-0000-0000-000021AF333B
Message-Id: <20191210071904.31013-3-bala24@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-10_01:2019-12-10,2019-12-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 lowpriorityscore=0 suspectscore=5 impostorscore=0 mlxscore=0
 mlxlogscore=393 adultscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 spamscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912100065
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
Cc: ravi.bangoria@linux.ibm.com, Balamuruhan S <bala24@linux.ibm.com>,
 paulus@samba.org, sandipan@linux.ibm.com, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch adds emulation support for divde, divdeu instructions,
	* Divide Doubleword Extended (divde[.])
	* Divide Doubleword Extended Unsigned (divdeu[.])

Signed-off-by: Balamuruhan S <bala24@linux.ibm.com>
---
 arch/powerpc/lib/sstep.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index c077acb983a1..4b4119729e59 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -1736,7 +1736,32 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 			op->val = (int) regs->gpr[ra] /
 				(int) regs->gpr[rb];
 			goto arith_done;
-
+#ifdef __powerpc64__
+		case 425:	/* divde[.] */
+			if (instr & 1) {
+				asm volatile(PPC_DIVDE_DOT(%0, %1, %2) :
+					"=r" (op->val) : "r" (regs->gpr[ra]),
+					"r" (regs->gpr[rb]));
+				set_cr0(regs, op);
+			} else {
+				asm volatile(PPC_DIVDE(%0, %1, %2) :
+					"=r" (op->val) : "r" (regs->gpr[ra]),
+					"r" (regs->gpr[rb]));
+			}
+			goto compute_done;
+		case 393:	/* divdeu[.] */
+			if (instr & 1) {
+				asm volatile(PPC_DIVDEU_DOT(%0, %1, %2) :
+					"=r" (op->val) : "r" (regs->gpr[ra]),
+					"r" (regs->gpr[rb]));
+				set_cr0(regs, op);
+			} else {
+				asm volatile(PPC_DIVDEU(%0, %1, %2) :
+					"=r" (op->val) : "r" (regs->gpr[ra]),
+					"r" (regs->gpr[rb]));
+			}
+			goto compute_done;
+#endif
 		case 755:	/* darn */
 			if (!cpu_has_feature(CPU_FTR_ARCH_300))
 				return -1;
-- 
2.14.5

