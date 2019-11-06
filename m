Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FA0F190A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 15:47:17 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477Try0D2XzF5jw
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2019 01:47:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::443;
 helo=mail-wr1-x443.google.com; envelope-from=richard.henderson@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="I2POX88Z"; 
 dkim-atps=neutral
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477T6C5Pw2zF3Pb
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2019 01:13:39 +1100 (AEDT)
Received: by mail-wr1-x443.google.com with SMTP id q13so25997736wrs.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Nov 2019 06:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=fqzAPQhanx5lXrgKjEv9uTOrlBIqmOP4j8raLoO2k80=;
 b=I2POX88ZgDVEIXbxSVYMlxZS/dZ7L9KVhUwt+3VSv9oM/hQnoUVFd/6BdiDiRkN72e
 mb3HIJ8zn335Mrlnm7+1kBy52YQr8iVQF2Ja5iGFzC2aYsdzlXapp9hOL4hr/d25WSIb
 TLlS5LGfym6UNlJ25r+k4XhtiyR+AcOmsf8KxheDxTBSYyezHh6NYY+RQW8omSd+sxht
 EExXnP+uHJklWzU8BZnUIUTZqb1eV8tqpuILEWnzNrXEiuexc65TTdG06IsXsKChYaG2
 M8rk6v6P9kDamxYzI4+MMtDD4T8sy85hVCZM4ztqGTKQTpNvGNLVZNDmZx/i/SqHqgJj
 0d0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=fqzAPQhanx5lXrgKjEv9uTOrlBIqmOP4j8raLoO2k80=;
 b=DM4WtnpyGGP/EYJcxV7eXv18sWR8fZN5CptqU56TUg4nrSDHmXpohMKH8KRn7J3b0h
 yF5NfhVVMDGFBkh1xhUGMI2hJuxsm3I30LeVI9Y9CPzSpLI9UM7jNjlP7MX6rjKtYHzS
 R1P1nK0IEaVYd3h+dGZaAFkkWYlo+9FaPbBK2HVslUl8VZemnE7MTO/GJQlzXD3xg100
 lc3jiyFSBhSKXo+kATCcqwA044HtyWawSSHaperCD1LaGNLETgWchvSPQeVaa2k0V2i9
 FYVJKxiGu0qCFtq4r5S6UwOuYtcoxn8khtI7VsPWJb2bGZSRdTJzejbSE0bYJZX+WfJt
 pkOQ==
X-Gm-Message-State: APjAAAU3X6DWq9q1nOsrRQj2PZ6AvnKMNcqEnt7ZE8VBpdvNysOO8vhU
 JdzMA2+u76Xp+Lyd9jqTFEqpKQ==
X-Google-Smtp-Source: APXvYqx6m5i8d6WRVdHpkTE7+G9qJitHWAUl7IdCDvjMTeMctINMPoeFa1SZY80r+vkjd7EqisEAzw==
X-Received: by 2002:a05:6000:128c:: with SMTP id
 f12mr3122000wrx.279.1573049615963; 
 Wed, 06 Nov 2019 06:13:35 -0800 (PST)
Received: from localhost.localdomain
 (31.red-176-87-122.dynamicip.rima-tde.net. [176.87.122.31])
 by smtp.gmail.com with ESMTPSA id b3sm2837556wma.13.2019.11.06.06.13.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2019 06:13:35 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
X-Google-Original-From: Richard Henderson <rth@twiddle.net>
To: linux-crypto@vger.kernel.org
Subject: [PATCH v2 08/10] powerpc: Use bool in archrandom.h
Date: Wed,  6 Nov 2019 15:13:06 +0100
Message-Id: <20191106141308.30535-9-rth@twiddle.net>
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

The generic interface uses bool not int; match that.

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Richard Henderson <rth@twiddle.net>
---
 arch/powerpc/include/asm/archrandom.h | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/include/asm/archrandom.h b/arch/powerpc/include/asm/archrandom.h
index c2ed3b4681f5..7766812e2355 100644
--- a/arch/powerpc/include/asm/archrandom.h
+++ b/arch/powerpc/include/asm/archrandom.h
@@ -6,27 +6,28 @@
 
 #include <asm/machdep.h>
 
-static inline int arch_get_random_long(unsigned long *v)
+static inline bool arch_get_random_long(unsigned long *v)
 {
-	return 0;
+	return false;
 }
 
-static inline int arch_get_random_int(unsigned int *v)
+static inline bool arch_get_random_int(unsigned int *v)
 {
-	return 0;
+	return false;
 }
 
-static inline int arch_get_random_seed_long(unsigned long *v)
+static inline bool arch_get_random_seed_long(unsigned long *v)
 {
 	if (ppc_md.get_random_seed)
 		return ppc_md.get_random_seed(v);
 
-	return 0;
+	return false;
 }
-static inline int arch_get_random_seed_int(unsigned int *v)
+
+static inline bool arch_get_random_seed_int(unsigned int *v)
 {
 	unsigned long val;
-	int rc;
+	bool rc;
 
 	rc = arch_get_random_long(&val);
 	if (rc)
-- 
2.17.1

