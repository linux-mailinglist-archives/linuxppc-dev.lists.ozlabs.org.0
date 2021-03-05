Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 127C632E3D6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 09:41:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DsLml0T5kz3dCF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 19:41:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DsLmQ2HZSz30Lw
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Mar 2021 19:40:50 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DsLmG1HhXz9tws2;
 Fri,  5 Mar 2021 09:40:46 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Qfa6vAzoH0fA; Fri,  5 Mar 2021 09:40:46 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DsLmF69Jdz9tws0;
 Fri,  5 Mar 2021 09:40:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E57F58B78D;
 Fri,  5 Mar 2021 09:40:46 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id vPt5UF7YwDZ3; Fri,  5 Mar 2021 09:40:46 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A0AEC8B78B;
 Fri,  5 Mar 2021 09:40:46 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 76F7B674E4; Fri,  5 Mar 2021 08:40:46 +0000 (UTC)
Message-Id: <f08ef2b6f339ba19987cfef4307a4dd26b2faf97.1614933479.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v3] powerpc/32: remove bogus ppc_select syscall
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Arnd Bergmann <arnd@arndb.de>
Date: Fri,  5 Mar 2021 08:40:46 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

The ppc_select function was introduced in linux-2.3.48 in order to support
code confusing the legacy select() calling convention with the standard one.
Even 24 years ago, all correctly built code should not have done this and
could have easily been phased out. Nothing that was compiled later should
actually try to use the old_select interface, and it would have been broken
already on all ppc64 kernels with the syscall emulation layer.

This patch brings the 32 bit compat ABI and the native 32 bit ABI for
powerpc into a consistent state, by removing support for both the
old_select system call number and the handler for it.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
[chleroy: Rebased and updated the number of years elapsed and dropped last part of the commit message]
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
First version was in 2008, at that time it was rejected, see
http://patchwork.ozlabs.org/project/linuxppc-dev/patch/200809240839.14902.arnd@arndb.de/
A reduced version of it was merged as commit dad2f2fb0fc7 ("powerpc: Fix wrong error code from ppc32 select syscall")

If we decide to still keep this, then we'll have to:
- take into account -4096 < fd < 0 case
- use unsafe_get_user inside a uaccess_begin block

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/asm-prototypes.h |  3 ---
 arch/powerpc/kernel/syscalls.c            | 25 -----------------------
 arch/powerpc/kernel/syscalls/syscall.tbl  |  4 +---
 3 files changed, 1 insertion(+), 31 deletions(-)

diff --git a/arch/powerpc/include/asm/asm-prototypes.h b/arch/powerpc/include/asm/asm-prototypes.h
index 939f3c94c8f3..78e0a3bd448a 100644
--- a/arch/powerpc/include/asm/asm-prototypes.h
+++ b/arch/powerpc/include/asm/asm-prototypes.h
@@ -63,9 +63,6 @@ long sys_swapcontext(struct ucontext __user *old_ctx,
 #ifdef CONFIG_PPC32
 long sys_debug_setcontext(struct ucontext __user *ctx,
 			  int ndbg, struct sig_dbg_op __user *dbg);
-int
-ppc_select(int n, fd_set __user *inp, fd_set __user *outp, fd_set __user *exp,
-	   struct __kernel_old_timeval __user *tvp);
 unsigned long __init early_init(unsigned long dt_ptr);
 void __init machine_init(u64 dt_ptr);
 #endif
diff --git a/arch/powerpc/kernel/syscalls.c b/arch/powerpc/kernel/syscalls.c
index 078608ec2e92..70b0eb5bedfd 100644
--- a/arch/powerpc/kernel/syscalls.c
+++ b/arch/powerpc/kernel/syscalls.c
@@ -71,31 +71,6 @@ SYSCALL_DEFINE6(mmap, unsigned long, addr, size_t, len,
 	return do_mmap2(addr, len, prot, flags, fd, offset, PAGE_SHIFT);
 }
 
-#ifdef CONFIG_PPC32
-/*
- * Due to some executables calling the wrong select we sometimes
- * get wrong args.  This determines how the args are being passed
- * (a single ptr to them all args passed) then calls
- * sys_select() with the appropriate args. -- Cort
- */
-int
-ppc_select(int n, fd_set __user *inp, fd_set __user *outp, fd_set __user *exp, struct __kernel_old_timeval __user *tvp)
-{
-	if ( (unsigned long)n >= 4096 )
-	{
-		unsigned long __user *buffer = (unsigned long __user *)n;
-		if (!access_ok(buffer, 5*sizeof(unsigned long))
-		    || __get_user(n, buffer)
-		    || __get_user(inp, ((fd_set __user * __user *)(buffer+1)))
-		    || __get_user(outp, ((fd_set  __user * __user *)(buffer+2)))
-		    || __get_user(exp, ((fd_set  __user * __user *)(buffer+3)))
-		    || __get_user(tvp, ((struct __kernel_old_timeval  __user * __user *)(buffer+4))))
-			return -EFAULT;
-	}
-	return sys_select(n, inp, outp, exp, tvp);
-}
-#endif
-
 #ifdef CONFIG_PPC64
 long ppc64_personality(unsigned long personality)
 {
diff --git a/arch/powerpc/kernel/syscalls/syscall.tbl b/arch/powerpc/kernel/syscalls/syscall.tbl
index 0b2480cf3e47..5bb0e90e502e 100644
--- a/arch/powerpc/kernel/syscalls/syscall.tbl
+++ b/arch/powerpc/kernel/syscalls/syscall.tbl
@@ -110,9 +110,7 @@
 79	common	settimeofday			sys_settimeofday		compat_sys_settimeofday
 80	common	getgroups			sys_getgroups
 81	common	setgroups			sys_setgroups
-82	32	select				ppc_select			sys_ni_syscall
-82	64	select				sys_ni_syscall
-82	spu	select				sys_ni_syscall
+82	common	select				sys_ni_syscall
 83	common	symlink				sys_symlink
 84	32	oldlstat			sys_lstat			sys_ni_syscall
 84	64	oldlstat			sys_ni_syscall
-- 
2.25.0

