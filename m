Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FE1F184D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 15:19:25 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477TDp1wcszF4Tf
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2019 01:19:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::441;
 helo=mail-wr1-x441.google.com; envelope-from=richard.henderson@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="huUR3QVI"; 
 dkim-atps=neutral
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477T615R6MzF385
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2019 01:13:27 +1100 (AEDT)
Received: by mail-wr1-x441.google.com with SMTP id e6so24130998wrw.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Nov 2019 06:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=leR1246hJ3phHrVVcpyVvX9EN15YsfZYkjubgOlomC8=;
 b=huUR3QVIlM/iMH0usGmIB9OiEcCLZqXcp97YwEo5S55jvpui/qZdGTCJbFI62dX4/j
 2W64NWcBKbPpYtkVVdo/cO1Jt92q8rAf5ACvD4PU71NfcDy1YwoV8btWGC4x7jK7xBZH
 4pgY90Y5biZu7ryNMqgndRgyVybVzvi6p61/yXwqnS60DGsgWKw/oS56vnc+2wljX/IS
 jjo7CDxwHqosEN+WVtvNt9GxrZEEeNlAO6la4IXeWWkEZQG8RuRmPzPChqiiwmD03fka
 KBkfelHAHCWA/mSrfKOHrqlItLLBFxLHUluhYQUZBpOvPwIkowMuH0Ftl02VvxcVd/Z3
 ixaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=leR1246hJ3phHrVVcpyVvX9EN15YsfZYkjubgOlomC8=;
 b=V4DarCWFiMytMU/r94kw/f99j3+Vt0uTji4tVtKeSx3XacJ6rhJZG2vbPv0VR2gYs7
 JKUfEOJP5Ue2xT9YX6UA1M4lTZ6zZGFP73QnlfE9uTZI1aEw+B8AFOUvI7VSy9LKCrJ0
 wrQab8FSmvV3bhoGeOCS4nR6KcjruxYvTJvHDw2I6P1qAbZEoZQ28UPEqaWn4eiMMroK
 hV6Fi5hHxnQ9Sl3wdHagQd63KcYlcXJcb65BrbpB09tCV4Djvdq0ehCFzvLyJ6F616B2
 R0rtepAsaj7FIGKLAU8Iy+plzOit5+66blrI2ap2RZ6kjAiSYCAq25SpGmhZ3X9FMf+2
 fdzA==
X-Gm-Message-State: APjAAAUeY3W0wcFncZJ+iDTvFwYGEoIpEcFYiBnYPPD7THajksBlBOFI
 2AbqjvqnkEaQPb7BJtjCHgmyFw==
X-Google-Smtp-Source: APXvYqzTCPrOAhbnRRsKuw2OzTsArhsUJQHzqkaNltD2nhsBQHhmx9VSsUTnBXDMMqtS237fmG6/dA==
X-Received: by 2002:a5d:4649:: with SMTP id j9mr2973687wrs.248.1573049604042; 
 Wed, 06 Nov 2019 06:13:24 -0800 (PST)
Received: from localhost.localdomain
 (31.red-176-87-122.dynamicip.rima-tde.net. [176.87.122.31])
 by smtp.gmail.com with ESMTPSA id b3sm2837556wma.13.2019.11.06.06.13.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2019 06:13:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
X-Google-Original-From: Richard Henderson <rth@twiddle.net>
To: linux-crypto@vger.kernel.org
Subject: [PATCH v2 01/10] x86: Remove arch_has_random, arch_has_random_seed
Date: Wed,  6 Nov 2019 15:12:59 +0100
Message-Id: <20191106141308.30535-2-rth@twiddle.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191106141308.30535-1-rth@twiddle.net>
References: <20191106141308.30535-1-rth@twiddle.net>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 herbert@gondor.apana.org.au, x86@kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use the expansion of these macros directly in arch_get_random_*.

These symbols are currently part of the generic archrandom.h
interface, but are currently unused and can be removed.

Signed-off-by: Richard Henderson <rth@twiddle.net>
---
 arch/x86/include/asm/archrandom.h | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/x86/include/asm/archrandom.h b/arch/x86/include/asm/archrandom.h
index af45e1452f09..feb59461046c 100644
--- a/arch/x86/include/asm/archrandom.h
+++ b/arch/x86/include/asm/archrandom.h
@@ -73,10 +73,6 @@ static inline bool rdseed_int(unsigned int *v)
 	return ok;
 }
 
-/* Conditional execution based on CPU type */
-#define arch_has_random()	static_cpu_has(X86_FEATURE_RDRAND)
-#define arch_has_random_seed()	static_cpu_has(X86_FEATURE_RDSEED)
-
 /*
  * These are the generic interfaces; they must not be declared if the
  * stubs in <linux/random.h> are to be invoked,
@@ -86,22 +82,22 @@ static inline bool rdseed_int(unsigned int *v)
 
 static inline bool arch_get_random_long(unsigned long *v)
 {
-	return arch_has_random() ? rdrand_long(v) : false;
+	return static_cpu_has(X86_FEATURE_RDRAND) ? rdrand_long(v) : false;
 }
 
 static inline bool arch_get_random_int(unsigned int *v)
 {
-	return arch_has_random() ? rdrand_int(v) : false;
+	return static_cpu_has(X86_FEATURE_RDRAND) ? rdrand_int(v) : false;
 }
 
 static inline bool arch_get_random_seed_long(unsigned long *v)
 {
-	return arch_has_random_seed() ? rdseed_long(v) : false;
+	return static_cpu_has(X86_FEATURE_RDSEED) ? rdseed_long(v) : false;
 }
 
 static inline bool arch_get_random_seed_int(unsigned int *v)
 {
-	return arch_has_random_seed() ? rdseed_int(v) : false;
+	return static_cpu_has(X86_FEATURE_RDSEED) ? rdseed_int(v) : false;
 }
 
 extern void x86_init_rdrand(struct cpuinfo_x86 *c);
-- 
2.17.1

