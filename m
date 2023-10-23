Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4613A7D310D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Oct 2023 13:05:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aEz1JEDv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SDXQf1b15z3cNQ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Oct 2023 22:04:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aEz1JEDv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SDXPN0w4gz3cSq
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Oct 2023 22:03:52 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 37F0BCE2079;
	Mon, 23 Oct 2023 11:03:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FC50C433C8;
	Mon, 23 Oct 2023 11:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698059027;
	bh=pklDVZYAxLKOZK+8gcGmc6nJte6jXDPhoa1mHNgJuzE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aEz1JEDvjQaJCvm0F9LQymLd21rjf1S1DqR5Gi9cmP+YNr+w2pL7fjquHFqDs6IB+
	 d6cIIZ47jqQn1L8WagjScNybKckrd+FXFcqqKLFzXoQKgvtNnlv3vFGsXSLXNWWsk4
	 1bze2g38+kbHgBpuKxTulVPCd6rCF+NqMOrHc9myfAulikmaV7aShzYjrS3rYdT/gm
	 gRMygzsnhkITq2leWaFOOORjdlTXknzCn/JSvrc9kpRkHpW68zf0YnqL5NGAFHWnGi
	 lShoLPhiqVdbc6rtTEaWPlIocDVMUjtmb4ga3rhwU9g2gHeUXGkKOZK1oWGjSzmemf
	 BbtYjDfrwkmkg==
From: Arnd Bergmann <arnd@kernel.org>
To: Vivek Goyal <vgoyal@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 2/2] kexec: select CRYPTO from KEXEC_FILE instead of depending on it
Date: Mon, 23 Oct 2023 13:01:55 +0200
Message-Id: <20231023110308.1202042-2-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231023110308.1202042-1-arnd@kernel.org>
References: <20231023110308.1202042-1-arnd@kernel.org>
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
Cc: "Peter Zijlstra \(Intel\)" <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Eric DeVolder <eric.devolder@oracle.com>, Ard Biesheuvel <ardb@kernel.org>, Costa Shulyupin <costa.shul@redhat.com>, linux-s390@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, Baoquan He <bhe@redhat.com>, x86@kernel.org, Ingo Molnar <mingo@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Hari Bathini <hbathini@linux.ibm.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, linux-crypto@vger.kernel.org, linuxppc-dev@li
 sts.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

All other users of crypto code use 'select' instead of 'depends on',
so do the same thing with KEXEC_FILE for consistency.

In practice this makes very little difference as kernels with kexec
support are very likely to also include some other feature that already
selects both crypto and crypto_sha256, but being consistent here helps
for usability as well as to avoid potential circular dependencies.

This reverts the dependency back to what it was originally before commit
74ca317c26a3f ("kexec: create a new config option CONFIG_KEXEC_FILE for
new syscall"), which changed changed it with the comment "This should
be safer as "select" is not recursive", but that appears to have been
done in error, as "select" is indeed recursive, and there are no other
dependencies that prevent CRYPTO_SHA256 from being selected here.

Fixes: 74ca317c26a3f ("kexec: create a new config option CONFIG_KEXEC_FILE for new syscall")
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: linux-crypto@vger.kernel.org
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 kernel/Kconfig.kexec | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/Kconfig.kexec b/kernel/Kconfig.kexec
index bfc636d64ff2b..51f719af10e79 100644
--- a/kernel/Kconfig.kexec
+++ b/kernel/Kconfig.kexec
@@ -36,7 +36,8 @@ config KEXEC
 config KEXEC_FILE
 	bool "Enable kexec file based system call"
 	depends on ARCH_SUPPORTS_KEXEC_FILE
-	depends on CRYPTO_SHA256=y || !ARCH_SUPPORTS_KEXEC_PURGATORY
+	select CRYPTO
+	select CRYPTO_SHA256
 	select KEXEC_CORE
 	help
 	  This is new version of kexec system call. This system call is
-- 
2.39.2

