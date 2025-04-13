Return-Path: <linuxppc-dev+bounces-7638-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E36DA870BA
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Apr 2025 06:56:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZZymR0RhPz2yk3;
	Sun, 13 Apr 2025 14:55:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744520150;
	cv=none; b=gtBYqyKtV2UusC7Y8FVq4cvYbKocVXTh2G2AfiskfrOwbiT6K4Fr+SQc9MfXXlrUYAsrqNYyp9KkOWwkWq0ictTaG1ZrO02TtS2duV2NL4u0ssKWZME0CM/3EgM9EZy9QBni0GiQYcLuWo6qZ9s8uceDamlpYEUBV21IReZasAnOQY1GQ1lTiPZ0gmvdld/I8ekscsqUMDeVK8pLLzDjV6V/EjIFpchIpT45eq5p7fjX7t0I7d4CbuFCTV3ffvrEs1GS1t1ePP+IGqiTtcLpjJCqJHbibPt/Plc3X+IHEjvBDUOTsP211idMsEXpPG4DCuaqAdvHWiIGarBUn2EHFA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744520150; c=relaxed/relaxed;
	bh=mfq8NUl2WvJrEeqpsBeuYsFmw+cnTBFnk1Up45/MZ2k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EulJInivCldD3bptbxa4TYzC11ZsG+rnXKCmT+o3Vl+ecsLMMwaCvybNXwtxCLUeojj3rIbcVZ1y+YSb/I2ZRmQR7M9efEsPw7VcVzNwTRQfq5o6A0XzCCVHbAVM3wfvQOC8Mr4hKbvuXT/vby8g1wsuHVzDiOfoiTvcUiEGOzOB+Cdr+5LNgTcjkFNxLkahvuqFpmd/l4xr74Lt7CBqfDTQ8SeXY3w7KmjVgkp2Q1ohAP2WwK3wqX29sUU9Mu7IBSQihxpq2skjWtSQPUpcPOoHi4Z0h+9/qnK0zZbETVjhAk0y8iFAOmf46KRelMdIjSjGtPI9Cotr1mKhxRr3zQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ASqL0WN/; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ASqL0WN/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZZymM5gcjz2yqR
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Apr 2025 14:55:47 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C80DA6113B;
	Sun, 13 Apr 2025 04:55:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41DD0C4CEE5;
	Sun, 13 Apr 2025 04:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744520142;
	bh=S6EtgyS23+qRGH0eAeuHrJro1hFgR1JlJgbog1ls+WE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ASqL0WN/Mm67yTnOT6LYSFTru/q7hLEducze6iLetJNyVrFU28EBOBehoKHuj4Oxx
	 bjNrhBx1GKB0g3RiBz6f2ge6+haqU+3AGx/seBNICYpwgrSAkVxX7uFXlRysnKMm/g
	 O+De6pWgmW8F/TYbosTH+Sg3Ys6WTqGBK6jlwM2pY+X/gK90/5I10kVKFa28LkyYU6
	 RglM1wB2KVZKfoRMWa8zL7zk6LfUOR7wBBoj+G0Zm9GzXpR/PH6kNHUuCBkVvRirRB
	 lrHTms4JzO/mMetcYLgGd6h4HxCTgRyvHehtFp2NG6lAZyQce9YRhNenb0nqAWOdxQ
	 sEgZopVA4Pd9Q==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org
Subject: [PATCH 5/9] crypto: mips/poly1305 - drop redundant dependency on CONFIG_MIPS
Date: Sat, 12 Apr 2025 21:54:17 -0700
Message-ID: <20250413045421.55100-6-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250413045421.55100-1-ebiggers@kernel.org>
References: <20250413045421.55100-1-ebiggers@kernel.org>
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	SUSPICIOUS_RECIPS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Eric Biggers <ebiggers@google.com>

arch/mips/crypto/Kconfig is sourced only when CONFIG_MIPS is enabled, so
there is no need for options defined in that file to depend on it.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/mips/crypto/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/mips/crypto/Kconfig b/arch/mips/crypto/Kconfig
index 0189686de3a1..9892391f74ac 100644
--- a/arch/mips/crypto/Kconfig
+++ b/arch/mips/crypto/Kconfig
@@ -2,11 +2,10 @@
 
 menu "Accelerated Cryptographic Algorithms for CPU (mips)"
 
 config CRYPTO_POLY1305_MIPS
 	tristate
-	depends on MIPS
 	select CRYPTO_HASH
 	select CRYPTO_ARCH_HAVE_LIB_POLY1305
 	default CRYPTO_LIB_POLY1305_INTERNAL
 	help
 	  Poly1305 authenticator algorithm (RFC7539)
-- 
2.49.0


