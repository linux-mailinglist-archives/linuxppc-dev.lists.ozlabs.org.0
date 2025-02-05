Return-Path: <linuxppc-dev+bounces-5862-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4865A28B24
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Feb 2025 14:03:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yp0m94xl3z2yYy;
	Thu,  6 Feb 2025 00:03:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738760617;
	cv=none; b=jR5TxkHGe4TgF9nn9qi3U6xmhIdoOtsHzrMzHANIGjnJe1JiikqeQkq5+Twnj68UmsQLphxH29vzDOrinq9iYd16NG9dG7SwSqUtKXjKpzkAH5SVe0vcMjM+CLHzKoK0EE6MVGDUrUHPN4lMKE7GAIlooqcQDxIIgHLOBQ4v/243OfZJovdmorjhQCsXnN6sQi2gTKR++mB9iqrnZAXfltuhg9cX0GsUMNKuTSqURkKY2skPTYH64Jnzr9b1gJoqxlOh4X9QdUXIcSgNgq0kVyMeq/V9TQInUDdDO7XxbOWH8+OZKP6HmnFrGp+Kwsc/eI25z6wjLCDsd6hsel7GJA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738760617; c=relaxed/relaxed;
	bh=l83Dw368hueJll8PyntCW0Nb5bpCWlX4zt8mq3uaKys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U+lXHaGzgjUskLf+wWV9mj1Pg6PpHuBF6jVY401hWiBBS3EqbuRICORXO3BUKoS8d/viH0HOHj+Pd7DR+uSdub4v6VIH7unH//jL9eQ3DLueziyx0uQA4RBSlJGrYQ1fMCLcTx6KaYzaJRNpagE2ryKIbxEXlkM8WM042pfQfaXBSJOUXXEh7KhfzIT0tYlCQiUp5LOXyzXqR2eV0vyHP4aSveR4zj+XC6X4TF2lPXUs0M1/k7+2LDagwg/zPVnowDCh2dWVhWZW1a18rfOXujeIhE8rZQNoSrvfCNEf/y6CLxEPXD+eXVWrKdwDw8/H2KCAGwGnMWDDvsIS3dGNAA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=e8xyOu9s; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=e8xyOu9s; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=vgoyal@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=e8xyOu9s;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=e8xyOu9s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=vgoyal@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yp0m84vbtz2yDp
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Feb 2025 00:03:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738760610;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l83Dw368hueJll8PyntCW0Nb5bpCWlX4zt8mq3uaKys=;
	b=e8xyOu9suDOEhyW1mYGaLKcIJGBjrcqeVXECLhKDkkSK9/9WxBUmeLY8jPukXrRwHvqZUT
	idD6vGpmfT7frs/Ir/O6HV0g1JSs8RfHN2RzPcQh65CJKBZVfWgY7/6USJxKzvuQ9EeeMS
	5Z34rgC89sFvm/ChZyDIFZ44EbS9338=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738760610;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l83Dw368hueJll8PyntCW0Nb5bpCWlX4zt8mq3uaKys=;
	b=e8xyOu9suDOEhyW1mYGaLKcIJGBjrcqeVXECLhKDkkSK9/9WxBUmeLY8jPukXrRwHvqZUT
	idD6vGpmfT7frs/Ir/O6HV0g1JSs8RfHN2RzPcQh65CJKBZVfWgY7/6USJxKzvuQ9EeeMS
	5Z34rgC89sFvm/ChZyDIFZ44EbS9338=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-491-1l4K9GaVMGO1d3Se1A4h_Q-1; Wed,
 05 Feb 2025 08:03:26 -0500
X-MC-Unique: 1l4K9GaVMGO1d3Se1A4h_Q-1
X-Mimecast-MFC-AGG-ID: 1l4K9GaVMGO1d3Se1A4h_Q
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5FC961801A0D;
	Wed,  5 Feb 2025 13:03:19 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.22.80.186])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 72B8C3000197;
	Wed,  5 Feb 2025 13:03:15 +0000 (UTC)
Received: by fedora.redhat.com (Postfix, from userid 1000)
	id A724B6AA37D; Wed,  5 Feb 2025 08:03:13 -0500 (EST)
Date: Wed, 5 Feb 2025 08:03:13 -0500
From: Vivek Goyal <vgoyal@redhat.com>
To: Alistair Popple <apopple@nvidia.com>
Cc: akpm@linux-foundation.org, dan.j.williams@intel.com, linux-mm@kvack.org,
	alison.schofield@intel.com, lina@asahilina.net,
	zhang.lyra@gmail.com, gerald.schaefer@linux.ibm.com,
	vishal.l.verma@intel.com, dave.jiang@intel.com, logang@deltatee.com,
	bhelgaas@google.com, jack@suse.cz, jgg@ziepe.ca,
	catalin.marinas@arm.com, will@kernel.org, mpe@ellerman.id.au,
	npiggin@gmail.com, dave.hansen@linux.intel.com, ira.weiny@intel.com,
	willy@infradead.org, djwong@kernel.org, tytso@mit.edu,
	linmiaohe@huawei.com, david@redhat.com, peterx@redhat.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	nvdimm@lists.linux.dev, linux-cxl@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
	david@fromorbit.com, chenhuacai@kernel.org, kernel@xen0n.name,
	loongarch@lists.linux.dev, Hanna Czenczek <hreitz@redhat.com>,
	German Maglione <gmaglione@redhat.com>
Subject: Re: [PATCH v6 01/26] fuse: Fix dax truncate/punch_hole fault path
Message-ID: <Z6NhkR8ZEso4F-Wx@redhat.com>
References: <cover.11189864684e31260d1408779fac9db80122047b.1736488799.git-series.apopple@nvidia.com>
 <bfae590045c7fc37b7ccef10b9cec318012979fd.1736488799.git-series.apopple@nvidia.com>
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
In-Reply-To: <bfae590045c7fc37b7ccef10b9cec318012979fd.1736488799.git-series.apopple@nvidia.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Jan 10, 2025 at 05:00:29PM +1100, Alistair Popple wrote:
> FS DAX requires file systems to call into the DAX layout prior to unlinking
> inodes to ensure there is no ongoing DMA or other remote access to the
> direct mapped page. The fuse file system implements
> fuse_dax_break_layouts() to do this which includes a comment indicating
> that passing dmap_end == 0 leads to unmapping of the whole file.
> 
> However this is not true - passing dmap_end == 0 will not unmap anything
> before dmap_start, and further more dax_layout_busy_page_range() will not
> scan any of the range to see if there maybe ongoing DMA access to the
> range. Fix this by passing -1 for dmap_end to fuse_dax_break_layouts()
> which will invalidate the entire file range to
> dax_layout_busy_page_range().

Hi Alistair,

Thanks for fixing DAX related issues for virtiofs. I am wondering how are
you testing DAX with virtiofs. AFAIK, we don't have DAX support in Rust
virtiofsd. C version of virtiofsd used to have out of the tree patches
for DAX. But C version got deprecated long time ago.

Do you have another implementation of virtiofsd somewhere else which
supports DAX and allows for testing DAX related changes?

Thanks
Vivek

> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Co-developed-by: Dan Williams <dan.j.williams@intel.com>
> Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> Fixes: 6ae330cad6ef ("virtiofs: serialize truncate/punch_hole and dax fault path")
> Cc: Vivek Goyal <vgoyal@redhat.com>
> 
> ---
> 
> Changes for v6:
> 
>  - Original patch had a misplaced hunk due to a bad rebase.
>  - Reworked fix based on Dan's comments.
> ---
>  fs/fuse/dax.c  | 1 -
>  fs/fuse/dir.c  | 2 +-
>  fs/fuse/file.c | 4 ++--
>  3 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/fuse/dax.c b/fs/fuse/dax.c
> index 9abbc2f..455c4a1 100644
> --- a/fs/fuse/dax.c
> +++ b/fs/fuse/dax.c
> @@ -681,7 +681,6 @@ static int __fuse_dax_break_layouts(struct inode *inode, bool *retry,
>  			0, 0, fuse_wait_dax_page(inode));
>  }
>  
> -/* dmap_end == 0 leads to unmapping of whole file */
>  int fuse_dax_break_layouts(struct inode *inode, u64 dmap_start,
>  				  u64 dmap_end)
>  {
> diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
> index 0b2f856..bc6c893 100644
> --- a/fs/fuse/dir.c
> +++ b/fs/fuse/dir.c
> @@ -1936,7 +1936,7 @@ int fuse_do_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
>  	if (FUSE_IS_DAX(inode) && is_truncate) {
>  		filemap_invalidate_lock(mapping);
>  		fault_blocked = true;
> -		err = fuse_dax_break_layouts(inode, 0, 0);
> +		err = fuse_dax_break_layouts(inode, 0, -1);
>  		if (err) {
>  			filemap_invalidate_unlock(mapping);
>  			return err;
> diff --git a/fs/fuse/file.c b/fs/fuse/file.c
> index 082ee37..cef7a8f 100644
> --- a/fs/fuse/file.c
> +++ b/fs/fuse/file.c
> @@ -253,7 +253,7 @@ static int fuse_open(struct inode *inode, struct file *file)
>  
>  	if (dax_truncate) {
>  		filemap_invalidate_lock(inode->i_mapping);
> -		err = fuse_dax_break_layouts(inode, 0, 0);
> +		err = fuse_dax_break_layouts(inode, 0, -1);
>  		if (err)
>  			goto out_inode_unlock;
>  	}
> @@ -2890,7 +2890,7 @@ static long fuse_file_fallocate(struct file *file, int mode, loff_t offset,
>  	inode_lock(inode);
>  	if (block_faults) {
>  		filemap_invalidate_lock(inode->i_mapping);
> -		err = fuse_dax_break_layouts(inode, 0, 0);
> +		err = fuse_dax_break_layouts(inode, 0, -1);
>  		if (err)
>  			goto out;
>  	}
> -- 
> git-series 0.9.1
> 


