Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6CB30D193
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 03:32:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVm1922BFzDqdm
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 13:32:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sandipan@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=BHLAR/ex; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVSgV2T65zDr2w
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Feb 2021 02:01:10 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 112EWPMG177389; Tue, 2 Feb 2021 10:01:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=Jm/ChOQEyFpVG5OqEMYAGV1HZXAEqSH0nrg2VtOtuts=;
 b=BHLAR/exhWoI1x3DW70kBz3BR7Tep8ZdwUrfOgk/Lj3QOfj1j0m9Ffq/b3KDd4PmuSHs
 /aUg8ddYJGeP/jeDNVuvwAG/JZi/C1DP+LlV3thK04ASnFiWWiILfUvti6WommA96Kvz
 v1i1B1OP3s2G1eb4NcG9B7fbs5UwVyHTAjnY3m6yTygSmk7j9poc1fWin7v8SkfUpZGa
 SAPChU8lRfcHgKv3Prjjpb+R18qjxc3z/DBpMnj0zEHs6buSA9AeFAHu46YPZwcIZFY4
 1JXerotFuQ3E9xYScX9niW6HuZWi2J2XkTq91up4kRY8HIZJi2rlA8LGs1I3D+8vuyBW Bg== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36f6656c1p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Feb 2021 10:01:01 -0500
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 112Ew2oD003141;
 Tue, 2 Feb 2021 15:00:54 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 36er8y8sbx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Feb 2021 15:00:54 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 112F0qVe42139946
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Feb 2021 15:00:52 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5F995A4057;
 Tue,  2 Feb 2021 15:00:52 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7C8B6A405D;
 Tue,  2 Feb 2021 15:00:51 +0000 (GMT)
Received: from fir03.in.ibm.com (unknown [9.121.59.65])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  2 Feb 2021 15:00:51 +0000 (GMT)
From: Sandipan Das <sandipan@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc/pkeys: Remove unused code
Date: Tue,  2 Feb 2021 20:30:50 +0530
Message-Id: <20210202150050.75335-1-sandipan@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-02_06:2021-02-02,
 2021-02-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 malwarescore=0 mlxscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 mlxlogscore=999 spamscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102020096
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
Cc: aneesh.kumar@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 linuxram@us.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This removes arch_supports_pkeys(), arch_usable_pkeys() and
thread_pkey_regs_*() which are remnants from the following:

commit 06bb53b33804 ("powerpc: store and restore the pkey state across context switches")
commit 2cd4bd192ee9 ("powerpc/pkeys: Fix handling of pkey state across fork()")
commit cf43d3b26452 ("powerpc: Enable pkey subsystem")

arch_supports_pkeys() and arch_usable_pkeys() were unused
since their introduction while thread_pkey_regs_*() became
unused after the introduction of the following:

commit d5fa30e6993f ("powerpc/book3s64/pkeys: Reset userspace AMR correctly on exec")
commit 48a8ab4eeb82 ("powerpc/book3s64/pkeys: Don't update SPRN_AMR when in kernel mode")

Signed-off-by: Sandipan Das <sandipan@linux.ibm.com>
---
 arch/powerpc/include/asm/mmu_context.h | 3 ---
 arch/powerpc/include/asm/pkeys.h       | 6 ------
 2 files changed, 9 deletions(-)

diff --git a/arch/powerpc/include/asm/mmu_context.h b/arch/powerpc/include/asm/mmu_context.h
index d5821834dba9..652ce85f9410 100644
--- a/arch/powerpc/include/asm/mmu_context.h
+++ b/arch/powerpc/include/asm/mmu_context.h
@@ -282,9 +282,6 @@ static inline bool arch_vma_access_permitted(struct vm_area_struct *vma,
 }
 
 #define pkey_mm_init(mm)
-#define thread_pkey_regs_save(thread)
-#define thread_pkey_regs_restore(new_thread, old_thread)
-#define thread_pkey_regs_init(thread)
 #define arch_dup_pkeys(oldmm, mm)
 
 static inline u64 pte_to_hpte_pkey_bits(u64 pteflags, unsigned long flags)
diff --git a/arch/powerpc/include/asm/pkeys.h b/arch/powerpc/include/asm/pkeys.h
index a7951049e129..59a2c7dbc78f 100644
--- a/arch/powerpc/include/asm/pkeys.h
+++ b/arch/powerpc/include/asm/pkeys.h
@@ -169,10 +169,4 @@ static inline bool arch_pkeys_enabled(void)
 }
 
 extern void pkey_mm_init(struct mm_struct *mm);
-extern bool arch_supports_pkeys(int cap);
-extern unsigned int arch_usable_pkeys(void);
-extern void thread_pkey_regs_save(struct thread_struct *thread);
-extern void thread_pkey_regs_restore(struct thread_struct *new_thread,
-				     struct thread_struct *old_thread);
-extern void thread_pkey_regs_init(struct thread_struct *thread);
 #endif /*_ASM_POWERPC_KEYS_H */
-- 
2.25.1

