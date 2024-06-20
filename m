Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3157E910CB2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2024 18:29:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mBOAGVRP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W4mD467zYz3cdV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 02:29:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mBOAGVRP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W4m6740tbz3cWr
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2024 02:24:31 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D16DD62097;
	Thu, 20 Jun 2024 16:24:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B879C2BD10;
	Thu, 20 Jun 2024 16:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718900670;
	bh=aE1IzWXJE8K8MWEf5402uO3TqcAk8oC7+4/q1IycgIY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mBOAGVRPDuIIDgzz9N9Wv9tq+6O7qehvtt3NqwZRKXAaX81ur91IhS/ySqZEVjXHH
	 8BNFcwQVOPD4kEHDjxawmwom1Bs6tusGWzCs9fCVUZ5OUF0O+OvH0CVa5kGnOTFmzL
	 GEI5mB0QcswRpgi+tdI9ziS4nTh/FR/VW8c0NX2qlhuCSCCrTcDCQVCXPAkfLukmZ5
	 NbYsw1oxfrsZ7X0U4eoXex0ehnrVGHOa2jbo8WScSWXnj3rfEAKY0S8c3gzpWgOSDy
	 tnXuUgL8P3jSsl4vGY4W7kZjzDQ42iBfVb9+jcuFzGcY1/joadJbP3jiKaE7bYpngQ
	 8HwoNYMbd4hYQ==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 08/15] powerpc: restore some missing spu syscalls
Date: Thu, 20 Jun 2024 18:23:09 +0200
Message-Id: <20240620162316.3674955-9-arnd@kernel.org>
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

A couple of system calls were inadventently removed from the table during
a bugfix for 32-bit powerpc entry. Restore the original behavior.

Fixes: e23750623835 ("powerpc/32: fix syscall wrappers with 64-bit arguments of unaligned register-pairs")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/powerpc/kernel/syscalls/syscall.tbl | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/kernel/syscalls/syscall.tbl b/arch/powerpc/kernel/syscalls/syscall.tbl
index c6b0546b284d..ebae8415dfbb 100644
--- a/arch/powerpc/kernel/syscalls/syscall.tbl
+++ b/arch/powerpc/kernel/syscalls/syscall.tbl
@@ -230,8 +230,10 @@
 178	nospu 	rt_sigsuspend			sys_rt_sigsuspend		compat_sys_rt_sigsuspend
 179	32	pread64				sys_ppc_pread64			compat_sys_ppc_pread64
 179	64	pread64				sys_pread64
+179	spu	pread64				sys_pread64
 180	32	pwrite64			sys_ppc_pwrite64		compat_sys_ppc_pwrite64
 180	64	pwrite64			sys_pwrite64
+180	spu	pwrite64			sys_pwrite64
 181	common	chown				sys_chown
 182	common	getcwd				sys_getcwd
 183	common	capget				sys_capget
@@ -246,6 +248,7 @@
 190	common	ugetrlimit			sys_getrlimit			compat_sys_getrlimit
 191	32	readahead			sys_ppc_readahead		compat_sys_ppc_readahead
 191	64	readahead			sys_readahead
+191	spu	readahead			sys_readahead
 192	32	mmap2				sys_mmap2			compat_sys_mmap2
 193	32	truncate64			sys_ppc_truncate64		compat_sys_ppc_truncate64
 194	32	ftruncate64			sys_ppc_ftruncate64		compat_sys_ppc_ftruncate64
@@ -293,6 +296,7 @@
 232	nospu	set_tid_address			sys_set_tid_address
 233	32	fadvise64			sys_ppc32_fadvise64		compat_sys_ppc32_fadvise64
 233	64	fadvise64			sys_fadvise64
+233	spu	fadvise64			sys_fadvise64
 234	nospu	exit_group			sys_exit_group
 235	nospu	lookup_dcookie			sys_ni_syscall
 236	common	epoll_create			sys_epoll_create
-- 
2.39.2

