Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 784A0613945
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Oct 2022 15:48:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N1GH52rnBz3cLg
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Nov 2022 01:48:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nefkom.net (client-ip=212.18.0.10; helo=mail-out.m-online.net; envelope-from=whitebox@nefkom.net; receiver=<UNKNOWN>)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N1GGS0jlLz3bnZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Nov 2022 01:47:42 +1100 (AEDT)
Received: from frontend03.mail.m-online.net (unknown [192.168.6.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4N1GGK09sgz1sB7t;
	Mon, 31 Oct 2022 15:47:37 +0100 (CET)
Received: from localhost (dynscan3.mnet-online.de [192.168.6.84])
	by mail.m-online.net (Postfix) with ESMTP id 4N1GGJ6fj4z1qqlR;
	Mon, 31 Oct 2022 15:47:36 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan3.mail.m-online.net [192.168.6.84]) (amavisd-new, port 10024)
	with ESMTP id ESexz-kKEvGj; Mon, 31 Oct 2022 15:47:36 +0100 (CET)
X-Auth-Info: 4wpLRu7CQ6ZHCJ0eO5+lUzQd/Rl2XQs3I60gPFrKL2LlcSz6sDANNETxk5DsPGd0
Received: from igel.home (aftr-82-135-86-233.dynamic.mnet-online.de [82.135.86.233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Mon, 31 Oct 2022 15:47:36 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
	id DA5AE2C3598; Mon, 31 Oct 2022 15:47:35 +0100 (CET)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Rohan McLure <rmclure@linux.ibm.com>
Subject: [PATCH] powerpc/32: fix syscall wrappers with 64-bit arguments
References: <20220921065605.1051927-1-rmclure@linux.ibm.com>
	<20220921065605.1051927-22-rmclure@linux.ibm.com>
X-Yow: They don't hire PERSONAL PINHEADS, Mr. Toad!
Date: Mon, 31 Oct 2022 15:47:35 +0100
In-Reply-To: <20220921065605.1051927-22-rmclure@linux.ibm.com> (Rohan McLure's
	message of "Wed, 21 Sep 2022 16:56:01 +1000")
Message-ID: <87mt9cxd6g.fsf_-_@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linuxppc-dev@lists.ozlabs.org, Andrew Donnellan <ajd@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With the introducion of syscall wrappers all wrappers for syscalls with
64-bit arguments must be handled specially, not only those that have
unaligned 64-bit arguments.  This left out the fallocate and
sync_file_range2 syscalls.

Fixes: 7e92e01b7245 ("powerpc: Provide syscall wrapper")
Fixes: e23750623835 ("powerpc/32: fix syscall wrappers with 64-bit arguments of unaligned register-pairs")
Signed-off-by: Andreas Schwab <schwab@linux-m68k.org>
---
 arch/powerpc/include/asm/syscalls.h      |  7 +++++++
 arch/powerpc/kernel/sys_ppc32.c          | 13 ++++++++++++-
 arch/powerpc/kernel/syscalls/syscall.tbl |  7 +++++--
 3 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/syscalls.h b/arch/powerpc/include/asm/syscalls.h
index a1142496cd58..6d51b007b59e 100644
--- a/arch/powerpc/include/asm/syscalls.h
+++ b/arch/powerpc/include/asm/syscalls.h
@@ -104,6 +104,13 @@ long sys_ppc_ftruncate64(unsigned int fd, u32 reg4,
 			 unsigned long len1, unsigned long len2);
 long sys_ppc32_fadvise64(int fd, u32 unused, u32 offset1, u32 offset2,
 			 size_t len, int advice);
+long sys_ppc_sync_file_range2(int fd, unsigned int flags,
+			      unsigned int offset1,
+			      unsigned int offset2,
+			      unsigned int nbytes1,
+			      unsigned int nbytes2);
+long sys_ppc_fallocate(int fd, int mode, u32 offset1, u32 offset2,
+		       u32 len1, u32 len2);
 #endif
 #ifdef CONFIG_COMPAT
 long compat_sys_mmap2(unsigned long addr, size_t len,
diff --git a/arch/powerpc/kernel/sys_ppc32.c b/arch/powerpc/kernel/sys_ppc32.c
index 1ab4a4d95aba..d451a8229223 100644
--- a/arch/powerpc/kernel/sys_ppc32.c
+++ b/arch/powerpc/kernel/sys_ppc32.c
@@ -112,7 +112,7 @@ PPC32_SYSCALL_DEFINE6(ppc32_fadvise64,
 				 advice);
 }
 
-COMPAT_SYSCALL_DEFINE6(ppc_sync_file_range2,
+PPC32_SYSCALL_DEFINE6(ppc_sync_file_range2,
 		       int, fd, unsigned int, flags,
 		       unsigned int, offset1, unsigned int, offset2,
 		       unsigned int, nbytes1, unsigned int, nbytes2)
@@ -122,3 +122,14 @@ COMPAT_SYSCALL_DEFINE6(ppc_sync_file_range2,
 
 	return ksys_sync_file_range(fd, offset, nbytes, flags);
 }
+
+#ifdef CONFIG_PPC32
+SYSCALL_DEFINE6(ppc_fallocate,
+		int, fd, int, mode,
+		u32, offset1, u32, offset2, u32, len1, u32, len2)
+{
+	return ksys_fallocate(fd, mode,
+			      merge_64(offset1, offset2),
+			      merge_64(len1, len2));
+}
+#endif
diff --git a/arch/powerpc/kernel/syscalls/syscall.tbl b/arch/powerpc/kernel/syscalls/syscall.tbl
index e9e0df4f9a61..a0be127475b1 100644
--- a/arch/powerpc/kernel/syscalls/syscall.tbl
+++ b/arch/powerpc/kernel/syscalls/syscall.tbl
@@ -394,8 +394,11 @@
 305	common	signalfd			sys_signalfd			compat_sys_signalfd
 306	common	timerfd_create			sys_timerfd_create
 307	common	eventfd				sys_eventfd
-308	common	sync_file_range2		sys_sync_file_range2		compat_sys_ppc_sync_file_range2
-309	nospu	fallocate			sys_fallocate			compat_sys_fallocate
+308	32	sync_file_range2		sys_ppc_sync_file_range2	compat_sys_ppc_sync_file_range2
+308	64	sync_file_range2		sys_sync_file_range2
+308	spu	sync_file_range2		sys_sync_file_range2
+309	32	fallocate			sys_ppc_fallocate		compat_sys_fallocate
+309	64	fallocate			sys_fallocate
 310	nospu	subpage_prot			sys_subpage_prot
 311	32	timerfd_settime			sys_timerfd_settime32
 311	64	timerfd_settime			sys_timerfd_settime
-- 
2.38.1

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
