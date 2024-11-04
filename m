Return-Path: <linuxppc-dev+bounces-2838-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CB09BB9AF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Nov 2024 17:01:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xhx6Y3zp5z2yN4;
	Tue,  5 Nov 2024 03:01:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730736101;
	cv=none; b=VQ8j7xoiywxdvTUARsaykRNn47JRhJxSA7WOc0TUZOitFTJ+6bCYOiz3pPtn/9IIK9Yf+46tIz/S+3AePDR4yTP73+EgO/Z0zh+athNVudcJvEyfvbEDoYR6jYN4NXViAt7TjkvCRaLSoWyKljn+jFD28+8doBoRSe5GzsypgOWs60xlKdEFVfAJF3j+yY4rKAvyf4jUX7kgWmyEYtFTdXyUaAsJM53sp8l6JBxXt6hr7/FKyt3fpkA81mo4FwpRzTLdaCsd1uDYmJQBoiVAU3KMC+KATZ90L29Nrp5VHLlijl/UgdI4Xf78JBdAV3SZw3rDcHznlJhkNZcv/jCwng==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730736101; c=relaxed/relaxed;
	bh=/3tf6qB0uNDj0tIN2sPkbiUJnNiJ1F76fe2CWlQv4l4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iPCMVHb2wXebqbThN/nk7hD2cfh1u826iaye6SNYJ7+gpyYarTu/JSBvskFRAfbye2EKcywUOoclnnVxpKHqdrDrHfVtMu+EzeRfl73whwI2q2rss53tiO53mRCFI6HpiUvYvjNtCdD2rhFbxttBGqqk9HjYzGLi38vqhdnCb+DOXE3uzI6mQ/iwfZvG9e64YLBRGeh9kkL/AjQHCs0EZo60duYQ6eBVTLamzYNhf5yAg6upTpUW3dZnfn9ziw+sElpkdvJ6mh/aYJq6oUIhOhoakJPPmrWV8xRVTHSYxpCZ+Y8k/gkc0aPnJwgtzT2pgdF9E/2Ph/ZDmfMqZZbMaQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GF2YIuc4; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=djwong@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GF2YIuc4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=djwong@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xhx6X2vnKz2yFD
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Nov 2024 03:01:40 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E0FBCA430DC;
	Mon,  4 Nov 2024 15:59:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B77D6C4CED5;
	Mon,  4 Nov 2024 16:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730736096;
	bh=SQHYc4IyKu8mOjFqukKmu+jd++SJy0bOaTpjzH1zd48=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GF2YIuc4CVA74hCEJRxNazy0ht2/f2uRSrMj2uuVlRr2+6bm9MHyMOxPgED5gWdfd
	 vu/btCDpPKcR89gCE4boBa7J2FWpbAQKucuszoilTcpd5UqEHi33T6ME/J0vsprSzf
	 0NpNP7g8Lf0u8I2Tp+IyHewzcvy5bMkfYKuB/Xdsg/e84RXsus/eIlJEp8GjkqeL5j
	 5fqNWCa8VU2Mv2/RgFzjCgTISgsehTXVWzYy6ZXnFPpxAb3NlOlHfEu2nHn72iPu6S
	 FWp0lFEOw27J/+6wKGPWbDh+8AzGKSxVQQw4nnlSj7QGkkzccsfYrt7HYY4CaOPaa1
	 sXnIfXCpLXWpg==
Date: Mon, 4 Nov 2024 08:01:36 -0800
From: "Darrick J. Wong" <djwong@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org, x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH v3 16/18] jbd2: switch to using the crc32c library
Message-ID: <20241104160136.GI21832@frogsfrogsfrogs>
References: <20241103223154.136127-1-ebiggers@kernel.org>
 <20241103223154.136127-17-ebiggers@kernel.org>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241103223154.136127-17-ebiggers@kernel.org>
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, Nov 03, 2024 at 02:31:52PM -0800, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Now that the crc32c() library function directly takes advantage of
> architecture-specific optimizations, it is unnecessary to go through the
> crypto API.  Just use crc32c().  This is much simpler, and it improves
> performance due to eliminating the crypto API overhead.
> 
> Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  fs/jbd2/Kconfig      |  2 --
>  fs/jbd2/journal.c    | 25 ++-----------------------
>  include/linux/jbd2.h | 31 +++----------------------------
>  3 files changed, 5 insertions(+), 53 deletions(-)
> 
> diff --git a/fs/jbd2/Kconfig b/fs/jbd2/Kconfig
> index 4ad2c67f93f1..9c19e1512101 100644
> --- a/fs/jbd2/Kconfig
> +++ b/fs/jbd2/Kconfig
> @@ -1,11 +1,9 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  config JBD2
>  	tristate
>  	select CRC32
> -	select CRYPTO
> -	select CRYPTO_CRC32C
>  	help
>  	  This is a generic journaling layer for block devices that support
>  	  both 32-bit and 64-bit block numbers.  It is currently used by
>  	  the ext4 and OCFS2 filesystems, but it could also be used to add
>  	  journal support to other file systems or block devices such
> diff --git a/fs/jbd2/journal.c b/fs/jbd2/journal.c
> index 97f487c3d8fc..56cea5a738a7 100644
> --- a/fs/jbd2/journal.c
> +++ b/fs/jbd2/journal.c
> @@ -1373,24 +1373,16 @@ static int journal_check_superblock(journal_t *journal)
>  		printk(KERN_ERR "JBD2: Can't enable checksumming v1 and v2/3 "
>  		       "at the same time!\n");
>  		return err;
>  	}
>  
> -	/* Load the checksum driver */
>  	if (jbd2_journal_has_csum_v2or3_feature(journal)) {
>  		if (sb->s_checksum_type != JBD2_CRC32C_CHKSUM) {
>  			printk(KERN_ERR "JBD2: Unknown checksum type\n");
>  			return err;
>  		}
>  
> -		journal->j_chksum_driver = crypto_alloc_shash("crc32c", 0, 0);
> -		if (IS_ERR(journal->j_chksum_driver)) {
> -			printk(KERN_ERR "JBD2: Cannot load crc32c driver.\n");
> -			err = PTR_ERR(journal->j_chksum_driver);
> -			journal->j_chksum_driver = NULL;
> -			return err;
> -		}
>  		/* Check superblock checksum */
>  		if (sb->s_checksum != jbd2_superblock_csum(journal, sb)) {
>  			printk(KERN_ERR "JBD2: journal checksum error\n");
>  			err = -EFSBADCRC;
>  			return err;
> @@ -1611,12 +1603,10 @@ static journal_t *journal_init_common(struct block_device *bdev,
>  
>  	return journal;
>  
>  err_cleanup:
>  	percpu_counter_destroy(&journal->j_checkpoint_jh_count);
> -	if (journal->j_chksum_driver)
> -		crypto_free_shash(journal->j_chksum_driver);
>  	kfree(journal->j_wbuf);
>  	jbd2_journal_destroy_revoke(journal);
>  	journal_fail_superblock(journal);
>  	kfree(journal);
>  	return ERR_PTR(err);
> @@ -2194,12 +2184,10 @@ int jbd2_journal_destroy(journal_t *journal)
>  	if (journal->j_proc_entry)
>  		jbd2_stats_proc_exit(journal);
>  	iput(journal->j_inode);
>  	if (journal->j_revoke)
>  		jbd2_journal_destroy_revoke(journal);
> -	if (journal->j_chksum_driver)
> -		crypto_free_shash(journal->j_chksum_driver);
>  	kfree(journal->j_fc_wbuf);
>  	kfree(journal->j_wbuf);
>  	kfree(journal);
>  
>  	return err;
> @@ -2340,23 +2328,14 @@ int jbd2_journal_set_features(journal_t *journal, unsigned long compat,
>  			pr_err("JBD2: Cannot enable fast commits.\n");
>  			return 0;
>  		}
>  	}
>  
> -	/* Load the checksum driver if necessary */
> -	if ((journal->j_chksum_driver == NULL) &&
> -	    INCOMPAT_FEATURE_ON(JBD2_FEATURE_INCOMPAT_CSUM_V3)) {
> -		journal->j_chksum_driver = crypto_alloc_shash("crc32c", 0, 0);
> -		if (IS_ERR(journal->j_chksum_driver)) {
> -			printk(KERN_ERR "JBD2: Cannot load crc32c driver.\n");
> -			journal->j_chksum_driver = NULL;
> -			return 0;
> -		}
> -		/* Precompute checksum seed for all metadata */
> +	/* Precompute checksum seed for all metadata */
> +	if (INCOMPAT_FEATURE_ON(JBD2_FEATURE_INCOMPAT_CSUM_V3))
>  		journal->j_csum_seed = jbd2_chksum(journal, ~0, sb->s_uuid,
>  						   sizeof(sb->s_uuid));
> -	}
>  
>  	lock_buffer(journal->j_sb_buffer);
>  
>  	/* If enabling v3 checksums, update superblock */
>  	if (INCOMPAT_FEATURE_ON(JBD2_FEATURE_INCOMPAT_CSUM_V3)) {
> diff --git a/include/linux/jbd2.h b/include/linux/jbd2.h
> index 8aef9bb6ad57..33d25a3d15f1 100644
> --- a/include/linux/jbd2.h
> +++ b/include/linux/jbd2.h
> @@ -26,11 +26,11 @@
>  #include <linux/mutex.h>
>  #include <linux/timer.h>
>  #include <linux/slab.h>
>  #include <linux/bit_spinlock.h>
>  #include <linux/blkdev.h>
> -#include <crypto/hash.h>
> +#include <linux/crc32c.h>
>  #endif
>  
>  #define journal_oom_retry 1
>  
>  /*
> @@ -1239,17 +1239,10 @@ struct journal_s
>  	 * An opaque pointer to fs-private information.  ext3 puts its
>  	 * superblock pointer here.
>  	 */
>  	void *j_private;
>  
> -	/**
> -	 * @j_chksum_driver:
> -	 *
> -	 * Reference to checksum algorithm driver via cryptoapi.
> -	 */
> -	struct crypto_shash *j_chksum_driver;
> -
>  	/**
>  	 * @j_csum_seed:
>  	 *
>  	 * Precomputed journal UUID checksum for seeding other checksums.
>  	 */
> @@ -1748,14 +1741,11 @@ static inline bool jbd2_journal_has_csum_v2or3_feature(journal_t *j)
>  	return jbd2_has_feature_csum2(j) || jbd2_has_feature_csum3(j);
>  }
>  
>  static inline int jbd2_journal_has_csum_v2or3(journal_t *journal)
>  {
> -	WARN_ON_ONCE(jbd2_journal_has_csum_v2or3_feature(journal) &&
> -		     journal->j_chksum_driver == NULL);
> -
> -	return journal->j_chksum_driver != NULL;
> +	return jbd2_journal_has_csum_v2or3_feature(journal);

Same comment as my last reply about removing trivial helpers, but
otherwise
Reviewed-by: Darrick J. Wong <djwong@kernel.org>

If you push this for 6.13 I'd be happy that the shash junk finally went
away.  The onstack struct desc thing in the _chksum() functions was by
far the most sketchy part of the ext4/jbd2 metadata csum project. :)

--D

>  }
>  
>  static inline int jbd2_journal_get_num_fc_blks(journal_superblock_t *jsb)
>  {
>  	int num_fc_blocks = be32_to_cpu(jsb->s_num_fc_blks);
> @@ -1794,26 +1784,11 @@ static inline unsigned long jbd2_log_space_left(journal_t *journal)
>  #define JBD_MAX_CHECKSUM_SIZE 4
>  
>  static inline u32 jbd2_chksum(journal_t *journal, u32 crc,
>  			      const void *address, unsigned int length)
>  {
> -	struct {
> -		struct shash_desc shash;
> -		char ctx[JBD_MAX_CHECKSUM_SIZE];
> -	} desc;
> -	int err;
> -
> -	BUG_ON(crypto_shash_descsize(journal->j_chksum_driver) >
> -		JBD_MAX_CHECKSUM_SIZE);
> -
> -	desc.shash.tfm = journal->j_chksum_driver;
> -	*(u32 *)desc.ctx = crc;
> -
> -	err = crypto_shash_update(&desc.shash, address, length);
> -	BUG_ON(err);
> -
> -	return *(u32 *)desc.ctx;
> +	return crc32c(crc, address, length);
>  }
>  
>  /* Return most recent uncommitted transaction */
>  static inline tid_t  jbd2_get_latest_transaction(journal_t *journal)
>  {
> -- 
> 2.47.0
> 
> 

