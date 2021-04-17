Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41114363236
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Apr 2021 22:23:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FN4KF1KMzz3bTc
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Apr 2021 06:23:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=OEMC9XOg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=willy@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=OEMC9XOg; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FN4Jp3ZwWz2yZR
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Apr 2021 06:23:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=BnSKcc0JSuohlN33+Pj8bhxKsI7DT+Owp2PFJxUm9vg=; b=OEMC9XOgR/fKU/0oPNUu/P7cCL
 FT4t01GafWZlc1vjwl9KSjRt1IY8zFxgga7gHLRR+WCKupSKq6t9mxOaZIZufePDNN7mCVh1kH9jR
 F0u0g7a9CwiXrlGEHglrLCjcUmY6riPVWU0Qfcwq6bjvHqJmgaIV9kM3woRxgGCelw9NDnFMhLDTu
 ddS052/dNjJg/5EC844nFoPlje4sglQZ/dDMtCOaSHxgsq/MS3GcQFiMjlzkT3lk3nRsLRtoZo+VR
 X2xbTp+70dqUigqbpfzkNLRorcOijpiu4WZdd3t8LIzJQrj1saQRlw3+7gG/AlVzE/uFz4w1OL3ap
 wbKEi5/Q==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lXrSi-00Belm-JF; Sat, 17 Apr 2021 20:22:44 +0000
Date: Sat, 17 Apr 2021 21:22:40 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Subject: Re: [PATCH 1/2] mm: Fix struct page layout on 32-bit systems
Message-ID: <20210417202240.GS2531743@casper.infradead.org>
References: <20210416230724.2519198-1-willy@infradead.org>
 <20210416230724.2519198-2-willy@infradead.org>
 <20210417024522.GP2531743@casper.infradead.org>
 <YHspptFx+T588KcG@apalos.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YHspptFx+T588KcG@apalos.home>
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
Cc: arnd@kernel.org, grygorii.strashko@ti.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, mhocko@kernel.org,
 linux-mm@kvack.org, mgorman@suse.de, brouer@redhat.com,
 mcroce@linux.microsoft.com, linux-snps-arc@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, hch@lst.de,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Apr 17, 2021 at 09:32:06PM +0300, Ilias Apalodimas wrote:
> > +static inline void page_pool_set_dma_addr(struct page *page, dma_addr_t addr)
> > +{
> > +	page->dma_addr[0] = addr;
> > +	if (sizeof(dma_addr_t) > sizeof(unsigned long))
> > +		page->dma_addr[1] = addr >> 16 >> 16;
> 
> The 'error' that was reported will never trigger right?
> I assume this was compiled with dma_addr_t as 32bits (so it triggered the
> compilation error), but the if check will never allow this codepath to run.
> If so can we add a comment explaining this, since none of us will remember why
> in 6 months from now?

That's right.  I compiled it all three ways -- 32-bit, 64-bit dma, 32-bit long
and 64-bit.  The 32/64 bit case turn into:

	if (0)
		page->dma_addr[1] = addr >> 16 >> 16;

which gets elided.  So the only case that has to work is 64-bit dma and
32-bit long.

I can replace this with upper_32_bits().

