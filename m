Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 36AD2245A5F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 03:00:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVG1B4DqvzDqPb
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 11:00:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Wldr7sxA; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVFx01yPNzDqP3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 10:56:36 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07H0XTWK048877; Sun, 16 Aug 2020 20:56:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=QNTE70ImkAcuOTj81J/CO55MAbHdnXmC0GxgSn+KnwM=;
 b=Wldr7sxA+1d31iLcW7qg9PB2tXWvepFiVJirJfXE++LHI4Zb1S/c0X0A1cgL+5xhtBJS
 +EguGAGr+GhGUNizKe/2MavtM3k1KMSif2crDvd1lDKHGLred1o7jQF776u+T7laAxo0
 aIE1ZhCkiAVrsfvpb8o3+EO6YZYcLdWF8D/Pxr9/dMBYWTIoBHaxHLAtRmuMqey4y1/G
 csbnXDOqXUPbHwm0Y551lwu55FTM+Ter3ubYdRKRzDvL2eRuzn5q0ws5ZATEeZTFLc8A
 X3DGub91/bCkYzb3t+gVGfdwlcb6S5mGeRv/LWyY4cQlCQhB7f7KQ4PiinmrUKKCVgcy eA== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32y80gyx2k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 16 Aug 2020 20:56:29 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07H0oj8V008321;
 Mon, 17 Aug 2020 00:56:27 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04fra.de.ibm.com with ESMTP id 32x7b7h0n2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Aug 2020 00:56:26 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 07H0uOX961407738
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Aug 2020 00:56:24 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 26B9E52052;
 Mon, 17 Aug 2020 00:56:24 +0000 (GMT)
Received: from localhost.in.ibm.com (unknown [9.85.91.31])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 174D95204E;
 Mon, 17 Aug 2020 00:56:22 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 1/2] powerpc/kernel/cputable: cleanup the function declarations
Date: Mon, 17 Aug 2020 06:26:17 +0530
Message-Id: <20200817005618.3305028-1-maddy@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-16_12:2020-08-14,
 2020-08-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=809 phishscore=0
 adultscore=0 clxscore=1015 spamscore=0 impostorscore=0 lowpriorityscore=0
 suspectscore=1 mlxscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008170003
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
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

__machine_check_early_realmode_p*() are currently declared
as extern in cputable.c and because of this when compiled
with "C=1" (which enables semantic checker) produces these
warnings.

  CHECK   arch/powerpc/kernel/mce_power.c
arch/powerpc/kernel/mce_power.c:709:6: warning: symbol '__machine_check_early_realmode_p7' was not declared. Should it be static?
arch/powerpc/kernel/mce_power.c:717:6: warning: symbol '__machine_check_early_realmode_p8' was not declared. Should it be static?
arch/powerpc/kernel/mce_power.c:722:6: warning: symbol '__machine_check_early_realmode_p9' was not declared. Should it be static?
arch/powerpc/kernel/mce_power.c:740:6: warning: symbol '__machine_check_early_realmode_p10' was not declared. Should it be static?

Patch here moves the declaration to asm/mce.h
and includes the same in cputable.c

Fixes: ae744f3432d3 ("powerpc/book3s: Flush SLB/TLBs if we get SLB/TLB machine check errors on power8")
Fixes: 7b9f71f974a1 ("powerpc/64s: POWER9 machine check handler")
Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
 arch/powerpc/include/asm/cputable.h | 5 +++++
 arch/powerpc/include/asm/mce.h      | 7 +++++++
 arch/powerpc/kernel/cputable.c      | 3 ---
 arch/powerpc/kernel/dt_cpu_ftrs.c   | 4 ----
 4 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/include/asm/cputable.h b/arch/powerpc/include/asm/cputable.h
index fdddb822d564b..e005b45810232 100644
--- a/arch/powerpc/include/asm/cputable.h
+++ b/arch/powerpc/include/asm/cputable.h
@@ -9,6 +9,11 @@
 
 #ifndef __ASSEMBLY__
 
+/*
+ * Added to include __machine_check_early_realmode_* functions
+ */
+#include <asm/mce.h>
+
 /* This structure can grow, it's real size is used by head.S code
  * via the mkdefs mechanism.
  */
diff --git a/arch/powerpc/include/asm/mce.h b/arch/powerpc/include/asm/mce.h
index adf2cda67f9a4..89aa8248a57dd 100644
--- a/arch/powerpc/include/asm/mce.h
+++ b/arch/powerpc/include/asm/mce.h
@@ -210,6 +210,9 @@ struct mce_error_info {
 #define MCE_EVENT_RELEASE	true
 #define MCE_EVENT_DONTRELEASE	false
 
+struct pt_regs;
+struct notifier_block;
+
 extern void save_mce_event(struct pt_regs *regs, long handled,
 			   struct mce_error_info *mce_err, uint64_t nip,
 			   uint64_t addr, uint64_t phys_addr);
@@ -225,5 +228,9 @@ int mce_register_notifier(struct notifier_block *nb);
 int mce_unregister_notifier(struct notifier_block *nb);
 #ifdef CONFIG_PPC_BOOK3S_64
 void flush_and_reload_slb(void);
+long __machine_check_early_realmode_p7(struct pt_regs *regs);
+long __machine_check_early_realmode_p8(struct pt_regs *regs);
+long __machine_check_early_realmode_p9(struct pt_regs *regs);
+long __machine_check_early_realmode_p10(struct pt_regs *regs);
 #endif /* CONFIG_PPC_BOOK3S_64 */
 #endif /* __ASM_PPC64_MCE_H__ */
diff --git a/arch/powerpc/kernel/cputable.c b/arch/powerpc/kernel/cputable.c
index 3d406a9626e86..4ca9cf556be92 100644
--- a/arch/powerpc/kernel/cputable.c
+++ b/arch/powerpc/kernel/cputable.c
@@ -72,9 +72,6 @@ extern void __setup_cpu_power9(unsigned long offset, struct cpu_spec* spec);
 extern void __restore_cpu_power9(void);
 extern void __setup_cpu_power10(unsigned long offset, struct cpu_spec* spec);
 extern void __restore_cpu_power10(void);
-extern long __machine_check_early_realmode_p7(struct pt_regs *regs);
-extern long __machine_check_early_realmode_p8(struct pt_regs *regs);
-extern long __machine_check_early_realmode_p9(struct pt_regs *regs);
 #endif /* CONFIG_PPC64 */
 #if defined(CONFIG_E500)
 extern void __setup_cpu_e5500(unsigned long offset, struct cpu_spec* spec);
diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt_cpu_ftrs.c
index 6f8c0c6b937a1..8dc46f38680b2 100644
--- a/arch/powerpc/kernel/dt_cpu_ftrs.c
+++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
@@ -64,10 +64,6 @@ struct dt_cpu_feature {
  * Set up the base CPU
  */
 
-extern long __machine_check_early_realmode_p8(struct pt_regs *regs);
-extern long __machine_check_early_realmode_p9(struct pt_regs *regs);
-extern long __machine_check_early_realmode_p10(struct pt_regs *regs);
-
 static int hv_mode;
 
 static struct {
-- 
2.26.2

