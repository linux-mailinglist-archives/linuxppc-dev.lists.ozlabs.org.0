Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A257F18A7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 15:30:57 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477TV62QGQzF5QF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2019 01:30:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::341;
 helo=mail-wm1-x341.google.com; envelope-from=richard.henderson@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="o3RLE9hu"; 
 dkim-atps=neutral
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477T660czNzF3Dc
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2019 01:13:33 +1100 (AEDT)
Received: by mail-wm1-x341.google.com with SMTP id 8so3553928wmo.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Nov 2019 06:13:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=WSWMpSoTK1qPuZQMUXUs+rrNl9psDWT+JwajLc5x63s=;
 b=o3RLE9hugfNMGeayOKXMF63poaTZyNZSixnercrQpPsfWWgoGcVsahZ9wGvxqajkTL
 65VNFHB6mdXVYgOXplvY1kFNexysDEPq5Mte9WIOjqcg1aowVtTrhVDsnT0wub/uMIGv
 9plm99mfCRtSEw63V2+FJEO0avUTLLDH0v6gLjF9DVOTaBg6oIbNyb7sjS7eGkIP45xe
 49mB8MByUP2KQml5xF2ln4ggynO86gSJMmUBV6ZeCzC7nwpX1YYgQOkj2KBMtTdJsDRM
 SSr5E0h3bqcqVqwF535O59szwWAxXieho+zlqJlenhqMZUeXa7L9rW2HfuF4DfbrOvdy
 Hi6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=WSWMpSoTK1qPuZQMUXUs+rrNl9psDWT+JwajLc5x63s=;
 b=h+GtADyTuvFpUVKgI2eH9fSdA1bM1+HtfwJCYxh7p+Fe8297DeGf6s90hn/j2YEKqT
 7sbO6xQFT37b+txNSBYoh79tyAJAUfLbiBQx72R4jY8qhEoW02wONiZR+1DdK76kys2W
 4dePi4KC552oF2INl27ECN9ApscGUk3Eh32mHobKmAz1cr0MF4WDZrq9a/3MVWM+tiEy
 OcWIfLzT1YjZW55JHyam8lJvwgmaJVwDCVMsuaOWkzuucEfUq9iD27jpG2f2Auwh8Eca
 KPvu932L9bSerL6nBqUB0N0OiOftj7Rg5VQeSmfrEX8csCwWgl1a5IlcaSqKY5LaWgTd
 x1Wg==
X-Gm-Message-State: APjAAAW1OrvGSm0AZ8PwhYoErkFp/na9iU1+ucq/f3qnb1H1sahHz69y
 cuZIoVjB8EH8ObAEABHPybcI/w==
X-Google-Smtp-Source: APXvYqwYT+P4BzTIZpyLp/lptFTQGB4DXq5HOBhfHF4antZVjWqLX7iHjEffS3qreneqv0oqdHj7Hw==
X-Received: by 2002:a1c:9a15:: with SMTP id c21mr2802805wme.93.1573049610656; 
 Wed, 06 Nov 2019 06:13:30 -0800 (PST)
Received: from localhost.localdomain
 (31.red-176-87-122.dynamicip.rima-tde.net. [176.87.122.31])
 by smtp.gmail.com with ESMTPSA id b3sm2837556wma.13.2019.11.06.06.13.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2019 06:13:30 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
X-Google-Original-From: Richard Henderson <rth@twiddle.net>
To: linux-crypto@vger.kernel.org
Subject: [PATCH v2 05/10] linux/random.h: Use false with bool
Date: Wed,  6 Nov 2019 15:13:03 +0100
Message-Id: <20191106141308.30535-6-rth@twiddle.net>
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

Keep the generic fallback versions in sync with the other architecture
specific implementations and use the proper name for false.

Suggested-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Richard Henderson <rth@twiddle.net>
---
 include/linux/random.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/random.h b/include/linux/random.h
index 7fd0360908d2..ea0e2f5f1ec5 100644
--- a/include/linux/random.h
+++ b/include/linux/random.h
@@ -169,19 +169,19 @@ static inline void prandom_seed_state(struct rnd_state *state, u64 seed)
 #else
 static inline bool arch_get_random_long(unsigned long *v)
 {
-	return 0;
+	return false;
 }
 static inline bool arch_get_random_int(unsigned int *v)
 {
-	return 0;
+	return false;
 }
 static inline bool arch_get_random_seed_long(unsigned long *v)
 {
-	return 0;
+	return false;
 }
 static inline bool arch_get_random_seed_int(unsigned int *v)
 {
-	return 0;
+	return false;
 }
 #endif
 
-- 
2.17.1

