Return-Path: <linuxppc-dev+bounces-2796-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A20049BA8AC
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Nov 2024 23:32:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XhTr26pmQz2yQj;
	Mon,  4 Nov 2024 09:32:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730673154;
	cv=none; b=krHQ/DBQClt+kEDXlFxh8XCJB4ODFvcTAZEwj0ffp5Vv33dihHrapbdwH1BvSCSMY9r+SwGbrYGddaBlunJpSb+BggEImPpOldvLwXYJxzXwm9re2Ifkcn3G8t3Fhl1OTF6dUnG62HZk/g1GWKfxR8Wp1UujdNfbGwkqc0mEntsUX1x41AyCstH6ZcLIW5HYcRosOoyYnJIX8jauVdn1J76PKzYlk7KXGUJ857AfaOhTa1RwUdiIi0T+pDLh3iV+IuKZ+VHPJkiFuLlByTqmxmnXRqQUjoKaDdls50vf/9lYlovxsjph5zVf1nVKSYzmZhEOR3QR+vTETgV/IKGUvw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730673154; c=relaxed/relaxed;
	bh=dTZkMYeCkw5nu8nu/VTIgH7oCQpoc/EtF157IDSegNk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cnwzx9tTraULQRCy49vyRhSxj4f4zYHsDCw+Uc2apDBQaqfFGANtxK+Y37qcztksuKSkt36kHOvochBSUR/4lDavKBfSuWph8Y1B3WisDziK/kUuJPkNaFAPvVNCUzVTLO6efnANQmGXSmu4KdvZcVnOEgUUulb/urlB8CzkT9zRunAE+lvOAcUv0VzKqrDTThC8Fwjw03mvqPgRICJDxBsI2tAJGf0byzWtWxyPl+01VmwDpKu2D+qpkE7bfIxlnBy7BhkULUSBVTIrWjAq1GbgewazF3031jC3Pq9hbNxyCn+Ymb4SIbwig5hk89HA1ayN4SUU8V6D53fJi2NFug==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TrX8vnYi; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TrX8vnYi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XhTr05jPHz2yMt
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Nov 2024 09:32:32 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A891DA41F21;
	Sun,  3 Nov 2024 22:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F0A3C4AF09;
	Sun,  3 Nov 2024 22:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730673145;
	bh=R3RIsL1uK8EQAGi0SGqk7fPI8kAR8rBJM+i88HKwo+I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TrX8vnYi6RABnxqWW60rA5vLS2/aG1Tnc49VRVlwICi9yJ7QBnDWco/Yks+8wcuHa
	 RJuv3uzU+Z6DTR7yfQGoDUX9bYZhQ8O6Hq7pMkhfl3QqRSKQV3ExIVZu2uhcpBKIjR
	 fiwyAeVZAnX/xcIlgG4UBHb2UTaDQHawqpOvN2/n/J7uPYSvzXmIV9xhwyN2GFDagS
	 H4ngn3Fodl7aHmeNPUSVT2tVlOXuaBpibrQaV+wveq6oJO8Y8WsWgddFxjNtz0h7QF
	 GPGvqV/QcxpUiurjY8UUYUNlQ8oSIkZuJkJ/X9GpLLyNaLm2a8lC9ndMRajJMGOHq2
	 j8og8QUJ6tDSg==
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
Subject: [PATCH v3 03/18] lib/crc32: expose whether the lib is really optimized at runtime
Date: Sun,  3 Nov 2024 14:31:39 -0800
Message-ID: <20241103223154.136127-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241103223154.136127-1-ebiggers@kernel.org>
References: <20241103223154.136127-1-ebiggers@kernel.org>
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
X-Spam-Status: No, score=2.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	SUSPICIOUS_RECIPS autolearn=disabled version=4.0.0
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Eric Biggers <ebiggers@google.com>

Make the CRC32 library export a function crc32_optimizations() which
returns flags that indicate which CRC32 functions are actually executing
optimized code at runtime.

This will be used to determine whether the crc32[c]-$arch shash
algorithms should be registered in the crypto API.  btrfs could also
start using these flags instead of the hack that it currently uses where
it parses the crypto_shash_driver_name.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/arm64/lib/crc32-glue.c  | 10 ++++++++++
 arch/riscv/lib/crc32-riscv.c | 10 ++++++++++
 include/linux/crc32.h        | 15 +++++++++++++++
 3 files changed, 35 insertions(+)

diff --git a/arch/arm64/lib/crc32-glue.c b/arch/arm64/lib/crc32-glue.c
index d7f6e1cbf0d2..15c4c9db573e 100644
--- a/arch/arm64/lib/crc32-glue.c
+++ b/arch/arm64/lib/crc32-glue.c
@@ -83,7 +83,17 @@ u32 __pure crc32_be_arch(u32 crc, const u8 *p, size_t len)
 
 	return crc32_be_arm64(crc, p, len);
 }
 EXPORT_SYMBOL(crc32_be_arch);
 
+u32 crc32_optimizations(void)
+{
+	if (alternative_has_cap_likely(ARM64_HAS_CRC32))
+		return CRC32_LE_OPTIMIZATION |
+		       CRC32_BE_OPTIMIZATION |
+		       CRC32C_OPTIMIZATION;
+	return 0;
+}
+EXPORT_SYMBOL(crc32_optimizations);
+
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("arm64-optimized CRC32 functions");
diff --git a/arch/riscv/lib/crc32-riscv.c b/arch/riscv/lib/crc32-riscv.c
index a3ff7db2a1ce..53d56ab422c7 100644
--- a/arch/riscv/lib/crc32-riscv.c
+++ b/arch/riscv/lib/crc32-riscv.c
@@ -295,7 +295,17 @@ u32 __pure crc32_be_arch(u32 crc, const u8 *p, size_t len)
 legacy:
 	return crc32_be_base(crc, p, len);
 }
 EXPORT_SYMBOL(crc32_be_arch);
 
+u32 crc32_optimizations(void)
+{
+	if (riscv_has_extension_likely(RISCV_ISA_EXT_ZBC))
+		return CRC32_LE_OPTIMIZATION |
+		       CRC32_BE_OPTIMIZATION |
+		       CRC32C_OPTIMIZATION;
+	return 0;
+}
+EXPORT_SYMBOL(crc32_optimizations);
+
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Accelerated CRC32 implementation with Zbc extension");
diff --git a/include/linux/crc32.h b/include/linux/crc32.h
index 58c632533b08..e9bd40056687 100644
--- a/include/linux/crc32.h
+++ b/include/linux/crc32.h
@@ -35,10 +35,25 @@ static inline u32 __pure __crc32c_le(u32 crc, const u8 *p, size_t len)
 	if (IS_ENABLED(CONFIG_CRC32_ARCH))
 		return crc32c_le_arch(crc, p, len);
 	return crc32c_le_base(crc, p, len);
 }
 
+/*
+ * crc32_optimizations() returns flags that indicate which CRC32 library
+ * functions are using architecture-specific optimizations.  Unlike
+ * IS_ENABLED(CONFIG_CRC32_ARCH) it takes into account the different CRC32
+ * variants and also whether any needed CPU features are available at runtime.
+ */
+#define CRC32_LE_OPTIMIZATION	BIT(0) /* crc32_le() is optimized */
+#define CRC32_BE_OPTIMIZATION	BIT(1) /* crc32_be() is optimized */
+#define CRC32C_OPTIMIZATION	BIT(2) /* __crc32c_le() is optimized */
+#if IS_ENABLED(CONFIG_CRC32_ARCH)
+u32 crc32_optimizations(void);
+#else
+static inline u32 crc32_optimizations(void) { return 0; }
+#endif
+
 /**
  * crc32_le_combine - Combine two crc32 check values into one. For two
  * 		      sequences of bytes, seq1 and seq2 with lengths len1
  * 		      and len2, crc32_le() check values were calculated
  * 		      for each, crc1 and crc2.
-- 
2.47.0


