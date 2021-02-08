Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CF369313442
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Feb 2021 15:02:39 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZ7532NfDzDqNk
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 01:02:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZ6zM4xcDzDqNr
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Feb 2021 00:57:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=F+07PyW2; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4DZ6zL35vmz9sVR; Tue,  9 Feb 2021 00:57:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1612792654;
 bh=LO+MzmAWH9YsobuBFqQa0QLB6PJbemlQDbvw+Vgq0kw=;
 h=From:To:Cc:Subject:Date:From;
 b=F+07PyW2OpVusoMU6OuvLdkgprwl0SQLHGStSsVkIpsdbpNS5zbTGY8IxguYiTzPF
 mBEo+VwOZlDxL5xm7kercEvZHDEvnDz8EK3j0OVxSui6DSmAHp4REuAlApTMhGI8IM
 VtUdh4ep5lK4BgylYqmIBogj6+4GLgO8iKl4Mc2bD/8O1TSAsAlYqJcxn3mea6wBi3
 vqLxtUKjOFXh1hFQ5ddbrxl3vmN6TNYDRbwjfP7toqQuoDTs90c29JuCxW4sL7Lehz
 0QkuM93BzpM80WosG86m0bze6aRb6n9KeIrufcN32mP1VmQw0us/ZMBqPmcbaVs/Ud
 fMpHdjdfW+kzw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/2] powerpc/uaccess: Simplify unsafe_put_user() implementation
Date: Tue,  9 Feb 2021 00:57:16 +1100
Message-Id: <20210208135717.2618798-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
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

Currently unsafe_put_user() expands to __put_user_goto(), which
expands to __put_user_nocheck_goto().

There are no other uses of __put_user_nocheck_goto(), and although
there are some other uses of __put_user_goto() those could just use
unsafe_put_user().

Every layer of indirection introduces the possibility that some code
is calling that layer, and makes keeping track of the required
semantics at each point more complicated.

So drop __put_user_goto(), and rename __put_user_nocheck_goto() to
__unsafe_put_user_goto(). The "nocheck" is implied by "unsafe".

Replace the few uses of __put_user_goto() with unsafe_put_user().

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/uaccess.h | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index efa4be2fa951..70347ee34c94 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -52,8 +52,6 @@ static inline bool __access_ok(unsigned long addr, unsigned long size)
 	__get_user_nocheck((x), (ptr), sizeof(*(ptr)), true)
 #define __put_user(x, ptr) \
 	__put_user_nocheck((__typeof__(*(ptr)))(x), (ptr), sizeof(*(ptr)))
-#define __put_user_goto(x, ptr, label) \
-	__put_user_nocheck_goto((__typeof__(*(ptr)))(x), (ptr), sizeof(*(ptr)), label)
 
 #define __get_user_allowed(x, ptr) \
 	__get_user_nocheck((x), (ptr), sizeof(*(ptr)), false)
@@ -213,7 +211,7 @@ do {								\
 	}							\
 } while (0)
 
-#define __put_user_nocheck_goto(x, ptr, size, label)		\
+#define __unsafe_put_user_goto(x, ptr, size, label)		\
 do {								\
 	__typeof__(*(ptr)) __user *__pu_addr = (ptr);		\
 	if (!is_kernel_addr((unsigned long)__pu_addr))		\
@@ -530,7 +528,8 @@ user_write_access_begin(const void __user *ptr, size_t len)
 
 #define unsafe_op_wrap(op, err) do { if (unlikely(op)) goto err; } while (0)
 #define unsafe_get_user(x, p, e) unsafe_op_wrap(__get_user_allowed(x, p), e)
-#define unsafe_put_user(x, p, e) __put_user_goto(x, p, e)
+#define unsafe_put_user(x, p, e) \
+	__unsafe_put_user_goto((__typeof__(*(p)))(x), (p), sizeof(*(p)), e)
 
 #define unsafe_copy_from_user(d, s, l, e) \
 	unsafe_op_wrap(__copy_tofrom_user((__force void __user *)d, s, l), e)
@@ -543,17 +542,17 @@ do {									\
 	int _i;								\
 									\
 	for (_i = 0; _i < (_len & ~(sizeof(long) - 1)); _i += sizeof(long))		\
-		__put_user_goto(*(long*)(_src + _i), (long __user *)(_dst + _i), e);\
+		unsafe_put_user(*(long*)(_src + _i), (long __user *)(_dst + _i), e); \
 	if (IS_ENABLED(CONFIG_PPC64) && (_len & 4)) {			\
-		__put_user_goto(*(u32*)(_src + _i), (u32 __user *)(_dst + _i), e);	\
+		unsafe_put_user(*(u32*)(_src + _i), (u32 __user *)(_dst + _i), e); \
 		_i += 4;						\
 	}								\
 	if (_len & 2) {							\
-		__put_user_goto(*(u16*)(_src + _i), (u16 __user *)(_dst + _i), e);	\
+		unsafe_put_user(*(u16*)(_src + _i), (u16 __user *)(_dst + _i), e); \
 		_i += 2;						\
 	}								\
 	if (_len & 1) \
-		__put_user_goto(*(u8*)(_src + _i), (u8 __user *)(_dst + _i), e);\
+		unsafe_put_user(*(u8*)(_src + _i), (u8 __user *)(_dst + _i), e); \
 } while (0)
 
 #define HAVE_GET_KERNEL_NOFAULT
-- 
2.25.1

