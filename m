Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 361E4527E5E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 May 2022 09:15:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L1rB31cs3z3cF6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 May 2022 17:15:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hcv+RN0X;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=hcv+RN0X; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L1r9P04Kzz2ybB
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 May 2022 17:14:48 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24G6ilj8019795;
 Mon, 16 May 2022 07:14:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=jrK92z1fMS1G5fS2yCOS0DIPPrVxajCkMlNWCV+MDYY=;
 b=hcv+RN0XlSsjUit07dDtJYr4AGkVYLN8uZAQ5k8NPYCFHN5SRUbigLHgCcpnjkm4Bvuu
 558yitPh0YZ1nLUvLS/bRNLQ8ztP1KPGYhkdSJbeyTO1KNtfKjZ0EhWsjroY0NNU5nJo
 PCmfrEt93vP3pifZsSJljz4sTpaPblwrianlL11DvPSgG9OmIt+4iDmAlHTi7lagRHQN
 IODgyNo/mWVy8zuZHll4lMCf4Vdf6YD5bsfI8CvCt2ERnUxCCS9UFyoThAp52IuWbZYu
 69BnMwF8OIjAbuXdb5bhs+ETu3ntTUus6Ix/oZclKzTjcFQUaJiqebpVX8dcH5CPwgSf Xw== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g3hm6rhps-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 May 2022 07:14:39 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24G78jeP005605;
 Mon, 16 May 2022 07:14:37 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma01fra.de.ibm.com with ESMTP id 3g2428sqh6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 May 2022 07:14:37 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24G7EXXO39584192
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 May 2022 07:14:33 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 996A742057;
 Mon, 16 May 2022 07:14:33 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8CDC442049;
 Mon, 16 May 2022 07:14:32 +0000 (GMT)
Received: from li-NotSettable.ibm.com.com (unknown [9.43.74.115])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 16 May 2022 07:14:32 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2] powerpc/ftrace: Remove ftrace init tramp once kernel init
 is complete
Date: Mon, 16 May 2022 12:44:22 +0530
Message-Id: <20220516071422.463738-1-naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 8gBQ4nYH4LYfygUisl7KJ4BugmLRziRa
X-Proofpoint-ORIG-GUID: 8gBQ4nYH4LYfygUisl7KJ4BugmLRziRa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-15_11,2022-05-13_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 phishscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205160036
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

Stop using the ftrace trampoline for init section once kernel init is
complete.

Fixes: 67361cf8071286 ("powerpc/ftrace: Handle large kernel configs")
Cc: stable@vger.kernel.org # v4.20+
Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
v2: Update #ifdef to also check for CONFIG_FUNCTION_TRACER to address a
build break seen with corenet64_smp_defconfig.


 arch/powerpc/include/asm/ftrace.h  |  4 +++-
 arch/powerpc/kernel/trace/ftrace.c | 15 ++++++++++++---
 arch/powerpc/mm/mem.c              |  2 ++
 3 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/ftrace.h b/arch/powerpc/include/asm/ftrace.h
index d83758acd1c7c3..44a37a2b6a1cfa 100644
--- a/arch/powerpc/include/asm/ftrace.h
+++ b/arch/powerpc/include/asm/ftrace.h
@@ -86,7 +86,7 @@ static inline bool arch_syscall_match_sym_name(const char *sym, const char *name
 #endif /* PPC64_ELF_ABI_v1 */
 #endif /* CONFIG_FTRACE_SYSCALLS */
 
-#ifdef CONFIG_PPC64
+#if defined(CONFIG_PPC64) && defined(CONFIG_FUNCTION_TRACER)
 #include <asm/paca.h>
 
 static inline void this_cpu_disable_ftrace(void)
@@ -110,11 +110,13 @@ static inline u8 this_cpu_get_ftrace_enabled(void)
 	return get_paca()->ftrace_enabled;
 }
 
+void ftrace_free_init_tramp(void);
 #else /* CONFIG_PPC64 */
 static inline void this_cpu_disable_ftrace(void) { }
 static inline void this_cpu_enable_ftrace(void) { }
 static inline void this_cpu_set_ftrace_enabled(u8 ftrace_enabled) { }
 static inline u8 this_cpu_get_ftrace_enabled(void) { return 1; }
+static inline void ftrace_free_init_tramp(void) { }
 #endif /* CONFIG_PPC64 */
 #endif /* !__ASSEMBLY__ */
 
diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index 4ee04aacf9f13c..a778f2ae1f3f50 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -306,9 +306,7 @@ static int setup_mcount_compiler_tramp(unsigned long tramp)
 
 	/* Is this a known long jump tramp? */
 	for (i = 0; i < NUM_FTRACE_TRAMPS; i++)
-		if (!ftrace_tramps[i])
-			break;
-		else if (ftrace_tramps[i] == tramp)
+		if (ftrace_tramps[i] == tramp)
 			return 0;
 
 	/* Is this a known plt tramp? */
@@ -863,6 +861,17 @@ void arch_ftrace_update_code(int command)
 
 extern unsigned int ftrace_tramp_text[], ftrace_tramp_init[];
 
+void ftrace_free_init_tramp(void)
+{
+	int i;
+
+	for (i = 0; i < NUM_FTRACE_TRAMPS && ftrace_tramps[i]; i++)
+		if (ftrace_tramps[i] == (unsigned long)ftrace_tramp_init) {
+			ftrace_tramps[i] = 0;
+			return;
+		}
+}
+
 int __init ftrace_dyn_arch_init(void)
 {
 	int i;
diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index 4d221d033804ef..149635e5c16534 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -22,6 +22,7 @@
 #include <asm/kasan.h>
 #include <asm/svm.h>
 #include <asm/mmzone.h>
+#include <asm/ftrace.h>
 
 #include <mm/mmu_decl.h>
 
@@ -312,6 +313,7 @@ void free_initmem(void)
 	ppc_md.progress = ppc_printk_progress;
 	mark_initmem_nx();
 	free_initmem_default(POISON_FREE_INITMEM);
+	ftrace_free_init_tramp();
 }
 
 /*

base-commit: f5802608e604dbedd4e791a43dd7732b68fcacae
-- 
2.36.1

