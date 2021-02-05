Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8277931031B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Feb 2021 04:07:08 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DX0h95STczDqmq
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Feb 2021 14:07:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=W5wOsGsn; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DX0dx5bLPzDvWv
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Feb 2021 14:05:09 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 11533dj8082005; Thu, 4 Feb 2021 22:04:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=v1bMQtbfjTVy7dZNjSDjpikwuOccYo2Xd8RxexDbBvk=;
 b=W5wOsGsnZlwMI0Ey/62dqnFuwkRON01z5neLWAiQAhIrmtt0KK1ANQUed5lX45ySOHo2
 E+vXWHUrp7kTGEfU6ahznPZBfSj/d9p+gCMQguGAJGHZzkmTqFiKXCBLJduahII29Heq
 cUj2Ir22diQq/BW2+uob6fONDul61rbz9qCdIIKF+fQLXd/jNTPhWaCH8lIydwGggwZz
 YIAqvAvwnt+r6spxh+6xF359UcU7CLNSB4v0UmLC/z2Z+ZHWcwaH4uF8QnQRB4fMN8QK
 5sbWxtAFX2zVq0ZXxAlB/j4KacchQnPEMw+0ae157XuUyFdF166ZYMvHLuWv7ZbjQ5x5 xg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36gw1q8s4f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Feb 2021 22:04:53 -0500
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 11534LUD086690;
 Thu, 4 Feb 2021 22:04:44 -0500
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36gw1q8s2d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Feb 2021 22:04:44 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 1152v8mw030100;
 Fri, 5 Feb 2021 03:04:39 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma04wdc.us.ibm.com with ESMTP id 36f0yv7eyh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Feb 2021 03:04:39 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11534cQ030736814
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 5 Feb 2021 03:04:38 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EF8466E050;
 Fri,  5 Feb 2021 03:04:37 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B290D6E04E;
 Fri,  5 Feb 2021 03:04:34 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.102.1.215])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  5 Feb 2021 03:04:34 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH] powerpc/kuap: Allow kernel thread to access userspace after
 kthread_use_mm
Date: Fri,  5 Feb 2021 08:34:26 +0530
Message-Id: <20210205030426.430331-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-05_02:2021-02-04,
 2021-02-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999 impostorscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 spamscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102050020
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

Cc: Zorro Lang <zlang@redhat.com>
Cc: Jens Axboe <axboe@kernel.dk>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/book3s/64/kup.h | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/kup.h b/arch/powerpc/include/asm/book3s/64/kup.h
index f50f72e535aa..2064621ae7b6 100644
--- a/arch/powerpc/include/asm/book3s/64/kup.h
+++ b/arch/powerpc/include/asm/book3s/64/kup.h
@@ -202,22 +202,16 @@ DECLARE_STATIC_KEY_FALSE(uaccess_flush_key);
 #include <asm/mmu.h>
 #include <asm/ptrace.h>
 
-/*
- * For kernel thread that doesn't have thread.regs return
- * default AMR/IAMR values.
- */
 static inline u64 current_thread_amr(void)
 {
-	if (current->thread.regs)
-		return current->thread.regs->amr;
-	return AMR_KUAP_BLOCKED;
+	VM_BUG_ON(!current->thread.regs);
+	return current->thread.regs->amr;
 }
 
 static inline u64 current_thread_iamr(void)
 {
-	if (current->thread.regs)
-		return current->thread.regs->iamr;
-	return AMR_KUEP_BLOCKED;
+	VM_BUG_ON(!current->thread.regs);
+	return current->thread.regs->iamr;
 }
 #endif /* CONFIG_PPC_PKEY */
 
@@ -384,7 +378,14 @@ static __always_inline void allow_user_access(void __user *to, const void __user
 	// This is written so we can resolve to a single case at build time
 	BUILD_BUG_ON(!__builtin_constant_p(dir));
 
-	if (mmu_has_feature(MMU_FTR_PKEY))
+	/*
+	 * Kernel threads may access user mm with kthread_use_mm() but
+	 * can't use current_thread_amr because they have thread.regs==NULL,
+	 * but they have no pkeys.
+	 */
+	if (current->flags & PF_KTHREAD)
+		thread_amr = 0;
+	else if (mmu_has_feature(MMU_FTR_PKEY))
 		thread_amr = current_thread_amr();
 
 	if (dir == KUAP_READ)
-- 
2.29.2

