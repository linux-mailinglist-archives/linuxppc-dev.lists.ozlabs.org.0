Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C296E5484
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Apr 2023 00:02:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q0gyv3qMcz3fS2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Apr 2023 08:02:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=Dcz34byV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--ndesaulniers.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3cme9zawkdbm6wxbtd461xabz77z4x.v75416dg88v-wxe41bcb.7i4tub.7az@flex--ndesaulniers.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=Dcz34byV;
	dkim-atps=neutral
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q0gw24chTz3c7s
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Apr 2023 08:00:18 +1000 (AEST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-54be7584b28so364120627b3.16
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Apr 2023 15:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1681768816; x=1684360816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TqlZpSOgvA1JLW3vzN7VqdCnxfAnggXybW0yzcDiFj0=;
        b=Dcz34byVNZ9qV9IHk+YJ26BuUvaX6xN3JD1MLhhcg+vEs73z+4DnMFKPv1CZTPJDF9
         w5SErioB3/0qSbvCl7uZpcEP6ZuqhB4vtU9mU5iuvQSugVPtH29I+Vm9c15JkMxaP85s
         iDQ1jMAUki4MIVgrwkG9R4ZDzhSfvpvlfCfLeWD3uQp73n/8wfFBbq3G6XZ1cSoiSSCn
         br6k8v1KzuB8xzOZTiPzGtYBICkELxBLosBaF3DpddrqMKiuYqrtLVQGIXuvEygPzalq
         6A0hr6MADiEnlazeG1YRI5wVPCs0Px0nBb9Cv15BR09WFBqBXamuwWE9fHKuVeQ76WdC
         lzgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681768816; x=1684360816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TqlZpSOgvA1JLW3vzN7VqdCnxfAnggXybW0yzcDiFj0=;
        b=GUuCThVCBPm1O/5nnWjduec6PBI6YIJ4nWnghuiQN4C1Pys7v6BIwPzZ65JgvLjkmu
         fkuzGwxApIzOcyITts69jkEooFZCb6Z2XXNiQcIoc/9E+ZJdUq4DtXjG0HysXkqVh3j9
         ZF8XCUkufZmFYgNuqnLAYIzf+jMBQ0IUCq2CzM+9n+K1j+W4XVtSJ029nxm9pNeAcoHC
         0efP/xda2dDMA6lrgkprYQmKoIp8tjC1SUNvLD1oJGzkDEP9kjrs9XWV0vwKxVt3s7Ar
         Q9nlDyHlczhz+VbbPQyGG6Qi+wxnI27C4fxAFZwUu9YrKMQTUB7HhyRPgRTDsu3iEtCd
         8Krw==
X-Gm-Message-State: AAQBX9eU1aibdOtdDoz36TKVzNjJXRVA9mB425fFKPWczCyP/IKglYP4
	DpEAAqBD5aAQuhco3qqIwFqnkfKTrHYFb4yEpH4=
X-Google-Smtp-Source: AKy350bI3hEMdN9THadORatwbKgb2gSp9/Sr1mQyCa7cKJufbONuj5Uq6gacrQcy+GEB1jC8NAtAPrOU9H1jIKB1E7c=
X-Received: from ndesaulniers-desktop.svl.corp.google.com ([2620:15c:2d1:203:e8f1:df30:2fb2:cf8a])
 (user=ndesaulniers job=sendgmr) by 2002:a25:ca83:0:b0:b8f:6944:afeb with SMTP
 id a125-20020a25ca83000000b00b8f6944afebmr7279341ybg.3.1681768816329; Mon, 17
 Apr 2023 15:00:16 -0700 (PDT)
Date: Mon, 17 Apr 2023 15:00:06 -0700
In-Reply-To: <20230412-no_stackp-v2-0-116f9fe4bbe7@google.com>
Mime-Version: 1.0
References: <20230412-no_stackp-v2-0-116f9fe4bbe7@google.com>
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=UIrHvErwpgNbhCkRZAYSX0CFd/XFEwqX3D0xqtqjNug=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1681768810; l=1232;
 i=ndesaulniers@google.com; s=20220923; h=from:subject:message-id;
 bh=on2xOURJ9HOGHwPlBJaraE3eCNVECjunAe4jXLZvvs4=; b=L0214FF9WU+WhlG7EzCoRDmJSFHfOLYgc5DpN0xGXJqbxpSQab4viRMfkP8gWde2O8Yg/xXdIYYu
 vTfwxxyzATDCCks6/5GnQp2JFk73gQwqAoQ2jgZRGhol7n4bDB+1
X-Mailer: b4 0.12.2
Message-ID: <20230412-no_stackp-v2-2-116f9fe4bbe7@google.com>
Subject: [PATCH v2 2/2] start_kernel: omit prevent_tail_call_optimization for
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

