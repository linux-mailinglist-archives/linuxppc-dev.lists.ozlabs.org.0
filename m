Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EA255688FB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2019 14:38:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45nNNd20PVzDqY1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2019 22:38:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (mailfrom)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+5c64b5abbef3b2c470d9+5804+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45nNL46byDzDqY1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2019 22:35:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=333E9nIrdXIgB5pI3F5Du+yckYEhniDBtjzkslPuLzI=; b=u26GNGaHTOVC3Ar+7UT5YjcQc
 RRi9cGlIeGO4FsD584ZCZMxTb2fYujRAKcjY4wFnW7Vra+4LmvSTCJIsjiCn4EcUcFfraf4pXWnHt
 4mgaeKNBKDzJaxHCii5e3MlvJ4NPaHCQKctG7F2UBYB7DSsMYBhZQfIJekEjyT/XxJDEtF0s2zkiq
 lF4z7sgiDI1qsMX3cza+kWRKcC0zdYJkO+meQcu1zK4OI7KWM5ojoaG81Eu56FZzYupTYHNRlwdde
 0nJkIiId0htKr8TjPde/5zSDgIBBVt5ncgbVpsX8/t4CiVo+4ZCzOLh79NeMyOSGcRZIZWrP5YVEq
 /NafgvukA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hn0Cq-0000hi-Ah; Mon, 15 Jul 2019 12:35:48 +0000
Date: Mon, 15 Jul 2019 05:35:48 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH kernel v4 2/4] powerpc/iommu: Allow bypass-only for DMA
Message-ID: <20190715123548.GA29453@infradead.org>
References: <20190712094509.56695-1-aik@ozlabs.ru>
 <20190712094509.56695-3-aik@ozlabs.ru>
 <20190712152044.GA3061@infradead.org>
 <1e9d2b30-015d-130e-4d83-c222f87afdc1@ozlabs.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1e9d2b30-015d-130e-4d83-c222f87afdc1@ozlabs.ru>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: Sam Bobroff <sbobroff@linux.ibm.com>,
 Alistair Popple <alistair@popple.id.au>, Christoph Hellwig <hch@infradead.org>,
 Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 15, 2019 at 06:33:00PM +1000, Alexey Kardashevskiy wrote:
> 
> 
> On 13/07/2019 01:20, Christoph Hellwig wrote:
> > > This skips the 32bit DMA setup check if the bypass is can be selected.
> > 
> > That sentence does not parse.  I think you need to dop the "can be"
> > based on the actual patch.
> 
> 
> "the 32bit DMA setup check" is
> "if (!(tbl = get_iommu_table_base(dev)))".
> 
> I can rephrase though.

What I mean is to replace

"This skips the 32bit DMA setup check if the bypass is can be selected."

with

"This skips the 32bit DMA setup check if the bypass is selected."

or alternatively:

"This skips the 32bit DMA setup check if the bypass can be selected."

but I think the first version is more accurate.
