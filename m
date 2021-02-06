Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E2781311932
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Feb 2021 03:58:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DXcRr6wNMzDr3b
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Feb 2021 13:58:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ERsWv0us; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DXcQ34sjTzDvVf
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Feb 2021 13:56:59 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 1162ic0u135417; Fri, 5 Feb 2021 21:56:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=7XKOMJdDNP9357q8qfWFfRxsuOqWyuB5mrWbureLhZU=;
 b=ERsWv0usrTQRQbvM1GslfqA2ZgRBeXmhFDIEK3UubZ2DQrtEQ1Cv+ceQ9Hc7rGEwCQzr
 RplC7CJS/nWz0Bg1YYpLUBcU2Ozto2WfKIramPQ3DuXwwZpyT31pE0ZuGCGZoGz1CDcN
 95KGo7BL++oJJTnHARLUHPoy1J3GDSjETORAfAixdxUdwyhwE48hHWsMgIPUn778Px8z
 2462yuwrhyH+vl3wxVZNV1S662RlVCkgu387FRNbtOuPoag6jWAIckCnp6OmGAbhdjb4
 PqfdFaI/aIRO6eyMSo65WYpLNjYIkLZe2TUUIwIbOOFbMXVqf7UsNWW2vWeegC2pYL01 gg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36hjk985mt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Feb 2021 21:56:44 -0500
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 1162kCsE144562;
 Fri, 5 Feb 2021 21:56:44 -0500
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36hjk985mk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Feb 2021 21:56:44 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 1162soLr012018;
 Sat, 6 Feb 2021 02:56:43 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03wdc.us.ibm.com with ESMTP id 36hjr8g05m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 06 Feb 2021 02:56:43 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1162ugKd34275618
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 6 Feb 2021 02:56:42 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8FC20136051;
 Sat,  6 Feb 2021 02:56:42 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 63CC313604F;
 Sat,  6 Feb 2021 02:56:39 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.85.72.86])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Sat,  6 Feb 2021 02:56:38 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v3] powerpc/kuap: Allow kernel thread to access userspace
 after kthread_use_mm
Date: Sat,  6 Feb 2021 08:26:34 +0530
Message-Id: <20210206025634.521979-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-05_15:2021-02-05,
 2021-02-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102060010
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
Cc: Jens Axboe <axboe@kernel.dk>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Zorro Lang <zlang@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This fix the bad fault reported by KUAP when io_wqe_worker access userspace.

 Bug: Read fault blocked by KUAP!
 WARNING: CPU: 1 PID: 101841 at arch/powerpc/mm/fault.c:229 __do_page_fault+0x6b4/0xcd0
 NIP [c00000000009e7e4] __do_page_fault+0x6b4/0xcd0
 LR [c00000000009e7e0] __do_page_fault+0x6b0/0xcd0
..........
 Call Trace:
 [c000000016367330] [c00000000009e7e0] __do_page_fault+0x6b0/0xcd0 (unreliable)
 [c0000000163673e0] [c00000000009ee3c] do_page_fault+0x3c/0x120
 [c000000016367430] [c00000000000c848] handle_page_fault+0x10/0x2c
 --- interrupt: 300 at iov_iter_fault_in_readable+0x148/0x6f0
..........
 NIP [c0000000008e8228] iov_iter_fault_in_readable+0x148/0x6f0
 LR [c0000000008e834c] iov_iter_fault_in_readable+0x26c/0x6f0
 interrupt: 300
 [c0000000163677e0] [c0000000007154a0] iomap_write_actor+0xc0/0x280
 [c000000016367880] [c00000000070fc94] iomap_apply+0x1c4/0x780
 [c000000016367990] [c000000000710330] iomap_file_buffered_write+0xa0/0x120
 [c0000000163679e0] [c00800000040791c] xfs_file_buffered_aio_write+0x314/0x5e0 [xfs]
 [c000000016367a90] [c0000000006d74bc] io_write+0x10c/0x460
 [c000000016367bb0] [c0000000006d80e4] io_issue_sqe+0x8d4/0x1200
 [c000000016367c70] [c0000000006d8ad0] io_wq_submit_work+0xc0/0x250
 [c000000016367cb0] [c0000000006e2578] io_worker_handle_work+0x498/0x800
 [c000000016367d40] [c0000000006e2cdc] io_wqe_worker+0x3fc/0x4f0
 [c000000016367da0] [c0000000001cb0a4] kthread+0x1c4/0x1d0
 [c000000016367e10] [c00000000000dbf0] ret_from_kernel_thread+0x5c/0x6c

The kernel consider thread AMR value for kernel thread to be
AMR_KUAP_BLOCKED. Hence access to userspace is denied. This
of course not correct and we should allow userspace access after
kthread_use_mm(). To be precise, kthread_use_mm() should inherit the
AMR value of the operating address space. But, the AMR value is
thread-specific and we inherit the address space and not thread
access restrictions. Because of this ignore AMR value when accessing
userspace via kernel thread.

current_thread_amr/iamr() are updated, because we use them in the
below stack.
....
[  530.710838] CPU: 13 PID: 5587 Comm: io_wqe_worker-0 Tainted: G      D           5.11.0-rc6+ #3
....

 NIP [c0000000000aa0c8] pkey_access_permitted+0x28/0x90
 LR [c0000000004b9278] gup_pte_range+0x188/0x420
 --- interrupt: 700
 [c00000001c4ef3f0] [0000000000000000] 0x0 (unreliable)
 [c00000001c4ef490] [c0000000004bd39c] gup_pgd_range+0x3ac/0xa20
 [c00000001c4ef5a0] [c0000000004bdd44] internal_get_user_pages_fast+0x334/0x410
 [c00000001c4ef620] [c000000000852028] iov_iter_get_pages+0xf8/0x5c0
 [c00000001c4ef6a0] [c0000000007da44c] bio_iov_iter_get_pages+0xec/0x700
 [c00000001c4ef770] [c0000000006a325c] iomap_dio_bio_actor+0x2ac/0x4f0
 [c00000001c4ef810] [c00000000069cd94] iomap_apply+0x2b4/0x740
 [c00000001c4ef920] [c0000000006a38b8] __iomap_dio_rw+0x238/0x5c0
 [c00000001c4ef9d0] [c0000000006a3c60] iomap_dio_rw+0x20/0x80
 [c00000001c4ef9f0] [c008000001927a30] xfs_file_dio_aio_write+0x1f8/0x650 [xfs]
 [c00000001c4efa60] [c0080000019284dc] xfs_file_write_iter+0xc4/0x130 [xfs]
 [c00000001c4efa90] [c000000000669984] io_write+0x104/0x4b0
 [c00000001c4efbb0] [c00000000066cea4] io_issue_sqe+0x3d4/0xf50
 [c00000001c4efc60] [c000000000670200] io_wq_submit_work+0xb0/0x2f0
 [c00000001c4efcb0] [c000000000674268] io_worker_handle_work+0x248/0x4a0
 [c00000001c4efd30] [c0000000006746e8] io_wqe_worker+0x228/0x2a0
 [c00000001c4efda0] [c00000000019d994] kthread+0x1b4/0x1c0

Cc: Zorro Lang <zlang@redhat.com>
Cc: Jens Axboe <axboe@kernel.dk>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---

Changes from v2:
* Fix build error
Changes from v1:
* use default_amr/default_iamr for kthread.

 arch/powerpc/include/asm/book3s/64/kup.h   | 16 +++++++++++-----
 arch/powerpc/include/asm/book3s/64/pkeys.h |  4 ----
 arch/powerpc/mm/book3s64/pkeys.c           |  1 +
 3 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/kup.h b/arch/powerpc/include/asm/book3s/64/kup.h
index f50f72e535aa..7d1ef7b9754e 100644
--- a/arch/powerpc/include/asm/book3s/64/kup.h
+++ b/arch/powerpc/include/asm/book3s/64/kup.h
@@ -199,25 +199,31 @@ DECLARE_STATIC_KEY_FALSE(uaccess_flush_key);
 
 #ifdef CONFIG_PPC_PKEY
 
+extern u64 __ro_after_init default_uamor;
+extern u64 __ro_after_init default_amr;
+extern u64 __ro_after_init default_iamr;
+
 #include <asm/mmu.h>
 #include <asm/ptrace.h>
 
-/*
- * For kernel thread that doesn't have thread.regs return
- * default AMR/IAMR values.
+/* usage of kthread_use_mm() should inherit the
+ * AMR value of the operating address space. But, the AMR value is
+ * thread-specific and we inherit the address space and not thread
+ * access restrictions. Because of this ignore AMR value when accessing
+ * userspace via kernel thread.
  */
 static inline u64 current_thread_amr(void)
 {
 	if (current->thread.regs)
 		return current->thread.regs->amr;
-	return AMR_KUAP_BLOCKED;
+	return default_amr;
 }
 
 static inline u64 current_thread_iamr(void)
 {
 	if (current->thread.regs)
 		return current->thread.regs->iamr;
-	return AMR_KUEP_BLOCKED;
+	return default_iamr;
 }
 #endif /* CONFIG_PPC_PKEY */
 
diff --git a/arch/powerpc/include/asm/book3s/64/pkeys.h b/arch/powerpc/include/asm/book3s/64/pkeys.h
index 3b8640498f5b..5b178139f3c0 100644
--- a/arch/powerpc/include/asm/book3s/64/pkeys.h
+++ b/arch/powerpc/include/asm/book3s/64/pkeys.h
@@ -5,10 +5,6 @@
 
 #include <asm/book3s/64/hash-pkey.h>
 
-extern u64 __ro_after_init default_uamor;
-extern u64 __ro_after_init default_amr;
-extern u64 __ro_after_init default_iamr;
-
 static inline u64 vmflag_to_pte_pkey_bits(u64 vm_flags)
 {
 	if (!mmu_has_feature(MMU_FTR_PKEY))
diff --git a/arch/powerpc/mm/book3s64/pkeys.c b/arch/powerpc/mm/book3s64/pkeys.c
index f1c6f264ed91..15dcc5ad91c5 100644
--- a/arch/powerpc/mm/book3s64/pkeys.c
+++ b/arch/powerpc/mm/book3s64/pkeys.c
@@ -31,6 +31,7 @@ static u32 initial_allocation_mask __ro_after_init;
 u64 default_amr __ro_after_init  = ~0x0UL;
 u64 default_iamr __ro_after_init = 0x5555555555555555UL;
 u64 default_uamor __ro_after_init;
+EXPORT_SYMBOL(default_amr);
 /*
  * Key used to implement PROT_EXEC mmap. Denies READ/WRITE
  * We pick key 2 because 0 is special key and 1 is reserved as per ISA.
-- 
2.29.2

