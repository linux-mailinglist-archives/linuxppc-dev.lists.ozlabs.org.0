Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7DF30B152
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Feb 2021 21:07:17 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DTzW219NVzDrvG
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Feb 2021 07:07:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=raoni@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=T9uSv7Tm; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DTzSv2x7rzDr3V
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Feb 2021 07:05:19 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 111K2G4a097712; Mon, 1 Feb 2021 15:05:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : mime-version : content-type; s=pp1;
 bh=ULdOemOg4PEnXZk2kuUlz2YazOcNlbB8x5li5xiOgNM=;
 b=T9uSv7TmyogtXBoBtJ6Ig3xLAtbfW27/Xhn2SqrIKj1XDrNxGDy/9oZfM9tAWZvL+k4q
 2q64nOjl8M31DOCMEE1DE1KpQYaSrEy+d58FxN3GOtcGFVrwohyOnqkn1+FZ07Rb9F5x
 S5WNmdJK4RVzuf21zJSbJfn5GnhygmkAO0gI9EncCSG5+34gYfCRiti99j56qX/XJvtz
 YhEecZIi0Yv94hXXfQei4BrA4wWzjWY7fmDuCoQdB0jwep+WcL9CJJgW5QzTjO3hrZei
 XtDqpkau7vxhlQmGxkxre+kzUMIjJqVD4DNKHk86lJcUa5ZT/vlAsoFSqZD+Zb+znzuL LA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36eqqw11yv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Feb 2021 15:05:12 -0500
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 111K2nvG099708;
 Mon, 1 Feb 2021 15:05:11 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36eqqw11y1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Feb 2021 15:05:11 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 111K22Kt016358;
 Mon, 1 Feb 2021 20:05:10 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma04dal.us.ibm.com with ESMTP id 36er4cg3pq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Feb 2021 20:05:10 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 111K598127656534
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 1 Feb 2021 20:05:09 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0C0CF7805F;
 Mon,  1 Feb 2021 20:05:09 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 01EC97805C;
 Mon,  1 Feb 2021 20:05:07 +0000 (GMT)
Received: from work-tp (unknown [9.65.197.147])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Mon,  1 Feb 2021 20:05:07 +0000 (GMT)
Date: Mon, 1 Feb 2021 17:05:05 -0300
From: Raoni Fassina Firmino <raoni@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/64/signal: Fix regression in __kernel_sigtramp_rt64
 semantics
Message-ID: <20210201200505.iz46ubcizipnkcxe@work-tp>
Mail-Followup-To: linuxppc-dev@lists.ozlabs.org,
 Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-01_08:2021-01-29,
 2021-02-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999
 adultscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1011
 lowpriorityscore=0 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102010103
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Tested on powerpc64 and powerpc64le, with a glibc build and running the
affected glibc's testcase[2], inspected that glibc's backtrace() now gives
the correct result and gdb backtrace also keeps working as before.

I believe this should be backported to releases 5.9 and 5.10 as userspace
is affected in this releases.

---- 8< ----

A Change[1] in __kernel_sigtramp_rt64 VDSO and trampoline code introduced a
regression in the way glibc's backtrace()[2] detects the signal-handler
stack frame.  Apart from the practical implications, __kernel_sigtram_rt64
was a VDSO with the semantics that it is a function you can call from
userspace to end a signal handling.  Now this semantics are no longer
valid.

I believe the aforementioned change affects all releases since 5.9.

This patch tries to fix both the semantics and practical aspect of
__kernel_sigtramp_rt64 returning it to the previous code, whilst keeping
the intended behavior from[1] by adding a new symbol to serve as the jump
target from the kernel to the trampoline. Now the trampoline has two parts,
an new entry point and the old return point.

[1] commit 0138ba5783ae0dcc799ad401a1e8ac8333790df9 ("powerpc/64/signal:
    Balance return predictor stack in signal trampoline")
[2] https://lists.ozlabs.org/pipermail/linuxppc-dev/2021-January/223194.html

Fixes: 0138ba5783ae ("powerpc/64/signal: Balance return predictor stack in signal trampoline")
Signed-off-by: Raoni Fassina Firmino <raoni@linux.ibm.com>
---
 arch/powerpc/kernel/vdso64/sigtramp.S   | 9 ++++++++-
 arch/powerpc/kernel/vdso64/vdso64.lds.S | 2 +-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/vdso64/sigtramp.S b/arch/powerpc/kernel/vdso64/sigtramp.S
index bbf68cd01088..f0fd8d2a9fc4 100644
--- a/arch/powerpc/kernel/vdso64/sigtramp.S
+++ b/arch/powerpc/kernel/vdso64/sigtramp.S
@@ -15,11 +15,18 @@
 
 	.text
 
+/* __kernel_start_sigtramp_rt64 and __kernel_sigtramp_rt64 together
+   are one function split in two parts. The kernel jumps to the former
+   and the signal handler indirectly (by blr) returns to the latter.
+   __kernel_sigtramp_rt64 needs to point to the return address so
+   glibc can correctly identify the trampoline stack frame.  */
 	.balign 8
 	.balign IFETCH_ALIGN_BYTES
-V_FUNCTION_BEGIN(__kernel_sigtramp_rt64)
+V_FUNCTION_BEGIN(__kernel_start_sigtramp_rt64)
 .Lsigrt_start:
 	bctrl	/* call the handler */
+V_FUNCTION_END(__kernel_start_sigtramp_rt64)
+V_FUNCTION_BEGIN(__kernel_sigtramp_rt64)
 	addi	r1, r1, __SIGNAL_FRAMESIZE
 	li	r0,__NR_rt_sigreturn
 	sc
diff --git a/arch/powerpc/kernel/vdso64/vdso64.lds.S b/arch/powerpc/kernel/vdso64/vdso64.lds.S
index 6164d1a1ba11..2f3c359cacd3 100644
--- a/arch/powerpc/kernel/vdso64/vdso64.lds.S
+++ b/arch/powerpc/kernel/vdso64/vdso64.lds.S
@@ -131,4 +131,4 @@ VERSION
 /*
  * Make the sigreturn code visible to the kernel.
  */
-VDSO_sigtramp_rt64	= __kernel_sigtramp_rt64;
+VDSO_sigtramp_rt64	= __kernel_start_sigtramp_rt64;

base-commit: 76c057c84d286140c6c416c3b4ba832cd1d8984e
-- 
2.26.2

