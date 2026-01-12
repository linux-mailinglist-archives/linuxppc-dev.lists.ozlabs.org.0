Return-Path: <linuxppc-dev+bounces-15554-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 040F4D14E7D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jan 2026 20:23:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqj2y73NXz2xS2;
	Tue, 13 Jan 2026 06:23:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768245802;
	cv=none; b=EWEucxXE+7Yq+wJiQ6otC1HDLp5eZ+gdjXlmJR//AUb+cDphR1QOeGyMbcdjcE2OSQwpmIvEmDT8DoH2Ti9FoSQgb2s+YHl4nhOikzu/z56zzp9SxtpMWQ0F+A/HX5YZiMzCXx1acfFeQ4PWpWtCvL+0VD0qNJMpNQRmkPAr+axKiqgpXKi9U6hq7bJDArjr738gS7vBrb/arb9rRc8S02y5W7mTITn/xoZK7Hq3uhOgMXpXlJGrP5RaVWdF5aRFKeAeC+I9Cnn3+kj6IdU0IbYsk8eGHtcwl6sDVAX2MEJ31T9SZ2LMca32Oc1Yf7qLzB+wdnWQ7NeEmmOIOKo3bg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768245802; c=relaxed/relaxed;
	bh=rnNGHZoGVxmaaqAJ6yvawy5Hn/JrpHmuZhMeed1U7fY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IayKvE0dEXlA2ymmX2dk9jPg+plPcNsTHiU+bPgcCrbvpCgr4lf6iV2sSoMEe/CDOAaC8wWeZopGty9knbcif3Mx2RwGS9LYC4+OvrbENLSIFaj2OTzgv240bjKQjDFeMR//YJxJcsCjFmpkI+xkkvIvWINx9R8Bi4VBNWvenxlTiTrnEa8Vs3HpCP/6FvW7daAhhP7zwCP3sW5DBt3+7cSPKz3+9Gn8ZcruHy5QTz12EY2PRzg2SZNF7DMwP9VDrLIfDrvSYwHYmiNMYDhOEHeThQV5/ym89HIGZWLpvNma5uwp+HTDQTAawnzzGosajrJqyeMIbO+laZZFFm6HpA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PeWo/wwn; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PeWo/wwn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqj2y17z8z2xJF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 06:23:22 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1F58644317;
	Mon, 12 Jan 2026 19:23:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E1A5C19425;
	Mon, 12 Jan 2026 19:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768245800;
	bh=2M8Gb/YRtberadtTzhIXpTjnvGh0/0hqHwkqCXSjCBo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PeWo/wwnv7GJEhSx1Rr6KXtyzCKz82DrZzBSGOzoyh9p4L5PDGU+fcJJAszf9aOvC
	 3nQ1ZzuD+/BhBCf3I+xz0Ga4TD6uXEJPz4pgcGUfHRNMN773cTSbwpo42TUOQTgpLQ
	 p8/MShjCL6T2gM8EL3Q8azFme2TsUyDO4bZGXnEQgI3xm/Z69jIGxg4THjBVqgTQgn
	 nFFvA/3thNtyEHoSxe2YGfG024AqgG+7kvBldYZurP6i60JW4o+nM7NA9zh9EcitJW
	 eStkXyo61YXmHmBT7eoGdyDpRaxFgDXyv5lqvfT0EMmxoAqngYIrbCTHZOTCG9bumH
	 nX/6iHZThwKEw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Holger Dengler <dengler@linux.ibm.com>,
	Harald Freudenberger <freude@linux.ibm.com>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v2 04/35] crypto: arm/aes - Switch to aes_enc_tab[] and aes_dec_tab[]
Date: Mon, 12 Jan 2026 11:20:02 -0800
Message-ID: <20260112192035.10427-5-ebiggers@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112192035.10427-1-ebiggers@kernel.org>
References: <20260112192035.10427-1-ebiggers@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Instead of crypto_ft_tab and crypto_it_tab from aes_generic.c, use
aes_enc_tab and aes_dec_tab from lib/crypto/aes.c.  These contain the
same data in the first 1024 bytes (which is the part that this code
uses), so the result is the same.  This will allow aes_generic.c to
eventually be removed.

Acked-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/arm/crypto/aes-cipher-core.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/crypto/aes-cipher-core.S b/arch/arm/crypto/aes-cipher-core.S
index 1da3f41359aa..87567d6822ba 100644
--- a/arch/arm/crypto/aes-cipher-core.S
+++ b/arch/arm/crypto/aes-cipher-core.S
@@ -190,12 +190,12 @@
 	.align		3
 	.ltorg
 	.endm
 
 ENTRY(__aes_arm_encrypt)
-	do_crypt	fround, crypto_ft_tab,, 2
+	do_crypt	fround, aes_enc_tab,, 2
 ENDPROC(__aes_arm_encrypt)
 
 	.align		5
 ENTRY(__aes_arm_decrypt)
-	do_crypt	iround, crypto_it_tab, crypto_aes_inv_sbox, 0
+	do_crypt	iround, aes_dec_tab, crypto_aes_inv_sbox, 0
 ENDPROC(__aes_arm_decrypt)
-- 
2.52.0


