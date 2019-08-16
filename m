Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D418C903AB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 16:09:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4694vV70Q3zDrfd
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Aug 2019 00:09:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:4864:20::444; helo=mail-wr1-x444.google.com;
 envelope-from=ard.biesheuvel@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="DeUw93E3"; 
 dkim-atps=neutral
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4694r23ZzkzDrCl
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Aug 2019 00:06:37 +1000 (AEST)
Received: by mail-wr1-x444.google.com with SMTP id s18so1687609wrn.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2019 07:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=FDmnpjEbDvIvEVLNq8R7T0AYfQ4p5jgV5DbMjGWZEWg=;
 b=DeUw93E3HJ0D037HC4xGonLxRTV/6nyj1dVW94whegeI0gf/K5qH9GABzkUDkDVZN+
 WTLbHlHTK0y88Wj4BmhZ5VDDzNzMnVo4ltmNvdMmST7lfJjggn4qF8wsVo65ArPg51Bv
 uYKq03pUe8c+uWHG2JN5/zBvuxzWw4yrYY5n5eINw7q9F/ygy8FGHeiZY5DjEJONitCP
 dRBA+eBaVwvQYsLTfixFhL4vYRZnuzwrgRs1dzNzIzo6s9aPWMdp3UdP1/VJCjZAQAbQ
 uzwxjFhRp+wySx257SX66O0HD3+ZifJ6oiJrubsnuG/aLd6qCwvQZJ0Tu+s3sJCtoqCz
 LQBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=FDmnpjEbDvIvEVLNq8R7T0AYfQ4p5jgV5DbMjGWZEWg=;
 b=H0YdmbNYcXmWxtrThWAAckn9Rs7IBXTTWdBFoOBPpTF5MkQHtaQqnYn5TE3VBGGwnN
 kfkfSPNogBrJ2GIiehtf1nbYSGWgEZqK3tx0RWy89UQkNDYshDudbr5LFqgJLP0gtOh7
 cTestqykpB2Iu3P9kU4evgCdzwhQt+dG7gv9llnTR4wqyenB/MH3MluZ2Sjox/CGmAYU
 gZrsikk5gEYP2wJ4FhnwMfFflVbprh5fa94jhbQg6AaAb/ym8PyOjE+nPeKoZjrZgtqW
 Z0GKDoEKD8mVr+P8EPDHaCBgyBUV9NDyCkq/lwQhVZqdr1X25iopEI7V52hh61buNjpp
 p7IQ==
X-Gm-Message-State: APjAAAU/o7LeiWRvvvDwkdDVskFiAEJb05RzUSXRfuTTlPlIihvJijPw
 RghZM6WBArh3MM8M1qDzBGas8Q==
X-Google-Smtp-Source: APXvYqwjlT2fObW89eSEj/9Rqi4lP6b9Xwub7KTaPTtCrYXtLZl5qAA61xrBg3XaNc1JyjC9Se/4cA==
X-Received: by 2002:adf:ecc3:: with SMTP id s3mr11573963wro.302.1565964394407; 
 Fri, 16 Aug 2019 07:06:34 -0700 (PDT)
Received: from localhost.localdomain ([2a02:587:a407:da00:f1b5:e68c:5f7f:79e7])
 by smtp.gmail.com with ESMTPSA id i5sm5465389wrn.48.2019.08.16.07.06.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 16 Aug 2019 07:06:33 -0700 (PDT)
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
To: linux-crypto@vger.kernel.org
Subject: [PATCH] crypto: vmx/xts - use fallback for ciphertext stealing
Date: Fri, 16 Aug 2019 17:06:24 +0300
Message-Id: <20190816140625.27053-1-ard.biesheuvel@linaro.org>
X-Mailer: git-send-email 2.17.1
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
Cc: herbert@gondor.apana.org.au, Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 nayna@linux.ibm.com, ebiggers@kernel.org, pfsmorigo@gmail.com,
 leitao@debian.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

For correctness and compliance with the XTS-AES specification, we are
adding support for ciphertext stealing to XTS implementations, even
though no use cases are known that will be enabled by this.

Since the Power8 implementation already has a fallback skcipher standby
for other purposes, let's use it for this purpose as well. If ciphertext
stealing use cases ever become a bottleneck, we can always revisit this.

Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
---
 drivers/crypto/vmx/aes_xts.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/vmx/aes_xts.c b/drivers/crypto/vmx/aes_xts.c
index 49f7258045fa..d59e736882f6 100644
--- a/drivers/crypto/vmx/aes_xts.c
+++ b/drivers/crypto/vmx/aes_xts.c
@@ -84,7 +84,7 @@ static int p8_aes_xts_crypt(struct skcipher_request *req, int enc)
 	u8 tweak[AES_BLOCK_SIZE];
 	int ret;
 
-	if (!crypto_simd_usable()) {
+	if (!crypto_simd_usable() || (req->cryptlen % XTS_BLOCK_SIZE) != 0) {
 		struct skcipher_request *subreq = skcipher_request_ctx(req);
 
 		*subreq = *req;
-- 
2.17.1

