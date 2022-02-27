Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9484C5D71
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Feb 2022 17:33:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K68GV5pzgz3dw2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Feb 2022 03:33:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZB+qerge;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=guoren@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ZB+qerge; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K689Z5mpyz3bmT
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Feb 2022 03:29:38 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9DBEE60F6D;
 Sun, 27 Feb 2022 16:29:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3514BC36AE9;
 Sun, 27 Feb 2022 16:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645979377;
 bh=6RCP1MbfY3qIKsgFkltTUZn3CISwR+fj5txYEFK2Mmc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZB+qergeNaAtcIRdmQjiN3ERk7hONidVFAaYB+uslKLxlYxXyoJQ1/3Ep48QUT9ye
 GIvaUXzEUrTqejcpsWP8tL3ZghEwve1qmhukbZL6ZbYQwyPSSzR6kh3wwUvAsy4/91
 fqps5UhB9RjlW0Tb41gS/+z1NNGuF6Wjp76uORmnUcvSlZp6HLlQm1/ZAbqpItt4fP
 ssZ+laRViq2CL4N7BrmkisBfxqWz/VA65sC5xKzCDhgsS0CpMaGo31XEBAH8z1eXnk
 AyBEUgQcOy+skztkI8kaMeZpLo6WNmxme5g6kCXTpHcSkV/PPNFtSITprfVn/VMy0R
 zU/08pfx0PRjA==
From: guoren@kernel.org
To: guoren@kernel.org, palmer@dabbelt.com, arnd@arndb.de, anup@brainfault.org,
 gregkh@linuxfoundation.org, liush@allwinnertech.com, wefu@redhat.com,
 drew@beagleboard.org, wangjunqiang@iscas.ac.cn, hch@lst.de
Subject: [PATCH V7 07/20] syscalls: compat: Fix the missing part for
 __SYSCALL_COMPAT
Date: Mon, 28 Feb 2022 00:28:18 +0800
Message-Id: <20220227162831.674483-8-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220227162831.674483-1-guoren@kernel.org>
References: <20220227162831.674483-1-guoren@kernel.org>
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
 Guo Ren <guoren@linux.alibaba.com>, linux-parisc@vger.kernel.org,
 x86@kernel.org, linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Guo Ren <guoren@linux.alibaba.com>

Make "uapi asm unistd.h" could be used for architectures' COMPAT
mode. The __SYSCALL_COMPAT is first used in riscv.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 include/uapi/asm-generic/unistd.h       | 4 ++--
 tools/include/uapi/asm-generic/unistd.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/uapi/asm-generic/unistd.h b/include/uapi/asm-generic/unistd.h
index 1c48b0ae3ba3..45fa180cc56a 100644
--- a/include/uapi/asm-generic/unistd.h
+++ b/include/uapi/asm-generic/unistd.h
@@ -383,7 +383,7 @@ __SYSCALL(__NR_syslog, sys_syslog)
 
 /* kernel/ptrace.c */
 #define __NR_ptrace 117
-__SYSCALL(__NR_ptrace, sys_ptrace)
+__SC_COMP(__NR_ptrace, sys_ptrace, compat_sys_ptrace)
 
 /* kernel/sched/core.c */
 #define __NR_sched_setparam 118
@@ -779,7 +779,7 @@ __SYSCALL(__NR_rseq, sys_rseq)
 #define __NR_kexec_file_load 294
 __SYSCALL(__NR_kexec_file_load,     sys_kexec_file_load)
 /* 295 through 402 are unassigned to sync up with generic numbers, don't use */
-#if __BITS_PER_LONG == 32
+#if defined(__SYSCALL_COMPAT) || __BITS_PER_LONG == 32
 #define __NR_clock_gettime64 403
 __SYSCALL(__NR_clock_gettime64, sys_clock_gettime)
 #define __NR_clock_settime64 404
diff --git a/tools/include/uapi/asm-generic/unistd.h b/tools/include/uapi/asm-generic/unistd.h
index 1c48b0ae3ba3..45fa180cc56a 100644
--- a/tools/include/uapi/asm-generic/unistd.h
+++ b/tools/include/uapi/asm-generic/unistd.h
@@ -383,7 +383,7 @@ __SYSCALL(__NR_syslog, sys_syslog)
 
 /* kernel/ptrace.c */
 #define __NR_ptrace 117
-__SYSCALL(__NR_ptrace, sys_ptrace)
+__SC_COMP(__NR_ptrace, sys_ptrace, compat_sys_ptrace)
 
 /* kernel/sched/core.c */
 #define __NR_sched_setparam 118
@@ -779,7 +779,7 @@ __SYSCALL(__NR_rseq, sys_rseq)
 #define __NR_kexec_file_load 294
 __SYSCALL(__NR_kexec_file_load,     sys_kexec_file_load)
 /* 295 through 402 are unassigned to sync up with generic numbers, don't use */
-#if __BITS_PER_LONG == 32
+#if defined(__SYSCALL_COMPAT) || __BITS_PER_LONG == 32
 #define __NR_clock_gettime64 403
 __SYSCALL(__NR_clock_gettime64, sys_clock_gettime)
 #define __NR_clock_settime64 404
-- 
2.25.1

