Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D188137B821
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 May 2021 10:35:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fg7Qn6XQHz30HP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 May 2021 18:35:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fg7QQ1dHPz2xxt
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 May 2021 18:35:05 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Fg7QH0vHyz9sf6;
 Wed, 12 May 2021 10:35:03 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1cAt37AtaJyU; Wed, 12 May 2021 10:35:03 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Fg7QG749kz9sf5;
 Wed, 12 May 2021 10:35:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A73DE8B7DB;
 Wed, 12 May 2021 10:35:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id YJEX-0lh7vAL; Wed, 12 May 2021 10:35:02 +0200 (CEST)
Received: from po15610vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 619538B7D9;
 Wed, 12 May 2021 10:35:02 +0200 (CEST)
Received: by po15610vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 2FCC1641A1; Wed, 12 May 2021 08:35:02 +0000 (UTC)
Message-Id: <e457f345843aa36c6f9ef8e6cb988428ae908df5.1620808468.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH 1/5] powerpc/kuap: Force inlining of all first level KUAP
 helpers.
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Wed, 12 May 2021 08:35:02 +0000 (UTC)
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

All KUAP helpers defined in asm/kup.h are single line functions
that should be inlined. But on book3s/32 build, we get many
instances of <prevent_write_to_user.constprop.0>.

Force inlining of those helpers.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/kup.h | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/include/asm/kup.h b/arch/powerpc/include/asm/kup.h
index ec96232529ac..a35ded8bedcd 100644
--- a/arch/powerpc/include/asm/kup.h
+++ b/arch/powerpc/include/asm/kup.h
@@ -96,51 +96,51 @@ static __always_inline void setup_kup(void)
 	setup_kuap(disable_kuap);
 }
 
-static inline void allow_read_from_user(const void __user *from, unsigned long size)
+static __always_inline void allow_read_from_user(const void __user *from, unsigned long size)
 {
 	barrier_nospec();
 	allow_user_access(NULL, from, size, KUAP_READ);
 }
 
-static inline void allow_write_to_user(void __user *to, unsigned long size)
+static __always_inline void allow_write_to_user(void __user *to, unsigned long size)
 {
 	allow_user_access(to, NULL, size, KUAP_WRITE);
 }
 
-static inline void allow_read_write_user(void __user *to, const void __user *from,
-					 unsigned long size)
+static __always_inline void allow_read_write_user(void __user *to, const void __user *from,
+						  unsigned long size)
 {
 	barrier_nospec();
 	allow_user_access(to, from, size, KUAP_READ_WRITE);
 }
 
-static inline void prevent_read_from_user(const void __user *from, unsigned long size)
+static __always_inline void prevent_read_from_user(const void __user *from, unsigned long size)
 {
 	prevent_user_access(NULL, from, size, KUAP_READ);
 }
 
-static inline void prevent_write_to_user(void __user *to, unsigned long size)
+static __always_inline void prevent_write_to_user(void __user *to, unsigned long size)
 {
 	prevent_user_access(to, NULL, size, KUAP_WRITE);
 }
 
-static inline void prevent_read_write_user(void __user *to, const void __user *from,
-					   unsigned long size)
+static __always_inline void prevent_read_write_user(void __user *to, const void __user *from,
+						    unsigned long size)
 {
 	prevent_user_access(to, from, size, KUAP_READ_WRITE);
 }
 
-static inline void prevent_current_access_user(void)
+static __always_inline void prevent_current_access_user(void)
 {
 	prevent_user_access(NULL, NULL, ~0UL, KUAP_CURRENT);
 }
 
-static inline void prevent_current_read_from_user(void)
+static __always_inline void prevent_current_read_from_user(void)
 {
 	prevent_user_access(NULL, NULL, ~0UL, KUAP_CURRENT_READ);
 }
 
-static inline void prevent_current_write_to_user(void)
+static __always_inline void prevent_current_write_to_user(void)
 {
 	prevent_user_access(NULL, NULL, ~0UL, KUAP_CURRENT_WRITE);
 }
-- 
2.25.0

