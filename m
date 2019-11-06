Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F19BF1859
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 15:22:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477TJC3wlqzF5KD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2019 01:22:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::343;
 helo=mail-wm1-x343.google.com; envelope-from=richard.henderson@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="Opt6blMO"; 
 dkim-atps=neutral
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477T616MwTzF3B3
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2019 01:13:29 +1100 (AEDT)
Received: by mail-wm1-x343.google.com with SMTP id c17so3609369wmk.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Nov 2019 06:13:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=gp6KNxHNYtmFYMKMCYa0gsOo8NLakQXjLI1+wdZrrFY=;
 b=Opt6blMOd91CMO9Sq9Y5A3q4PwF3GSjNzIXhSluaGOyG+rbDxGLdCQGbPVE5bXKBKZ
 aiLXzj4m6i5ZQoTXpmx5rChqonOJISLaMtdj1+byk7Lr8lPtDs28C0jlPzGHMMtEbZmm
 7dm9d8IvcXzRGMnZAKYMbPIBPY2bDTOk49lIHT4bFr5KqZ5prLSSgXUOv6jUPSLjGUYR
 6DJPE/b5BRZTkL0wI0LsgP3k3jLyGQ9uB69hYUuVFG9xxRxpoVLOxmiRAUjNlawvAFIn
 cXqLhSYYSbeV1YOl+1KwcdK62FIuDKKMLAF0JTvEXftqvOXeMxpVSFsKMNrZ9n/m2c0V
 I1nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=gp6KNxHNYtmFYMKMCYa0gsOo8NLakQXjLI1+wdZrrFY=;
 b=PoVkTCVFW8po3RjEwY2kP1ZdTrwP6U7cfnaBg38kmP6//GVDsMm9XiVKIdaRo4KTYp
 vRMUNpnzo8FcrnRFYfnzRmO/DdTvYTHSfmHJNzYtTk2Gvk7eXj3nWPPEjOtXK5oaHtGn
 ru/IMrCw/KZp7TlT0UBEK2iXTzlAmev9GaxfesUGhqEeV0fLKk8dzQTmVO5E3QY0HkJ4
 t8lNJ5XSB8YJZqtiIClBys45RHFZhG+gv0Qf0dTUrqdYTxB2JAQZ4vLD2GzCwDPEYDd8
 AUJTbawy5CfrXZ60WMRL4PODTGUEn2blZJr48HIDmQZXK8YxtQgcGLtnbUvaRhOJXjRK
 9U/w==
X-Gm-Message-State: APjAAAWPQIlcq80b63NBCabepIY6ZdKrdU6JMw92NcjVjmCv1stXXIqn
 Q+FiRXtvnKu7YvyKGCp92neCng==
X-Google-Smtp-Source: APXvYqxzkw9+rREvmeedrYS01ECAtNQ4De91+b1ooIUzZfNnnzCG5td8seHkoCoHaz61lQ9u/onNCg==
X-Received: by 2002:a7b:c549:: with SMTP id j9mr2820695wmk.88.1573049605900;
 Wed, 06 Nov 2019 06:13:25 -0800 (PST)
Received: from localhost.localdomain
 (31.red-176-87-122.dynamicip.rima-tde.net. [176.87.122.31])
 by smtp.gmail.com with ESMTPSA id b3sm2837556wma.13.2019.11.06.06.13.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2019 06:13:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
X-Google-Original-From: Richard Henderson <rth@twiddle.net>
To: linux-crypto@vger.kernel.org
Subject: [PATCH v2 02/10] powerpc: Remove arch_has_random, arch_has_random_seed
Date: Wed,  6 Nov 2019 15:13:00 +0100
Message-Id: <20191106141308.30535-3-rth@twiddle.net>
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
 arch/powerpc/include/asm/archrandom.h | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/arch/powerpc/include/asm/archrandom.h b/arch/powerpc/include/asm/archrandom.h
index 9c63b596e6ce..c2ed3b4681f5 100644
--- a/arch/powerpc/include/asm/archrandom.h
+++ b/arch/powerpc/include/asm/archrandom.h
@@ -34,16 +34,6 @@ static inline int arch_get_random_seed_int(unsigned int *v)
 
 	return rc;
 }
-
-static inline int arch_has_random(void)
-{
-	return 0;
-}
-
-static inline int arch_has_random_seed(void)
-{
-	return !!ppc_md.get_random_seed;
-}
 #endif /* CONFIG_ARCH_RANDOM */
 
 #ifdef CONFIG_PPC_POWERNV
-- 
2.17.1

