Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C5E55F681
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 08:26:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXs1N67spz3bvb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 16:26:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qbFJAtMX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+44e008d3d1050f0f992b+6884+infradead.org+hch@bombadil.srs.infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qbFJAtMX;
	dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXs0n5Wsbz3035
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jun 2022 16:26:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=hGxicrNA0Ky21SHQ+zvPyQeSEbMbEJ671RYnbrPw0JA=; b=qbFJAtMX0xKPZ1ARuRDdID37q4
	owWkofTOSGtlKKGTJhARtkYpPKzHltLGhkndQA87MkODaY6KyO3cK4q808MkXZcOU40psAis3jQba
	hIlFNsykvnaIIUvqvKn2j1RZrQIeveQo7JYMztumkKhMbvD1zMb+mAEHnE6ESPqZza5WuXR5gF7PV
	n41lGSXcUPlvzAaeQHQhfM7f39UWgRCFoNb11FKul4UW/Ow1CvhldL3c1YOUP0JDldI562o45tZwg
	o0wAWuANXSfL/2mp0QfYSlqVUMbLFqDf0nTTu2Vp3DOLQ3j8ak5hAwUNMCSyw4o2Ir79RVMA1BFMh
	i++X3W8g==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6R8w-009lUE-5F; Wed, 29 Jun 2022 06:25:42 +0000
Date: Tue, 28 Jun 2022 23:25:42 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH v2 3/3] arch/*/: remove CONFIG_VIRT_TO_BUS
Message-ID: <YrvwZi9NQSpFjStX@infradead.org>
References: <20220617125750.728590-1-arnd@kernel.org>
 <20220617125750.728590-4-arnd@kernel.org>
 <6ba86afe-bf9f-1aca-7af1-d0d348d75ffc@gmail.com>
 <CAMuHMdVewn0OYA9oJfStk0-+vCKAUou+4Mvd5H2kmrSks1p5jg@mail.gmail.com>
 <b4e5a1c9-e375-63fb-ec7c-abb7384a6d59@gmail.com>
 <9289fd82-285c-035f-5355-4d70ce4f87b0@gmail.com>
 <CAK8P3a1ivqYB38c_QTjG8e85ZBnCB6HEa-6LR1HDc8shG1Pwmw@mail.gmail.com>
 <b1edec96-ccb2-49d6-323b-1abc0dc37a50@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b1edec96-ccb2-49d6-323b-1abc0dc37a50@gmail.com>
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

On Wed, Jun 29, 2022 at 09:38:00AM +1200, Michael Schmitz wrote:
> That's one of the 'liberties' I alluded to. The reason I left these in is
> that I'm none too certain what device feature the DMA API uses to decide a
> device isn't cache-coherent.

The DMA API does not look at device features at all.  It needs to be
told so by the platform code.  Once an architecture implements the
hooks to support non-coherent DMA all devices are treated as
non-coherent by default unless overriden by the architecture either
globally (using the global dma_default_coherent variable) or per-device
(using the dev->dma_coherent field, usually set by arch_setup_dma_ops).

> If it's dev->coherent_dma_mask, the way I set
> up the device in the a3000 driver should leave the coherent mask unchanged.
> For the Zorro drivers, devices are set up to use the same storage to store
> normal and coherent masks - something we most likely want to change. I need
> to think about the ramifications of that.

No, the coherent mask is slightly misnamed amd not actually related.
