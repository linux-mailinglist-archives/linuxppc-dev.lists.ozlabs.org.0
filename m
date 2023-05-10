Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3839B6FD47C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 May 2023 05:40:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QGLPz0CD9z3cgm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 May 2023 13:40:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pRzkk2IM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pRzkk2IM;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QGLDm3hVGz3fMQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 May 2023 13:32:08 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34A2vHv7014042;
	Wed, 10 May 2023 03:31:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=EeFBNfnswJkWRzyixTFzpZe9HLxzEW4D4GY+mnF1xi8=;
 b=pRzkk2IMbX9OUoCUGd/3C7ipTURv7l958Ftg+mMw9/bDFhPCmhehYDlxzcd3q1bfTA9u
 DuzlmmdgCdECwzKImUgxuTuia1XUXspbXtk2iu/QuNX+GVTtqeaOy/Wh+9+bBENXkqqf
 iDjemePFFOKqe1m9ApWSYSr0pyBx4u3pp3eua250wHiEsdbf6OqXPy2f5TZ2H4Tbs6wx
 bUjC4x0oxz276AWiWbs0N78ELC8HvfXKfzRRn2RnT1GN9aegRuXSYXYdG3gdhZ+yU246
 foAW0hRwGARyPYaCdsqvfz01TP16SkHd2AkosxNLSiFPUd8nICWMgNgHEnmPCHrX7L4Y pg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qg2x5rm11-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 May 2023 03:31:58 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34A3PKmZ017074;
	Wed, 10 May 2023 03:31:57 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qg2x5rktu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 May 2023 03:31:57 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34A16acG009412;
	Wed, 10 May 2023 03:31:35 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma02fra.de.ibm.com (PPS) with ESMTPS id 3qf7dg0n64-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 May 2023 03:31:35 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 34A3VX8a50135410
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 May 2023 03:31:33 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8155C2004B;
	Wed, 10 May 2023 03:31:33 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0052320043;
	Wed, 10 May 2023 03:31:33 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 10 May 2023 03:31:32 +0000 (GMT)
Received: from civic.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 0964F603DA;
	Wed, 10 May 2023 13:31:30 +1000 (AEST)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 04/11] powerpc: Mark [h]ssr_valid accesses in check_return_regs_valid
Date: Wed, 10 May 2023 13:31:10 +1000
Message-Id: <20230510033117.1395895-5-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230510033117.1395895-1-rmclure@linux.ibm.com>
References: <20230510033117.1395895-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: UqmOSLDbb35BqGoHclq9eu7186dRD_GD
X-Proofpoint-GUID: 4TNfQ_Dr4zm_RIPyQGAubbUPjxyWv_Mg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-09_16,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 mlxlogscore=464 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0
 phishscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305100026
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
Cc: arnd@arndb.de, gautam@linux.ibm.com, npiggin@gmail.com, Rohan McLure <rmclure@linux.ibm.com>
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
Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
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

