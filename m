Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FD86E542E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Apr 2023 23:55:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q0gpx3l48z3fSy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Apr 2023 07:55:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=EGPv0nIK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--ndesaulniers.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3bma9zawkdkmqghvdxoqlhuvjrrjoh.frpolqxassf-ghyolvwv.rcodev.ruj@flex--ndesaulniers.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=EGPv0nIK;
	dkim-atps=neutral
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q0gn50Zqmz3c7l
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Apr 2023 07:54:15 +1000 (AEST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-54c17fb245dso302874287b3.21
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Apr 2023 14:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1681768452; x=1684360452;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2duZpU/eZSHwLEuEsM1wPgBeCX6HIty9VCVJmbcQV60=;
        b=EGPv0nIKb92KJl2AeUoGYOvzu2GzLLkcrRkOqzZbkVTtocbB74qlqJ1si4fSVdh/h+
         1J5kC1OZoYxKKorE1TvmyuyYBmzeGVTS4Fqrd3BtAb7FqvjxPGnK2sgvyvSFSxYctW2h
         ANHO92O27UNVNjVIDuooFZIj03mkP23njYnSNkTyXI4OYYSghFk+g5v4guojvm9AkkRG
         0hBsdKIQHGu0jMOPX1Ho4to0yX+YJ70q01re5chTK8WY/tYSx8+LPWfP0k9KGqwSKLnM
         /yige6n1AY44bbJsZoeyYWuytUiCjKDj9xuuznDt4TGhHV5eT7XUfdKdUigFxU7r4q7B
         Txiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681768452; x=1684360452;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2duZpU/eZSHwLEuEsM1wPgBeCX6HIty9VCVJmbcQV60=;
        b=l2XZ8MawsiChZArZOtNbt5fvo+NQ5FAQRtiIJKtUpOcatVJzYmQta4UdTMKcHM1My0
         fg+E3RXsmf7wRrJcfWOL7uRIvEwaL6vrJhuZk/dORMdU3Ql9tkJEiHBPSNFoVjCqDZBj
         cGkkyFCV6GoyUsYi4kPv8scJNhdfGBfCvEv3/vVV0J+vayahAV2tRi5wiD26LtPAtL7I
         7L0VnMhGnplH9hAWJdM3szmV0zrpsgtHrSSyBzldRzseW+2/6A2WArC/vQeTOvAsiAYd
         B66oQzOLDEUuseF63ENyVU0W3qgTeKiEsg1tGPM/0Y9f3aSY5oP84BDr+ipqO8Kz+B6B
         jAtA==
X-Gm-Message-State: AAQBX9fnWceOO0hiys+XgkKzrEB/u8K8yXXFf3Z6eAZT4p7yXFlqQzZL
	pXMPG+noShoY7JYfocvrTlv/81Zc5MQ7I+uLPCk=
X-Google-Smtp-Source: AKy350bIM/+HmY5iRKBfThLeZwd20fzSuyCq4zowHtLOJDiE6fNyk+ekeEHxUCL4XgtTzddlr5PgLT1dEC9CUhSq70o=
X-Received: from ndesaulniers-desktop.svl.corp.google.com ([2620:15c:2d1:203:e8f1:df30:2fb2:cf8a])
 (user=ndesaulniers job=sendgmr) by 2002:a25:d2d4:0:b0:b95:31a3:9d89 with SMTP
 id j203-20020a25d2d4000000b00b9531a39d89mr196920ybg.2.1681768452185; Mon, 17
 Apr 2023 14:54:12 -0700 (PDT)
Date: Mon, 17 Apr 2023 14:54:06 -0700
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAP6/PWQC/w3LQQqAIBBA0avErBPUIqzLxGhDSjKFU22ku+fyw
 f8VhEoigaWrUOhNkk5uMH0HISLvpNLWDFbbQY/GKj5XuTEcl8LZmcmh9V4jtN6jkPIFOcR28JP z9/3pKfYIYAAAAA==
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=UIrHvErwpgNbhCkRZAYSX0CFd/XFEwqX3D0xqtqjNug=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1681768450; l=3460;
 i=ndesaulniers@google.com; s=20220923; h=from:subject:message-id;
 bh=L+SfgiE84uBc6ASyb4ccLntQBYnB84v4M07YkhSItYs=; b=4kZW7sG9q2UtgI9ubA8EgzqIsMnQxqatdhYmJO4idn8myvviWXNOOFewD85rUB0y0u81BbCMNooI
 zCEPcp69Dm/hm+rT4UXEpfh4JM2fH/b2vuzJmV5MKfrL0u0Jpfvi
X-Mailer: b4 0.12.2
Message-ID: <20230412-no_stackp-v1-0-86d2034a4d06@google.com>
Subject: [PATCH 0/2] start_kernel: omit stack canary
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

A security research paper was recently published detailing Catch Handler
Oriented Programming (CHOP) attacks.
https://download.vusec.net/papers/chop_ndss23.pdf
The TL;DR being that C++ structured exception handling runtimes are
attractive gadgets for Jump Oriented Programming (JOP) attacks.

In response to this, a mitigation was developed under embargo in
clang-16 to check the stack canary before calling noreturn functions.
https://bugs.chromium.org/p/llvm/issues/detail?id=30

This started causing boot failures in Android kernel trees downstream of
stable linux-4.14.y that had proto-LTO support, as reported by Nathan
Chancellor.
https://github.com/ClangBuiltLinux/linux/issues/1815

Josh Poimboeuf recently sent a series to explicitly annotate more
functions as noreturn. Nathan noticed the series, and tested it finding
that it now caused boot failures with clang-16+ on mainline (raising the
visibility and urgency of the issue).
https://lore.kernel.org/cover.1680912057.git.jpoimboe@kernel.org/
V2 of this series is rebased on tip/objtool/core @
88b478ee5c7b080b70c68d6e9b3da6c2b518ceb0 now that that series has been
picked up.

Once the embargo was lifted, I asked questions such as "what does C++
structured exception handling have to do with C code" and "surely GCC
didn't ship the same mitigation for C code (narrator: 'They did not:
https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=a25982ada523689c8745d7fb4b1b93c8f5dab2e7')?"

I now have a patch out for LLVM to undo this mess (or at least limit it
to C++ functions that may throw, similar to GCC's mitigation); it hasn't
landed yet but we're close to consensus and I expect it to land
imminently.
https://reviews.llvm.org/D147975

Remember this thread?  (Pepperidge farms remembers...)
https://lore.kernel.org/all/20200314164451.346497-1-slyfox@gentoo.org/

That reminded me that years ago we discussed a function attribute for
no_stack_protector.
https://lore.kernel.org/all/20200316130414.GC12561@hirez.programming.kicks-ass.net/

GCC didn't have one at the time, it now does. In addition to the LLVM
fix, I'd like to introduce this in the kernel so that we might start
using it in additional places:
* https://lore.kernel.org/linux-pm/20200915172658.1432732-1-rkir@google.com/
* https://lore.kernel.org/lkml/20200918201436.2932360-30-samitolvanen@google.com/
And eventually remove the final macro expansion site of
prevent_tail_call_optimization.

With the LLVM fix, this series isn't required, but I'd like to start
paving the way to use these function attributes since I think they are a
sweet spot in terms of granularity (as opposed to trying to move
start_kernel to its own TU compiled with -fno-stack-protector).

Changes V1 -> V2:
* Rebase to avoid conflicts with Josh's changes.
* Fix comment style as per Peter.
* Pick up tags.

Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
Nick Desaulniers (2):
      start_kernel: add no_stack_protector fn attr
      start_kernel: omit prevent_tail_call_optimization for newer toolchains

 arch/powerpc/kernel/smp.c           |  1 +
 include/linux/compiler_attributes.h | 12 ++++++++++++
 init/main.c                         |  9 ++++++++-
 3 files changed, 21 insertions(+), 1 deletion(-)
---
base-commit: 88b478ee5c7b080b70c68d6e9b3da6c2b518ceb0
change-id: 20230412-no_stackp-a98168a2bb0a

Best regards,
-- 
Nick Desaulniers <ndesaulniers@google.com>

