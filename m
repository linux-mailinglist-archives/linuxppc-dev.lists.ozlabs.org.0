Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F7388258
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2019 20:23:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 464tsV6dpWzDqyX
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Aug 2019 04:23:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=flex--ndesaulniers.bounces.google.com
 (client-ip=2607:f8b0:4864:20::849; helo=mail-qt1-x849.google.com;
 envelope-from=3n7lnxqwkddojzaowqhjeanockkcha.ykihejqtlly-zarheopo.kvhwxo.knc@flex--ndesaulniers.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="p1bth4T+"; 
 dkim-atps=neutral
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com
 [IPv6:2607:f8b0:4864:20::849])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 464tqJ29lMzDqTy
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Aug 2019 04:21:24 +1000 (AEST)
Received: by mail-qt1-x849.google.com with SMTP id j3so4352374qtp.17
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Aug 2019 11:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=AfTcG56zmwo+ldOTopXdEviJ01wH7yWHp2h8SCNYIzM=;
 b=p1bth4T+dnzyYMSmrcDJ0MtjQJnVJKlJ2xP5NDQSsWQau0y+cTyPAyWzulS3Wj5vip
 91pLNuH856Ct4xX1mCbGtqpxzf6vHz7rW8/+QRrC3Qb1JQs3HNHeRtEF7yskfTTq3NBS
 g/OQ7VcDRzteoALGdT/qUd8Cg/pWZrqzHkKhPIAnfP4S/BEbpPFC3xUD+0c0CFJkCu67
 a/kiYjVRt56URANpDGuxohhdQvHYM2TRM29JWOz6T1iO8j9GvAl+BdH+3dcGL/HfQtuz
 qodCmqtq0wWoI4LlconGshbfCPaw3D6uwxuhWJw3bsBE8Ae3qDSzT4wau477IBIbG/Lf
 C1Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=AfTcG56zmwo+ldOTopXdEviJ01wH7yWHp2h8SCNYIzM=;
 b=V4/5thE5qck/DStPq+wXEBZtJ7kWR2aW6fvTGuOlYQVWRX51cM8KNjU6Bs1dYUnycE
 Oc6ujoVLQjrGg3UGUzXfuZ7Q6xQaXILGvU4RPIxWPB/4QhL+MfCQy/2pfTwfSBbEPh4n
 sKLeelCXSo1JoC+FMjk132UoX4KCcR9oxa56eTN+xHNXxqWTMHXBht/9d82K2fDmwQ/O
 gwPYuKF+RKSee2Whgx9tlg7+QAv1U6MPFXmY8Bx5Mr07dXRXFCyE4tZECuptQjFi0+D/
 A81EBcg13hcJKnUaszixD8b21T1dnW3vB7LuJMva8cfwsBCFSkLT+lHlsRyVzRI2Y3Hr
 ywRg==
X-Gm-Message-State: APjAAAWfpz61tBl+EfBudBZ+bEuenqpAD8qln6kgq94hINjCejKPk27K
 fAd7oi5v67gGXpOvKttQQKy4aeuMWjBu4t4a0Ag=
X-Google-Smtp-Source: APXvYqyBr9e8t8qXW2aILi8aFM5Vs+bZlZEMDvFRIEl4oiFC36YtYLyM576WormxdGC+xze9sVJ/oZmBIENQpBI3fzQ=
X-Received: by 2002:a05:620a:685:: with SMTP id
 f5mr19419821qkh.238.1565374879207; 
 Fri, 09 Aug 2019 11:21:19 -0700 (PDT)
Date: Fri,  9 Aug 2019 11:21:05 -0700
In-Reply-To: <87h873zs88.fsf@concordia.ellerman.id.au>
Message-Id: <20190809182106.62130-1-ndesaulniers@google.com>
Mime-Version: 1.0
References: <87h873zs88.fsf@concordia.ellerman.id.au>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
Subject: [PATCH] powerpc: fix inline asm constraints for dcbz
From: Nick Desaulniers <ndesaulniers@google.com>
To: mpe@ellerman.id.au
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
Cc: arnd@arndb.de, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
 Paul Mackerras <paulus@samba.org>,
 Nathan Chancellor <natechancellor@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 kbuild test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The input parameter is modified, so it should be an output parameter
with "=" to make it so that a copy of the input is not made by Clang.

Link: https://bugs.llvm.org/show_bug.cgi?id=42762
Link: https://gcc.gnu.org/onlinedocs/gcc/Modifiers.html#Modifiers
Link: https://github.com/ClangBuiltLinux/linux/issues/593
Link: https://godbolt.org/z/QwhZXi
Link: https://lore.kernel.org/lkml/20190721075846.GA97701@archlinux-threadripper/
Fixes: 6c5875843b87 ("powerpc: slightly improve cache helpers")
Debugged-by: Nathan Chancellor <natechancellor@gmail.com>
Reported-by: Nathan Chancellor <natechancellor@gmail.com>
Reported-by: kbuild test robot <lkp@intel.com>
Suggested-by: Arnd Bergmann <arnd@arndb.de>
Suggested-by: Nathan Chancellor <natechancellor@gmail.com>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
Green CI run:
https://travis-ci.com/ClangBuiltLinux/continuous-integration/builds/122521976
https://github.com/ClangBuiltLinux/continuous-integration/pull/197/files#diff-40bd16e3188587e4d648c30e0c2d6d37

 arch/powerpc/include/asm/cache.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/cache.h b/arch/powerpc/include/asm/cache.h
index b3388d95f451..5a0df6a1b9dc 100644
--- a/arch/powerpc/include/asm/cache.h
+++ b/arch/powerpc/include/asm/cache.h
@@ -107,22 +107,22 @@ extern void _set_L3CR(unsigned long);
 
 static inline void dcbz(void *addr)
 {
-	__asm__ __volatile__ ("dcbz %y0" : : "Z"(*(u8 *)addr) : "memory");
+	__asm__ __volatile__ ("dcbz %y0" : "=Z"(*(u8 *)addr) :: "memory");
 }
 
 static inline void dcbi(void *addr)
 {
-	__asm__ __volatile__ ("dcbi %y0" : : "Z"(*(u8 *)addr) : "memory");
+	__asm__ __volatile__ ("dcbi %y0" : "=Z"(*(u8 *)addr) :: "memory");
 }
 
 static inline void dcbf(void *addr)
 {
-	__asm__ __volatile__ ("dcbf %y0" : : "Z"(*(u8 *)addr) : "memory");
+	__asm__ __volatile__ ("dcbf %y0" : "=Z"(*(u8 *)addr) :: "memory");
 }
 
 static inline void dcbst(void *addr)
 {
-	__asm__ __volatile__ ("dcbst %y0" : : "Z"(*(u8 *)addr) : "memory");
+	__asm__ __volatile__ ("dcbst %y0" : "=Z"(*(u8 *)addr) :: "memory");
 }
 #endif /* !__ASSEMBLY__ */
 #endif /* __KERNEL__ */
-- 
2.23.0.rc1.153.gdeed80330f-goog

