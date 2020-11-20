Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0D72BB943
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Nov 2020 23:42:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CdBPw449mzDr2w
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Nov 2020 09:42:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--morbo.bounces.google.com
 (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com;
 envelope-from=37uw4xwukdf4ikn7kckkcha.8kihejqtll8-9arheopo.kvh67o.knc@flex--morbo.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=bSqMnS2O; dkim-atps=neutral
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CdBN26gSnzDqyw
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Nov 2020 09:40:47 +1100 (AEDT)
Received: by mail-yb1-xb4a.google.com with SMTP id i184so13472798ybg.7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Nov 2020 14:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=d7fl0fThhSjhiBN90Kr8mMkxDJV0yAB+ftlc2k02ID4=;
 b=bSqMnS2OCayQ0njnn6h7CIIgrwFlxOUhPJLbh9Q92joJKIvAqJWYuk8SZVCoQvzzf8
 8leZMSosVpUFZ7vulCNie/XuPvFuoVziKGfEFa/Ba+ISVYmWcF+KZ8vIPwcVkC7nQDP9
 bq5yUydrPCqjDsOrgOeYJzllvaPlHWAoqMAcjuumSrvAmLBOPaP5WTrlTULrG7amKQjd
 TMPZerrAJcK6kJQPsaD0CRK7B12B8tRCT+WlFSl7qW0zrwYwbUU1QCXljokL4a+d9+Iu
 oSrrgwK+cNM1XqONYaob1A7IHjNeAfrNgSh1W1UKV+RTVGtW8FCKOOZZksfq/01sSEb4
 I6nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=d7fl0fThhSjhiBN90Kr8mMkxDJV0yAB+ftlc2k02ID4=;
 b=Zt3HAZFvTOfjymay4UnGVSdSdoxXaNNZCZV4ikz/Npn4MXG6si+FJIFz9Y36UmAb66
 ypHsPjjCre0z8a0v+FFMGFshr1Y6k2UO/NbHCAfghFjEQVE8NjIX7gM4NRpPPvXE0hh6
 BStSdCmQ0RcmHospggCSeazPg+QaCCSxUh9fHb4rOVhgqz+HdWikydw+uKngLR5bCHBj
 gj9oq3o1Qtarl5AyUysx6p37GH4CowG2BOjm1AP7Q36Y4ehLem4YtXBKrlnKy7/w4ifV
 74ARrR33KkA/ehk8zfPOAJwII22kVj0QEO5RD/1Ze60CWVQRwbIMwSDNBs8CaohRyoAK
 U+Lg==
X-Gm-Message-State: AOAM531Lz+5GZc9yyujig+3aL/WlQqmoOBmJtVnVDJc5PTYj376HcnfS
 ZgY+xddX1VFiG+iAorx88ZyANNi+
X-Google-Smtp-Source: ABdhPJzgjdAuRYNu288kB5cMxScJVBMg8nySw3oWF/i7vA7KbVUFG5ZmdAFeAuvGr9irQ/c/WnReZJoBdQ==
X-Received: from fawn.svl.corp.google.com ([100.116.77.50]) (user=morbo
 job=sendgmr) by 2002:a25:468a:: with SMTP id
 t132mr26198019yba.312.1605912045665; 
 Fri, 20 Nov 2020 14:40:45 -0800 (PST)
Date: Fri, 20 Nov 2020 14:40:34 -0800
In-Reply-To: <20201120224034.191382-1-morbo@google.com>
Message-Id: <20201120224034.191382-4-morbo@google.com>
Mime-Version: 1.0
References: <20201118223513.2704722-1-morbo@google.com>
 <20201120224034.191382-1-morbo@google.com>
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
Subject: [PATCH v3 3/3] powerpc/64s: feature: Work around inline asm issues
From: Bill Wendling <morbo@google.com>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
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
Cc: Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The clang toolchain treats inline assembly a bit differently than
straight assembly code. In particular, inline assembly doesn't have the
complete context available to resolve expressions. This is intentional
to avoid divergence in the resulting assembly code.

We can work around this issue by borrowing a workaround done for ARM,
i.e. not directly testing the labels themselves, but by moving the
current output pointer by a value that should always be zero. If this
value is not null, then we will trigger a backward move, which is
explicitly forbidden.

Signed-off-by: Bill Wendling <morbo@google.com>
---
 arch/powerpc/include/asm/feature-fixups.h | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/feature-fixups.h b/arch/powerpc/include/asm/feature-fixups.h
index b0af97add751..f81036518edb 100644
--- a/arch/powerpc/include/asm/feature-fixups.h
+++ b/arch/powerpc/include/asm/feature-fixups.h
@@ -36,6 +36,18 @@ label##2:						\
 	.align 2;					\
 label##3:
 
+/*
+ * If the .org directive fails, it means that the feature instructions
+ * are smaller than the alternate instructions. This used to be written
+ * as
+ *
+ * .ifgt (label##4b-label##3b) - (label##2b-label##1b)
+ *      .error "Feature section else case larger than body"
+ * .endif
+ *
+ * but clang's assembler complains about the expression being non-absolute
+ * when the code appears in an inline assembly statement.
+ */
 #define MAKE_FTR_SECTION_ENTRY(msk, val, label, sect)		\
 label##4:							\
 	.popsection;						\
@@ -48,12 +60,9 @@ label##5:							\
 	FTR_ENTRY_OFFSET label##2b-label##5b;			\
 	FTR_ENTRY_OFFSET label##3b-label##5b;			\
 	FTR_ENTRY_OFFSET label##4b-label##5b;			\
-	.ifgt (label##4b- label##3b)-(label##2b- label##1b);	\
-	.error "Feature section else case larger than body";	\
-	.endif;							\
+	.org . - ((label##4b-label##3b) > (label##2b-label##1b)); \
 	.popsection;
 
-
 /* CPU feature dependent sections */
 #define BEGIN_FTR_SECTION_NESTED(label)	START_FTR_SECTION(label)
 #define BEGIN_FTR_SECTION		START_FTR_SECTION(97)
-- 
2.29.2.454.gaff20da3a2-goog

