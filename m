Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 950AF254B41
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 18:56:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bcplb6zDqzDqkG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Aug 2020 02:56:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f41;
 helo=mail-qv1-xf41.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=h0P8ksLv; dkim-atps=neutral
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bcpfx0lZXzDqfq
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Aug 2020 02:52:06 +1000 (AEST)
Received: by mail-qv1-xf41.google.com with SMTP id y11so2915860qvl.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Aug 2020 09:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :organization:user-agent:mime-version:content-transfer-encoding;
 bh=pMOP7GvtalnvE1bAalLKdMDTFVojjFa/CIZrykJhyA0=;
 b=h0P8ksLv0SkYmJK3zzvDr/R7THSzA72QP3N2IwSzwKpJ3iiNMHxFi/mQ5kzKYteTfz
 fQyLTnyLdIHB3Gaa1yTROhP6k90swdorDE4WYoa6fySeP32+qdkuNRsu06JLnpLRR7u0
 g8PhQElen69O4YP4hvfTiIkqWRYB8+3JLN8aTIHWcjAo0NmCwJAk1BWOPkVGyACdgvGQ
 BMRiELtJhmECatPKpRBEQVtmOLOrAjywEKaK03Yvwujqgd4uT+UDH0xI9AaijUSfprMv
 //0ZILqH1SsviV/dU8hcaAB6fycLMW70fjo1LRHld16XoyvT99lWozl+qEiS6PSYaeOs
 EKlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=pMOP7GvtalnvE1bAalLKdMDTFVojjFa/CIZrykJhyA0=;
 b=XEHDBiBkg81ux4nXIMkvKGlCo/Ltqy+p/iZC9V5tI9GN3s6QOUiCPPPAYDorUIMAmB
 ruPzVOf3bMKJFtYg3u53sOPnGhbdFzRojs4FZbD850jPKa31vPIDN0z7XN1B3FLscjDT
 xJeN3KD3hb/1hgAMGg6TU0gofk9Fpgt+j0WYjU8wFxajTmVsch/EPX/89zYeLKvjrbeQ
 y3IBWcHVTNwX5Q2wCAqTT16YXQMyWjxirKFa1I0fM0AgfcR3pVuCvpNWQGIL6I+ayIhm
 YHCAH0mA3LQLYIrBpC7tGAvmWOTk32ORXh3kgP9Tr48+qPZxeMIZ+3u7u51W3cUCmeqv
 Q1CA==
X-Gm-Message-State: AOAM533UkWN2528HbiTfGyjnlsQSy1edZtieHJUkHL2VElvHM+F/1zRZ
 xm+UlHn9YfAa+ukamfKb4Gs=
X-Google-Smtp-Source: ABdhPJznHTMFGAjs5NYYi+b0cJT1FwNBBwSRZP0u9ZT/YI0/vD4D9CZvvaieHmHltQaSxwLwZTuURA==
X-Received: by 2002:ad4:5764:: with SMTP id r4mr2903921qvx.73.1598547123085;
 Thu, 27 Aug 2020 09:52:03 -0700 (PDT)
Received: from LeoBras ([2804:14d:8084:8e41:9b0d:571e:a65:b5d8])
 by smtp.gmail.com with ESMTPSA id e13sm2139022qkg.124.2020.08.27.09.51.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 09:52:02 -0700 (PDT)
Message-ID: <c67c66e466ad27d15aa2b970c48d2336d95b2971.camel@gmail.com>
Subject: Re: [PATCH v1 02/10] powerpc/kernel/iommu: Align size for
 IOMMU_PAGE_SIZE on iommu_*_coherent()
From: Leonardo Bras <leobras.c@gmail.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, Michael Ellerman
 <mpe@ellerman.id.au>,  Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Christophe Leroy
 <christophe.leroy@c-s.fr>,  Joel Stanley <joel@jms.id.au>, Thiago Jung
 Bauermann <bauerman@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>,  Brian
 King <brking@linux.vnet.ibm.com>, Murilo Fossa Vicentini
 <muvic@linux.ibm.com>, David Dai <zdai@linux.vnet.ibm.com>
Date: Thu, 27 Aug 2020 13:51:54 -0300
In-Reply-To: <7b9640e0-568f-1470-40f4-a3ccec8abcf2@ozlabs.ru>
References: <20200817234033.442511-1-leobras.c@gmail.com>
 <20200817234033.442511-3-leobras.c@gmail.com>
 <7b9640e0-568f-1470-40f4-a3ccec8abcf2@ozlabs.ru>
Organization: IBM
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 2020-08-22 at 20:07 +1000, Alexey Kardashevskiy wrote:
> 
> On 18/08/2020 09:40, Leonardo Bras wrote:
> > Both iommu_alloc_coherent() and iommu_free_coherent() assume that once
> > size is aligned to PAGE_SIZE it will be aligned to IOMMU_PAGE_SIZE.
> 
> The only case when it is not aligned is when IOMMU_PAGE_SIZE > PAGE_SIZE
> which is unlikely but not impossible, we could configure the kernel for
> 4K system pages and 64K IOMMU pages I suppose. Do we really want to do
> this here, or simply put WARN_ON(tbl->it_page_shift > PAGE_SHIFT)?

I think it would be better to keep the code as much generic as possible
regarding page sizes. 

> Because if we want the former (==support), then we'll have to align the
> size up to the bigger page size when allocating/zeroing system pages,
> etc. 

This part I don't understand. Why do we need to align everything to the
bigger pagesize? 

I mean, is not that enough that the range [ret, ret + size[ is both
allocated by mm and mapped on a iommu range?

Suppose a iommu_alloc_coherent() of 16kB on PAGESIZE = 4k and
IOMMU_PAGE_SIZE() == 64k.
Why 4 * cpu_pages mapped by a 64k IOMMU page is not enough? 
All the space the user asked for is allocated and mapped for DMA.


> Bigger pages are not the case here as I understand it.

I did not get this part, what do you mean?

> > Update those functions to guarantee alignment with requested size
> > using IOMMU_PAGE_ALIGN() before doing iommu_alloc() / iommu_free().
> > 
> > Also, on iommu_range_alloc(), replace ALIGN(n, 1 << tbl->it_page_shift)
> > with IOMMU_PAGE_ALIGN(n, tbl), which seems easier to read.
> > 
> > Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> > ---
> >  arch/powerpc/kernel/iommu.c | 17 +++++++++--------
> >  1 file changed, 9 insertions(+), 8 deletions(-)
> > 
> > diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
> > index 9704f3f76e63..d7086087830f 100644
> > --- a/arch/powerpc/kernel/iommu.c
> > +++ b/arch/powerpc/kernel/iommu.c
> > @@ -237,10 +237,9 @@ static unsigned long iommu_range_alloc(struct device *dev,
> >  	}
> >  
> >  	if (dev)
> > -		boundary_size = ALIGN(dma_get_seg_boundary(dev) + 1,
> > -				      1 << tbl->it_page_shift);
> > +		boundary_size = IOMMU_PAGE_ALIGN(dma_get_seg_boundary(dev) + 1, tbl);
> 
> Run checkpatch.pl, should complain about a long line.

It's 86 columns long, which is less than the new limit of 100 columns
Linus announced a few weeks ago. checkpatch.pl was updated too:
https://www.phoronix.com/scan.php?page=news_item&px=Linux-Kernel-Deprecates-80-Col


> 
> 
> >  	else
> > -		boundary_size = ALIGN(1UL << 32, 1 << tbl->it_page_shift);
> > +		boundary_size = IOMMU_PAGE_ALIGN(1UL << 32, tbl);
> >  	/* 4GB boundary for iseries_hv_alloc and iseries_hv_map */
> >  
> >  	n = iommu_area_alloc(tbl->it_map, limit, start, npages, tbl->it_offset,
> > @@ -858,6 +857,7 @@ void *iommu_alloc_coherent(struct device *dev, struct iommu_table *tbl,
> >  	unsigned int order;
> >  	unsigned int nio_pages, io_order;
> >  	struct page *page;
> > +	size_t size_io = size;
> >  
> >  	size = PAGE_ALIGN(size);
> >  	order = get_order(size);
> > @@ -884,8 +884,9 @@ void *iommu_alloc_coherent(struct device *dev, struct iommu_table *tbl,
> >  	memset(ret, 0, size);
> >  
> >  	/* Set up tces to cover the allocated range */
> > -	nio_pages = size >> tbl->it_page_shift;
> > -	io_order = get_iommu_order(size, tbl);
> > +	size_io = IOMMU_PAGE_ALIGN(size_io, tbl);
> > +	nio_pages = size_io >> tbl->it_page_shift;
> > +	io_order = get_iommu_order(size_io, tbl);
> >  	mapping = iommu_alloc(dev, tbl, ret, nio_pages, DMA_BIDIRECTIONAL,
> >  			      mask >> tbl->it_page_shift, io_order, 0);
> >  	if (mapping == DMA_MAPPING_ERROR) {
> > @@ -900,11 +901,11 @@ void iommu_free_coherent(struct iommu_table *tbl, size_t size,
> >  			 void *vaddr, dma_addr_t dma_handle)
> >  {
> >  	if (tbl) {
> > -		unsigned int nio_pages;
> > +		size_t size_io = IOMMU_PAGE_ALIGN(size, tbl);
> > +		unsigned int nio_pages = size_io >> tbl->it_page_shift;
> >  
> > -		size = PAGE_ALIGN(size);
> > -		nio_pages = size >> tbl->it_page_shift;
> >  		iommu_free(tbl, dma_handle, nio_pages);
> > +
> 
> Unrelated new line.

Will be removed. Thanks!

> 
> 
> >  		size = PAGE_ALIGN(size);
> >  		free_pages((unsigned long)vaddr, get_order(size));
> >  	}
> > 

