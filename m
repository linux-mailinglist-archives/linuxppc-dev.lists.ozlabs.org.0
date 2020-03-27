Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC9B1951B8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 08:09:07 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48pXyn1hJkzDqY1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 18:09:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=dDV8IbMg; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48pXsS1LryzDqZF
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Mar 2020 18:04:28 +1100 (AEDT)
Received: by mail-pl1-x643.google.com with SMTP id w3so3118034plz.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Mar 2020 00:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=24u80VLNFP+1n/OmeWsnDHNpTqwsJGR94JLoUmbNbHA=;
 b=dDV8IbMgWNkwuodBOcxwPbAe0zIzXVVS/T8BxOV5whT+LOGmKqIPxuQKZhuGgnLcls
 LrgLIYSpZNgV+xHfQpGZb+yMIrkegVCVpZZiIyg0EdsTTRaddTry9RPWelxpLRQj2fim
 1MMoALkYu8KyovU71xpxsg6pHLBpexiTwqrGnjr//FbyRpx3MHPTO8iWmLpJOx5xlN96
 wftmZSjPeIqkjPM2nnbgb9xgYf0l0QbZKVWxHWdb2HeViWimLRYEf+M7la8WCYO/Y+MW
 COkjoM5qO69tkO8VmE7ah2Sdisv5GeLidjXjKaSYtemaDWMukeDOOhBUteYb54ydTj0R
 QjvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=24u80VLNFP+1n/OmeWsnDHNpTqwsJGR94JLoUmbNbHA=;
 b=W1T94WryRhdMJRxT8YvoJLTzShe/CTDqQsd6aNz5TdTS2+GL79awVC0Q4wEe8g9jOW
 zBxxFIg8YveKGe/Hs3WX0bs8fureQS8AqGmjEgCyKkxUJcVA7tiHXH2i3S235uStXIKt
 ksPeKK2B/rXNnWHOKORlX7IGeqCcojfRHxJ01sXaFDXWxdOZ5hUcnhEMwXsionW6JzwE
 bZ6CBaXEsDIqSBH6uV75qHh9MC95Tpd6oALv3TXfbrmkbKoh66//FARMVo7K3CAeSDUl
 lxU/rGHV0chGWhMi9W/Fi7cZv/3eQhp6PjilkYP0a4dhRbvryDrM/o3QnQ59/Z+zRm07
 ja5g==
X-Gm-Message-State: ANhLgQ0GuhEbpgRH3/6P4jwGJcEKeZdCpNwyBmVo4pUDOCq3dd3IhW0N
 1ohPoVSK42UJD4C4sgsCXhwY4HWb
X-Google-Smtp-Source: ADFU+vtYusT1m8x1eTzuCiTum0ML/bZCGB/pY0AY9G1pFxx8zUX+BKQLy1WelCTLIOjmiU67SJWwCg==
X-Received: by 2002:a17:90a:da03:: with SMTP id
 e3mr4366409pjv.100.1585292665233; 
 Fri, 27 Mar 2020 00:04:25 -0700 (PDT)
Received: from bobo.ibm.com (14-202-190-183.tpgi.com.au. [14.202.190.183])
 by smtp.gmail.com with ESMTPSA id s98sm3075805pjb.46.2020.03.27.00.04.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2020 00:04:24 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/4] powerpc/uaccess: evaluate macro arguments once,
 before user access is allowed
Date: Fri, 27 Mar 2020 17:02:39 +1000
Message-Id: <20200327070240.427074-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200327070240.427074-1-npiggin@gmail.com>
References: <20200327070240.427074-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

get/put_user can be called with nontrivial arguments. fs/proc/page.c
has a good example:

    if (put_user(stable_page_flags(ppage), out)) {

stable_page_flags is quite a lot of code, including spin locks in the
page allocator.

Ensure these arguments are evaluated before user access is allowed.
This improves security by reducing code with access to userspace, but
it also fixes a PREEMPT bug with KUAP on powerpc/64s:
stable_page_flags is currently called with AMR set to allow writes,
it ends up calling spin_unlock(), which can call preempt_schedule. But
the task switch code can not be called with AMR set (it relies on
interrupts saving the register), so this blows up.

It's fine if the code inside allow_user_access is preemptible, because
a timer or IPI will save the AMR, but it's not okay to explicitly
cause a reschedule.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/uaccess.h | 97 ++++++++++++++++++------------
 1 file changed, 59 insertions(+), 38 deletions(-)

diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index 670910df3cc7..1cf8595aeef1 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -162,36 +162,48 @@ do {								\
 	prevent_write_to_user(ptr, size);			\
 } while (0)
 
-#define __put_user_nocheck(x, ptr, size, do_allow)			\
+#define __put_user_nocheck(x, ptr, size, do_allow)		\
 ({								\
 	long __pu_err;						\
 	__typeof__(*(ptr)) __user *__pu_addr = (ptr);		\
+	__typeof__(*(ptr)) __pu_val = (x);			\
+	__typeof__(size) __pu_size = (size);			\
+								\
 	if (!is_kernel_addr((unsigned long)__pu_addr))		\
 		might_fault();					\
-	__chk_user_ptr(ptr);					\
-	if (do_allow)								\
-		__put_user_size((x), __pu_addr, (size), __pu_err);		\
-	else									\
-		__put_user_size_allowed((x), __pu_addr, (size), __pu_err);	\
+	__chk_user_ptr(__pu_addr);				\
+	if (do_allow)						\
+		__put_user_size(__pu_val, __pu_addr, __pu_size, __pu_err); \
+	else							\
+		__put_user_size_allowed(__pu_val, __pu_addr, __pu_size, __pu_err); \
+								\
 	__pu_err;						\
 })
 
-#define __put_user_check(x, ptr, size)					\
-({									\
-	long __pu_err = -EFAULT;					\
-	__typeof__(*(ptr)) __user *__pu_addr = (ptr);			\
-	might_fault();							\
-	if (access_ok(__pu_addr, size))			\
-		__put_user_size((x), __pu_addr, (size), __pu_err);	\
-	__pu_err;							\
+#define __put_user_check(x, ptr, size)				\
+({								\
+	long __pu_err = -EFAULT;				\
+	__typeof__(*(ptr)) __user *__pu_addr = (ptr);		\
+	__typeof__(*(ptr)) __pu_val = (x);			\
+	__typeof__(size) __pu_size = (size);			\
+								\
+	might_fault();						\
+	if (access_ok(__pu_addr, __pu_size))			\
+		__put_user_size(__pu_val, __pu_addr, __pu_size, __pu_err); \
+								\
+	__pu_err;						\
 })
 
 #define __put_user_nosleep(x, ptr, size)			\
 ({								\
 	long __pu_err;						\
 	__typeof__(*(ptr)) __user *__pu_addr = (ptr);		\
-	__chk_user_ptr(ptr);					\
-	__put_user_size((x), __pu_addr, (size), __pu_err);	\
+	__typeof__(*(ptr)) __pu_val = (x);			\
+	__typeof__(size) __pu_size = (size);			\
+								\
+	__chk_user_ptr(__pu_addr);				\
+	__put_user_size(__pu_val, __pu_addr, __pu_size, __pu_err); \
+								\
 	__pu_err;						\
 })
 
@@ -278,46 +290,55 @@ do {								\
 #define __long_type(x) \
 	__typeof__(__builtin_choose_expr(sizeof(x) > sizeof(0UL), 0ULL, 0UL))
 
-#define __get_user_nocheck(x, ptr, size, do_allow)			\
+#define __get_user_nocheck(x, ptr, size, do_allow)		\
 ({								\
 	long __gu_err;						\
 	__long_type(*(ptr)) __gu_val;				\
-	__typeof__(*(ptr)) __user *__gu_addr = (ptr);	\
-	__chk_user_ptr(ptr);					\
+	__typeof__(*(ptr)) __user *__gu_addr = (ptr);		\
+	__typeof__(size) __gu_size = (size);			\
+								\
+	__chk_user_ptr(__gu_addr);				\
 	if (!is_kernel_addr((unsigned long)__gu_addr))		\
 		might_fault();					\
 	barrier_nospec();					\
-	if (do_allow)								\
-		__get_user_size(__gu_val, __gu_addr, (size), __gu_err);		\
-	else									\
-		__get_user_size_allowed(__gu_val, __gu_addr, (size), __gu_err);	\
+	if (do_allow)						\
+		__get_user_size(__gu_val, __gu_addr, __gu_size, __gu_err); \
+	else							\
+		__get_user_size_allowed(__gu_val, __gu_addr, __gu_size, __gu_err); \
 	(x) = (__typeof__(*(ptr)))__gu_val;			\
+								\
 	__gu_err;						\
 })
 
-#define __get_user_check(x, ptr, size)					\
-({									\
-	long __gu_err = -EFAULT;					\
-	__long_type(*(ptr)) __gu_val = 0;				\
+#define __get_user_check(x, ptr, size)				\
+({								\
+	long __gu_err = -EFAULT;				\
+	__long_type(*(ptr)) __gu_val = 0;			\
 	__typeof__(*(ptr)) __user *__gu_addr = (ptr);		\
-	might_fault();							\
-	if (access_ok(__gu_addr, (size))) {		\
-		barrier_nospec();					\
-		__get_user_size(__gu_val, __gu_addr, (size), __gu_err);	\
-	}								\
-	(x) = (__force __typeof__(*(ptr)))__gu_val;				\
-	__gu_err;							\
+	__typeof__(size) __gu_size = (size);			\
+								\
+	might_fault();						\
+	if (access_ok(__gu_addr, __gu_size)) {			\
+		barrier_nospec();				\
+		__get_user_size(__gu_val, __gu_addr, __gu_size, __gu_err); \
+	}							\
+	(x) = (__force __typeof__(*(ptr)))__gu_val;		\
+								\
+	__gu_err;						\
 })
 
 #define __get_user_nosleep(x, ptr, size)			\
 ({								\
 	long __gu_err;						\
 	__long_type(*(ptr)) __gu_val;				\
-	__typeof__(*(ptr)) __user *__gu_addr = (ptr);	\
-	__chk_user_ptr(ptr);					\
+	__typeof__(*(ptr)) __user *__gu_addr = (ptr);		\
+	__typeof__(size) __gu_size = (size);			\
+								\
+	__chk_user_ptr(__gu_addr);				\
 	barrier_nospec();					\
-	__get_user_size(__gu_val, __gu_addr, (size), __gu_err);	\
-	(x) = (__force __typeof__(*(ptr)))__gu_val;			\
+	__get_user_size(__gu_val, __gu_addr, __gu_size, __gu_err); \
+	(x) = (__force __typeof__(*(ptr)))__gu_val;		\
+								\
 	__gu_err;						\
 })
 
-- 
2.23.0

