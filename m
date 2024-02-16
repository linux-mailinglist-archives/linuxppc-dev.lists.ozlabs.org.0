Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FA985759F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Feb 2024 06:31:26 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=U6XG7V+z;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TbgXD52Y4z3vXH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Feb 2024 16:31:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=U6XG7V+z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TbgWS3kcnz3c2C
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Feb 2024 16:30:44 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41G3S7Mc019198;
	Fri, 16 Feb 2024 05:30:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=Knuw7MKwurVM2/BTEQrrckXC7b3WTVQvBZUONsusJ+A=;
 b=U6XG7V+zubp1fevkz0baaEPjgdej0DWT1EiSPEeEU0lgWlJ1WD7PYfAhrbw22iEL3St0
 duLDbv+2DGg+5AScJCkXZ+SVnMu8+ed4fwKMCE1Y9pexj6lKO96PzdDVd0O9mlZvRICP
 xjjsiPzySTvz4UR1lXnSER9qcaq9cJNuTnZenzGpCB/zHDrdcld6Yx5kMFMWetsM3WpN
 6gY+5Bo15XHtIb0Hd5RdiP1ZYGN1H7PB4x1lliRixvaDCUfRzHRePHVZHyizBPcD6y6J
 dq5A9u5SZX7UkRGqoMkftKwBvPyQOkmnktvcj4VySujfDVem32WgzyK2CGPwYrPEDty1 mw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w9ytpa532-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Feb 2024 05:30:32 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 41G59KZg009282;
	Fri, 16 Feb 2024 05:30:32 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w9ytpa527-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Feb 2024 05:30:32 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41G5M0US004339;
	Fri, 16 Feb 2024 05:30:31 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3w6kv0skbx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Feb 2024 05:30:31 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41G5UQX711731552
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Feb 2024 05:30:28 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6BE052004B;
	Fri, 16 Feb 2024 05:30:26 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 213072006C;
	Fri, 16 Feb 2024 05:30:25 +0000 (GMT)
Received: from li-c1fdab4c-355a-11b2-a85c-ef242fe9efb4.in.ibm.com (unknown [9.109.201.126])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 16 Feb 2024 05:30:24 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH] arch/powerpc: Remove duplicate ifdefs
Date: Fri, 16 Feb 2024 11:00:16 +0530
Message-Id: <20240216053016.528906-1-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: YJuAAFE_IISQMn421IaULgiNJV05o7Ww
X-Proofpoint-ORIG-GUID: hISTAxDCSMF_EeXYluACMFt2YAFGUmNS
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-16_04,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 phishscore=0 adultscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 mlxscore=0 mlxlogscore=715
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402160042
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
Cc: sshegde@linux.ibm.com, aneesh.kumar@kernel.org, npiggin@gmail.com, naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When a ifdef is used in the below manner, second one could be considered as
duplicate.

ifdef DEFINE_A
...code block...
ifdef DEFINE_A       <-- This is a duplicate.
...code block...
endif
else
ifndef DEFINE_A     <-- This is also duplicate.
...code block...
endif
endif
More details about the script and methods used to find these code
patterns are in cover letter of [1]

Few places in arch/powerpc where this pattern was seen.
Hunk1: Code is under check of CONFIG_PPC64 from  line 13 in
arch/powerpc/include/asm/paca.h. Hence the second CONFIG_PPC64 at line 166
is a duplicate.
Hunk2: CONFIG_PPC_BOOK3S_64 was defined back to back. Merged the two
ifdefs.
Hunk3: Code is under check of CONFIG_PPC64 from line 176 in
arch/powerpc/kernel/asm-offsets.c. Hence second CONFIG_PPC64 at line 249
is a duplicate.
Hunk4: #ifndef CONFIG_PPC64 is used at line 2066 in
arch/powerpc/platforms/powermac/feature.c. And then in #else
again #ifdef CONFIG_PPC64 is used. Which is a duplicate since in #else
means CONFIG_PPC64 is defined.
Hunk5: Code is under the check of CONFIG_SMP from line 521 in
arch/powerpc/xmon/xmon.c. Hence the same check of CONFIG_SMP at line 646
is a duplicate.

No functional change is intended here. It only aims to improve code
readability.
[1] https://lore.kernel.org/all/20240118080326.13137-1-sshegde@linux.ibm.com/

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
Changes from v2:
- Converted from series to individual patches.
- Dropped RFC tag.
- Added more context on each hunk for review.

 arch/powerpc/include/asm/paca.h           | 4 ----
 arch/powerpc/kernel/asm-offsets.c         | 2 --
 arch/powerpc/platforms/powermac/feature.c | 2 --
 arch/powerpc/xmon/xmon.c                  | 2 --
 4 files changed, 10 deletions(-)

diff --git a/arch/powerpc/include/asm/paca.h b/arch/powerpc/include/asm/paca.h
index e667d455ecb4..1d58da946739 100644
--- a/arch/powerpc/include/asm/paca.h
+++ b/arch/powerpc/include/asm/paca.h
@@ -163,9 +163,7 @@ struct paca_struct {
 	u64 kstack;			/* Saved Kernel stack addr */
 	u64 saved_r1;			/* r1 save for RTAS calls or PM or EE=0 */
 	u64 saved_msr;			/* MSR saved here by enter_rtas */
-#ifdef CONFIG_PPC64
 	u64 exit_save_r1;		/* Syscall/interrupt R1 save */
-#endif
 #ifdef CONFIG_PPC_BOOK3E_64
 	u16 trap_save;			/* Used when bad stack is encountered */
 #endif
@@ -214,8 +212,6 @@ struct paca_struct {
 	/* Non-maskable exceptions that are not performance critical */
 	u64 exnmi[EX_SIZE];	/* used for system reset (nmi) */
 	u64 exmc[EX_SIZE];	/* used for machine checks */
-#endif
-#ifdef CONFIG_PPC_BOOK3S_64
 	/* Exclusive stacks for system reset and machine check exception. */
 	void *nmi_emergency_sp;
 	void *mc_emergency_sp;
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index 9f14d95b8b32..f029755f9e69 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -246,9 +246,7 @@ int main(void)
 	OFFSET(PACAHWCPUID, paca_struct, hw_cpu_id);
 	OFFSET(PACAKEXECSTATE, paca_struct, kexec_state);
 	OFFSET(PACA_DSCR_DEFAULT, paca_struct, dscr_default);
-#ifdef CONFIG_PPC64
 	OFFSET(PACA_EXIT_SAVE_R1, paca_struct, exit_save_r1);
-#endif
 #ifdef CONFIG_PPC_BOOK3E_64
 	OFFSET(PACA_TRAP_SAVE, paca_struct, trap_save);
 #endif
diff --git a/arch/powerpc/platforms/powermac/feature.c b/arch/powerpc/platforms/powermac/feature.c
index 81c9fbae88b1..2cc257f75c50 100644
--- a/arch/powerpc/platforms/powermac/feature.c
+++ b/arch/powerpc/platforms/powermac/feature.c
@@ -2333,7 +2333,6 @@ static struct pmac_mb_def pmac_mb_defs[] = {
 		PMAC_TYPE_POWERMAC_G5,		g5_features,
 		0,
 	},
-#ifdef CONFIG_PPC64
 	{	"PowerMac7,3",			"PowerMac G5",
 		PMAC_TYPE_POWERMAC_G5,		g5_features,
 		0,
@@ -2359,7 +2358,6 @@ static struct pmac_mb_def pmac_mb_defs[] = {
 		0,
 	},
 #endif /* CONFIG_PPC64 */
-#endif /* CONFIG_PPC64 */
 };

 /*
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index b3b94cd37713..f413c220165c 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -643,10 +643,8 @@ static int xmon_core(struct pt_regs *regs, volatile int fromipi)
 			touch_nmi_watchdog();
 		} else {
 			cmd = 1;
-#ifdef CONFIG_SMP
 			if (xmon_batch)
 				cmd = batch_cmds(regs);
-#endif
 			if (!locked_down && cmd)
 				cmd = cmds(regs);
 			if (locked_down || cmd != 0) {
--
2.39.3

