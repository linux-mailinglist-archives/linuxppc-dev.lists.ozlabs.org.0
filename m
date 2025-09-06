Return-Path: <linuxppc-dev+bounces-11842-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F02AB47797
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Sep 2025 23:38:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cK64P3qgXz3d8M;
	Sun,  7 Sep 2025 07:37:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757194629;
	cv=none; b=UdKsjyrFEiOlQDcXGIx4NHFdl0VplCIYO9dD7YwOTVcanUiPf9lQcwHRzgrb5tQRKrfia4Xx33+kixU/Q79Fs0qKjTINUCcdedE4zWNqlmXGyciGKPKEIHaiVTE7vTZMib11bYwLgAJU74/0TXtTwtRFnCozicmh9jkNTtm1yjYXaXD0j24U0KWvpxNb0Fpmzg23K7bV5Ms0+3G88f4BfiWQcMUNVo8dmvKwf30g99Lb/wqChK5DjCHNPeJUD1lo5RdoIg3od8xe+CArFyeXNQSyOdpbUUknVHs3aJvyHSd0i/px6xN/84FCekWKeNbFYhqOG0pfHHM5zJlWwRKZmw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757194629; c=relaxed/relaxed;
	bh=F/TySS+sPDgfTLpKhbalwp0GPsQF0JNaQ9zH44WJfNM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jl0x+F4vi0IQNLEzBfIVAZFp771Yf7p58oAN7Rm6Fdsi/ScH8Cry6zvIaKKD4qX/Wkyzf7N7j0tJTWa9f9HvS5e5yKFPH4I8X8m5LjFb26GphrMIZIrYZR+x7DvWS3hOgNIp9Vi8fF0UtOcyAUyrM9YOK+8D37Wx8AKKawJ/feSyoIRfowSMG1l/orlR87wdM54Y0ZczCUc4jZ55VG/TuhAR97TfDj10bOnEwQe9WfRZglXPJYCB7MwpXVDdYvVnJ8YdFxlXmNq+Fit0cRy+Pc6w/v2YmoMcva7ZZce841jOKMfbs6tZsVr/+SKL/swVRcv8DojoJZBM14f5ZgDGUg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aN33jdNb; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aN33jdNb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cK64N6xd0z3d8J
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  7 Sep 2025 07:37:08 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6516C45251;
	Sat,  6 Sep 2025 21:37:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A72FC4CEF5;
	Sat,  6 Sep 2025 21:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757194627;
	bh=C5+a7mCYIvqBEAn5lQppE669dnFrkzWQF1zk0YiPpuo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aN33jdNbPPWCFS3rSncFy4YrpwJkk5GYVzpu/ZqZXYHs5pb7KD6mE/1nYTW0uwBnf
	 CuHEMW/f3i3Av7mUSLDXUucUvQbO0Ifxb4QQUa2m5NldzAh1levjiV/RC8l6NH/Vlj
	 jPrKaMMPtz6zW+NFbCYz2MszvmppHiQGp6fx348XONW90N+aL3rDFM335dTfmWjwGS
	 Fu4lcw9Zezc1Fp5TVuqYxucMlguTKBQYxNUCO5MU7XlJHWnsa2wyMf6IWdZHjDTmLn
	 cQmp7bIPWl4b3bZaLUlHs7wYTXFCZ35BiAjqlyqG072Tn5Xsc9TQ5/2TUvUsp2/LDX
	 siufRL71HJrLw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Zhiqi Song <songzhiqi1@huawei.com>,
	Longfang Liu <liulongfang@huawei.com>,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v2 11/12] lib/crypto: tests: Enable Curve25519 test when CRYPTO_SELFTESTS
Date: Sat,  6 Sep 2025 14:35:22 -0700
Message-ID: <20250906213523.84915-12-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250906213523.84915-1-ebiggers@kernel.org>
References: <20250906213523.84915-1-ebiggers@kernel.org>
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

Now that the Curve25519 library has been disentangled from CRYPTO,
adding CRYPTO_SELFTESTS as a default value of
CRYPTO_LIB_CURVE25519_KUNIT_TEST no longer causes a recursive kconfig
dependency.  Do this, which makes this option consistent with the other
crypto KUnit test options in the same file.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 lib/crypto/tests/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/crypto/tests/Kconfig b/lib/crypto/tests/Kconfig
index eaca60d3e0a36..578af717e13a7 100644
--- a/lib/crypto/tests/Kconfig
+++ b/lib/crypto/tests/Kconfig
@@ -11,11 +11,11 @@ config CRYPTO_LIB_BLAKE2S_KUNIT_TEST
 	  KUnit tests for the BLAKE2s cryptographic hash function.
 
 config CRYPTO_LIB_CURVE25519_KUNIT_TEST
 	tristate "KUnit tests for Curve25519" if !KUNIT_ALL_TESTS
 	depends on KUNIT
-	default KUNIT_ALL_TESTS
+	default KUNIT_ALL_TESTS || CRYPTO_SELFTESTS
 	select CRYPTO_LIB_BENCHMARK_VISIBLE
 	select CRYPTO_LIB_CURVE25519
 	help
 	  KUnit tests for the Curve25519 Diffie-Hellman function.
 
-- 
2.50.1


