Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 542EC910D07
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2024 18:34:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Mgf3e1Fh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W4mKV0BpHz30T0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 02:34:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Mgf3e1Fh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W4m751ttMz3cVx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2024 02:25:21 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 46101621C5;
	Thu, 20 Jun 2024 16:25:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1817C32786;
	Thu, 20 Jun 2024 16:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718900719;
	bh=kDUL0eQ/6YSJ1bK+6Lr69ZdPp0RU2xbPAfoz6UW7TTg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Mgf3e1FhIJ34BxmZFn82Ln9S0Qv6QXhxwCJKDARqYjkFgu+PeLy+HbQQiPNlRIlpH
	 CJPg8GeMhGdXNWnFJ7rs6CxgQTJgS3aIOdECU1hUTPI3GTqq1wFPc1n7ygAUyYEwl9
	 +8r+PlwF95EJ6Ir8u8mktZFBaZpsQVlPwxTyDXM7TdcPf38yXtOg8ExYgy0jNH9ePX
	 1ViSkxDmMk4r4dOWXWQ9/QUe8Zx98JIfQyCBmd0SwBnHw1BZMRTpQwEpjMClIy+kE/
	 qhRXIrGZpKimne/UDkbRtj9V6uWojsT4fcxvIhFSPeJGeHucTaUEAfjbySdUDB53iI
	 PtNJzQd1HEs7A==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 15/15] linux/syscalls.h: add missing __user annotations
Date: Thu, 20 Jun 2024 18:23:16 +0200
Message-Id: <20240620162316.3674955-16-arnd@kernel.org>
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

A couple of declarations in linux/syscalls.h are missing __user
annotations on their pointers, which can lead to warnings from
sparse because these don't match the implementation that have
the correct address space annotations.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 include/linux/syscalls.h | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/include/linux/syscalls.h b/include/linux/syscalls.h
index ba9337709878..63424af87bba 100644
--- a/include/linux/syscalls.h
+++ b/include/linux/syscalls.h
@@ -322,13 +322,13 @@ asmlinkage long sys_io_pgetevents(aio_context_t ctx_id,
 				long nr,
 				struct io_event __user *events,
 				struct __kernel_timespec __user *timeout,
-				const struct __aio_sigset *sig);
+				const struct __aio_sigset __user *sig);
 asmlinkage long sys_io_pgetevents_time32(aio_context_t ctx_id,
 				long min_nr,
 				long nr,
 				struct io_event __user *events,
 				struct old_timespec32 __user *timeout,
-				const struct __aio_sigset *sig);
+				const struct __aio_sigset __user *sig);
 asmlinkage long sys_io_uring_setup(u32 entries,
 				struct io_uring_params __user *p);
 asmlinkage long sys_io_uring_enter(unsigned int fd, u32 to_submit,
@@ -441,7 +441,7 @@ asmlinkage long sys_fchown(unsigned int fd, uid_t user, gid_t group);
 asmlinkage long sys_openat(int dfd, const char __user *filename, int flags,
 			   umode_t mode);
 asmlinkage long sys_openat2(int dfd, const char __user *filename,
-			    struct open_how *how, size_t size);
+			    struct open_how __user *how, size_t size);
 asmlinkage long sys_close(unsigned int fd);
 asmlinkage long sys_close_range(unsigned int fd, unsigned int max_fd,
 				unsigned int flags);
@@ -555,7 +555,7 @@ asmlinkage long sys_get_robust_list(int pid,
 asmlinkage long sys_set_robust_list(struct robust_list_head __user *head,
 				    size_t len);
 
-asmlinkage long sys_futex_waitv(struct futex_waitv *waiters,
+asmlinkage long sys_futex_waitv(struct futex_waitv __user *waiters,
 				unsigned int nr_futexes, unsigned int flags,
 				struct __kernel_timespec __user *timeout, clockid_t clockid);
 
@@ -907,7 +907,7 @@ asmlinkage long sys_seccomp(unsigned int op, unsigned int flags,
 asmlinkage long sys_getrandom(char __user *buf, size_t count,
 			      unsigned int flags);
 asmlinkage long sys_memfd_create(const char __user *uname_ptr, unsigned int flags);
-asmlinkage long sys_bpf(int cmd, union bpf_attr *attr, unsigned int size);
+asmlinkage long sys_bpf(int cmd, union bpf_attr __user *attr, unsigned int size);
 asmlinkage long sys_execveat(int dfd, const char __user *filename,
 			const char __user *const __user *argv,
 			const char __user *const __user *envp, int flags);
@@ -960,11 +960,11 @@ asmlinkage long sys_cachestat(unsigned int fd,
 		struct cachestat_range __user *cstat_range,
 		struct cachestat __user *cstat, unsigned int flags);
 asmlinkage long sys_map_shadow_stack(unsigned long addr, unsigned long size, unsigned int flags);
-asmlinkage long sys_lsm_get_self_attr(unsigned int attr, struct lsm_ctx *ctx,
-				      u32 *size, u32 flags);
-asmlinkage long sys_lsm_set_self_attr(unsigned int attr, struct lsm_ctx *ctx,
+asmlinkage long sys_lsm_get_self_attr(unsigned int attr, struct lsm_ctx __user *ctx,
+				      u32 __user *size, u32 flags);
+asmlinkage long sys_lsm_set_self_attr(unsigned int attr, struct lsm_ctx __user *ctx,
 				      u32 size, u32 flags);
-asmlinkage long sys_lsm_list_modules(u64 *ids, u32 *size, u32 flags);
+asmlinkage long sys_lsm_list_modules(u64 __user *ids, u32 __user *size, u32 flags);
 
 /*
  * Architecture-specific system calls
-- 
2.39.2

