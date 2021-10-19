Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 725ED432F99
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Oct 2021 09:33:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HYQTG6wGfz3dkY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Oct 2021 18:33:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HYQQ20TCjz3cYX
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Oct 2021 18:30:33 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HYQPL1FTFz9sSB;
 Tue, 19 Oct 2021 09:29:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ixf6G4J_GYak; Tue, 19 Oct 2021 09:29:58 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HYQP71ZMCz9sSt;
 Tue, 19 Oct 2021 09:29:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 20E048B775;
 Tue, 19 Oct 2021 09:29:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 0mXJMfZqUbZc; Tue, 19 Oct 2021 09:29:47 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.203.71])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2B16D8B77D;
 Tue, 19 Oct 2021 09:29:46 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1) with ESMTPS id 19J7Td3r3188442
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 19 Oct 2021 09:29:39 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1/Submit) id 19J7Tduw3188441;
 Tue, 19 Oct 2021 09:29:39 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v3 11/22] powerpc/kuap: Remove __kuap_assert_locked()
Date: Tue, 19 Oct 2021 09:29:22 +0200
Message-Id: <1a60198a25d2ba38a37f1b92bc7d096435df4224.1634627931.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1634627931.git.christophe.leroy@csgroup.eu>
References: <cover.1634627931.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1634628570; l=2879; s=20211009;
 h=from:subject:message-id; bh=dyNOh9aXsJ6KgQLE08xS9upLqy76hFt73l8Nyf9oT64=;
 b=Ha9EJAz8acTy2cXgFi4vZ4JTeSgOHlEPTvep+2RaWEAMxNp7/iUPNCjcpIGI+hXU3v9sQJNEy9kv
 WO3CIPXlBoLU4KH5xgZaGKc2iuHAFtZI7mVmVX1vgqB3VUw+DL0s
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519;
 pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

__kuap_assert_locked() is redundant with
__kuap_get_and_assert_locked().

Move the verification of CONFIG_PPC_KUAP_DEBUG in kuap_assert_locked()
and make it call __kuap_get_and_assert_locked() directly.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/book3s/32/kup.h     | 5 -----
 arch/powerpc/include/asm/book3s/64/kup.h     | 6 ------
 arch/powerpc/include/asm/kup.h               | 3 ++-
 arch/powerpc/include/asm/nohash/32/kup-8xx.h | 6 ------
 4 files changed, 2 insertions(+), 18 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/kup.h b/arch/powerpc/include/asm/book3s/32/kup.h
index 35ca48f7c293..bc245e9f0bcc 100644
--- a/arch/powerpc/include/asm/book3s/32/kup.h
+++ b/arch/powerpc/include/asm/book3s/32/kup.h
@@ -117,11 +117,6 @@ static inline unsigned long __kuap_get_and_assert_locked(void)
 	return kuap;
 }
 
-static inline void __kuap_assert_locked(void)
-{
-	__kuap_get_and_assert_locked();
-}
-
 static __always_inline void __allow_user_access(void __user *to, const void __user *from,
 						u32 size, unsigned long dir)
 {
diff --git a/arch/powerpc/include/asm/book3s/64/kup.h b/arch/powerpc/include/asm/book3s/64/kup.h
index 9f2099790658..503828709d55 100644
--- a/arch/powerpc/include/asm/book3s/64/kup.h
+++ b/arch/powerpc/include/asm/book3s/64/kup.h
@@ -298,12 +298,6 @@ static inline unsigned long __kuap_get_and_assert_locked(void)
 	return amr;
 }
 
-static inline void __kuap_assert_locked(void)
-{
-	if (IS_ENABLED(CONFIG_PPC_KUAP_DEBUG))
-		WARN_ON_ONCE(mfspr(SPRN_AMR) != AMR_KUAP_BLOCKED);
-}
-
 /*
  * We support individually allowing read or write, but we don't support nesting
  * because that would require an expensive read/modify write of the AMR.
diff --git a/arch/powerpc/include/asm/kup.h b/arch/powerpc/include/asm/kup.h
index 33e93a6c5d19..5d3c1e8060f9 100644
--- a/arch/powerpc/include/asm/kup.h
+++ b/arch/powerpc/include/asm/kup.h
@@ -86,7 +86,8 @@ static __always_inline void kuap_assert_locked(void)
 	if (kuap_is_disabled())
 		return;
 
-	__kuap_assert_locked();
+	if (IS_ENABLED(CONFIG_PPC_KUAP_DEBUG))
+		__kuap_get_and_assert_locked();
 }
 
 #ifdef CONFIG_PPC32
diff --git a/arch/powerpc/include/asm/nohash/32/kup-8xx.h b/arch/powerpc/include/asm/nohash/32/kup-8xx.h
index 74f15c386476..37fe4b32b658 100644
--- a/arch/powerpc/include/asm/nohash/32/kup-8xx.h
+++ b/arch/powerpc/include/asm/nohash/32/kup-8xx.h
@@ -47,12 +47,6 @@ static inline unsigned long __kuap_get_and_assert_locked(void)
 	return kuap;
 }
 
-static inline void __kuap_assert_locked(void)
-{
-	if (IS_ENABLED(CONFIG_PPC_KUAP_DEBUG))
-		__kuap_get_and_assert_locked();
-}
-
 static inline void __allow_user_access(void __user *to, const void __user *from,
 				       unsigned long size, unsigned long dir)
 {
-- 
2.31.1

