Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 098C191547F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2024 18:40:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Z3DnvLLc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W7DGw46bMz3cnS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2024 02:40:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Z3DnvLLc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W7DCb2vY9z3cnr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2024 02:37:47 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6FEBD60DF4;
	Mon, 24 Jun 2024 16:37:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19789C2BBFC;
	Mon, 24 Jun 2024 16:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719247066;
	bh=AKNrHrEDw/bOnYoPf4j9KvT8uWTmJp8Ho7k3J75gm1Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z3DnvLLc0S3GDRh3Z3wU5ZaNTSEq+Wn2OrANNDixcoxujOHJUblDqHp+j6VCBNW1T
	 mvuxtORUuCQURYccrvxC9ZYbYwlu/26UrmO5YasM169534CzY8mwsOnjNCsju5R9z2
	 rOg58WNim2TMX5NAQrJwuI301BMZoV8DAzwNodYmbQBuTOfnt/WTVpP+aAg9E1Rwvm
	 PrbVg9UBJrkQ2zzzqnlnkasEj8BMfzMZlz/9zaceBI7TiKJZPIuVgnnQBKJTVrODGy
	 JIu0U3y9CR5YjDOfe1VfCTaXJWvqXRBtSMiag9JJhH5qlkQlNCdVFNXPK3rOCkYq8F
	 FFz2CZeoXesOA==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/13] sparc: fix compat recv/recvfrom syscalls
Date: Mon, 24 Jun 2024 18:37:02 +0200
Message-Id: <20240624163707.299494-5-arnd@kernel.org>
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
Cc: Rich Felker <dalias@libc.org>, Andreas Larsson <andreas@gaisler.com>, Guo Ren <guoren@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, linux-sh@vger.kernel.org, linux-csky@vger.kernel.org, "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>, musl@lists.openwall.com, Nicholas Piggin <npiggin@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Brian Cain <bcain@quicinc.com>, Christian Brauner <brauner@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, libc-alpha@sourceware.org, linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

sparc has the wrong compat version of recv() and recvfrom() for both the
direct syscalls and socketcall().

The direct syscalls just need to use the compat version. For socketcall,
the same thing could be done, but it seems better to completely remove
the custom assembler code for it and just use the same implementation that
everyone else has.

Fixes: 1dacc76d0014 ("net/compat/wext: send different messages to compat tasks")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/sparc/kernel/sys32.S              | 221 -------------------------
 arch/sparc/kernel/syscalls/syscall.tbl |   4 +-
 2 files changed, 2 insertions(+), 223 deletions(-)

diff --git a/arch/sparc/kernel/sys32.S b/arch/sparc/kernel/sys32.S
index a45f0f31fe51..a3d308f2043e 100644
--- a/arch/sparc/kernel/sys32.S
+++ b/arch/sparc/kernel/sys32.S
@@ -18,224 +18,3 @@ sys32_mmap2:
 	sethi		%hi(sys_mmap), %g1
 	jmpl		%g1 + %lo(sys_mmap), %g0
 	 sllx		%o5, 12, %o5
-
-	.align		32
-	.globl		sys32_socketcall
-sys32_socketcall:	/* %o0=call, %o1=args */
-	cmp		%o0, 1
-	bl,pn		%xcc, do_einval
-	 cmp		%o0, 18
-	bg,pn		%xcc, do_einval
-	 sub		%o0, 1, %o0
-	sllx		%o0, 5, %o0
-	sethi		%hi(__socketcall_table_begin), %g2
-	or		%g2, %lo(__socketcall_table_begin), %g2
-	jmpl		%g2 + %o0, %g0
-	 nop
-do_einval:
-	retl
-	 mov		-EINVAL, %o0
-
-	.align		32
-__socketcall_table_begin:
-
-	/* Each entry is exactly 32 bytes. */
-do_sys_socket: /* sys_socket(int, int, int) */
-1:	ldswa		[%o1 + 0x0] %asi, %o0
-	sethi		%hi(sys_socket), %g1
-2:	ldswa		[%o1 + 0x8] %asi, %o2
-	jmpl		%g1 + %lo(sys_socket), %g0
-3:	 ldswa		[%o1 + 0x4] %asi, %o1
-	nop
-	nop
-	nop
-do_sys_bind: /* sys_bind(int fd, struct sockaddr *, int) */
-4:	ldswa		[%o1 + 0x0] %asi, %o0
-	sethi		%hi(sys_bind), %g1
-5:	ldswa		[%o1 + 0x8] %asi, %o2
-	jmpl		%g1 + %lo(sys_bind), %g0
-6:	 lduwa		[%o1 + 0x4] %asi, %o1
-	nop
-	nop
-	nop
-do_sys_connect: /* sys_connect(int, struct sockaddr *, int) */
-7:	ldswa		[%o1 + 0x0] %asi, %o0
-	sethi		%hi(sys_connect), %g1
-8:	ldswa		[%o1 + 0x8] %asi, %o2
-	jmpl		%g1 + %lo(sys_connect), %g0
-9:	 lduwa		[%o1 + 0x4] %asi, %o1
-	nop
-	nop
-	nop
-do_sys_listen: /* sys_listen(int, int) */
-10:	ldswa		[%o1 + 0x0] %asi, %o0
-	sethi		%hi(sys_listen), %g1
-	jmpl		%g1 + %lo(sys_listen), %g0
-11:	 ldswa		[%o1 + 0x4] %asi, %o1
-	nop
-	nop
-	nop
-	nop
-do_sys_accept: /* sys_accept(int, struct sockaddr *, int *) */
-12:	ldswa		[%o1 + 0x0] %asi, %o0
-	sethi		%hi(sys_accept), %g1
-13:	lduwa		[%o1 + 0x8] %asi, %o2
-	jmpl		%g1 + %lo(sys_accept), %g0
-14:	 lduwa		[%o1 + 0x4] %asi, %o1
-	nop
-	nop
-	nop
-do_sys_getsockname: /* sys_getsockname(int, struct sockaddr *, int *) */
-15:	ldswa		[%o1 + 0x0] %asi, %o0
-	sethi		%hi(sys_getsockname), %g1
-16:	lduwa		[%o1 + 0x8] %asi, %o2
-	jmpl		%g1 + %lo(sys_getsockname), %g0
-17:	 lduwa		[%o1 + 0x4] %asi, %o1
-	nop
-	nop
-	nop
-do_sys_getpeername: /* sys_getpeername(int, struct sockaddr *, int *) */
-18:	ldswa		[%o1 + 0x0] %asi, %o0
-	sethi		%hi(sys_getpeername), %g1
-19:	lduwa		[%o1 + 0x8] %asi, %o2
-	jmpl		%g1 + %lo(sys_getpeername), %g0
-20:	 lduwa		[%o1 + 0x4] %asi, %o1
-	nop
-	nop
-	nop
-do_sys_socketpair: /* sys_socketpair(int, int, int, int *) */
-21:	ldswa		[%o1 + 0x0] %asi, %o0
-	sethi		%hi(sys_socketpair), %g1
-22:	ldswa		[%o1 + 0x8] %asi, %o2
-23:	lduwa		[%o1 + 0xc] %asi, %o3
-	jmpl		%g1 + %lo(sys_socketpair), %g0
-24:	 ldswa		[%o1 + 0x4] %asi, %o1
-	nop
-	nop
-do_sys_send: /* sys_send(int, void *, size_t, unsigned int) */
-25:	ldswa		[%o1 + 0x0] %asi, %o0
-	sethi		%hi(sys_send), %g1
-26:	lduwa		[%o1 + 0x8] %asi, %o2
-27:	lduwa		[%o1 + 0xc] %asi, %o3
-	jmpl		%g1 + %lo(sys_send), %g0
-28:	 lduwa		[%o1 + 0x4] %asi, %o1
-	nop
-	nop
-do_sys_recv: /* sys_recv(int, void *, size_t, unsigned int) */
-29:	ldswa		[%o1 + 0x0] %asi, %o0
-	sethi		%hi(sys_recv), %g1
-30:	lduwa		[%o1 + 0x8] %asi, %o2
-31:	lduwa		[%o1 + 0xc] %asi, %o3
-	jmpl		%g1 + %lo(sys_recv), %g0
-32:	 lduwa		[%o1 + 0x4] %asi, %o1
-	nop
-	nop
-do_sys_sendto: /* sys_sendto(int, u32, compat_size_t, unsigned int, u32, int) */
-33:	ldswa		[%o1 + 0x0] %asi, %o0
-	sethi		%hi(sys_sendto), %g1
-34:	lduwa		[%o1 + 0x8] %asi, %o2
-35:	lduwa		[%o1 + 0xc] %asi, %o3
-36:	lduwa		[%o1 + 0x10] %asi, %o4
-37:	ldswa		[%o1 + 0x14] %asi, %o5
-	jmpl		%g1 + %lo(sys_sendto), %g0
-38:	 lduwa		[%o1 + 0x4] %asi, %o1
-do_sys_recvfrom: /* sys_recvfrom(int, u32, compat_size_t, unsigned int, u32, u32) */
-39:	ldswa		[%o1 + 0x0] %asi, %o0
-	sethi		%hi(sys_recvfrom), %g1
-40:	lduwa		[%o1 + 0x8] %asi, %o2
-41:	lduwa		[%o1 + 0xc] %asi, %o3
-42:	lduwa		[%o1 + 0x10] %asi, %o4
-43:	lduwa		[%o1 + 0x14] %asi, %o5
-	jmpl		%g1 + %lo(sys_recvfrom), %g0
-44:	 lduwa		[%o1 + 0x4] %asi, %o1
-do_sys_shutdown: /* sys_shutdown(int, int) */
-45:	ldswa		[%o1 + 0x0] %asi, %o0
-	sethi		%hi(sys_shutdown), %g1
-	jmpl		%g1 + %lo(sys_shutdown), %g0
-46:	 ldswa		[%o1 + 0x4] %asi, %o1
-	nop
-	nop
-	nop
-	nop
-do_sys_setsockopt: /* sys_setsockopt(int, int, int, char *, int) */
-47:	ldswa		[%o1 + 0x0] %asi, %o0
-	sethi		%hi(sys_setsockopt), %g1
-48:	ldswa		[%o1 + 0x8] %asi, %o2
-49:	lduwa		[%o1 + 0xc] %asi, %o3
-50:	ldswa		[%o1 + 0x10] %asi, %o4
-	jmpl		%g1 + %lo(sys_setsockopt), %g0
-51:	 ldswa		[%o1 + 0x4] %asi, %o1
-	nop
-do_sys_getsockopt: /* sys_getsockopt(int, int, int, u32, u32) */
-52:	ldswa		[%o1 + 0x0] %asi, %o0
-	sethi		%hi(sys_getsockopt), %g1
-53:	ldswa		[%o1 + 0x8] %asi, %o2
-54:	lduwa		[%o1 + 0xc] %asi, %o3
-55:	lduwa		[%o1 + 0x10] %asi, %o4
-	jmpl		%g1 + %lo(sys_getsockopt), %g0
-56:	 ldswa		[%o1 + 0x4] %asi, %o1
-	nop
-do_sys_sendmsg: /* compat_sys_sendmsg(int, struct compat_msghdr *, unsigned int) */
-57:	ldswa		[%o1 + 0x0] %asi, %o0
-	sethi		%hi(compat_sys_sendmsg), %g1
-58:	lduwa		[%o1 + 0x8] %asi, %o2
-	jmpl		%g1 + %lo(compat_sys_sendmsg), %g0
-59:	 lduwa		[%o1 + 0x4] %asi, %o1
-	nop
-	nop
-	nop
-do_sys_recvmsg: /* compat_sys_recvmsg(int, struct compat_msghdr *, unsigned int) */
-60:	ldswa		[%o1 + 0x0] %asi, %o0
-	sethi		%hi(compat_sys_recvmsg), %g1
-61:	lduwa		[%o1 + 0x8] %asi, %o2
-	jmpl		%g1 + %lo(compat_sys_recvmsg), %g0
-62:	 lduwa		[%o1 + 0x4] %asi, %o1
-	nop
-	nop
-	nop
-do_sys_accept4: /* sys_accept4(int, struct sockaddr *, int *, int) */
-63:	ldswa		[%o1 + 0x0] %asi, %o0
-	sethi		%hi(sys_accept4), %g1
-64:	lduwa		[%o1 + 0x8] %asi, %o2
-65:	ldswa		[%o1 + 0xc] %asi, %o3
-	jmpl		%g1 + %lo(sys_accept4), %g0
-66:	 lduwa		[%o1 + 0x4] %asi, %o1
-	nop
-	nop
-
-	.section	__ex_table,"a"
-	.align		4
-	.word		1b, __retl_efault, 2b, __retl_efault
-	.word		3b, __retl_efault, 4b, __retl_efault
-	.word		5b, __retl_efault, 6b, __retl_efault
-	.word		7b, __retl_efault, 8b, __retl_efault
-	.word		9b, __retl_efault, 10b, __retl_efault
-	.word		11b, __retl_efault, 12b, __retl_efault
-	.word		13b, __retl_efault, 14b, __retl_efault
-	.word		15b, __retl_efault, 16b, __retl_efault
-	.word		17b, __retl_efault, 18b, __retl_efault
-	.word		19b, __retl_efault, 20b, __retl_efault
-	.word		21b, __retl_efault, 22b, __retl_efault
-	.word		23b, __retl_efault, 24b, __retl_efault
-	.word		25b, __retl_efault, 26b, __retl_efault
-	.word		27b, __retl_efault, 28b, __retl_efault
-	.word		29b, __retl_efault, 30b, __retl_efault
-	.word		31b, __retl_efault, 32b, __retl_efault
-	.word		33b, __retl_efault, 34b, __retl_efault
-	.word		35b, __retl_efault, 36b, __retl_efault
-	.word		37b, __retl_efault, 38b, __retl_efault
-	.word		39b, __retl_efault, 40b, __retl_efault
-	.word		41b, __retl_efault, 42b, __retl_efault
-	.word		43b, __retl_efault, 44b, __retl_efault
-	.word		45b, __retl_efault, 46b, __retl_efault
-	.word		47b, __retl_efault, 48b, __retl_efault
-	.word		49b, __retl_efault, 50b, __retl_efault
-	.word		51b, __retl_efault, 52b, __retl_efault
-	.word		53b, __retl_efault, 54b, __retl_efault
-	.word		55b, __retl_efault, 56b, __retl_efault
-	.word		57b, __retl_efault, 58b, __retl_efault
-	.word		59b, __retl_efault, 60b, __retl_efault
-	.word		61b, __retl_efault, 62b, __retl_efault
-	.word		63b, __retl_efault, 64b, __retl_efault
-	.word		65b, __retl_efault, 66b, __retl_efault
-	.previous
diff --git a/arch/sparc/kernel/syscalls/syscall.tbl b/arch/sparc/kernel/syscalls/syscall.tbl
index 5e55f73f9880..cfdfb3707c16 100644
--- a/arch/sparc/kernel/syscalls/syscall.tbl
+++ b/arch/sparc/kernel/syscalls/syscall.tbl
@@ -155,7 +155,7 @@
 123	32	fchown			sys_fchown16
 123	64	fchown			sys_fchown
 124	common	fchmod			sys_fchmod
-125	common	recvfrom		sys_recvfrom
+125	common	recvfrom		sys_recvfrom			compat_sys_recvfrom
 126	32	setreuid		sys_setreuid16
 126	64	setreuid		sys_setreuid
 127	32	setregid		sys_setregid16
@@ -247,7 +247,7 @@
 204	32	readdir			sys_old_readdir			compat_sys_old_readdir
 204	64	readdir			sys_nis_syscall
 205	common	readahead		sys_readahead			compat_sys_readahead
-206	common	socketcall		sys_socketcall			sys32_socketcall
+206	common	socketcall		sys_socketcall			compat_sys_socketcall
 207	common	syslog			sys_syslog
 208	common	lookup_dcookie		sys_ni_syscall
 209	common	fadvise64		sys_fadvise64			compat_sys_fadvise64
-- 
2.39.2

