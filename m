Return-Path: <linuxppc-dev+bounces-8303-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E93AA9B5A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 May 2025 20:19:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZrqYX171jz2yrL;
	Tue,  6 May 2025 04:19:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746469168;
	cv=none; b=JKROx43pJ5F7OTHAsv3jrtLJ/TzUZ8lUjq4Q+UEIKg27s5HhDe0sjUOcoVsli3DCgy+8//LdumfIRgzh061+KKD7npifmK1lUtpOr0COxZ2G/xgnVzlxSyd3PEUIhxuzYxxk1vKlg7/eFL5tgyJvb85TArTmqK/waPO1t/s3eu16FMicJN856YYc4nuL1syvXeiEAVNapevTQUDtyf2gyUEE4kvbwQ4T9SwwcLWHyh3qhjt/pK7+CIFDlmFV64faVoMA6uAM+be4ilyVMISLdPR8ZuC+6011PIOOYnZGnHxMS5HDYPMTiey2j4JuiPUct3A2eqE3YPMhxhEWhULLdw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746469168; c=relaxed/relaxed;
	bh=bLWzYHJAk50wdK7QsuKNf/p9q8iQZIAmv2QoqW7u/BM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eQAYPGP1qUMYi/xWvEOO26HhzMon/BuBj8lL1zDdlQIkJvrfTssdta8uoQZ3M6BOkpPNBuoLGFe2fk+bYSsT+eLQavUdO7PoKRYKGW6jUC6VUBP/86GJTdychtuOyrFMcEDxh52fYXI1lGl3LzVFCM3wER9U5aLW6CCZ0h/f8RjWImRrZYNC0hg8vCKf7v0A88i9EUfsy10GNmcMSRrBjGMl2gTs86fZptxyRkhcbLN3Ny5sbBZVrNUwDeipLB6PhXDH74JJLUfD/HnDzoavq78b7fN53VUNDsaCl8cyUuxE2ej9wnEKt/cYSFo+2EEdE7oxvF+QQqXaZLtRW3Hr1w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pDa53t6D; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pDa53t6D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZrqYV54G5z2yr3
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 May 2025 04:19:26 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6D93261F1D;
	Mon,  5 May 2025 18:18:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E8EEC4CEEE;
	Mon,  5 May 2025 18:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746469163;
	bh=b/9JYhuN7J7zBR7ary1s1WvggcmHZ7V9W2w6tJgLRtw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pDa53t6DCjWYM/LmZqGF9bnJJ573ftIBSUQsp8IeHuT5N7tEcbBprRacM6EAolgWa
	 KnM4f1Ecr4wsjUKSjvQrsrEOI61Z1Nenrn/tYHyD0VxpliwIloUv60+380sygQKeFn
	 FxwIMuAGqXJ/SCu+mhdkAvNtZ/VV+Hpcs9PRhT0j3hKSDgORzS83PV0rP1IGISbSpL
	 aTZfyBqlR/WkgLr3KGW3DlBmln+QJkH1npbWh+vtLcej0hH78R6O4qdEbRHUlUrbSw
	 ke0NPkusn8yL0Rp2/trfxhRJ3n8yZzmTAV2C0r7cHVP5MRtIDrFszeZGaEVvf/LP32
	 dPGvxobHLcyGg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-bcachefs@vger.kernel.org,
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	Theodore Ts'o <tytso@mit.edu>
Subject: [PATCH 2/4] crypto: lib/chacha - use struct assignment to copy state
Date: Mon,  5 May 2025 11:18:22 -0700
Message-ID: <20250505181824.647138-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250505181824.647138-1-ebiggers@kernel.org>
References: <20250505181824.647138-1-ebiggers@kernel.org>
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
X-Spam-Status: No, score=1.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	SUSPICIOUS_RECIPS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Eric Biggers <ebiggers@google.com>

Use struct assignment instead of memcpy() in lib/crypto/chacha.c where
appropriate.  No functional change.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 lib/crypto/chacha.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/lib/crypto/chacha.c b/lib/crypto/chacha.c
index a7f5eb091839..ae50e441f9fb 100644
--- a/lib/crypto/chacha.c
+++ b/lib/crypto/chacha.c
@@ -74,15 +74,13 @@ static void chacha_permute(struct chacha_state *state, int nrounds)
  * The caller has already converted the endianness of the input.  This function
  * also handles incrementing the block counter in the input matrix.
  */
 void chacha_block_generic(struct chacha_state *state, u8 *stream, int nrounds)
 {
-	struct chacha_state permuted_state;
+	struct chacha_state permuted_state = *state;
 	int i;
 
-	memcpy(permuted_state.x, state->x, 64);
-
 	chacha_permute(&permuted_state, nrounds);
 
 	for (i = 0; i < ARRAY_SIZE(state->x); i++)
 		put_unaligned_le32(permuted_state.x[i] + state->x[i],
 				   &stream[i * sizeof(u32)]);
@@ -103,13 +101,11 @@ EXPORT_SYMBOL(chacha_block_generic);
  * of the state.  It should not be used for streaming directly.
  */
 void hchacha_block_generic(const struct chacha_state *state,
 			   u32 *stream, int nrounds)
 {
-	struct chacha_state permuted_state;
-
-	memcpy(permuted_state.x, state->x, 64);
+	struct chacha_state permuted_state = *state;
 
 	chacha_permute(&permuted_state, nrounds);
 
 	memcpy(&stream[0], &permuted_state.x[0], 16);
 	memcpy(&stream[4], &permuted_state.x[12], 16);
-- 
2.49.0


