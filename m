Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDC6E7B86
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Oct 2019 22:42:45 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4727VV2xFwzDsPf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2019 08:42:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::441;
 helo=mail-wr1-x441.google.com; envelope-from=richard.henderson@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="n0bvaGSj"; 
 dkim-atps=neutral
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4726hM6y5NzDqbB
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2019 08:06:08 +1100 (AEDT)
Received: by mail-wr1-x441.google.com with SMTP id a11so11377407wra.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Oct 2019 14:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=HzpPHgz9dkPSBTYUxRiI5N3ILdBG2Y7xG5fdNi+CmCc=;
 b=n0bvaGSjcdm/n45EiluVOG4AFB7gD0MPIRsc9+ExLOlf95yU+Kh2aP0sBqtAI65Oje
 UI559g1TCAZjdGhIXtuL5Uw2TSU3U1tljgnLdt78YFaVCsugwccldmNW5IIRHMv1pSMM
 iNxLx2d4vvfVH859fXX7ZOZXfxhv5Wx0fkfaWZD4cCzNI056eMVSXDaQeBXzfzk52Psh
 wN/3e7MUW6L4UJyR1iFMilspC/8EJCVAJdRo8tof4+mnyYsoRAmdYJYj6JyAWwKNIYNz
 X+oLXH8QJHW0C4Wna6USrQVxiYU7+pn6klAdBYi+Gm6i/GEijMO30OgppJ/ZUOT8eJHz
 o5iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=HzpPHgz9dkPSBTYUxRiI5N3ILdBG2Y7xG5fdNi+CmCc=;
 b=Laa44+/bV7dw2z9A7dGfAnK/2Hwkwwr/zIxHRz0oqxpAePT0+h3fzBoOoaFwahR1Vw
 U1N3E8NzorA7WP9dIBBKzmoz9QcwVmjxdgVLmMeND1mhNnfQTLaSXHxpbkSKI3FNeUlk
 MKpiXklOag+xENI8/jm9ReQms+MlkemSIcVWz/2CfUW8yEIhZKQEbcyOPDJOJs2o/z5c
 vnj6JXJ3jsrs6118PbPrlr74gIXtiYqAQAFOUzXbMRs7Y0zwynE/1RUe1l55Th6zUEYC
 TjK44ouI9r4ezsRWtU/Gyc4yoWEIoHlmadJRfTfgV4Y3n+KrPjAq4/fm6yNQynApd41b
 4mIQ==
X-Gm-Message-State: APjAAAVB589LjXhiuCaxVvn0gmFAF5M1sV+D0RgB/m7dfZmTOW1Rda2X
 55ns0pv4CE/thty+s028Lw1Y8w==
X-Google-Smtp-Source: APXvYqzFqJnVOjSOYydSnQlBlFKEVK/uejnJRRcq3NDp8SAQpeKxQWcPsIMvCpbINphaS0TGA2jWDg==
X-Received: by 2002:adf:f84f:: with SMTP id d15mr17155903wrq.112.1572296764917; 
 Mon, 28 Oct 2019 14:06:04 -0700 (PDT)
Received: from localhost.localdomain (230.106.138.88.rev.sfr.net.
 [88.138.106.230])
 by smtp.gmail.com with ESMTPSA id b196sm927822wmd.24.2019.10.28.14.06.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 14:06:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
X-Google-Original-From: Richard Henderson <rth@twiddle.net>
To: linux-arch@vger.kernel.org
Subject: [PATCH 2/6] x86: Move arch_has_random* inside CONFIG_ARCH_RANDOM
Date: Mon, 28 Oct 2019 22:05:55 +0100
Message-Id: <20191028210559.8289-3-rth@twiddle.net>
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

These functions are declared generically without CONFIG_ARCH_RANDOM.
The only reason this compiles for x86 is that we currently have a
mix of inline functions are preprocessor defines.

Signed-off-by: Richard Henderson <rth@twiddle.net>
---
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: "H. Peter Anvin" <hpa@zytor.com>
---
 arch/x86/include/asm/archrandom.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/include/asm/archrandom.h b/arch/x86/include/asm/archrandom.h
index af45e1452f09..5904d7d9e703 100644
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
@@ -84,6 +80,10 @@ static inline bool rdseed_int(unsigned int *v)
  */
 #ifdef CONFIG_ARCH_RANDOM
 
+/* Conditional execution based on CPU type */
+#define arch_has_random()	static_cpu_has(X86_FEATURE_RDRAND)
+#define arch_has_random_seed()	static_cpu_has(X86_FEATURE_RDSEED)
+
 static inline bool arch_get_random_long(unsigned long *v)
 {
 	return arch_has_random() ? rdrand_long(v) : false;
-- 
2.17.1

