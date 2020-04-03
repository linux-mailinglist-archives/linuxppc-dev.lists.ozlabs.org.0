Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE9719D12A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 09:25:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48ts0J0nDlzDr83
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 18:25:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=SxWEnBj+; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48trvH0b5xzDr09
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 18:20:58 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48trv916Qhz9txk1;
 Fri,  3 Apr 2020 09:20:53 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=SxWEnBj+; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 0H3X2puqBSCu; Fri,  3 Apr 2020 09:20:53 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48trv86VBKz9txk0;
 Fri,  3 Apr 2020 09:20:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1585898452; bh=BJgBTHe+L99GMNpZ0oFafGfoiOecONCckWzwsc5wUUE=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=SxWEnBj+72o7ALWqfRfrPFTYJjaUdZfHDcAAkCRllmCJz4B5zYqxoBhW8jW0N0CNf
 J8x+DDW2r+/4kgtPToKdEKU4hQrT15GDPH6pApmdNUfXn6ILoJyxJ88eiyFlDV0vNt
 ZNVui8BprR8PAMIvUGlM5sgzxixpc0U8AN1c4KUk=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BAF618B944;
 Fri,  3 Apr 2020 09:20:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id vLoIaVhxCm-w; Fri,  3 Apr 2020 09:20:53 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6F6568B75B;
 Fri,  3 Apr 2020 09:20:53 +0200 (CEST)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 4569E65700; Fri,  3 Apr 2020 07:20:53 +0000 (UTC)
Message-Id: <6c83af0f0809ef2a955c39ac622767f6cbede035.1585898438.git.christophe.leroy@c-s.fr>
In-Reply-To: <36e43241c7f043a24b5069e78c6a7edd11043be5.1585898438.git.christophe.leroy@c-s.fr>
References: <36e43241c7f043a24b5069e78c6a7edd11043be5.1585898438.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v2 4/5] powerpc/uaccess: Implement user_read_access_begin and
 user_write_access_begin
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 airlied@linux.ie, daniel@ffwll.ch, torvalds@linux-foundation.org,
 viro@zeniv.linux.org.uk, akpm@linux-foundation.org, keescook@chromium.org,
 hpa@zytor.com
Date: Fri,  3 Apr 2020 07:20:53 +0000 (UTC)
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
Cc: linux-arch@vger.kernel.org, linux-mm@kvack.org,
 intel-gfx@lists.freedesktop.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add support for selective read or write user access with
user_read_access_begin/end and user_write_access_begin/end.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
Reviewed-by: Kees Cook <keescook@chromium.org>
---
v2: no change
---
 arch/powerpc/include/asm/book3s/32/kup.h |  4 ++--
 arch/powerpc/include/asm/kup.h           | 14 +++++++++++++-
 arch/powerpc/include/asm/uaccess.h       | 22 ++++++++++++++++++++++
 3 files changed, 37 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/kup.h b/arch/powerpc/include/asm/book3s/32/kup.h
index 3c0ba22dc360..1617e73bee30 100644
--- a/arch/powerpc/include/asm/book3s/32/kup.h
+++ b/arch/powerpc/include/asm/book3s/32/kup.h
@@ -108,7 +108,7 @@ static __always_inline void allow_user_access(void __user *to, const void __user
 	u32 addr, end;
 
 	BUILD_BUG_ON(!__builtin_constant_p(dir));
-	BUILD_BUG_ON(dir == KUAP_CURRENT);
+	BUILD_BUG_ON(dir & ~KUAP_READ_WRITE);
 
 	if (!(dir & KUAP_WRITE))
 		return;
@@ -131,7 +131,7 @@ static __always_inline void prevent_user_access(void __user *to, const void __us
 
 	BUILD_BUG_ON(!__builtin_constant_p(dir));
 
-	if (dir == KUAP_CURRENT) {
+	if (dir & KUAP_CURRENT_WRITE) {
 		u32 kuap = current->thread.kuap;
 
 		if (unlikely(!kuap))
diff --git a/arch/powerpc/include/asm/kup.h b/arch/powerpc/include/asm/kup.h
index 92bcd1a26d73..c745ee41ad66 100644
--- a/arch/powerpc/include/asm/kup.h
+++ b/arch/powerpc/include/asm/kup.h
@@ -10,7 +10,9 @@
  * Use the current saved situation instead of the to/from/size params.
  * Used on book3s/32
  */
-#define KUAP_CURRENT	4
+#define KUAP_CURRENT_READ	4
+#define KUAP_CURRENT_WRITE	8
+#define KUAP_CURRENT		(KUAP_CURRENT_READ | KUAP_CURRENT_WRITE)
 
 #ifdef CONFIG_PPC64
 #include <asm/book3s/64/kup-radix.h>
@@ -101,6 +103,16 @@ static inline void prevent_current_access_user(void)
 	prevent_user_access(NULL, NULL, ~0UL, KUAP_CURRENT);
 }
 
+static inline void prevent_current_read_from_user(void)
+{
+	prevent_user_access(NULL, NULL, ~0UL, KUAP_CURRENT_READ);
+}
+
+static inline void prevent_current_write_to_user(void)
+{
+	prevent_user_access(NULL, NULL, ~0UL, KUAP_CURRENT_WRITE);
+}
+
 #endif /* !__ASSEMBLY__ */
 
 #endif /* _ASM_POWERPC_KUAP_H_ */
diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index 2f500debae21..4427d419eb1d 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -468,6 +468,28 @@ static __must_check inline bool user_access_begin(const void __user *ptr, size_t
 #define user_access_save	prevent_user_access_return
 #define user_access_restore	restore_user_access
 
+static __must_check inline bool
+user_read_access_begin(const void __user *ptr, size_t len)
+{
+	if (unlikely(!access_ok(ptr, len)))
+		return false;
+	allow_read_from_user(ptr, len);
+	return true;
+}
+#define user_read_access_begin	user_read_access_begin
+#define user_read_access_end		prevent_current_read_from_user
+
+static __must_check inline bool
+user_write_access_begin(const void __user *ptr, size_t len)
+{
+	if (unlikely(!access_ok(ptr, len)))
+		return false;
+	allow_write_to_user((void __user *)ptr, len);
+	return true;
+}
+#define user_write_access_begin	user_write_access_begin
+#define user_write_access_end		prevent_current_write_to_user
+
 #define unsafe_op_wrap(op, err) do { if (unlikely(op)) goto err; } while (0)
 #define unsafe_get_user(x, p, e) unsafe_op_wrap(__get_user_allowed(x, p), e)
 #define unsafe_put_user(x, p, e) unsafe_op_wrap(__put_user_allowed(x, p), e)
-- 
2.25.0

