Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFB5F47FC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2019 12:54:16 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 478dwP42kSzF1gQ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2019 22:54:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="0W3ESCLN"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 478dkH5MZ1zF6v0
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Nov 2019 22:45:27 +1100 (AEDT)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CB412222CB;
 Fri,  8 Nov 2019 11:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573213525;
 bh=fyEovHonIi28L8n/cm3MK/odCyRSRZIyQ7OjuLbLtdA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=0W3ESCLNEtHNQryRMtid4/fJg1Sz5w2nncdLqTihuLNx2ErR+I99wdsD6TLHkbd70
 YnStqrg/wvKQWAjMiPdjF3CMD/cFIGbVPisduNIU+qU7bmvx7NwNbawmugYvb+rA+x
 Stj7u7KOuuGEyu0ZM0tCcn2DUnXjzvDfQk4q0A7M=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 089/103] powerpc/vdso: Correct call frame
 information
Date: Fri,  8 Nov 2019 06:42:54 -0500
Message-Id: <20191108114310.14363-89-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191108114310.14363-1-sashal@kernel.org>
References: <20191108114310.14363-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Reza Arbab <arbab@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Alan Modra <amodra@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Alan Modra <amodra@gmail.com>

[ Upstream commit 56d20861c027498b5a1112b4f9f05b56d906fdda ]

Call Frame Information is used by gdb for back-traces and inserting
breakpoints on function return for the "finish" command.  This failed
when inside __kernel_clock_gettime.  More concerning than difficulty
debugging is that CFI is also used by stack frame unwinding code to
implement exceptions.  If you have an app that needs to handle
asynchronous exceptions for some reason, and you are unlucky enough to
get one inside the VDSO time functions, your app will crash.

What's wrong:  There is control flow in __kernel_clock_gettime that
reaches label 99 without saving lr in r12.  CFI info however is
interpreted by the unwinder without reference to control flow: It's a
simple matter of "Execute all the CFI opcodes up to the current
address".  That means the unwinder thinks r12 contains the return
address at label 99.  Disabuse it of that notion by resetting CFI for
the return address at label 99.

Note that the ".cfi_restore lr" could have gone anywhere from the
"mtlr r12" a few instructions earlier to the instruction at label 99.
I put the CFI as late as possible, because in general that's best
practice (and if possible grouped with other CFI in order to reduce
the number of CFI opcodes executed when unwinding).  Using r12 as the
return address is perfectly fine after the "mtlr r12" since r12 on
that code path still contains the return address.

__get_datapage also has a CFI error.  That function temporarily saves
lr in r0, and reflects that fact with ".cfi_register lr,r0".  A later
use of r0 means the CFI at that point isn't correct, as r0 no longer
contains the return address.  Fix that too.

Signed-off-by: Alan Modra <amodra@gmail.com>
Tested-by: Reza Arbab <arbab@linux.ibm.com>
Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/kernel/vdso32/datapage.S     | 1 +
 arch/powerpc/kernel/vdso32/gettimeofday.S | 1 +
 arch/powerpc/kernel/vdso64/datapage.S     | 1 +
 arch/powerpc/kernel/vdso64/gettimeofday.S | 1 +
 4 files changed, 4 insertions(+)

diff --git a/arch/powerpc/kernel/vdso32/datapage.S b/arch/powerpc/kernel/vdso32/datapage.S
index 3745113fcc652..2a7eb5452aba7 100644
--- a/arch/powerpc/kernel/vdso32/datapage.S
+++ b/arch/powerpc/kernel/vdso32/datapage.S
@@ -37,6 +37,7 @@ data_page_branch:
 	mtlr	r0
 	addi	r3, r3, __kernel_datapage_offset-data_page_branch
 	lwz	r0,0(r3)
+  .cfi_restore lr
 	add	r3,r0,r3
 	blr
   .cfi_endproc
diff --git a/arch/powerpc/kernel/vdso32/gettimeofday.S b/arch/powerpc/kernel/vdso32/gettimeofday.S
index 769c2624e0a6b..1e0bc5955a400 100644
--- a/arch/powerpc/kernel/vdso32/gettimeofday.S
+++ b/arch/powerpc/kernel/vdso32/gettimeofday.S
@@ -139,6 +139,7 @@ V_FUNCTION_BEGIN(__kernel_clock_gettime)
 	 */
 99:
 	li	r0,__NR_clock_gettime
+  .cfi_restore lr
 	sc
 	blr
   .cfi_endproc
diff --git a/arch/powerpc/kernel/vdso64/datapage.S b/arch/powerpc/kernel/vdso64/datapage.S
index abf17feffe404..bf96686915116 100644
--- a/arch/powerpc/kernel/vdso64/datapage.S
+++ b/arch/powerpc/kernel/vdso64/datapage.S
@@ -37,6 +37,7 @@ data_page_branch:
 	mtlr	r0
 	addi	r3, r3, __kernel_datapage_offset-data_page_branch
 	lwz	r0,0(r3)
+  .cfi_restore lr
 	add	r3,r0,r3
 	blr
   .cfi_endproc
diff --git a/arch/powerpc/kernel/vdso64/gettimeofday.S b/arch/powerpc/kernel/vdso64/gettimeofday.S
index 3820213248836..09b2a49f6dd53 100644
--- a/arch/powerpc/kernel/vdso64/gettimeofday.S
+++ b/arch/powerpc/kernel/vdso64/gettimeofday.S
@@ -124,6 +124,7 @@ V_FUNCTION_BEGIN(__kernel_clock_gettime)
 	 */
 99:
 	li	r0,__NR_clock_gettime
+  .cfi_restore lr
 	sc
 	blr
   .cfi_endproc
-- 
2.20.1

