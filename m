Return-Path: <linuxppc-dev+bounces-619-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A4E961664
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2024 20:07:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wtb9X0yH4z2y92;
	Wed, 28 Aug 2024 04:07:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724782048;
	cv=none; b=cWgg3uRuR0E7Mxq0q1f6OxxYllfvZid1Zwgu325IeNKTCpGJBfBOuOSTmEkA+IR3nGcsuBYSBhw6b+hzb866PyuIB6bBE8K7kgVHmcH6hSVt62eacYOIPv3+iNhY/TzlyHBytrR5LWtLseWwIcIvUdk7rFCH+FDSyZRvXMdt4XbH6QT9O+ghfR7D/dcqw2WG6wcYw3b0MUZ7Q0NSRtmeGmfUQyFWF96cxzWAXMVqP27EbRnxhNHNl21va8XV4PCyD0LhewAKjplvOsSQtvkZCgq9XjI3GtDA+Bgq03u6/gzE5NxmFAutKoFFc+27F6wkzEkefE8S8J/yW5X16sFlVA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724782048; c=relaxed/relaxed;
	bh=cMFRUzGSd50idQYPalZm5my++8NUVc0jvOqTeHpQTgE=;
	h=Received:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To; b=DUer3kaFXynxv9WIllLzCgkSIPLzfxdkrpRuJnzINf6AgHxrcGAI52AzhWsEV8S49Miv1si8sVwZcT1hvoE2HEdGPLIgB7uEsu/pwWsT3lCje4OKWVR5OltqYW4DVVXAC1r5nCOlCpBf1RYcgOulYyO1TpNeSUlozuN9TG5JszNqqaAPcHYdZyCIwNw6HPowHQNPcUyDwN/EyHLzD+uvMaZsPyLSbC3tkvOO+fCFx7JGcVb5aR/dBTCBSpn/mGAAfPzOe+T6GEQijLO8MpUbnnduILef834C3TPKKyBCI3f9FT9lIL7QctXvbWS7i94eNstz4Da2i8xyNPphITw5Vg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=A5Nwnhsx; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=A5Nwnhsx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wtb9W4gxVz2xtt
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 04:07:27 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F333DA4267D;
	Tue, 27 Aug 2024 18:07:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 196FAC61075;
	Tue, 27 Aug 2024 15:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724773294;
	bh=KGcgnIeqrGXeUGtQ7h7ij+LZBISHnFBEkptDoXmZ614=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A5NwnhsxDPpBnrbg2sO1mAk1tKTuzE6J3XzsrcQoXZo6r7hPqIBRfewcIiDlsB8Wa
	 GfdntBONSJwQZ11f2xZhLu/Wx8WUjk5D0quEeIcQqgsD/XeF+MbBSY/3iENF4WeCcY
	 0BIJXxFNT145BB56wigbninpTcZE7aPbxK18bOf764TDKe+62vlB6ifFJUA42Ktz+D
	 1jxYBU0CCIzpSpeOTqIL2ds92Ba2d38wKFbC4aEKosltvUUXJ5icAyrDTDmNpOT7oR
	 RCsAyCeRuSroyj88oyz6JoARKaEk+jhjCChcjYGWU8u5CmhfumDw50UU+eHN6kmzRp
	 b2dDL/qc++tcA==
Date: Tue, 27 Aug 2024 18:38:57 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Song Liu <song@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	"Pankaj Raghav (Samsung)" <kernel@pankajraghav.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Christian Brauner <brauner@kernel.org>,
	Pankaj Raghav <p.raghav@samsung.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	djwong@kernel.org, ritesh.list@gmail.com,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: linux-next: boot warning after merge of the vfs-brauner tree
Message-ID: <Zs3zEcLh5cMykkho@kernel.org>
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
> 
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

arm64 will return -EINVAL here, their code for changing memory attributes
only works on vmalloc:

	 * Let's restrict ourselves to mappings created by vmalloc (or vmap).
	 * Those are guaranteed to consist entirely of page mappings, and
	 * splitting is never needed.


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

-- 
Sincerely yours,
Mike.

