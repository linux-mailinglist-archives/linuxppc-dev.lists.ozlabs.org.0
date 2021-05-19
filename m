Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF54388BF9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 12:49:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlV3l3fpJz3c1y
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 20:49:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MLf5fYbx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=MLf5fYbx; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlV2M3WkKz2ykP
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 May 2021 20:47:55 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14JAYU9t071254; Wed, 19 May 2021 06:47:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=y7uRnA5sG9SvFvG0LjuRWsHyJ6rc9MrIh26qgCK4/wY=;
 b=MLf5fYbxSEftV7spOQWP/9SItObO6pZPRKLv9ilVp0dDtsyGo5YW3MTbow6Rute0Eu8a
 Zehguow6rLdW2HZu4j6i2ro39McI04SH9dXwZAF4Q+zYZTn96C9bbbjrQk0bzI75JkZb
 Vg7VL8TqEFf7+tUYi/1QxSoBB2twy9pNW/Sf2eyFqcUwTCWVcg+iMjhiD/YY7VmyVUb+
 ZDDey7LhnlqA9TaK/JC6EQcakdiXY5sk6TzfOGqkxYPCVrP4i/uGIoeKrbjZ2RZgwfNl
 uII1Qn3uKAlnyyJDz2R0jIdf2TPbz14IFEqSTF/PDCTn+lb7lsgT5ii4prbHMUHLtf64 Ww== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38n0aghpx2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 May 2021 06:47:45 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14JAYhBK072181;
 Wed, 19 May 2021 06:47:44 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38n0aghpwa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 May 2021 06:47:44 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14JAlhmt010537;
 Wed, 19 May 2021 10:47:43 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 38j5jgt1rn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 May 2021 10:47:42 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14JAleRx29425964
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 May 2021 10:47:40 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4E954A4051;
 Wed, 19 May 2021 10:47:40 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 72154A404D;
 Wed, 19 May 2021 10:47:38 +0000 (GMT)
Received: from naverao1-tp.in.ibm.com (unknown [9.85.72.228])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 19 May 2021 10:47:38 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Jordan Niethe <jniethe5@gmail.com>
Subject: [PATCH 2/5] powerpc/kprobes: Roll IS_RFI() macro into IS_RFID()
Date: Wed, 19 May 2021 16:17:18 +0530
Message-Id: <eee32e1b75dae85d471c89b4c0a123ad4b0aabf8.1621416666.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1621416666.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1621416666.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: sDWJSOcnqDXeU9KHDexFl1FQMeYLAulB
X-Proofpoint-ORIG-GUID: R2VCkzAvxm08GL8bFmcwDJRCmxp84TDN
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-19_04:2021-05-19,
 2021-05-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 phishscore=0 mlxlogscore=873
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105190072
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In kprobes and xmon, we should exclude both 32-bit and 64-bit variants
of mtmsr and rfi instructions from being stepped. Have IS_RFID() also
detect a rfi instruction similar to IS_MTMSRD().

Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/sstep.h | 7 +++----
 arch/powerpc/kernel/kprobes.c    | 4 ++--
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/sstep.h b/arch/powerpc/include/asm/sstep.h
index 972ed0df154d60..1df867c2e054e5 100644
--- a/arch/powerpc/include/asm/sstep.h
+++ b/arch/powerpc/include/asm/sstep.h
@@ -13,12 +13,11 @@ struct pt_regs;
  * we don't allow putting a breakpoint on an mtmsrd instruction.
  * Similarly we don't allow breakpoints on rfid instructions.
  * These macros tell us if an instruction is a mtmsrd or rfid.
- * Note that IS_MTMSRD returns true for both an mtmsr (32-bit)
- * and an mtmsrd (64-bit).
+ * Note that these return true for both mtmsr/rfi (32-bit)
+ * and mtmsrd/rfid (64-bit).
  */
 #define IS_MTMSRD(instr)	((ppc_inst_val(instr) & 0xfc0007be) == 0x7c000124)
-#define IS_RFID(instr)		((ppc_inst_val(instr) & 0xfc0007fe) == 0x4c000024)
-#define IS_RFI(instr)		((ppc_inst_val(instr) & 0xfc0007fe) == 0x4c000064)
+#define IS_RFID(instr)		((ppc_inst_val(instr) & 0xfc0007be) == 0x4c000024)
 
 enum instruction_type {
 	COMPUTE,		/* arith/logical/CR op, etc. */
diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
index f611d9eb3562d7..b7b20875d34d91 100644
--- a/arch/powerpc/kernel/kprobes.c
+++ b/arch/powerpc/kernel/kprobes.c
@@ -112,8 +112,8 @@ int arch_prepare_kprobe(struct kprobe *p)
 	if ((unsigned long)p->addr & 0x03) {
 		printk("Attempt to register kprobe at an unaligned address\n");
 		ret = -EINVAL;
-	} else if (IS_MTMSRD(insn) || IS_RFID(insn) || IS_RFI(insn)) {
-		printk("Cannot register a kprobe on rfi/rfid or mtmsr[d]\n");
+	} else if (IS_MTMSRD(insn) || IS_RFID(insn)) {
+		printk("Cannot register a kprobe on mtmsr[d]/rfi[d]\n");
 		ret = -EINVAL;
 	} else if ((unsigned long)p->addr & ~PAGE_MASK &&
 			ppc_inst_prefixed(ppc_inst_read((struct ppc_inst *)(p->addr - 1)))) {
-- 
2.30.2

