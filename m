Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6865E6890D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2019 14:41:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45nNSf0C6KzDqZP
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2019 22:41:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (mailfrom)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+5c64b5abbef3b2c470d9+5804+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="ApIrRfiC"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45nNQC68S6zDqY1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2019 22:39:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=65TnoM2oaQ3WgSoLRf+BGMAHwlCkm7JpUfvdAzrb7kI=; b=ApIrRfiCq/rJHwXg6TAw356Op
 V9QpDAr8B6zeIMAOJwqe5hnlZNXBq7S99NFNcE5jeLn8hVMtxJI8St3PdtoxvlEz0/OrI/HgyXNfY
 sY9iDx27VVyF1JxKbkRJOkJEte9VvUBeZUGesQ+Mr/7fI2tm8wdByYfC0KDOA18qgyo7y8jaXHrgH
 zbcJh3AuevGsutWpz7YBGK11spNsf/zbyFqSgyAA+UNwi9+7Wr2l/Wj3PoJxTPWbmVBxvbihHH8WV
 Ddu6dp9J9KyU+9EMORz49iC0QkqjcPjCauckClkx8n3e3jGQqcFW7RDjwf5vNA+/SiJE6kerdiFML
 STm7WXIow==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hn0GO-0001mn-EP; Mon, 15 Jul 2019 12:39:28 +0000
Date: Mon, 15 Jul 2019 05:39:28 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH kernel v4 0/4 repost] powerpc/ioda2: Yet another attempt
 to allow DMA masks between 32 and 59
Message-ID: <20190715123928.GB29453@infradead.org>
References: <20190712094509.56695-1-aik@ozlabs.ru>
 <20190712152800.GC3061@infradead.org>
 <44fe9d2e-0793-13f9-e0eb-4ff649e229a5@ozlabs.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <44fe9d2e-0793-13f9-e0eb-4ff649e229a5@ozlabs.ru>
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

On Mon, Jul 15, 2019 at 06:43:12PM +1000, Alexey Kardashevskiy wrote:
> > e.g. if you have a DMA that supports 40-bit DMA addressing we could
> > always treat it as if supports 32-bit addressing,and I thought the
> > powerpc code does that,
> 
> powerpc does that and this is what the patchset is changing as people
> complained that 2GB DMA window has bad effects on AMD GPUs (cannot allocate
> enough buffers) and 40/100Gbit devices (lower performance), I do not have
> the details handy.

Make sense.  I'm just surprised about the complains from the habalabs
folks, which sounded like a 40something bit DMA mask did not work at all
for them on power9, which did not fit my reading of the code.

> 
> > as the DMA API now relies on that.
> 
> Relies on what precisely? If a device cannot do full 64bit, then it has to
> be no more than just 32bit?

The fact that if say you iommu only supports mode that return up to
32-bit iova and a driver sets a 48 or 64-bit mask you still return
success instead of letting the driver handle the failure and set a
32-bit mask in the fallback code.  As said I think the powerpc code
is fine based on my reading from it.

> >  Did I miss
> > something and it explicitly rejected that (in which case I didn't spot
> > the fix in this series), or is this just an optimization to handle these
> > devices more optimally, in which case maybe the changelog could be
> > improved a bit.
> 
> 
> 4/4 did this essentially:

As long as the above is fine (which I think it is) just make it a little
mor clear that this is a simple optimization, not a bug fix for DMA API
usage.
