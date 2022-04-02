Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 490654F03AD
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Apr 2022 16:00:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KVzFt0krWz3c2Q
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Apr 2022 01:00:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YodB0m1y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=guoren@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=YodB0m1y; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KVz6X6R5jz3cjF
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  3 Apr 2022 00:54:12 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6411CB808CF;
 Sat,  2 Apr 2022 13:54:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51392C34114;
 Sat,  2 Apr 2022 13:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648907649;
 bh=ZNkWCPXxdSrDWWXuE5Nxyg7YyuzjK3uezwiP8YQQucE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YodB0m1yXVy9T5USGqpJca4K3pCwfydTPk1H6BAgMNMPTx/5zNGIi6EyGfe7rf9rc
 VXVBUzY/hen/52VhkdxbvxPGOjX0yCt2sQZ90voFK3A6vr+jPfyCF3mrvCByxpXq0P
 GoGnJEv4vIZbSIc6qknOWlD8Lyh3yvtO6/No05dBEx5xXChOnITiFO2m2h7C7Q6vz9
 aA9jX2jB+BJPu4dUybQJRjpXpgz0DucRFcxU2GVnC5sBTRZtTznczU/tlA52HTNk1m
 ewKjl+tpjqP7rRM5yOwuRvZirprgBw/KyfdHPTuksIdaXe/BuRCze1ScOZyewwd/+q
 ieOqPEKMwndtg==
From: guoren@kernel.org
To: guoren@kernel.org, palmer@dabbelt.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, hch@lst.de
Subject: [PATCH V11 11/20] riscv: compat: syscall: Add compat_sys_call_table
 implementation
Date: Sat,  2 Apr 2022 21:52:47 +0800
Message-Id: <20220402135256.2691868-12-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220402135256.2691868-1-guoren@kernel.org>
References: <20220402135256.2691868-1-guoren@kernel.org>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Guo Ren <guoren@linux.alibaba.com>, heiko@sntech.de,
 linux-parisc@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-mips@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Guo Ren <guoren@linux.alibaba.com>

Implement compat sys_call_table and some system call functions:
truncate64, ftruncate64, fallocate, pread64, pwrite64,
sync_file_range, readahead, fadvise64_64 which need argument
translation.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Tested-by: Heiko Stuebner <heiko@sntech.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
---
 arch/riscv/include/asm/syscall.h         |  1 +
 arch/riscv/include/asm/unistd.h          | 11 +++++++
 arch/riscv/include/uapi/asm/unistd.h     |  2 +-
 arch/riscv/kernel/Makefile               |  1 +
 arch/riscv/kernel/compat_syscall_table.c | 19 ++++++++++++
 arch/riscv/kernel/sys_riscv.c            |  6 ++--
 fs/open.c                                | 24 +++++++++++++++
 fs/read_write.c                          | 16 ++++++++++
 fs/sync.c                                |  9 ++++++
 include/asm-generic/compat.h             |  7 +++++
 include/linux/compat.h                   | 37 ++++++++++++++++++++++++
 mm/fadvise.c                             | 11 +++++++
 mm/readahead.c                           |  7 +++++
 13 files changed, 148 insertions(+), 3 deletions(-)
 create mode 100644 arch/riscv/kernel/compat_syscall_table.c

diff --git a/arch/riscv/include/asm/syscall.h b/arch/riscv/include/asm/syscall.h
index 7ac6a0e275f2..384a63b86420 100644
--- a/arch/riscv/include/asm/syscall.h
+++ b/arch/riscv/include/asm/syscall.h
@@ -16,6 +16,7 @@
 
 /* The array of function pointers for syscalls. */
 extern void * const sys_call_table[];
+extern void * const compat_sys_call_table[];
 
 /*
  * Only the low 32 bits of orig_r0 are meaningful, so we return int.
diff --git a/arch/riscv/include/asm/unistd.h b/arch/riscv/include/asm/unistd.h
index 6c316093a1e5..5ddac412b578 100644
--- a/arch/riscv/include/asm/unistd.h
+++ b/arch/riscv/include/asm/unistd.h
@@ -11,6 +11,17 @@
 #define __ARCH_WANT_SYS_CLONE
 #define __ARCH_WANT_MEMFD_SECRET
 
+#ifdef CONFIG_COMPAT
+#define __ARCH_WANT_COMPAT_TRUNCATE64
+#define __ARCH_WANT_COMPAT_FTRUNCATE64
+#define __ARCH_WANT_COMPAT_FALLOCATE
+#define __ARCH_WANT_COMPAT_PREAD64
+#define __ARCH_WANT_COMPAT_PWRITE64
+#define __ARCH_WANT_COMPAT_SYNC_FILE_RANGE
+#define __ARCH_WANT_COMPAT_READAHEAD
+#define __ARCH_WANT_COMPAT_FADVISE64_64
+#endif
+
 #include <uapi/asm/unistd.h>
 
 #define NR_syscalls (__NR_syscalls)
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
index ffc87e76b1dd..3b3e425aadd2 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -68,3 +68,4 @@ obj-$(CONFIG_CRASH_DUMP)	+= crash_dump.o
 obj-$(CONFIG_JUMP_LABEL)	+= jump_label.o
 
 obj-$(CONFIG_EFI)		+= efi.o
+obj-$(CONFIG_COMPAT)		+= compat_syscall_table.o
diff --git a/arch/riscv/kernel/compat_syscall_table.c b/arch/riscv/kernel/compat_syscall_table.c
new file mode 100644
index 000000000000..651f2b009c28
--- /dev/null
+++ b/arch/riscv/kernel/compat_syscall_table.c
@@ -0,0 +1,19 @@
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
diff --git a/fs/open.c b/fs/open.c
index 9ff2f621b760..b25613f7c0a7 100644
--- a/fs/open.c
+++ b/fs/open.c
@@ -224,6 +224,21 @@ SYSCALL_DEFINE2(ftruncate64, unsigned int, fd, loff_t, length)
 }
 #endif /* BITS_PER_LONG == 32 */
 
+#if defined(CONFIG_COMPAT) && defined(__ARCH_WANT_COMPAT_TRUNCATE64)
+COMPAT_SYSCALL_DEFINE3(truncate64, const char __user *, pathname,
+		       compat_arg_u64_dual(length))
+{
+	return ksys_truncate(pathname, compat_arg_u64_glue(length));
+}
+#endif
+
+#if defined(CONFIG_COMPAT) && defined(__ARCH_WANT_COMPAT_FTRUNCATE64)
+COMPAT_SYSCALL_DEFINE3(ftruncate64, unsigned int, fd,
+		       compat_arg_u64_dual(length))
+{
+	return ksys_ftruncate(fd, compat_arg_u64_glue(length));
+}
+#endif
 
 int vfs_fallocate(struct file *file, int mode, loff_t offset, loff_t len)
 {
@@ -339,6 +354,15 @@ SYSCALL_DEFINE4(fallocate, int, fd, int, mode, loff_t, offset, loff_t, len)
 	return ksys_fallocate(fd, mode, offset, len);
 }
 
+#if defined(CONFIG_COMPAT) && defined(__ARCH_WANT_COMPAT_FALLOCATE)
+COMPAT_SYSCALL_DEFINE6(fallocate, int, fd, int, mode, compat_arg_u64_dual(offset),
+		       compat_arg_u64_dual(len))
+{
+	return ksys_fallocate(fd, mode, compat_arg_u64_glue(offset),
+			      compat_arg_u64_glue(len));
+}
+#endif
+
 /*
  * access() needs to use the real uid/gid, not the effective uid/gid.
  * We do this by temporarily clearing all FS-related capabilities and
diff --git a/fs/read_write.c b/fs/read_write.c
index 0074afa7ecb3..548657c462e8 100644
--- a/fs/read_write.c
+++ b/fs/read_write.c
@@ -681,6 +681,14 @@ SYSCALL_DEFINE4(pread64, unsigned int, fd, char __user *, buf,
 	return ksys_pread64(fd, buf, count, pos);
 }
 
+#if defined(CONFIG_COMPAT) && defined(__ARCH_WANT_COMPAT_PREAD64)
+COMPAT_SYSCALL_DEFINE5(pread64, unsigned int, fd, char __user *, buf,
+		       size_t, count, compat_arg_u64_dual(pos))
+{
+	return ksys_pread64(fd, buf, count, compat_arg_u64_glue(pos));
+}
+#endif
+
 ssize_t ksys_pwrite64(unsigned int fd, const char __user *buf,
 		      size_t count, loff_t pos)
 {
@@ -707,6 +715,14 @@ SYSCALL_DEFINE4(pwrite64, unsigned int, fd, const char __user *, buf,
 	return ksys_pwrite64(fd, buf, count, pos);
 }
 
+#if defined(CONFIG_COMPAT) && defined(__ARCH_WANT_COMPAT_PWRITE64)
+COMPAT_SYSCALL_DEFINE5(pwrite64, unsigned int, fd, const char __user *, buf,
+		       size_t, count, compat_arg_u64_dual(pos))
+{
+	return ksys_pwrite64(fd, buf, count, compat_arg_u64_glue(pos));
+}
+#endif
+
 static ssize_t do_iter_readv_writev(struct file *filp, struct iov_iter *iter,
 		loff_t *ppos, int type, rwf_t flags)
 {
diff --git a/fs/sync.c b/fs/sync.c
index c7690016453e..dc725914e1ed 100644
--- a/fs/sync.c
+++ b/fs/sync.c
@@ -373,6 +373,15 @@ SYSCALL_DEFINE4(sync_file_range, int, fd, loff_t, offset, loff_t, nbytes,
 	return ksys_sync_file_range(fd, offset, nbytes, flags);
 }
 
+#if defined(CONFIG_COMPAT) && defined(__ARCH_WANT_COMPAT_SYNC_FILE_RANGE)
+COMPAT_SYSCALL_DEFINE6(sync_file_range, int, fd, compat_arg_u64_dual(offset),
+		       compat_arg_u64_dual(nbytes), unsigned int, flags)
+{
+	return ksys_sync_file_range(fd, compat_arg_u64_glue(offset),
+				    compat_arg_u64_glue(nbytes), flags);
+}
+#endif
+
 /* It would be nice if people remember that not all the world's an i386
    when they introduce new system calls */
 SYSCALL_DEFINE4(sync_file_range2, int, fd, unsigned int, flags,
diff --git a/include/asm-generic/compat.h b/include/asm-generic/compat.h
index 11653d6846cc..d06308a2a7a8 100644
--- a/include/asm-generic/compat.h
+++ b/include/asm-generic/compat.h
@@ -14,6 +14,13 @@
 #define COMPAT_OFF_T_MAX	0x7fffffff
 #endif
 
+#if !defined(compat_arg_u64) && !defined(CONFIG_CPU_BIG_ENDIAN)
+#define compat_arg_u64(name)		u32  name##_lo, u32  name##_hi
+#define compat_arg_u64_dual(name)	u32, name##_lo, u32, name##_hi
+#define compat_arg_u64_glue(name)	(((u64)name##_lo & 0xffffffffUL) | \
+					 ((u64)name##_hi << 32))
+#endif
+
 /* These types are common across all compat ABIs */
 typedef u32 compat_size_t;
 typedef s32 compat_ssize_t;
diff --git a/include/linux/compat.h b/include/linux/compat.h
index a0481fe6c5d5..ce6cd9b30d27 100644
--- a/include/linux/compat.h
+++ b/include/linux/compat.h
@@ -926,6 +926,43 @@ asmlinkage long compat_sys_sigaction(int sig,
 /* obsolete: net/socket.c */
 asmlinkage long compat_sys_socketcall(int call, u32 __user *args);
 
+#ifdef __ARCH_WANT_COMPAT_TRUNCATE64
+asmlinkage long compat_sys_truncate64(const char __user *pathname, compat_arg_u64(len));
+#endif
+
+#ifdef __ARCH_WANT_COMPAT_FTRUNCATE64
+asmlinkage long compat_sys_ftruncate64(unsigned int fd, compat_arg_u64(len));
+#endif
+
+#ifdef __ARCH_WANT_COMPAT_FALLOCATE
+asmlinkage long compat_sys_fallocate(int fd, int mode, compat_arg_u64(offset),
+				     compat_arg_u64(len));
+#endif
+
+#ifdef __ARCH_WANT_COMPAT_PREAD64
+asmlinkage long compat_sys_pread64(unsigned int fd, char __user *buf, size_t count,
+				   compat_arg_u64(pos));
+#endif
+
+#ifdef __ARCH_WANT_COMPAT_PWRITE64
+asmlinkage long compat_sys_pwrite64(unsigned int fd, const char __user *buf, size_t count,
+				    compat_arg_u64(pos));
+#endif
+
+#ifdef __ARCH_WANT_COMPAT_SYNC_FILE_RANGE
+asmlinkage long compat_sys_sync_file_range(int fd, compat_arg_u64(pos),
+					   compat_arg_u64(nbytes), unsigned int flags);
+#endif
+
+#ifdef __ARCH_WANT_COMPAT_FADVISE64_64
+asmlinkage long compat_sys_fadvise64_64(int fd, compat_arg_u64(pos),
+					compat_arg_u64(len), int advice);
+#endif
+
+#ifdef __ARCH_WANT_COMPAT_READAHEAD
+asmlinkage long compat_sys_readahead(int fd, compat_arg_u64(offset), size_t count);
+#endif
+
 #endif /* CONFIG_ARCH_HAS_SYSCALL_WRAPPER */
 
 /**
diff --git a/mm/fadvise.c b/mm/fadvise.c
index d6baa4f451c5..fe5b291681ea 100644
--- a/mm/fadvise.c
+++ b/mm/fadvise.c
@@ -215,5 +215,16 @@ SYSCALL_DEFINE4(fadvise64, int, fd, loff_t, offset, size_t, len, int, advice)
 	return ksys_fadvise64_64(fd, offset, len, advice);
 }
 
+#endif
+
+#if defined(CONFIG_COMPAT) && defined(__ARCH_WANT_COMPAT_FADVISE64_64)
+
+COMPAT_SYSCALL_DEFINE6(fadvise64_64, int, fd, compat_arg_u64_dual(offset),
+		       compat_arg_u64_dual(len), int, advice)
+{
+	return ksys_fadvise64_64(fd, compat_arg_u64_glue(offset),
+				 compat_arg_u64_glue(len), advice);
+}
+
 #endif
 #endif
diff --git a/mm/readahead.c b/mm/readahead.c
index cf0dcf89eb69..9adf57044299 100644
--- a/mm/readahead.c
+++ b/mm/readahead.c
@@ -640,6 +640,13 @@ SYSCALL_DEFINE3(readahead, int, fd, loff_t, offset, size_t, count)
 	return ksys_readahead(fd, offset, count);
 }
 
+#if defined(CONFIG_COMPAT) && defined(__ARCH_WANT_COMPAT_READAHEAD)
+COMPAT_SYSCALL_DEFINE4(readahead, int, fd, compat_arg_u64_dual(offset), size_t, count)
+{
+	return ksys_readahead(fd, compat_arg_u64_glue(offset), count);
+}
+#endif
+
 /**
  * readahead_expand - Expand a readahead request
  * @ractl: The request to be expanded
-- 
2.25.1

