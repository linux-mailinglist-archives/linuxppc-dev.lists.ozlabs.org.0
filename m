Return-Path: <linuxppc-dev+bounces-3343-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 989039D0190
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Nov 2024 01:24:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XrWhc3cTWz3bXB;
	Sun, 17 Nov 2024 11:24:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731803040;
	cv=none; b=Zp7rBwD9kCp9DdRAsJJX1wJzO9al8kATEIScuwuf2V7SCd75+HyIl0kMPyBpyJO9QoxjvVX2LuvamWH/ewWKe1h4/d5NE/PmpWHcSZPbRG3iaUfucO0GFEnzYsrTDK6hwFkEld2mDEJzF9uemB2cIXjl5uQppYvVNKviSJGwG5NUtTCs8Xnl3v4GmPM/xKAUEFzi1rZkrek1XeKsjj9NIqdanuXk9onx0wouYMEgCfC2pRClmtGTvJTjYNlDDJ56HmXSuaYdd/Q/R9Bs+8Pviw+XSPz+r/YdLtitb7jQCAu9mHZ0VmrXOhohFeB2YjwsnnoNRBS9QR8hs2RyR7aXfw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731803040; c=relaxed/relaxed;
	bh=nulWKMnEXoWZUMSUrZco9XdRO+pd5CWpNIFDDWv+NDk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JUUafcHmnMlvca5QZpekbtxMi9T6wEYRZGkXBaaXizBoeu6nVIlHMvMxZeBbohXMML0hG7bE2PNk6bOdWz729t347/gW2a0o9vBhH8kXFarq9yDdJwFZtw6A0RYfePK4wS+u98CFyA1VBJlUx9uu5bLLihFhqlLx10R2hCGYupFP1mmMZStz4ovG+yI6IbIwVOC/FXyF0aO5dD0SxziePPHPuUYOrxpGVy2g1cWgEZFgKv4SEDBt/+ZmoYhgWn+0RikScWpKvF/VK+nuqPUENc8shIGPCUzoxPCd2mEs03ZR8vuGdt9MMUAhTCVOGrGIqEHXYQBDNykvRb7QQ1YPlg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ae3xjGCt; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ae3xjGCt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XrWhZ0pn3z2yD4
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Nov 2024 11:23:57 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 173A3A40C01;
	Sun, 17 Nov 2024 00:22:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EC2CC4CEDB;
	Sun, 17 Nov 2024 00:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731803034;
	bh=SOmKtc1U+Cth3ARmtiU8OIUv0APQu6lfcmWi1oOE0T4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ae3xjGCtOs/y/2IA9+TlSWBoIoshQQNPXgr0SgZ3f/r3v0tK6ppp+TNKKkk5FhMaW
	 fzhPJxnAGNYoXtldO4TD34DmtPZGZJVe6afCKZa77lMI67XEvqDcdJsy/eOf4UQzu+
	 UWMfcIvzW7ZZUSkslybJsRHzXpnJ9NwfZeU9Hl8H24dX7fea6Wx8fkBvKzt0IJevAp
	 +Oa1FxY9qXH1f+iivqzfVTgaHpriJPKUjS8BHISYZq/3g2CZr3mrS7oCMW9kzxxkPJ
	 jiuDIbfYJj5EPXDpkPR8PqnoUcYxPOZMjuZXUqo2eVxc9uVn3W3IGA73Qbdf+fCtM+
	 kIcqazZYknmnw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org,
	Zhihang Shao <zhihang.shao.iscas@gmail.com>,
	Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH 02/11] lib/crc-t10dif: add support for arch overrides
Date: Sat, 16 Nov 2024 16:22:35 -0800
Message-ID: <20241117002244.105200-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241117002244.105200-1-ebiggers@kernel.org>
References: <20241117002244.105200-1-ebiggers@kernel.org>
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
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Eric Biggers <ebiggers@google.com>

Following what was done for CRC32, add support for architecture-specific
override of the CRC-T10DIF library.  This will allow the CRC-T10DIF
library functions to access architecture-optimized code directly.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 include/linux/crc-t10dif.h | 12 ++++++++++++
 lib/Kconfig                | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/include/linux/crc-t10dif.h b/include/linux/crc-t10dif.h
index 206ba2305483..16787c1cee21 100644
--- a/include/linux/crc-t10dif.h
+++ b/include/linux/crc-t10dif.h
@@ -5,18 +5,30 @@
 #include <linux/types.h>
 
 #define CRC_T10DIF_DIGEST_SIZE 2
 #define CRC_T10DIF_BLOCK_SIZE 1
 
+u16 crc_t10dif_arch(u16 crc, const u8 *p, size_t len);
 u16 crc_t10dif_generic(u16 crc, const u8 *p, size_t len);
 
 static inline u16 crc_t10dif_update(u16 crc, const u8 *p, size_t len)
 {
+	if (IS_ENABLED(CONFIG_CRC_T10DIF_ARCH))
+		return crc_t10dif_arch(crc, p, len);
 	return crc_t10dif_generic(crc, p, len);
 }
 
 static inline u16 crc_t10dif(const u8 *p, size_t len)
 {
 	return crc_t10dif_update(0, p, len);
 }
 
+#if IS_ENABLED(CONFIG_CRC_T10DIF_ARCH)
+bool crc_t10dif_is_optimized(void);
+#else
+static inline bool crc_t10dif_is_optimized(void)
+{
+	return false;
+}
+#endif
+
 #endif
diff --git a/lib/Kconfig b/lib/Kconfig
index eb6c7a023be9..b84aa06ade30 100644
--- a/lib/Kconfig
+++ b/lib/Kconfig
@@ -147,10 +147,42 @@ config CRC_T10DIF
 	help
 	  This option is only needed if a module that's not in the
 	  kernel tree needs to calculate CRC checks for use with the
 	  SCSI data integrity subsystem.
 
+config ARCH_HAS_CRC_T10DIF
+	bool
+
+choice
+	prompt "CRC-T10DIF implementation"
+	depends on CRC_T10DIF
+	default CRC_T10DIF_IMPL_ARCH if ARCH_HAS_CRC_T10DIF
+	default CRC_T10DIF_IMPL_GENERIC if !ARCH_HAS_CRC_T10DIF
+	help
+	  This option allows you to override the default choice of CRC-T10DIF
+	  implementation.
+
+config CRC_T10DIF_IMPL_ARCH
+	bool "Architecture-optimized" if ARCH_HAS_CRC_T10DIF
+	help
+	  Use the optimized implementation of CRC-T10DIF for the selected
+	  architecture.  It is recommended to keep this enabled, as it can
+	  greatly improve CRC-T10DIF performance.
+
+config CRC_T10DIF_IMPL_GENERIC
+	bool "Generic implementation"
+	help
+	  Use the generic table-based implementation of CRC-T10DIF.  Selecting
+	  this will reduce code size slightly but can greatly reduce CRC-T10DIF
+	  performance.
+
+endchoice
+
+config CRC_T10DIF_ARCH
+	tristate
+	default CRC_T10DIF if CRC_T10DIF_IMPL_ARCH
+
 config CRC64_ROCKSOFT
 	tristate "CRC calculation for the Rocksoft model CRC64"
 	select CRC64
 	select CRYPTO
 	select CRYPTO_CRC64_ROCKSOFT
-- 
2.47.0


