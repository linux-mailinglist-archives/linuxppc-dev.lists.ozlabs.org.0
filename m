Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 64198E7BA9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Oct 2019 22:44:56 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4727Y14xYszDsQ6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2019 08:44:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::343;
 helo=mail-wm1-x343.google.com; envelope-from=richard.henderson@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="YGEP7iPJ"; 
 dkim-atps=neutral
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4726hN2kzbzDqYP
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2019 08:06:09 +1100 (AEDT)
Received: by mail-wm1-x343.google.com with SMTP id p21so424031wmg.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Oct 2019 14:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Wt6X/0E8OEKNHUN7g3xU4aGMZDZ5EHD7/+dGHnvwGeQ=;
 b=YGEP7iPJRvBw4yNdXLHPDdf8+ai816ix7N7Bnmn+DtIkNntfuBxATktwcBQdTTghzc
 S139y8vtzCo1l3lkEZrn9e7Qr7TBeIzmnC/WIwyB/bnmVcS9v83cv/FhRIC/Yn8ghqNo
 c0RfSeGteHKp1y5HFIN2GCSf41EfH3JyBMQLdT45+h0nv7FeJ9ldioAIdVdbTRNeUu7X
 lCCe2D7wL/jdh7iRz5lkmcKKX43h5srQf5ayTjDEeb5Vaert877x5FQFZjbZS8V9MMGH
 CaT1RCOM7OWVqzXjfX4aRvXG7uuuirukdEeukUf2dmStasS8yLh7pdn0+mH4ufdgua+T
 zG9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Wt6X/0E8OEKNHUN7g3xU4aGMZDZ5EHD7/+dGHnvwGeQ=;
 b=fZNbhLZ5m653SkroOdBr+vm9fSNAFcqPGTGPGv8lifpu7i1n6i9d10BgM7jPUY0h6o
 RpLBM5WcNVNvEZkKiiSDB+RQUDJqyrtr+LxsFOLI33V7ZNyifdesQZJnwAST7BFXdclu
 WqOufFpA0EtrYLsNhkB86dWKV8g0DqGYelgW8RNKdrtJ7YeRcxXMW+zwjnUz5AChIlJq
 eHFFVpC3DILuyQ5Gz7HfIMdAr3/gow6ADuZFcW+D7V0nkl+UHmSI86uvfzkoX6s8FnAd
 2RdjWMXtRbvKBtqvN8kgBNxEBQYijXJeU6SjSKKe17PpluwxSCiUiaF3PtCNf+L25Dpo
 8jjA==
X-Gm-Message-State: APjAAAXeEsSynf5enFxrPdesUfqhfox3D9Ki+O8FdiTvsGSdas2Qb+vI
 cn/SBLwZH9+0AoRMYTV6TGub5ImRoK99+Q==
X-Google-Smtp-Source: APXvYqzqAvwwu8fufnMscandR8x4T4e5vo0ImUH4MNWMeVXTw6UAGYm/xpeYwYMKAveMairVDQRveQ==
X-Received: by 2002:a1c:544e:: with SMTP id p14mr1023951wmi.17.1572296765994; 
 Mon, 28 Oct 2019 14:06:05 -0700 (PDT)
Received: from localhost.localdomain (230.106.138.88.rev.sfr.net.
 [88.138.106.230])
 by smtp.gmail.com with ESMTPSA id b196sm927822wmd.24.2019.10.28.14.06.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 14:06:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
X-Google-Original-From: Richard Henderson <rth@twiddle.net>
To: linux-arch@vger.kernel.org
Subject: [PATCH 3/6] x86: Mark archrandom.h functions __must_check
Date: Mon, 28 Oct 2019 22:05:56 +0100
Message-Id: <20191028210559.8289-4-rth@twiddle.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191028210559.8289-1-rth@twiddle.net>
References: <20191028210559.8289-1-rth@twiddle.net>
X-Mailman-Approved-At: Tue, 29 Oct 2019 08:33:29 +1100
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
Cc: linux-s390@vger.kernel.org, x86@kernel.org, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We cannot use the pointer output without validating the
success of the random read.

Signed-off-by: Richard Henderson <rth@twiddle.net>
---
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: "H. Peter Anvin" <hpa@zytor.com>
---
 arch/x86/include/asm/archrandom.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/x86/include/asm/archrandom.h b/arch/x86/include/asm/archrandom.h
index 5904d7d9e703..9e4ea9e53dd0 100644
--- a/arch/x86/include/asm/archrandom.h
+++ b/arch/x86/include/asm/archrandom.h
@@ -27,7 +27,7 @@
 
 /* Unconditional execution of RDRAND and RDSEED */
 
-static inline bool rdrand_long(unsigned long *v)
+static inline bool __must_check rdrand_long(unsigned long *v)
 {
 	bool ok;
 	unsigned int retry = RDRAND_RETRY_LOOPS;
@@ -41,7 +41,7 @@ static inline bool rdrand_long(unsigned long *v)
 	return false;
 }
 
-static inline bool rdrand_int(unsigned int *v)
+static inline bool __must_check rdrand_int(unsigned int *v)
 {
 	bool ok;
 	unsigned int retry = RDRAND_RETRY_LOOPS;
@@ -55,7 +55,7 @@ static inline bool rdrand_int(unsigned int *v)
 	return false;
 }
 
-static inline bool rdseed_long(unsigned long *v)
+static inline bool __must_check rdseed_long(unsigned long *v)
 {
 	bool ok;
 	asm volatile(RDSEED_LONG
@@ -64,7 +64,7 @@ static inline bool rdseed_long(unsigned long *v)
 	return ok;
 }
 
-static inline bool rdseed_int(unsigned int *v)
+static inline bool __must_check rdseed_int(unsigned int *v)
 {
 	bool ok;
 	asm volatile(RDSEED_INT
@@ -84,22 +84,22 @@ static inline bool rdseed_int(unsigned int *v)
 #define arch_has_random()	static_cpu_has(X86_FEATURE_RDRAND)
 #define arch_has_random_seed()	static_cpu_has(X86_FEATURE_RDSEED)
 
-static inline bool arch_get_random_long(unsigned long *v)
+static inline bool __must_check arch_get_random_long(unsigned long *v)
 {
 	return arch_has_random() ? rdrand_long(v) : false;
 }
 
-static inline bool arch_get_random_int(unsigned int *v)
+static inline bool __must_check arch_get_random_int(unsigned int *v)
 {
 	return arch_has_random() ? rdrand_int(v) : false;
 }
 
-static inline bool arch_get_random_seed_long(unsigned long *v)
+static inline bool __must_check arch_get_random_seed_long(unsigned long *v)
 {
 	return arch_has_random_seed() ? rdseed_long(v) : false;
 }
 
-static inline bool arch_get_random_seed_int(unsigned int *v)
+static inline bool __must_check arch_get_random_seed_int(unsigned int *v)
 {
 	return arch_has_random_seed() ? rdseed_int(v) : false;
 }
-- 
2.17.1

