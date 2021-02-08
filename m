Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1101F313478
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Feb 2021 15:07:45 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZ7C10ddczDqly
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 01:07:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZ6zM6NPMzDqNy
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Feb 2021 00:57:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=ZYI8/1gy; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4DZ6zL64vkz9sSC; Tue,  9 Feb 2021 00:57:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1612792654;
 bh=2VZptngGBPuTkFxDmYp0XxrovPwgzCToo4rDK2DhbRY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZYI8/1gy0eJNx6VVl0045W3Lt6xDcM6gxeNh1DKuzMf0q4iTGx3FcMoDniN7OxrgH
 YPlwtm2qyfTEBN/bKxWBJvtxx263N1tgGJyfU9SnluorOrPlBLRg9GvrTrj+LUQXLd
 UBtk9IdsMnPMcnkTqL85rJa8dXri9vJl5TBbTTIYttl8+IATMNYFT5L2RZzIxRIT3F
 6DgoP2Xd+JYBxuBpsoHnjs7fSFGRfJbSEa2HG3mEQ3PcT3MwebmXo7RhG0X58RC/aX
 AjxcP0ADq9HtKMtpe32gRt8gUcnk2A40Y9C9vat64bW15EV6+zlCQ1cwiLlFsehVdg
 7qlWiNH8XGIZA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/2] powerpc/uaccess: Move might_fault() into
 user_access_begin()
Date: Tue,  9 Feb 2021 00:57:17 +1100
Message-Id: <20210208135717.2618798-2-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208135717.2618798-1-mpe@ellerman.id.au>
References: <20210208135717.2618798-1-mpe@ellerman.id.au>
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
Cc: aik@ozlabs.ru
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We have a might_fault() check in __unsafe_put_user_goto(), but that is
dangerous as it potentially calls lots of code while user access is
enabled.

It also triggers the check Alexey added to the irq restore path to
catch cases like that:

  WARNING: CPU: 30 PID: 1 at arch/powerpc/include/asm/book3s/64/kup.h:324 arch_local_irq_restore+0x160/0x190
  NIP arch_local_irq_restore+0x160/0x190
  LR  lock_is_held_type+0x140/0x200
  Call Trace:
    0xc00000007f392ff8 (unreliable)
    ___might_sleep+0x180/0x320
    __might_fault+0x50/0xe0
    filldir64+0x2d0/0x5d0
    call_filldir+0xc8/0x180
    ext4_readdir+0x948/0xb40
    iterate_dir+0x1ec/0x240
    sys_getdents64+0x80/0x290
    system_call_exception+0x160/0x280
    system_call_common+0xf0/0x27c

So remove the might fault check from unsafe_put_user().

Any call to unsafe_put_user() must be inside a region that's had user
access enabled with user_access_begin(), so move the might_fault() in
there. That also allows us to drop the is_kernel_addr() test, because
there should be no code using user_access_begin() in order to access a
kernel address.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/uaccess.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index 70347ee34c94..71640eca7341 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -214,8 +214,6 @@ do {								\
 #define __unsafe_put_user_goto(x, ptr, size, label)		\
 do {								\
 	__typeof__(*(ptr)) __user *__pu_addr = (ptr);		\
-	if (!is_kernel_addr((unsigned long)__pu_addr))		\
-		might_fault();					\
 	__chk_user_ptr(ptr);					\
 	__put_user_size_goto((x), __pu_addr, (size), label);	\
 } while (0)
@@ -494,6 +492,8 @@ extern void memcpy_page_flushcache(char *to, struct page *page, size_t offset,
 
 static __must_check inline bool user_access_begin(const void __user *ptr, size_t len)
 {
+	might_fault();
+
 	if (unlikely(!access_ok(ptr, len)))
 		return false;
 	allow_read_write_user((void __user *)ptr, ptr, len);
-- 
2.25.1

