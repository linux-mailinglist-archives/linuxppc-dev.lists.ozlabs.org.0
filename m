Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDA16E542F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Apr 2023 23:56:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q0gqt0PCKz3fWr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Apr 2023 07:56:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=6Ok0UESU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--ndesaulniers.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3b8a9zawkdkytjkygartokxymuumrk.iusrotadvvi-jkbroyzy.ufrghy.uxm@flex--ndesaulniers.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=6Ok0UESU;
	dkim-atps=neutral
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q0gn60Mz4z3c7l
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Apr 2023 07:54:17 +1000 (AEST)
Received: by mail-yb1-xb4a.google.com with SMTP id v200-20020a252fd1000000b00b8f548a72bbso12043007ybv.9
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Apr 2023 14:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1681768456; x=1684360456;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TqlZpSOgvA1JLW3vzN7VqdCnxfAnggXybW0yzcDiFj0=;
        b=6Ok0UESUh26svpEt209uFygSyHBhPKwjJP2i5VUax6EplbX8ZR4r9D+qJgxeekR4XK
         6Dh99p7UoZMrY3HwK2wWp4r3Bw6dkbzaFd9ThydtwbIN2I3+eDfYB5ErJoEPmfqghLf0
         rwtmeBkQ+ySc7U5Zs5VZCi/MQrPDjJ84A1VrKMUWBhaBy1lMeMxtLLmbL0QV1WOG1GQf
         cyZNgAai2c6reZrcZzBnC0h2wPIRGVQPX0MliftBNYVAYJnVgnjziz8xTWOMY7e73FNW
         zL8UYzWheabjgDuIuJb6aSMdJR5XSkg3iac6BI0BIPTPysgkzR9ci86tf45CX2FT0U0x
         mfTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681768456; x=1684360456;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TqlZpSOgvA1JLW3vzN7VqdCnxfAnggXybW0yzcDiFj0=;
        b=AdUo8okaASByxxMV3gh9KsXcyRV9JHhEe37dRIvfby9jYLlcUlktvAQZTDufiWuyoi
         7mbzsm8Mz16XUq2qC7Kh+ndhvdmnzG7OF/k5KgnQuUsi1sxXjWsEjwcksmo+2I1VEmUK
         gOphWoxoKpHHZmTBjDyTB5gSIPqy5vByJmLRynWA0g2ouNQhbwmfDzJmJMI8r13ltUBf
         wkXPRdy9tmvYukk27J1aMRF/8QUjwEA2dgDY0qMfplgJOu+iykHwyYoFQcs7FuSvW6RI
         O9/utBoUhcjjlPuXqmeDcb4m5TIe4EGAF6h920vz0ynqvIB9oIlQNdMsKFu04c3qYOHp
         WY5g==
X-Gm-Message-State: AAQBX9fvhOss4RavCwj9pTVHSgCduWRSV2lZ+rHRM1Vtgm1kscHkdojx
	FodCXolDiR9z3J37pMs3MhesBvlsQd7WDDEv9Z0=
X-Google-Smtp-Source: AKy350ba6ZSdzfrXwGQ5fmWTSwEW508zmjFzpnm3zgJ1VAgvkc67q/5rJe5ITrn8QQW6az8rdP0cUFYN1wNh9cRxrW0=
X-Received: from ndesaulniers-desktop.svl.corp.google.com ([2620:15c:2d1:203:e8f1:df30:2fb2:cf8a])
 (user=ndesaulniers job=sendgmr) by 2002:a25:df41:0:b0:b8b:eea7:525e with SMTP
 id w62-20020a25df41000000b00b8beea7525emr10639174ybg.5.1681768455963; Mon, 17
 Apr 2023 14:54:15 -0700 (PDT)
Date: Mon, 17 Apr 2023 14:54:08 -0700
In-Reply-To: <20230412-no_stackp-v1-0-86d2034a4d06@google.com>
Mime-Version: 1.0
References: <20230412-no_stackp-v1-0-86d2034a4d06@google.com>
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=UIrHvErwpgNbhCkRZAYSX0CFd/XFEwqX3D0xqtqjNug=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1681768450; l=1232;
 i=ndesaulniers@google.com; s=20220923; h=from:subject:message-id;
 bh=on2xOURJ9HOGHwPlBJaraE3eCNVECjunAe4jXLZvvs4=; b=BdjqNu+UYyKvhEjP5f6/uO90m0HacK6S31UoWPhMwomn/HE4zn7R//ZaCa1pvzN25cywrCbexalz
 5UZfSBkAD7ZLc+b4TJLKllZ9RD0Vlu6PiiUP8nAw6AhebQv03M0f
X-Mailer: b4 0.12.2
Message-ID: <20230412-no_stackp-v1-2-86d2034a4d06@google.com>
Subject: [PATCH 2/2] start_kernel: omit prevent_tail_call_optimization for
 newer toolchains
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

prevent_tail_call_optimization was added in
commit a9a3ed1eff36 ("x86: Fix early boot crash on gcc-10, third try")
to work around stack canaries getting inserted into functions that would
initialize the stack canary in the first place.

Now that we have no_stack_protector function attribute (gcc-11+,
clang-7+) and use it on start_kernel, remove the call to
prevent_tail_call_optimization such that we may one day remove it
outright.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 init/main.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/init/main.c b/init/main.c
index 1265c8d11052..c6eef497c8c9 100644
--- a/init/main.c
+++ b/init/main.c
@@ -1152,7 +1152,13 @@ void start_kernel(void)
 	/* Do the rest non-__init'ed, we're now alive */
 	arch_call_rest_init();
 
+	/*
+	 * Avoid stack canaries in callers of boot_init_stack_canary for gcc-10
+	 * and older.
+	 */
+#if !__has_attribute(__no_stack_protector__)
 	prevent_tail_call_optimization();
+#endif
 }
 
 /* Call all constructor functions linked into the kernel. */

-- 
2.40.0.634.g4ca3ef3211-goog

