Return-Path: <linuxppc-dev+bounces-9704-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9B5AE77E5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jun 2025 09:11:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bRtJB3MW8z2xbX;
	Wed, 25 Jun 2025 17:10:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750835434;
	cv=none; b=Vut7R7tAMqcexA8OJWvm5DpGu8U79liTtVgZTT3PmeXNjtmWgiRnt3CwmnE97yuCXeV7/Iq3akoxASyEbOjGpj7S5WVb0dKQ0GDStmDIyELIHBxz12pn6x918TRcz7Iws8P4TkRrmB20Nysck4uovAfmQ//WkwPo3hHS3XBlXQxaV3zcpQx9Y3NYJhS7JD8UYVpGnUSSLReiNtmHjkRM6TcyQcciN5JDdClQ8tQf9ykKorWHuGrWaFbOgt9v9Q9/AnD1190t2PTHk6eZhNiFKgI0h8PiCILbIgXD4Eg6pzV+ploBISnpOJ6wX1Ti66r6SIMbuX9pDKRJ0AQtbE6s3A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750835434; c=relaxed/relaxed;
	bh=KYmOcR+Ty6ORVYOprUyh9SHSbbSmp4y4Zcmg/7D/5kY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MZ3FOtqnbsK/eWqBd7WgB1gQkMs0aLU8TBaT+rTrzzDfPHgSf+QgKQgp4Jmu0LpbWbY0kfqvhT5dfWx+YlunS4vdKv7QeGwTwD/XoNyCxxdwEGz3wXKDa3z+7esL6I5H/D7gDYdtQ6DbrUpG+Vepq0vj5TF0QwiavPUL5MtYUrpYTrX5EusOFVkGYP44Zubl7vy7nfi8WIwDSSiusNcmHGeoEwWLgzQ0uKh87he/jyPDgGolXvempHvklelugLS41I0gPwzbP8nK1B1C2poH7ft0zyGlky4X+YNwWcuvRKKRjuqLXMVoPa2ljpZD8x34GkfCmWpWVnV5DTlby5f/nA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nqVpQzpx; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nqVpQzpx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bRtJ73LFnz307q
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jun 2025 17:10:31 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9F8F44AFEC;
	Wed, 25 Jun 2025 07:10:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 303BCC4CEF4;
	Wed, 25 Jun 2025 07:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750835429;
	bh=1DNk7tX1YvvlA6uSWHlfTS+Bb3s1eS+aWteQQPlb1JM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nqVpQzpxUnKXPMGrZ1EGYozacdniZ2Ei1z0BDb9CArbXCIdhByuU9MICPVrjgSPOs
	 7I9XtCbuuhB6jWShxX4zi3pBcGSRDxsestEYjY/AaCTGarh3AmLmMYGVmsNHH1evss
	 mVm19s4IODFj3zJjHA7UoVak1Yktt1eeG3x4UvGqP1eBFy9no7S/Z2ct6nwLqYlGJV
	 Hfjb4JOyB1ZwjnDHOmsYhRJU6IML4Cg4wPn/XWbASQCigU+IWieRPJoRfKCL2onHLw
	 c93er26kDV2ZMVmMh48fmsPNOWrh8d0egdKTyR/kurxPY6+tKSegQkxGRUJK1Iqp4n
	 jcy1kRYUqSgXw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 05/18] lib/crypto: sha512: Do not include <crypto/internal/sha2.h>
Date: Wed, 25 Jun 2025 00:08:06 -0700
Message-ID: <20250625070819.1496119-6-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250625070819.1496119-1-ebiggers@kernel.org>
References: <20250625070819.1496119-1-ebiggers@kernel.org>
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
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Since the SHA-512 code is now consolidated into a single translation
unit except for assembly code, there is no longer any need for an
internal header.  Indeed, lib/crypto/sha512.c relies on
<crypto/internal/sha2.h> only for indirect inclusions.  Stop including
it.  This prepares for the later removal of this header, once the
SHA-256 code is reorganized similarly and stops needing it too.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 lib/crypto/sha512.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/crypto/sha512.c b/lib/crypto/sha512.c
index fe9d98b9b7db9..f5a9569a7ef96 100644
--- a/lib/crypto/sha512.c
+++ b/lib/crypto/sha512.c
@@ -7,15 +7,16 @@
  * Copyright (c) 2003 Kyle McMartin <kyle@debian.org>
  * Copyright 2025 Google LLC
  */
 
 #include <crypto/hmac.h>
-#include <crypto/internal/sha2.h>
+#include <crypto/sha2.h>
 #include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/overflow.h>
+#include <linux/unaligned.h>
 #include <linux/wordpart.h>
 
 static const struct sha512_block_state sha384_iv = {
 	.h = {
 		SHA384_H0, SHA384_H1, SHA384_H2, SHA384_H3,
-- 
2.50.0


