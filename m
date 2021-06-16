Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 382293AA563
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 22:35:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G4xlT6MqVz3c0t
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 06:35:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Og0gg2OC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::102e;
 helo=mail-pj1-x102e.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=Og0gg2OC; dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G4xl13szcz308S
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 06:35:07 +1000 (AEST)
Received: by mail-pj1-x102e.google.com with SMTP id h16so2454742pjv.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Jun 2021 13:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Rp5uDSNPLfj1QcmZiBYhLMtmYzv+FVQAAZdEK27uKbc=;
 b=Og0gg2OCChBPre19U3sdh41BCFNJgrrWEPuD6aCglX/o9TttYW/cqzDdcfcR4hBPVV
 h3WI9fIZbjJO8ZQa0J2SsmHqMOwtZr2g5ChZODwbfC7XMs7iH73cKLI70SeyZy++OKe7
 rNad6QGzUKyuSdhlvmjIrk9rX1E+f2AoO2kys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Rp5uDSNPLfj1QcmZiBYhLMtmYzv+FVQAAZdEK27uKbc=;
 b=unIjSAlmS+Szy48uvjgQPtEmEYnVtZhOqrhjZyTFgsc0xgo8qAkYatIxpfCnD2+vkb
 ki1byH6WqdCOmcgvj+NlZfVNykUgjGaQbwPGhpfk9MW0wHZqSc1UZNXsN8j4LBR+pep7
 UvPlkBgHZ3shaj6v8M5XM8yGTBzOA47PfmNEXGfR3J5ZdRW9ijwvDDwsB/4zgU9hGKmh
 iMVXgi5yLXHbNIUJcxF9QvdgBizXMb8hoLD/GIUge5DzgRtC/wXjlPZBdwkTwD3hE1r7
 8VYKIEBvSrMc7VzRkD8d9eLzeJHdcSHsfOja+Wt06TQ9gUyC4lPdfgppGu+k9zq1WrrK
 Ge4A==
X-Gm-Message-State: AOAM531bximSy5H3CqC8JpkJUFjXX93k3hdpBLmFQmPR4v/+6eKYKcwo
 DquRJUpFPbvgdFPFVk0fVYgKOQ==
X-Google-Smtp-Source: ABdhPJyzc5ao3WqKlsjBFdlm4dtPe8Cw6Kdi48ERNoYRKIjp25bnW25Xlcm9KG2ELq0JbhEhv6iZwA==
X-Received: by 2002:a17:902:b717:b029:11a:fae3:ba7c with SMTP id
 d23-20020a170902b717b029011afae3ba7cmr1254557pls.28.1623875703099; 
 Wed, 16 Jun 2021 13:35:03 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id 11sm3331759pge.57.2021.06.16.13.35.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 13:35:02 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Subject: [PATCH] crypto: nx: Fix memcpy() over-reading in nonce
Date: Wed, 16 Jun 2021 13:34:59 -0700
Message-Id: <20210616203459.1248036-1-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Patch-Hashes: v=1; h=sha256; g=06534d0443fa9fcfa969f0fcd687992b383a757d;
 i=jYfiGi2izQUFzVtPzV/fVSVDahy6PowWZI9Gw067JJs=;
 m=QnHbJKc/xtXaH5oFuCZHDTYyfjS26Q6kX/nkbJWmqYE=;
 p=Rww15zRs5GKN3uLwSu/+HXsr7GkdI7iuJ1PvQJoYJJY=
X-Patch-Sig: m=pgp; i=keescook@chromium.org; s=0x0x8972F4DFDC6DC026;
 b=iQIzBAABCgAdFiEEpcP2jyKd1g9yPm4TiXL039xtwCYFAmDKYHIACgkQiXL039xtwCbRdBAAqyA
 FpIIWg3FtYwVUl5xnDktz6gtkdYaXMLl49uYOnAvXQSiVLggX9nLThuEqgupG8pm3Hj8fSC2uW4d8
 bUJ3cOiEUoCt8a4Izu4aw2a1ii0axXKma3IaCJWImuScMgsb8Y63HZ9n+5FZ1yrBpv7QBigem7vJd
 mdcVGiwu7luChzOl6B7WcdrQmKPvJTN7h5/JZ5oVK7Cp1qjSU2v0KiwIsk4zK65PS56Q7dfohFMVP
 uStgrGTsZYviJvfl5E4LWHWtc77wJqkKRiCtrOE8tst4eIsOt9a+zcP9bB7Iz4VRSlL68AW8qmZ5a
 mSYqNGraivkXELX3QFey28oZdHc5IYciYgmehULbBbSdD0Z6mwZ7v7hqRDM95Qgm2ZU54LeucplXc
 fKeeL93dbElzv42ondvChnwZro3o0accfT6/GlTFRuZ7WU2GoCDUdTXv1I4A35sARsrfzigjesQ9m
 FqLygW2kqJXKo39M2PjDBUy38PctTb+qGvKT6VYqZzxe2ITVIjHzFzijJa/RHbAIqkFbzymz5Rqm/
 ux6W8AvzR5v4hoLHqcd5n1T3BGKH9dN92K/Md7UnEthYUM/Scblddr2RCvEKS8HJRKhRnrm8NdWv5
 X9nkoLmL61qCjwmL6TFPqlbmCgbv/+50URmm1BT/Hdocymk7dNbQE0xDi8jmZGQM=
Content-Transfer-Encoding: 8bit
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
Cc: Kees Cook <keescook@chromium.org>, Nayna Jain <nayna@linux.ibm.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Paulo Flabiano Smorigo <pfsmorigo@gmail.com>, linux-crypto@vger.kernel.org,
 =?UTF-8?q?Breno=20Leit=C3=A3o?= <leitao@debian.org>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, linux-hardening@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fix typo in memcpy() where size should be CTR_RFC3686_NONCE_SIZE.

Fixes: 030f4e968741 ("crypto: nx - Fix reentrancy bugs")
Cc: stable@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/crypto/nx/nx-aes-ctr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/nx/nx-aes-ctr.c b/drivers/crypto/nx/nx-aes-ctr.c
index 13f518802343..6120e350ff71 100644
--- a/drivers/crypto/nx/nx-aes-ctr.c
+++ b/drivers/crypto/nx/nx-aes-ctr.c
@@ -118,7 +118,7 @@ static int ctr3686_aes_nx_crypt(struct skcipher_request *req)
 	struct nx_crypto_ctx *nx_ctx = crypto_skcipher_ctx(tfm);
 	u8 iv[16];
 
-	memcpy(iv, nx_ctx->priv.ctr.nonce, CTR_RFC3686_IV_SIZE);
+	memcpy(iv, nx_ctx->priv.ctr.nonce, CTR_RFC3686_NONCE_SIZE);
 	memcpy(iv + CTR_RFC3686_NONCE_SIZE, req->iv, CTR_RFC3686_IV_SIZE);
 	iv[12] = iv[13] = iv[14] = 0;
 	iv[15] = 1;
-- 
2.25.1

