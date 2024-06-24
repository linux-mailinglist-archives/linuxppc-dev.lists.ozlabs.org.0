Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 255B0915442
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2024 18:38:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FhTmssAm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W7DDb4zYsz3d9g
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2024 02:38:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FhTmssAm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W7DCD2Qz3z3d4F
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2024 02:37:28 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C662260DED;
	Mon, 24 Jun 2024 16:37:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B69CC32782;
	Mon, 24 Jun 2024 16:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719247046;
	bh=EwPpX0S1DTr+6EvIenNObE+xZCXTGGAFxEeI1J4w98A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FhTmssAmbe2m7XIZuY8gNTeVo+Lkit5BxwKeUJVUTZwbQDs+G38+66PslSvzLgbPX
	 5VKaiDIhlfUucsc4cjoE7TqvsIBTcMhplYbPShFl5s9bpnQzl7TNnyubJlrQWYBJtL
	 +/n0rSYNeyLLM8kjj7zO4V6y9CBf8tcSacuRTYHi/44G5yRnMmt4Ieqoj6GlBy9sPc
	 dZ2nLCKQKHprpGR0yeVZy2oKdDUOIcxuh6Y4DBO8vU3exBZJH7F0XMADo/asFimmTq
	 sKPNph/E2CBt9PEnVWdZ6rFALDcWj8IxJTdgWx9kRIgFVlh8ERnRYJV9VwZ/nU3ne/
	 suhAPd1WlO1Pw==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 01/13] ftruncate: pass a signed offset
Date: Mon, 24 Jun 2024 18:36:59 +0200
Message-Id: <20240624163707.299494-2-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240624163707.299494-1-arnd@kernel.org>
References: <20240624163707.299494-1-arnd@kernel.org>
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
Cc: Rich Felker <dalias@libc.org>, Andreas Larsson <andreas@gaisler.com>, Guo Ren <guoren@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, linux-sh@vger.kernel.org, linux-csky@vger.kernel.org, "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>, musl@lists.openwall.com, Nicholas Piggin <npiggin@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Brian Cain <bcain@quicinc.com>, Christian Brauner <brauner@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, libc-alpha@sourceware.org, linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org, stable@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

The old ftruncate() syscall, using the 32-bit off_t misses a sign
extension when called in compat mode on 64-bit architectures.  As a
result, passing a negative length accidentally succeeds in truncating
to file size between 2GiB and 4GiB.

Changing the type of the compat syscall to the signed compat_off_t
changes the behavior so it instead returns -EINVAL.

The native entry point, the truncate() syscall and the corresponding
loff_t based variants are all correct already and do not suffer
from this mistake.

Fixes: 3f6d078d4acc ("fix compat truncate/ftruncate")
Reviewed-by: Christian Brauner <brauner@kernel.org>
Cc: stable@vger.kernel.org
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 fs/open.c                | 4 ++--
 include/linux/compat.h   | 2 +-
 include/linux/syscalls.h | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/open.c b/fs/open.c
index 89cafb572061..50e45bc7c4d8 100644
--- a/fs/open.c
+++ b/fs/open.c
@@ -202,13 +202,13 @@ long do_sys_ftruncate(unsigned int fd, loff_t length, int small)
 	return error;
 }
 
-SYSCALL_DEFINE2(ftruncate, unsigned int, fd, unsigned long, length)
+SYSCALL_DEFINE2(ftruncate, unsigned int, fd, off_t, length)
 {
 	return do_sys_ftruncate(fd, length, 1);
 }
 
 #ifdef CONFIG_COMPAT
-COMPAT_SYSCALL_DEFINE2(ftruncate, unsigned int, fd, compat_ulong_t, length)
+COMPAT_SYSCALL_DEFINE2(ftruncate, unsigned int, fd, compat_off_t, length)
 {
 	return do_sys_ftruncate(fd, length, 1);
 }
diff --git a/include/linux/compat.h b/include/linux/compat.h
index 233f61ec8afc..56cebaff0c91 100644
--- a/include/linux/compat.h
+++ b/include/linux/compat.h
@@ -608,7 +608,7 @@ asmlinkage long compat_sys_fstatfs(unsigned int fd,
 asmlinkage long compat_sys_fstatfs64(unsigned int fd, compat_size_t sz,
 				     struct compat_statfs64 __user *buf);
 asmlinkage long compat_sys_truncate(const char __user *, compat_off_t);
-asmlinkage long compat_sys_ftruncate(unsigned int, compat_ulong_t);
+asmlinkage long compat_sys_ftruncate(unsigned int, compat_off_t);
 /* No generic prototype for truncate64, ftruncate64, fallocate */
 asmlinkage long compat_sys_openat(int dfd, const char __user *filename,
 				  int flags, umode_t mode);
diff --git a/include/linux/syscalls.h b/include/linux/syscalls.h
index 9104952d323d..ba9337709878 100644
--- a/include/linux/syscalls.h
+++ b/include/linux/syscalls.h
@@ -418,7 +418,7 @@ asmlinkage long sys_listmount(const struct mnt_id_req __user *req,
 			      u64 __user *mnt_ids, size_t nr_mnt_ids,
 			      unsigned int flags);
 asmlinkage long sys_truncate(const char __user *path, long length);
-asmlinkage long sys_ftruncate(unsigned int fd, unsigned long length);
+asmlinkage long sys_ftruncate(unsigned int fd, off_t length);
 #if BITS_PER_LONG == 32
 asmlinkage long sys_truncate64(const char __user *path, loff_t length);
 asmlinkage long sys_ftruncate64(unsigned int fd, loff_t length);
-- 
2.39.2

