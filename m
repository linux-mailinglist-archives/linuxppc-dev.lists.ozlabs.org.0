Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0537C6A3E9F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Feb 2023 10:52:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PQG536X9xz3cGV
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Feb 2023 20:52:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=kMaj71Vf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--elver.bounces.google.com (client-ip=2a00:1450:4864:20::549; helo=mail-ed1-x549.google.com; envelope-from=3ln38ywukdeehoyhujrrjoh.frpolqx0ssf-ghyolvwv.r2odev.ruj@flex--elver.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=kMaj71Vf;
	dkim-atps=neutral
Received: from mail-ed1-x549.google.com (mail-ed1-x549.google.com [IPv6:2a00:1450:4864:20::549])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PQG462RLHz309V
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Feb 2023 20:51:48 +1100 (AEDT)
Received: by mail-ed1-x549.google.com with SMTP id k12-20020a50c8cc000000b004accf30f6d3so7743854edh.14
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Feb 2023 01:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vLAZSY9lX30lbRvxmgqsLOf9PyjLVjvwhzsapOvRcDY=;
        b=kMaj71Vfi/lRJwpu2c6Y30c4GChofTS/1NAM6BSsppmd+79MVgshdAkbfwYcY+bpGs
         CiRnRoFJalGQy06Qf6ofr6IPOrEnPsJbQXg6+U1jdMGXFVGJ1AsOf4i7MQFcQA+l8ULe
         Mo2b8h0asHjntecxkZTvGug03tleK52dxXa25hMzrG4SNMTyU/JAHj9MR/l79zKdXHLQ
         buM5KSHUBERdH016UmpVUqFya9R7u6amo2onMgq6s4r74lW7NUSfh3ur9xrEK7PEmm+k
         3xZcAhDWMRii49gLrjaLUjNtFD2IuQu4WrV5DAjjdfOzUNXSCtDX0oHDPSI05CE4qHzb
         EqWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vLAZSY9lX30lbRvxmgqsLOf9PyjLVjvwhzsapOvRcDY=;
        b=g95Hh5XelcSpKYU2s7xU0OT27pN8GnY6HkcGd5LsvYcdSayfsA1w4TxUmkKGWlAKp5
         AVF07T2UYUrjCvtC+RstLrmT9KxtfmVuU4pfFnnbTkQ+yqfgDjyyzC3JmP+iQ9AdRr3g
         mk0QDsIIocgI6EzqZvAU6eFjACq8ylz6TwwlHVZrBul7S8UCrjVXIv/XlKOEK9QRbHH7
         09V/XUD7DH4l9XaPdMPAOAM5Hl7UB0jYsEex8RRdEVqIm/N+x3oeprNnwemPOpP0aNUL
         9GjR8Bz+jGfM4iv5SXraB/9lcGUZDJbJznSvJeGTXEfOvrBPBRrkxN5Ml4wJsXfdYDMt
         RasQ==
X-Gm-Message-State: AO0yUKWrS7WN4drKqlPBglqt7CPbP3FQ+3dXw9jNbBwLZ3CLcvZYeW7K
	FX7XIu9iZeStK+A5XX2Sc7rF6ilJaA==
X-Google-Smtp-Source: AK7set8hge3bNWvK5Bx6TAmYJQ6x6+ySzteQpQn1kKAYlB8+s6f2a5QBRfTeJyAYOF013isoIX53pzIcXw==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:9c:201:1a89:611d:c416:e1ee])
 (user=elver job=sendgmr) by 2002:a17:907:60cd:b0:8b1:3540:7632 with SMTP id
 hv13-20020a17090760cd00b008b135407632mr5583442ejc.2.1677491502399; Mon, 27
 Feb 2023 01:51:42 -0800 (PST)
Date: Mon, 27 Feb 2023 10:47:27 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.2.637.g21b0678d19-goog
Message-ID: <20230227094726.3833247-1-elver@google.com>
Subject: [PATCH mm] kasan, powerpc: Don't rename memintrinsics if compiler
 adds prefixes
From: Marco Elver <elver@google.com>
To: elver@google.com, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: kernel test robot <lkp@intel.com>, Daniel Axtens <dja@axtens.net>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linux-mm@kvack.org, Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, Liam Howlett <liam.howlett@oracle.com>, kasan-dev@googlegroups.com, Vincenzo Frascino <vincenzo.frascino@arm.com>, linuxppc-dev@lists.ozlabs.org, Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With appropriate compiler support [1], KASAN builds use __asan prefixed
meminstrinsics, and KASAN no longer overrides memcpy/memset/memmove.

If compiler support is detected (CC_HAS_KASAN_MEMINTRINSIC_PREFIX),
define memintrinsics normally (do not prefix '__').

On powerpc, KASAN is the only user of __mem functions, which are used to
define instrumented memintrinsics. Alias the normal versions for KASAN
to use in its implementation.

Link: https://lore.kernel.org/all/20230224085942.1791837-1-elver@google.com/ [1]
Link: https://lore.kernel.org/oe-kbuild-all/202302271348.U5lvmo0S-lkp@intel.com/
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Marco Elver <elver@google.com>
---
 arch/powerpc/include/asm/kasan.h       |  2 +-
 arch/powerpc/include/asm/string.h      | 15 +++++++++++----
 arch/powerpc/kernel/prom_init_check.sh |  9 +++++++--
 3 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/include/asm/kasan.h b/arch/powerpc/include/asm/kasan.h
index 92a968202ba7..365d2720097c 100644
--- a/arch/powerpc/include/asm/kasan.h
+++ b/arch/powerpc/include/asm/kasan.h
@@ -2,7 +2,7 @@
 #ifndef __ASM_KASAN_H
 #define __ASM_KASAN_H
 
-#ifdef CONFIG_KASAN
+#if defined(CONFIG_KASAN) && !defined(CONFIG_CC_HAS_KASAN_MEMINTRINSIC_PREFIX)
 #define _GLOBAL_KASAN(fn)	_GLOBAL(__##fn)
 #define _GLOBAL_TOC_KASAN(fn)	_GLOBAL_TOC(__##fn)
 #define EXPORT_SYMBOL_KASAN(fn)	EXPORT_SYMBOL(__##fn)
diff --git a/arch/powerpc/include/asm/string.h b/arch/powerpc/include/asm/string.h
index 2aa0e31e6884..60ba22770f51 100644
--- a/arch/powerpc/include/asm/string.h
+++ b/arch/powerpc/include/asm/string.h
@@ -30,11 +30,17 @@ extern int memcmp(const void *,const void *,__kernel_size_t);
 extern void * memchr(const void *,int,__kernel_size_t);
 void memcpy_flushcache(void *dest, const void *src, size_t size);
 
+#ifdef CONFIG_KASAN
+/* __mem variants are used by KASAN to implement instrumented meminstrinsics. */
+#ifdef CONFIG_CC_HAS_KASAN_MEMINTRINSIC_PREFIX
+#define __memset memset
+#define __memcpy memcpy
+#define __memmove memmove
+#else /* CONFIG_CC_HAS_KASAN_MEMINTRINSIC_PREFIX */
 void *__memset(void *s, int c, __kernel_size_t count);
 void *__memcpy(void *to, const void *from, __kernel_size_t n);
 void *__memmove(void *to, const void *from, __kernel_size_t n);
-
-#if defined(CONFIG_KASAN) && !defined(__SANITIZE_ADDRESS__)
+#ifndef __SANITIZE_ADDRESS__
 /*
  * For files that are not instrumented (e.g. mm/slub.c) we
  * should use not instrumented version of mem* functions.
@@ -46,8 +52,9 @@ void *__memmove(void *to, const void *from, __kernel_size_t n);
 #ifndef __NO_FORTIFY
 #define __NO_FORTIFY /* FORTIFY_SOURCE uses __builtin_memcpy, etc. */
 #endif
-
-#endif
+#endif /* !__SANITIZE_ADDRESS__ */
+#endif /* CONFIG_CC_HAS_KASAN_MEMINTRINSIC_PREFIX */
+#endif /* CONFIG_KASAN */
 
 #ifdef CONFIG_PPC64
 #ifndef CONFIG_KASAN
diff --git a/arch/powerpc/kernel/prom_init_check.sh b/arch/powerpc/kernel/prom_init_check.sh
index 311890d71c4c..f3f43a8f48cf 100644
--- a/arch/powerpc/kernel/prom_init_check.sh
+++ b/arch/powerpc/kernel/prom_init_check.sh
@@ -13,8 +13,13 @@
 # If you really need to reference something from prom_init.o add
 # it to the list below:
 
-grep "^CONFIG_KASAN=y$" ${KCONFIG_CONFIG} >/dev/null
-if [ $? -eq 0 ]
+has_renamed_memintrinsics()
+{
+	grep -q "^CONFIG_KASAN=y$" ${KCONFIG_CONFIG} && \
+		! grep -q "^CONFIG_CC_HAS_KASAN_MEMINTRINSIC_PREFIX=y" ${KCONFIG_CONFIG}
+}
+
+if has_renamed_memintrinsics
 then
 	MEM_FUNCS="__memcpy __memset"
 else
-- 
2.39.2.637.g21b0678d19-goog

