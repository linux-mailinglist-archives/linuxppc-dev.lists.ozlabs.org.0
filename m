Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A9D480A86
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Dec 2021 15:50:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JNcs81LdPz3cDS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Dec 2021 01:50:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Y8VX7z++;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=guoren@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Y8VX7z++; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JNcgK0NDDz3cXM
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Dec 2021 01:41:49 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5FCF561243;
 Tue, 28 Dec 2021 14:41:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B94BAC36AF9;
 Tue, 28 Dec 2021 14:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640702506;
 bh=jNQktlKSGv8xnNW3G5VoaeCouZ9ErkTXEMdDXvXJzCg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Y8VX7z++eyT7d1Z58w9AEn7BiHErVnZ4xjYthApTxrFFTFs1RujEHBDYiPlv6KGCT
 NSOuKc1z4zTF/WKJAQ5CdcqMr889Volbo6a6KZzYjiEmsIlncceavINrhyUv1vD80y
 1NKUrbcvlzU3C7k8Yf0cBYgEvcc4OoE6R5oXuHmBaHAkz25rHVH5r6kvkJjfmquyNf
 d/F1WUR5g78u2QZfWQi6siErZMh4g2vcyVSg2zLjivatXJ/w8co4exJkvrQf/lPwT5
 fI49V2UhmojbN6wMAjTIW0GcKoSDbCeChHR1vu3ib4y+o2e+Jvl48YjxKpXfG4uVtf
 v05pnvmuH0Wqw==
From: guoren@kernel.org
To: guoren@kernel.org, palmer@dabbelt.com, arnd@arndb.de, anup.patel@wdc.com,
 gregkh@linuxfoundation.org, liush@allwinnertech.com, wefu@redhat.com,
 drew@beagleboard.org, wangjunqiang@iscas.ac.cn, hch@infradead.org
Subject: [PATCH V2 15/17] riscv: compat: ptrace: Add compat_arch_ptrace
 implement
Date: Tue, 28 Dec 2021 22:39:56 +0800
Message-Id: <20211228143958.3409187-16-guoren@kernel.org>
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

Now, you can use native gdb on riscv64 for rv32 app debugging.

$ uname -a
Linux buildroot 5.16.0-rc4-00036-gbef6b82fdf23-dirty #53 SMP Mon Dec 20 23:06:53 CST 2021 riscv64 GNU/Linux
$ cat /proc/cpuinfo
processor       : 0
hart            : 0
isa             : rv64imafdcsuh
mmu             : sv48

$ file /bin/busybox
/bin/busybox: setuid ELF 32-bit LSB shared object, UCB RISC-V, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-riscv32-ilp32d.so.1, for GNU/Linux 5.15.0, stripped
$ file /usr/bin/gdb
/usr/bin/gdb: ELF 32-bit LSB shared object, UCB RISC-V, version 1 (GNU/Linux), dynamically linked, interpreter /lib/ld-linux-riscv32-ilp32d.so.1, for GNU/Linux 5.15.0, stripped
$ /usr/bin/gdb /bin/busybox
GNU gdb (GDB) 10.2
Copyright (C) 2021 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
...
Reading symbols from /bin/busybox...
(No debugging symbols found in /bin/busybox)
(gdb) b main
Breakpoint 1 at 0x8ddc
(gdb) r
Starting program: /bin/busybox
Failed to read a valid object file image from memory.

Breakpoint 1, 0x555a8ddc in main ()
(gdb) i r
ra             0x77df0b74       0x77df0b74
sp             0x7fdd3d10       0x7fdd3d10
gp             0x5567e800       0x5567e800 <bb_common_bufsiz1+160>
tp             0x77f64280       0x77f64280
t0             0x0      0
t1             0x555a6fac       1431990188
t2             0x77dd8db4       2011008436
fp             0x7fdd3e34       0x7fdd3e34
s1             0x7fdd3e34       2145205812
a0             0xffffffff       -1
a1             0x2000   8192
a2             0x7fdd3e3c       2145205820
a3             0x0      0
a4             0x7fdd3d30       2145205552
a5             0x555a8dc0       1431997888
a6             0x77f2c170       2012397936
a7             0x6a7c7a2f       1786542639
s2             0x0      0
s3             0x0      0
s4             0x555a8dc0       1431997888
s5             0x77f8a3a8       2012783528
s6             0x7fdd3e3c       2145205820
s7             0x5567cecc       1432866508
--Type <RET> for more, q to quit, c to continue without paging--
s8             0x1      1
s9             0x0      0
s10            0x55634448       1432568904
s11            0x0      0
t3             0x77df0bb8       2011106232
t4             0x42fc   17148
t5             0x0      0
t6             0x40     64
pc             0x555a8ddc       0x555a8ddc <main+28>
(gdb) si
0x555a78f0 in mallopt@plt ()
(gdb) c
Continuing.
BusyBox v1.34.1 (2021-12-19 22:39:48 CST) multi-call binary.
BusyBox is copyrighted by many authors between 1998-2015.
Licensed under GPLv2. See source distribution for detailed
copyright notices.

Usage: busybox [function [arguments]...]
   or: busybox --list[-full]
...
[Inferior 1 (process 107) exited normally]
(gdb) q

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
---
 arch/riscv/kernel/ptrace.c | 87 +++++++++++++++++++++++++++++++++++---
 1 file changed, 82 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
index 9c0511119bad..76042ed861a3 100644
--- a/arch/riscv/kernel/ptrace.c
+++ b/arch/riscv/kernel/ptrace.c
@@ -12,6 +12,7 @@
 #include <asm/thread_info.h>
 #include <asm/switch_to.h>
 #include <linux/audit.h>
+#include <linux/compat.h>
 #include <linux/ptrace.h>
 #include <linux/elf.h>
 #include <linux/regset.h>
@@ -113,11 +114,6 @@ static const struct user_regset_view riscv_user_native_view = {
 	.n = ARRAY_SIZE(riscv_user_regset),
 };
 
-const struct user_regset_view *task_user_regset_view(struct task_struct *task)
-{
-	return &riscv_user_native_view;
-}
-
 struct pt_regs_offset {
 	const char *name;
 	int offset;
@@ -275,3 +271,84 @@ __visible void do_syscall_trace_exit(struct pt_regs *regs)
 		trace_sys_exit(regs, regs_return_value(regs));
 #endif
 }
+
+#ifdef CONFIG_COMPAT
+static int compat_riscv_gpr_get(struct task_struct *target,
+				const struct user_regset *regset,
+				struct membuf to)
+{
+	struct compat_user_regs_struct cregs;
+
+	regs_to_cregs(&cregs, task_pt_regs(target));
+
+	return membuf_write(&to, &cregs,
+			    sizeof(struct compat_user_regs_struct));
+}
+
+static int compat_riscv_gpr_set(struct task_struct *target,
+				const struct user_regset *regset,
+				unsigned int pos, unsigned int count,
+				const void *kbuf, const void __user *ubuf)
+{
+	int ret;
+	struct compat_user_regs_struct cregs;
+
+	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &cregs, 0, -1);
+
+	cregs_to_regs(&cregs, task_pt_regs(target));
+
+	return ret;
+}
+
+static const struct user_regset compat_riscv_user_regset[] = {
+	[REGSET_X] = {
+		.core_note_type = NT_PRSTATUS,
+		.n = ELF_NGREG,
+		.size = sizeof(compat_elf_greg_t),
+		.align = sizeof(compat_elf_greg_t),
+		.regset_get = compat_riscv_gpr_get,
+		.set = compat_riscv_gpr_set,
+	},
+#ifdef CONFIG_FPU
+	[REGSET_F] = {
+		.core_note_type = NT_PRFPREG,
+		.n = ELF_NFPREG,
+		.size = sizeof(elf_fpreg_t),
+		.align = sizeof(elf_fpreg_t),
+		.regset_get = riscv_fpr_get,
+		.set = riscv_fpr_set,
+	},
+#endif
+};
+
+static const struct user_regset_view compat_riscv_user_native_view = {
+	.name = "riscv",
+	.e_machine = EM_RISCV,
+	.regsets = compat_riscv_user_regset,
+	.n = ARRAY_SIZE(compat_riscv_user_regset),
+};
+
+long compat_arch_ptrace(struct task_struct *child, compat_long_t request,
+			compat_ulong_t caddr, compat_ulong_t cdata)
+{
+	long ret = -EIO;
+
+	switch (request) {
+	default:
+		ret = compat_ptrace_request(child, request, caddr, cdata);
+		break;
+	}
+
+	return ret;
+}
+#endif /* CONFIG_COMPAT */
+
+const struct user_regset_view *task_user_regset_view(struct task_struct *task)
+{
+#ifdef CONFIG_COMPAT
+	if (test_tsk_thread_flag(task, TIF_32BIT))
+		return &compat_riscv_user_native_view;
+	else
+#endif
+		return &riscv_user_native_view;
+}
-- 
2.25.1

