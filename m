Return-Path: <linuxppc-dev+bounces-15232-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6B1CF1E9D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 05 Jan 2026 06:18:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dl2Yp1jpvz3c1C;
	Mon, 05 Jan 2026 16:15:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767590126;
	cv=none; b=gFNzkSi9zcV+bK95/SVVIyr7m8CJhRlm/5Hnml9bg9YZWtg9Z06+o/bO+Qe3n8O1MV5iZlSYpcOZJmKCqLyp7uf6W1ddL26RiH4PDFg5nL7QXa88zWIj6PhN1m6qq23Z2XmedTvCq9yllzwFQ7ldsKv2IUlu+mA/Y+FIFuUs8WoH6fd7jXVpBzJ/ZFdYVWdjBe4blzK8pEe7477ZsKhHqXScY9v9pkfxVs7nLULgrlYgL2o2nepuvlSZnWCJjbEXmANnUyXwdz3u5AAlU/jvupsINQXrTwQ0QXOSjLDOfOcyFY8hK5d5vTjR9ITCsz3v5jhoQ6o0g9EppgEWNg+uQg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767590126; c=relaxed/relaxed;
	bh=9cDhHRjKqVrxZoCLD2fsmkzUuSDzhUz6dl353L9y5/0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c8164y+csmM/FiCPT8q6vvFl1gZ3PRIQBaykN3yTqayGKCGWmtAggcfu8yadnXbRH1wK/BtoUn02lr9VYR9CD2lkMkzdkqRvnmLIqbJ6lTn2ZWzwRYqD6NgVxe7jDsRyBZFny5YDBpu3XuMgtyDfXK9eJnQ5xvd8Dx81TJoBPB4Wdwy/776EaSnjwxngwJwPCql/Ff4qFGSOVDQYTQYuuxKPKjRVLKtC+tA4nZ/2Nrr2osWwaNo2KGKV3rURLQykkpj3usRF13FF/2PI334n6bVQb8a7Qaj21zyaSEUF4JI29QK9fZ9n2uIy9qUXN64d+LEjPVAnq9RXEuQR1nHsNQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mcaDwAKv; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mcaDwAKv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dl2Yn4GP1z3bxM
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jan 2026 16:15:25 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B90B160141;
	Mon,  5 Jan 2026 05:14:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0776FC16AAE;
	Mon,  5 Jan 2026 05:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767590093;
	bh=GVpfgLYStBAX0V1nv+zpcwWE8NNlDpzM24qOLk0l6H0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mcaDwAKvV9yG8G8Pz4lAe99jwm46Fe9LLX8+KbH5dMJSycqIAUz83Pyr5V6Cd1b04
	 YoMgKpCPcIYuZMn4nHnOWiMAoLtfwubSrFn7sUIu8xppL3qu0xo6ojvfww4gONJB8V
	 rq7To3cHCghDjntKqSetWW5zMDKnbMruaVIHEDQ7PPwotlLt//+yJcjrzB/XygRUXR
	 IgzDKNgYpYIrxCD+tJf/ynFCWwPV4C88wsk+otewUC3xwsxr4ezuJsjKuRaoi2otT4
	 5L4MHdL6JsCiBx8xOZs9AaNExwgKNNXW1ADOHPLOADwT+cGkHm5IJyFSx+sEZiR77g
	 QVn77rj2ogf/g==
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
Subject: [PATCH 05/36] crypto: arm64/aes - Switch to aes_enc_tab[] and aes_dec_tab[]
Date: Sun,  4 Jan 2026 21:12:38 -0800
Message-ID: <20260105051311.1607207-6-ebiggers@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105051311.1607207-1-ebiggers@kernel.org>
References: <20260105051311.1607207-1-ebiggers@kernel.org>
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


