Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF136DFD93
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Apr 2023 20:34:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PxWb70JGrz3fWy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Apr 2023 04:34:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=gHtYL1L3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--ndesaulniers.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3mpk2zawkdccqghvdxoqlhuvjrrjoh.frpolqxassf-ghyolvwv.rcodev.ruj@flex--ndesaulniers.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=gHtYL1L3;
	dkim-atps=neutral
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PxWXP33Syz3chq
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Apr 2023 04:32:19 +1000 (AEST)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-54f93850a86so27195387b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Apr 2023 11:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1681324336; x=1683916336;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fu4wMIjRXEHdvIAwW21s7RwYEcTiORI4Tua6uqoa9YY=;
        b=gHtYL1L3/MvRx5+mmiO9Wf9I61eB9gEc5SLBb5X0RkYhVx2IUwIvZ4eFfKGyhti9qt
         abv/ESGYY+yJF5e2O69qmnMZQLbaQqpTPNl6fvdRPCn3IXd3hMLTLkCAacP+kp7VUjsL
         h8JSdDLKIsIkBXiji42s5ULPXJuYFkWXJLT52AfWqtVn3JsapSovcT0pJ57e1bSFl1cs
         The24q4o/DhN9pJXCZI3/gpnjfVjKPe2K+UFlIsN8KO2md9x1IH/wMpi4Dd6svXJUNjv
         7FtH7mz7iW0t+6Uid5pZXa2FZ3IxQpMMNYGm9wFi/QzIe3O46eBA1oRhE5p59uiEZpS2
         bxvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681324336; x=1683916336;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fu4wMIjRXEHdvIAwW21s7RwYEcTiORI4Tua6uqoa9YY=;
        b=ddjrnqy5iDYtlg1Z/uPCmYIorAAnCHkoxIvbCR/EqqOSlfeWsl+NAv5I5Mi0gti6H7
         7j23fn6MJ0dBUaHH5UCpoquWcaOjWr7ksdCd2c7TTChb7eP2OF12BbPGRe3nvoWhr1tZ
         vrAxT+yUazWb8sgH/4qKGnn33AS69YZ4Kxnzqf0hlyz9bEu8tyGqGXQkuAH9Nxvs2GBJ
         DvdLAZM1HSL8/P+7yYhmR/MpyJmNYw8T95WuPFvWaW/+pT7hFxyihf81P4EQdXrSoqoP
         7Z7CJOFLGI9sKeN5egwL2gtttoh5SMyfIzZIhU7MwD20BCvx8BYQA5c6ZBXPwdJOSsiu
         P+yA==
X-Gm-Message-State: AAQBX9c2WmIjApCZl1N3EilNcZqXYR4EhSiRWoc4SlDqWQwstn3pL7We
	ndbyBAEQziuifG+jpL/ynXClQM1xfoBP3ZXRgNM=
X-Google-Smtp-Source: AKy350abn/nvm+6v8bngXNPwCS/keNIyrgzi3uj9PPb3yS2giiIBty1sJGwk06JnKuByumvuAeJrKEZwvKrU4mAm2fU=
X-Received: from ndesaulniers-desktop.svl.corp.google.com ([2620:15c:2d1:203:4a4a:51a1:19b:61ab])
 (user=ndesaulniers job=sendgmr) by 2002:a25:d252:0:b0:b8e:c5fd:975f with SMTP
 id j79-20020a25d252000000b00b8ec5fd975fmr8449875ybg.3.1681324336255; Wed, 12
 Apr 2023 11:32:16 -0700 (PDT)
Date: Wed, 12 Apr 2023 11:32:12 -0700
In-Reply-To: <20230412-no_stackp-v1-0-46a69b507a4b@google.com>
Mime-Version: 1.0
References: <20230412-no_stackp-v1-0-46a69b507a4b@google.com>
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=UIrHvErwpgNbhCkRZAYSX0CFd/XFEwqX3D0xqtqjNug=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1681324332; l=2837;
 i=ndesaulniers@google.com; s=20220923; h=from:subject:message-id;
 bh=pax/072S3TetamqDDk+xEdd8LMndD88F0z/jWCgSc+c=; b=feWilMtakyMgYgr44+djznmjdmueETxHFBPKkFfWW1bTH1HVyqY78TgWu5FMpzJWsr6r8lOEfOQg
 4lcKCpVTBZeg36Olp5RFv6nHXPeF88zfaB0JkhsSb1cZw/oGAehf
X-Mailer: b4 0.12.2
Message-ID: <20230412-no_stackp-v1-1-46a69b507a4b@google.com>
Subject: [PATCH 1/2] start_kernel: add no_stack_protector fn attr
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
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 arch/powerpc/kernel/smp.c           |  1 +
 include/linux/compiler_attributes.h | 12 ++++++++++++
 init/main.c                         |  3 ++-
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 6b90f10a6c81..7d4c12b1abb7 100644
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
index bb87b789c543..213baf7b8cb1 100644
--- a/init/main.c
+++ b/init/main.c
@@ -941,7 +941,8 @@ static void __init print_unknown_bootoptions(void)
 	memblock_free(unknown_options, len);
 }
 
-asmlinkage __visible void __init __no_sanitize_address start_kernel(void)
+asmlinkage __visible __init __no_sanitize_address __no_stack_protector
+void start_kernel(void)
 {
 	char *command_line;
 	char *after_dashes;

-- 
2.40.0.577.gac1e443424-goog

