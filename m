Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34AC62F12A3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jan 2021 13:57:41 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DDtz62ZNNzDqYn
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jan 2021 23:57:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DDtjq6mmHzDqWx
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Jan 2021 23:46:04 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DDtjc0l7Kz9v02R;
 Mon, 11 Jan 2021 13:45:56 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id PYbl7X_przYr; Mon, 11 Jan 2021 13:45:56 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DDtjb6DwVz9v02Q;
 Mon, 11 Jan 2021 13:45:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1EF068B792;
 Mon, 11 Jan 2021 13:46:01 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id cAs0K8e4ByA5; Mon, 11 Jan 2021 13:46:01 +0100 (CET)
Received: from localhost.localdomain (po15451.idsi0.si.c-s.fr [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DEAB68B78E;
 Mon, 11 Jan 2021 13:46:00 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id D544C66978; Mon, 11 Jan 2021 12:46:00 +0000 (UTC)
Message-Id: <d68d7a82fc764d63fae35f198f1f2156d1832e06.1610369143.git.christophe.leroy@csgroup.eu>
In-Reply-To: <8c74fc9ce8131cabb10b3e95dc0e430f396ee83e.1610369143.git.christophe.leroy@csgroup.eu>
References: <8c74fc9ce8131cabb10b3e95dc0e430f396ee83e.1610369143.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH 3/3] powerpc: Merge raw_copy_to_user_allowed() into
 raw_copy_to_user()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 cmr@codefail.de
Date: Mon, 11 Jan 2021 12:46:00 +0000 (UTC)
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

Since commit 17bc43367fc2 ("powerpc/uaccess: Implement
unsafe_copy_to_user() as a simple loop"), raw_copy_to_user_allowed()
is only used by raw_copy_to_user().

Merge raw_copy_to_user_allowed() into raw_copy_to_user().

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/uaccess.h | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index f1df444bfb04..ff550d5dbf38 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -411,19 +411,13 @@ static inline unsigned long raw_copy_from_user(void *to,
 	return ret;
 }
 
-static inline unsigned long
-raw_copy_to_user_allowed(void __user *to, const void *from, unsigned long n)
-{
-	return __copy_tofrom_user(to, (__force const void __user *)from, n);
-}
-
 static inline unsigned long
 raw_copy_to_user(void __user *to, const void *from, unsigned long n)
 {
 	unsigned long ret;
 
 	allow_write_to_user(to, n);
-	ret = raw_copy_to_user_allowed(to, from, n);
+	ret = __copy_tofrom_user(to, (__force const void __user *)from, n);
 	prevent_write_to_user(to, n);
 	return ret;
 }
-- 
2.25.0

