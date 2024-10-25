Return-Path: <linuxppc-dev+bounces-2602-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DED689B0E65
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2024 21:17:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XZsvN1WDBz3bdK;
	Sat, 26 Oct 2024 06:16:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729883760;
	cv=none; b=fYNfjyA0hCb0SBCDMGzwF8z0lXMcK86CqZpCOkn7OeDa0WrJAYDY7wCW0+X4mYetf88ZD2sE02kzj76/CCelPlIzS5fc77FVBRsiXiddXfsHY8n01DgIwCbhFPMt/NTvudjaYtXB2oxZhS0mNYnvoHJSp4kP+eV6qXvlMHROuby8lHGAUW6bI/kkrPswytErb2rnjjQl2yZH9pCprt6HlhMHaaQP+VRVUHj9wTs7+nDtCtvPoLhxe/pzuhmaCBYNLnf+QKIINcgNY910B9U+U+sogvaj1y0o9PjvWt75Nw6Hc2HHnYbGaULDCQiss12FLrXutJCobRZ4eEwtDJgU4g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729883760; c=relaxed/relaxed;
	bh=rMnm9AwgmDXEuc2yh8LmdqCJvJnHE1qDq44Z13ehTrw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BwyfCK1OQwcuW85GW34wHaM94vBeFOv0/d06AEt1ExgN64hk4mD1Dje+3uU5xMBUnU6PyuntK7lRAAG/OH0QzVC2l9bHo5pcDkjuybJk2QLkr7NwFJ6Qywortizj9HCdRjtCVZ3B3N5VJ0gTDmsonC37iejeGcT3ocFXsyr9OnDpPIesRYtb46/LqbMJcPj//LK+TXiwPJigEOyZYPK0UIw3UffF6Zf1d1/wEKsgb9dEM5rwUHGcU/dAPYwbc6zvlcVvvWuyO9dH1ki4fTuBFpGNzo5Yudn7RCBA9jcDigExLiAvHIEoHMjSVEZ1yYHEa3dGow+PNLKrvchBrYEMWg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uCCwJHNY; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uCCwJHNY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XZsvK39dhz3bjg
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Oct 2024 06:15:56 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CF5535C59B9;
	Fri, 25 Oct 2024 19:15:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47B18C4CEE5;
	Fri, 25 Oct 2024 19:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729883753;
	bh=WfN2SwQ1SfAPzqKDOcxOjX9pk3UC1SwykLtsIrx3B8I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uCCwJHNYYf343z6r1gEo9PunPQGR1ODph4209rcKOCpQYQ+Z9cKoDHqLtaqlEYjIN
	 2z+sKje/XEHhSVs1cW9BMdxxPDBwY/8FQEVauYvT4cXN2A4iOYNINsY5i0l8MCF3Ai
	 8q8X0FhxnigxeUIMEBJmTPwhzbSWVaA9MFxkKUhwN8wIFBFZxp4tuHQutYqCnUlmWV
	 cqk5IIIqvbKBQzhnndsielpobBKgJOaBd54yeDLDV1uZhFlv57rqiHuzwNWxJcKnNA
	 +UiwI5ZIfG85E83/zepiJUyaJTVqaFMCjzmt83JkiUljxXtaIcF4uNjlFC9cXsmWEg
	 OwXqjgm4rW7jQ==
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
Subject: [PATCH v2 17/18] f2fs: switch to using the crc32 library
Date: Fri, 25 Oct 2024 12:14:53 -0700
Message-ID: <20241025191454.72616-18-ebiggers@kernel.org>
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
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Eric Biggers <ebiggers@google.com>

Now that the crc32() library function takes advantage of
architecture-specific optimizations, it is unnecessary to go through the
crypto API.  Just use crc32().  This is much simpler, and it improves
performance due to eliminating the crypto API overhead.

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/f2fs/Kconfig |  3 +--
 fs/f2fs/f2fs.h  | 19 +------------------
 fs/f2fs/super.c | 15 ---------------
 3 files changed, 2 insertions(+), 35 deletions(-)

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
index 33f5449dc22d..1fc5c2743c8d 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1761,13 +1761,10 @@ struct f2fs_sb_info {
 
 	/* For write statistics */
 	u64 sectors_written_start;
 	u64 kbytes_written;
 
-	/* Reference to checksum algorithm driver via cryptoapi */
-	struct crypto_shash *s_chksum_driver;
-
 	/* Precomputed FS UUID checksum for seeding other checksums */
 	__u32 s_chksum_seed;
 
 	struct workqueue_struct *post_read_wq;	/* post read workqueue */
 
@@ -1941,25 +1938,11 @@ static inline unsigned int f2fs_time_to_wait(struct f2fs_sb_info *sbi,
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
index 87ab5696bd48..003d3bcb0caa 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1670,12 +1670,10 @@ static void f2fs_put_super(struct super_block *sb)
 
 	f2fs_destroy_post_read_wq(sbi);
 
 	kvfree(sbi->ckpt);
 
-	if (sbi->s_chksum_driver)
-		crypto_free_shash(sbi->s_chksum_driver);
 	kfree(sbi->raw_super);
 
 	f2fs_destroy_page_array_cache(sbi);
 	f2fs_destroy_xattr_caches(sbi);
 #ifdef CONFIG_QUOTA
@@ -4419,19 +4417,10 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
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
@@ -4872,12 +4861,10 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
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
@@ -5080,7 +5067,5 @@ module_init(init_f2fs_fs)
 module_exit(exit_f2fs_fs)
 
 MODULE_AUTHOR("Samsung Electronics's Praesto Team");
 MODULE_DESCRIPTION("Flash Friendly File System");
 MODULE_LICENSE("GPL");
-MODULE_SOFTDEP("pre: crc32");
-
-- 
2.47.0


