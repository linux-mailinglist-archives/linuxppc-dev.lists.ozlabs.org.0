Return-Path: <linuxppc-dev+bounces-555-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 507D695FC0B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2024 23:49:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wt47q1ZwJz2yTs;
	Tue, 27 Aug 2024 07:49:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724706653;
	cv=none; b=M9qdL6fwJw8WYrs8/pUb8oDUYW40+aNXoIlf0Q+Bj+hnbfLjGyDmWxBT4n6kNx2TCHu1NzF/SmlstxkkNvaxvSzd8W9mrLKIV226ohwKezbOhZz7Gs3Psh1Ta8hXyrWG9FkCJM6qDvizBKE8VtdX2CfkaEs7Ub8kcfr9O3pEXI3dTpu+9Zr7O2E/kZOF9MgfttzocyGcBpd45yxM2YERfa4Z/jA+aGFpQbku8Q9rqQZ9XE95yIwL6sExTKC6N7oOh9bfCOibWcB8xJrpH7wjAOziRy5zciEQz2vnfW3CUbO23qFlPvGRdzJ4wMScyxBZ/xmHRGEBsvlYDgcI/GqxIA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724706653; c=relaxed/relaxed;
	bh=g9yO9R8hzeYCLEWovCUY8xjwHa2WgsW9nLM7ygMC0tw=;
	h=Received:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To; b=VMVr25no0hNweS4LcnbV5Ca7WDd9YoqYY2pgasBbIl/nU6sYM1cCYiX4EByRM63vum+WpqDXQyvqChOTr6LA7XQ7sOZNaMLJ6pRW290W1BWqrHlEkWA8BE3VVk0AlJerSpUCS/tK528nDUasQOy/NK64+D8gOGCZrAVXlnF3SYxW90j52rLXfgwYgW7mRCtih2sqjqNYEgY5lcruR/eJlSLUxW2rimNO6o2HgzUtKuiOByqnbLXUsMT+tIm7Ki1Ddj/u97h86QtCIbPUVFbZee2ofTqnWml1UMyg737O7+045NrccOIGthnqYd3nBSNS/+9SQOdXWIMm6rIRODDRjw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VYrEMCtc; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=djwong@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VYrEMCtc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=djwong@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wt3Hc6hCYz2y8g
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 07:10:52 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4A37EA40D43;
	Mon, 26 Aug 2024 21:10:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6C24C8B7A3;
	Mon, 26 Aug 2024 21:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724706649;
	bh=AxCDnE68GkibdBOqxqO4LPCEcA6Whks6cJ8JZTKjBPs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VYrEMCtcNUMwRshAkVUKWPuZnPgDNHy323ItS4fI/kicK71U6NPSp1usTwi7354pl
	 hFopOTgWELk0s96Wk2WT02U2fg62QmmA2FTitwMc7cjHv5NDOJQWZA2v/kUvzC2j3c
	 buudB2bK1tl/A1SYLsnXin/3siqhcmBAM8c+fUbRsUgMT+sI1NFbgQLlSLWxtPznng
	 K93QRs8uRRffpzAAycHhUJLuqRMFejV0YShFQMzfS9B1rCrsyuzS4E0LEGpbhW7Hux
	 kZOS51+4yeu6qHWqaMIcyt5/GP4vthBofNwRGnafqRDxsFTq5RKGU+ULidZc0RWV1a
	 CFjZys8lpouEQ==
Date: Mon, 26 Aug 2024 14:10:49 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Mike Rapoport <rppt@kernel.org>, Song Liu <song@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	"Pankaj Raghav (Samsung)" <kernel@pankajraghav.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Christian Brauner <brauner@kernel.org>,
	Pankaj Raghav <p.raghav@samsung.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	ritesh.list@gmail.com, linuxppc-dev@lists.ozlabs.org
Subject: Re: linux-next: boot warning after merge of the vfs-brauner tree
Message-ID: <20240826211049.GC6082@frogsfrogsfrogs>
References: <20240826175931.1989f99e@canb.auug.org.au>
 <20240826154818.hzqnvofdmaxvuwrh@quentin>
 <b0fe75b4-c1bb-47f7-a7c3-2534b31c1780@csgroup.eu>
 <ZszrJkFOpiy5rCma@bombadil.infradead.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZszrJkFOpiy5rCma@bombadil.infradead.org>

On Mon, Aug 26, 2024 at 01:52:54PM -0700, Luis Chamberlain wrote:
> On Mon, Aug 26, 2024 at 07:43:20PM +0200, Christophe Leroy wrote:
> > 
> > 
> > Le 26/08/2024 à 17:48, Pankaj Raghav (Samsung) a écrit :
> > > On Mon, Aug 26, 2024 at 05:59:31PM +1000, Stephen Rothwell wrote:
> > > > Hi all,
> > > > 
> > > > After merging the vfs-brauner tree, today's linux-next boot test (powerpc
> > > > pseries_le_defconfig) produced this warning:
> > > 
> > > iomap dio calls set_memory_ro() on the page that is used for sub block
> > > zeroing.
> > > 
> > > But looking at powerpc code, they don't support set_memory_ro() for
> > > memory region that belongs to the kernel(LINEAR_MAP_REGION_ID).
> > > 
> > > /*
> > >   * On hash, the linear mapping is not in the Linux page table so
> > >   * apply_to_existing_page_range() will have no effect. If in the future
> > >   * the set_memory_* functions are used on the linear map this will need
> > >   * to be updated.
> > >   */
> > > if (!radix_enabled()) {
> > >          int region = get_region_id(addr);
> > > 
> > >          if (WARN_ON_ONCE(region != VMALLOC_REGION_ID && region != IO_REGION_ID))
> > >                  return -EINVAL;
> > > }
> > > 
> > > We call set_memory_ro() on the zero page as a extra security measure.
> > > I don't know much about powerpc, but looking at the comment, is it just
> > > adding the following to support it in powerpc:
> > > 
> > > diff --git a/arch/powerpc/mm/pageattr.c b/arch/powerpc/mm/pageattr.c
> > > index ac22bf28086fa..e6e0b40ba6db4 100644
> > > --- a/arch/powerpc/mm/pageattr.c
> > > +++ b/arch/powerpc/mm/pageattr.c
> > > @@ -94,7 +94,9 @@ int change_memory_attr(unsigned long addr, int numpages, long action)
> > >          if (!radix_enabled()) {
> > >                  int region = get_region_id(addr);
> > > -               if (WARN_ON_ONCE(region != VMALLOC_REGION_ID && region != IO_REGION_ID))
> > > +               if (WARN_ON_ONCE(region != VMALLOC_REGION_ID &&
> > > +                                region != IO_REGION_ID &&
> > > +                                region != LINEAR_MAP_REGION_ID))
> > >                          return -EINVAL;
> > >          }
> > >   #endif
> > 
> > By doing this you will just hide the fact that it didn't work.
> > 
> > See commit 1f9ad21c3b38 ("powerpc/mm: Implement set_memory() routines") for
> > details. The linear memory region is not mapped using page tables so
> > set_memory_ro() will have no effect on it.
> > 
> > You can either use vmalloc'ed pages, or do a const static allocation at
> > buildtime so that it will be allocated in the kernel static rodata area.
> > 
> > By the way, your code should check the value returned by set_memory_ro(),
> > there is some work in progress to make it mandatory, see
> > https://github.com/KSPP/linux/issues/7
> 
> Our users expect contiguous memory [0] and so we use alloc_pages() here,
> so if we're architecture limitted by this I'd rather we just remove the
> set_memory_ro() only for PPC, I don't see why other have to skip this.

Just drop it, then.

--D

> diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
> index c02b266bba52..aba5cde89e14 100644
> --- a/fs/iomap/direct-io.c
> +++ b/fs/iomap/direct-io.c
> @@ -775,14 +775,22 @@ EXPORT_SYMBOL_GPL(iomap_dio_rw);
>  
>  static int __init iomap_dio_init(void)
>  {
> +	int ret;
> +
>  	zero_page = alloc_pages(GFP_KERNEL | __GFP_ZERO,
>  				IOMAP_ZERO_PAGE_ORDER);
>  
>  	if (!zero_page)
>  		return -ENOMEM;
>  
> -	set_memory_ro((unsigned long)page_address(zero_page),
> -		      1U << IOMAP_ZERO_PAGE_ORDER);
> -	return 0;
> +	if (IS_ENABLED(CONFIG_PPC))
> +		return 0;
> +
> +	ret = set_memory_ro((unsigned long)page_address(zero_page),
> +			    1U << IOMAP_ZERO_PAGE_ORDER);
> +	if (ret)
> +		free_pages((unsigned long) zero_page, IOMAP_ZERO_PAGE_ORDER);
> +
> +	return ret;
>  }
>  fs_initcall(iomap_dio_init);
> 
> Thoughts?
> 
> [0] https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git/commit/?h=vfs.blocksize&id=d940b3b7b76b409b0550fdf2de6dc2183f01526f
> 
>   Luis

