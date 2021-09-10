Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE574073FA
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Sep 2021 01:41:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H5spk13DJz2yxj
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Sep 2021 09:41:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=H1UyckYe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--ndesaulniers.bounces.google.com
 (client-ip=2607:f8b0:4864:20::849; helo=mail-qt1-x849.google.com;
 envelope-from=3ee07yqwkdoozpqemgxzuqdesaasxq.oayxuzgjbbo-pqhxuefe.alxmne.ads@flex--ndesaulniers.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=H1UyckYe; dkim-atps=neutral
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com
 [IPv6:2607:f8b0:4864:20::849])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H5sp01W7Rz2xrJ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Sep 2021 09:41:10 +1000 (AEST)
Received: by mail-qt1-x849.google.com with SMTP id
 e6-20020ac84e46000000b0029baad9aaa0so41465656qtw.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Sep 2021 16:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=YZFNZaYPd/he7w5UBJM9lcDxSfmiDtcXiMqEOq338Jg=;
 b=H1UyckYemEOk1oyzIQmj7UFWuIpswTx8cNx7nsRcwyXPFRqUlG2fqYJIv6VYr9sFdm
 m3UpTxocjB8afQ4Fndfs/Jd40MQKs/2xmpSbeZdf2iseG//mSB5+io/wcS3rd3wFGgn9
 1UqtU4N6Y2ZlJgL9NOPmk38lBzuKFFqpJLw/HBzZLHmJasP5/Yzj3vzU3RqNRdeuXy5v
 w1qrW/YJvGV+NqyCIRp4PnopGcKGdchMaSwiXAgV6xpvegaR6z/6R/ATcl6bJE24AyuC
 aJKAggT4Y8ZlinnpEcy7Au1CYlRsL4DQxk7gfNTaVXpZxM8KAYxCkTTibhFVK4lE/SY5
 RFlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=YZFNZaYPd/he7w5UBJM9lcDxSfmiDtcXiMqEOq338Jg=;
 b=VyuxmxLBgTYNRRkW35pROc501l64BPim5kPbQp90W/L5Mta26NnLcyRxvJLq88MP01
 JnrJ+gHIGFRXl9X5LbOdeEq7VAP9+zajg7ZLDbNwEYalgmqtrXJ3ZuJ+09PNSeoLvUUR
 9iiMddbrcM0a3QSke8F5XHXHFOpKtVTVY9atNJj705VS/HdR3qMssd1PRjiD8Iddu8Gm
 YQz0k7sN9N2BfyJBp27zHJhw/sLXuORDVHI3Jeui6S/XCigQmes/m4vZ69NGHHu8nhcc
 VUyToE61ehQYvZu5fsZuLh48QFusSab2p7Sc42MjUaKRv5lPKkSR72/M/39t3XiJ6GQ0
 n9cw==
X-Gm-Message-State: AOAM531xB5uecmi6Be/vyEMyRcfcN9eWb2/XjfeP+PoibUbPi1RWdL7G
 hrI/dF+zGqiBEzg055/R2JOW0c9kuQN4EoQlLIg=
X-Google-Smtp-Source: ABdhPJz6ElitxYBNsJgBjhqNLSWLWIZ6PP7s4iBODM2VeYjjSbItAEn46E/9kQl8RhKTgw7exy1/gynScmufZc9jtZI=
X-Received: from ndesaulniers1.mtv.corp.google.com
 ([2620:15c:211:202:2b76:71d3:b5fb:3734])
 (user=ndesaulniers job=sendgmr) by 2002:a0c:9d82:: with SMTP id
 s2mr10986321qvd.23.1631317265326; Fri, 10 Sep 2021 16:41:05 -0700 (PDT)
Date: Fri, 10 Sep 2021 16:40:43 -0700
In-Reply-To: <20210910234047.1019925-1-ndesaulniers@google.com>
Message-Id: <20210910234047.1019925-7-ndesaulniers@google.com>
Mime-Version: 1.0
References: <20210910234047.1019925-1-ndesaulniers@google.com>
X-Mailer: git-send-email 2.33.0.309.g3052b89438-goog
Subject: [PATCH 06/10] powerpc: remove GCC version check for UPD_CONSTR
From: Nick Desaulniers <ndesaulniers@google.com>
To: Andrew Morton <akpm@linux-foundation.org>
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
Cc: Arnd Bergmann <arnd@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Masahiro Yamada <masahiroy@kernel.org>, llvm@lists.linux.dev,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>, Paul Mackerras <paulus@samba.org>,
 Joe Perches <joe@perches.com>, Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now that GCC 5.1 is the minimum supported version, we can drop this
workaround for older versions of GCC. This adversely affected clang,
too.

Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Segher Boessenkool <segher@kernel.crashing.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 arch/powerpc/include/asm/asm-const.h | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/arch/powerpc/include/asm/asm-const.h b/arch/powerpc/include/asm/asm-const.h
index 0ce2368bd20f..dbfa5e1e3198 100644
--- a/arch/powerpc/include/asm/asm-const.h
+++ b/arch/powerpc/include/asm/asm-const.h
@@ -12,16 +12,6 @@
 #  define ASM_CONST(x)		__ASM_CONST(x)
 #endif
 
-/*
- * Inline assembly memory constraint
- *
- * GCC 4.9 doesn't properly handle pre update memory constraint "m<>"
- *
- */
-#if defined(GCC_VERSION) && GCC_VERSION < 50000
-#define UPD_CONSTR ""
-#else
 #define UPD_CONSTR "<>"
-#endif
 
 #endif /* _ASM_POWERPC_ASM_CONST_H */
-- 
2.33.0.309.g3052b89438-goog

