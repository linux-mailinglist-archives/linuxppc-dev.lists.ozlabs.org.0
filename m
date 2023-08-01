Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCC276A630
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Aug 2023 03:19:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WzGeMOcZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RFHMw0pdKz30hM
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Aug 2023 11:19:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WzGeMOcZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RFHL32pJXz2ykX
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Aug 2023 11:18:19 +1000 (AEST)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37117Gh7023528
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 1 Aug 2023 01:18:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=NFFL7wK3/DjGUACHiRG14IvSM4dTTn/ZHWDhudwkLCY=;
 b=WzGeMOcZESZ1bai/hfvzUG+mNpOJPIveuwqQgyTkaFEg6+hOwdE14TkmVHvrqw4qKa6g
 buMAacy5kDzHkAWUo5weFmqKYiDRC9r6FgJte+FFQH4k5EFmBSBOQTFIt3VSEsnRrEni
 e2wyes0rCs1K/NLsW8hNp55BirAG+p+BSo8dobQzyaBHxtUvbEHQ0yOccZ9pBPL4/0EF
 c1M25AnrTtlEL4PN5HbMjZMAAyV6PkNAaINTQQmV+N4amuLZ3imX+2FamSPPxiR2/y6s
 gycFdZ51XsAxGnYTsS4aNlgpS7FWqSfnJS0e/Pr9KG00pFajdD9WQxuEbmZgIosyO04q xA== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s6qxfgrnt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Aug 2023 01:18:15 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37102Tvq006073
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 1 Aug 2023 01:18:14 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3s5d3s85qk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Aug 2023 01:18:14 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3711ICPR22741636
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 1 Aug 2023 01:18:12 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C8A342004D
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Aug 2023 01:18:12 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C939E20043
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Aug 2023 01:18:11 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Aug 2023 01:18:11 +0000 (GMT)
Received: from bgray-lenovo-p15.ibmuc.com (unknown [9.43.205.212])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 64ED160367;
	Tue,  1 Aug 2023 11:18:08 +1000 (AEST)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/7] powerpc/watchpoints: Don't track info persistently
Date: Tue,  1 Aug 2023 11:17:39 +1000
Message-ID: <20230801011744.153973-3-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230801011744.153973-1-bgray@linux.ibm.com>
References: <20230801011744.153973-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: yAkLmUwhMwriFkl0Y32o31aZ3sZf4NwC
X-Proofpoint-GUID: yAkLmUwhMwriFkl0Y32o31aZ3sZf4NwC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-31_18,2023-07-31_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 impostorscore=0 malwarescore=0 phishscore=0 mlxlogscore=842 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1011 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308010008
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
Cc: Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

info is cheap to retrieve, and is likely optimised by the compiler
anyway. On the other hand, propagating it across the functions makes it
possible to be inconsistent and adds needless complexity.

Remove it, and invoke counter_arch_bp() when we need to work with it.

As we don't persist it, we just use the local bp array to track whether
we are ignoring a breakpoint.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 arch/powerpc/kernel/hw_breakpoint.c | 60 +++++++++++++++--------------
 1 file changed, 32 insertions(+), 28 deletions(-)

diff --git a/arch/powerpc/kernel/hw_breakpoint.c b/arch/powerpc/kernel/hw_breakpoint.c
index bad2991f906b..e6749642604c 100644
--- a/arch/powerpc/kernel/hw_breakpoint.c
+++ b/arch/powerpc/kernel/hw_breakpoint.c
@@ -538,23 +538,22 @@ static bool is_octword_vsx_instr(int type, int size)
  * We've failed in reliably handling the hw-breakpoint. Unregister
  * it and throw a warning message to let the user know about it.
  */
-static void handler_error(struct perf_event *bp, struct arch_hw_breakpoint *info)
+static void handler_error(struct perf_event *bp)
 {
 	WARN(1, "Unable to handle hardware breakpoint. Breakpoint at 0x%lx will be disabled.",
-	     info->address);
+	     counter_arch_bp(bp)->address);
 	perf_event_disable_inatomic(bp);
 }
 
-static void larx_stcx_err(struct perf_event *bp, struct arch_hw_breakpoint *info)
+static void larx_stcx_err(struct perf_event *bp)
 {
 	printk_ratelimited("Breakpoint hit on instruction that can't be emulated. Breakpoint at 0x%lx will be disabled.\n",
-			   info->address);
+			   counter_arch_bp(bp)->address);
 	perf_event_disable_inatomic(bp);
 }
 
 static bool stepping_handler(struct pt_regs *regs, struct perf_event **bp,
-			     struct arch_hw_breakpoint **info, int *hit,
-			     ppc_inst_t instr)
+			     int *hit, ppc_inst_t instr)
 {
 	int i;
 	int stepped;
@@ -565,7 +564,7 @@ static bool stepping_handler(struct pt_regs *regs, struct perf_event **bp,
 			if (!hit[i])
 				continue;
 			current->thread.last_hit_ubp[i] = bp[i];
-			info[i] = NULL;
+			bp[i] = NULL;
 		}
 		regs_set_return_msr(regs, regs->msr | MSR_SE);
 		return false;
@@ -576,15 +575,15 @@ static bool stepping_handler(struct pt_regs *regs, struct perf_event **bp,
 		for (i = 0; i < nr_wp_slots(); i++) {
 			if (!hit[i])
 				continue;
-			handler_error(bp[i], info[i]);
-			info[i] = NULL;
+			handler_error(bp[i]);
+			bp[i] = NULL;
 		}
 		return false;
 	}
 	return true;
 }
 
-static void handle_p10dd1_spurious_exception(struct arch_hw_breakpoint **info,
+static void handle_p10dd1_spurious_exception(struct perf_event **bp,
 					     int *hit, unsigned long ea)
 {
 	int i;
@@ -596,10 +595,14 @@ static void handle_p10dd1_spurious_exception(struct arch_hw_breakpoint **info,
 	 * spurious exception.
 	 */
 	for (i = 0; i < nr_wp_slots(); i++) {
-		if (!info[i])
+		struct arch_hw_breakpoint *info;
+
+		if (!bp[i])
 			continue;
 
-		hw_end_addr = ALIGN(info[i]->address + info[i]->len, HW_BREAKPOINT_SIZE);
+		info = counter_arch_bp(bp[i]);
+
+		hw_end_addr = ALIGN(info->address + info->len, HW_BREAKPOINT_SIZE);
 
 		/*
 		 * Ending address of DAWR range is less than starting
@@ -629,9 +632,9 @@ static void handle_p10dd1_spurious_exception(struct arch_hw_breakpoint **info,
 		return;
 
 	for (i = 0; i < nr_wp_slots(); i++) {
-		if (info[i]) {
+		if (bp[i]) {
 			hit[i] = 1;
-			info[i]->type |= HW_BRK_TYPE_EXTRANEOUS_IRQ;
+			counter_arch_bp(bp[i])->type |= HW_BRK_TYPE_EXTRANEOUS_IRQ;
 		}
 	}
 }
@@ -642,7 +645,6 @@ int hw_breakpoint_handler(struct die_args *args)
 	int rc = NOTIFY_STOP;
 	struct perf_event *bp[HBP_NUM_MAX] = { NULL };
 	struct pt_regs *regs = args->regs;
-	struct arch_hw_breakpoint *info[HBP_NUM_MAX] = { NULL };
 	int i;
 	int hit[HBP_NUM_MAX] = {0};
 	int nr_hit = 0;
@@ -667,18 +669,20 @@ int hw_breakpoint_handler(struct die_args *args)
 		wp_get_instr_detail(regs, &instr, &type, &size, &ea);
 
 	for (i = 0; i < nr_wp_slots(); i++) {
+		struct arch_hw_breakpoint *info;
+
 		bp[i] = __this_cpu_read(bp_per_reg[i]);
 		if (!bp[i])
 			continue;
 
-		info[i] = counter_arch_bp(bp[i]);
-		info[i]->type &= ~HW_BRK_TYPE_EXTRANEOUS_IRQ;
+		info = counter_arch_bp(bp[i]);
+		info->type &= ~HW_BRK_TYPE_EXTRANEOUS_IRQ;
 
-		if (wp_check_constraints(regs, instr, ea, type, size, info[i])) {
+		if (wp_check_constraints(regs, instr, ea, type, size, info)) {
 			if (!IS_ENABLED(CONFIG_PPC_8xx) &&
 			    ppc_inst_equal(instr, ppc_inst(0))) {
-				handler_error(bp[i], info[i]);
-				info[i] = NULL;
+				handler_error(bp[i]);
+				bp[i] = NULL;
 				err = 1;
 				continue;
 			}
@@ -697,7 +701,7 @@ int hw_breakpoint_handler(struct die_args *args)
 		/* Workaround for Power10 DD1 */
 		if (!IS_ENABLED(CONFIG_PPC_8xx) && mfspr(SPRN_PVR) == 0x800100 &&
 		    is_octword_vsx_instr(type, size)) {
-			handle_p10dd1_spurious_exception(info, hit, ea);
+			handle_p10dd1_spurious_exception(bp, hit, ea);
 		} else {
 			rc = NOTIFY_DONE;
 			goto out;
@@ -715,7 +719,7 @@ int hw_breakpoint_handler(struct die_args *args)
 			if (!hit[i])
 				continue;
 			perf_bp_event(bp[i], regs);
-			info[i] = NULL;
+			bp[i] = NULL;
 		}
 		rc = NOTIFY_DONE;
 		goto reset;
@@ -726,13 +730,13 @@ int hw_breakpoint_handler(struct die_args *args)
 			for (i = 0; i < nr_wp_slots(); i++) {
 				if (!hit[i])
 					continue;
-				larx_stcx_err(bp[i], info[i]);
-				info[i] = NULL;
+				larx_stcx_err(bp[i]);
+				bp[i] = NULL;
 			}
 			goto reset;
 		}
 
-		if (!stepping_handler(regs, bp, info, hit, instr))
+		if (!stepping_handler(regs, bp, hit, instr))
 			goto reset;
 	}
 
@@ -743,15 +747,15 @@ int hw_breakpoint_handler(struct die_args *args)
 	for (i = 0; i < nr_wp_slots(); i++) {
 		if (!hit[i])
 			continue;
-		if (!(info[i]->type & HW_BRK_TYPE_EXTRANEOUS_IRQ))
+		if (!(counter_arch_bp(bp[i])->type & HW_BRK_TYPE_EXTRANEOUS_IRQ))
 			perf_bp_event(bp[i], regs);
 	}
 
 reset:
 	for (i = 0; i < nr_wp_slots(); i++) {
-		if (!info[i])
+		if (!bp[i])
 			continue;
-		__set_breakpoint(i, info[i]);
+		__set_breakpoint(i, counter_arch_bp(bp[i]));
 	}
 
 out:
-- 
2.41.0

