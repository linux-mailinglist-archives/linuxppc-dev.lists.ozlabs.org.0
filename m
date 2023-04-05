Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB086D7F12
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Apr 2023 16:18:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ps6Dr30WRz3f7F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 00:18:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hzv4HYQ5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com; envelope-from=ubizjak@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hzv4HYQ5;
	dkim-atps=neutral
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ps6D03pwPz3cBP
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Apr 2023 00:17:51 +1000 (AEST)
Received: by mail-ed1-x52b.google.com with SMTP id w9so141501333edc.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Apr 2023 07:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680704268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IR5uya/6k59Z6vjpJ5eLjtKZNYMu0vN6LL4bpPspKvA=;
        b=hzv4HYQ5T2nwEJbzGw8dJN/I+F4Ay7RqJgdT+/nU+XX7ZoGg8P8l9L8teClCdkpmvP
         3VP7uCz0Z+YqdgWXL+MH2tFmXHoR+WPJu2bf+Fr9qb/QvhkGpEoSrJ0NhG0eAx/0QiTJ
         UQgtBAkuIqKtB9v5p/5vYSrI08EmluGXK/WD03V/0fdbsdMfx/eWMRDY+C4T7hDoaYaj
         NOE2x6GoeZ01oYXffPbqWgJlIPw1nNp4nyMKkgNQHZrTuLm7YYwS07BBvNmSqjpH876L
         /ISIl/kFQdHhrGtYe0xrraw5d1lTLHXAuQ1Znq44pBtvm8+Xiwqr3RT/FspKMHRWIraX
         TSSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680704268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IR5uya/6k59Z6vjpJ5eLjtKZNYMu0vN6LL4bpPspKvA=;
        b=WWrotmuq/GZ4sStKcsr9LYKDI/6s4apTB24ErPWS4jA344+gHnzTC2ywjz8Gi9G/IT
         dBYN+5472hcojfw1CnMWD4JyCcWGybdTriiAg+2R0LBXznk5v2AFLYlmiP12sil2BqEy
         fz3Cg2sCGqespN/w545pb3tEMXlh4beKR4oaTMFMoajcuDq+JmBxOFnvN/sT3Oc0j5AA
         wlm4vzgYRJ/sfb8jybcvIuGkhhTnQpz7b5bvrwP6wc+aJ3qWSdERI60DcacCNKgmoILs
         Ebup3A0t1dyJQUAVP1mCUEQ09PZk0PhmvMD7ln2SCv8WTJ/0SRBfjIumryl2Vn9tunnq
         /Fhw==
X-Gm-Message-State: AAQBX9cFe3eZe8V81EPh7M9crqDJt9/bGCiK5GmkNWauWm1lG1BEjGM4
	EDZVdmjNqcytLl9a36jpBZU=
X-Google-Smtp-Source: AKy350apZB614sloiIbQFvOjRXtcEBijYMBgr256Z113Bx8z9JeSHopzv9p9oPRNRJ0o5MWKc6tu/g==
X-Received: by 2002:a17:906:ece1:b0:93d:ae74:fa9e with SMTP id qt1-20020a170906ece100b0093dae74fa9emr3077789ejb.7.1680704268119;
        Wed, 05 Apr 2023 07:17:48 -0700 (PDT)
Received: from localhost.localdomain ([46.248.82.114])
        by smtp.gmail.com with ESMTPSA id g6-20020a170906348600b009334219656dsm7381246ejb.56.2023.04.05.07.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 07:17:47 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: linux-alpha@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org,
	linux-arch@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/5] locking/atomic: Add generic try_cmpxchg{,64}_local support
Date: Wed,  5 Apr 2023 16:17:06 +0200
Message-Id: <20230405141710.3551-2-ubizjak@gmail.com>
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
Cc: Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Uros Bizjak <ubizjak@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add generic support for try_cmpxchg{,64}_local and their falbacks.

These provides the generic try_cmpxchg_local family of functions
from the arch_ prefixed version, also adding explicit instrumentation.

Cc: Will Deacon <will@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Boqun Feng <boqun.feng@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
---
 include/linux/atomic/atomic-arch-fallback.h | 24 ++++++++++++++++++++-
 include/linux/atomic/atomic-instrumented.h  | 20 ++++++++++++++++-
 scripts/atomic/gen-atomic-fallback.sh       |  4 ++++
 scripts/atomic/gen-atomic-instrumented.sh   |  2 +-
 4 files changed, 47 insertions(+), 3 deletions(-)

diff --git a/include/linux/atomic/atomic-arch-fallback.h b/include/linux/atomic/atomic-arch-fallback.h
index 77bc5522e61c..36c92851cdee 100644
--- a/include/linux/atomic/atomic-arch-fallback.h
+++ b/include/linux/atomic/atomic-arch-fallback.h
@@ -217,6 +217,28 @@
 
 #endif /* arch_try_cmpxchg64_relaxed */
 
+#ifndef arch_try_cmpxchg_local
+#define arch_try_cmpxchg_local(_ptr, _oldp, _new) \
+({ \
+	typeof(*(_ptr)) *___op = (_oldp), ___o = *___op, ___r; \
+	___r = arch_cmpxchg_local((_ptr), ___o, (_new)); \
+	if (unlikely(___r != ___o)) \
+		*___op = ___r; \
+	likely(___r == ___o); \
+})
+#endif /* arch_try_cmpxchg_local */
+
+#ifndef arch_try_cmpxchg64_local
+#define arch_try_cmpxchg64_local(_ptr, _oldp, _new) \
+({ \
+	typeof(*(_ptr)) *___op = (_oldp), ___o = *___op, ___r; \
+	___r = arch_cmpxchg64_local((_ptr), ___o, (_new)); \
+	if (unlikely(___r != ___o)) \
+		*___op = ___r; \
+	likely(___r == ___o); \
+})
+#endif /* arch_try_cmpxchg64_local */
+
 #ifndef arch_atomic_read_acquire
 static __always_inline int
 arch_atomic_read_acquire(const atomic_t *v)
@@ -2456,4 +2478,4 @@ arch_atomic64_dec_if_positive(atomic64_t *v)
 #endif
 
 #endif /* _LINUX_ATOMIC_FALLBACK_H */
-// b5e87bdd5ede61470c29f7a7e4de781af3770f09
+// 1f49bd4895a4b7a5383906649027205c52ec80ab
diff --git a/include/linux/atomic/atomic-instrumented.h b/include/linux/atomic/atomic-instrumented.h
index 7a139ec030b0..14a9212cc987 100644
--- a/include/linux/atomic/atomic-instrumented.h
+++ b/include/linux/atomic/atomic-instrumented.h
@@ -2066,6 +2066,24 @@ atomic_long_dec_if_positive(atomic_long_t *v)
 	arch_sync_cmpxchg(__ai_ptr, __VA_ARGS__); \
 })
 
+#define try_cmpxchg_local(ptr, oldp, ...) \
+({ \
+	typeof(ptr) __ai_ptr = (ptr); \
+	typeof(oldp) __ai_oldp = (oldp); \
+	instrument_atomic_write(__ai_ptr, sizeof(*__ai_ptr)); \
+	instrument_atomic_write(__ai_oldp, sizeof(*__ai_oldp)); \
+	arch_try_cmpxchg_local(__ai_ptr, __ai_oldp, __VA_ARGS__); \
+})
+
+#define try_cmpxchg64_local(ptr, oldp, ...) \
+({ \
+	typeof(ptr) __ai_ptr = (ptr); \
+	typeof(oldp) __ai_oldp = (oldp); \
+	instrument_atomic_write(__ai_ptr, sizeof(*__ai_ptr)); \
+	instrument_atomic_write(__ai_oldp, sizeof(*__ai_oldp)); \
+	arch_try_cmpxchg64_local(__ai_ptr, __ai_oldp, __VA_ARGS__); \
+})
+
 #define cmpxchg_double(ptr, ...) \
 ({ \
 	typeof(ptr) __ai_ptr = (ptr); \
@@ -2083,4 +2101,4 @@ atomic_long_dec_if_positive(atomic_long_t *v)
 })
 
 #endif /* _LINUX_ATOMIC_INSTRUMENTED_H */
-// 764f741eb77a7ad565dc8d99ce2837d5542e8aee
+// 456e206c7e4e681126c482e4edcc6f46921ac731
diff --git a/scripts/atomic/gen-atomic-fallback.sh b/scripts/atomic/gen-atomic-fallback.sh
index 3a07695e3c89..6e853f0dad8d 100755
--- a/scripts/atomic/gen-atomic-fallback.sh
+++ b/scripts/atomic/gen-atomic-fallback.sh
@@ -225,6 +225,10 @@ for cmpxchg in "cmpxchg" "cmpxchg64"; do
 	gen_try_cmpxchg_fallbacks "${cmpxchg}"
 done
 
+for cmpxchg in "cmpxchg_local" "cmpxchg64_local"; do
+	gen_try_cmpxchg_fallback "${cmpxchg}" ""
+done
+
 grep '^[a-z]' "$1" | while read name meta args; do
 	gen_proto "${meta}" "${name}" "atomic" "int" ${args}
 done
diff --git a/scripts/atomic/gen-atomic-instrumented.sh b/scripts/atomic/gen-atomic-instrumented.sh
index 77c06526a574..c8165e9431bf 100755
--- a/scripts/atomic/gen-atomic-instrumented.sh
+++ b/scripts/atomic/gen-atomic-instrumented.sh
@@ -173,7 +173,7 @@ for xchg in "xchg" "cmpxchg" "cmpxchg64" "try_cmpxchg" "try_cmpxchg64"; do
 	done
 done
 
-for xchg in "cmpxchg_local" "cmpxchg64_local" "sync_cmpxchg"; do
+for xchg in "cmpxchg_local" "cmpxchg64_local" "sync_cmpxchg" "try_cmpxchg_local" "try_cmpxchg64_local" ; do
 	gen_xchg "${xchg}" "" ""
 	printf "\n"
 done
-- 
2.39.2

