Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF6D70107
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jul 2019 15:31:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45sjDM4dWYzDqGL
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jul 2019 23:30:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45sj2r1CFnzDqM2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jul 2019 23:22:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 45sj2p5GbJz9s4Y; Mon, 22 Jul 2019 23:22:42 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 45sj2n4jwQz9s8m; Mon, 22 Jul 2019 23:22:41 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH] powerpc: Wire up clone3 syscall
Date: Mon, 22 Jul 2019 23:22:31 +1000
Message-Id: <20190722132231.10169-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.20.1
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
Cc: linux-kernel@vger.kernel.org, christian@brauner.io
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Wire up the new clone3 syscall added in commit 7f192e3cd316 ("fork:
add clone3").

This requires a ppc_clone3 wrapper, in order to save the non-volatile
GPRs before calling into the generic syscall code. Otherwise we hit
the BUG_ON in CHECK_FULL_REGS in copy_thread().

Lightly tested using Christian's test code on a Power8 LE VM.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/unistd.h        | 1 +
 arch/powerpc/kernel/entry_64.S           | 5 +++++
 arch/powerpc/kernel/syscalls/syscall.tbl | 1 +
 3 files changed, 7 insertions(+)

diff --git a/arch/powerpc/include/asm/unistd.h b/arch/powerpc/include/asm/unistd.h
index 68473c3c471c..b0720c7c3fcf 100644
--- a/arch/powerpc/include/asm/unistd.h
+++ b/arch/powerpc/include/asm/unistd.h
@@ -49,6 +49,7 @@
 #define __ARCH_WANT_SYS_FORK
 #define __ARCH_WANT_SYS_VFORK
 #define __ARCH_WANT_SYS_CLONE
+#define __ARCH_WANT_SYS_CLONE3
 
 #endif		/* __ASSEMBLY__ */
 #endif /* _ASM_POWERPC_UNISTD_H_ */
diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
index d9105fcf4021..0a0b5310f54a 100644
--- a/arch/powerpc/kernel/entry_64.S
+++ b/arch/powerpc/kernel/entry_64.S
@@ -487,6 +487,11 @@ _GLOBAL(ppc_clone)
 	bl	sys_clone
 	b	.Lsyscall_exit
 
+_GLOBAL(ppc_clone3)
+       bl      save_nvgprs
+       bl      sys_clone3
+       b       .Lsyscall_exit
+
 _GLOBAL(ppc32_swapcontext)
 	bl	save_nvgprs
 	bl	compat_sys_swapcontext
diff --git a/arch/powerpc/kernel/syscalls/syscall.tbl b/arch/powerpc/kernel/syscalls/syscall.tbl
index f2c3bda2d39f..6886ecb590d5 100644
--- a/arch/powerpc/kernel/syscalls/syscall.tbl
+++ b/arch/powerpc/kernel/syscalls/syscall.tbl
@@ -516,3 +516,4 @@
 432	common	fsmount				sys_fsmount
 433	common	fspick				sys_fspick
 434	common	pidfd_open			sys_pidfd_open
+435	common	clone3				ppc_clone3
-- 
2.20.1

