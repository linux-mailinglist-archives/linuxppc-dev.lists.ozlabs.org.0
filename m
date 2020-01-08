Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 17259133AB1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2020 06:08:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47sy2K2z2VzDqRC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2020 16:08:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="EMyNfvbX"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47sy0H042HzDqQQ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2020 16:06:54 +1100 (AEDT)
Received: by mail-pl1-x644.google.com with SMTP id p9so610748plk.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Jan 2020 21:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Mu0dUFTj4thZCkpGdg4/BDePJJdw2Ae9SQvJCvq1Dek=;
 b=EMyNfvbXJbFlHI38AQ1taZDy/DaQ57KejCvjq4TBFAd7EBiPVOG8Lq0NcHQXeDlloS
 v+L5zMYqDh0BXIap6exnZaxeabYAOxtmUbbBQzzfc4wWzrZwXrFjFy2ZSFV0vHSXImnK
 0xmSpCeYG4072Ej1iqRakVPX7cDHm0V5PP8OI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Mu0dUFTj4thZCkpGdg4/BDePJJdw2Ae9SQvJCvq1Dek=;
 b=tzPhXTc6JAdagE/dUpFYsh//uqYz6QRdh9KqUo/YgNAMSY7TKWCsp0TK8LcGdq4Di0
 HAaMMpI7LBn6ZpyvIyFdjxNwUJKmFB6oP4hAE/LQ+G901heGkL7wBEBaxMgjnSNHx8K0
 CPAphpawZels0BRsib65CfhPVtVgAYCUnwzqslzziaXAZ9GGRtrSFSohbytbqGWqRsHS
 Z+lfRxtKtQbyqJKvTzsgYBVqacaOw5LxMIUKLi0qE7dTBhgmX36U9Smz6qJQIQ+pOb73
 YfQuk4uetxXXWyGvtXhs+5I2wxLps2TMw8kUzd5iTedok+L3hH7l++kYMGMHmtikztHQ
 TR4Q==
X-Gm-Message-State: APjAAAWXHEXmfwgoJ7L60y6p67Pw3SLZzjGX9ILqKPnj0HbRwHLUDnH8
 nj14dEFFY9NsLQOmVXVT+r0D+Xhr+QU=
X-Google-Smtp-Source: APXvYqwkBYEyK68S9SHLHKUyyaqhbzeVR7yGXcITJnMiFqE2QG5yDtDU3anHiNjE+Vb5uW4lHNlSGQ==
X-Received: by 2002:a17:902:8343:: with SMTP id
 z3mr3438342pln.178.1578460011371; 
 Tue, 07 Jan 2020 21:06:51 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-0092-67e7-3c5d-2c97.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:92:67e7:3c5d:2c97])
 by smtp.gmail.com with ESMTPSA id x132sm1380691pfc.148.2020.01.07.21.06.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 21:06:50 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: linuxppc-dev@lists.ozlabs.org, herbert@gondor.apana.org.au,
 linux-crypto@vger.kernel.org
Subject: [PATCH] crypto: vmx/xts - reject inputs that are too short
Date: Wed,  8 Jan 2020 16:06:46 +1100
Message-Id: <20200108050646.29220-1-dja@axtens.net>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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
Cc: nayna@linux.ibm.com, pfsmorigo@gmail.com, ardb@kernel.org,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When the kernel XTS implementation was extended to deal with ciphertext
stealing in commit 8083b1bf8163 ("crypto: xts - add support for ciphertext
stealing"), a check was added to reject inputs that were too short.

However, in the vmx enablement - commit 239668419349 ("crypto: vmx/xts -
use fallback for ciphertext stealing"), that check wasn't added to the
vmx implementation. This disparity leads to errors like the following:

alg: skcipher: p8_aes_xts encryption unexpectedly succeeded on test vector "random: len=0 klen=64"; expected_error=-22, cfg="random: inplace may_sleep use_finup src_divs=[<flush>66.99%@+10, 33.1%@alignmask+1155]"

Return -EINVAL if asked to operate with a cryptlen smaller than the AES
block size. This brings vmx in line with the generic implementation.

Reported-by: Erhard Furtner <erhard_f@mailbox.org>
Link: https://bugzilla.kernel.org/show_bug.cgi?id=206049
Fixes: 239668419349 ("crypto: vmx/xts - use fallback for ciphertext stealing")
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: stable@vger.kernel.org # v5.4+
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
[dja: commit message]
Signed-off-by: Daniel Axtens <dja@axtens.net>
---
 drivers/crypto/vmx/aes_xts.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/crypto/vmx/aes_xts.c b/drivers/crypto/vmx/aes_xts.c
index d59e736882f6..9fee1b1532a4 100644
--- a/drivers/crypto/vmx/aes_xts.c
+++ b/drivers/crypto/vmx/aes_xts.c
@@ -84,6 +84,9 @@ static int p8_aes_xts_crypt(struct skcipher_request *req, int enc)
 	u8 tweak[AES_BLOCK_SIZE];
 	int ret;
 
+	if (req->cryptlen < AES_BLOCK_SIZE)
+		return -EINVAL;
+
 	if (!crypto_simd_usable() || (req->cryptlen % XTS_BLOCK_SIZE) != 0) {
 		struct skcipher_request *subreq = skcipher_request_ctx(req);
 
-- 
2.20.1

