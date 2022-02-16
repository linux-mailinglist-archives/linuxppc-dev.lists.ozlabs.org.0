Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A58B4B898D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 14:20:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JzJTt0GJrz3dqY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Feb 2022 00:20:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FvFA19Kg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=FvFA19Kg; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JzJQH620qz3cWS
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Feb 2022 00:16:55 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5C7486164A;
 Wed, 16 Feb 2022 13:16:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47582C340F1;
 Wed, 16 Feb 2022 13:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645017413;
 bh=+iR2qnnFcrsCPQoMglxV/90U3LFjDlY0u/606L67UPs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FvFA19KgOFHw//5AD53hF0IwW2eLEb8iC830WFN6MdVoW4fyh5i/2kJHpxFd7pdlD
 7UX6fEewGCq+cZvaT2PObS6XOZnZypDPzvRcYa/W0nzWewDgb+0xXamh2omZfLYFmr
 8N4H7mpvMOTDqe2QPH8s/NhnVxUv6/h988kxIKpvMvfqvjGNNvINW6t4henTJIKwJt
 jzLnL5Fc+Su69zkh5g1Nf3EInYTi+sp1khBbBbK8Lt97/7IVApa2FzdwQAvU7AyEeL
 nEYQi1fYgk8k2uZixKdw/j3+QwXzCx+3pjcEKGsjL9tNOzijYs/MTwOK3SPeQjakHj
 3w2JGHUIm9rGg==
From: Arnd Bergmann <arnd@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-api@vger.kernel.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org, viro@zeniv.linux.org.uk
Subject: [PATCH v2 07/18] nios2: drop access_ok() check from __put_user()
Date: Wed, 16 Feb 2022 14:13:21 +0100
Message-Id: <20220216131332.1489939-8-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220216131332.1489939-1-arnd@kernel.org>
References: <20220216131332.1489939-1-arnd@kernel.org>
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
Cc: mark.rutland@arm.com, dalias@libc.org, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, peterz@infradead.org, jcmvbkbc@gmail.com,
 guoren@kernel.org, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-riscv@lists.infradead.org, will@kernel.org, ardb@kernel.org,
 linux-s390@vger.kernel.org, bcain@codeaurora.org, deller@gmx.de,
 x86@kernel.org, linux@armlinux.org.uk, linux-csky@vger.kernel.org,
 mingo@redhat.com, geert@linux-m68k.org, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, hca@linux.ibm.com, linux-alpha@vger.kernel.org,
 linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, green.hu@gmail.com, shorne@gmail.com,
 monstr@monstr.eu, tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org,
 nickhu@andestech.com, linux-mips@vger.kernel.org, dinguyen@kernel.org,
 ebiederm@xmission.com, richard@nod.at, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

Unlike other architectures, the nios2 version of __put_user() has an
extra check for access_ok(), preventing it from being used to implement
__put_kernel_nofault().

Split up put_user() along the same lines as __get_user()/get_user()

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/nios2/include/asm/uaccess.h | 56 +++++++++++++++++++-------------
 1 file changed, 33 insertions(+), 23 deletions(-)

diff --git a/arch/nios2/include/asm/uaccess.h b/arch/nios2/include/asm/uaccess.h
index ca9285a915ef..a5cbe07cf0da 100644
--- a/arch/nios2/include/asm/uaccess.h
+++ b/arch/nios2/include/asm/uaccess.h
@@ -167,34 +167,44 @@ do {									\
 	: "r" (val), "r" (ptr), "i" (-EFAULT));				\
 }
 
-#define put_user(x, ptr)						\
+#define __put_user_common(__pu_val, __pu_ptr)				\
 ({									\
 	long __pu_err = -EFAULT;					\
-	__typeof__(*(ptr)) __user *__pu_ptr = (ptr);			\
-	__typeof__(*(ptr)) __pu_val = (__typeof(*ptr))(x);		\
-	if (access_ok(__pu_ptr, sizeof(*__pu_ptr))) {	\
-		switch (sizeof(*__pu_ptr)) {				\
-		case 1:							\
-			__put_user_asm(__pu_val, "stb", __pu_ptr, __pu_err); \
-			break;						\
-		case 2:							\
-			__put_user_asm(__pu_val, "sth", __pu_ptr, __pu_err); \
-			break;						\
-		case 4:							\
-			__put_user_asm(__pu_val, "stw", __pu_ptr, __pu_err); \
-			break;						\
-		default:						\
-			/* XXX: This looks wrong... */			\
-			__pu_err = 0;					\
-			if (copy_to_user(__pu_ptr, &(__pu_val),		\
-				sizeof(*__pu_ptr)))			\
-				__pu_err = -EFAULT;			\
-			break;						\
-		}							\
+	switch (sizeof(*__pu_ptr)) {					\
+	case 1:								\
+		__put_user_asm(__pu_val, "stb", __pu_ptr, __pu_err);	\
+		break;							\
+	case 2:								\
+		__put_user_asm(__pu_val, "sth", __pu_ptr, __pu_err);	\
+		break;							\
+	case 4:								\
+		__put_user_asm(__pu_val, "stw", __pu_ptr, __pu_err);	\
+		break;							\
+	default:							\
+		/* XXX: This looks wrong... */				\
+		__pu_err = 0;						\
+		if (__copy_to_user(__pu_ptr, &(__pu_val),		\
+			sizeof(*__pu_ptr)))				\
+			__pu_err = -EFAULT;				\
+		break;							\
 	}								\
 	__pu_err;							\
 })
 
-#define __put_user(x, ptr) put_user(x, ptr)
+#define __put_user(x, ptr)						\
+({									\
+	__auto_type __pu_ptr = (ptr);					\
+	typeof(*__pu_ptr) __pu_val = (typeof(*__pu_ptr))(x);		\
+	__put_user_common(__pu_val, __pu_ptr);				\
+})
+
+#define put_user(x, ptr)						\
+({									\
+	__auto_type __pu_ptr = (ptr);					\
+	typeof(*__pu_ptr) __pu_val = (typeof(*__pu_ptr))(x);		\
+	access_ok(__pu_ptr, sizeof(*__pu_ptr)) ?			\
+		__put_user_common(__pu_val, __pu_ptr) :			\
+		-EFAULT;						\
+})
 
 #endif /* _ASM_NIOS2_UACCESS_H */
-- 
2.29.2

