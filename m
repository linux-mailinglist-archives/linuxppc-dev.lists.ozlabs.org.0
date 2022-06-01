Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB8C53A93B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jun 2022 16:32:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LCs6W1vnBz3cgC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jun 2022 00:32:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=O8LeYd4d;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LCs5t2Ck9z2xvw
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Jun 2022 00:31:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=O8LeYd4d;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LCs5s6Wfvz4x7V;
	Thu,  2 Jun 2022 00:31:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1654093890;
	bh=2kV/8JVFe+1GtKz+6/hl+GRLUvLn0o4cp/AZ1o/hfSU=;
	h=From:To:Cc:Subject:Date:From;
	b=O8LeYd4d9Bjm8ZFFmmYEoxoa9L5Q7NPhr48zAoe+cf/duo6RAXIU0oWYxJjYdg9xc
	 pLbWFQjMK9oFCWJfBgGJXRdZwl8SXAvuvs3lM8B9Od1l+r2fh3SIiZOdlqnIahePwI
	 M1UNQWR8huykAaMieyS6mz1t7JtVm7kWYBqfSjNfQEkiGzpMStSKB87xwN8pDJd3a9
	 bBJ+pP0QC9UpvPMxNi2LuT/vC45fKMzoxtzLgxyZ1tUF6dKVDgCqU3N8RI35FY9xUm
	 8kndcyOAkDG1U+mbxmjSp5EnQGW23yScJgTuHVg5gRBQNpVETbLvqFgvprS8uHP/SN
	 BzJRCOobU+cJA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/kasan: Force thread size increase with KASAN
Date: Thu,  2 Jun 2022 00:31:14 +1000
Message-Id: <20220601143114.133524-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.35.3
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

KASAN causes increased stack usage, which can lead to stack overflows.

The logic in Kconfig to suggest a larger default doesn't work if a user
has CONFIG_EXPERT enabled and has an existing .config with a smaller
value.

Follow the lead of x86 and arm64, and force the thread size to be
increased when KASAN is enabled.

That also has the effect of enlarging the stack for 64-bit KASAN builds,
which is also desirable.

Fixes: edbadaf06710 ("powerpc/kasan: Fix stack overflow by increasing THREAD_SHIFT")
Reported-by: Erhard Furtner <erhard_f@mailbox.org>
Reported-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/Kconfig                   | 1 -
 arch/powerpc/include/asm/thread_info.h | 9 +++++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 54dbbb1d4b36..b1760d615bb7 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -790,7 +790,6 @@ config THREAD_SHIFT
 	range 13 15
 	default "15" if PPC_256K_PAGES
 	default "14" if PPC64
-	default "14" if KASAN
 	default "13"
 	help
 	  Used to define the stack size. The default is almost always what you
diff --git a/arch/powerpc/include/asm/thread_info.h b/arch/powerpc/include/asm/thread_info.h
index 125328d1b980..c9735f93f8e6 100644
--- a/arch/powerpc/include/asm/thread_info.h
+++ b/arch/powerpc/include/asm/thread_info.h
@@ -14,12 +14,17 @@
 
 #ifdef __KERNEL__
 
-#if defined(CONFIG_VMAP_STACK) && CONFIG_THREAD_SHIFT < PAGE_SHIFT
-#define THREAD_SHIFT		PAGE_SHIFT
+#ifdef CONFIG_KASAN
+#define THREAD_SHIFT		(CONFIG_THREAD_SHIFT + 1)
 #else
 #define THREAD_SHIFT		CONFIG_THREAD_SHIFT
 #endif
 
+#if defined(CONFIG_VMAP_STACK) && THREAD_SHIFT < PAGE_SHIFT
+#undef THREAD_SHIFT
+#define THREAD_SHIFT		PAGE_SHIFT
+#endif
+
 #define THREAD_SIZE		(1 << THREAD_SHIFT)
 
 /*
-- 
2.35.3

