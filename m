Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E9472CFEB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jun 2023 21:57:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=f1qvlDw4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qg2Xm3BMtz30dv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 05:57:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=f1qvlDw4;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QffXY35zjz2ydW
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jun 2023 14:56:13 +1000 (AEST)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4QffXS5Z9yz4xGK
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jun 2023 14:56:08 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4QffXS5TDFz4xG9; Mon, 12 Jun 2023 14:56:08 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=name@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=f1qvlDw4;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4QffXS1LNGz4xG5;
	Mon, 12 Jun 2023 14:56:07 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35C4MrA2002187;
	Mon, 12 Jun 2023 04:56:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=3imUaQrnmWYuM8CT8NxcZA7QsJnGhiHw4xyk/4Ev0Is=;
 b=f1qvlDw4Gq4LN0dOiomrwae6GkRsUPM/JIFu//5mHxsUhSZdUVgW/+2UkOcdbdxhfuIy
 /EoKg1nGgwKVQQ2Ow7iXDQ/eHXNbD+pRxOS+XX7hp6WgQeYPiA7K3TvtVP/pU5K4/dKI
 Q/ArpDiG545TsfVyg3KKfVYB/lcF9MFM+o357TwSdADX2i7YjZyKWTyGy7B1BBHwJLDb
 4Peky9uJXzjKnYuai5/E8tLt857cuKJVNCXUn24gjk+GHF6mbMH5whGMQmS5Zh+pRjwz
 Kx7egpIbxd7Pa5P0mfVMlt/g1xk79TlnvNhQP3AoEzoDuqLPMw2zkMpoBO8DX69IwoT3 +Q== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r5v9d0h3s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Jun 2023 04:56:04 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35C2wE0q017353;
	Mon, 12 Jun 2023 04:56:02 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma03fra.de.ibm.com (PPS) with ESMTPS id 3r4gt50x89-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Jun 2023 04:56:02 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35C4twml44564882
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Jun 2023 04:55:58 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9AEED20043;
	Mon, 12 Jun 2023 04:55:58 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 33C3820040;
	Mon, 12 Jun 2023 04:55:57 +0000 (GMT)
Received: from li-3c92a0cc-27cf-11b2-a85c-b804d9ca68fa.in.ibm.com (unknown [9.109.199.72])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 12 Jun 2023 04:55:56 +0000 (GMT)
From: Aditya Gupta <adityag@linux.ibm.com>
To: linuxppc-dev@ozlabs.org, mpe@ellerman.id.au
Subject: [RFC PATCH 1/1] powerpc: update ppc_save_regs to save current r1 in pt_regs
Date: Mon, 12 Jun 2023 10:25:56 +0530
Message-Id: <20230612045556.17147-1-adityag@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: -nXTX27jvZTuI5UUIvGBks5ujWsRIYoI
X-Proofpoint-GUID: -nXTX27jvZTuI5UUIvGBks5ujWsRIYoI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-12_02,2023-06-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 spamscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 phishscore=0 impostorscore=0
 suspectscore=0 adultscore=0 mlxlogscore=730 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306120039
X-Mailman-Approved-At: Tue, 13 Jun 2023 05:57:01 +1000
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
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

ppc_save_regs() skips one stack frame while saving the CPU register states.
Instead of saving current R1, it pulls the previous stack frame pointer.

When vmcores caused by direct panic call (such as `echo c >
/proc/sysrq-trigger`), are debugged with gdb, gdb fails to show the
backtrace correctly. On further analysis, it was found that it was because
of mismatch between SP (r1) and NIP.

GDB uses NIP to get current function symbol and uses corresponding debug
info of that function to unwind previous frames, but due to the
mismatching SP and NIP, the unwinding does not work, and it fails to
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

The changes introduced here has an implication on xmon, that it will show
one extra `xmon` frame in backtrace. By looking at older commits it seems
that originally the ppc_save_regs function was introduced as
xmon_save_regs(). But now the same function has been renamed to
ppc_save_regs() and been used in few other places as well.

Is it still needed to skip one stack frame except if the caller is xmon() ?
If I am correct it was skipping one stack frame to avoid displaying xmon()
stack frame in backtrace. Please advice me if my understanding is correct or not.

---
 arch/powerpc/kernel/ppc_save_regs.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/ppc_save_regs.S b/arch/powerpc/kernel/ppc_save_regs.S
index 49813f982468..0caae1c8cf99 100644
--- a/arch/powerpc/kernel/ppc_save_regs.S
+++ b/arch/powerpc/kernel/ppc_save_regs.S
@@ -31,8 +31,8 @@ _GLOBAL(ppc_save_regs)
 	lbz	r0,PACAIRQSOFTMASK(r13)
 	PPC_STL	r0,SOFTE(r3)
 #endif
-	/* go up one stack frame for SP */
-	PPC_LL	r4,0(r1)
+	/* store current SP */
+	mr	r4,r1
 	PPC_STL	r4,GPR1(r3)
 	/* get caller's LR */
 	PPC_LL	r0,LRSAVE(r4)
-- 
2.40.1

