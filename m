Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C926910C5B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2024 18:26:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AaWGCEH0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W4m8D0Lg7z3cXd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 02:26:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AaWGCEH0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W4m5V48wPz3cTM
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2024 02:23:58 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6A3ABCE2741;
	Thu, 20 Jun 2024 16:23:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECB5EC4AF07;
	Thu, 20 Jun 2024 16:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718900636;
	bh=Doj0//VPfq9z758xR2+yZ79Db+NeekZ0EoHrfr9q2Q0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AaWGCEH0FUtHpMS1MWl92zyMC/tgI55ZbXl6tZ3t5C3/D90MhQY7LMPv52sRtXgX7
	 /tDHOQ6fobnn4uVWb5vNTuBQIwEAxDas3AiEfhSop6feRAWhRnZ+da7P7VMngnhmkk
	 uKday5m0uC0pCQIfQjJmNfph+BSKsE6mupZiTK4nCMh6ev02nOQHZHAifS9GhfJcf8
	 Av2+SR2IBKxnqrqNk3UUKHECPl0wYIrYeODFjmzBUOQioGFpi7EdScbEqPk5DdwfzV
	 /j7R+AlsEtHGaZd/7u8r6X3V3OMunqnE6kTRg7ZdDsGpPmUCRt3Q2a3/R9uSNNqkgU
	 9t5D3HmhZEJ5Q==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 03/15] mips: fix compat_sys_lseek syscall
Date: Thu, 20 Jun 2024 18:23:04 +0200
Message-Id: <20240620162316.3674955-4-arnd@kernel.org>
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

This is almost compatible, but passing a negative offset should result
in a EINVAL error, but on mips o32 compat mode would seek to a large
32-bit byte offset.

Use compat_sys_lseek() to correctly sign-extend the argument.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/mips/kernel/syscalls/syscall_o32.tbl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kernel/syscalls/syscall_o32.tbl b/arch/mips/kernel/syscalls/syscall_o32.tbl
index 85751c9b9cdb..2439a2491cff 100644
--- a/arch/mips/kernel/syscalls/syscall_o32.tbl
+++ b/arch/mips/kernel/syscalls/syscall_o32.tbl
@@ -27,7 +27,7 @@
 17	o32	break				sys_ni_syscall
 # 18 was sys_stat
 18	o32	unused18			sys_ni_syscall
-19	o32	lseek				sys_lseek
+19	o32	lseek				sys_lseek			compat_sys_lseek
 20	o32	getpid				sys_getpid
 21	o32	mount				sys_mount
 22	o32	umount				sys_oldumount
-- 
2.39.2

