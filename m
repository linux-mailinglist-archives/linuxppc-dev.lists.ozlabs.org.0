Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7491B138B29
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2020 06:47:52 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47x2g9408CzDq9p
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2020 16:47:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bala24@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47x2Xl4dnxzDqKX
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2020 16:42:15 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00D5Y5W3085289
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2020 00:42:13 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xfvgjqshn-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2020 00:42:13 -0500
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bala24@linux.ibm.com>;
 Mon, 13 Jan 2020 05:42:11 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 13 Jan 2020 05:42:08 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00D5g6ro22741122
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jan 2020 05:42:06 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9A6B9AE053;
 Mon, 13 Jan 2020 05:42:06 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 341E2AE04D;
 Mon, 13 Jan 2020 05:42:05 +0000 (GMT)
Received: from dhcp-9-109-246-161.in.ibm.com (unknown [9.124.35.118])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 13 Jan 2020 05:42:05 +0000 (GMT)
From: Balamuruhan S <bala24@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v2 2/3] powerpc sstep: add support for divde[.] and divdeu[.]
 instructions
Date: Mon, 13 Jan 2020 11:11:45 +0530
X-Mailer: git-send-email 2.14.5
In-Reply-To: <20200113054146.10249-1-bala24@linux.ibm.com>
References: <20200113054146.10249-1-bala24@linux.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 20011305-0012-0000-0000-0000037CCC13
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20011305-0013-0000-0000-000021B8F497
Message-Id: <20200113054146.10249-3-bala24@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-13_01:2020-01-13,
 2020-01-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=470
 lowpriorityscore=0 priorityscore=1501 suspectscore=5 malwarescore=0
 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001130044
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

Reviewed-by: Sandipan Das <sandipan@linux.ibm.com>
Signed-off-by: Balamuruhan S <bala24@linux.ibm.com>
---
 arch/powerpc/lib/sstep.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index c077acb983a1..2cac71a71878 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -1736,7 +1736,18 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 			op->val = (int) regs->gpr[ra] /
 				(int) regs->gpr[rb];
 			goto arith_done;
-
+#ifdef __powerpc64__
+		case 425:	/* divde[.] */
+			asm volatile(PPC_DIVDE(%0, %1, %2) :
+				"=r" (op->val) : "r" (regs->gpr[ra]),
+				"r" (regs->gpr[rb]));
+			goto arith_done;
+		case 393:	/* divdeu[.] */
+			asm volatile(PPC_DIVDEU(%0, %1, %2) :
+				"=r" (op->val) : "r" (regs->gpr[ra]),
+				"r" (regs->gpr[rb]));
+			goto arith_done;
+#endif
 		case 755:	/* darn */
 			if (!cpu_has_feature(CPU_FTR_ARCH_300))
 				return -1;
-- 
2.14.5

