Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A4767290
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2019 17:37:47 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45lcWC4rjpzDqdR
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Jul 2019 01:37:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (mailfrom)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+957344792e76119913ac+5801+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="GwvBCJth"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45lcJ24vyRzDqwT
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Jul 2019 01:28:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NtsbKnnxGPRRGtpsBkhigsx98hQ7c1/J+GaNPOUonEw=; b=GwvBCJthEMA2kf6sB68t63v+6
 Xz+Oe8+P5a1Y5sNKIZrYG5KfZNCTAvJADgjTaPnEKmGGaf6v6FAgHhDf/LZSnVmYCnssI3zpqyF1e
 Hau0yzUI6C6WBXTT0GFxHd24tq7rWn9RPqLHPQes+itQqWU3bkEZT8CnW0Ffz4mLRbfDYYa2UT+Jb
 FmsSBG5rSS9WKAUyXoIJtnQ0c0AixTxq9Js07I40pWuEhFHpRGvwz0SyWemlQEmmZxftxFsryDhiv
 TPZN85lk/8zeUyI/CQc1/kk42WK4b5+l/tvl3o+CsHw9+C2BctBzTRj4ca39+Q3iTjad5jrhscxay
 t4OQO6Wow==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hlxSq-0004AR-88; Fri, 12 Jul 2019 15:28:00 +0000
Date: Fri, 12 Jul 2019 08:28:00 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH kernel v4 0/4 repost] powerpc/ioda2: Yet another attempt
 to allow DMA masks between 32 and 59
Message-ID: <20190712152800.GC3061@infradead.org>
References: <20190712094509.56695-1-aik@ozlabs.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190712094509.56695-1-aik@ozlabs.ru>
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
 Alistair Popple <alistair@popple.id.au>, Oliver O'Halloran <oohall@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 12, 2019 at 07:45:05PM +1000, Alexey Kardashevskiy wrote:
> This is an attempt to allow DMA masks between 32..59 which are not large
> enough to use either a PHB3 bypass mode or a sketchy bypass. Depending
> on the max order, up to 40 is usually available.

Can you elaborate what you man with supported in detail?  In the end
a DMA devices DMA capability is only really interesting as a lower
bound.

e.g. if you have a DMA that supports 40-bit DMA addressing we could
always treat it as if supports 32-bit addressing, and I thought the
powerpc code does that, as the DMA API now relies on that.  Did I miss
something and it explicitly rejected that (in which case I didn't spot
the fix in this series), or is this just an optimization to handle these
devices more optimally, in which case maybe the changelog could be
improved a bit.
