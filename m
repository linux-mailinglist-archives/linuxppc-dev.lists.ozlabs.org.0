Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD4F3345D4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 18:58:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dwfty6wX9z3dt4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Mar 2021 04:58:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dwfst2JPQz30QQ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Mar 2021 04:57:05 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Dwfsn5sTvz9tyv8;
 Wed, 10 Mar 2021 18:57:01 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id QaR_BYD6t_W1; Wed, 10 Mar 2021 18:57:01 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Dwfsn56V7z9tytT;
 Wed, 10 Mar 2021 18:57:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7D8FE8B78D;
 Wed, 10 Mar 2021 18:57:03 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id VNdSc2g9C_Su; Wed, 10 Mar 2021 18:57:03 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2E3168B77E;
 Wed, 10 Mar 2021 18:57:03 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 864C06756B; Wed, 10 Mar 2021 17:57:02 +0000 (UTC)
Message-Id: <2cdecb6e5a2fcee6c158d18dd254b71ec0e0da4d.1615398498.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1615398498.git.christophe.leroy@csgroup.eu>
References: <cover.1615398498.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 3/8] powerpc/uaccess: Move copy_mc_xxx() functions down
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Wed, 10 Mar 2021 17:57:02 +0000 (UTC)
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

copy_mc_xxx() functions are in the middle of raw_copy functions.

For clarity, move them out of the raw_copy functions block.

They are using access_ok, so they need to be after the general
functions in order to eventually allow the inclusion of
asm-generic/uaccess.h in some future.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/uaccess.h | 52 +++++++++++++++---------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index 1c1d404514b1..479cb30eabd7 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -351,32 +351,6 @@ do {								\
 extern unsigned long __copy_tofrom_user(void __user *to,
 		const void __user *from, unsigned long size);
 
-#ifdef CONFIG_ARCH_HAS_COPY_MC
-unsigned long __must_check
-copy_mc_generic(void *to, const void *from, unsigned long size);
-
-static inline unsigned long __must_check
-copy_mc_to_kernel(void *to, const void *from, unsigned long size)
-{
-	return copy_mc_generic(to, from, size);
-}
-#define copy_mc_to_kernel copy_mc_to_kernel
-
-static inline unsigned long __must_check
-copy_mc_to_user(void __user *to, const void *from, unsigned long n)
-{
-	if (likely(check_copy_size(from, n, true))) {
-		if (access_ok(to, n)) {
-			allow_write_to_user(to, n);
-			n = copy_mc_generic((void *)to, from, n);
-			prevent_write_to_user(to, n);
-		}
-	}
-
-	return n;
-}
-#endif
-
 #ifdef __powerpc64__
 static inline unsigned long
 raw_copy_in_user(void __user *to, const void __user *from, unsigned long n)
@@ -433,6 +407,32 @@ static inline unsigned long clear_user(void __user *addr, unsigned long size)
 extern long strncpy_from_user(char *dst, const char __user *src, long count);
 extern __must_check long strnlen_user(const char __user *str, long n);
 
+#ifdef CONFIG_ARCH_HAS_COPY_MC
+unsigned long __must_check
+copy_mc_generic(void *to, const void *from, unsigned long size);
+
+static inline unsigned long __must_check
+copy_mc_to_kernel(void *to, const void *from, unsigned long size)
+{
+	return copy_mc_generic(to, from, size);
+}
+#define copy_mc_to_kernel copy_mc_to_kernel
+
+static inline unsigned long __must_check
+copy_mc_to_user(void __user *to, const void *from, unsigned long n)
+{
+	if (likely(check_copy_size(from, n, true))) {
+		if (access_ok(to, n)) {
+			allow_write_to_user(to, n);
+			n = copy_mc_generic((void *)to, from, n);
+			prevent_write_to_user(to, n);
+		}
+	}
+
+	return n;
+}
+#endif
+
 extern long __copy_from_user_flushcache(void *dst, const void __user *src,
 		unsigned size);
 extern void memcpy_page_flushcache(char *to, struct page *page, size_t offset,
-- 
2.25.0

