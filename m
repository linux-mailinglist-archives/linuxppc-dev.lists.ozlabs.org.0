Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EF01E910C8C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2024 18:28:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OMV332YN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W4mBX3wj2z3cbF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 02:28:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OMV332YN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W4m5t0fDPz3cVv
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2024 02:24:18 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B171BCE274F;
	Thu, 20 Jun 2024 16:24:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F7DDC4AF0A;
	Thu, 20 Jun 2024 16:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718900656;
	bh=SxsG/TmKgeAvUmRAEjqsJKtLdqJlcUTp92xZHqYPbCE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OMV332YN3UjvJEF4PnM8J7A3bK1CfCxAJvquL4L87vNJ73iww9j8NMyNmkVNBsvmV
	 oELQxErXhDcG6P1rKt8y5lu6a2LtBjPDcBah6AiMLmVxYXeGEBhJxOd4/D1epMMzGZ
	 R142uU7a0qh37b/GbHePGcf2G6lBDkIXJDHA3VULLtdkpyqDFbxpJJwYBlv8bNnybT
	 NRdb50Ap1szpwu+NWMfOfVqEAO3pAtzZW5KC2NWeEgPMl+6NXwN5MlGV9mMt/0P1So
	 DLVL2wKXmHzpfpxUnklRuzv1N+j+tSSs3o7VuHKcFzF8ECtFLmrSwZtTUw4SUAvjB1
	 Yb913TxCniLxA==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 06/15] parisc: use correct compat recv/recvfrom syscalls
Date: Thu, 20 Jun 2024 18:23:07 +0200
Message-Id: <20240620162316.3674955-7-arnd@kernel.org>
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

Johannes missed parisc back when he introduced the compat version
of these syscalls, so receiving cmsg messages that require a compat
conversion is still broken.

Use the correct calls like the other architectures do.

Fixes: 1dacc76d0014 ("net/compat/wext: send different messages to compat tasks")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/parisc/kernel/syscalls/syscall.tbl | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/parisc/kernel/syscalls/syscall.tbl b/arch/parisc/kernel/syscalls/syscall.tbl
index b13c21373974..39e67fab7515 100644
--- a/arch/parisc/kernel/syscalls/syscall.tbl
+++ b/arch/parisc/kernel/syscalls/syscall.tbl
@@ -108,7 +108,7 @@
 95	common	fchown			sys_fchown
 96	common	getpriority		sys_getpriority
 97	common	setpriority		sys_setpriority
-98	common	recv			sys_recv
+98	common	recv			sys_recv			compat_sys_recv
 99	common	statfs			sys_statfs			compat_sys_statfs
 100	common	fstatfs			sys_fstatfs			compat_sys_fstatfs
 101	common	stat64			sys_stat64
@@ -135,7 +135,7 @@
 120	common	clone			sys_clone_wrapper
 121	common	setdomainname		sys_setdomainname
 122	common	sendfile		sys_sendfile			compat_sys_sendfile
-123	common	recvfrom		sys_recvfrom
+123	common	recvfrom		sys_recvfrom			compat_sys_recvfrom
 124	32	adjtimex		sys_adjtimex_time32
 124	64	adjtimex		sys_adjtimex
 125	common	mprotect		sys_mprotect
-- 
2.39.2

