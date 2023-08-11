Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05640779953
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Aug 2023 23:21:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=tOsdQnkR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RMxYG5chfz3cRq
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Aug 2023 07:21:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=tOsdQnkR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--justinstitt.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=33qxwzaskdlealjkzejkzkkxffxcv.tfdczeloggt-uvmczjkj.fqcrsj.fix@flex--justinstitt.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RMxWP3KMTz2yVr
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Aug 2023 07:19:28 +1000 (AEST)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-d1ebc896bd7so2449036276.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Aug 2023 14:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691788766; x=1692393566;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vokOFglu6CNVFlD6jFxpsLrBcNE5errPjKaL6LUnglg=;
        b=tOsdQnkRdFPySXJ7aBEL+kY5112HthEEIawDywYABXxp9YXRYroZTrYNW87VUbeR6w
         gnfsPvSydIxNPCx/RPtTkwb6RerMKsEuJIyl7U/C3waNbaU7wr0JImPoka2YzlVj0Ih8
         6pjOc1L9fBFcSIVBUDCD8S6uX7hs8crgEnCNZot4mKk3eGHefKgu8OYgILc1VkUwX0Wl
         H7pBqE0CQNiBloC4RhooFEGfnMWOFZzd60L6EAZXRDFhGV2IqF04UdrS/6MXav7kuvc8
         66Sk1UukGjP11WxYjJFMcVJQXQF9NcICKPD23LYMz+JPCT1jjKnprYFqeweidJ1zEKsy
         tNTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691788766; x=1692393566;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vokOFglu6CNVFlD6jFxpsLrBcNE5errPjKaL6LUnglg=;
        b=ESCO75iixH3nCu2xVY5H8DnqPTLUPn01bua1IL044IVQbJ/Ir9CLSJUzD+srCn1Rlt
         ixSusHC8b7VzZcgvm0WP/jf3LvsQiN19IE9TNjVOQaAzOD3TsFar5QheOLmYGb5jIGYZ
         RSCH/FfI6lvtKkiu7IqVj4pLtAg64i+WNCyBdmBnvLksSzdxk0SKGLdWvDi8o57sz3tx
         ZgnG4+a3sbKVM4uDoGog16AzBGI0y6ZB29abCu6/Tz+aeXWGS+YJQwZkgOONBOx8/YFs
         1y0Zaiw29nqfr5+TTQ+g7x11SpHQBLPpsWuIyTbyd9eUKcLmteeX1QsJtnzAkzLjkE77
         QL1w==
X-Gm-Message-State: AOJu0YzB7CCwhzknIMePURvl89Fnr4XxJa7i52ESvtrrxOvXLwgcnhuJ
	CcWgGkz+VOZQasclNGJNqjzcxCUzfgPG1OoJbw==
X-Google-Smtp-Source: AGHT+IH3i5ZHuMThcQNM8zp+I7k8FNd7+Of/quUCUxdMUbD/p45+H7KNRGfsu23iJhRFAio31HZ5RFrQ44ATxZZpGQ==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a25:dcc2:0:b0:d12:d6e4:a08f with SMTP
 id y185-20020a25dcc2000000b00d12d6e4a08fmr47833ybe.6.1691788766690; Fri, 11
 Aug 2023 14:19:26 -0700 (PDT)
Date: Fri, 11 Aug 2023 21:19:19 +0000
In-Reply-To: <20230811-strncpy-arch-powerpc-platforms-ps3-v1-0-301052a5663e@google.com>
Mime-Version: 1.0
References: <20230811-strncpy-arch-powerpc-platforms-ps3-v1-0-301052a5663e@google.com>
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691788764; l=878;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=rykhGlCJgq/28Gofw5R06xkjvMhLluFR9H0cPPJUQmM=; b=dqa+uC3ZSEDoM05puhWT3wolaXk7hfvs4+6yIWB8tO66gB9QZCYN9RSLwV2BvBVVbMLw1tvkc
 4a2Vy7MXx8vCn44O2/F7Pbs8dDN7gJ5VA3oINrtf5Q66VN6jNZDUZnG
X-Mailer: b4 0.12.3
Message-ID: <20230811-strncpy-arch-powerpc-platforms-ps3-v1-1-301052a5663e@google.com>
Subject: [PATCH RFC 1/3] powerpc/ps3: refactor strncpy usage attempt 1
From: Justin Stitt <justinstitt@google.com>
To: Geoff Levand <geoff@infradead.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>
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
Cc: Kees Cook <keescook@chromium.org>, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, linux-hardening@vger.kernel.org, Justin Stitt <justinstitt@google.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This approach simply replicates the implementation of `make_field` which
means we drop `strncpy` for `memcpy`.

Signed-off-by: Justin Stitt <justinstitt@google.com>
---
 arch/powerpc/platforms/ps3/repository.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/ps3/repository.c b/arch/powerpc/platforms/ps3/repository.c
index 205763061a2d..1abe33fbe529 100644
--- a/arch/powerpc/platforms/ps3/repository.c
+++ b/arch/powerpc/platforms/ps3/repository.c
@@ -73,9 +73,9 @@ static void _dump_node(unsigned int lpar_id, u64 n1, u64 n2, u64 n3, u64 n4,
 
 static u64 make_first_field(const char *text, u64 index)
 {
-	u64 n;
+	u64 n = 0;
 
-	strncpy((char *)&n, text, 8);
+	memcpy((char *)&n, text, strnlen(text, sizeof(n)));
 	return PS3_VENDOR_ID_NONE + (n >> 32) + index;
 }
 

-- 
2.41.0.640.ga95def55d0-goog

