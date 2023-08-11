Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D7D779951
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Aug 2023 23:20:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=KEeT3bwg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RMxXK38sTz3cK4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Aug 2023 07:20:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=KEeT3bwg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--justinstitt.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=33axwzaskdlazkijydijyjjweewbu.secbydknffs-tulbyiji.epbqri.ehw@flex--justinstitt.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RMxWP2y7Mz2yVN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Aug 2023 07:19:27 +1000 (AEST)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-d6412374defso2172501276.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Aug 2023 14:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691788765; x=1692393565;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RFrxluOoy6twC+BtLwdF7yyyJ9Z+VqsYDm8spFvMc3o=;
        b=KEeT3bwgLFy9nncUtsA1DUMJ+lw/0tWaAcyjIIb1nTbBe9h5TbDkdkoFdWj0klLLdY
         NjGjXqqFdce2YstjTQv4AXniOjzoMu28xyT5D4d0ahEoSsaQv2JPfHwpqA0NmS6hSaoj
         Ks8ws9d3oxBF4ffFqKww/GZSfMSB6ylltuLMG9B8Zg6oRBC7xMlGlNK4jl0ZbhOlbG98
         etWolJ0AzSzpyRaHQuKDNmGQpHcuo17dYYBylyaUCsXRYpGHnXKDfJYQCid8aAq7N5vB
         /wlg08oiFa/ZVqNwZCHx7vqYFQ8UxrMpuYeUotCGkC4b8VLq5VoF7oCeCmmk9oSwMEZp
         Ds4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691788765; x=1692393565;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RFrxluOoy6twC+BtLwdF7yyyJ9Z+VqsYDm8spFvMc3o=;
        b=FbIqi91Mgm6r66mR/xPi61hJYwklFTKdeaA/wyiKAQqYU9XTOWboSreWaHXITccMzR
         Zp8+rbyOQFhIcsF0uFrbq1uURPc9nfHQVrdZRqqPDJBL3PzOjO8/b/ELRutzY6eTfMwY
         dcPKsGhPWz8Wio4SKJUxMRekYn4Uqmk2NP73t2TolafriJrRtp9ocDcw7SZrquB4ZklN
         /gQ6PBJStO5rf2ijPP6+4+tnMpFT5bc9flab1zF9I6Pv1w+VqP7nfmcyJhWfhsxAYkGw
         72zKeFMs24H24ymA0Xpi7LceWlBQRkbe7SqnUT+JVNQGUdl2BQvhG4FcW84Nb51AqMiv
         ycpw==
X-Gm-Message-State: AOJu0Yz2Ob0mBfndJYPJFszI3xkXz85JUVXZDD/OXSt/gLB25/L9ovXt
	O8Dw/VoeS8wZmRHJcI+79zBiqpnQcf0jRb4mwQ==
X-Google-Smtp-Source: AGHT+IF9Br69ecsKGahyXfFLxWcygWeL+6PwYxobiySkMHlx9q6Oc6i4K3Yd/3AjaZeOGXX0GHjRyimm9VjmKK5cbg==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a25:ad55:0:b0:d4d:8ade:4dfa with SMTP
 id l21-20020a25ad55000000b00d4d8ade4dfamr48994ybe.1.1691788765541; Fri, 11
 Aug 2023 14:19:25 -0700 (PDT)
Date: Fri, 11 Aug 2023 21:19:18 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANal1mQC/x3NTQrCMBBA4auUWTvQpIg/W8EDuJUu0mRqBzQZZ
 opWSu9ucPlt3lvBSJkMzs0KSm82LrnC7RqIU8gPQk7V4FvftUfn0GbNUb4YNE4o5UMqEeUZ5rH oy1Csw/0huJgGH9JpgBoSpZGX/+QOt+sF+m37AXk5aSh5AAAA
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691788764; l=1075;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=UEYyh0BWz2Miih72wZBvRAC+rwc0jWuEQ2qNUTkM5XU=; b=Zlh1YTXz73wMqDpXUvsEhgcdl9DyMmUzchwKzmOb2URaBWyy4LBJQTuQT9BtWkgTvdP5uJxVy
 20A8c1diBa9BvaWKvZttQDKCDc7IH26PulJT/j+2/N0g1J73S5NClwP
X-Mailer: b4 0.12.3
Message-ID: <20230811-strncpy-arch-powerpc-platforms-ps3-v1-0-301052a5663e@google.com>
Subject: [PATCH RFC 0/3] powerpc/ps3: refactor strncpy usage
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

Within this RFC-series I want to get some comments on two ideas that I
have for refactoring the current `strncpy` usage in repository.c.

When looking at `make_first_field` we see a u64 is being used to store
up to 8 bytes from a literal string. This is slightly suspect to me but
it works? In regards to `strncpy` here, it makes the code needlessly
complex imo.

Please see my two ideas to change this and let me know if any other
approaches are more reasonable.

Link: https://github.com/KSPP/linux/issues/90
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Justin Stitt (3):
      [RFC] powerpc/ps3: refactor strncpy usage attempt 1
      [RFC] powerpc/ps3: refactor strncpy usage attempt 2
      [RFC] powerpc/ps3: refactor strncpy usage attempt 2.5

 arch/powerpc/platforms/ps3/repository.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
---
base-commit: 52a93d39b17dc7eb98b6aa3edb93943248e03b2f
change-id: 20230811-strncpy-arch-powerpc-platforms-ps3-57a1cdb2ad9b

Best regards,
--
Justin Stitt <justinstitt@google.com>

