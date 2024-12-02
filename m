Return-Path: <linuxppc-dev+bounces-3651-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C312B9DF868
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Dec 2024 02:21:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y1mG65w0Tz2yhR;
	Mon,  2 Dec 2024 12:21:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733102494;
	cv=none; b=C+iMvWxrp+O+NKzMOyXNQWACsjBwufhoT9wbPpCGvzXFiTnp2GB3ZZwzhXInUJt1G30fp3rKM03j4JS7bTM/ZizkItz1wbiuqfPuULmKUTwzFw/uuZ9hqP4juOj0b13Y+NefOifGjzv+AXtfBsYjG7TaLTh0FamUCCumjWxx3yi2JLtQwOirbu6tqUnuIrj1zD2jEYsoV2HqGAYOc59RPzm9+GFBDhNZIaeBBHpsFn4RZamn6wXcxAn3+RUBOiJsWvauP+5AstV5GWozjrJIXjvhrOuIXCeDNKbzQwKFi6+sqOcFy7NM3dj+pB8Uh5+D09BIOCF6ehxAC2KA/tDH6A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733102494; c=relaxed/relaxed;
	bh=ip5zHEkyUM7h2o++LoVpmSBFQRoTeMqChUEBfs6fBoU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q1xGrbz1gqgTAhj2ruyD76CngNi2yq7AC7CP3Kga+yViwyoGrMBU9mOiUsakkYVWx2Wi4md1h+j/OqR0jcQu2t4sy1pMQOPbYMYNsRfwYR4l0fuaAKQllbImUGE+IlUKI8KytlAyCDJc+yVGxmvF6xyxPmmv/f5EJ4eHij3P72qzSrRfvRIfmxMfeOGI9dnWhvxUchwseHdS1IRNGIduyletRXNdJobJtiKNmoS4maNaR4sCOGdmsrSrEjgNTf1cj1uspWS9qDmHJU04zunuVwxS9OYhX54BypyrmxfQ2XRKPZ6oa32Hyt/9wJJclTA7K7R/QZsjZmYrACC10zekCQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FPlVWXqS; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FPlVWXqS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y1mG414Stz2yVd
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Dec 2024 12:21:32 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 50C83A40C2E;
	Mon,  2 Dec 2024 01:19:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DE92C4CEDC;
	Mon,  2 Dec 2024 01:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733102489;
	bh=DVKfdgkx+XQWnXd7S0Vc0JfNUBLYmfwnEAvdzQ4yAyk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FPlVWXqSkitqAzqYhZ2GDIeWs0qQ4N6kOao+XaK539fPu2WgSyqqKAjXzyRSCKiMX
	 R13j+UAzuSqDFtPj+ykjxZQz1L+UsaMOfvu3G71McAVWhdhIQqB3n3uIcm49B2yzWE
	 KUiPwbMfHNoK0U+ELSx7KLDkI+zYee5SkLXeyvDt09tJ0ws8Hs4l43ZR0SqxdqsVUl
	 gJ9xelTxBnb8hVsnIkdqC/f+hh8QPGKTZNL4OW3GpUkjmdm49wxSoH2+7nURPOGn7w
	 UY2axe7+UxRgGKpP7d4l3/h2ybImQnMDusQrrVdCZT3NoGyY1bsgPNj/3uz031TdD0
	 3gCbpKqNl/1kA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org,
	Zhihang Shao <zhihang.shao.iscas@gmail.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>
Subject: [PATCH v2 02/12] lib/crc-t10dif: add support for arch overrides
Date: Sun,  1 Dec 2024 17:20:46 -0800
Message-ID: <20241202012056.209768-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241202012056.209768-1-ebiggers@kernel.org>
References: <20241202012056.209768-1-ebiggers@kernel.org>
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

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
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
index be59f7cdf448..e52a38d8d783 100644
--- a/lib/Kconfig
+++ b/lib/Kconfig
@@ -159,10 +159,42 @@ config CRC_T10DIF
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
2.47.1


