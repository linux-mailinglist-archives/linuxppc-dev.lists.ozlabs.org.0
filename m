Return-Path: <linuxppc-dev+bounces-3641-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A14139DF7E3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Dec 2024 02:11:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y1m0S3Xtdz2ywy;
	Mon,  2 Dec 2024 12:09:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733101784;
	cv=none; b=Ar3aZReaESYseYaO6mZJchiY8Cvh4fa8FnHQZ1o0ZhRoXdH+Plwd+0+sVToDxbH5A0Ip3nym2WXYWjXZnHXwOQPSqTvpk5p6LlShepubDVZemEyhE1djZyvDLPJtPP4H10/CB8hN8BOnvYKaROLyZF8Ifd5NIlRZitjyb+Cini7TjYD9kqJNh4rA4uL9UELm+HG16zbpl5P5OMqMzJETu2xBup+8fSG5XMKNC2tfJmj8Ch5TTRQeWxNpM1t/hZwGr5O5F8vw/aNP7Vk0BjdkyFrWwxatpx3S7MJnFbzU2Ybnng3wuzPWCTGEQUWOei4/QyrBplLyrhvmiEq5MBRF2w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733101784; c=relaxed/relaxed;
	bh=tEu2THgV7SSv0mEsAtqvijU9cWxFbSPknRJH0jBh4xs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CW8VzHYYVfAleVZctyAYIKDcGOAYKfCZWCIhYiI/mF+KAik/83GfPD+jkY9t9KRM410AHjGAVEDb7J821biKDsja30c/8liUOak44xMGN3Zz3bHdB42G9jRa9Ab2HxNHh5HFoOv8f58Oo+5E+4SuvZx41vqvuK9e4nuJmA3MvDXKDUBbCjmFCYw8B9Pr6gcg9KKiQM5DzvOEyINxKK+0rRCSJCkWZSThFi/TXGRq/x3RBHOSHSppaA6RUju/HgBrfjmrarbeBIkXX/hauRqmoPq1OrFfZNslGUh5ndjNxcOiUgXJidAMLRZQaUr848+rI3Q+/Jdy/GKYInqRTnbdzw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CUlGfZAb; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CUlGfZAb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y1m0M4568z2yjJ
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Dec 2024 12:09:39 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C62B95C64DE;
	Mon,  2 Dec 2024 01:08:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40774C4CED2;
	Mon,  2 Dec 2024 01:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733101777;
	bh=zWAjtRpwG/RsPHeuNC3qmqgg0iTy0nmJZ7nxNCPm0aA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CUlGfZAbhj1YDLQx1/AEYZvSFdrBTDethDXF4i9ERTYsKp856cW9OmidC69Vr/3qG
	 h80tdaSdP4L/vgp/gjirYV6Gj5ymnF012e/TMEqCFygfv/XflHfgUqt+Bae97/+Cam
	 pwF06a1si8gkRBQv8bkZX/VYxx171Zg5kDCjGYEJAYUhtwU16hpxOQ4m3SMQ1zFrLd
	 SggMqeo6V5UKgOox0+XvI7eGgsTsaElwdc58N51UabgHQO5AA7lZDClfoupMcWwMHl
	 mS73RBctxDz0Zj4d+T980VRjjksWsg2d1VpzhDxexYo9ebIc0U6J7fk3ND8LtWG5y+
	 2HCTso0MHXPYQ==
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
	x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH v4 15/19] lib/crc32: make crc32c() go directly to lib
Date: Sun,  1 Dec 2024 17:08:40 -0800
Message-ID: <20241202010844.144356-16-ebiggers@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241202010844.144356-1-ebiggers@kernel.org>
References: <20241202010844.144356-1-ebiggers@kernel.org>
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
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Eric Biggers <ebiggers@google.com>

Now that the lower level __crc32c_le() library function is optimized for
each architecture, make crc32c() just call that instead of taking an
inefficient and error-prone detour through the shash API.

Note: a future cleanup should make crc32c_le() be the actual library
function instead of __crc32c_le().  That will require updating callers
of __crc32c_le() to use crc32c_le() instead, and updating callers of
crc32c_le() that expect a 'const void *' arg to expect 'const u8 *'
instead.  Similarly, a future cleanup should remove LIBCRC32C by making
everyone who is selecting it just select CRC32 directly instead.

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 include/linux/crc32c.h |  7 ++--
 lib/Kconfig            | 10 ++----
 lib/Makefile           |  1 -
 lib/libcrc32c.c        | 74 ------------------------------------------
 4 files changed, 8 insertions(+), 84 deletions(-)
 delete mode 100644 lib/libcrc32c.c

diff --git a/include/linux/crc32c.h b/include/linux/crc32c.h
index 357ae4611a45..47eb78003c26 100644
--- a/include/linux/crc32c.h
+++ b/include/linux/crc32c.h
@@ -1,12 +1,15 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 #ifndef _LINUX_CRC32C_H
 #define _LINUX_CRC32C_H
 
-#include <linux/types.h>
+#include <linux/crc32.h>
 
-extern u32 crc32c(u32 crc, const void *address, unsigned int length);
+static inline u32 crc32c(u32 crc, const void *address, unsigned int length)
+{
+	return __crc32c_le(crc, address, length);
+}
 
 /* This macro exists for backwards-compatibility. */
 #define crc32c_le crc32c
 
 #endif	/* _LINUX_CRC32C_H */
diff --git a/lib/Kconfig b/lib/Kconfig
index 8858030bebae..d0c2dc0dac32 100644
--- a/lib/Kconfig
+++ b/lib/Kconfig
@@ -308,18 +308,14 @@ config CRC7
 	  the kernel tree does. Such modules that use library CRC7
 	  functions require M here.
 
 config LIBCRC32C
 	tristate "CRC32c (Castagnoli, et al) Cyclic Redundancy-Check"
-	select CRYPTO
-	select CRYPTO_CRC32C
+	select CRC32
 	help
-	  This option is provided for the case where no in-kernel-tree
-	  modules require CRC32c functions, but a module built outside the
-	  kernel tree does. Such modules that use library CRC32c functions
-	  require M here.  See Castagnoli93.
-	  Module will be libcrc32c.
+	  This option just selects CRC32 and is provided for compatibility
+	  purposes until the users are updated to select CRC32 directly.
 
 config CRC8
 	tristate "CRC8 function"
 	help
 	  This option provides CRC8 function. Drivers may select this
diff --git a/lib/Makefile b/lib/Makefile
index a8155c972f02..6573163d24e4 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -165,11 +165,10 @@ obj-$(CONFIG_CRC_ITU_T)	+= crc-itu-t.o
 obj-$(CONFIG_CRC32)	+= crc32.o
 obj-$(CONFIG_CRC64)     += crc64.o
 obj-$(CONFIG_CRC32_SELFTEST)	+= crc32test.o
 obj-$(CONFIG_CRC4)	+= crc4.o
 obj-$(CONFIG_CRC7)	+= crc7.o
-obj-$(CONFIG_LIBCRC32C)	+= libcrc32c.o
 obj-$(CONFIG_CRC8)	+= crc8.o
 obj-$(CONFIG_CRC64_ROCKSOFT) += crc64-rocksoft.o
 obj-$(CONFIG_XXHASH)	+= xxhash.o
 obj-$(CONFIG_GENERIC_ALLOCATOR) += genalloc.o
 
diff --git a/lib/libcrc32c.c b/lib/libcrc32c.c
deleted file mode 100644
index 649e687413a0..000000000000
--- a/lib/libcrc32c.c
+++ /dev/null
@@ -1,74 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/* 
- * CRC32C
- *@Article{castagnoli-crc,
- * author =       { Guy Castagnoli and Stefan Braeuer and Martin Herrman},
- * title =        {{Optimization of Cyclic Redundancy-Check Codes with 24
- *                 and 32 Parity Bits}},
- * journal =      IEEE Transactions on Communication,
- * year =         {1993},
- * volume =       {41},
- * number =       {6},
- * pages =        {},
- * month =        {June},
- *}
- * Used by the iSCSI driver, possibly others, and derived from
- * the iscsi-crc.c module of the linux-iscsi driver at
- * http://linux-iscsi.sourceforge.net.
- *
- * Following the example of lib/crc32, this function is intended to be
- * flexible and useful for all users.  Modules that currently have their
- * own crc32c, but hopefully may be able to use this one are:
- *  net/sctp (please add all your doco to here if you change to
- *            use this one!)
- *  <endoflist>
- *
- * Copyright (c) 2004 Cisco Systems, Inc.
- */
-
-#include <crypto/hash.h>
-#include <linux/err.h>
-#include <linux/init.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/crc32c.h>
-
-static struct crypto_shash *tfm;
-
-u32 crc32c(u32 crc, const void *address, unsigned int length)
-{
-	SHASH_DESC_ON_STACK(shash, tfm);
-	u32 ret, *ctx = (u32 *)shash_desc_ctx(shash);
-	int err;
-
-	shash->tfm = tfm;
-	*ctx = crc;
-
-	err = crypto_shash_update(shash, address, length);
-	BUG_ON(err);
-
-	ret = *ctx;
-	barrier_data(ctx);
-	return ret;
-}
-
-EXPORT_SYMBOL(crc32c);
-
-static int __init libcrc32c_mod_init(void)
-{
-	tfm = crypto_alloc_shash("crc32c", 0, 0);
-	return PTR_ERR_OR_ZERO(tfm);
-}
-
-static void __exit libcrc32c_mod_fini(void)
-{
-	crypto_free_shash(tfm);
-}
-
-module_init(libcrc32c_mod_init);
-module_exit(libcrc32c_mod_fini);
-
-MODULE_AUTHOR("Clay Haapala <chaapala@cisco.com>");
-MODULE_DESCRIPTION("CRC32c (Castagnoli) calculations");
-MODULE_LICENSE("GPL");
-MODULE_SOFTDEP("pre: crc32c");
-- 
2.47.1


