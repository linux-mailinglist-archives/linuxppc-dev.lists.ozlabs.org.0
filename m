Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA4CF189E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 15:28:46 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477TRb1n5LzF23w
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2019 01:28:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::344;
 helo=mail-wm1-x344.google.com; envelope-from=richard.henderson@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="Xf2Ks/Jq"; 
 dkim-atps=neutral
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477T644J24zF3B3
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2019 01:13:32 +1100 (AEDT)
Received: by mail-wm1-x344.google.com with SMTP id v3so2457016wmh.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Nov 2019 06:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=QNZ1kA4q8aBB50NVJWu8PbKcs9AjHNKMK3pxZ9fNJP4=;
 b=Xf2Ks/Jq/ihGwNCma8VLqakFtNZHKXIuWjUMxPXRRbJUiPMCjNJdWtn/qgWP/5sax7
 Ujfw6TL3LrTHr+uDBhPChxFljQzS5xgGpRxtwOO3Cwx5CN9yZ8J+CA955DxnUVBtrQY9
 UQ1bY0WghbSRoxyO+YnPSEFpDzUjl87KqEH5SgdaSVeeYvhaF4C+6ymBYsygd0tMpK+B
 v1Ysb6J+hZxqg7dNd/kemAXJbzAWO4QDbjPoSV2WnuX18FdLVu+FkYfbLwr3DTApGJwK
 qos9OGs4AuUlU8h/o/Y+yYw2NPn+omvenj9islnObpixtFKklAt0n2mEtWosrHsO99wv
 YyoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=QNZ1kA4q8aBB50NVJWu8PbKcs9AjHNKMK3pxZ9fNJP4=;
 b=GD6RYA+slgRVV6YJsphlFBV7Loz6MeD++1AF2e4DPm+hkfW8KlXWKz8Xm10W9fP5ZR
 BkvZMA3oyvqPp2wAJpb8pPUgytwhZX/HvhbgJQPfnpeHS0HCA2pS7oQTqKwy1I+Diuof
 6+TOtXheKLejApOUyphV9y4zW/q7kdDJzUcEsSNrmorlQET3UDuJADEPlCdbATOTXLij
 HO/cueXgy+7Q3aUvDllSlNx4/iFAYKWaqnVDv0w3+A7mTZVWbeH8+y41VUtxtR3HbVrt
 58E7Z6iB2XjBqMM5YDGmlrVWPBJs2HTIqX1rLSbAH/jIka/B+XbetSepoTcPVHJMMURO
 Tc4Q==
X-Gm-Message-State: APjAAAXraIHIkT3tJYzZsM2x0fOq4oAyHDNsDsyJ+cmIEd+JxNmorN5k
 E5cKaNwhlwfWfyp4rRmrHvWhQQ==
X-Google-Smtp-Source: APXvYqxlrxPHyV7WtfZwm6qyJvzgfUOUugHAQxtpX4eBnKipnxbgOwtoZZo0ZBiVDsCnO8UnT+Wz5A==
X-Received: by 2002:a1c:544b:: with SMTP id p11mr2802294wmi.46.1573049609122; 
 Wed, 06 Nov 2019 06:13:29 -0800 (PST)
Received: from localhost.localdomain
 (31.red-176-87-122.dynamicip.rima-tde.net. [176.87.122.31])
 by smtp.gmail.com with ESMTPSA id b3sm2837556wma.13.2019.11.06.06.13.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2019 06:13:28 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
X-Google-Original-From: Richard Henderson <rth@twiddle.net>
To: linux-crypto@vger.kernel.org
Subject: [PATCH v2 04/10] linux/random.h: Remove arch_has_random,
 arch_has_random_seed
Date: Wed,  6 Nov 2019 15:13:02 +0100
Message-Id: <20191106141308.30535-5-rth@twiddle.net>
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

The arm64 version of archrandom.h will need to be able to test for
support and read the random number without preemption, so a separate
query predicate is not practical.

Since this part of the generic interface is unused, remove it.

Signed-off-by: Richard Henderson <rth@twiddle.net>
---
 include/linux/random.h | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/include/linux/random.h b/include/linux/random.h
index f189c927fdea..7fd0360908d2 100644
--- a/include/linux/random.h
+++ b/include/linux/random.h
@@ -175,10 +175,6 @@ static inline bool arch_get_random_int(unsigned int *v)
 {
 	return 0;
 }
-static inline bool arch_has_random(void)
-{
-	return 0;
-}
 static inline bool arch_get_random_seed_long(unsigned long *v)
 {
 	return 0;
@@ -187,10 +183,6 @@ static inline bool arch_get_random_seed_int(unsigned int *v)
 {
 	return 0;
 }
-static inline bool arch_has_random_seed(void)
-{
-	return 0;
-}
 #endif
 
 /* Pseudo random number generator from numerical recipes. */
-- 
2.17.1

