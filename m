Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECA1480A7A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Dec 2021 15:46:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JNcmc1HQ4z3cnB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Dec 2021 01:46:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pplymMPj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=guoren@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=pplymMPj; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JNcfc2Vgfz3cH2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Dec 2021 01:41:12 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 062EAB811BD;
 Tue, 28 Dec 2021 14:41:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6507EC36AEC;
 Tue, 28 Dec 2021 14:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640702468;
 bh=/zz4kcfUsjWXJ1LptyJSPeLGNSqvvgEEHmcGFJCbGl4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pplymMPjBmBBH049ZPhADqf4uBaSqsT7g8ZxaxlUA7aAAD00o9wjd7pWlYf5knWdO
 Xvd7EiUynaLapOw2m/FKYmRQEC07ujuErOZqzaBVjUKL/KbfHLOyeWfCykbbf+anPF
 dddHGxOH1TxUHazo7cqzt8AOrzF6WVO3G+77YOH2Kjo2WUM6sM7DUmzIdCxZU7PHzY
 9zlpz7aAI8fTnTPwOHIhhrpa/x31t85zuEFRB2O3XyCptJ5SIan9NpNSXlfTNsT6Nu
 IKYObMDfrni9oqrS+/N2d0oJI097RvGTDaAGfALJaiMPGcbX+QlpB+i8cgTdNPyGMz
 y0koOIF0254hg==
From: guoren@kernel.org
To: guoren@kernel.org, palmer@dabbelt.com, arnd@arndb.de, anup.patel@wdc.com,
 gregkh@linuxfoundation.org, liush@allwinnertech.com, wefu@redhat.com,
 drew@beagleboard.org, wangjunqiang@iscas.ac.cn, hch@infradead.org
Subject: [PATCH V2 09/17] riscv: compat: syscall: Add compat_sys_call_table
 implementation
Date: Tue, 28 Dec 2021 22:39:50 +0800
Message-Id: <20211228143958.3409187-10-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211228143958.3409187-1-guoren@kernel.org>
References: <20211228143958.3409187-1-guoren@kernel.org>
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
Cc: linux-s390@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 inux-parisc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Guo Ren <guoren@linux.alibaba.com>

Implement compat_syscall_table.c with compat_sys_call_table & fixup
system call such as truncate64,pread64,fallocate which need two
regs to indicate 64bit-arg (copied from arm64).

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
---
 arch/riscv/include/asm/syscall.h         |  3 +
 arch/riscv/include/uapi/asm/unistd.h     |  2 +-
 arch/riscv/kernel/Makefile               |  1 +
 arch/riscv/kernel/compat_syscall_table.c | 72 ++++++++++++++++++++++++
 arch/riscv/kernel/sys_riscv.c            |  6 +-
 5 files changed, 81 insertions(+), 3 deletions(-)
 create mode 100644 arch/riscv/kernel/compat_syscall_table.c

diff --git a/arch/riscv/include/asm/syscall.h b/arch/riscv/include/asm/syscall.h
index 7ac6a0e275f2..4ff98a22ef24 100644
--- a/arch/riscv/include/asm/syscall.h
+++ b/arch/riscv/include/asm/syscall.h
@@ -16,6 +16,9 @@
 
 /* The array of function pointers for syscalls. */
 extern void * const sys_call_table[];
+#ifdef CONFIG_COMPAT
+extern void * const compat_sys_call_table[];
+#endif
 
 /*
  * Only the low 32 bits of orig_r0 are meaningful, so we return int.
diff --git a/arch/riscv/include/uapi/asm/unistd.h b/arch/riscv/include/uapi/asm/unistd.h
index 8062996c2dfd..c9e50eed14aa 100644
--- a/arch/riscv/include/uapi/asm/unistd.h
+++ b/arch/riscv/include/uapi/asm/unistd.h
@@ -15,7 +15,7 @@
  * along with this program.  If not, see <https://www.gnu.org/licenses/>.
  */
 
-#ifdef __LP64__
+#if defined(__LP64__) && !defined(__SYSCALL_COMPAT)
 #define __ARCH_WANT_NEW_STAT
 #define __ARCH_WANT_SET_GET_RLIMIT
 #endif /* __LP64__ */
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index 3397ddac1a30..1f2111179615 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -65,3 +65,4 @@ obj-$(CONFIG_CRASH_DUMP)	+= crash_dump.o
 obj-$(CONFIG_JUMP_LABEL)	+= jump_label.o
 
 obj-$(CONFIG_EFI)		+= efi.o
+obj-$(CONFIG_COMPAT)		+= compat_syscall_table.o
diff --git a/arch/riscv/kernel/compat_syscall_table.c b/arch/riscv/kernel/compat_syscall_table.c
new file mode 100644
index 000000000000..53905947678e
--- /dev/null
+++ b/arch/riscv/kernel/compat_syscall_table.c
@@ -0,0 +1,72 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#define __SYSCALL_COMPAT
+
+#include <linux/compat.h>
+#include <linux/syscalls.h>
+#include <asm-generic/mman-common.h>
+#include <asm-generic/syscalls.h>
+#include <asm/syscall.h>
+
+#define arg_u32p(name)  u32, name##_lo, u32, name##_hi
+
+#define arg_u64(name)   (((u64)name##_hi << 32) | \
+			 ((u64)name##_lo & 0xffffffff))
+
+COMPAT_SYSCALL_DEFINE3(truncate64, const char __user *, pathname,
+		       arg_u32p(length))
+{
+	return ksys_truncate(pathname, arg_u64(length));
+}
+
+COMPAT_SYSCALL_DEFINE3(ftruncate64, unsigned int, fd, arg_u32p(length))
+{
+	return ksys_ftruncate(fd, arg_u64(length));
+}
+
+COMPAT_SYSCALL_DEFINE6(fallocate, int, fd, int, mode,
+		       arg_u32p(offset), arg_u32p(len))
+{
+	return ksys_fallocate(fd, mode, arg_u64(offset), arg_u64(len));
+}
+
+COMPAT_SYSCALL_DEFINE5(pread64, unsigned int, fd, char __user *, buf,
+		       size_t, count, arg_u32p(pos))
+{
+	return ksys_pread64(fd, buf, count, arg_u64(pos));
+}
+
+COMPAT_SYSCALL_DEFINE5(pwrite64, unsigned int, fd,
+		       const char __user *, buf, size_t, count, arg_u32p(pos))
+{
+	return ksys_pwrite64(fd, buf, count, arg_u64(pos));
+}
+
+COMPAT_SYSCALL_DEFINE6(sync_file_range, int, fd, arg_u32p(offset),
+		       arg_u32p(nbytes), unsigned int, flags)
+{
+	return ksys_sync_file_range(fd, arg_u64(offset), arg_u64(nbytes),
+				    flags);
+}
+
+COMPAT_SYSCALL_DEFINE4(readahead, int, fd, arg_u32p(offset),
+		       size_t, count)
+{
+	return ksys_readahead(fd, arg_u64(offset), count);
+}
+
+COMPAT_SYSCALL_DEFINE6(fadvise64_64, int, fd, int, advice, arg_u32p(offset),
+		       arg_u32p(len))
+{
+	return ksys_fadvise64_64(fd, arg_u64(offset), arg_u64(len), advice);
+}
+
+#undef __SYSCALL
+#define __SYSCALL(nr, call)      [nr] = (call),
+
+asmlinkage long compat_sys_rt_sigreturn(void);
+
+void * const compat_sys_call_table[__NR_syscalls] = {
+	[0 ... __NR_syscalls - 1] = sys_ni_syscall,
+#include <asm/unistd.h>
+};
diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index 12f8a7fce78b..9c0194f176fc 100644
--- a/arch/riscv/kernel/sys_riscv.c
+++ b/arch/riscv/kernel/sys_riscv.c
@@ -33,7 +33,9 @@ SYSCALL_DEFINE6(mmap, unsigned long, addr, unsigned long, len,
 {
 	return riscv_sys_mmap(addr, len, prot, flags, fd, offset, 0);
 }
-#else
+#endif
+
+#if defined(CONFIG_32BIT) || defined(CONFIG_COMPAT)
 SYSCALL_DEFINE6(mmap2, unsigned long, addr, unsigned long, len,
 	unsigned long, prot, unsigned long, flags,
 	unsigned long, fd, off_t, offset)
@@ -44,7 +46,7 @@ SYSCALL_DEFINE6(mmap2, unsigned long, addr, unsigned long, len,
 	 */
 	return riscv_sys_mmap(addr, len, prot, flags, fd, offset, 12);
 }
-#endif /* !CONFIG_64BIT */
+#endif
 
 /*
  * Allows the instruction cache to be flushed from userspace.  Despite RISC-V
-- 
2.25.1

