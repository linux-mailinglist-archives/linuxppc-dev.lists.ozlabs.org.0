Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF18253CC3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 06:34:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BcVJ72y4YzDqVv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 14:34:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=BSbUwwM6; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BcTm92V0dzDqSQ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Aug 2020 14:10:33 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07R41gu4126228; Thu, 27 Aug 2020 00:10:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=dJ/ngIzjVMjgKq6NpfHBOMvuKC5m8WcE3tstp4FhhYw=;
 b=BSbUwwM6dEaVptCu4jjwwbLWgwhVEBmvRfZMqNdYyJX3or7TYrdXSuTkBvqVSdpURD8Y
 GE/z2HvSaslA8+ZSNzjGms+wPWlr7w+UnUAg7IRuK2N6ifNiX1IpvJXKUKdjfgwT8WuM
 aViJ2mMNGuJhqV2CC2GvNFnCVEVftELp7+Yb5fdaXAFJP1DyBOTg8qgqb/IGBH9UT7bc
 XDnxPM9UELq30JWBtchfOZixkCsZEibbic4FLo7AnZBwF2anXtqgL9oF7u7NJ9kYJ+Sf
 sZSjKdrvARpUndboulK0Fr/a9g6Q8YgfftFinMQid9Csi0Fk82keT76bXziXW/NuqSIt Gg== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33657b0g66-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Aug 2020 00:10:27 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07R47id2020808;
 Thu, 27 Aug 2020 04:10:27 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma03dal.us.ibm.com with ESMTP id 332utu0s6d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Aug 2020 04:10:27 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07R4AQHO50528682
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Aug 2020 04:10:26 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 80F7428058;
 Thu, 27 Aug 2020 04:10:26 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 077F52805C;
 Thu, 27 Aug 2020 04:10:25 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.85.74.195])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 27 Aug 2020 04:10:24 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v5 13/23] powerpc/book3s64/pkeys: Reset userspace AMR
 correctly on exec
Date: Thu, 27 Aug 2020 09:39:21 +0530
Message-Id: <20200827040931.297759-14-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200827040931.297759-1-aneesh.kumar@linux.ibm.com>
References: <20200827040931.297759-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-26_14:2020-08-26,
 2020-08-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 spamscore=0 mlxlogscore=999 mlxscore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008270028
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On fork, we inherit from the parent and on exec, we should switch to default_amr values.

Also, avoid changing the AMR register value within the kernel. The kernel now runs with
different AMR values.

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
index 725fd1bed2b6..75fd30e023bd 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1506,6 +1506,11 @@ void arch_setup_new_exec(void)
 		current->thread.regs = regs - 1;
 	}
 
+#ifdef CONFIG_PPC_MEM_KEYS
+	current->thread.regs->kuap  = default_amr;
+	current->thread.regs->kuep  = default_iamr;
+#endif
+
 }
 #else
 void arch_setup_new_exec(void)
@@ -1866,7 +1871,6 @@ void start_thread(struct pt_regs *regs, unsigned long start, unsigned long sp)
 	current->thread.load_tm = 0;
 #endif /* CONFIG_PPC_TRANSACTIONAL_MEM */
 
-	thread_pkey_regs_init(&current->thread);
 }
 EXPORT_SYMBOL(start_thread);
 
diff --git a/arch/powerpc/mm/book3s64/pkeys.c b/arch/powerpc/mm/book3s64/pkeys.c
index 640f090b9f9d..f47d11f2743d 100644
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
@@ -388,18 +388,6 @@ void thread_pkey_regs_restore(struct thread_struct *new_thread,
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
2.26.2

