Return-Path: <linuxppc-dev+bounces-9567-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3016DAE0DD8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jun 2025 21:23:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bNVqF31RHz30WX;
	Fri, 20 Jun 2025 05:22:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750360937;
	cv=none; b=juCaDS13PFTo/0hHvogfBYUE9WIV9gi1cnNhz0u30tAkfxR2ZzuxuJ/u3XHGhI+YGUnzX+VSPihK07XSExW0TSwo9Vs0TU80mLDjqDhXzBZWnxzlbB6WpL1Hv6BhSWIzMSJUghcm0oheWC0ODaJdudKZELo8h6lItz6sihszSiloQfMdefciyPxg9MAANPZrmiVwsUKlUO5S7Pd/Heum0nPJCkLJxWWyligtjmxb333gbCTkRjHGMO06z85NqDpN7itQeF5JXRWDdFg2/B3Hh1G5BsEtHDE0XnIXdPO8BlPTTKuFm74ReeoouLrbA2wF3Hvlm0gSc8aTporCT4U8Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750360937; c=relaxed/relaxed;
	bh=j1ggrj46R1vxqWLF9UFw2Xf1fL13Iu04Y8vyXTgiDj8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k/9iWiz7xJ5/OPR7JlGsoWh1egOzvsUwIJqWj3uONSm18EgzSFspU06E+mp0sBbP74A6jQyDxD/iurw6NTn+GiJEXrfUUWS6Cd0zFey3qbgKQWrMsuX88VyrQJU9StgEEhYJPkWOb9cVRBtc5m/22e7ORraX9tdhmZRKlNv88EqBfoJGAU58yN21t/XlrgndYhyFa3U1m9+WN2uG0ypHq4sSI8n3Ayd6Dyc1VQX1KjZc0Ii6lxpyGYWHSag3tO55oWBQwqoJVYwJ6WCQyaaP91H8RAU/4rwmdYHizJ9USJXN9fMNK3QNhmAP+pW3Ow1GBux3zEfq9L1Bf7bwwhwD/w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gsWHI6uC; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gsWHI6uC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bNVq91qkyz309v
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jun 2025 05:22:13 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 876305C66CD;
	Thu, 19 Jun 2025 19:19:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A7F8C4CEEA;
	Thu, 19 Jun 2025 19:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750360930;
	bh=TvyRRr0Q9p57RHCbNRzLmr80cK6DSzs3Te1JHJiic8A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gsWHI6uCzGtgTFS0+9VVGWSKxIlVRoAXr7ncQjaX5JwXgHpNeTiXfuOdhYkgBgHlJ
	 YQL+IwHGvkSc1iwP/qogzJwScgBGmtDDqgVmXHbv1uR/qUAz+wTmjf+9RfsQ9xDMXt
	 cx09P6ml5LT5uoXwPMu9X1MNzCP//2MHKBcUUMASgM0/fV4ggydLqclno7rm2SDVnv
	 ONIUBY64Njs+//9An/TZjwOxs648bB/vuUO+DLFNNZV/7HJSplry+6xHCOjC37RY1I
	 BLeB2leI6kKtRZ0xNTVxiSLCJo6HP4VbBMk/fOsC2kXM/UVnKAzfqEAO22jUF5/WYU
	 gM0TVdi6sVQnQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH v2 9/9] MAINTAINERS: drop arch/*/lib/crypto/ pattern
Date: Thu, 19 Jun 2025 12:19:08 -0700
Message-ID: <20250619191908.134235-10-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250619191908.134235-1-ebiggers@kernel.org>
References: <20250619191908.134235-1-ebiggers@kernel.org>
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

From: Eric Biggers <ebiggers@google.com>

Since all files arch/*/lib/crypto/* have been moved into lib/crypto/,
remove the arch/*/lib/crypto/ file pattern from MAINTAINERS.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a92290fffa163..8ca374b24a806 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6408,11 +6408,10 @@ M:	Jason A. Donenfeld <Jason@zx2c4.com>
 M:	Ard Biesheuvel <ardb@kernel.org>
 L:	linux-crypto@vger.kernel.org
 S:	Maintained
 T:	git https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git libcrypto-next
 T:	git https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git libcrypto-fixes
-F:	arch/*/lib/crypto/
 F:	lib/crypto/
 
 CRYPTO SPEED TEST COMPARE
 M:	Wang Jinchao <wangjinchao@xfusion.com>
 L:	linux-crypto@vger.kernel.org
-- 
2.50.0


