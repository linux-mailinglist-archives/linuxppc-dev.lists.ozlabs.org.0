Return-Path: <linuxppc-dev+bounces-3645-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E51EB9DF7EF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Dec 2024 02:11:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y1m0V0NNQz300f;
	Mon,  2 Dec 2024 12:09:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733101785;
	cv=none; b=PgCo2f7TShbP16swfO8eHcTwmrh2YUXm9tNo9sPljztjjSK2SDfe5ZGW3nmPv5xrgR/dSCkkSXtlOvJKBKzHgfs4fSKzavkMqVEW+lGiUUVJjmMaF3CJ2dkmMuhUhOLwja9cDbrjydqLk/ww8b76uVrvTcG6PlWE40BIH0dKLdFbuyb0VSHZvWdIThNahBzzFkDq7gf5BYV7PWPdkiIVW+dWZ+37wy7Kw5W9ajJba0jhWKY9Wtq7lOhXmfo1gpeZ8WfSfxgv8h9M9VLk89FT/ne433F9zPDvigz+2QPLdQeZB4SheXPBQHIuQEK3WvBelE4sHK71Isb2jhHS2fkdIA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733101785; c=relaxed/relaxed;
	bh=hdpLlMUCirJAUkXR86UAeieeAY737MZjkGDM93jO0a8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=le/50IGg06sETLVJ1tl2z1XKt6uEPR4zWK2odbZqXGWhi5Zb+IaEq9dThsQ6/BBbPA6s5wy7QgGkGoQM+DkL/UWNBE7uQSKchQk0SvJLtfLh785Q736tmgjsdv2AkmXaP3DwiobFcqT5Z55u/At4JStmtYbMsxpkLz74u8xHutW3sUDTR6ANpobLZGs5M/7MXzuyLyMwjrvNA30tKtDFltVM12yLibPNmBuRiDVe2odKIJSRDEb0hn36yNs8MPr0V+bXp2XcKgvfHWWIHB6lV9Chu+HuphPRchX5QZCMKALet7z5BuYLGhf9pH1Z0nVCAc1/UZltPHV94YVYLJY5+A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mYB6xWFB; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mYB6xWFB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y1m0N1VkGz2yVD
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Dec 2024 12:09:40 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 66CBE5C64E4;
	Mon,  2 Dec 2024 01:08:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C67E5C4CEDC;
	Mon,  2 Dec 2024 01:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733101778;
	bh=KoUVq0drmqDqH2C3r8/i3kiLa4MEP4LpLWyGCvNZTpc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mYB6xWFB5p3wQOx9VHLybImcjIyOOm10NEjAsKMz0V9qmNxy7Th7UPbGJo8J96+vp
	 fZmsVjnvHF4t2qe5xRLZ7LeZqfuvLl5/ym3ri7geL25mgb7TzB5ekEZB31vxqqdXwh
	 g1v8AyUfJLEr5SlG0UQZFrddNfrGVpUQMFa1AUOCpsWqj1goJns0XIJssUbF5rKT3k
	 R8voy7flPqVk0dH8j7P31ok9zo0IGEBxDbXem7pEaoQ+QIFIYjWhTZZ9FFeqJWITAx
	 G8YoYTi2/CYEZafc4fippB4FQCDX8/kv66SY8bCormq9CW8Q1uMqEKZpmdcOLr5GuQ
	 wznRVzs5HqmAg==
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
	"Darrick J. Wong" <djwong@kernel.org>,
	Theodore Ts'o <tytso@mit.edu>
Subject: [PATCH v4 16/19] ext4: switch to using the crc32c library
Date: Sun,  1 Dec 2024 17:08:41 -0800
Message-ID: <20241202010844.144356-17-ebiggers@kernel.org>
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

Now that the crc32c() library function directly takes advantage of
architecture-specific optimizations, it is unnecessary to go through the
crypto API.  Just use crc32c().  This is much simpler, and it improves
performance due to eliminating the crypto API overhead.

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
Reviewed-by: Darrick J. Wong <djwong@kernel.org>
Acked-by: Theodore Ts'o <tytso@mit.edu>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/ext4/Kconfig |  3 +--
 fs/ext4/ext4.h  | 25 +++----------------------
 fs/ext4/super.c | 15 ---------------
 3 files changed, 4 insertions(+), 39 deletions(-)

diff --git a/fs/ext4/Kconfig b/fs/ext4/Kconfig
index e20d59221fc0..c9ca41d91a6c 100644
--- a/fs/ext4/Kconfig
+++ b/fs/ext4/Kconfig
@@ -29,12 +29,11 @@ config EXT3_FS_SECURITY
 config EXT4_FS
 	tristate "The Extended 4 (ext4) filesystem"
 	select BUFFER_HEAD
 	select JBD2
 	select CRC16
-	select CRYPTO
-	select CRYPTO_CRC32C
+	select CRC32
 	select FS_IOMAP
 	select FS_ENCRYPTION_ALGS if FS_ENCRYPTION
 	help
 	  This is the next generation of the ext3 filesystem.
 
diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
index 74f2071189b2..4e7de7eaa374 100644
--- a/fs/ext4/ext4.h
+++ b/fs/ext4/ext4.h
@@ -31,11 +31,11 @@
 #include <linux/wait.h>
 #include <linux/sched/signal.h>
 #include <linux/blockgroup_lock.h>
 #include <linux/percpu_counter.h>
 #include <linux/ratelimit.h>
-#include <crypto/hash.h>
+#include <linux/crc32c.h>
 #include <linux/falloc.h>
 #include <linux/percpu-rwsem.h>
 #include <linux/fiemap.h>
 #ifdef __KERNEL__
 #include <linux/compat.h>
@@ -1660,13 +1660,10 @@ struct ext4_sb_info {
 	struct task_struct *s_mmp_tsk;
 
 	/* record the last minlen when FITRIM is called. */
 	unsigned long s_last_trim_minblks;
 
-	/* Reference to checksum algorithm driver via cryptoapi */
-	struct crypto_shash *s_chksum_driver;
-
 	/* Precomputed FS UUID checksum for seeding other checksums */
 	__u32 s_csum_seed;
 
 	/* Reclaim extents from extent status tree */
 	struct shrinker *s_es_shrinker;
@@ -2461,23 +2458,11 @@ static inline __le16 ext4_rec_len_to_disk(unsigned len, unsigned blocksize)
 #define DX_HASH_LAST 			DX_HASH_SIPHASH
 
 static inline u32 ext4_chksum(struct ext4_sb_info *sbi, u32 crc,
 			      const void *address, unsigned int length)
 {
-	struct {
-		struct shash_desc shash;
-		char ctx[4];
-	} desc;
-
-	BUG_ON(crypto_shash_descsize(sbi->s_chksum_driver)!=sizeof(desc.ctx));
-
-	desc.shash.tfm = sbi->s_chksum_driver;
-	*(u32 *)desc.ctx = crc;
-
-	BUG_ON(crypto_shash_update(&desc.shash, address, length));
-
-	return *(u32 *)desc.ctx;
+	return crc32c(crc, address, length);
 }
 
 #ifdef __KERNEL__
 
 /* hash info structure used by the directory hash */
@@ -3274,15 +3259,11 @@ extern void ext4_group_desc_csum_set(struct super_block *sb, __u32 group,
 extern int ext4_register_li_request(struct super_block *sb,
 				    ext4_group_t first_not_zeroed);
 
 static inline int ext4_has_metadata_csum(struct super_block *sb)
 {
-	WARN_ON_ONCE(ext4_has_feature_metadata_csum(sb) &&
-		     !EXT4_SB(sb)->s_chksum_driver);
-
-	return ext4_has_feature_metadata_csum(sb) &&
-	       (EXT4_SB(sb)->s_chksum_driver != NULL);
+	return ext4_has_feature_metadata_csum(sb);
 }
 
 static inline int ext4_has_group_desc_csum(struct super_block *sb)
 {
 	return ext4_has_feature_gdt_csum(sb) || ext4_has_metadata_csum(sb);
diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index 785809f33ff4..fdf4817a7dbc 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -1378,12 +1378,10 @@ static void ext4_put_super(struct super_block *sb)
 	 * Now that we are completely done shutting down the
 	 * superblock, we need to actually destroy the kobject.
 	 */
 	kobject_put(&sbi->s_kobj);
 	wait_for_completion(&sbi->s_kobj_unregister);
-	if (sbi->s_chksum_driver)
-		crypto_free_shash(sbi->s_chksum_driver);
 	kfree(sbi->s_blockgroup_lock);
 	fs_put_dax(sbi->s_daxdev, NULL);
 	fscrypt_free_dummy_policy(&sbi->s_dummy_enc_policy);
 #if IS_ENABLED(CONFIG_UNICODE)
 	utf8_unload(sb->s_encoding);
@@ -4632,19 +4630,10 @@ static int ext4_init_metadata_csum(struct super_block *sb, struct ext4_super_blo
 		return -EINVAL;
 	}
 	ext4_setup_csum_trigger(sb, EXT4_JTR_ORPHAN_FILE,
 				ext4_orphan_file_block_trigger);
 
-	/* Load the checksum driver */
-	sbi->s_chksum_driver = crypto_alloc_shash("crc32c", 0, 0);
-	if (IS_ERR(sbi->s_chksum_driver)) {
-		int ret = PTR_ERR(sbi->s_chksum_driver);
-		ext4_msg(sb, KERN_ERR, "Cannot load crc32c driver.");
-		sbi->s_chksum_driver = NULL;
-		return ret;
-	}
-
 	/* Check superblock checksum */
 	if (!ext4_superblock_csum_verify(sb, es)) {
 		ext4_msg(sb, KERN_ERR, "VFS: Found ext4 filesystem with "
 			 "invalid superblock checksum.  Run e2fsck?");
 		return -EFSBADCRC;
@@ -5685,13 +5674,10 @@ failed_mount8: __maybe_unused
 	flush_work(&sbi->s_sb_upd_work);
 	ext4_stop_mmpd(sbi);
 	del_timer_sync(&sbi->s_err_report);
 	ext4_group_desc_free(sbi);
 failed_mount:
-	if (sbi->s_chksum_driver)
-		crypto_free_shash(sbi->s_chksum_driver);
-
 #if IS_ENABLED(CONFIG_UNICODE)
 	utf8_unload(sb->s_encoding);
 #endif
 
 #ifdef CONFIG_QUOTA
@@ -7492,8 +7478,7 @@ static void __exit ext4_exit_fs(void)
 }
 
 MODULE_AUTHOR("Remy Card, Stephen Tweedie, Andrew Morton, Andreas Dilger, Theodore Ts'o and others");
 MODULE_DESCRIPTION("Fourth Extended Filesystem");
 MODULE_LICENSE("GPL");
-MODULE_SOFTDEP("pre: crc32c");
 module_init(ext4_init_fs)
 module_exit(ext4_exit_fs)
-- 
2.47.1


