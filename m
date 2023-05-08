Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD436F9DA1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 May 2023 04:09:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QF4VC5cc5z3fPb
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 May 2023 12:09:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YYHmNFAf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YYHmNFAf;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QF4Kj6Ygmz3c96
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 May 2023 12:02:01 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3481ikBl003456;
	Mon, 8 May 2023 02:01:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=YRiUUrC4V/WfA6JMSAR+2kIH+01rtqNqFnMogbY60+8=;
 b=YYHmNFAf8WmABHu9PKObGhl8+1Hzvb11+HqpAeGKLNyHd/N1AxCFSB/onVNXd0N5vfah
 oA4aEG44iXmzBlVabgN8MGZ8uuPRbMb/weGnigl0mhJLoIy6pghPLSk++W+T3arFqD2d
 9qvMjB8scljdApy4XXkXjyGKZ666k/P330o2XRVtqChdQ1fvUKMKXlIRz4I54z2uo1w9
 O0dGdCt2l+REd+27EUCcnLuQQzIgNY6ehz8gCPSigm4wNF2tn3UQjjgtW6vrK79IdB6y
 rz64fJHzlDyZ1k4HzqpbRsARCpq3P+oQxMGcujubIwoxMR+3iyUx9wFnrl3KlZjeLkKL hg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qeqpcr9yh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 May 2023 02:01:45 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3481uNtK003683;
	Mon, 8 May 2023 02:01:45 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qeqpcr9y4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 May 2023 02:01:44 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3481YxLL021745;
	Mon, 8 May 2023 02:01:43 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3qde5fgu2r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 May 2023 02:01:43 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 34821eVC66257274
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 May 2023 02:01:40 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A104B20049;
	Mon,  8 May 2023 02:01:40 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 203B720043;
	Mon,  8 May 2023 02:01:40 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  8 May 2023 02:01:40 +0000 (GMT)
Received: from civic.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 520E4605A6;
	Mon,  8 May 2023 12:01:35 +1000 (AEST)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 05/12] powerpc: Mark [h]ssr_valid accesses in check_return_regs_valid
Date: Mon,  8 May 2023 12:01:13 +1000
Message-Id: <20230508020120.218494-6-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230508020120.218494-1-rmclure@linux.ibm.com>
References: <20230508020120.218494-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: MEhZNDYR4mIDkZVkucmJShfqEAAlOKBo
X-Proofpoint-ORIG-GUID: Wj5voPRuBAwvQdzy4uVSf8IoLEsbjwTk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-07_10,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 suspectscore=0 mlxlogscore=492 mlxscore=0 spamscore=0 clxscore=1015
 phishscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305080009
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
Cc: Rohan McLure <rmclure@linux.ibm.com>, npiggin@gmail.com, arnd@arndb.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Checks to see if the [H]SRR registers have been clobbered by (soft)
NMI interrupts imply the possibility for a data race on the
[h]srr_valid entries in the PACA. Annotate accesses to these fields with
READ_ONCE, removing the need for the barrier.

The diagnostic can use plain-access reads and writes, but annotate with
data_race.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
Reported-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/ptrace.h |  4 ++--
 arch/powerpc/kernel/interrupt.c   | 14 ++++++--------
 2 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
index 0eb90a013346..9db8b16567e2 100644
--- a/arch/powerpc/include/asm/ptrace.h
+++ b/arch/powerpc/include/asm/ptrace.h
@@ -180,8 +180,8 @@ void do_syscall_trace_leave(struct pt_regs *regs);
 static inline void set_return_regs_changed(void)
 {
 #ifdef CONFIG_PPC_BOOK3S_64
-	local_paca->hsrr_valid = 0;
-	local_paca->srr_valid = 0;
+	WRITE_ONCE(local_paca->hsrr_valid, 0);
+	WRITE_ONCE(local_paca->srr_valid, 0);
 #endif
 }
 
diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index e34c72285b4e..1f033f11b871 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -125,7 +125,7 @@ static notrace void check_return_regs_valid(struct pt_regs *regs)
 	case 0x1600:
 	case 0x1800:
 		validp = &local_paca->hsrr_valid;
-		if (!*validp)
+		if (!READ_ONCE(*validp))
 			return;
 
 		srr0 = mfspr(SPRN_HSRR0);
@@ -135,7 +135,7 @@ static notrace void check_return_regs_valid(struct pt_regs *regs)
 		break;
 	default:
 		validp = &local_paca->srr_valid;
-		if (!*validp)
+		if (!READ_ONCE(*validp))
 			return;
 
 		srr0 = mfspr(SPRN_SRR0);
@@ -161,19 +161,17 @@ static notrace void check_return_regs_valid(struct pt_regs *regs)
 	 * such things will get caught most of the time, statistically
 	 * enough to be able to get a warning out.
 	 */
-	barrier();
-
-	if (!*validp)
+	if (!READ_ONCE(*validp))
 		return;
 
-	if (!warned) {
-		warned = true;
+	if (!data_race(warned)) {
+		data_race(warned = true);
 		printk("%sSRR0 was: %lx should be: %lx\n", h, srr0, regs->nip);
 		printk("%sSRR1 was: %lx should be: %lx\n", h, srr1, regs->msr);
 		show_regs(regs);
 	}
 
-	*validp = 0; /* fixup */
+	WRITE_ONCE(*validp, 0); /* fixup */
 #endif
 }
 
-- 
2.37.2

