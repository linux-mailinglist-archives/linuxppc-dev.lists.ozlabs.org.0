Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A42910CF5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2024 18:33:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=L4I6Oy4U;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W4mHx3ZwTz3cTL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 02:33:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=L4I6Oy4U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W4m6p5tqnz3cXW
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2024 02:25:06 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 29220CE2429;
	Thu, 20 Jun 2024 16:25:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3633C32786;
	Thu, 20 Jun 2024 16:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718900705;
	bh=cPi0ZjnBV1CIKlXBkpBvG5fVNflJ/ABQ595U6A2fdNY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L4I6Oy4U9Tj4R13eiK7pqNG2CXsWUIjkycJBnYKwfQOrvpBUldFWwHt5fforf8qGO
	 W7ImwPMXiKO8CaPCzUM0SFq2R8ogOIYhE4DzW2jwybln/I37fOpfNvMxVAVrrdaDoS
	 WUi8sCz8As8NoYFsujUNcySYE3BhqLiI+fdifQAzyfs9GESJFzoOrwAaRenVvMUVkG
	 XnNmh77sKBmccGcKyq697GncV2zjKoPPWOKYtfbRLPaDFIGaZyswOD5mh9kmoEczBR
	 MmqXf5vABoIwXanfGd9nvrIo6xDYMJfqhkmt6FUeNA/P7TOQqjAij0rew7x9s74LHq
	 xobiBExDOIVlg==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 13/15] syscalls: mmap(): use unsigned offset type consistently
Date: Thu, 20 Jun 2024 18:23:14 +0200
Message-Id: <20240620162316.3674955-14-arnd@kernel.org>
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
Cc: Rich Felker <dalias@libc.org>, Andreas Larsson <andreas@gaisler.com>, Guo Ren <guoren@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, linux-sh@vger.kernel.org, linux-csky@vger.kernel.org, "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>, musl@lists.openwall.com, Nicholas Piggin <npiggin@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, ltp@lists.linux.it, Brian Cain <bcain@quicinc.com>, Christian Brauner <brauner@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, libc-alpha@sourceware.org, linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

Most architectures that implement the old-style mmap() with byte offset
use 'unsigned long' as the type for that offset, but microblaze and
riscv have the off_t type that is shared with userspace, matching the
prototype in include/asm-generic/syscalls.h.

Make this consistent by using an unsigned argument everywhere. This
changes the behavior slightly, as the argument is shifted to a page
number, and an user input with the top bit set would result in a
negative page offset rather than a large one as we use elsewhere.

For riscv, the 32-bit sys_mmap2() definition actually used a custom
type that is different from the global declaration, but this was
missed due to an incorrect type check.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/csky/kernel/syscall.c              | 2 +-
 arch/loongarch/kernel/syscall.c         | 2 +-
 arch/microblaze/kernel/sys_microblaze.c | 2 +-
 arch/riscv/kernel/sys_riscv.c           | 4 ++--
 include/asm-generic/syscalls.h          | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/csky/kernel/syscall.c b/arch/csky/kernel/syscall.c
index 3d30e58a45d2..4540a271ee39 100644
--- a/arch/csky/kernel/syscall.c
+++ b/arch/csky/kernel/syscall.c
@@ -20,7 +20,7 @@ SYSCALL_DEFINE6(mmap2,
 	unsigned long, prot,
 	unsigned long, flags,
 	unsigned long, fd,
-	off_t, offset)
+	unsigned long, offset)
 {
 	if (unlikely(offset & (~PAGE_MASK >> 12)))
 		return -EINVAL;
diff --git a/arch/loongarch/kernel/syscall.c b/arch/loongarch/kernel/syscall.c
index b4c5acd7aa3b..8801611143ab 100644
--- a/arch/loongarch/kernel/syscall.c
+++ b/arch/loongarch/kernel/syscall.c
@@ -22,7 +22,7 @@
 #define __SYSCALL(nr, call)	[nr] = (call),
 
 SYSCALL_DEFINE6(mmap, unsigned long, addr, unsigned long, len, unsigned long,
-		prot, unsigned long, flags, unsigned long, fd, off_t, offset)
+		prot, unsigned long, flags, unsigned long, fd, unsigned long, offset)
 {
 	if (offset & ~PAGE_MASK)
 		return -EINVAL;
diff --git a/arch/microblaze/kernel/sys_microblaze.c b/arch/microblaze/kernel/sys_microblaze.c
index ed9f34da1a2a..0850b099f300 100644
--- a/arch/microblaze/kernel/sys_microblaze.c
+++ b/arch/microblaze/kernel/sys_microblaze.c
@@ -35,7 +35,7 @@
 
 SYSCALL_DEFINE6(mmap, unsigned long, addr, unsigned long, len,
 		unsigned long, prot, unsigned long, flags, unsigned long, fd,
-		off_t, pgoff)
+		unsigned long, pgoff)
 {
 	if (pgoff & ~PAGE_MASK)
 		return -EINVAL;
diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index 64155323cc92..d77afe05578f 100644
--- a/arch/riscv/kernel/sys_riscv.c
+++ b/arch/riscv/kernel/sys_riscv.c
@@ -23,7 +23,7 @@ static long riscv_sys_mmap(unsigned long addr, unsigned long len,
 #ifdef CONFIG_64BIT
 SYSCALL_DEFINE6(mmap, unsigned long, addr, unsigned long, len,
 	unsigned long, prot, unsigned long, flags,
-	unsigned long, fd, off_t, offset)
+	unsigned long, fd, unsigned long, offset)
 {
 	return riscv_sys_mmap(addr, len, prot, flags, fd, offset, 0);
 }
@@ -32,7 +32,7 @@ SYSCALL_DEFINE6(mmap, unsigned long, addr, unsigned long, len,
 #if defined(CONFIG_32BIT) || defined(CONFIG_COMPAT)
 SYSCALL_DEFINE6(mmap2, unsigned long, addr, unsigned long, len,
 	unsigned long, prot, unsigned long, flags,
-	unsigned long, fd, off_t, offset)
+	unsigned long, fd, unsigned long, offset)
 {
 	/*
 	 * Note that the shift for mmap2 is constant (12),
diff --git a/include/asm-generic/syscalls.h b/include/asm-generic/syscalls.h
index 933ca6581aba..fabcefe8a80a 100644
--- a/include/asm-generic/syscalls.h
+++ b/include/asm-generic/syscalls.h
@@ -19,7 +19,7 @@ asmlinkage long sys_mmap2(unsigned long addr, unsigned long len,
 #ifndef sys_mmap
 asmlinkage long sys_mmap(unsigned long addr, unsigned long len,
 			unsigned long prot, unsigned long flags,
-			unsigned long fd, off_t pgoff);
+			unsigned long fd, unsigned long off);
 #endif
 
 #ifndef sys_rt_sigreturn
-- 
2.39.2

