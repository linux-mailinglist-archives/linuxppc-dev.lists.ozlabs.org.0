Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 297456E5482
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Apr 2023 00:01:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q0gxx0SNTz3f82
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Apr 2023 08:01:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=a//CU5GA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--ndesaulniers.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3bse9zawkdbe4uv9rb24zv89x55x2v.t532z4be66t-uvc2z9a9.5g2rs9.58x@flex--ndesaulniers.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=a//CU5GA;
	dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q0gw23VK9z3c3w
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Apr 2023 08:00:18 +1000 (AEST)
Received: by mail-yb1-xb49.google.com with SMTP id f66-20020a255145000000b00b7f75c3cafdso9488179ybb.16
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Apr 2023 15:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1681768814; x=1684360814;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1ROFbMOV6yOo0pF0esK8s0D/4X+P3zglkAv5TCX1cqs=;
        b=a//CU5GAM8cMAJg0CXk4u7gyVLyPhgoZa7x1mGzF/rQPaDLgId/wanEXVqOxXOn+kM
         nYLD5qN/wOUNiFXB0cOc5R3SjZ2OTsHezj0xJbZPmD04sovR1oR5JJGJ/aDfV/cxg3Vd
         LgqjpqZPYfBA1ZhN1IOrM/axxWBCDvl7JA0F8QM1Y1Uc2mEqoG5u1bxgNIRw334OOzg3
         u80lcm6pZMmZoeqG/pLfdVpQafV6hDgyAOCWGYImDTzb2WmqZExgTAbnR58VnCZyCFuV
         TOvJZzJ4Y16C0wl8Sww6Vf9mTUlZvH9no4BT2ZF4AVgExEoUSCU0mCL3ElUO8LkHYyDU
         qENQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681768814; x=1684360814;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1ROFbMOV6yOo0pF0esK8s0D/4X+P3zglkAv5TCX1cqs=;
        b=S1EY91xm1YVK2OrswGO+QB0ozdFOQDfHieLNoTcMOCiPE0YAN/Q/ogqEY2qWHvlaQN
         32w+Udi18Y8hD+ndhHS3jU54sn0XyrxR57XZJH9t1t5ph3imXo+oG8cOWhqJbPOUnYEf
         dIkB0yO4TgAEjjrdMMezCIG43UjKQiqELAwtmJdBrJNwCWQfnJE7LzLivlEtUlFOkMrK
         0BbJrdE50vK36sJfSD7X8MykRQ460qDVfOhmOSRXJm2e5QD8KG1bszUt1wW0RgQL085s
         +hAFte+jpvZearOjjfG97fQr7vVoWQB+DM65hi3MPVwsQj1nvarZaXJwY9dLXCa7EZkc
         IlzA==
X-Gm-Message-State: AAQBX9f/HiNbgQoPuWy9YhFTAK8kd31vbnpZ+3RinYaXbIc/wgZSbNyo
	4qHJ0zIj/HtgspXzK9s89D3JoGv+SBf9k2hucbM=
X-Google-Smtp-Source: AKy350aj8hcRq7cSR+KhDqJVKAfpqj5aUFTlQ600+8xvMXvQ8sXvA/YNrOWGMc/8TS/lRXrMEe/ZtGrMgU+SJgwEYDs=
X-Received: from ndesaulniers-desktop.svl.corp.google.com ([2620:15c:2d1:203:e8f1:df30:2fb2:cf8a])
 (user=ndesaulniers job=sendgmr) by 2002:a25:d24e:0:b0:b8b:eea7:525b with SMTP
 id j75-20020a25d24e000000b00b8beea7525bmr10333781ybg.7.1681768814180; Mon, 17
 Apr 2023 15:00:14 -0700 (PDT)
Date: Mon, 17 Apr 2023 15:00:05 -0700
In-Reply-To: <20230412-no_stackp-v2-0-116f9fe4bbe7@google.com>
Mime-Version: 1.0
References: <20230412-no_stackp-v2-0-116f9fe4bbe7@google.com>
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=UIrHvErwpgNbhCkRZAYSX0CFd/XFEwqX3D0xqtqjNug=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1681768810; l=3068;
 i=ndesaulniers@google.com; s=20220923; h=from:subject:message-id;
 bh=Y+mVeYQgxmjVxZ8TAgHiUAti6DIYAGqhexs7SrW7nh8=; b=k+bDSjx2YwwBdTyaFSoJ/8gMZw5tWZUIXNTaKWaFoZOH6WdmTdy6AGNiUQAbqdFMIvIdWAOy0t2k
 GvvIDyIJAK3E9qe3zp8TVxxLQwxMwt4iYQrdD0fLqDyjKVw0SXFx
X-Mailer: b4 0.12.2
Message-ID: <20230412-no_stackp-v2-1-116f9fe4bbe7@google.com>
Subject: [PATCH v2 1/2] start_kernel: add no_stack_protector fn attr
From: ndesaulniers@google.com
To: "Borislav Petkov (AMD)" <bp@alien8.de>
Content-Type: text/plain; charset="utf-8"
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
Cc: llvm@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>, x86@kernel.org, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Tom Rix <trix@redhat.com>, Miguel Ojeda <ojeda@kernel.org>, linuxppc-dev@lists.ozlabs.org, Josh Poimboeuf <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Back during the discussion of
commit a9a3ed1eff36 ("x86: Fix early boot crash on gcc-10, third try")
we discussed the need for a function attribute to control the omission
of stack protectors on a per-function basis; at the time Clang had
support for no_stack_protector but GCC did not. This was fixed in
gcc-11. Now that the function attribute is available, let's start using
it.

Callers of boot_init_stack_canary need to use this function attribute
unless they're compiled with -fno-stack-protector, otherwise the canary
stored in the stack slot of the caller will differ upon the call to
boot_init_stack_canary. This will lead to a call to __stack_chk_fail
then panic.

Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=94722
Link: https://lore.kernel.org/all/20200316130414.GC12561@hirez.programming.kicks-ass.net/
Tested-by: Nathan Chancellor <nathan@kernel.org>
Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
Acked-by: Miguel Ojeda <ojeda@kernel.org>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 arch/powerpc/kernel/smp.c           |  1 +
 include/linux/compiler_attributes.h | 12 ++++++++++++
 init/main.c                         |  3 ++-
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index f62e5e651bcd..48acae0da034 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1603,6 +1603,7 @@ static void add_cpu_to_masks(int cpu)
 }
 
 /* Activate a secondary processor. */
+__no_stack_protector
 void start_secondary(void *unused)
 {
 	unsigned int cpu = raw_smp_processor_id();
diff --git a/include/linux/compiler_attributes.h b/include/linux/compiler_attributes.h
index e659cb6fded3..84864767a56a 100644
--- a/include/linux/compiler_attributes.h
+++ b/include/linux/compiler_attributes.h
@@ -255,6 +255,18 @@
  */
 #define __noreturn                      __attribute__((__noreturn__))
 
+/*
+ * Optional: only supported since GCC >= 11.1, clang >= 7.0.
+ *
+ *   gcc: https://gcc.gnu.org/onlinedocs/gcc/Common-Function-Attributes.html#index-no_005fstack_005fprotector-function-attribute
+ *   clang: https://clang.llvm.org/docs/AttributeReference.html#no-stack-protector-safebuffers
+ */
+#if __has_attribute(__no_stack_protector__)
+# define __no_stack_protector		__attribute__((__no_stack_protector__))
+#else
+# define __no_stack_protector
+#endif
+
 /*
  * Optional: not supported by gcc.
  *
diff --git a/init/main.c b/init/main.c
index 5d6365510173..1265c8d11052 100644
--- a/init/main.c
+++ b/init/main.c
@@ -941,7 +941,8 @@ static void __init print_unknown_bootoptions(void)
 	memblock_free(unknown_options, len);
 }
 
-asmlinkage __visible void __init __no_sanitize_address __noreturn start_kernel(void)
+asmlinkage __visible __init __no_sanitize_address __noreturn __no_stack_protector
+void start_kernel(void)
 {
 	char *command_line;
 	char *after_dashes;

-- 
2.40.0.634.g4ca3ef3211-goog

