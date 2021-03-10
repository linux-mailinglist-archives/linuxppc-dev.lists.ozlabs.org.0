Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B12E133460A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 18:59:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DwfwJ1KYBz3gG3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Mar 2021 04:59:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dwfsw6ky7z3cLN
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Mar 2021 04:57:08 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Dwfsr5xqrz9twh2;
 Wed, 10 Mar 2021 18:57:04 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id OFJoXMI6JhO8; Wed, 10 Mar 2021 18:57:04 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Dwfsr4tG8z9v0W3;
 Wed, 10 Mar 2021 18:57:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 87A1B8B78D;
 Wed, 10 Mar 2021 18:57:06 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ywr1m5Sj8eQn; Wed, 10 Mar 2021 18:57:06 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3B7188B77E;
 Wed, 10 Mar 2021 18:57:06 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 9ED896756B; Wed, 10 Mar 2021 17:57:05 +0000 (UTC)
Message-Id: <2dee286d2d6dc9a27d99e31ac564bad4fae2cb49.1615398498.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1615398498.git.christophe.leroy@csgroup.eu>
References: <cover.1615398498.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 6/8] powerpc/net: Switch csum_and_copy_{to/from}_user to
 user_access block
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Wed, 10 Mar 2021 17:57:05 +0000 (UTC)
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

Use user_access_begin() instead of the
might_sleep/access_ok/allow_access sequence.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/lib/checksum_wrappers.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/lib/checksum_wrappers.c b/arch/powerpc/lib/checksum_wrappers.c
index b895166afc82..f3999cbb2fcc 100644
--- a/arch/powerpc/lib/checksum_wrappers.c
+++ b/arch/powerpc/lib/checksum_wrappers.c
@@ -16,16 +16,12 @@ __wsum csum_and_copy_from_user(const void __user *src, void *dst,
 {
 	__wsum csum;
 
-	might_sleep();
-
-	if (unlikely(!access_ok(src, len)))
+	if (unlikely(!user_read_access_begin(src, len)))
 		return 0;
 
-	allow_read_from_user(src, len);
-
 	csum = csum_partial_copy_generic((void __force *)src, dst, len);
 
-	prevent_read_from_user(src, len);
+	user_read_access_end();
 	return csum;
 }
 EXPORT_SYMBOL(csum_and_copy_from_user);
@@ -34,15 +30,12 @@ __wsum csum_and_copy_to_user(const void *src, void __user *dst, int len)
 {
 	__wsum csum;
 
-	might_sleep();
-	if (unlikely(!access_ok(dst, len)))
+	if (unlikely(!user_write_access_begin(dst, len)))
 		return 0;
 
-	allow_write_to_user(dst, len);
-
 	csum = csum_partial_copy_generic(src, (void __force *)dst, len);
 
-	prevent_write_to_user(dst, len);
+	user_write_access_end();
 	return csum;
 }
 EXPORT_SYMBOL(csum_and_copy_to_user);
-- 
2.25.0

