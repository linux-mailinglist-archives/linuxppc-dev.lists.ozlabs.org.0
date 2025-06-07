Return-Path: <linuxppc-dev+bounces-9198-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC20BAD0F77
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Jun 2025 22:08:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bF8PB3fbgz308b;
	Sun,  8 Jun 2025 06:07:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749326862;
	cv=none; b=R2fJVMApmIrWkOZRd9309k9BkyQ+M5OHEgrVKZ+y37+04EghCMhzuDWqc8cXQQqAJYCysCyBfm82j5xVvYh0yfPKilh7NlNyBAkdI7JZT+dmv01wSM2DnWSSNd5cMmgJgoqH8AXMYmHsCbc5edwHzVTGq6lpz2Znviod7Q30rKZQ490OZkLSc2hp2QOypzaGG/QyhcgOlHp1yrLHa4rSUx8GxK0ld0nIn2q5sxcbYryby/oMPwaccwoBYxGbwfsf4lVISifiKSS0C+cdk3douRflHVocz6mhyrJINqqoYAOgLvAyuWIQ026n82+0T0lj4RkzVZWrNOqWcEMNhpbKww==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749326862; c=relaxed/relaxed;
	bh=puYKTOQx+60S8FYRlI93DdWC/zyBlmBk2s9q+e05u50=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ys3D50iy5gcnnaLMc2NLbHlMxLa+V+pRCh+y11GwgMRnkW+DEIKx+ZpF57Jq2PEaxy2jm+ec4JMe4vog/f3ndR1u/IGe6o2iqeLURIfsd0TnkOTW8+LAa5rByIqmKG6jGnzxQ2byI5zWQ9o1gQl+L61SVtdLqavNafEAbBfWqFJq74VSOqd+a8AraKaDtzbzq8DWt8aD/RwM49I2n0NVYuGbmmWrnGi82QyOAKoYqNCkywFdbycg35z6EOdN+Qlc8Z6eLYqvLqa0ylkh5D2piufRxV6yghmyWmNzpf3M0L/hOJBZ3fWzH4CRJPBqTBE1Paw8nrAtDFT6r0Txz8JZ7Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ajEhG5/8; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ajEhG5/8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bF8P60jSWz307V
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  8 Jun 2025 06:07:36 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1648C5C5AF6;
	Sat,  7 Jun 2025 20:05:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E744C4CEE4;
	Sat,  7 Jun 2025 20:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749326854;
	bh=ZDBXUza5mYKN0G+LEgQAmbkZEIUs7iZW79q0Idl2Apk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ajEhG5/8HVrfaad1n+slUIYvzE1FkTzDHcl7TWi7cGlPQnDlA04WdKniPoxYQOMYE
	 NFPprqJK5IW0ur0fiG3+y7GcPTyQuszc7j+8AfGYwPfJ+iPIu+ZTxAE0RYDH2G8FKm
	 BJJAZ7QkJFPdzFyT6dT+BjT8tLQ1siQLlN12X59hwHDp/q3vgGfG3SBu0/JsI+taKk
	 yOMBHSm3WUeEOXPURUAoEtz4nwBTplDDJdpMj/2dInexP90CK4TPNO12gzd+vmDwg1
	 x3S8BGN0sPA3MXigsw27iqzjq/8mJ/jiCprDcU9qVKaUU6hKLM3CwKWLsWamrSVvTN
	 6UALswZ1OpPdQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	linux-arch@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH v2 12/12] lib/crc: remove ARCH_HAS_* kconfig symbols
Date: Sat,  7 Jun 2025 13:04:54 -0700
Message-ID: <20250607200454.73587-13-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250607200454.73587-1-ebiggers@kernel.org>
References: <20250607200454.73587-1-ebiggers@kernel.org>
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
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Eric Biggers <ebiggers@google.com>

These symbols are no longer used, so remove them.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 lib/crc/Kconfig | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/lib/crc/Kconfig b/lib/crc/Kconfig
index de4b2182ae7ff..5858b3acc6630 100644
--- a/lib/crc/Kconfig
+++ b/lib/crc/Kconfig
@@ -42,13 +42,10 @@ config CRC_T10DIF
 	tristate
 	help
 	  The CRC-T10DIF library functions.  Select this if your module uses
 	  any of the functions from <linux/crc-t10dif.h>.
 
-config ARCH_HAS_CRC_T10DIF
-	bool
-
 config CRC_T10DIF_ARCH
 	bool
 	depends on CRC_T10DIF && CRC_OPTIMIZATIONS
 	default y if ARM && KERNEL_MODE_NEON
 	default y if ARM64 && KERNEL_MODE_NEON
@@ -61,13 +58,10 @@ config CRC32
 	select BITREVERSE
 	help
 	  The CRC32 library functions.  Select this if your module uses any of
 	  the functions from <linux/crc32.h> or <linux/crc32c.h>.
 
-config ARCH_HAS_CRC32
-	bool
-
 config CRC32_ARCH
 	bool
 	depends on CRC32 && CRC_OPTIMIZATIONS
 	default y if ARM && KERNEL_MODE_NEON
 	default y if ARM64
@@ -83,13 +77,10 @@ config CRC64
 	tristate
 	help
 	  The CRC64 library functions.  Select this if your module uses any of
 	  the functions from <linux/crc64.h>.
 
-config ARCH_HAS_CRC64
-	bool
-
 config CRC64_ARCH
 	bool
 	depends on CRC64 && CRC_OPTIMIZATIONS
 	default y if RISCV && RISCV_ISA_ZBC && 64BIT
 	default y if X86_64
-- 
2.49.0


