Return-Path: <linuxppc-dev+bounces-554-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4D995FBFE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2024 23:47:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wt46G2rgdz2yNn;
	Tue, 27 Aug 2024 07:47:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:7c80:54:3::133"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724705592;
	cv=none; b=ZuSY4bkOSy4iFbXNhMlZLGq3keOqExm8FW3jHGpNnBPb8hy6R4Jm6h4FRm3fIiNWs9ZxMoXM8BPQkTiicRRb2RwwOlUpNr+4SNV3FNlaocNBWezMfebYDGI6Z/8UpINQQ9admKxoDY7qoNMhBx2J+W/lufseN7ggxHm3oXcsrPlbh6ENBcCe83X7r0LxmGX0Q2Y8367/NcygaENiGS0apOAxJ+D7YnVcombkn6fp79coVCnzaHge/nydnCn1GVWVhepE5gmVaB0TDT5D3p0eselBn1whXt82oOmEjxIw/rCUhSlLhFsWlLO74zew25kaoxRgObvNnrrsvOvmpGmplg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724705592; c=relaxed/relaxed;
	bh=c73EoVltrEzE0c3SyNvy5fA/Z+sXixymI3hZW3zbr5I=;
	h=DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:Sender; b=RNUgPXClZXdAPnasvWDyK7Axn8Ye0y7KtGyqF9gGtz0s0bwEpJKgIdY0Sr3FGC1in8Cs3jW/nEfkrb2fOnokRidOOVkAHXwjaPqMCgHOFNWfYlqhVMa01MK0OgqjRqcQfBlpDN5LnBVteSzaAIXHaG3epiyBwtzs1frrgJwN35amLAlNZUAuLw1dwnlK5U+3kL85hVktMEswR3EdoOtrf/rnDVIyOs52WuF1Qkq5ZPvDlvfqCYFh7HnvTrarhKSXsfo8TSJQbziNyT9zHFCQVVUuHiS5/Pb8OO37+IE79pGi00guf+GaIMnvDQN3gsWNSltOMVp8KHMuw+QVHQ3v1w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=none (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=mcgrof@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=mcgrof@infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wt2v73dGtz2xbY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 06:53:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description;
	bh=c73EoVltrEzE0c3SyNvy5fA/Z+sXixymI3hZW3zbr5I=; b=0aX/dEnDFs7ExvKfulvsUlzm08
	2P0Puk/riOn9G3On2v2UnJNhjLz6qV/Ya6Vv025TYXvaLeIhUszqUAY33XtZ+6vxTtT2kMg5XKO2I
	OpOYchEen13o/RlJCxpwqDLLqzbZUjCRq6BqftC6Ep4ZvTxvLU3Z7FfL8b0r6GvIEIpp3sIPPMQE5
	253k68FRucS9fTPXtgKx8gZoGPpZ2ajMjRlk/lFvB4Mevlb1AzCGD4bQIYyierI/DHNtyecvF21X7
	1ZqyB47bTiI7TtOfw+KGNjUENmigQhZWes0hD7T/xXFe8QIMepEFVIfyyzwalW633Ls6yfJRfGRsz
	1zM4L9Wg==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sighr-00000008hBX-07xX;
	Mon, 26 Aug 2024 20:52:55 +0000
Date: Mon, 26 Aug 2024 13:52:54 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Mike Rapoport <rppt@kernel.org>, Song Liu <song@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: "Pankaj Raghav (Samsung)" <kernel@pankajraghav.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Christian Brauner <brauner@kernel.org>,
	Pankaj Raghav <p.raghav@samsung.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	djwong@kernel.org, ritesh.list@gmail.com,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: linux-next: boot warning after merge of the vfs-brauner tree
Message-ID: <ZszrJkFOpiy5rCma@bombadil.infradead.org>
References: <20240826175931.1989f99e@canb.auug.org.au>
 <20240826154818.hzqnvofdmaxvuwrh@quentin>
 <b0fe75b4-c1bb-47f7-a7c3-2534b31c1780@csgroup.eu>
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
In-Reply-To: <b0fe75b4-c1bb-47f7-a7c3-2534b31c1780@csgroup.eu>
Sender: Luis Chamberlain <mcgrof@infradead.org>

On Mon, Aug 26, 2024 at 07:43:20PM +0200, Christophe Leroy wrote:
> 
> 
> Le 26/08/2024 à 17:48, Pankaj Raghav (Samsung) a écrit :
> > On Mon, Aug 26, 2024 at 05:59:31PM +1000, Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > After merging the vfs-brauner tree, today's linux-next boot test (powerpc
> > > pseries_le_defconfig) produced this warning:
> > 
> > iomap dio calls set_memory_ro() on the page that is used for sub block
> > zeroing.
> > 
> > But looking at powerpc code, they don't support set_memory_ro() for
> > memory region that belongs to the kernel(LINEAR_MAP_REGION_ID).
> > 
> > /*
> >   * On hash, the linear mapping is not in the Linux page table so
> >   * apply_to_existing_page_range() will have no effect. If in the future
> >   * the set_memory_* functions are used on the linear map this will need
> >   * to be updated.
> >   */
> > if (!radix_enabled()) {
> >          int region = get_region_id(addr);
> > 
> >          if (WARN_ON_ONCE(region != VMALLOC_REGION_ID && region != IO_REGION_ID))
> >                  return -EINVAL;
> > }
> > 
> > We call set_memory_ro() on the zero page as a extra security measure.
> > I don't know much about powerpc, but looking at the comment, is it just
> > adding the following to support it in powerpc:
> > 
> > diff --git a/arch/powerpc/mm/pageattr.c b/arch/powerpc/mm/pageattr.c
> > index ac22bf28086fa..e6e0b40ba6db4 100644
> > --- a/arch/powerpc/mm/pageattr.c
> > +++ b/arch/powerpc/mm/pageattr.c
> > @@ -94,7 +94,9 @@ int change_memory_attr(unsigned long addr, int numpages, long action)
> >          if (!radix_enabled()) {
> >                  int region = get_region_id(addr);
> > -               if (WARN_ON_ONCE(region != VMALLOC_REGION_ID && region != IO_REGION_ID))
> > +               if (WARN_ON_ONCE(region != VMALLOC_REGION_ID &&
> > +                                region != IO_REGION_ID &&
> > +                                region != LINEAR_MAP_REGION_ID))
> >                          return -EINVAL;
> >          }
> >   #endif
> 
> By doing this you will just hide the fact that it didn't work.
> 
> See commit 1f9ad21c3b38 ("powerpc/mm: Implement set_memory() routines") for
> details. The linear memory region is not mapped using page tables so
> set_memory_ro() will have no effect on it.
> 
> You can either use vmalloc'ed pages, or do a const static allocation at
> buildtime so that it will be allocated in the kernel static rodata area.
> 
> By the way, your code should check the value returned by set_memory_ro(),
> there is some work in progress to make it mandatory, see
> https://github.com/KSPP/linux/issues/7

Our users expect contiguous memory [0] and so we use alloc_pages() here,
so if we're architecture limitted by this I'd rather we just remove the
set_memory_ro() only for PPC, I don't see why other have to skip this.

diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
index c02b266bba52..aba5cde89e14 100644
--- a/fs/iomap/direct-io.c
+++ b/fs/iomap/direct-io.c
@@ -775,14 +775,22 @@ EXPORT_SYMBOL_GPL(iomap_dio_rw);
 
 static int __init iomap_dio_init(void)
 {
+	int ret;
+
 	zero_page = alloc_pages(GFP_KERNEL | __GFP_ZERO,
 				IOMAP_ZERO_PAGE_ORDER);
 
 	if (!zero_page)
 		return -ENOMEM;
 
-	set_memory_ro((unsigned long)page_address(zero_page),
-		      1U << IOMAP_ZERO_PAGE_ORDER);
-	return 0;
+	if (IS_ENABLED(CONFIG_PPC))
+		return 0;
+
+	ret = set_memory_ro((unsigned long)page_address(zero_page),
+			    1U << IOMAP_ZERO_PAGE_ORDER);
+	if (ret)
+		free_pages((unsigned long) zero_page, IOMAP_ZERO_PAGE_ORDER);
+
+	return ret;
 }
 fs_initcall(iomap_dio_init);

Thoughts?

[0] https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git/commit/?h=vfs.blocksize&id=d940b3b7b76b409b0550fdf2de6dc2183f01526f

  Luis

