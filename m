Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21380731346
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jun 2023 11:12:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VkduwsCL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qhc4Y4kh5z3bnK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jun 2023 19:12:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VkduwsCL;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qhc3c5H3Kz30XT
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jun 2023 19:11:24 +1000 (AEST)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4Qhc3c54pWz4x07
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jun 2023 19:11:24 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4Qhc3c4nshz4x04; Thu, 15 Jun 2023 19:11:24 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=name@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VkduwsCL;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4Qhc3c2N8Tz4wjF;
	Thu, 15 Jun 2023 19:11:23 +1000 (AEST)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35F94xGY027466;
	Thu, 15 Jun 2023 09:11:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=8swvcsIQ7jZ/bfIdmHZxE0SpSToCrZz7FlQwA+T79Oo=;
 b=VkduwsCLQkzShE84Zyp4sFDuAvdvAsC53Vf1DIVPTmtA6faZfTUcj9E0UPVA4TvA0g6R
 3edyQc8fbujUk1MXk2xm1xSkIXF+mvLsPWzHllN3Og7oArvLpI6wVDpFA9WfCgvTEXxV
 gSmFvp9k+MOmGUVdvjAzmxtmr2MlF7w9IFZY4PisI0SOc7bsOQYrqKbi1AgUU0w4iJx8
 gyqkDQ3OzAFWmbVYIg90ayV+gj49IygIxORrssGuOaQRQameLMmoIACSdk3C4nCJuaH0
 mCXEICArAahh67fQySQiIZcFnB9H+FFQ1cEs0TAHlKxwtTpsZ3snD7EHs0Vq3Is86TxD 8A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r7yg80q7h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Jun 2023 09:11:19 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35F95B8l029469;
	Thu, 15 Jun 2023 09:11:09 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r7yg80pq7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Jun 2023 09:11:08 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35F0bwi1028294;
	Thu, 15 Jun 2023 09:10:56 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3r4gt53fbx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Jun 2023 09:10:56 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35F9Ar9H32047538
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Jun 2023 09:10:53 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4F88220040;
	Thu, 15 Jun 2023 09:10:53 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C6F7520063;
	Thu, 15 Jun 2023 09:10:48 +0000 (GMT)
Received: from li-3c92a0cc-27cf-11b2-a85c-b804d9ca68fa.in.ibm.com (unknown [9.109.199.72])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 15 Jun 2023 09:10:48 +0000 (GMT)
From: Aditya Gupta <adityag@linux.ibm.com>
To: linuxppc-dev@ozlabs.org, mpe@ellerman.id.au
Subject: [RFC PATCH v2 1/1] powerpc: update ppc_save_regs to save current r1 in pt_regs
Date: Thu, 15 Jun 2023 14:40:47 +0530
Message-Id: <20230615091047.90433-1-adityag@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -H7uqsmd7FzdQu_U3p5TKDAnZersaaN6
X-Proofpoint-ORIG-GUID: 5XBAeUhS0DH0XjW1okDhDAkIhdTKAkH-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-15_06,2023-06-14_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0
 spamscore=0 impostorscore=0 suspectscore=0 mlxlogscore=871
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306150077
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
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>, "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

ppc_save_regs() skips one stack frame while saving the CPU register states.
Instead of saving current R1, it pulls the previous stack frame pointer.

When vmcores caused by direct panic call (such as `echo c >
/proc/sysrq-trigger`), are debugged with gdb, gdb fails to show the
backtrace correctly. On further analysis, it was found that it was because
of mismatch between r1 and NIP.

GDB uses NIP to get current function symbol and uses corresponding debug
info of that function to unwind previous frames, but due to the
mismatching r1 and NIP, the unwinding does not work, and it fails to
unwind to the 2nd frame and hence does not show the backtrace.

GDB backtrace with vmcore of kernel without this patch:

---------
(gdb) bt
 #0  0xc0000000002a53e8 in crash_setup_regs (oldregs=<optimized out>,
    newregs=0xc000000004f8f8d8) at ./arch/powerpc/include/asm/kexec.h:69
 #1  __crash_kexec (regs=<optimized out>) at kernel/kexec_core.c:974
 #2  0x0000000000000063 in ?? ()
 #3  0xc000000003579320 in ?? ()
---------

Further analysis revealed that the mismatch occurred because
"ppc_save_regs" was saving the previous stack's SP instead of the current
r1. This patch fixes this by storing current r1 in the saved pt_regs.

GDB backtrace with vmcore of patched kernel:

--------
(gdb) bt
 #0  0xc0000000002a53e8 in crash_setup_regs (oldregs=0x0, newregs=0xc00000000670b8d8)
    at ./arch/powerpc/include/asm/kexec.h:69
 #1  __crash_kexec (regs=regs@entry=0x0) at kernel/kexec_core.c:974
 #2  0xc000000000168918 in panic (fmt=fmt@entry=0xc000000001654a60 "sysrq triggered crash\n")
    at kernel/panic.c:358
 #3  0xc000000000b735f8 in sysrq_handle_crash (key=<optimized out>) at drivers/tty/sysrq.c:155
 #4  0xc000000000b742cc in __handle_sysrq (key=key@entry=99, check_mask=check_mask@entry=false)
    at drivers/tty/sysrq.c:602
 #5  0xc000000000b7506c in write_sysrq_trigger (file=<optimized out>, buf=<optimized out>,
    count=2, ppos=<optimized out>) at drivers/tty/sysrq.c:1163
 #6  0xc00000000069a7bc in pde_write (ppos=<optimized out>, count=<optimized out>,
    buf=<optimized out>, file=<optimized out>, pde=0xc00000000362cb40) at fs/proc/inode.c:340
 #7  proc_reg_write (file=<optimized out>, buf=<optimized out>, count=<optimized out>,
    ppos=<optimized out>) at fs/proc/inode.c:352
 #8  0xc0000000005b3bbc in vfs_write (file=file@entry=0xc000000006aa6b00,
    buf=buf@entry=0x61f498b4f60 <error: Cannot access memory at address 0x61f498b4f60>,
    count=count@entry=2, pos=pos@entry=0xc00000000670bda0) at fs/read_write.c:582
 #9  0xc0000000005b4264 in ksys_write (fd=<optimized out>,
    buf=0x61f498b4f60 <error: Cannot access memory at address 0x61f498b4f60>, count=2)
    at fs/read_write.c:637
 #10 0xc00000000002ea2c in system_call_exception (regs=0xc00000000670be80, r0=<optimized out>)
    at arch/powerpc/kernel/syscall.c:171
 #11 0xc00000000000c270 in system_call_vectored_common ()
    at arch/powerpc/kernel/interrupt_64.S:192
--------

Signed-off-by: Aditya Gupta <adityag@linux.ibm.com>
---

More information:

This problem with gdb backtrace was discovered while working on a crash
tool enhancement to improve crash analysis using gdb passthrough to be
able print function arguments and local variables inside crash tool. gdb
passthrough simply asks gdb to handle the backtrace printing, where it
was noticed that it could not print correct backtrace in some vmcores.

The changes introduced here has an implication on xmon, that it might show
one extra `xmon` frame in backtrace. By looking at older commits it seems
that originally the ppc_save_regs function was introduced as
xmon_save_regs(). But now the same function has been renamed to
ppc_save_regs() and been used in few other places as well.

Tested this patch with multiple ways of crashing:
1. direct panic call (`echo c > /proc/sysrq-trigger`)
2. null dereference/oops path (the earlier implementation of `sysrq_handle_crash`)
3. sys reset
4. sys reset inside qemu (to test for any regressions, that were fixed by
   commit d16a58f8854b19)

Changelog
- V2:
  - fixed bogus LR by storing caller's LR area as pointed out by Naveen and
  Nick

---
 arch/powerpc/kernel/ppc_save_regs.S | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/ppc_save_regs.S b/arch/powerpc/kernel/ppc_save_regs.S
index 49813f982468..a9b9c32d0c1f 100644
--- a/arch/powerpc/kernel/ppc_save_regs.S
+++ b/arch/powerpc/kernel/ppc_save_regs.S
@@ -31,10 +31,10 @@ _GLOBAL(ppc_save_regs)
 	lbz	r0,PACAIRQSOFTMASK(r13)
 	PPC_STL	r0,SOFTE(r3)
 #endif
-	/* go up one stack frame for SP */
-	PPC_LL	r4,0(r1)
-	PPC_STL	r4,GPR1(r3)
+	/* store current SP */
+	PPC_STL	r1,GPR1(r3)
 	/* get caller's LR */
+	PPC_LL	r4,0(r1)
 	PPC_LL	r0,LRSAVE(r4)
 	PPC_STL	r0,_LINK(r3)
 	mflr	r0
-- 
2.40.1

