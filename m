Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA0713D45C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 07:32:49 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47yvWg0yn2zDqXW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 17:32:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=Uhihq+6r; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47yvNf4100zDqW2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 17:26:42 +1100 (AEDT)
Received: by mail-pj1-x1041.google.com with SMTP id n59so1086969pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jan 2020 22:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ecViW2B6K6MgjtfxW3TT7mCoLEuRKAGSK4ebp685lGI=;
 b=Uhihq+6rfB5UyQl+9UDv+i3ThvZFs5H/8nw3PJ9UAbz3R2r3AMJzgomMFAzOXhQixb
 9c4b8qrhyrPfdzEOkv05oUMvhz2JnmwO7kdW6N8LsZbFuuF4bvwkNyNZ4AOA+k+w3p4A
 vn7BPofvQmrLxHWpcX8lHyw7JZ1dUbkAXFCGQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ecViW2B6K6MgjtfxW3TT7mCoLEuRKAGSK4ebp685lGI=;
 b=jCc+EI3fZ1hi2t2/TRxbMauOZw68CWlgdsgvGbv0wdeSUosMfkyQeoFzV8j09ruplS
 TJXS79FJhpRA+HZeTDmAGEBG7b1AdR/ib/6qQTbaQydjivpWv4PR+ywaRA2E6es//TH8
 1AzXPz2gcSk7xIvI8oIf+kpSFfIIOdUmusUCydaSmbVFRMRN0NLfStUV/fsYOgC22KO8
 OM0PdEihKy/wy+SWWW8Pabxs612gJx07dC0d6e0w3XVBULHT8+DFVrtswTmcKe8Kc3/g
 sSHGBpiN2lD8hr41RDuYmCKtj/Tlg6ecqpALPcblmtmLKzfjrFsRD263qwKrDcP+XXnT
 xYwA==
X-Gm-Message-State: APjAAAXgmJRqSGKh4GdQIrlFGEPRpf33uyW/kTBqiyeBA89/3wa5usAa
 Qt1iInzc5gc5DIO5zMg16JIF5w==
X-Google-Smtp-Source: APXvYqw19UTxY8Hi9APh86aEtqUHLB8ch68t3FABEMRmpJHJbbxu4RZM4Mz69GnkzexI90XRmebJvQ==
X-Received: by 2002:a17:90a:a608:: with SMTP id
 c8mr4785355pjq.36.1579155999384; 
 Wed, 15 Jan 2020 22:26:39 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-097c-7eed-afd4-cd15.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:97c:7eed:afd4:cd15])
 by smtp.gmail.com with ESMTPSA id o16sm22735174pgl.58.2020.01.15.22.26.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2020 22:26:38 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 kasan-dev@googlegroups.com
Subject: [PATCH v2 2/3] string.h: fix incompatibility between FORTIFY_SOURCE
 and KASAN
Date: Thu, 16 Jan 2020 17:26:24 +1100
Message-Id: <20200116062625.32692-3-dja@axtens.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116062625.32692-1-dja@axtens.net>
References: <20200116062625.32692-1-dja@axtens.net>
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
Cc: linux-s390@vger.kernel.org, linux-xtensa@linux-xtensa.org, x86@kernel.org,
 Daniel Micay <danielmicay@gmail.com>, Alexander Potapenko <glider@google.com>,
 linux-arm-kernel@lists.infradead.org,
 Andrey Ryabinin <aryabinin@virtuozzo.com>, linuxppc-dev@lists.ozlabs.org,
 dvyukov@google.com, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The memcmp KASAN self-test fails on a kernel with both KASAN and
FORTIFY_SOURCE.

When FORTIFY_SOURCE is on, a number of functions are replaced with
fortified versions, which attempt to check the sizes of the operands.
However, these functions often directly invoke __builtin_foo() once they
have performed the fortify check. Using __builtins may bypass KASAN
checks if the compiler decides to inline it's own implementation as
sequence of instructions, rather than emit a function call that goes out
to a KASAN-instrumented implementation.

Why is only memcmp affected?
============================

Of the string and string-like functions that kasan_test tests, only memcmp
is replaced by an inline sequence of instructions in my testing on x86 with
gcc version 9.2.1 20191008 (Ubuntu 9.2.1-9ubuntu2).

I believe this is due to compiler heuristics. For example, if I annotate
kmalloc calls with the alloc_size annotation (and disable some fortify
compile-time checking!), the compiler will replace every memset except the
one in kmalloc_uaf_memset with inline instructions. (I have some WIP
patches to add this annotation.)

Does this affect other functions in string.h?
=============================================

Yes. Anything that uses __builtin_* rather than __real_* could be
affected. This looks like:

 - strncpy
 - strcat
 - strlen
 - strlcpy maybe, under some circumstances?
 - strncat under some circumstances
 - memset
 - memcpy
 - memmove
 - memcmp (as noted)
 - memchr
 - strcpy

Whether a function call is emitted always depends on the compiler. Most
bugs should get caught by FORTIFY_SOURCE, but the missed memcmp test shows
that this is not always the case.

Isn't FORTIFY_SOURCE disabled with KASAN?
========================================-

The string headers on all arches supporting KASAN disable fortify with
kasan, but only when address sanitisation is _also_ disabled. For example
from x86:

 #if defined(CONFIG_KASAN) && !defined(__SANITIZE_ADDRESS__)
 /*
  * For files that are not instrumented (e.g. mm/slub.c) we
  * should use not instrumented version of mem* functions.
  */
 #define memcpy(dst, src, len) __memcpy(dst, src, len)
 #define memmove(dst, src, len) __memmove(dst, src, len)
 #define memset(s, c, n) __memset(s, c, n)

 #ifndef __NO_FORTIFY
 #define __NO_FORTIFY /* FORTIFY_SOURCE uses __builtin_memcpy, etc. */
 #endif

 #endif

This comes from commit 6974f0c4555e ("include/linux/string.h: add the
option of fortified string.h functions"), and doesn't work when KASAN is
enabled and the file is supposed to be sanitised - as with test_kasan.c

I'm pretty sure this is not wrong, but not as expansive it should be:

 * we shouldn't use __builtin_memcpy etc in files where we don't have
   instrumentation - it could devolve into a function call to memcpy,
   which will be instrumented. Rather, we should use __memcpy which
   by convention is not instrumented.

 * we also shouldn't be using __builtin_memcpy when we have a KASAN
   instrumented file, because it could be replaced with inline asm
   that will not be instrumented.

What is correct behaviour?
==========================

Firstly, there is some overlap between fortification and KASAN: both
provide some level of _runtime_ checking. Only fortify provides
compile-time checking.

KASAN and fortify can pick up different things at runtime:

 - Some fortify functions, notably the string functions, could easily be
   modified to consider sub-object sizes (e.g. members within a struct),
   and I have some WIP patches to do this. KASAN cannot detect these
   because it cannot insert poision between members of a struct.

 - KASAN can detect many over-reads/over-writes when the sizes of both
   operands are unknown, which fortify cannot.

So there are a couple of options:

 1) Flip the test: disable fortify in santised files and enable it in
    unsanitised files. This at least stops us missing KASAN checking, but
    we lose the fortify checking.

 2) Make the fortify code always call out to real versions. Do this only
    for KASAN, for fear of losing the inlining opportunities we get from
    __builtin_*.

(We can't use kasan_check_{read,write}: because the fortify functions are
_extern inline_, you can't include _static_ inline functions without a
compiler warning. kasan_check_{read,write} are static inline so we can't
use them even when they would otherwise be suitable.)

Take approach 2 and call out to real versions when KASAN is enabled.

Use __underlying_foo to distinguish from __real_foo: __real_foo always
refers to the kernel's implementation of foo, __underlying_foo could be
either the kernel implementation or the __builtin_foo implementation.

This is sometimes enough to make the memcmp test succeed with
FORTIFY_SOURCE enabled. It is at least enough to get the function call
into the module. One more fix is needed to make it reliable: see the next
patch.

Cc: Daniel Micay <danielmicay@gmail.com>
Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>
Cc: Alexander Potapenko <glider@google.com>
Cc: Dmitry Vyukov <dvyukov@google.com>
Fixes: 6974f0c4555e ("include/linux/string.h: add the option of fortified string.h functions")
Signed-off-by: Daniel Axtens <dja@axtens.net>

---

v2: add #undefs, do not drop arch code: Dmitry pointed out that we _do_ want
    to disable fortify in non-sanitised files because of how __builtin_memcpy
    might end up as a call to regular memcpy rather than __memcpy.

Dmitry, this might cause a few new syzkaller splats - I first picked it up
building from a syskaller config. Or it might not, it just depends what gets
replaced with an inline sequence of instructions.

checkpatch complains about some over-long lines, happy to change the format
if anyone has better ideas for how to lay it out.
---
 include/linux/string.h | 60 +++++++++++++++++++++++++++++++++---------
 1 file changed, 48 insertions(+), 12 deletions(-)

diff --git a/include/linux/string.h b/include/linux/string.h
index 3b8e8b12dd37..18d3f7a4b2b9 100644
--- a/include/linux/string.h
+++ b/include/linux/string.h
@@ -317,6 +317,31 @@ void __read_overflow3(void) __compiletime_error("detected read beyond size of ob
 void __write_overflow(void) __compiletime_error("detected write beyond size of object passed as 1st parameter");
 
 #if !defined(__NO_FORTIFY) && defined(__OPTIMIZE__) && defined(CONFIG_FORTIFY_SOURCE)
+
+#ifdef CONFIG_KASAN
+extern void *__underlying_memchr(const void *p, int c, __kernel_size_t size) __RENAME(memchr);
+extern int __underlying_memcmp(const void *p, const void *q, __kernel_size_t size) __RENAME(memcmp);
+extern void *__underlying_memcpy(void *p, const void *q, __kernel_size_t size) __RENAME(memcpy);
+extern void *__underlying_memmove(void *p, const void *q, __kernel_size_t size) __RENAME(memmove);
+extern void *__underlying_memset(void *p, int c, __kernel_size_t size) __RENAME(memset);
+extern char *__underlying_strcat(char *p, const char *q) __RENAME(strcat);
+extern char *__underlying_strcpy(char *p, const char *q) __RENAME(strcpy);
+extern __kernel_size_t __underlying_strlen(const char *p) __RENAME(strlen);
+extern char *__underlying_strncat(char *p, const char *q, __kernel_size_t count) __RENAME(strncat);
+extern char *__underlying_strncpy(char *p, const char *q, __kernel_size_t size) __RENAME(strncpy);
+#else
+#define __underlying_memchr	__builtin_memchr
+#define __underlying_memcmp	__builtin_memcmp
+#define __underlying_memcpy	__builtin_memcpy
+#define __underlying_memmove	__builtin_memmove
+#define __underlying_memset	__builtin_memset
+#define __underlying_strcat	__builtin_strcat
+#define __underlying_strcpy	__builtin_strcpy
+#define __underlying_strlen	__builtin_strlen
+#define __underlying_strncat	__builtin_strncat
+#define __underlying_strncpy	__builtin_strncpy
+#endif
+
 __FORTIFY_INLINE char *strncpy(char *p, const char *q, __kernel_size_t size)
 {
 	size_t p_size = __builtin_object_size(p, 0);
@@ -324,14 +349,14 @@ __FORTIFY_INLINE char *strncpy(char *p, const char *q, __kernel_size_t size)
 		__write_overflow();
 	if (p_size < size)
 		fortify_panic(__func__);
-	return __builtin_strncpy(p, q, size);
+	return __underlying_strncpy(p, q, size);
 }
 
 __FORTIFY_INLINE char *strcat(char *p, const char *q)
 {
 	size_t p_size = __builtin_object_size(p, 0);
 	if (p_size == (size_t)-1)
-		return __builtin_strcat(p, q);
+		return __underlying_strcat(p, q);
 	if (strlcat(p, q, p_size) >= p_size)
 		fortify_panic(__func__);
 	return p;
@@ -345,7 +370,7 @@ __FORTIFY_INLINE __kernel_size_t strlen(const char *p)
 	/* Work around gcc excess stack consumption issue */
 	if (p_size == (size_t)-1 ||
 	    (__builtin_constant_p(p[p_size - 1]) && p[p_size - 1] == '\0'))
-		return __builtin_strlen(p);
+		return __underlying_strlen(p);
 	ret = strnlen(p, p_size);
 	if (p_size <= ret)
 		fortify_panic(__func__);
@@ -378,7 +403,7 @@ __FORTIFY_INLINE size_t strlcpy(char *p, const char *q, size_t size)
 			__write_overflow();
 		if (len >= p_size)
 			fortify_panic(__func__);
-		__builtin_memcpy(p, q, len);
+		__underlying_memcpy(p, q, len);
 		p[len] = '\0';
 	}
 	return ret;
@@ -391,12 +416,12 @@ __FORTIFY_INLINE char *strncat(char *p, const char *q, __kernel_size_t count)
 	size_t p_size = __builtin_object_size(p, 0);
 	size_t q_size = __builtin_object_size(q, 0);
 	if (p_size == (size_t)-1 && q_size == (size_t)-1)
-		return __builtin_strncat(p, q, count);
+		return __underlying_strncat(p, q, count);
 	p_len = strlen(p);
 	copy_len = strnlen(q, count);
 	if (p_size < p_len + copy_len + 1)
 		fortify_panic(__func__);
-	__builtin_memcpy(p + p_len, q, copy_len);
+	__underlying_memcpy(p + p_len, q, copy_len);
 	p[p_len + copy_len] = '\0';
 	return p;
 }
@@ -408,7 +433,7 @@ __FORTIFY_INLINE void *memset(void *p, int c, __kernel_size_t size)
 		__write_overflow();
 	if (p_size < size)
 		fortify_panic(__func__);
-	return __builtin_memset(p, c, size);
+	return __underlying_memset(p, c, size);
 }
 
 __FORTIFY_INLINE void *memcpy(void *p, const void *q, __kernel_size_t size)
@@ -423,7 +448,7 @@ __FORTIFY_INLINE void *memcpy(void *p, const void *q, __kernel_size_t size)
 	}
 	if (p_size < size || q_size < size)
 		fortify_panic(__func__);
-	return __builtin_memcpy(p, q, size);
+	return __underlying_memcpy(p, q, size);
 }
 
 __FORTIFY_INLINE void *memmove(void *p, const void *q, __kernel_size_t size)
@@ -438,7 +463,7 @@ __FORTIFY_INLINE void *memmove(void *p, const void *q, __kernel_size_t size)
 	}
 	if (p_size < size || q_size < size)
 		fortify_panic(__func__);
-	return __builtin_memmove(p, q, size);
+	return __underlying_memmove(p, q, size);
 }
 
 extern void *__real_memscan(void *, int, __kernel_size_t) __RENAME(memscan);
@@ -464,7 +489,7 @@ __FORTIFY_INLINE int memcmp(const void *p, const void *q, __kernel_size_t size)
 	}
 	if (p_size < size || q_size < size)
 		fortify_panic(__func__);
-	return __builtin_memcmp(p, q, size);
+	return __underlying_memcmp(p, q, size);
 }
 
 __FORTIFY_INLINE void *memchr(const void *p, int c, __kernel_size_t size)
@@ -474,7 +499,7 @@ __FORTIFY_INLINE void *memchr(const void *p, int c, __kernel_size_t size)
 		__read_overflow();
 	if (p_size < size)
 		fortify_panic(__func__);
-	return __builtin_memchr(p, c, size);
+	return __underlying_memchr(p, c, size);
 }
 
 void *__real_memchr_inv(const void *s, int c, size_t n) __RENAME(memchr_inv);
@@ -505,11 +530,22 @@ __FORTIFY_INLINE char *strcpy(char *p, const char *q)
 	size_t p_size = __builtin_object_size(p, 0);
 	size_t q_size = __builtin_object_size(q, 0);
 	if (p_size == (size_t)-1 && q_size == (size_t)-1)
-		return __builtin_strcpy(p, q);
+		return __underlying_strcpy(p, q);
 	memcpy(p, q, strlen(q) + 1);
 	return p;
 }
 
+/* Don't use these outside the FORITFY_SOURCE implementation */
+#undef __underlying_memchr
+#undef __underlying_memcmp
+#undef __underlying_memcpy
+#undef __underlying_memmove
+#undef __underlying_memset
+#undef __underlying_strcat
+#undef __underlying_strcpy
+#undef __underlying_strlen
+#undef __underlying_strncat
+#undef __underlying_strncpy
 #endif
 
 /**
-- 
2.20.1

