Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B4869F1931
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 15:55:51 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477V2s1tQdzF5RJ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2019 01:55:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::344;
 helo=mail-wm1-x344.google.com; envelope-from=richard.henderson@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="e5nNk39V"; 
 dkim-atps=neutral
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477T6G0rGlzF46J
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2019 01:13:42 +1100 (AEDT)
Received: by mail-wm1-x344.google.com with SMTP id 8so3554520wmo.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Nov 2019 06:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=EtW7c5+Vxuw361NPgarxEa4pkxF91xrS2XEr4qnN4jI=;
 b=e5nNk39VJ5IOgRqdcXf58JkLAmLsag2O4+U458JjYo5P0PSEMekSFRL7LZc2d3m3VJ
 URQyFUvE8jMn4eVvMtPS4S4bwU+o51HOhtfgwYme4dhoLAOHd8OHl1q5buqF/oxhumhw
 +z3jc1g7Ck1yBgoUiT30MrVfaQcI9SAZcV6//J2C/MjC41OM02IYNasElc3UDquPybqb
 baWyh7WRSDEfEhipTjcqjxsGo/IM/qSUCmUCE5UrGsB4dj0txgaPvPHy4E6e/8b6xTks
 +7wsbS1O4VTbwJoSISfsP2WPk3MvEuhRHnX4Tq6FkCgrC9KgWh7M7bDPmgQZAuRo+xGE
 Q0vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=EtW7c5+Vxuw361NPgarxEa4pkxF91xrS2XEr4qnN4jI=;
 b=n7G8UG5ruM0R9sueZWGKaSyPPXUPYeLESrnxwMpCY6y4IStfkc3K8BxNn3nfRQearY
 RRdshG6Ga/FTbgVGNx1RDf2zfX11zkpb8g9fRnasNaYWEruBQZLDSZGJlNxce/JQEwip
 Tn3RrTJABtSg6ZQkZCVTaLg54GMhVBgvrAGG0g1Siefi3iLnE4j8NwhkyBWUShRFF3Gz
 iuC9vlazjv3Q/31EgfB0xR2I8qZb+hXwwukeqOoFOhH2AwaKUMu5s/cJD4gl+RxnthbU
 dkhroC5m7zlAedPovhWDzoYsM/YDwpbTuDMmEahZkMtOSAsSPsxgzVDSwUSTR1iMN99W
 17iw==
X-Gm-Message-State: APjAAAVSNkShSx/GA6XBx/HchOuvEkwotp0XgVzNGWo9GD0CNPRdPLf+
 Re/jpDphwmlre5kQ48OSgId8+Q==
X-Google-Smtp-Source: APXvYqwQkS3HkPb4xqO71j4GDBQsJDOPu6hiWKUGgF3l2gy8AO8EiMAAlXbkknCw6t0pwT+ISh1RMQ==
X-Received: by 2002:a7b:c776:: with SMTP id x22mr2609658wmk.144.1573049619319; 
 Wed, 06 Nov 2019 06:13:39 -0800 (PST)
Received: from localhost.localdomain
 (31.red-176-87-122.dynamicip.rima-tde.net. [176.87.122.31])
 by smtp.gmail.com with ESMTPSA id b3sm2837556wma.13.2019.11.06.06.13.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2019 06:13:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
X-Google-Original-From: Richard Henderson <rth@twiddle.net>
To: linux-crypto@vger.kernel.org
Subject: [PATCH v2 10/10] s390x: Mark archrandom.h functions __must_check
Date: Wed,  6 Nov 2019 15:13:08 +0100
Message-Id: <20191106141308.30535-11-rth@twiddle.net>
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

Reviewed-by: Harald Freudenberger <freude@linux.ibm.com>
Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Richard Henderson <rth@twiddle.net>
---
 arch/s390/include/asm/archrandom.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/s390/include/asm/archrandom.h b/arch/s390/include/asm/archrandom.h
index 9a6835137a16..de61ce562052 100644
--- a/arch/s390/include/asm/archrandom.h
+++ b/arch/s390/include/asm/archrandom.h
@@ -21,17 +21,17 @@ extern atomic64_t s390_arch_random_counter;
 
 bool s390_arch_random_generate(u8 *buf, unsigned int nbytes);
 
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
 	if (static_branch_likely(&s390_arch_random_available)) {
 		return s390_arch_random_generate((u8 *)v, sizeof(*v));
@@ -39,7 +39,7 @@ static inline bool arch_get_random_seed_long(unsigned long *v)
 	return false;
 }
 
-static inline bool arch_get_random_seed_int(unsigned int *v)
+static inline bool __must_check arch_get_random_seed_int(unsigned int *v)
 {
 	if (static_branch_likely(&s390_arch_random_available)) {
 		return s390_arch_random_generate((u8 *)v, sizeof(*v));
-- 
2.17.1

