Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A94C4F18AC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 15:32:59 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477TXS5GcBzDqLC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2019 01:32:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::441;
 helo=mail-wr1-x441.google.com; envelope-from=richard.henderson@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="Lt8NSkic"; 
 dkim-atps=neutral
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477T671lKKzF3Fq
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2019 01:13:35 +1100 (AEDT)
Received: by mail-wr1-x441.google.com with SMTP id i10so5286396wrs.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Nov 2019 06:13:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=LOCSV59QoWVHACgzHE/U/CUT/RhU8DoyNGp2OnfJ+HA=;
 b=Lt8NSkicjrMViO5Eg4iicjQ9Um4Q/kPhTekzALb+HzNHfhDBmznekCXpWfFCqxbPf1
 XOZbS8K2jooY/Eh/31ehUIBaypEbhpyPqh9lub2S0lbmj/O81IwFa7dqMAQj6ppnMr97
 h/sNucOFsQ1bw9fFy47CCesF+0lx7lCCx4pM7OMgkxiGq6zqQ0YuondQvtGoWarNmqPF
 O03RynY9JHqQ9r3dfWX6s/Iy4zuK/kFgiBT3QXKGHNPYenHtppO+8gHzQKodjZWngOGF
 /2dp4+1OO0PAUlrW0CXW7rSAK8WFPvwHkNyb3WEsqOlkKLv3LtcOVNpqbcfmzzDC32/P
 I53w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=LOCSV59QoWVHACgzHE/U/CUT/RhU8DoyNGp2OnfJ+HA=;
 b=hZ6XZAd62d00f0yvxpsYVzJybamZwHFVeuC8x9OWLN79+SbwQKezqPz2fzVeyE3/5c
 eulMLa4QTwVSqA60JLU2PUsHokQtqytygY8uec1JKrpA60EtFIRZcDZqC1LjD21RFtSZ
 xndC3IJ5xcZGynoFrnJR+ppaKrzsBcOeCtdbLXt4yR3KcHJgf2wxHAnrn3JVTguJiGqs
 0es1COpJdheaLzKwcOaFrONl8CEjl46SC/t2kmop3oEipw3Blp0+aZvQwJSPqCMbBYTg
 EAKrAP+eS8v49T2HcshbMTELmlLbPbVbYF7VA4hQCuqfCrlvOGWs/sPaUVN/TPQsK+ca
 voTQ==
X-Gm-Message-State: APjAAAXWFqFgeZDF0/1bnEAGk/u08+PYyYrbv0RwSaQRlZ8b89zparmB
 ABgART/3NARe2G7/mBgkWvUui7HBwQIBfQ==
X-Google-Smtp-Source: APXvYqzK5FGfZx+mRuVsrOtGAG1CMADIYVflqnomqokFyeKkGb54YgnosWkS0ihW4ENT9j5fGGhC4g==
X-Received: by 2002:a5d:4885:: with SMTP id g5mr3106213wrq.287.1573049612495; 
 Wed, 06 Nov 2019 06:13:32 -0800 (PST)
Received: from localhost.localdomain
 (31.red-176-87-122.dynamicip.rima-tde.net. [176.87.122.31])
 by smtp.gmail.com with ESMTPSA id b3sm2837556wma.13.2019.11.06.06.13.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2019 06:13:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
X-Google-Original-From: Richard Henderson <rth@twiddle.net>
To: linux-crypto@vger.kernel.org
Subject: [PATCH v2 06/10] linux/random.h: Mark CONFIG_ARCH_RANDOM functions
 __must_check
Date: Wed,  6 Nov 2019 15:13:04 +0100
Message-Id: <20191106141308.30535-7-rth@twiddle.net>
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

We must not use the pointer output without validating the
success of the random read.

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Richard Henderson <rth@twiddle.net>
---
 include/linux/random.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/random.h b/include/linux/random.h
index ea0e2f5f1ec5..d319f9a1e429 100644
--- a/include/linux/random.h
+++ b/include/linux/random.h
@@ -167,19 +167,19 @@ static inline void prandom_seed_state(struct rnd_state *state, u64 seed)
 #ifdef CONFIG_ARCH_RANDOM
 # include <asm/archrandom.h>
 #else
-static inline bool arch_get_random_long(unsigned long *v)
+static inline bool __must_check arch_get_random_long(unsigned long *v)
 {
 	return false;
 }
-static inline bool arch_get_random_int(unsigned int *v)
+static inline bool __must_check arch_get_random_int(unsigned int *v)
 {
 	return false;
 }
-static inline bool arch_get_random_seed_long(unsigned long *v)
+static inline bool __must_check arch_get_random_seed_long(unsigned long *v)
 {
 	return false;
 }
-static inline bool arch_get_random_seed_int(unsigned int *v)
+static inline bool __must_check arch_get_random_seed_int(unsigned int *v)
 {
 	return false;
 }
-- 
2.17.1

