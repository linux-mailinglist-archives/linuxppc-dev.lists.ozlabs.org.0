Return-Path: <linuxppc-dev+bounces-8304-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57994AA9B5E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 May 2025 20:19:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZrqYX20m6z2yrN;
	Tue,  6 May 2025 04:19:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746469168;
	cv=none; b=C9xoBHs/wTQtjPJENzWKrpS1zjPaFXWW9TL+jpRYJ98rrY9ERlPfiSkE3jXVgdhyTLl7lAlHOGrROmK+T9T5n/j5pdv80hnpMzsQ3+gMgAs0nStl0AWqNm50hDZE4Yvcb8TByjm9VQ6T/8LboyWHuu0FsJN0IcXpkvvZkN5MdWNjt0CLHATzSKKqlyFcUreT85F/l9dCaL2KK6a7ewe73I+W1K4nrg2NvKY1b9y78vsuiZEy0k485zWzN/glxP6PQ2fidrs/sgwiyfTdagS7wQkwG3gJVKRDEE7pHAvBq3ythcoLcHeK3T2Yyo6zce/tepbgb4qqe6hoxmaxmb0FyA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746469168; c=relaxed/relaxed;
	bh=sTAkkOXoUZtDmdZllwQgnidVESbbjyPtWfKwf5z0Fy4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LuSbfPMocUxmULmaHWzRKkYlpMIH2TMRHptur1aqnnNIK79O7n9Foal9w9l5wWhM0CEyS1XUcEWJYXj3EQ02xWFrVV3G7HYSU6eIyF+mYDBLHdX+ylhdWTsgaWiKsrsxUAqTAKtWRDl1XqdWDgxh0OUwpcNnlC2s6wdjSX2H6R7JQAn3qQR7OYi8tPZiMiEufgSmEhPWSxbcrrlhPNE9VcF+1NgWeEhrdoP306RQhP6cACL06KSmIN0bgQg+8aI4+iw6qv4ppbjhHOTVUQOFn+3h6CkM1KQHD3Px37X33KZAckks0Mxq/2rSqD8DEoRT2Jk3EXIiKvUl00QzcK0eXg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mzytHTPC; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mzytHTPC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZrqYV23xJz2yqq
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 May 2025 04:19:26 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8BE8BA4C65C;
	Mon,  5 May 2025 18:13:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9282EC4CEE4;
	Mon,  5 May 2025 18:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746469162;
	bh=pbhM6rLT2xsCdlCwZPtBBqUWZLiG5jVy62L9rIqPZ4I=;
	h=From:To:Cc:Subject:Date:From;
	b=mzytHTPCELw1tkhhvQDNh8uKIRJjgJDj3AlNf+4JofNJtTifEWR30wCTuxKIyu0me
	 QN+7I66DbuHlus5hisqRBjCEh2nK1WKef2WDYjS12LNJWbiAHOoXEY/+frhhJOs497
	 DCqrG5f1RXOBfUBx8+nMklnWQucJNibqQ22tBCji4XqbKfMSc39BF+4s67mQ7nL4kI
	 ES2QJJScttT2ogYASeUY34JaWu7woaOruNgPT2l94Bb2iZ748DXJiKnUnv4ffYgrr7
	 fKbP2C5npdC7BsQnHGZcHBIpVQfg6boJRuZvJnlqJ5+xRXN2IfkemruT37Sw+qDPKy
	 x14IyErqCxSbg==
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
Subject: [PATCH 0/4] crypto: lib/chacha - improve type safety
Date: Mon,  5 May 2025 11:18:20 -0700
Message-ID: <20250505181824.647138-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
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
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,SUSPICIOUS_RECIPS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This series can also be retrieved from:

    git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git chacha-prototypes-v1

This series improves type safety and clarity in the ChaCha functions by
strongly typing the state array and adding explicit array bounds for
other fixed-length arrays.  No functional changes.

Eric Biggers (4):
  crypto: lib/chacha - strongly type the ChaCha state
  crypto: lib/chacha - use struct assignment to copy state
  crypto: lib/chacha - add strongly-typed state zeroization
  crypto: lib/chacha - add array bounds to function prototypes

 arch/arm/lib/crypto/chacha-glue.c             | 34 ++++----
 arch/arm/lib/crypto/chacha-scalar-core.S      |  5 +-
 arch/arm64/lib/crypto/chacha-neon-glue.c      | 27 ++++---
 arch/mips/lib/crypto/chacha-glue.c            |  6 +-
 arch/powerpc/lib/crypto/chacha-p10-glue.c     | 17 ++--
 arch/powerpc/lib/crypto/chacha-p10le-8x.S     |  6 +-
 arch/riscv/lib/crypto/chacha-riscv64-glue.c   |  9 ++-
 arch/riscv/lib/crypto/chacha-riscv64-zvkb.S   | 10 +--
 arch/s390/lib/crypto/chacha-glue.c            | 13 +--
 arch/x86/lib/crypto/chacha_glue.c             | 62 ++++++++------
 crypto/chacha.c                               | 20 ++---
 drivers/char/random.c                         | 41 +++++-----
 fs/bcachefs/checksum.c                        | 18 ++---
 include/crypto/chacha.h                       | 80 ++++++++++++-------
 lib/crypto/chacha.c                           | 40 +++++-----
 lib/crypto/chacha20poly1305-selftest.c        |  8 +-
 lib/crypto/chacha20poly1305.c                 | 53 ++++++------
 lib/crypto/libchacha.c                        |  2 +-
 .../crypto/chacha20-s390/test-cipher.c        | 10 +--
 19 files changed, 253 insertions(+), 208 deletions(-)


base-commit: 64745a9ca890ed60d78162ec511e1983e1946d73
-- 
2.49.0


