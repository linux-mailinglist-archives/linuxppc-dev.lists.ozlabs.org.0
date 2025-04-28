Return-Path: <linuxppc-dev+bounces-8119-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AB352A9F67E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Apr 2025 19:02:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZmV9V0tWrz30V7;
	Tue, 29 Apr 2025 03:02:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745859725;
	cv=none; b=hF8kBya9lIbia/aC1aNFK80f6ic4YW0BSCA57DNwojG/hYHkTiwiI8hvgCG598bOny8HPV1VCLSUz9Q9M5X2Ji3sFPnmkutG6+VSCRLSF2hX8qnL5ixI5ZkYE1St1dt3YNXaFPzBXyeffo8pr7w7TL2v+paLWP7LCmEvA0/Br201L1da8kFmAiCM8RtKUGFyLilQKmO1SCHEWCBpg2qq0h69ZiD4aNgcjVv+d7HZAU4p5WiesrfIwOnIBqRYCPe68ddIYG4k9Fg/GnBnlGDbSD/JF8/FsVTuSpmxIt/UzECFOFEOL0cQB5qLNx+MU4SEAWzNTipG9R4pW4Wk7kcF2A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745859725; c=relaxed/relaxed;
	bh=gKzrU6gdVJiJLYXn68VZtIh2xNVLST+lv2iClQsbPYk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DVMKLGlhOow4hZUXuZa39hiuLTbsz45XFIE4OOSfq4C5wz0ecohHI2dhWhkBbYBynJpSxYVKuXaMgK9cTKcwWrtLM11K4JT8FF0uigAixlLVsFxGhjV8kPAzwBcxxjw8CQWoElkARDPSw56dc9SbqCy+Ji/Z7emMev7pYxz4FJGNwtlEwBk9RgWojnQK451vBl6vGt1mqsCu9+6ld2tiTAifzg75z5SsiVqZwKfGMo6d5j4movXPz7wTKEQPwk4Hvl5CdarqH+7xrWth9rxMPMiD22Q6rlCrTfQyn6iZNqQYrQDeTL3EyraFowiNAZJC/9+bb5ZX5x9ma8be/BqJMA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=R4lo9OBt; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=R4lo9OBt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZmV9R05N1z30P3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Apr 2025 03:02:02 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D7D7A4AAB3;
	Mon, 28 Apr 2025 17:01:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 737D5C4CEF2;
	Mon, 28 Apr 2025 17:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745859720;
	bh=WGUG3mTzhoDhli2YpBvT7Wh87yi92KthyKex4Ih+eYs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R4lo9OBtV1cajdxreoVKsMWdUvS6ZbyO08N/F8VPM7gCjd4vR29sCJ6hr+gsAz5sV
	 /PsXwkP+M3rZJ1TDwQNaE0aEMelACb4s9S+KbbNmpiYX8UiyOjoozEWfhD09JDOZu+
	 x/SJkloWktFlYpZjkRJX9AIJbC1zJzJj+z2oCK+M9nZLvkVSf48G9lnXlrGrV0uQug
	 1k03Xh4jH0fkYF41PZm+nkzeR8JhPi/OIZVa5O0ePLaxiWaCo8FJrhxJm5FvTZ2LBl
	 rhTM8PIU0kCLWQEmTvEPDD6lPp5XrwrJn6ldRIfBEJVhhwso8J2oM3uHywynAvoKeb
	 QkQs8cjXuMjsw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	sparclinux@vger.kernel.org,
	linux-s390@vger.kernel.org,
	x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH v4 03/13] crypto: arm64/sha256 - remove obsolete chunking logic
Date: Mon, 28 Apr 2025 10:00:28 -0700
Message-ID: <20250428170040.423825-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250428170040.423825-1-ebiggers@kernel.org>
References: <20250428170040.423825-1-ebiggers@kernel.org>
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
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Eric Biggers <ebiggers@google.com>

Since kernel-mode NEON sections are now preemptible on arm64, there is
no longer any need to limit the length of them.

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/arm64/crypto/sha256-glue.c | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/crypto/sha256-glue.c b/arch/arm64/crypto/sha256-glue.c
index 26f9fdfae87bf..d63ea82e1374e 100644
--- a/arch/arm64/crypto/sha256-glue.c
+++ b/arch/arm64/crypto/sha256-glue.c
@@ -84,27 +84,12 @@ static struct shash_alg algs[] = { {
 } };
 
 static int sha256_update_neon(struct shash_desc *desc, const u8 *data,
 			      unsigned int len)
 {
-	do {
-		unsigned int chunk = len;
-
-		/*
-		 * Don't hog the CPU for the entire time it takes to process all
-		 * input when running on a preemptible kernel, but process the
-		 * data block by block instead.
-		 */
-		if (IS_ENABLED(CONFIG_PREEMPTION))
-			chunk = SHA256_BLOCK_SIZE;
-
-		chunk -= sha256_base_do_update_blocks(desc, data, chunk,
-						      sha256_neon_transform);
-		data += chunk;
-		len -= chunk;
-	} while (len >= SHA256_BLOCK_SIZE);
-	return len;
+	return sha256_base_do_update_blocks(desc, data, len,
+					    sha256_neon_transform);
 }
 
 static int sha256_finup_neon(struct shash_desc *desc, const u8 *data,
 			     unsigned int len, u8 *out)
 {
-- 
2.49.0


