Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5C7910CA3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2024 18:29:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cRy1c8+g;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W4mCJ5Qyjz3cfx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 02:29:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cRy1c8+g;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W4m604l9Sz3cX5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2024 02:24:24 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0238C621F8;
	Thu, 20 Jun 2024 16:24:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B740C2BD10;
	Thu, 20 Jun 2024 16:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718900663;
	bh=CXrlszEDPUQiYKtZ0u7pc0WChHdomqG0bc13oHOMYk8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cRy1c8+gzgzO1YmNYFn0xlU4/jPNcn/9MvwsPvAoPe7+0ERWB1jp/4Eg4SrYPfKQW
	 dCxbOu/gXMIqE1WRrm6G4NMNz7t3JWJ57na8ewDl991homE91hY2Y3XJ7fjtxJecwP
	 Z0ls7gy7/0cQaCVR+BfSxUjtZnsLGGh7q+ak0mQ9D7/e8CgHOIX2YIujd0ZuwccdAK
	 qgOlMp7UfU6xdGU8tsWYALGF509s2RqwNwr01W8ehfFbKfshH6UmIb9yP7CLjjIEtf
	 yU4JI3Alw+R/eT/X5xu84FD4G1b2AZ9URmrAprLqK37tETc9Dr0PtHUNggRkNu9Op0
	 cJXFcVyYlM6ng==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 07/15] parisc: use generic sys_fanotify_mark implementation
Date: Thu, 20 Jun 2024 18:23:08 +0200
Message-Id: <20240620162316.3674955-8-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240620162316.3674955-1-arnd@kernel.org>
References: <20240620162316.3674955-1-arnd@kernel.org>
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
Cc: Rich Felker <dalias@libc.org>, Andreas Larsson <andreas@gaisler.com>, Guo Ren <guoren@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, linux-sh@vger.kernel.org, linux-csky@vger.kernel.org, "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>, musl@lists.openwall.com, Nicholas Piggin <npiggin@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, ltp@lists.linux.it, Brian Cain <bcain@quicinc.com>, Christian Brauner <brauner@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, libc-alpha@sourceware.org, linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org, Adhemerval Zanella <adhemerval.zanella@linaro.org>, linux-hexagon@vger.kernel.org, linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

The sys_fanotify_mark() syscall on parisc uses the reverse word order
for the two halves of the 64-bit argument compared to all syscalls on
all 32-bit architectures. As far as I can tell, the problem is that
the function arguments on parisc are sorted backwards (26, 25, 24, 23,
...) compared to everyone else, so the calling conventions of using an
even/odd register pair in native word order result in the lower word
coming first in function arguments, matching the expected behavior
on little-endian architectures. The system call conventions however
ended up matching what the other 32-bit architectures do.

A glibc cleanup in 2020 changed the userspace behavior in a way that
handles all architectures consistently, but this inadvertently broke
parisc32 by changing to the same method as everyone else.

The change made it into glibc-2.35 and subsequently into debian 12
(bookworm), which is the latest stable release. This means we
need to choose between reverting the glibc change or changing the
kernel to match it again, but either hange will leave some systems
broken.

Pick the option that is more likely to help current and future
users and change the kernel to match current glibc. This also
means the behavior is now consistent across architectures, but
it breaks running new kernels with old glibc builds before 2.35.

Link: https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=d150181d73d9
Link: https://git.kernel.org/pub/scm/linux/kernel/git/history/history.git/commit/arch/parisc/kernel/sys_parisc.c?h=57b1dfbd5b4a39d
Cc: Adhemerval Zanella <adhemerval.zanella@linaro.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
I found this through code inspection, please double-check to make
sure I got the bug and the fix right.

The alternative is to fix this by reverting glibc back to the
unusual behavior.
---
 arch/parisc/Kconfig                     | 1 +
 arch/parisc/kernel/sys_parisc32.c       | 9 ---------
 arch/parisc/kernel/syscalls/syscall.tbl | 2 +-
 3 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index daafeb20f993..dc9b902de8ea 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -16,6 +16,7 @@ config PARISC
 	select ARCH_HAS_UBSAN
 	select ARCH_HAS_PTE_SPECIAL
 	select ARCH_NO_SG_CHAIN
+	select ARCH_SPLIT_ARG64 if !64BIT
 	select ARCH_SUPPORTS_HUGETLBFS if PA20
 	select ARCH_SUPPORTS_MEMORY_FAILURE
 	select ARCH_STACKWALK
diff --git a/arch/parisc/kernel/sys_parisc32.c b/arch/parisc/kernel/sys_parisc32.c
index 2a12a547b447..826c8e51b585 100644
--- a/arch/parisc/kernel/sys_parisc32.c
+++ b/arch/parisc/kernel/sys_parisc32.c
@@ -23,12 +23,3 @@ asmlinkage long sys32_unimplemented(int r26, int r25, int r24, int r23,
     	current->comm, current->pid, r20);
     return -ENOSYS;
 }
-
-asmlinkage long sys32_fanotify_mark(compat_int_t fanotify_fd, compat_uint_t flags,
-	compat_uint_t mask0, compat_uint_t mask1, compat_int_t dfd,
-	const char  __user * pathname)
-{
-	return sys_fanotify_mark(fanotify_fd, flags,
-			((__u64)mask1 << 32) | mask0,
-			 dfd, pathname);
-}
diff --git a/arch/parisc/kernel/syscalls/syscall.tbl b/arch/parisc/kernel/syscalls/syscall.tbl
index 39e67fab7515..66dc406b12e4 100644
--- a/arch/parisc/kernel/syscalls/syscall.tbl
+++ b/arch/parisc/kernel/syscalls/syscall.tbl
@@ -364,7 +364,7 @@
 320	common	accept4			sys_accept4
 321	common	prlimit64		sys_prlimit64
 322	common	fanotify_init		sys_fanotify_init
-323	common	fanotify_mark		sys_fanotify_mark		sys32_fanotify_mark
+323	common	fanotify_mark		sys_fanotify_mark		compat_sys_fanotify_mark
 324	32	clock_adjtime		sys_clock_adjtime32
 324	64	clock_adjtime		sys_clock_adjtime
 325	common	name_to_handle_at	sys_name_to_handle_at
-- 
2.39.2

