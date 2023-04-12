Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D326DFD8F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Apr 2023 20:33:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PxWYH0kVpz3fQk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Apr 2023 04:33:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=iXUKQ4qf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--ndesaulniers.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3mvk2zawkdcksijxfzqsnjwxlttlqj.htrqnszcuuh-ijaqnxyx.teqfgx.twl@flex--ndesaulniers.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=iXUKQ4qf;
	dkim-atps=neutral
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PxWXP3Chdz3cjC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Apr 2023 04:32:20 +1000 (AEST)
Received: by mail-yb1-xb4a.google.com with SMTP id c67-20020a254e46000000b00b88f1fd158fso28678267ybb.17
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Apr 2023 11:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1681324338; x=1683916338;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=B8Xgas6M12Xeefyhuwpcw2QRuGFdbq5fzUL3tcrdyh4=;
        b=iXUKQ4qfjAJuEFEwE7bdAyWokHRp29Bkdy0/40Xr1KYAPy/R1oFAjwtb5MfmqW0MEL
         CuMyB/Pib2tveCK9kHWVq0CiC/kOMqR+mKlYwJ0ZqrxrTANHa7sorz9Zb5Xm++r51iTF
         4IOQi3aUhO+VEmKHgjdbJldVaRYantgbmWt7Iy9cOgwpY1EmH6XE2TqYbDyjg+J45Moa
         /f0VTPjJRc2yHFY8tos/JCnb5PUKaLk3rH9Y5dWztWapkP1cEiHqSc08rF+6dOVbCjFO
         gGtOWaoMZZ+Ky2GC29N8XqY/5KoA3WJyFQ5WLZUhlxCVgEIbZRD9pfULe4snmF45XhLl
         HhEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681324338; x=1683916338;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B8Xgas6M12Xeefyhuwpcw2QRuGFdbq5fzUL3tcrdyh4=;
        b=Y80OlZKkkJfoWOBpmE0sdYoJ7giI6mmCLza8/eLBpx4mBVSucaoR+W4IKxn1/fB991
         YtPSPaFCAH8zNR5FmrwlVmrZMGDBMgHxIJq4RpLDbW5HjXn2ZR3pWFef5lS1pTy2GjvJ
         B20e511OEy+6yP7OUFzuKxFoldqYmN0giZ7vQUujm5blKi6yOe+sSgeEW9GZsWl+xcNV
         SqKNrgS/grhlSfaQhRAq0TrNxSh6MlfDNOLDWtdIFxiRQnaQwJ1tLOWuSLcHQ2yZ+WnF
         Zuhi45KTIRYJXtaa+sg7rVskVC3edjxpLrgE5BsJi3HCXsg+nXXLE8IVYfGYjN9pE8Oq
         9VTQ==
X-Gm-Message-State: AAQBX9cUGimOZRfu8O80oPe6ZNaoxUqNAe6DvNzvxGkWD6ob9ubAjivm
	J9Z/2QX6BCVPC5j7jisXFteiy3/SD3EtODOGSeI=
X-Google-Smtp-Source: AKy350ZhORFRgJUhNBaLXid7ygzoYPP5dfsoaQnQskVB+BY7JA/4LnvZjY2JChL2Zljh+aTmG9RZ34lscPJ7XcDFS90=
X-Received: from ndesaulniers-desktop.svl.corp.google.com ([2620:15c:2d1:203:4a4a:51a1:19b:61ab])
 (user=ndesaulniers job=sendgmr) by 2002:a25:cc82:0:b0:b76:ceb2:661b with SMTP
 id l124-20020a25cc82000000b00b76ceb2661bmr2380016ybf.3.1681324338347; Wed, 12
 Apr 2023 11:32:18 -0700 (PDT)
Date: Wed, 12 Apr 2023 11:32:13 -0700
In-Reply-To: <20230412-no_stackp-v1-0-46a69b507a4b@google.com>
Mime-Version: 1.0
References: <20230412-no_stackp-v1-0-46a69b507a4b@google.com>
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=UIrHvErwpgNbhCkRZAYSX0CFd/XFEwqX3D0xqtqjNug=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1681324332; l=1116;
 i=ndesaulniers@google.com; s=20220923; h=from:subject:message-id;
 bh=s0k+6zvdpnLQbD0+TLmmKpo5vAb09vI+qi7R6I+XsOY=; b=haZdkgE6f9QEECC4Hsv98p4rJHUbeBYImb1czOd8DpDLHJCRdPdH3Tdj+/a/776i2EokUGbMCSDu
 nT26vAGYDn2j4pldHwJAdweaA6wBsljZvKEypjxart3UNyaO9cSw
X-Mailer: b4 0.12.2
Message-ID: <20230412-no_stackp-v1-2-46a69b507a4b@google.com>
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

Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 init/main.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/init/main.c b/init/main.c
index 213baf7b8cb1..c8503d02dfa6 100644
--- a/init/main.c
+++ b/init/main.c
@@ -1152,7 +1152,12 @@ void start_kernel(void)
 	/* Do the rest non-__init'ed, we're now alive */
 	arch_call_rest_init();
 
+	/* Avoid stack canaries in callers of boot_init_stack_canary for gcc-10
+	 * and older.
+	 */
+#if !__has_attribute(__no_stack_protector__)
 	prevent_tail_call_optimization();
+#endif
 }
 
 /* Call all constructor functions linked into the kernel. */

-- 
2.40.0.577.gac1e443424-goog

