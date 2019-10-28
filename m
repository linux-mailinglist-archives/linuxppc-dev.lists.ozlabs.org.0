Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 84720E7B7D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Oct 2019 22:40:47 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4727SD6C77zDrg5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2019 08:40:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::341;
 helo=mail-wm1-x341.google.com; envelope-from=richard.henderson@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="d90aNC76"; 
 dkim-atps=neutral
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4726hM463jzDqYP
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2019 08:06:08 +1100 (AEDT)
Received: by mail-wm1-x341.google.com with SMTP id 11so436380wmk.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Oct 2019 14:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=5fdqGpsTwRZzstj7gG8G4eynLpsoyPuwBiWzvUXzIcI=;
 b=d90aNC76Z65wi1qyl4LR/h4h7b/L01Zgboc3RhCWk336Xyh2t5COYQWc8Spj8aNKpV
 3IyU7rkdlbyrL3VcFzY+XJ0RDwDeU3uSGnBYVF/YtkpR+1e7LGzNrEKbXy3HKezmhyX6
 H/npgaJyq1LNevmp89zjnlO59XFdrIs9YoC6m6KyDfA03KrQqN3cTGb8VGgTN1rtIVab
 89vt+61pZYpoN26FQgwmaYsJ3Mn8VipHO5aQbJrzadfNwXSFdjqeoBiOLQ7vhnusaXk5
 5KaaUq9OKtTFWQnMNKFg+qAhaTnMZndhT+qW5eG6A9AZl8DolLQ4sFKvJnv/K0i3Mkt4
 rQUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=5fdqGpsTwRZzstj7gG8G4eynLpsoyPuwBiWzvUXzIcI=;
 b=d5YZ5lTfSC5ploHG+L0abg/EV9vBxgYaVGBF+5+KkirrLpI6+87MyX3kNMoU0UJJDc
 4rPzyr5wq0yWsnTq9nuO3GRMaHuZWAIwP+8g2/ZnFvBoYSoqqIG2hID9vz1aaGfUWH2V
 L9EYK4soGQo/GCUidRfjFsjJpu+14UOwHcF8pHtrZjgdadt31BcjFly5pk73uMxfMglQ
 uHrUvlNCMxfuJCtKNg3VrS4+duYheLRk5TDjK9UPpgvkmA09MFpmMWpIq/jplxG0CpFM
 mZA48SA6t0Z7jUMvHMRyDYKd7akDTBJ43qYm3r2MJCj9LoRKKMOkoG499/iM/5exXOUy
 ZIHA==
X-Gm-Message-State: APjAAAUhYYHGwlMfa6zcHPOBZSgbOiTBTMaVjIXqaoYw2NbLgbDVYeXg
 g1r3xxbfSNZQWvk1EA3gfJVOgQ==
X-Google-Smtp-Source: APXvYqzrmbIZmiYJeRI8foiZBFn/3gbaj86T1/tVP1Bb5VrPLCuZQ0g/WmL7p4dJ4/LUsgNkETKzXA==
X-Received: by 2002:a05:600c:2908:: with SMTP id
 i8mr1147516wmd.142.1572296763797; 
 Mon, 28 Oct 2019 14:06:03 -0700 (PDT)
Received: from localhost.localdomain (230.106.138.88.rev.sfr.net.
 [88.138.106.230])
 by smtp.gmail.com with ESMTPSA id b196sm927822wmd.24.2019.10.28.14.06.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 14:06:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
X-Google-Original-From: Richard Henderson <rth@twiddle.net>
To: linux-arch@vger.kernel.org
Subject: [PATCH 1/6] random: Mark CONFIG_ARCH_RANDOM functions __must_check
Date: Mon, 28 Oct 2019 22:05:54 +0100
Message-Id: <20191028210559.8289-2-rth@twiddle.net>
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
Cc: linux-s390@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We cannot use the pointer output without validating the
success of the random read.

Signed-off-by: Richard Henderson <rth@twiddle.net>
---
Cc: Kees Cook <keescook@chromium.org>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-arch@vger.kernel.org
---
 include/linux/random.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/random.h b/include/linux/random.h
index f189c927fdea..84947b489649 100644
--- a/include/linux/random.h
+++ b/include/linux/random.h
@@ -167,11 +167,11 @@ static inline void prandom_seed_state(struct rnd_state *state, u64 seed)
 #ifdef CONFIG_ARCH_RANDOM
 # include <asm/archrandom.h>
 #else
-static inline bool arch_get_random_long(unsigned long *v)
+static inline bool __must_check arch_get_random_long(unsigned long *v)
 {
 	return 0;
 }
-static inline bool arch_get_random_int(unsigned int *v)
+static inline bool __must_check arch_get_random_int(unsigned int *v)
 {
 	return 0;
 }
@@ -179,11 +179,11 @@ static inline bool arch_has_random(void)
 {
 	return 0;
 }
-static inline bool arch_get_random_seed_long(unsigned long *v)
+static inline bool __must_check arch_get_random_seed_long(unsigned long *v)
 {
 	return 0;
 }
-static inline bool arch_get_random_seed_int(unsigned int *v)
+static inline bool __must_check arch_get_random_seed_int(unsigned int *v)
 {
 	return 0;
 }
-- 
2.17.1

