Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F33156D7F30
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Apr 2023 16:21:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ps6Hm6F0fz3fHy
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 00:21:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XZjaJuc9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com; envelope-from=ubizjak@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XZjaJuc9;
	dkim-atps=neutral
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ps6D401ymz3cfZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Apr 2023 00:17:55 +1000 (AEST)
Received: by mail-ed1-x52f.google.com with SMTP id ek18so141537117edb.6
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Apr 2023 07:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680704272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jH8CK6/Zc/t5YGDy3q47KHMB123gE9O3L+8qZD7dC+A=;
        b=XZjaJuc9oq0eEJuqYQaQCSxyJEBrGWscwxPcLCz1SGmMY8nwBoCrKPTVkKuDR6NHM0
         nd8qEhQmNfk/r4MHTfpwl3GDx8xszhuQDekAlI7AuV5wPPTHtKtudXEJvnYoUIEF8a5w
         BCncuKCXN80M4D+9c/uTSAQxM1AULldg3sOFYIYNysgVeYWsg+Xf3uXNSO3204XksTVt
         VY7rOKvL0GsKooMWqYkHs8pZAlDl7U2kRNPRjRx+Zj41LQ7/h5JXvJnY1puZvDO1QMoW
         76SsXCfs7PmO+YxBWiArT3kI1VrIE5rfXzPTV1J+iRMhJsk2mSVTfV9ok5E9WbeCZyIn
         ETvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680704272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jH8CK6/Zc/t5YGDy3q47KHMB123gE9O3L+8qZD7dC+A=;
        b=hg3/61DA6qOBGeoHcgV7Oek10MZtEPbx1M7vakESWvjL4i9J8aPG7xtRMNYnfx5n7K
         npbcUtjNXSH3tuSsUFBAsKQkg3cfnBRY999cwHh4/ILYgN+OjQsLYgxyMgoigWcZqPMY
         aE//llyY8+yWGY5cedNJ3iXiqN7A5+Rr3BgMMVgjK/LwfnXKZJci5mYhvJAvLIZJ/i6F
         lbFyT2YSjvru91++KINg4Fl0ThuWrmnOIOa5+1Ebwyf15PAgL/qGqSdp8C5h8XcgwKa4
         ZCu72iy7MrExapje9TfTpfdTNeRKkgKwk5HRR+Mps7NEW7j1AgSyJ94oNPZbcEyvvIhz
         M0BA==
X-Gm-Message-State: AAQBX9dgfdQ+ViUAWXh/zu+f+luWCVqU8aF1OtiBUjsfXm7kaX/sIlh8
	1TT8AjyBmvPKB6mMCu4KEYc=
X-Google-Smtp-Source: AKy350adAYW+TEWiUmLpAezMNrhF5/NZq/p/j5R7S+Q7+ZgtSrt1TPPbRawQQVHNg0S3+/m7HJyxGA==
X-Received: by 2002:a17:907:20bb:b0:930:8714:6739 with SMTP id pw27-20020a17090720bb00b0093087146739mr3007454ejb.30.1680704272405;
        Wed, 05 Apr 2023 07:17:52 -0700 (PDT)
Received: from localhost.localdomain ([46.248.82.114])
        by smtp.gmail.com with ESMTPSA id g6-20020a170906348600b009334219656dsm7381246ejb.56.2023.04.05.07.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 07:17:52 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: linux-alpha@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org,
	linux-arch@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/5] locking/arch: Wire up local_try_cmpxchg
Date: Wed,  5 Apr 2023 16:17:08 +0200
Message-Id: <20230405141710.3551-4-ubizjak@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230405141710.3551-1-ubizjak@gmail.com>
References: <20230405141710.3551-1-ubizjak@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Jun Yi <yijun@loongson.cn>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner <tglx@linutronix.de>, Uros Bizjak <ubizjak@gmail.com>, Huacai Chen <chenhuacai@kernel.org>, Richard Henderson <richard.henderson@linaro.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Matt Turner <mattst88@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, WANG Xuerui <kernel@xen0n.name>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Implement target specific support for local_try_cmpxchg
and local_cmpxchg using typed C wrappers that call their
_local counterpart and provide additional checking of
their input arguments.

Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Matt Turner <mattst88@gmail.com>
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Jun Yi <yijun@loongson.cn>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
---
 arch/alpha/include/asm/local.h     | 12 ++++++++++--
 arch/loongarch/include/asm/local.h | 13 +++++++++++--
 arch/mips/include/asm/local.h      | 13 +++++++++++--
 arch/powerpc/include/asm/local.h   | 11 +++++++++++
 arch/x86/include/asm/local.h       | 13 +++++++++++--
 5 files changed, 54 insertions(+), 8 deletions(-)

diff --git a/arch/alpha/include/asm/local.h b/arch/alpha/include/asm/local.h
index fab26a1c93d5..0fcaad642cc3 100644
--- a/arch/alpha/include/asm/local.h
+++ b/arch/alpha/include/asm/local.h
@@ -52,8 +52,16 @@ static __inline__ long local_sub_return(long i, local_t * l)
 	return result;
 }
 
-#define local_cmpxchg(l, o, n) \
-	(cmpxchg_local(&((l)->a.counter), (o), (n)))
+static __inline__ long local_cmpxchg(local_t *l, long old, long new)
+{
+	return cmpxchg_local(&l->a.counter, old, new);
+}
+
+static __inline__ bool local_try_cmpxchg(local_t *l, long *old, long new)
+{
+	return try_cmpxchg_local(&l->a.counter, (s64 *)old, new);
+}
+
 #define local_xchg(l, n) (xchg_local(&((l)->a.counter), (n)))
 
 /**
diff --git a/arch/loongarch/include/asm/local.h b/arch/loongarch/include/asm/local.h
index 65fbbae9fc4d..83e995b30e47 100644
--- a/arch/loongarch/include/asm/local.h
+++ b/arch/loongarch/include/asm/local.h
@@ -56,8 +56,17 @@ static inline long local_sub_return(long i, local_t *l)
 	return result;
 }
 
-#define local_cmpxchg(l, o, n) \
-	((long)cmpxchg_local(&((l)->a.counter), (o), (n)))
+static inline long local_cmpxchg(local_t *l, long old, long new)
+{
+	return cmpxchg_local(&l->a.counter, old, new);
+}
+
+static inline bool local_try_cmpxchg(local_t *l, long *old, long new)
+{
+	typeof(l->a.counter) *__old = (typeof(l->a.counter) *) old;
+	return try_cmpxchg_local(&l->a.counter, __old, new);
+}
+
 #define local_xchg(l, n) (atomic_long_xchg((&(l)->a), (n)))
 
 /**
diff --git a/arch/mips/include/asm/local.h b/arch/mips/include/asm/local.h
index 08366b1fd273..5daf6fe8e3e9 100644
--- a/arch/mips/include/asm/local.h
+++ b/arch/mips/include/asm/local.h
@@ -94,8 +94,17 @@ static __inline__ long local_sub_return(long i, local_t * l)
 	return result;
 }
 
-#define local_cmpxchg(l, o, n) \
-	((long)cmpxchg_local(&((l)->a.counter), (o), (n)))
+static __inline__ long local_cmpxchg(local_t *l, long old, long new)
+{
+	return cmpxchg_local(&l->a.counter, old, new);
+}
+
+static __inline__ bool local_try_cmpxchg(local_t *l, long *old, long new)
+{
+	typeof(l->a.counter) *__old = (typeof(l->a.counter) *) old;
+	return try_cmpxchg_local(&l->a.counter, __old, new);
+}
+
 #define local_xchg(l, n) (atomic_long_xchg((&(l)->a), (n)))
 
 /**
diff --git a/arch/powerpc/include/asm/local.h b/arch/powerpc/include/asm/local.h
index bc4bd19b7fc2..45492fb5bf22 100644
--- a/arch/powerpc/include/asm/local.h
+++ b/arch/powerpc/include/asm/local.h
@@ -90,6 +90,17 @@ static __inline__ long local_cmpxchg(local_t *l, long o, long n)
 	return t;
 }
 
+static __inline__ bool local_try_cmpxchg(local_t *l, long *po, long n)
+{
+	long o = *po, r;
+
+	r = local_cmpxchg(l, o, n);
+	if (unlikely(r != o))
+		*po = r;
+
+	return likely(r == o);
+}
+
 static __inline__ long local_xchg(local_t *l, long n)
 {
 	long t;
diff --git a/arch/x86/include/asm/local.h b/arch/x86/include/asm/local.h
index 349a47acaa4a..56d4ef604b91 100644
--- a/arch/x86/include/asm/local.h
+++ b/arch/x86/include/asm/local.h
@@ -120,8 +120,17 @@ static inline long local_sub_return(long i, local_t *l)
 #define local_inc_return(l)  (local_add_return(1, l))
 #define local_dec_return(l)  (local_sub_return(1, l))
 
-#define local_cmpxchg(l, o, n) \
-	(cmpxchg_local(&((l)->a.counter), (o), (n)))
+static inline long local_cmpxchg(local_t *l, long old, long new)
+{
+	return cmpxchg_local(&l->a.counter, old, new);
+}
+
+static inline bool local_try_cmpxchg(local_t *l, long *old, long new)
+{
+	typeof(l->a.counter) *__old = (typeof(l->a.counter) *) old;
+	return try_cmpxchg_local(&l->a.counter, __old, new);
+}
+
 /* Always has a lock prefix */
 #define local_xchg(l, n) (xchg(&((l)->a.counter), (n)))
 
-- 
2.39.2

