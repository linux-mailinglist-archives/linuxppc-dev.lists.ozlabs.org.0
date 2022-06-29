Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 404D755F678
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 08:22:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXrxC1PJvz3cDR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 16:22:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=h3tAd+nN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+44e008d3d1050f0f992b+6884+infradead.org+hch@bombadil.srs.infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=h3tAd+nN;
	dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXrwY4qYCz3bm0
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jun 2022 16:22:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=7yGusf/8BpHfB7jofxMw85tVuHPTi4bAH8G5H2jvBjY=; b=h3tAd+nNN81Dil4eXw2Lk4CyNH
	1475Vuy94bgqSj2tu5/1Xr1gZBM2KPknL6JamvXFdmFANrhSnUNOxMiUStNCzqyfBbttb80rJi566
	DVlH1oD5tJgtAmhEidd4yafSARpW45WIOCWo6aEhVwxyQXijFQI8BaFSYdwwRjF/FcXRSqfarrS4w
	yMHV9DjHfI9xh/1Wx6/1z+DAEu5EHm1h+9Cz1lixjewEncE5xNCDuhFMiqMKmak/YED18c9DEiTkF
	shw99ZN5InGSE/X3yex04M0RucunRXqykifZ7stOcSWbnTFGj/qcYAa7QU52JML8NJVd3Ta4itXpg
	3vrA5osg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6R5C-009kw7-RG; Wed, 29 Jun 2022 06:21:50 +0000
Date: Tue, 28 Jun 2022 23:21:50 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH v2 3/3] arch/*/: remove CONFIG_VIRT_TO_BUS
Message-ID: <YrvvfpW4MmQiM47H@infradead.org>
References: <20220617125750.728590-1-arnd@kernel.org>
 <20220617125750.728590-4-arnd@kernel.org>
 <6ba86afe-bf9f-1aca-7af1-d0d348d75ffc@gmail.com>
 <CAMuHMdVewn0OYA9oJfStk0-+vCKAUou+4Mvd5H2kmrSks1p5jg@mail.gmail.com>
 <b4e5a1c9-e375-63fb-ec7c-abb7384a6d59@gmail.com>
 <9289fd82-285c-035f-5355-4d70ce4f87b0@gmail.com>
 <CAMuHMdXUihTPD9A9hs__Xr2ErfOqkZ5KgCHqm+9HvRf39uS5kA@mail.gmail.com>
 <c30bc9b6-6ccd-8856-dc6b-4e16450dad6f@gmail.com>
 <CAK8P3a1rxEVwVF5U-PO6pQkfURU5Tro1Qp8SPUfHEV9jjWOmCQ@mail.gmail.com>
 <9f812d3d-0fcd-46e6-6d7e-6d4bf66f24ab@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9f812d3d-0fcd-46e6-6d7e-6d4bf66f24ab@gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Linux-Arch <linux-arch@vger.kernel.org>, scsi <linux-scsi@vger.kernel.org>, Christoph Hellwig <hch@infradead.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Jakub Kicinski <kuba@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Miquel van Smoorenburg <mikevs@xs4all.net>, Denis Efremov <efremov@linux.com>, linux-m68k <linux-m68k@lists.linux-m68k.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Khalid Aziz <khalid@gonehiking.org>, Arnd Bergmann <arnd@kernel.org>, Parisc List <linux-parisc@vger.kernel.org>, Robin Murphy <robin.murphy@arm.com>, Matt Wang <wwentao@vmware.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mark Salyzyn <salyzyn@android.com>, Linux IOMMU <iommu@lists.linux-foundation.org>, alpha <linux-alpha@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "Maciej W . Rozycki" <macro@orcam.me.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 29, 2022 at 11:09:00AM +1200, Michael Schmitz wrote:
> And all SCSI buffers are allocated using kmalloc? No way at all for user
> space to pass unaligned data?

Most that you will see actually comes from the page allocator.  But
the block layer has a dma_alignment limit, and when userspace sends
I/O that is not properly aligned it will be bounce buffered before
it it sent to the driver.
