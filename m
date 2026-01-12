Return-Path: <linuxppc-dev+bounces-15555-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C348D14E83
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jan 2026 20:23:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqj2z0p3hz2xWP;
	Tue, 13 Jan 2026 06:23:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768245802;
	cv=none; b=WhkYyUyaEAhu6SthlcZz1lbWAmzBqDi6T5qZpHUBC8EgpCNcY5iDXokT7MrpjzsDQA1v0r4H7Kum2z1zi07EjyyaeW186vAndPFuYpmC3Lz45NamEb1ioPiV5g76jOVDiQTlEgCvYRUURIrvJ3sbqtGcvSBScH6voMsVJhQhjRsqtVENDvu4SXyqsAApqys/mIhlT+Go1fb9TjYDWroxRCjz0/tyKg+yPZyDmqeHWO5BkWhkUTbr/DcFT7jUyVkKLZanfi0a53X08JaRV1DSQLmtrQCtg/1clNjrJXWr6PDxC5MAaW/noJHmMn1GmdllZYjm6mqIgdJBr4ViHMn/1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768245802; c=relaxed/relaxed;
	bh=aOaIvwEEE7f3AWQnFux17j5zsXrhONpvnE/DHeNKWIY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X6C3Xb0bG6AdDcpIPSY8pU9+mpGt27BAIPZKRHmMPjgYOxUPAvPIADh13dDT8BwHcpBkcbbrfj+ZnkfusclLHp15ZhKqyF5oGbKTSNdJ1qtmYXg9OigkGhzU3zCyt3bqckI06Embn/mKwVzcVTRy9OlFzMW7UkE4prpL7GBahhpLdpk9a3HFW+zZKt6OCZY+gFWJAFti5blhN/U20LVcL3hUjcSd1yqc2Aok+dgKjEMJ83eAUad7gtMk9t8ko83FI3/TLLPZTilXYXrcfBOG4nRtiFHxkRj+L9+9BNNSZ9gdcDcp0Fmozu28eFF0CEUjgUUvyjhVNNmRVnKTw9bCXg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GNPns4AU; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GNPns4AU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqj2y1Y8lz2xKh
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 06:23:22 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9E66E443AD;
	Mon, 12 Jan 2026 19:23:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E026C16AAE;
	Mon, 12 Jan 2026 19:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768245800;
	bh=gKPegVOdOTFBLkcvg5JmDNGwdQNryqhr4ZKUObZBWW0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GNPns4AUB6IFYkxnPq0QTR0KPVOq3rh9saC/xeXyfAgv9l7GY6JKe+/ai5CwNlIPR
	 iGV6sf7GOMCBBOYUb6H3OemOH4f0g6N9AG2nXiw8MnO+tA3tugcAtvxQqKnV3wluci
	 CNlzp0Ma1shaRGZYoPxW2/PCGl2HlkvDHX5GMsHR2vVw459z2L4rOsXmc2FKKbdEhI
	 +ewZn43Ewtf0TB04PGOvVXvALgW7sfw7QjVuX3tpNLWP5O3XRs1n6498AkFf8vKHKm
	 UGJ/3SARiNeXl8ArBO42WR5Nd43Lsq6qn6Kov12nIGPBMpG3+ccumgdWyzNVCVnU7I
	 PAhpO3zmzFy3w==
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
Subject: [PATCH v2 05/35] crypto: arm64/aes - Switch to aes_enc_tab[] and aes_dec_tab[]
Date: Mon, 12 Jan 2026 11:20:03 -0800
Message-ID: <20260112192035.10427-6-ebiggers@kernel.org>
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
 arch/arm64/crypto/aes-cipher-core.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/crypto/aes-cipher-core.S b/arch/arm64/crypto/aes-cipher-core.S
index c9d6955f8404..651f701c56a8 100644
--- a/arch/arm64/crypto/aes-cipher-core.S
+++ b/arch/arm64/crypto/aes-cipher-core.S
@@ -121,12 +121,12 @@ CPU_BE(	rev		w7, w7		)
 	stp		w6, w7, [out, #8]
 	ret
 	.endm
 
 SYM_FUNC_START(__aes_arm64_encrypt)
-	do_crypt	fround, crypto_ft_tab, crypto_ft_tab + 1, 2
+	do_crypt	fround, aes_enc_tab, aes_enc_tab + 1, 2
 SYM_FUNC_END(__aes_arm64_encrypt)
 
 	.align		5
 SYM_FUNC_START(__aes_arm64_decrypt)
-	do_crypt	iround, crypto_it_tab, crypto_aes_inv_sbox, 0
+	do_crypt	iround, aes_dec_tab, crypto_aes_inv_sbox, 0
 SYM_FUNC_END(__aes_arm64_decrypt)
-- 
2.52.0


