Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 924C3787D54
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Aug 2023 03:50:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UfAbmxGx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RX2vs49qkz3cLl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Aug 2023 11:50:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UfAbmxGx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RX2tw594Zz2yhZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Aug 2023 11:49:28 +1000 (AEST)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37P1a91E006338;
	Fri, 25 Aug 2023 01:49:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=YDooSJ8yduALq6PKyb6SmFGkHSh5jrguwy2bEri5xiM=;
 b=UfAbmxGxwshoeyzezyKwLBKF3Lx5OS1UXkUDOYyyRHqnccjvdz3BMpNgU6R9PpMIKWkX
 1bYrBVgVV46q1B+UtYcr21lUY9Fdt0AzjpLyKHWY8w2BSQzyJGeDi1dv7ZO3SO8EtJG8
 twAuHuLKIMqpPjhvUnRuiPV71qfuT6FAQvbzktrOs5lTRqj1No3NgdsjwOeiu4hm8ilK
 ZV4G4krhm+4S84TgwcfATBaWKGQsrEkVJJf81T3JSOdyGX9RVzJBiWWgGybij9vF4b/5
 G5t8ouKDtXRG9l8mA8qkKlBzfnblb5EMXR1U0FZxaLp7+FOXjrE1s+9T5Kai/5pilkBk sg== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3spjne0dyu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Aug 2023 01:49:22 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37ONnxdm004085;
	Fri, 25 Aug 2023 01:49:21 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3sn21ruwct-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Aug 2023 01:49:21 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 37P1nJQt26477144
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Aug 2023 01:49:19 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1B9F020049;
	Fri, 25 Aug 2023 01:49:19 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 20A1B20040;
	Fri, 25 Aug 2023 01:49:18 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 25 Aug 2023 01:49:18 +0000 (GMT)
Received: from bgray-lenovo-p15.fritz.box (unknown [9.43.162.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 0FF516010C;
	Fri, 25 Aug 2023 11:49:14 +1000 (AEST)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/dexcr: Move HASHCHK trap handler
Date: Fri, 25 Aug 2023 11:49:10 +1000
Message-ID: <20230825014910.488822-1-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ddkzjoV1RNg5AqQawWkkx9fUe_-SDhTC
X-Proofpoint-ORIG-GUID: ddkzjoV1RNg5AqQawWkkx9fUe_-SDhTC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-25_01,2023-08-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 clxscore=1011 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 malwarescore=0 phishscore=0 suspectscore=0 mlxlogscore=742
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308250012
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
Cc: Benjamin Gray <bgray@linux.ibm.com>, ruscur@russell.cc
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

To determine if a trap was caused by a HASHCHK instruction, we inspect
the user instruction that triggered the trap. However this may sleep
if the page needs to be faulted in.

Move the HASHCHK handler logic to after we allow IRQs, which is fine
because we are only interested in HASHCHK if it's a user space trap.

Fixes: 5bcba4e6c13f ("powerpc/dexcr: Handle hashchk exception")
Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 arch/powerpc/kernel/traps.c | 56 ++++++++++++++++++++++++-------------
 1 file changed, 36 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index f5ce282dc4b8..32b5e841ea97 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -1512,23 +1512,11 @@ static void do_program_check(struct pt_regs *regs)
 			return;
 		}
 
-		if (cpu_has_feature(CPU_FTR_DEXCR_NPHIE) && user_mode(regs)) {
-			ppc_inst_t insn;
-
-			if (get_user_instr(insn, (void __user *)regs->nip)) {
-				_exception(SIGSEGV, regs, SEGV_MAPERR, regs->nip);
-				return;
-			}
-
-			if (ppc_inst_primary_opcode(insn) == 31 &&
-			    get_xop(ppc_inst_val(insn)) == OP_31_XOP_HASHCHK) {
-				_exception(SIGILL, regs, ILL_ILLOPN, regs->nip);
-				return;
-			}
+		/* User mode considers other cases after enabling IRQs */
+		if (!user_mode(regs)) {
+			_exception(SIGTRAP, regs, TRAP_BRKPT, regs->nip);
+			return;
 		}
-
-		_exception(SIGTRAP, regs, TRAP_BRKPT, regs->nip);
-		return;
 	}
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 	if (reason & REASON_TM) {
@@ -1561,16 +1549,44 @@ static void do_program_check(struct pt_regs *regs)
 
 	/*
 	 * If we took the program check in the kernel skip down to sending a
-	 * SIGILL. The subsequent cases all relate to emulating instructions
-	 * which we should only do for userspace. We also do not want to enable
-	 * interrupts for kernel faults because that might lead to further
-	 * faults, and loose the context of the original exception.
+	 * SIGILL. The subsequent cases all relate to user space, such as
+	 * emulating instructions which we should only do for user space. We
+	 * also do not want to enable interrupts for kernel faults because that
+	 * might lead to further faults, and loose the context of the original
+	 * exception.
 	 */
 	if (!user_mode(regs))
 		goto sigill;
 
 	interrupt_cond_local_irq_enable(regs);
 
+	/*
+	 * (reason & REASON_TRAP) is mostly handled before enabling IRQs,
+	 * except get_user_instr() can sleep so we cannot reliably inspect the
+	 * current instruction in that context. Now that we know we are
+	 * handling a user space trap and can sleep, we can check if the trap
+	 * was a hashchk failure.
+	 */
+	if (reason & REASON_TRAP) {
+		if (cpu_has_feature(CPU_FTR_DEXCR_NPHIE)) {
+			ppc_inst_t insn;
+
+			if (get_user_instr(insn, (void __user *)regs->nip)) {
+				_exception(SIGSEGV, regs, SEGV_MAPERR, regs->nip);
+				return;
+			}
+
+			if (ppc_inst_primary_opcode(insn) == 31 &&
+			    get_xop(ppc_inst_val(insn)) == OP_31_XOP_HASHCHK) {
+				_exception(SIGILL, regs, ILL_ILLOPN, regs->nip);
+				return;
+			}
+		}
+
+		_exception(SIGTRAP, regs, TRAP_BRKPT, regs->nip);
+		return;
+	}
+
 	/* (reason & REASON_ILLEGAL) would be the obvious thing here,
 	 * but there seems to be a hardware bug on the 405GP (RevD)
 	 * that means ESR is sometimes set incorrectly - either to
-- 
2.41.0

