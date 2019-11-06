Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 426BDF188A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 15:25:27 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477TMm4cK5zF4Vj
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2019 01:25:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::344;
 helo=mail-wm1-x344.google.com; envelope-from=richard.henderson@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="jlbxIkKe"; 
 dkim-atps=neutral
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477T623LNPzF38g
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2019 01:13:30 +1100 (AEDT)
Received: by mail-wm1-x344.google.com with SMTP id q70so3627143wme.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Nov 2019 06:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Bz6tm/Oq0JWNumhKoQOUWz+Q8JBAOdsIYOzjRyK0W9o=;
 b=jlbxIkKeL3Kg9sDbtCvzA0n80dNlWQeuKrHjCLy6JkLv+44YWN0XV/6Ri5hrDJmKx7
 RMw4nFFVFEbc3Y43ASQyDevRbQ1KafjwpXr/+E2NcnKi61gvBNO4T5/CoC/aVOJm1lF8
 afbdpOMvBrB1PiyE7mIkTCZmfFEppYlBRLE9bG4/7knt6uyuQCtc6yz3OfqEd7nJhW4y
 GaY42uHnvI3nskibfGwiI5um1+tf3nhRZnrxGC/x4jUZBdRvl7Ux9op1d4aYxNqMN6Yy
 Ugk6EsBMx1LG9OwSj5B/GAIoV5iSi0eBnC1ZNGpu0dDycG59m6by5s72ZnVqiH3P+Yu/
 polQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Bz6tm/Oq0JWNumhKoQOUWz+Q8JBAOdsIYOzjRyK0W9o=;
 b=UmdW34nRLxscsMFM9x6RCuMzFb9jDiRY7OgK/N5e8DsQZZV2FwLL1YncrAGK5u/Asc
 wPUHvHKMlcA59Dr5RmH4uMd2d3UWO28lsnvzjolPqMwdkmMRzAPV7zcK95yllcPamCFJ
 mD0oXfGBFdFRPGki+mC+6JrRkpsLfTRdnzYSTUx5ZlwqI/5F4mlcYBE7jBIj9ZY50ruf
 pp8EVKLAJwIZMT7taCyj63oYjWewu1P83uFZcRG0ImBiRcjG/Qkb7FZoIMDK3THqY8T5
 vheQGo/Gr+hGBB21279lUjdZIWCIZL3gfD+Okbuw3F57GahgoYAlZoVyGeH76lP0wqgf
 3M0w==
X-Gm-Message-State: APjAAAWqBtSf5oPOYqb6vPLbTMJ316ovXpw1l6Ieeuy4G9IaFNm/jeGt
 cmlNInZQM2+y+vtMn+7Bv5I0VA==
X-Google-Smtp-Source: APXvYqx0JMbMKxvkK6MwbV+885ST1BoFA+6H9mqlYYb0WUFjcxzb2zWqAt5vUgOEk43WSZGg8BgArw==
X-Received: by 2002:a05:600c:28c:: with SMTP id
 12mr2652459wmk.25.1573049607535; 
 Wed, 06 Nov 2019 06:13:27 -0800 (PST)
Received: from localhost.localdomain
 (31.red-176-87-122.dynamicip.rima-tde.net. [176.87.122.31])
 by smtp.gmail.com with ESMTPSA id b3sm2837556wma.13.2019.11.06.06.13.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2019 06:13:27 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
X-Google-Original-From: Richard Henderson <rth@twiddle.net>
To: linux-crypto@vger.kernel.org
Subject: [PATCH v2 03/10] s390: Remove arch_has_random, arch_has_random_seed
Date: Wed,  6 Nov 2019 15:13:01 +0100
Message-Id: <20191106141308.30535-4-rth@twiddle.net>
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

These symbols are currently part of the generic archrandom.h
interface, but are currently unused and can be removed.

Signed-off-by: Richard Henderson <rth@twiddle.net>
---
 arch/s390/include/asm/archrandom.h | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/arch/s390/include/asm/archrandom.h b/arch/s390/include/asm/archrandom.h
index c67b82dfa558..9a6835137a16 100644
--- a/arch/s390/include/asm/archrandom.h
+++ b/arch/s390/include/asm/archrandom.h
@@ -21,18 +21,6 @@ extern atomic64_t s390_arch_random_counter;
 
 bool s390_arch_random_generate(u8 *buf, unsigned int nbytes);
 
-static inline bool arch_has_random(void)
-{
-	return false;
-}
-
-static inline bool arch_has_random_seed(void)
-{
-	if (static_branch_likely(&s390_arch_random_available))
-		return true;
-	return false;
-}
-
 static inline bool arch_get_random_long(unsigned long *v)
 {
 	return false;
-- 
2.17.1

