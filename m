Return-Path: <linuxppc-dev+bounces-5010-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 049FFA097D5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2025 17:50:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YV71x3Tbxz3cYB;
	Sat, 11 Jan 2025 03:50:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736527829;
	cv=none; b=SnBthUoBU31dnD+lz5lm79xLvOwYBb/KMCjJzAGbfZF6Bfc3Jholvy0SSFP718HAt9+yFlhaYlDnSHrbZz0omxY6WXqW9W9cZ0HtJKljzNFrfFBP+laUPkp2Nb1HeRKDGqhpV4HAABZUACYMlu0Tldlfa69YVBt4jmRREIGIXsB9V17ErzxQAlw1XfQPGGo9hcrWkP174e6S0A0JNC5ke2zObk6VGS0bpIqdIWCxbl04NCFMiP4s97oDfJjNd1LSZPw2JTgw6eW2A9N488OxOCGeXE+Oo5XBqFGnLtc9j6C/gDJgBlLCOiMcHbXJqaaiFY3lpP/afys/JEoe1fAaHw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736527829; c=relaxed/relaxed;
	bh=/93gIfNRCZiMxEmSj2TX6IXIp0P4kiXAW8ER/WjSBW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M6ocdphG6EmuLXEdufM4+n2/ERBHagDNUVhDBxQwzNmUMHba+Wz/zOyC/PQ5AXj6NkQiD3VCvRabU00+xb0G+iHV/y4QKU+gOoxGK2PtXysqpcByPt8rlwtsbVaUkvqw2w6fuY9l3VMC5K83I5bQbNNQMwgM3STyaxP1QauU67cCb1pzGl+jgqtezRwvDoJgFKEEMjLI1OZatAbd/IantlMjJQcCOXvvn0ZJ9rAq6Pzab/KffRZGjetKusdgDyBzvN2L9FkNowlPQZB/Rm1BCpPHJXtxxJDiH7ybKU96hlyhpzegU7YfFfCHah12oCdqE0Ty0t0uvx8/Dh7GFeqjmw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=vHRV9nyq; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=djwong@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=vHRV9nyq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=djwong@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YV71w1rP4z3cCb
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jan 2025 03:50:28 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6AA7B5C1109;
	Fri, 10 Jan 2025 16:49:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09E81C4CED6;
	Fri, 10 Jan 2025 16:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736527820;
	bh=5VSUGSu9BR1n/nKzKdICXzahPQ4soShf72WzqIUuGnE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vHRV9nyqpL+Ro7f3yAiw9q++PTaPDuF/ivKV9lmJ4Ukmz/yQRbrjnqsoGlttY/XBE
	 Hq9zsm1IRvDBUJnmkp4CMx5ZoJwmszsP87Mt6ywM6PqXIwvlKTF6CPT/tknjZuZk7j
	 w8Vnd87saIzejPxlLTyqpOGOqOhVoMYtwGiWX5Qe3IUJCaT066yCqLUUrgRR5rdbMj
	 ty7WZb3SdAG0Y0EjvRRAXWvRACRC9iMC0RVfZTAL3YY9+yQVa2QyyJhQn6G9vgxX4P
	 CiyXkEafzE/5RH7p1+fdiZxkwvvPC6ygb5InHSPPT0iJ2/hXirT2MXnGJ0/qT2Axab
	 jaN+omHLMWPwQ==
Date: Fri, 10 Jan 2025 08:50:19 -0800
From: "Darrick J. Wong" <djwong@kernel.org>
To: Alistair Popple <apopple@nvidia.com>
Cc: akpm@linux-foundation.org, dan.j.williams@intel.com, linux-mm@kvack.org,
	alison.schofield@intel.com, lina@asahilina.net,
	zhang.lyra@gmail.com, gerald.schaefer@linux.ibm.com,
	vishal.l.verma@intel.com, dave.jiang@intel.com, logang@deltatee.com,
	bhelgaas@google.com, jack@suse.cz, jgg@ziepe.ca,
	catalin.marinas@arm.com, will@kernel.org, mpe@ellerman.id.au,
	npiggin@gmail.com, dave.hansen@linux.intel.com, ira.weiny@intel.com,
	willy@infradead.org, tytso@mit.edu, linmiaohe@huawei.com,
	david@redhat.com, peterx@redhat.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, nvdimm@lists.linux.dev,
	linux-cxl@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org,
	jhubbard@nvidia.com, hch@lst.de, david@fromorbit.com,
	chenhuacai@kernel.org, kernel@xen0n.name, loongarch@lists.linux.dev
Subject: Re: [PATCH v6 07/26] fs/dax: Ensure all pages are idle prior to
 filesystem unmount
Message-ID: <20250110165019.GK6156@frogsfrogsfrogs>
References: <cover.11189864684e31260d1408779fac9db80122047b.1736488799.git-series.apopple@nvidia.com>
 <704662ae360abeb777ed00efc6f8f232a79ae4ff.1736488799.git-series.apopple@nvidia.com>
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
In-Reply-To: <704662ae360abeb777ed00efc6f8f232a79ae4ff.1736488799.git-series.apopple@nvidia.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Jan 10, 2025 at 05:00:35PM +1100, Alistair Popple wrote:
> File systems call dax_break_mapping() prior to reallocating file
> system blocks to ensure the page is not undergoing any DMA or other
> accesses. Generally this is needed when a file is truncated to ensure
> that if a block is reallocated nothing is writing to it. However
> filesystems currently don't call this when an FS DAX inode is evicted.
> 
> This can cause problems when the file system is unmounted as a page
> can continue to be under going DMA or other remote access after
> unmount. This means if the file system is remounted any truncate or
> other operation which requires the underlying file system block to be
> freed will not wait for the remote access to complete. Therefore a
> busy block may be reallocated to a new file leading to corruption.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> 
> ---
> 
> Changes for v5:
> 
>  - Don't wait for pages to be idle in non-DAX mappings
> ---
>  fs/dax.c            | 29 +++++++++++++++++++++++++++++
>  fs/ext4/inode.c     | 32 ++++++++++++++------------------
>  fs/xfs/xfs_inode.c  |  9 +++++++++
>  fs/xfs/xfs_inode.h  |  1 +
>  fs/xfs/xfs_super.c  | 18 ++++++++++++++++++
>  include/linux/dax.h |  2 ++
>  6 files changed, 73 insertions(+), 18 deletions(-)
> 
> diff --git a/fs/dax.c b/fs/dax.c
> index 7008a73..4e49cc4 100644
> --- a/fs/dax.c
> +++ b/fs/dax.c
> @@ -883,6 +883,14 @@ static int wait_page_idle(struct page *page,
>  				TASK_INTERRUPTIBLE, 0, 0, cb(inode));
>  }
>  
> +static void wait_page_idle_uninterruptible(struct page *page,
> +					void (cb)(struct inode *),
> +					struct inode *inode)
> +{
> +	___wait_var_event(page, page_ref_count(page) == 1,
> +			TASK_UNINTERRUPTIBLE, 0, 0, cb(inode));
> +}
> +
>  /*
>   * Unmaps the inode and waits for any DMA to complete prior to deleting the
>   * DAX mapping entries for the range.
> @@ -911,6 +919,27 @@ int dax_break_mapping(struct inode *inode, loff_t start, loff_t end,
>  }
>  EXPORT_SYMBOL_GPL(dax_break_mapping);
>  
> +void dax_break_mapping_uninterruptible(struct inode *inode,
> +				void (cb)(struct inode *))
> +{
> +	struct page *page;
> +
> +	if (!dax_mapping(inode->i_mapping))
> +		return;
> +
> +	do {
> +		page = dax_layout_busy_page_range(inode->i_mapping, 0,
> +						LLONG_MAX);
> +		if (!page)
> +			break;
> +
> +		wait_page_idle_uninterruptible(page, cb, inode);
> +	} while (true);
> +
> +	dax_delete_mapping_range(inode->i_mapping, 0, LLONG_MAX);
> +}
> +EXPORT_SYMBOL_GPL(dax_break_mapping_uninterruptible);
> +
>  /*
>   * Invalidate DAX entry if it is clean.
>   */
> diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
> index ee8e83f..fa35161 100644
> --- a/fs/ext4/inode.c
> +++ b/fs/ext4/inode.c
> @@ -163,6 +163,18 @@ int ext4_inode_is_fast_symlink(struct inode *inode)
>  	       (inode->i_size < EXT4_N_BLOCKS * 4);
>  }
>  
> +static void ext4_wait_dax_page(struct inode *inode)
> +{
> +	filemap_invalidate_unlock(inode->i_mapping);
> +	schedule();
> +	filemap_invalidate_lock(inode->i_mapping);
> +}
> +
> +int ext4_break_layouts(struct inode *inode)
> +{
> +	return dax_break_mapping_inode(inode, ext4_wait_dax_page);
> +}
> +
>  /*
>   * Called at the last iput() if i_nlink is zero.
>   */
> @@ -181,6 +193,8 @@ void ext4_evict_inode(struct inode *inode)
>  
>  	trace_ext4_evict_inode(inode);
>  
> +	dax_break_mapping_uninterruptible(inode, ext4_wait_dax_page);
> +
>  	if (EXT4_I(inode)->i_flags & EXT4_EA_INODE_FL)
>  		ext4_evict_ea_inode(inode);
>  	if (inode->i_nlink) {
> @@ -3902,24 +3916,6 @@ int ext4_update_disksize_before_punch(struct inode *inode, loff_t offset,
>  	return ret;
>  }
>  
> -static void ext4_wait_dax_page(struct inode *inode)
> -{
> -	filemap_invalidate_unlock(inode->i_mapping);
> -	schedule();
> -	filemap_invalidate_lock(inode->i_mapping);
> -}
> -
> -int ext4_break_layouts(struct inode *inode)
> -{
> -	struct page *page;
> -	int error;
> -
> -	if (WARN_ON_ONCE(!rwsem_is_locked(&inode->i_mapping->invalidate_lock)))
> -		return -EINVAL;
> -
> -	return dax_break_mapping_inode(inode, ext4_wait_dax_page);
> -}
> -
>  /*
>   * ext4_punch_hole: punches a hole in a file by releasing the blocks
>   * associated with the given offset and length
> diff --git a/fs/xfs/xfs_inode.c b/fs/xfs/xfs_inode.c
> index 4410b42..c7ec5ab 100644
> --- a/fs/xfs/xfs_inode.c
> +++ b/fs/xfs/xfs_inode.c
> @@ -2997,6 +2997,15 @@ xfs_break_dax_layouts(
>  	return dax_break_mapping_inode(inode, xfs_wait_dax_page);
>  }
>  
> +void
> +xfs_break_dax_layouts_uninterruptible(
> +	struct inode		*inode)
> +{
> +	xfs_assert_ilocked(XFS_I(inode), XFS_MMAPLOCK_EXCL);
> +
> +	dax_break_mapping_uninterruptible(inode, xfs_wait_dax_page);
> +}
> +
>  int
>  xfs_break_layouts(
>  	struct inode		*inode,
> diff --git a/fs/xfs/xfs_inode.h b/fs/xfs/xfs_inode.h
> index c4f03f6..613797a 100644
> --- a/fs/xfs/xfs_inode.h
> +++ b/fs/xfs/xfs_inode.h
> @@ -594,6 +594,7 @@ xfs_itruncate_extents(
>  }
>  
>  int	xfs_break_dax_layouts(struct inode *inode);
> +void xfs_break_dax_layouts_uninterruptible(struct inode *inode);
>  int	xfs_break_layouts(struct inode *inode, uint *iolock,
>  		enum layout_break_reason reason);
>  
> diff --git a/fs/xfs/xfs_super.c b/fs/xfs/xfs_super.c
> index 8524b9d..73ec060 100644
> --- a/fs/xfs/xfs_super.c
> +++ b/fs/xfs/xfs_super.c
> @@ -751,6 +751,23 @@ xfs_fs_drop_inode(
>  	return generic_drop_inode(inode);
>  }
>  
> +STATIC void
> +xfs_fs_evict_inode(
> +	struct inode		*inode)
> +{
> +	struct xfs_inode	*ip = XFS_I(inode);
> +	uint			iolock = XFS_IOLOCK_EXCL | XFS_MMAPLOCK_EXCL;
> +
> +	if (IS_DAX(inode)) {
> +		xfs_ilock(ip, iolock);
> +		xfs_break_dax_layouts_uninterruptible(inode);
> +		xfs_iunlock(ip, iolock);

If we're evicting the inode, why is it necessary to take i_rwsem and the
mmap invalidation lock?  Shouldn't the evicting thread be the only one
with access to this inode?

--D

> +	}
> +
> +	truncate_inode_pages_final(&inode->i_data);
> +	clear_inode(inode);
> +}
> +
>  static void
>  xfs_mount_free(
>  	struct xfs_mount	*mp)
> @@ -1189,6 +1206,7 @@ static const struct super_operations xfs_super_operations = {
>  	.destroy_inode		= xfs_fs_destroy_inode,
>  	.dirty_inode		= xfs_fs_dirty_inode,
>  	.drop_inode		= xfs_fs_drop_inode,
> +	.evict_inode		= xfs_fs_evict_inode,
>  	.put_super		= xfs_fs_put_super,
>  	.sync_fs		= xfs_fs_sync_fs,
>  	.freeze_fs		= xfs_fs_freeze,
> diff --git a/include/linux/dax.h b/include/linux/dax.h
> index ef9e02c..7c3773f 100644
> --- a/include/linux/dax.h
> +++ b/include/linux/dax.h
> @@ -274,6 +274,8 @@ static inline int __must_check dax_break_mapping_inode(struct inode *inode,
>  {
>  	return dax_break_mapping(inode, 0, LLONG_MAX, cb);
>  }
> +void dax_break_mapping_uninterruptible(struct inode *inode,
> +				void (cb)(struct inode *));
>  int dax_dedupe_file_range_compare(struct inode *src, loff_t srcoff,
>  				  struct inode *dest, loff_t destoff,
>  				  loff_t len, bool *is_same,
> -- 
> git-series 0.9.1
> 

