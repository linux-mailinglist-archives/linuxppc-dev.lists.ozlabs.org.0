Return-Path: <linuxppc-dev+bounces-556-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0768595FCB0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2024 00:24:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wt4wt5dp3z2xGW;
	Tue, 27 Aug 2024 08:24:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:7c80:54:3::133"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724708486;
	cv=none; b=SejMrhT77jCsVIiA0mQOAEXI5rZeWlgShLYLvhvp5H8x49mNJz90DW4fBuFHgku8OTii/r7zwLjsZiCpChjzfB7gQ5L7kaUzZ7oYA3nDdxp59amg8Z+3vwwGQkG9s1MgtTc8aS5XkxSj1xJr1h6PNUF2+eaNNwyNEmdEzB7y5RZLa4xY6NgaGCL88eVBx2nFXeGuzp2XM72aelo+fGOumd5Q2N5bQhfnfs/q6/E1f9gZ0V04kUIa/PVWg9xdj50QoByF+yPz1nY8h7O9zMsnIJVLkBzc7gpl8uQKH3zTGJ1+IjLjVNsgdW3k3AfTdOvUHAdNGj3NbH35LrkiH2fQFg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724708486; c=relaxed/relaxed;
	bh=v/qPBUyTJLcxrocLg1eH+X9CRl0z59P294XRmU1JRP8=;
	h=DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:Sender; b=ZI/lQdBz1fIP7ShPSs7/UOaa9BIhIYOM36U/EXc/QZYdtUKpVUtHo4GR/Gx1+aMgLSzKsApG2du61qrUGHz39NBeVCYke2dRHaE6QxhDK4kP6mNqxa/D2qWFLD7db4dklKhBCat/uGdQ4VIAm2W+sBlaYmmI5cJIUwEJgrk7tvHPwqe1xGhyhWPF1g7zXF7m8ymOdbD26ZN3QnXlY7AE+N2qw0j5p1SSbyOzS64Ea0LcDocl0YWGSXTdQJYTSvDr07NEJZSFJKQ7zirK2rXcg5PG5Lx3N2j4j/EODS1eWfAIVoG0rfqZ72VJQtPFLMjXBcQ1t9jrr0DJJgZS5WbWYw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bbn5Usiy; dkim-atps=neutral; spf=none (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=mcgrof@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bbn5Usiy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=mcgrof@infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wt3yt4HS3z2yHL
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 07:41:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description;
	bh=v/qPBUyTJLcxrocLg1eH+X9CRl0z59P294XRmU1JRP8=; b=bbn5Usiy6rh8dv+WfLE48zIl0u
	QBiFgXQ9Onw8NP+eZE8TqpXG45ia3z2KzJIA05muwyaWbqv7TPgPMenUE+3Jo41ekskkUYZSO51lP
	nU/JBxP0pdRux/JzjT1majLelDhhphtVmGukWpM80Y9UBKsTNSAWvWuHh22dC1atZcuxyo45s+c7p
	BIwWiNNFy4nhjrScK7H48/5TXlMg3y5Yr9e7hMjVpgxdzG0gkM8LB5sHYpdIJPkEFQo4cGBLFwILI
	9ofmoxGAtv79hll0LQjThYwbLNV8eB7jRJQ8NOoGkYyO0BzWD0brLhSitfQnIwjwFyI4XF87dI+J5
	u5pBOhzw==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sihSi-00000008qoj-3orJ;
	Mon, 26 Aug 2024 21:41:20 +0000
Date: Mon, 26 Aug 2024 14:41:20 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: "Darrick J. Wong" <djwong@kernel.org>
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
Message-ID: <Zsz2gGgORfeVkVfG@bombadil.infradead.org>
References: <20240826175931.1989f99e@canb.auug.org.au>
 <20240826154818.hzqnvofdmaxvuwrh@quentin>
 <b0fe75b4-c1bb-47f7-a7c3-2534b31c1780@csgroup.eu>
 <ZszrJkFOpiy5rCma@bombadil.infradead.org>
 <20240826211049.GC6082@frogsfrogsfrogs>
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
In-Reply-To: <20240826211049.GC6082@frogsfrogsfrogs>
Sender: Luis Chamberlain <mcgrof@infradead.org>

On Mon, Aug 26, 2024 at 02:10:49PM -0700, Darrick J. Wong wrote:
> On Mon, Aug 26, 2024 at 01:52:54PM -0700, Luis Chamberlain wrote:
> > On Mon, Aug 26, 2024 at 07:43:20PM +0200, Christophe Leroy wrote:
> > > 
> > > 
> > > Le 26/08/2024 à 17:48, Pankaj Raghav (Samsung) a écrit :
> > > > On Mon, Aug 26, 2024 at 05:59:31PM +1000, Stephen Rothwell wrote:
> > > > > Hi all,
> > > > > 
> > > > > After merging the vfs-brauner tree, today's linux-next boot test (powerpc
> > > > > pseries_le_defconfig) produced this warning:
> > > > 
> > > > iomap dio calls set_memory_ro() on the page that is used for sub block
> > > > zeroing.
> > > > 
> > > > But looking at powerpc code, they don't support set_memory_ro() for
> > > > memory region that belongs to the kernel(LINEAR_MAP_REGION_ID).
> > > > 
> > > > /*
> > > >   * On hash, the linear mapping is not in the Linux page table so
> > > >   * apply_to_existing_page_range() will have no effect. If in the future
> > > >   * the set_memory_* functions are used on the linear map this will need
> > > >   * to be updated.
> > > >   */
> > > > if (!radix_enabled()) {
> > > >          int region = get_region_id(addr);
> > > > 
> > > >          if (WARN_ON_ONCE(region != VMALLOC_REGION_ID && region != IO_REGION_ID))
> > > >                  return -EINVAL;
> > > > }
> > > > 
> > > > We call set_memory_ro() on the zero page as a extra security measure.
> > > > I don't know much about powerpc, but looking at the comment, is it just
> > > > adding the following to support it in powerpc:
> > > > 
> > > > diff --git a/arch/powerpc/mm/pageattr.c b/arch/powerpc/mm/pageattr.c
> > > > index ac22bf28086fa..e6e0b40ba6db4 100644
> > > > --- a/arch/powerpc/mm/pageattr.c
> > > > +++ b/arch/powerpc/mm/pageattr.c
> > > > @@ -94,7 +94,9 @@ int change_memory_attr(unsigned long addr, int numpages, long action)
> > > >          if (!radix_enabled()) {
> > > >                  int region = get_region_id(addr);
> > > > -               if (WARN_ON_ONCE(region != VMALLOC_REGION_ID && region != IO_REGION_ID))
> > > > +               if (WARN_ON_ONCE(region != VMALLOC_REGION_ID &&
> > > > +                                region != IO_REGION_ID &&
> > > > +                                region != LINEAR_MAP_REGION_ID))
> > > >                          return -EINVAL;
> > > >          }
> > > >   #endif
> > > 
> > > By doing this you will just hide the fact that it didn't work.
> > > 
> > > See commit 1f9ad21c3b38 ("powerpc/mm: Implement set_memory() routines") for
> > > details. The linear memory region is not mapped using page tables so
> > > set_memory_ro() will have no effect on it.
> > > 
> > > You can either use vmalloc'ed pages, or do a const static allocation at
> > > buildtime so that it will be allocated in the kernel static rodata area.
> > > 
> > > By the way, your code should check the value returned by set_memory_ro(),
> > > there is some work in progress to make it mandatory, see
> > > https://github.com/KSPP/linux/issues/7
> > 
> > Our users expect contiguous memory [0] and so we use alloc_pages() here,
> > so if we're architecture limitted by this I'd rather we just remove the
> > set_memory_ro() only for PPC, I don't see why other have to skip this.
> 
> Just drop it, then.

OK sent a patch for that.

  Luis

