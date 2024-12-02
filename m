Return-Path: <linuxppc-dev+bounces-3660-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3370E9DF885
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Dec 2024 02:22:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y1mGD47X8z305j;
	Mon,  2 Dec 2024 12:21:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733102500;
	cv=none; b=UBb9/zQHsMAPxYDiIR11pC1fBmzErYA+SPkwU52HK0XLj87k34IEDmUG1P7yxZCIeehDzI6pn8ACAwE/c7cFDsqq4oa3e/uONC7RtMDl6enu0UJKtg3ix099uMucldapzgxPeZpl9kadKcjji7Tya9QiGBvSrAb8JtF/Z6WFAeSW9ZwsjcJ23MSqp3WAJwJrGwZDjKF2Do3lkmWbcE2c+ZrWruetZqBo/lMiHUY4p3a1ff7ILCOPLR7gVqFC6L2d+IMc/OCOYaO0LieaavckvpUYiKJOS3Sc3C2X5XdvLhBLB7P0oPWb7NCrGgCkNRzuWKdFsZKkA+y7JrWrXCzPsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733102500; c=relaxed/relaxed;
	bh=bfzCTbYD97+F4c30oHAK7Zbw4wdm5i3Ha+buuzjHUw8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I84ux85saONLy3ZTOgK+7Wl/AFfnOxgKkDPrPJTGy5hvlj93FnobgAzorOcpoR7bzIuc2OuATXlJbcvtcou0G1Uqk8uw/sbiWGVKlHjMxWwdmd5Lg/d4tx9tnDzazkgsTI2E/mHgytJdZoxK3nfveUqER8z1sJLjrS8vZTPu1qW+9jqbZeza8QYxEG/YomIpLsxTU37BkvjIyIJI45iNOVzwX1XOyRtpJIIZCFSkg48OqpCEsR2ZA0ziRL21ygAZWkV6shA8haAMVNbI96LGG6ZSnLHQK553VUmZB7oroW2fubtonAtJaFvazdOSorjXcTMz86ShPL5bNGeQD3P11w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Oisly4Do; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Oisly4Do;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y1mGB58bmz2yjJ
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Dec 2024 12:21:38 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DA21AA40C2F;
	Mon,  2 Dec 2024 01:19:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D40CFC4CEE5;
	Mon,  2 Dec 2024 01:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733102493;
	bh=g9wucc6u6AFX7ekmkePPictqDmUf0FvTD6OYgxiEp28=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Oisly4Doa2VUT9yhY+Nx2HidU6gAcGtPxUc53Qs3CtXJrwOY11hN83RQpwd3uf72g
	 aG15nezZpBjzHEOBBh2570YHa7jwJ5zUNWIhB44OoEhV1k61sm7CWhtuv8cifXmvBT
	 MSKxsgl7amuRnIaQAFnad2nDUj+fR9yMxugswamrql8/pP5aYHsa5anZPqvHy3nKiG
	 QnD7PJMRKo6pQwL6pcz5A6CSWl2HLQ8vJyycV4RLAiDEkFNLfE2eNZn/6aQR+42xgi
	 jy8EpYxlRV0a2EOkMVqH9l7Rn+IVzWxMfiwG9gdl6DzxM3VctpYxr45oB/5sdTHjxx
	 DVnhvLMr1Oy4w==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org,
	Zhihang Shao <zhihang.shao.iscas@gmail.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Vinicius Peixoto <vpeixoto@lkcamp.dev>,
	"Martin K. Petersen" <martin.petersen@oracle.com>
Subject: [PATCH v2 11/12] powerpc/crc: delete obsolete crc-vpmsum_test.c
Date: Sun,  1 Dec 2024 17:20:55 -0800
Message-ID: <20241202012056.209768-12-ebiggers@kernel.org>
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

Delete crc-vpmsum_test.c, since its functionality is now covered by the
new crc_kunit.c as well as the crypto subsystem's fuzz tests.

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
Cc: Vinicius Peixoto <vpeixoto@lkcamp.dev>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/powerpc/configs/ppc64_defconfig  |   1 -
 arch/powerpc/crypto/Kconfig           |   9 --
 arch/powerpc/crypto/Makefile          |   1 -
 arch/powerpc/crypto/crc-vpmsum_test.c | 133 --------------------------
 4 files changed, 144 deletions(-)
 delete mode 100644 arch/powerpc/crypto/crc-vpmsum_test.c

diff --git a/arch/powerpc/configs/ppc64_defconfig b/arch/powerpc/configs/ppc64_defconfig
index 15101f5c3238..465eb96c755e 100644
--- a/arch/powerpc/configs/ppc64_defconfig
+++ b/arch/powerpc/configs/ppc64_defconfig
@@ -387,11 +387,10 @@ CONFIG_CRYPTO_TWOFISH=m
 CONFIG_CRYPTO_PCBC=m
 CONFIG_CRYPTO_MICHAEL_MIC=m
 CONFIG_CRYPTO_SHA256=y
 CONFIG_CRYPTO_WP512=m
 CONFIG_CRYPTO_LZO=m
-CONFIG_CRYPTO_VPMSUM_TESTER=m
 CONFIG_CRYPTO_MD5_PPC=m
 CONFIG_CRYPTO_SHA1_PPC=m
 CONFIG_CRYPTO_AES_GCM_P10=m
 CONFIG_CRYPTO_DEV_NX=y
 CONFIG_CRYPTO_DEV_NX_ENCRYPT=m
diff --git a/arch/powerpc/crypto/Kconfig b/arch/powerpc/crypto/Kconfig
index 45376f1a43bd..5b315e9756b3 100644
--- a/arch/powerpc/crypto/Kconfig
+++ b/arch/powerpc/crypto/Kconfig
@@ -11,19 +11,10 @@ config CRYPTO_CURVE25519_PPC64
 	  Curve25519 algorithm
 
 	  Architecture: PowerPC64
 	  - Little-endian
 
-config CRYPTO_VPMSUM_TESTER
-	tristate "CRC32c and CRC32T10DIF hardware acceleration tester"
-	depends on CRYPTO_CRC32C && CRC32_ARCH
-	depends on CRYPTO_CRCT10DIF && CRC_T10DIF_ARCH
-	help
-	  Stress test for CRC32c and CRCT10DIF algorithms implemented with
-	  powerpc64 AltiVec extensions (POWER8 vpmsum instructions).
-	  Unless you are testing these algorithms, you don't need this.
-
 config CRYPTO_MD5_PPC
 	tristate "Digests: MD5"
 	depends on PPC
 	select CRYPTO_HASH
 	help
diff --git a/arch/powerpc/crypto/Makefile b/arch/powerpc/crypto/Makefile
index d2238ac7e52c..9b38f4a7bc15 100644
--- a/arch/powerpc/crypto/Makefile
+++ b/arch/powerpc/crypto/Makefile
@@ -8,11 +8,10 @@
 obj-$(CONFIG_CRYPTO_AES_PPC_SPE) += aes-ppc-spe.o
 obj-$(CONFIG_CRYPTO_MD5_PPC) += md5-ppc.o
 obj-$(CONFIG_CRYPTO_SHA1_PPC) += sha1-powerpc.o
 obj-$(CONFIG_CRYPTO_SHA1_PPC_SPE) += sha1-ppc-spe.o
 obj-$(CONFIG_CRYPTO_SHA256_PPC_SPE) += sha256-ppc-spe.o
-obj-$(CONFIG_CRYPTO_VPMSUM_TESTER) += crc-vpmsum_test.o
 obj-$(CONFIG_CRYPTO_AES_GCM_P10) += aes-gcm-p10-crypto.o
 obj-$(CONFIG_CRYPTO_CHACHA20_P10) += chacha-p10-crypto.o
 obj-$(CONFIG_CRYPTO_POLY1305_P10) += poly1305-p10-crypto.o
 obj-$(CONFIG_CRYPTO_DEV_VMX_ENCRYPT) += vmx-crypto.o
 obj-$(CONFIG_CRYPTO_CURVE25519_PPC64) += curve25519-ppc64le.o
diff --git a/arch/powerpc/crypto/crc-vpmsum_test.c b/arch/powerpc/crypto/crc-vpmsum_test.c
deleted file mode 100644
index c61a874a3a5c..000000000000
--- a/arch/powerpc/crypto/crc-vpmsum_test.c
+++ /dev/null
@@ -1,133 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * CRC vpmsum tester
- * Copyright 2017 Daniel Axtens, IBM Corporation.
- */
-
-#include <linux/crc-t10dif.h>
-#include <linux/crc32.h>
-#include <crypto/internal/hash.h>
-#include <linux/init.h>
-#include <linux/module.h>
-#include <linux/random.h>
-#include <linux/string.h>
-#include <linux/kernel.h>
-#include <linux/cpufeature.h>
-#include <asm/switch_to.h>
-
-static unsigned long iterations = 10000;
-
-#define MAX_CRC_LENGTH 65535
-
-
-static int __init crc_test_init(void)
-{
-	u16 crc16 = 0, verify16 = 0;
-	__le32 verify32le = 0;
-	unsigned char *data;
-	u32 verify32 = 0;
-	unsigned long i;
-	__le32 crc32;
-	int ret;
-
-	struct crypto_shash *crct10dif_tfm;
-	struct crypto_shash *crc32c_tfm;
-
-	if (!cpu_has_feature(CPU_FTR_ARCH_207S))
-		return -ENODEV;
-
-	data = kmalloc(MAX_CRC_LENGTH, GFP_KERNEL);
-	if (!data)
-		return -ENOMEM;
-
-	crct10dif_tfm = crypto_alloc_shash("crct10dif", 0, 0);
-
-	if (IS_ERR(crct10dif_tfm)) {
-		pr_err("Error allocating crc-t10dif\n");
-		goto free_buf;
-	}
-
-	crc32c_tfm = crypto_alloc_shash("crc32c", 0, 0);
-
-	if (IS_ERR(crc32c_tfm)) {
-		pr_err("Error allocating crc32c\n");
-		goto free_16;
-	}
-
-	do {
-		SHASH_DESC_ON_STACK(crct10dif_shash, crct10dif_tfm);
-		SHASH_DESC_ON_STACK(crc32c_shash, crc32c_tfm);
-
-		crct10dif_shash->tfm = crct10dif_tfm;
-		ret = crypto_shash_init(crct10dif_shash);
-
-		if (ret) {
-			pr_err("Error initing crc-t10dif\n");
-			goto free_32;
-		}
-
-
-		crc32c_shash->tfm = crc32c_tfm;
-		ret = crypto_shash_init(crc32c_shash);
-
-		if (ret) {
-			pr_err("Error initing crc32c\n");
-			goto free_32;
-		}
-
-		pr_info("crc-vpmsum_test begins, %lu iterations\n", iterations);
-		for (i=0; i<iterations; i++) {
-			size_t offset = get_random_u32_below(16);
-			size_t len = get_random_u32_below(MAX_CRC_LENGTH);
-
-			if (len <= offset)
-				continue;
-			get_random_bytes(data, len);
-			len -= offset;
-
-			crypto_shash_update(crct10dif_shash, data+offset, len);
-			crypto_shash_final(crct10dif_shash, (u8 *)(&crc16));
-			verify16 = crc_t10dif_generic(verify16, data+offset, len);
-
-
-			if (crc16 != verify16) {
-				pr_err("FAILURE in CRC16: got 0x%04x expected 0x%04x (len %lu)\n",
-				       crc16, verify16, len);
-				break;
-			}
-
-			crypto_shash_update(crc32c_shash, data+offset, len);
-			crypto_shash_final(crc32c_shash, (u8 *)(&crc32));
-			verify32 = le32_to_cpu(verify32le);
-		        verify32le = ~cpu_to_le32(__crc32c_le(~verify32, data+offset, len));
-			if (crc32 != verify32le) {
-				pr_err("FAILURE in CRC32: got 0x%08x expected 0x%08x (len %lu)\n",
-				       crc32, verify32, len);
-				break;
-			}
-		cond_resched();
-		}
-		pr_info("crc-vpmsum_test done, completed %lu iterations\n", i);
-	} while (0);
-
-free_32:
-	crypto_free_shash(crc32c_tfm);
-
-free_16:
-	crypto_free_shash(crct10dif_tfm);
-
-free_buf:
-	kfree(data);
-
-	return 0;
-}
-
-static void __exit crc_test_exit(void) {}
-
-module_init(crc_test_init);
-module_exit(crc_test_exit);
-module_param(iterations, long, 0400);
-
-MODULE_AUTHOR("Daniel Axtens <dja@axtens.net>");
-MODULE_DESCRIPTION("Vector polynomial multiply-sum CRC tester");
-MODULE_LICENSE("GPL");
-- 
2.47.1


