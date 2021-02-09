Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF9331513E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 15:10:19 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZlCX6jGbzDsgB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 01:10:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZl2W5ZqyzDrdh
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Feb 2021 01:02:19 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DZl2F0ybHz9v0KC;
 Tue,  9 Feb 2021 15:02:13 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id jNqtz1LhUB_Z; Tue,  9 Feb 2021 15:02:13 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DZl2F07yDz9v0KB;
 Tue,  9 Feb 2021 15:02:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 281828B7E8;
 Tue,  9 Feb 2021 15:02:14 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id h52ZIj1BeRTs; Tue,  9 Feb 2021 15:02:14 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B91D98B764;
 Tue,  9 Feb 2021 15:02:13 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 92DFA67359; Tue,  9 Feb 2021 14:02:13 +0000 (UTC)
Message-Id: <b3baeaec1ee2fbdc653bb6fb27b0be5b846163ef.1612879284.git.christophe.leroy@csgroup.eu>
In-Reply-To: <99d4ccb58a20d8408d0e19874393655ad5b40822.1612879284.git.christophe.leroy@csgroup.eu>
References: <99d4ccb58a20d8408d0e19874393655ad5b40822.1612879284.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 2/3] powerpc/uaccess: Merge __put_user_size_allowed() into
 __put_user_size()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue,  9 Feb 2021 14:02:13 +0000 (UTC)
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

__put_user_size_allowed() is only called from __put_user_size() now.

Merge them together.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/uaccess.h | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index a4d2569173ac..2fb1d95f10d3 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -108,22 +108,18 @@ static inline bool __access_ok(unsigned long addr, unsigned long size)
 
 extern long __put_user_bad(void);
 
-#define __put_user_size_allowed(x, ptr, size, retval)		\
+#define __put_user_size(x, ptr, size, retval)			\
 do {								\
 	__label__ __pu_failed;					\
 								\
 	retval = 0;						\
+	allow_write_to_user(ptr, size);				\
 	__put_user_size_goto(x, ptr, size, __pu_failed);	\
+	prevent_write_to_user(ptr, size);			\
 	break;							\
 								\
 __pu_failed:							\
 	retval = -EFAULT;					\
-} while (0)
-
-#define __put_user_size(x, ptr, size, retval)			\
-do {								\
-	allow_write_to_user(ptr, size);				\
-	__put_user_size_allowed(x, ptr, size, retval);		\
 	prevent_write_to_user(ptr, size);			\
 } while (0)
 
-- 
2.25.0

