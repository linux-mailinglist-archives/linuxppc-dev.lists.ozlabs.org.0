Return-Path: <linuxppc-dev+bounces-10222-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C31B02DE6
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Jul 2025 01:28:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bfl8b3rDjz3bwL;
	Sun, 13 Jul 2025 09:26:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752362799;
	cv=none; b=Mj5oWsfPuOuk3l7kqnehkgaNpCZXtBgOG1fid/XgazDzgnaqlKc8McVCul9I/C4Xq+GxV4t0mukgVvctvMKlhc8MJ+CBqSYXg6sxYHhMUYu8Knt6xBHwUgW+FaOtQbtQFat2IVDqmJ24YZlhTnyqY8ZHp8DJbxbwU+mlvWfdMaUOCgkqYrYW+Tns1oKOPXsKz8OFKqLOYr3OlJKqmujLC8CFNR1vEe5r2b8hWn0xFaCBaNTh/x+aM8kRwul+u5R6RDuQ/lhnZGNqX4c6q0OjDlXC0en/h9PLvMHm8ZNny8SZCWn+NTkD7yvLYQpdeilVr6+Hpap1akBdeCjeE1a3+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752362799; c=relaxed/relaxed;
	bh=X2MGdzYvcst5IMa/Q4V1TYN4Ms7TUXjTRtBPro8Troo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZdLhgSjxDCb8G58bq5yhnVC6h+Dfp5fs/LDHy/CnsaEzNSlyg3mtcTOIJ5+1ZHXS+TRVkPt0oXyYj5jU9+dUJpElibs0Dx4blH7gvgdOc/7jQCZOb5dfbC74Hs+DysopAu/2ZcJyXXDJq30HK60QOEB97is9MP1TOXQuxrIsosYfBMYEbZXaD0kRYRb/vV76JuW3t5+TfCEASU5ltqKN3lMQ4WaeR7UWzzDlUP3nhZ16crQEAM/T5UBTlLF85P/efJzQzmnWPJJNcH8y11t5gp4Wl/hPa4LRuNaJq3FZ9UtY9LfBkNxzGbR+h4vf7xZ1i2J7VwR7LNQT79/EeYlqWA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TruHvLVH; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TruHvLVH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bfl8S3W15z3bp7
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Jul 2025 09:26:31 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7C70E61127;
	Sat, 12 Jul 2025 23:26:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9DD0C4CEEF;
	Sat, 12 Jul 2025 23:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752362789;
	bh=RedRxFFHKVy5vtVyY+MZJNiBk1oOHQ1I/68b2H+lbA4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TruHvLVHxzmKSDlYw1X7RzNkw2reqbswxSziZxBysLXETgCfeJYJssRnoaL1nzchi
	 mi9LuEPvy1/hCsL7g5ruwnoqxWESCQwA0R6D++X5zLp+a1AP/SYpw+WEAZjvmFQX6i
	 m5sZe95u3ReCd2zA9v1HzPEzPx2HWU3ceCbr7feHlOPjPGB1S+Avh8UHhOh6Qd9t+q
	 9f4qhYO4xgQ30f+8sg3fvb3SJc4mvuEfy5lY9MGKg3uEMndll+YQh3+Gn88Rkq4xXy
	 9QbE4KXhY4FA2wx4Y5mO4lq71JIx2mLl3fKyCGcWwCY0X/KHwZI+dqmIh49OgDsD95
	 5DEcBVAIH3xUw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 19/26] tee: Use SHA-1 library instead of crypto_shash
Date: Sat, 12 Jul 2025 16:23:10 -0700
Message-ID: <20250712232329.818226-20-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250712232329.818226-1-ebiggers@kernel.org>
References: <20250712232329.818226-1-ebiggers@kernel.org>
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

Use the SHA-1 library functions instead of crypto_shash.  This is
simpler and faster.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 drivers/tee/Kconfig    |  3 +--
 drivers/tee/tee_core.c | 55 +++++++-----------------------------------
 2 files changed, 10 insertions(+), 48 deletions(-)

diff --git a/drivers/tee/Kconfig b/drivers/tee/Kconfig
index 61b507c187801..a84767940fbfc 100644
--- a/drivers/tee/Kconfig
+++ b/drivers/tee/Kconfig
@@ -1,12 +1,11 @@
 # SPDX-License-Identifier: GPL-2.0-only
 # Generic Trusted Execution Environment Configuration
 menuconfig TEE
 	tristate "Trusted Execution Environment support"
 	depends on HAVE_ARM_SMCCC || COMPILE_TEST || CPU_SUP_AMD
-	select CRYPTO
-	select CRYPTO_SHA1
+	select CRYPTO_LIB_SHA1
 	select DMA_SHARED_BUFFER
 	select GENERIC_ALLOCATOR
 	help
 	  This implements a generic interface towards a Trusted Execution
 	  Environment (TEE).
diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index acc7998758ad8..4c82a171bff20 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -12,11 +12,10 @@
 #include <linux/module.h>
 #include <linux/overflow.h>
 #include <linux/slab.h>
 #include <linux/tee_core.h>
 #include <linux/uaccess.h>
-#include <crypto/hash.h>
 #include <crypto/sha1.h>
 #include "tee_private.h"
 
 #define TEE_NUM_DEVICES	32
 
@@ -140,72 +139,36 @@ static int tee_release(struct inode *inode, struct file *filp)
  * UUIDv5 is specific in RFC 4122.
  *
  * This implements section (for SHA-1):
  * 4.3.  Algorithm for Creating a Name-Based UUID
  */
-static int uuid_v5(uuid_t *uuid, const uuid_t *ns, const void *name,
-		   size_t size)
+static void uuid_v5(uuid_t *uuid, const uuid_t *ns, const void *name,
+		    size_t size)
 {
+	struct sha1_ctx ctx;
 	unsigned char hash[SHA1_DIGEST_SIZE];
-	struct crypto_shash *shash = NULL;
-	struct shash_desc *desc = NULL;
-	int rc;
-
-	shash = crypto_alloc_shash("sha1", 0, 0);
-	if (IS_ERR(shash)) {
-		rc = PTR_ERR(shash);
-		pr_err("shash(sha1) allocation failed\n");
-		return rc;
-	}
-
-	desc = kzalloc(sizeof(*desc) + crypto_shash_descsize(shash),
-		       GFP_KERNEL);
-	if (!desc) {
-		rc = -ENOMEM;
-		goto out_free_shash;
-	}
-
-	desc->tfm = shash;
 
-	rc = crypto_shash_init(desc);
-	if (rc < 0)
-		goto out_free_desc;
-
-	rc = crypto_shash_update(desc, (const u8 *)ns, sizeof(*ns));
-	if (rc < 0)
-		goto out_free_desc;
-
-	rc = crypto_shash_update(desc, (const u8 *)name, size);
-	if (rc < 0)
-		goto out_free_desc;
-
-	rc = crypto_shash_final(desc, hash);
-	if (rc < 0)
-		goto out_free_desc;
+	sha1_init(&ctx);
+	sha1_update(&ctx, (const u8 *)ns, sizeof(*ns));
+	sha1_update(&ctx, (const u8 *)name, size);
+	sha1_final(&ctx, hash);
 
 	memcpy(uuid->b, hash, UUID_SIZE);
 
 	/* Tag for version 5 */
 	uuid->b[6] = (hash[6] & 0x0F) | 0x50;
 	uuid->b[8] = (hash[8] & 0x3F) | 0x80;
-
-out_free_desc:
-	kfree(desc);
-
-out_free_shash:
-	crypto_free_shash(shash);
-	return rc;
 }
 
 int tee_session_calc_client_uuid(uuid_t *uuid, u32 connection_method,
 				 const u8 connection_data[TEE_IOCTL_UUID_LEN])
 {
 	gid_t ns_grp = (gid_t)-1;
 	kgid_t grp = INVALID_GID;
 	char *name = NULL;
 	int name_len;
-	int rc;
+	int rc = 0;
 
 	if (connection_method == TEE_IOCTL_LOGIN_PUBLIC ||
 	    connection_method == TEE_IOCTL_LOGIN_REE_KERNEL) {
 		/* Nil UUID to be passed to TEE environment */
 		uuid_copy(uuid, &uuid_null);
@@ -258,11 +221,11 @@ int tee_session_calc_client_uuid(uuid_t *uuid, u32 connection_method,
 	default:
 		rc = -EINVAL;
 		goto out_free_name;
 	}
 
-	rc = uuid_v5(uuid, &tee_client_uuid_ns, name, name_len);
+	uuid_v5(uuid, &tee_client_uuid_ns, name, name_len);
 out_free_name:
 	kfree(name);
 
 	return rc;
 }
-- 
2.50.1


