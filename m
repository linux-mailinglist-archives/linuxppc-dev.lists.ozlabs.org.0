Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 08413516FC7
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 May 2022 14:51:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KsNHn6N8Pz3bgQ
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 May 2022 22:51:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Lag2Pu4m;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KsNH70bN8z305j
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 May 2022 22:50:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Lag2Pu4m; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KsNH36B17z4xdK;
 Mon,  2 May 2022 22:50:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1651495824;
 bh=4SOvCZWEq+k1ZjP70681Jv1lrZY62zxHK2iiysdmntE=;
 h=From:To:Cc:Subject:Date:From;
 b=Lag2Pu4mnVORGQRR0//asgBm9FKrXxf43fCJQyUrFWIF1OmSN17FTUVqzCyISRi3p
 fGrmR2Si3KKTfr7VdtfcsxJNgBjg0u0hLXR39mnb3xYktjxOQus13pOCZ4gAjDVNkA
 6P9aLfNQgjt33tZDt4zW5XGrAx2u8B/3+CJiQL8k6NLNWgalAgPiO7yehDz/RRygO/
 A3HKt4gRMIm5mpY7+5T1cbXfbwhfOoR61zG7AVi11v2i4mvYmcRS0tVp+AoLmT+Orx
 LAhCl+ykTaIh2JwAmZmPuYLLZSGh+TRVkLWoZp9nLE1KFnezsYFk1BCsjwjPukdQn6
 K6h/FZYhdkJug==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/vdso: Fix incorrect CFI in gettimeofday.S
Date: Mon,  2 May 2022 22:50:10 +1000
Message-Id: <20220502125010.1319370-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: amodra@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As reported by Alan, the CFI (Call Frame Information) in the VDSO time
routines is incorrect since commit ce7d8056e38b ("powerpc/vdso: Prepare
for switching VDSO to generic C implementation.").

In particular the changes to the frame address register (r1) are not
properly described, which prevents gdb from being able to generate a
backtrace from inside VDSO functions, eg:

  Breakpoint 1, 0x00007ffff7f804dc in __kernel_clock_gettime ()
  (gdb) bt
  #0  0x00007ffff7f804dc in __kernel_clock_gettime ()
  #1  0x00007ffff7d8872c in clock_gettime@@GLIBC_2.17 () from /lib64/libc.so.6
  #2  0x00007fffffffd960 in ?? ()
  #3  0x00007ffff7d8872c in clock_gettime@@GLIBC_2.17 () from /lib64/libc.so.6
  Backtrace stopped: frame did not save the PC

Alan helpfully describes some rules for correctly maintaining the CFI information:

  1) Every adjustment to the current frame address reg (ie. r1) must be
     described, and exactly at the instruction where r1 changes. Why?
     Because stack unwinding might want to access previous frames.
  2) If a function changes LR or any non-volatile register, the save
     location for those regs must be given. The cfi can be at any
     instruction after the saves up to the point that the reg is
     changed. (Exception: LR save should be described before a bl.)
  3) If asychronous unwind info is needed then restores of LR and
     non-volatile regs must also be described. The cfi can be at any
     instruction after the reg is restored up to the point where the
     save location is (potentially) trashed.

Fix the inability to backtrace by adding CFI directives describing the
changes to r1, ie. satisfying rule 1.

Also change the information for LR to point to the copy saved on the
stack, not the value in r0 that will be overwritten by the function
call.

Finally, add CFI directives describing the save/restore of r2.

With the fix gdb can correctly back trace and navigate up and down the stack:

  Breakpoint 1, 0x00007ffff7f804dc in __kernel_clock_gettime ()
  (gdb) bt
  #0  0x00007ffff7f804dc in __kernel_clock_gettime ()
  #1  0x00007ffff7d8872c in clock_gettime@@GLIBC_2.17 () from /lib64/libc.so.6
  #2  0x0000000100015b60 in gettime ()
  #3  0x000000010000c8bc in print_long_format ()
  #4  0x000000010000d180 in print_current_files ()
  #5  0x00000001000054ac in main ()
  (gdb) up
  #1  0x00007ffff7d8872c in clock_gettime@@GLIBC_2.17 () from /lib64/libc.so.6
  (gdb)
  #2  0x0000000100015b60 in gettime ()
  (gdb)
  #3  0x000000010000c8bc in print_long_format ()
  (gdb)
  #4  0x000000010000d180 in print_current_files ()
  (gdb)
  #5  0x00000001000054ac in main ()
  (gdb)
  Initial frame selected; you cannot go up.
  (gdb) down
  #4  0x000000010000d180 in print_current_files ()
  (gdb)
  #3  0x000000010000c8bc in print_long_format ()
  (gdb)
  #2  0x0000000100015b60 in gettime ()
  (gdb)
  #1  0x00007ffff7d8872c in clock_gettime@@GLIBC_2.17 () from /lib64/libc.so.6
  (gdb)
  #0  0x00007ffff7f804dc in __kernel_clock_gettime ()
  (gdb)

Fixes: ce7d8056e38b ("powerpc/vdso: Prepare for switching VDSO to generic C implementation.")
Cc: stable@vger.kernel.org # v5.11+
Reported-by: Alan Modra <amodra@gmail.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/vdso/gettimeofday.S | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

Alan proposed a larger patch that changed to a single stack frame, but it needs changes to
take into account the red zone.

Anyway for stable I'd prefer to just fix the CFI, we can rework the stack frame in a
subsequent patch.

diff --git a/arch/powerpc/kernel/vdso/gettimeofday.S b/arch/powerpc/kernel/vdso/gettimeofday.S
index eb9c81e1c218..0aee255e9cbb 100644
--- a/arch/powerpc/kernel/vdso/gettimeofday.S
+++ b/arch/powerpc/kernel/vdso/gettimeofday.S
@@ -22,12 +22,15 @@
 .macro cvdso_call funct call_time=0
   .cfi_startproc
 	PPC_STLU	r1, -PPC_MIN_STKFRM(r1)
+  .cfi_adjust_cfa_offset PPC_MIN_STKFRM
 	mflr		r0
-  .cfi_register lr, r0
 	PPC_STLU	r1, -PPC_MIN_STKFRM(r1)
+  .cfi_adjust_cfa_offset PPC_MIN_STKFRM
 	PPC_STL		r0, PPC_MIN_STKFRM + PPC_LR_STKOFF(r1)
+  .cfi_rel_offset lr, PPC_MIN_STKFRM + PPC_LR_STKOFF
 #ifdef __powerpc64__
 	PPC_STL		r2, PPC_MIN_STKFRM + STK_GOT(r1)
+  .cfi_rel_offset r2, PPC_MIN_STKFRM + STK_GOT
 #endif
 	get_datapage	r5
 	.ifeq	\call_time
@@ -39,6 +42,7 @@
 	PPC_LL		r0, PPC_MIN_STKFRM + PPC_LR_STKOFF(r1)
 #ifdef __powerpc64__
 	PPC_LL		r2, PPC_MIN_STKFRM + STK_GOT(r1)
+  .cfi_restore r2
 #endif
 	.ifeq	\call_time
 	cmpwi		r3, 0
@@ -46,6 +50,7 @@
 	mtlr		r0
   .cfi_restore lr
 	addi		r1, r1, 2 * PPC_MIN_STKFRM
+  .cfi_def_cfa_offset 0
 	crclr		so
 	.ifeq	\call_time
 	beqlr+
-- 
2.35.1

