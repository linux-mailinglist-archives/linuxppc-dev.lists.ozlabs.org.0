Return-Path: <linuxppc-dev+bounces-11833-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A80ABB47784
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Sep 2025 23:37:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cK64F326Sz3ccr;
	Sun,  7 Sep 2025 07:37:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757194621;
	cv=none; b=njADqUamVf1FNoPVW88UcCqgR8vA7rYQ3kQAWp8VBJIKO3Khg8EKCA3pcqfABFsPN54WWopLs31YI3VXh1z1vhTOIIMVIHHKUJQ8yjb64kReTFOAfJlJgleC49eNmlFUiJGIwGI/Pwc4zizs6T1df/K+yv5x6I2i9oYbXIWnxcpjw+8sAAgaLqYEXc6H9DeTN5cwjwNdifsQo+AVSGfTuYSb1/dcUEptbP5a+JT3BtzmAW8pTXUL6Nn9W0oQma6r1K+++F8guE3aE3fF7Y2/7IRzYDz/LCkh1rWRzSdIUIXh6fJVAWreXFTOJwvOHWNSHiox1NF/ob/LZgrZasOPPg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757194621; c=relaxed/relaxed;
	bh=OiQ8LVV4DBMGwKo4t4RUlKKfJYhf1rkwBObsbvwTHPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S6SBdd19MitIrIocX2kGBanYNf6rQfy8nOXjEl5g11U7+mymXs2yYX6OzOOn0VJQq+jzyfFgJ1dKzaQPqy3P5ZUKoeBl7prQnlnvF5C5k7ZV3NKKUJ/CSOxNj9Yy67RT8RwXcnpIUqThqxmHHXxsMtX0yP1oEO/QlNvZRPQH5UvruDhdNvUHQpkMjB0gzxOhc1HFAU0vE+DqondxNWcryDCybIWUE0Wl0vH+znAQdW8IpiSzoKQgac4xTJg/nu7wT6BGrN+tYTWdpF2c1QvknEP/M2atk5UF94CXGjlKsaUENVCmQsncsUishOE2+i1l/Q/tdXK4PI3kCO6mUrJKtw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=K2ZCkNnL; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=K2ZCkNnL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cK64D1v6nz3cbg
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  7 Sep 2025 07:37:00 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 504D544A89;
	Sat,  6 Sep 2025 21:36:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82FD5C4CEF5;
	Sat,  6 Sep 2025 21:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757194618;
	bh=65bERrm6Cr6LAIUiJbaJGscz/JpMgV2DYwvlkxe3SoQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K2ZCkNnLRcwhugFHUVY+bVqzNXoytm1m2TnBvPwvhftsxchX8Kb5jAumolGSbDgBj
	 aIaOI3CSe002OhewhRzbrwqOsUuFxl4hbXqBeYcfzikBGpYNPVvqelRW83dlFbOnfE
	 RM1FOu9/mrtAtYbfy4ZoakTdS9NLmbYs9n14YTXNKXfX32G6YYH3LN73XbfAMeov4s
	 IdmjVEHYZTEmvu7t59wrErJaCUji9VfLQb4d7bVS/RuqChf4hfYMIpEotGPlvEH42F
	 66kNJ+IEGZAs8ysvMFUjZnUjchni99pVXJBW9cXB8OaFKglwKro9F3r4OGSmsMFBLE
	 1r4ipNxwVelQQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Zhiqi Song <songzhiqi1@huawei.com>,
	Longfang Liu <liulongfang@huawei.com>,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v2 02/12] crypto: arm/curve25519 - Remove unused kpp support
Date: Sat,  6 Sep 2025 14:35:13 -0700
Message-ID: <20250906213523.84915-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250906213523.84915-1-ebiggers@kernel.org>
References: <20250906213523.84915-1-ebiggers@kernel.org>
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

Curve25519 is used only via the library API, not the crypto_kpp API.  In
preparation for removing the unused crypto_kpp API for Curve25519,
remove the unused "curve25519-neon" kpp algorithm.

Note that the underlying NEON optimized Curve25519 code remains fully
supported and accessible via the library API.

It's also worth noting that even if the kpp support for Curve25519 comes
back later, there is no need for arch-specific kpp glue code like this,
as a single kpp algorithm that wraps the library API is sufficient.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/arm/crypto/Kconfig           |  1 -
 arch/arm/crypto/curve25519-glue.c | 77 +------------------------------
 2 files changed, 1 insertion(+), 77 deletions(-)

diff --git a/arch/arm/crypto/Kconfig b/arch/arm/crypto/Kconfig
index 1e5f3cdf691c4..97718d86f6007 100644
--- a/arch/arm/crypto/Kconfig
+++ b/arch/arm/crypto/Kconfig
@@ -3,11 +3,10 @@
 menu "Accelerated Cryptographic Algorithms for CPU (arm)"
 
 config CRYPTO_CURVE25519_NEON
 	tristate
 	depends on KERNEL_MODE_NEON
-	select CRYPTO_KPP
 	select CRYPTO_LIB_CURVE25519_GENERIC
 	select CRYPTO_ARCH_HAVE_LIB_CURVE25519
 	default CRYPTO_LIB_CURVE25519_INTERNAL
 	help
 	  Curve25519 algorithm
diff --git a/arch/arm/crypto/curve25519-glue.c b/arch/arm/crypto/curve25519-glue.c
index e7b87e09dd99f..3076020d8fbeb 100644
--- a/arch/arm/crypto/curve25519-glue.c
+++ b/arch/arm/crypto/curve25519-glue.c
@@ -8,17 +8,15 @@
  */
 
 #include <asm/hwcap.h>
 #include <asm/neon.h>
 #include <asm/simd.h>
-#include <crypto/internal/kpp.h>
 #include <crypto/internal/simd.h>
 #include <linux/types.h>
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/jump_label.h>
-#include <linux/scatterlist.h>
 #include <crypto/curve25519.h>
 
 asmlinkage void curve25519_neon(u8 mypublic[CURVE25519_KEY_SIZE],
 				const u8 secret[CURVE25519_KEY_SIZE],
 				const u8 basepoint[CURVE25519_KEY_SIZE]);
@@ -44,94 +42,21 @@ void curve25519_base_arch(u8 pub[CURVE25519_KEY_SIZE],
 {
 	return curve25519_arch(pub, secret, curve25519_base_point);
 }
 EXPORT_SYMBOL(curve25519_base_arch);
 
-static int curve25519_set_secret(struct crypto_kpp *tfm, const void *buf,
-				 unsigned int len)
-{
-	u8 *secret = kpp_tfm_ctx(tfm);
-
-	if (!len)
-		curve25519_generate_secret(secret);
-	else if (len == CURVE25519_KEY_SIZE &&
-		 crypto_memneq(buf, curve25519_null_point, CURVE25519_KEY_SIZE))
-		memcpy(secret, buf, CURVE25519_KEY_SIZE);
-	else
-		return -EINVAL;
-	return 0;
-}
-
-static int curve25519_compute_value(struct kpp_request *req)
-{
-	struct crypto_kpp *tfm = crypto_kpp_reqtfm(req);
-	const u8 *secret = kpp_tfm_ctx(tfm);
-	u8 public_key[CURVE25519_KEY_SIZE];
-	u8 buf[CURVE25519_KEY_SIZE];
-	int copied, nbytes;
-	u8 const *bp;
-
-	if (req->src) {
-		copied = sg_copy_to_buffer(req->src,
-					   sg_nents_for_len(req->src,
-							    CURVE25519_KEY_SIZE),
-					   public_key, CURVE25519_KEY_SIZE);
-		if (copied != CURVE25519_KEY_SIZE)
-			return -EINVAL;
-		bp = public_key;
-	} else {
-		bp = curve25519_base_point;
-	}
-
-	curve25519_arch(buf, secret, bp);
-
-	/* might want less than we've got */
-	nbytes = min_t(size_t, CURVE25519_KEY_SIZE, req->dst_len);
-	copied = sg_copy_from_buffer(req->dst, sg_nents_for_len(req->dst,
-								nbytes),
-				     buf, nbytes);
-	if (copied != nbytes)
-		return -EINVAL;
-	return 0;
-}
-
-static unsigned int curve25519_max_size(struct crypto_kpp *tfm)
-{
-	return CURVE25519_KEY_SIZE;
-}
-
-static struct kpp_alg curve25519_alg = {
-	.base.cra_name		= "curve25519",
-	.base.cra_driver_name	= "curve25519-neon",
-	.base.cra_priority	= 200,
-	.base.cra_module	= THIS_MODULE,
-	.base.cra_ctxsize	= CURVE25519_KEY_SIZE,
-
-	.set_secret		= curve25519_set_secret,
-	.generate_public_key	= curve25519_compute_value,
-	.compute_shared_secret	= curve25519_compute_value,
-	.max_size		= curve25519_max_size,
-};
-
 static int __init arm_curve25519_init(void)
 {
-	if (elf_hwcap & HWCAP_NEON) {
+	if (elf_hwcap & HWCAP_NEON)
 		static_branch_enable(&have_neon);
-		return IS_REACHABLE(CONFIG_CRYPTO_KPP) ?
-			crypto_register_kpp(&curve25519_alg) : 0;
-	}
 	return 0;
 }
 
 static void __exit arm_curve25519_exit(void)
 {
-	if (IS_REACHABLE(CONFIG_CRYPTO_KPP) && elf_hwcap & HWCAP_NEON)
-		crypto_unregister_kpp(&curve25519_alg);
 }
 
 module_init(arm_curve25519_init);
 module_exit(arm_curve25519_exit);
 
-MODULE_ALIAS_CRYPTO("curve25519");
-MODULE_ALIAS_CRYPTO("curve25519-neon");
 MODULE_DESCRIPTION("Public key crypto: Curve25519 (NEON-accelerated)");
 MODULE_LICENSE("GPL v2");
-- 
2.50.1


