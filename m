Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA7FF1922
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 15:51:54 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477TyJ0DbjzF4kZ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2019 01:51:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::343;
 helo=mail-wm1-x343.google.com; envelope-from=richard.henderson@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="Zt7Gm1T+"; 
 dkim-atps=neutral
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477T6D6rBgzF3Kj
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2019 01:13:40 +1100 (AEDT)
Received: by mail-wm1-x343.google.com with SMTP id f3so3494149wmc.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Nov 2019 06:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=d0srGooF0rUVSStaoSaPVl4d3tRFVDopwGFjT5DN+Wg=;
 b=Zt7Gm1T+U7ZFk4dp2KJZ4ivQM/cx3tQpRMnDTSvYsTCPaOs14OPmmARgBVQFEc+lD0
 wYz0WNdI63E1W72X/zcnwS74mw7NVDXzTtQkjtu03sHH5Tm2+jJJn8rorasVu2SPgGSa
 FXCvlLKDVIhnLqiwjxdmyrineQ1dQ8I/2Byaia80R9wHg/FW+fui6G2yTLgOEMsGu+94
 M+8Z2PiVw8Kk3wLLnI9gVlIlrXpzhhk5KjTYVkMAqTNit8YehzmBakPJCHH0g0XOT5+r
 EvOn6Zv32u5W8323sPpA6JDD/iM0DyWGqIGVDMHA+zaXXVcYLV1HROnbbjEYRp4JYyfT
 BHHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=d0srGooF0rUVSStaoSaPVl4d3tRFVDopwGFjT5DN+Wg=;
 b=B1DGETSObGBl/d0/WfFpfstKo9BseGL7cY/brun0sbVk9CpbbNln4jlg/eyIVvkvXh
 kr+ONkbeYM4uy9kwcGaYxiV60E3qbXMg0UmAQLJy+AWtQf8/kNS2TtiyCpDuVLMBwm4R
 XzWk74FwrYM+LljYMgLZwqSHjC4CtkZqq193Q38cuEjD3Oo4RgrhD5rIPYpbvEozxD/O
 7QJLAjGK0uHlHbecARwNgAv4ugFpoVZllDbY3OPB2ogvnCNWIv/r0dOo9BNhin22ir7T
 HU6c1sMT29mcFusOAdMamF06nRGlniFwBWrEPqxNHvpgNpYl6pFfIG449JpNg6tukaru
 LhwA==
X-Gm-Message-State: APjAAAUL0mUdtQLrPEafighaZdwJRpzCsadkMWPljG6vPdbkZfvvMjNm
 acmPn/I6U18jhHyyUp/XzDGjJg==
X-Google-Smtp-Source: APXvYqxNBDVKYhSw+hLyjEH+eUfDn+GxBE+Ubwz+XzjWaTbr9XmBN5lE9yxYUoj4EN0dp1g806RW4w==
X-Received: by 2002:a1c:2b82:: with SMTP id r124mr2757815wmr.112.1573049617471; 
 Wed, 06 Nov 2019 06:13:37 -0800 (PST)
Received: from localhost.localdomain
 (31.red-176-87-122.dynamicip.rima-tde.net. [176.87.122.31])
 by smtp.gmail.com with ESMTPSA id b3sm2837556wma.13.2019.11.06.06.13.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2019 06:13:37 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
X-Google-Original-From: Richard Henderson <rth@twiddle.net>
To: linux-crypto@vger.kernel.org
Subject: [PATCH v2 09/10] powerpc: Mark archrandom.h functions __must_check
Date: Wed,  6 Nov 2019 15:13:07 +0100
Message-Id: <20191106141308.30535-10-rth@twiddle.net>
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

Acked-by: Michael Ellerman <mpe@ellerman.id.au>
Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Richard Henderson <rth@twiddle.net>
---
 arch/powerpc/include/asm/archrandom.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/archrandom.h b/arch/powerpc/include/asm/archrandom.h
index 7766812e2355..60b8ad798743 100644
--- a/arch/powerpc/include/asm/archrandom.h
+++ b/arch/powerpc/include/asm/archrandom.h
@@ -6,17 +6,17 @@
 
 #include <asm/machdep.h>
 
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
 	if (ppc_md.get_random_seed)
 		return ppc_md.get_random_seed(v);
@@ -24,7 +24,7 @@ static inline bool arch_get_random_seed_long(unsigned long *v)
 	return false;
 }
 
-static inline bool arch_get_random_seed_int(unsigned int *v)
+static inline bool __must_check arch_get_random_seed_int(unsigned int *v)
 {
 	unsigned long val;
 	bool rc;
-- 
2.17.1

