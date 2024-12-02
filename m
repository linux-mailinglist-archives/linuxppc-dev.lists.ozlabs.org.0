Return-Path: <linuxppc-dev+bounces-3647-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED15D9DF7F8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Dec 2024 02:11:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y1m0W1Bn6z2yZ4;
	Mon,  2 Dec 2024 12:09:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733101787;
	cv=none; b=PnFzKbhjRtJzqeizR5bLuXkG4TJ4kz6ozwfVr0kYwX8X6d4as1CV/Uk9i0WbrajuJSnkRbgIkjOYscvOSBVJI5qGP+Q23VvmmSpoYMw+0c0M83nXd91wtOW2WeHl7mD5UGyu4yetYNgXo2HMCtRUFQUrH/etVUb1lzEJmbVljwP3x1eN2GmFe/iY7J5/fyw72oD6mKFS13Zi8d9s3Ge2k4Fze22MGEyadKfmGNg23sT5JI8bR3lRfqu0VppBwAXEDWSHHtql9ZpBYgA464Otj6uOMNIhkcrZQvX/4n9VUptNAC4wonNIaK1hH82V4Pz8aE+rEF4e2IKS2ZKQ65Gyeg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733101787; c=relaxed/relaxed;
	bh=XGcRzCrfNcjXr071QAMUMfztbHofCETxSPS/uaj2zh8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oBLHUh6ZCq5tj48VPATpO5HSf50ca1YQ7zE3IDZ2kW9ZwI+W8268v/h6CvJTtOqAfNfoRVxL5INict2KwyqA8XPyIKKuuHfzV3nMJ5+L6QgfId5udo9k8LMXlaigcpmU/rx7vS16nx6Yk55BFMU1rYfoIp5ZwOcBfiCDnxVR85z2KH5EBYXftk00CxbUF/cNNs+gLniaP5nsx2QTXArnj5NvEDxCP8rHcBxoAUdrQGPIfO7w7dUtSdB8QP6VOGohH/9LKPwit5bNJBBp/nsumQXCTpc5MUi4NiqMXmtIiKXUBL8GPC5q8b0iZ+WLy6m24X7H9SC2/LSfF6EyOS9qXw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=K40uJjgd; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=K40uJjgd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y1m0Q4BMyz2ynr
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Dec 2024 12:09:41 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5CEFFA4014C;
	Mon,  2 Dec 2024 01:07:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AC18C4CEDA;
	Mon,  2 Dec 2024 01:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733101779;
	bh=AmpykIxi5EHXCZZNUOYjzbitPtJlUSmwFTjzmFllNZE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K40uJjgdaSpQxJxjTf1Ty3dtyvE9ghcp5WA0mrzPbzI6dBtelzWFq9m4kTVTYkEag
	 xqooP0n960OKVJDDNkhqcGKf1xSdwtx00AQvQi52CEOi+76exklxSjT1zIRyDRjMJ4
	 xdUQnYKFZVqTy00scmIUmlzD+nPxKFubjD/a4OOTm9bes7qEpV0ZJ4CcMc2g0rP6cL
	 ECr4tXwMcfuVHDeCV6ovAJOS46oKpbfiaTBiYXB48bjz6cVSmv5F1NwDDZ8nauGonF
	 6F90chiPDbnnhkW4zXZ2u/Wv5VBpn+2C4fXtZz/Ks+5ZYfx51AN/JYUQkXlqM/9gRn
	 G5+jBDjogLuSw==
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
	Ard Biesheuvel <ardb@kernel.org>,
	Chao Yu <chao@kernel.org>
Subject: [PATCH v4 18/19] f2fs: switch to using the crc32 library
Date: Sun,  1 Dec 2024 17:08:43 -0800
Message-ID: <20241202010844.144356-19-ebiggers@kernel.org>
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
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Eric Biggers <ebiggers@google.com>

Now that the crc32() library function takes advantage of
architecture-specific optimizations, it is unnecessary to go through the
crypto API.  Just use crc32().  This is much simpler, and it improves
performance due to eliminating the crypto API overhead.

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
Acked-by: Chao Yu <chao@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/f2fs/Kconfig |  3 +--
 fs/f2fs/f2fs.h  | 20 +-------------------
 fs/f2fs/super.c | 15 ---------------
 3 files changed, 2 insertions(+), 36 deletions(-)

diff --git a/fs/f2fs/Kconfig b/fs/f2fs/Kconfig
index 68a1e23e1557..5916a02fb46d 100644
--- a/fs/f2fs/Kconfig
+++ b/fs/f2fs/Kconfig
@@ -2,12 +2,11 @@
 config F2FS_FS
 	tristate "F2FS filesystem support"
 	depends on BLOCK
 	select BUFFER_HEAD
 	select NLS
-	select CRYPTO
-	select CRYPTO_CRC32
+	select CRC32
 	select F2FS_FS_XATTR if FS_ENCRYPTION
 	select FS_ENCRYPTION_ALGS if FS_ENCRYPTION
 	select FS_IOMAP
 	select LZ4_COMPRESS if F2FS_FS_LZ4
 	select LZ4_DECOMPRESS if F2FS_FS_LZ4
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 6f2cbf4c5740..fd7e9cb6f893 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -22,11 +22,10 @@
 #include <linux/bio.h>
 #include <linux/blkdev.h>
 #include <linux/quotaops.h>
 #include <linux/part_stat.h>
 #include <linux/rw_hint.h>
-#include <crypto/hash.h>
 
 #include <linux/fscrypt.h>
 #include <linux/fsverity.h>
 
 struct pagevec;
@@ -1766,13 +1765,10 @@ struct f2fs_sb_info {
 
 	/* For write statistics */
 	u64 sectors_written_start;
 	u64 kbytes_written;
 
-	/* Reference to checksum algorithm driver via cryptoapi */
-	struct crypto_shash *s_chksum_driver;
-
 	/* Precomputed FS UUID checksum for seeding other checksums */
 	__u32 s_chksum_seed;
 
 	struct workqueue_struct *post_read_wq;	/* post read workqueue */
 
@@ -1946,25 +1942,11 @@ static inline unsigned int f2fs_time_to_wait(struct f2fs_sb_info *sbi,
  * Inline functions
  */
 static inline u32 __f2fs_crc32(struct f2fs_sb_info *sbi, u32 crc,
 			      const void *address, unsigned int length)
 {
-	struct {
-		struct shash_desc shash;
-		char ctx[4];
-	} desc;
-	int err;
-
-	BUG_ON(crypto_shash_descsize(sbi->s_chksum_driver) != sizeof(desc.ctx));
-
-	desc.shash.tfm = sbi->s_chksum_driver;
-	*(u32 *)desc.ctx = crc;
-
-	err = crypto_shash_update(&desc.shash, address, length);
-	BUG_ON(err);
-
-	return *(u32 *)desc.ctx;
+	return crc32(crc, address, length);
 }
 
 static inline u32 f2fs_crc32(struct f2fs_sb_info *sbi, const void *address,
 			   unsigned int length)
 {
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index fc7d463dee15..19b67828ae32 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1692,12 +1692,10 @@ static void f2fs_put_super(struct super_block *sb)
 
 	f2fs_destroy_post_read_wq(sbi);
 
 	kvfree(sbi->ckpt);
 
-	if (sbi->s_chksum_driver)
-		crypto_free_shash(sbi->s_chksum_driver);
 	kfree(sbi->raw_super);
 
 	f2fs_destroy_page_array_cache(sbi);
 	f2fs_destroy_xattr_caches(sbi);
 #ifdef CONFIG_QUOTA
@@ -4464,19 +4462,10 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 		INIT_LIST_HEAD(&sbi->inode_list[i]);
 		spin_lock_init(&sbi->inode_lock[i]);
 	}
 	mutex_init(&sbi->flush_lock);
 
-	/* Load the checksum driver */
-	sbi->s_chksum_driver = crypto_alloc_shash("crc32", 0, 0);
-	if (IS_ERR(sbi->s_chksum_driver)) {
-		f2fs_err(sbi, "Cannot load crc32 driver.");
-		err = PTR_ERR(sbi->s_chksum_driver);
-		sbi->s_chksum_driver = NULL;
-		goto free_sbi;
-	}
-
 	/* set a block size */
 	if (unlikely(!sb_set_blocksize(sb, F2FS_BLKSIZE))) {
 		f2fs_err(sbi, "unable to set blocksize");
 		goto free_sbi;
 	}
@@ -4917,12 +4906,10 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 	fscrypt_free_dummy_policy(&F2FS_OPTION(sbi).dummy_enc_policy);
 	kvfree(options);
 free_sb_buf:
 	kfree(raw_super);
 free_sbi:
-	if (sbi->s_chksum_driver)
-		crypto_free_shash(sbi->s_chksum_driver);
 	kfree(sbi);
 	sb->s_fs_info = NULL;
 
 	/* give only one another chance */
 	if (retry_cnt > 0 && skip_recovery) {
@@ -5125,7 +5112,5 @@ module_init(init_f2fs_fs)
 module_exit(exit_f2fs_fs)
 
 MODULE_AUTHOR("Samsung Electronics's Praesto Team");
 MODULE_DESCRIPTION("Flash Friendly File System");
 MODULE_LICENSE("GPL");
-MODULE_SOFTDEP("pre: crc32");
-
-- 
2.47.1


