Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE91B8320C1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jan 2024 22:14:05 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TISuaZPH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TGFqH5PD8z3cTj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jan 2024 08:14:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TISuaZPH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TFwJ86Dd6z3bXv
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jan 2024 19:04:24 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 40I7oocq009670;
	Thu, 18 Jan 2024 08:04:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=AmRsDf2UHYAbAbmc8ihNWLxJC5WvTdmS07elNqb4DPo=;
 b=TISuaZPH9xaLur3lvZqvrDF376vxZm7NEbOlhJLj3dqSaWCgVG/Etz4aqjOWhdkHaZOT
 q5qDAm9sUFMoDUst33j7DvQz/ATYVfR9W8HoU1bzZsU7LBAYSBLiFYrOnaXWZp0AXquN
 /dZ6Bhw75MXvdreA0wEsirqHbG5VYyc2X5q+wOuyVMD5WdoXAe50Vay3a6HGsXGOw0DY
 cV/icFPkk/JmC3t5qao/6ZaWoDE/t1eq7QRF7ogUVD9ufONdZAdmjRe44sJfhb97xAga
 Y85FWsT+O17ipvosGHLmlNJWY60nDcXa2qD/8zyI9VwMMiYcXjT2awZBZulOkDn7R/Q1 kA== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vpyrk8m52-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jan 2024 08:04:16 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 40I77MnU005807;
	Thu, 18 Jan 2024 08:04:14 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3vm6bkt1s3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jan 2024 08:04:14 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 40I84CsQ25821724
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 18 Jan 2024 08:04:12 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 56F682004B;
	Thu, 18 Jan 2024 08:04:12 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5983220040;
	Thu, 18 Jan 2024 08:04:10 +0000 (GMT)
Received: from li-c1fdab4c-355a-11b2-a85c-ef242fe9efb4.in.ibm.com (unknown [9.109.201.126])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 18 Jan 2024 08:04:10 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: linux-kernel@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net,
        linux-xfs@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 3/3] arch/powerpc: remove duplicate ifdefs
Date: Thu, 18 Jan 2024 13:33:26 +0530
Message-Id: <20240118080326.13137-4-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240118080326.13137-1-sshegde@linux.ibm.com>
References: <20240118080326.13137-1-sshegde@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ybzYR_15sOZJwGfICg1PC-UelNSZi1tz
X-Proofpoint-ORIG-GUID: ybzYR_15sOZJwGfICg1PC-UelNSZi1tz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-18_04,2024-01-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0 suspectscore=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=657 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311290000 definitions=main-2401180056
X-Mailman-Approved-At: Fri, 19 Jan 2024 08:12:35 +1100
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
Cc: peterz@infradead.org, sshegde@linux.ibm.com, mingo@kernel.org, anton@tuxera.com, chandan.babu@oracle.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

when a ifdef is used in the below manner, second one could be considered as
duplicate.

ifdef DEFINE_A
...code block...
ifdef DEFINE_A
...code block...
endif
...code block...
endif

few places in arch/powerpc where this pattern was seen. In addition to that
in paca.h, CONFIG_PPC_BOOK3S_64 was defined back to back. merged the two
ifdefs.

No functional change is intended here. It only aims to improve code
readability.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
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

