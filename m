Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF6E2C5F6B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Nov 2020 06:08:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cj2hz74xqzDsPL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Nov 2020 16:08:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Zj89f1AS; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cj29q6qtczDrVM
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Nov 2020 15:45:19 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AR4VUDL008909; Thu, 26 Nov 2020 23:45:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=IN4r9IziRoExNSIESIVUEoKmH1GyPpM8+QtD02+xbzw=;
 b=Zj89f1ASIMAM9lYWmI7SJ/HRZq/vKhp49xbGLSPV5x3yQb8pcc6FRHX2RJdsvtvOPzl9
 m8i5DxrasET+Jny691moOa6aA919K64y1i478dsGxOJ41iJArf+Dmerko6igGVWDQ47L
 DxYTkm1Xp3sCgmE+QcABUyGCQw7bGEiLzcfdqro5OJE2cW2byYhvBO/NwsyRaC6pHuri
 /V/CTz5n7dVA4vszcF1dzBxhMy6wv3C83gTGg9TUMumcidwDUfJwvKJBEDGmaj8ZJy+k
 H7bC0go5YaA4K6sNqBg9laU2cKZ+cAIkDKAdAzo4dtAnsVWfFtx5JnwtyLCm31leCLv7 Dg== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 352pu8cmka-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Nov 2020 23:45:08 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AR4gAVY002867;
 Fri, 27 Nov 2020 04:45:07 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma03dal.us.ibm.com with ESMTP id 34xtha6wqw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Nov 2020 04:45:07 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AR4j6bP23200014
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Nov 2020 04:45:06 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 32F036E053;
 Fri, 27 Nov 2020 04:45:06 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B68006E04E;
 Fri, 27 Nov 2020 04:45:03 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.45.115])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 27 Nov 2020 04:45:03 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v7 12/22] powerpc/book3s64/pkeys: Reset userspace AMR
 correctly on exec
Date: Fri, 27 Nov 2020 10:14:14 +0530
Message-Id: <20201127044424.40686-13-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201127044424.40686-1-aneesh.kumar@linux.ibm.com>
References: <20201127044424.40686-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-27_01:2020-11-26,
 2020-11-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 mlxlogscore=999
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011270021
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Sandipan Das <sandipan@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On fork, we inherit from the parent and on exec, we should switch to default_amr values.

Also, avoid changing the AMR register value within the kernel. The kernel now runs with
different AMR values.

Reviewed-by: Sandipan Das <sandipan@linux.ibm.com>
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/book3s/64/pkeys.h |  2 ++
 arch/powerpc/kernel/process.c              |  6 +++++-
 arch/powerpc/mm/book3s64/pkeys.c           | 16 ++--------------
 3 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/pkeys.h b/arch/powerpc/include/asm/book3s/64/pkeys.h
index b7d9f4267bcd..3b8640498f5b 100644
--- a/arch/powerpc/include/asm/book3s/64/pkeys.h
+++ b/arch/powerpc/include/asm/book3s/64/pkeys.h
@@ -6,6 +6,8 @@
 #include <asm/book3s/64/hash-pkey.h>
 
 extern u64 __ro_after_init default_uamor;
+extern u64 __ro_after_init default_amr;
+extern u64 __ro_after_init default_iamr;
 
 static inline u64 vmflag_to_pte_pkey_bits(u64 vm_flags)
 {
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 9acb6166012d..7ea53aac0478 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1542,6 +1542,11 @@ void arch_setup_new_exec(void)
 		struct pt_regs *regs = task_stack_page(current) + THREAD_SIZE;
 		current->thread.regs = regs - 1;
 	}
+
+#ifdef CONFIG_PPC_MEM_KEYS
+	current->thread.regs->amr  = default_amr;
+	current->thread.regs->iamr  = default_iamr;
+#endif
 }
 
 #ifdef CONFIG_PPC64
@@ -1887,7 +1892,6 @@ void start_thread(struct pt_regs *regs, unsigned long start, unsigned long sp)
 	current->thread.load_tm = 0;
 #endif /* CONFIG_PPC_TRANSACTIONAL_MEM */
 
-	thread_pkey_regs_init(&current->thread);
 }
 EXPORT_SYMBOL(start_thread);
 
diff --git a/arch/powerpc/mm/book3s64/pkeys.c b/arch/powerpc/mm/book3s64/pkeys.c
index e434c0a2ee5d..355d001fa155 100644
--- a/arch/powerpc/mm/book3s64/pkeys.c
+++ b/arch/powerpc/mm/book3s64/pkeys.c
@@ -28,8 +28,8 @@ static u32 initial_allocation_mask __ro_after_init;
  * Even if we allocate keys with sys_pkey_alloc(), we need to make sure
  * other thread still find the access denied using the same keys.
  */
-static u64 default_amr = ~0x0UL;
-static u64 default_iamr = 0x5555555555555555UL;
+u64 default_amr __ro_after_init  = ~0x0UL;
+u64 default_iamr __ro_after_init = 0x5555555555555555UL;
 u64 default_uamor __ro_after_init;
 /*
  * Key used to implement PROT_EXEC mmap. Denies READ/WRITE
@@ -396,18 +396,6 @@ void thread_pkey_regs_restore(struct thread_struct *new_thread,
 		write_iamr(new_thread->iamr);
 }
 
-void thread_pkey_regs_init(struct thread_struct *thread)
-{
-	if (!mmu_has_feature(MMU_FTR_PKEY))
-		return;
-
-	thread->amr   = default_amr;
-	thread->iamr  = default_iamr;
-
-	write_amr(default_amr);
-	write_iamr(default_iamr);
-}
-
 int execute_only_pkey(struct mm_struct *mm)
 {
 	return mm->context.execute_only_pkey;
-- 
2.28.0

