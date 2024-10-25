Return-Path: <linuxppc-dev+bounces-2589-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 07BA59B0E25
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2024 21:16:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XZsvC2hzPz2yVb;
	Sat, 26 Oct 2024 06:15:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729883751;
	cv=none; b=VYxaYQOUvqQT/VV9e1c6kYO9Pq/I4/SCm8Wec56PBEw/Qx3TFr6ZPAzpnUXYb7Gmk7NFFAkc3vQHcQuaL8bLNr21b4CdjoAWJ8kPPfeXiuFmJniBg1CBo8fFqdQlCUE6YFU2EPPZF0O18rRxEX40Kyx/URmDpk/zDeb+1sDXeICGTiH4NBGQwiVyvK+WSOsaicVFPMPM6XOiKyAbX2beVGZGpAYzFW+xcJOqXpq/NwY2k4gacVzclLivtZAv3tRb6X4yNM0sHotdKD+ZjZsuVsl7a9UJYyRI+sdNth3wymxTlMfrZyZQSy/j1AU0o20peiExnl3UsqWAB6/LzvsxAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729883751; c=relaxed/relaxed;
	bh=zZbM/dRE/cmjAUskRJwoD4lvL88KbXE8EmwY+oWCwVM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CU7zK0HNf1ZlpBrmwFh3BdnBvyBMBvH+7jrU/v6fdjc72Fp4l+QUGYPFbG1ZO/bYmmgJ6JArdvQGJ32IE6WQrm5EmfhNZBKrcKoLsXvn0dR5DYwS3IGKxUdSY12Q4XJeoe1P1y7FG8KtHSTW/NLovJK0FylTD2Oe1qs9y+qufOPdOG5WimJOZnP/jlwV/WGR4yfxs0bpURDWltw3aCPY6cbpxVOZU46Xsw8SkGBUoI6qTrWfEwbD3XrPNRVjSohPlKm1nc0PRXpCjSOQcKRtgOVldyrP5oK6h0anTNFauFL+c7n/PDtUmG/b/XSR0ICNS1YFMq7bPtBU03tR1dm4yA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QI9KH2T6; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QI9KH2T6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XZsvB0WDMz2yMb
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Oct 2024 06:15:49 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EFA485C56B1;
	Fri, 25 Oct 2024 19:15:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AED1C4CEF2;
	Fri, 25 Oct 2024 19:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729883745;
	bh=cAJYaYF7J3aaXrRf/1YfFopFsst+6vDJ5/6wykaVcrg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QI9KH2T6touAeB0Bal3BOeVfOL9fssjod4GL6OqC7Pk6qRKNz9IPMverC8NgaWU7O
	 ER6xq1eq2ZWfPo1xlfIxSL/jgpJppO0mPJ89PTjZdCahyFmziLwWnkwj43+YtLFUKh
	 /cLt9rhrf2AqarRF5VND46RANchTj3PmSwBF/braEnqKyKknURDV8wgDod4hG3GHwt
	 byCNSM8KoUkpZF/cgYu4kz52r7RJwzyRomoqpWsVuW7t4xdVjwDKO15dN8Fjxh5Riz
	 t4wuPl8VpjQO5DRxjrsjFjxHcMDbZrCjQv+8hlnhaXJ1VjD5rLSfkGmv2hg6GCMm7U
	 TOvve01DNwQ8w==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH v2 03/18] lib/crc32: expose whether the lib is really optimized at runtime
Date: Fri, 25 Oct 2024 12:14:39 -0700
Message-ID: <20241025191454.72616-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241025191454.72616-1-ebiggers@kernel.org>
References: <20241025191454.72616-1-ebiggers@kernel.org>
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
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,SUSPICIOUS_RECIPS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Eric Biggers <ebiggers@google.com>

Make the CRC32 library export some flags that indicate which CRC32
functions are actually executing optimized code at runtime.  Set these
correctly from the architectures that implement the CRC32 functions.

This will be used to determine whether the crc32[c]-$arch shash
algorithms should be registered in the crypto API.  btrfs could also
start using these flags instead of the hack that it currently uses where
it parses the crypto_shash_driver_name.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/arm64/lib/crc32-glue.c  | 15 +++++++++++++++
 arch/riscv/lib/crc32-riscv.c | 15 +++++++++++++++
 include/linux/crc32.h        | 15 +++++++++++++++
 lib/crc32.c                  |  5 +++++
 4 files changed, 50 insertions(+)

diff --git a/arch/arm64/lib/crc32-glue.c b/arch/arm64/lib/crc32-glue.c
index d7f6e1cbf0d2..16f2b7c04294 100644
--- a/arch/arm64/lib/crc32-glue.c
+++ b/arch/arm64/lib/crc32-glue.c
@@ -83,7 +83,22 @@ u32 __pure crc32_be_arch(u32 crc, const u8 *p, size_t len)
 
 	return crc32_be_arm64(crc, p, len);
 }
 EXPORT_SYMBOL(crc32_be_arch);
 
+static int __init crc32_arm64_init(void)
+{
+	if (cpus_have_cap(ARM64_HAS_CRC32))
+		crc32_optimizations = CRC32_LE_OPTIMIZATION |
+				      CRC32_BE_OPTIMIZATION |
+				      CRC32C_OPTIMIZATION;
+	return 0;
+}
+arch_initcall(crc32_arm64_init);
+
+static void __exit crc32_arm64_exit(void)
+{
+}
+module_exit(crc32_arm64_exit);
+
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("arm64-optimized CRC32 functions");
diff --git a/arch/riscv/lib/crc32-riscv.c b/arch/riscv/lib/crc32-riscv.c
index a3ff7db2a1ce..a61c13d89364 100644
--- a/arch/riscv/lib/crc32-riscv.c
+++ b/arch/riscv/lib/crc32-riscv.c
@@ -295,7 +295,22 @@ u32 __pure crc32_be_arch(u32 crc, const u8 *p, size_t len)
 legacy:
 	return crc32_be_base(crc, p, len);
 }
 EXPORT_SYMBOL(crc32_be_arch);
 
+static int __init crc32_riscv_init(void)
+{
+	if (riscv_has_extension_likely(RISCV_ISA_EXT_ZBC))
+		crc32_optimizations = CRC32_LE_OPTIMIZATION |
+				      CRC32_BE_OPTIMIZATION |
+				      CRC32C_OPTIMIZATION;
+	return 0;
+}
+arch_initcall(crc32_riscv_init);
+
+static void __exit crc32_riscv_exit(void)
+{
+}
+module_exit(crc32_riscv_exit);
+
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Accelerated CRC32 implementation with Zbc extension");
diff --git a/include/linux/crc32.h b/include/linux/crc32.h
index 58c632533b08..bf26d454b60d 100644
--- a/include/linux/crc32.h
+++ b/include/linux/crc32.h
@@ -35,10 +35,25 @@ static inline u32 __pure __crc32c_le(u32 crc, const u8 *p, size_t len)
 	if (IS_ENABLED(CONFIG_CRC32_ARCH))
 		return crc32c_le_arch(crc, p, len);
 	return crc32c_le_base(crc, p, len);
 }
 
+/*
+ * crc32_optimizations contains flags that indicate which CRC32 library
+ * functions are using architecture-specific optimizations.  Unlike
+ * IS_ENABLED(CONFIG_CRC32_ARCH) it takes into account the different CRC32
+ * variants and also whether any needed CPU features are available at runtime.
+ */
+#define CRC32_LE_OPTIMIZATION	BIT(0) /* crc32_le() is optimized */
+#define CRC32_BE_OPTIMIZATION	BIT(1) /* crc32_be() is optimized */
+#define CRC32C_OPTIMIZATION	BIT(2) /* __crc32c_le() is optimized */
+#if IS_ENABLED(CONFIG_CRC32_ARCH)
+extern u32 crc32_optimizations;
+#else
+#define crc32_optimizations 0
+#endif
+
 /**
  * crc32_le_combine - Combine two crc32 check values into one. For two
  * 		      sequences of bytes, seq1 and seq2 with lengths len1
  * 		      and len2, crc32_le() check values were calculated
  * 		      for each, crc1 and crc2.
diff --git a/lib/crc32.c b/lib/crc32.c
index 47151624332e..194de73f30f8 100644
--- a/lib/crc32.c
+++ b/lib/crc32.c
@@ -336,5 +336,10 @@ u32 __pure crc32_be_base(u32 crc, const u8 *p, size_t len)
 {
 	return crc32_be_generic(crc, p, len, crc32table_be, CRC32_POLY_BE);
 }
 #endif
 EXPORT_SYMBOL(crc32_be_base);
+
+#if IS_ENABLED(CONFIG_CRC32_ARCH)
+u32 crc32_optimizations;
+EXPORT_SYMBOL(crc32_optimizations);
+#endif
-- 
2.47.0


