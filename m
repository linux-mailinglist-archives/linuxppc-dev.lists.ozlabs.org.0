Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D058F25622D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Aug 2020 22:43:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BdWl72dnWzDqst
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Aug 2020 06:43:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::744;
 helo=mail-qk1-x744.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=QQfEnqeh; dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BdWjM23PGzDqq7
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Aug 2020 06:41:41 +1000 (AEST)
Received: by mail-qk1-x744.google.com with SMTP id p25so848597qkp.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Aug 2020 13:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :organization:user-agent:mime-version:content-transfer-encoding;
 bh=OuigYDRHbp0KD0Zigxqddli6PufHO0STYLtihCwC7Hk=;
 b=QQfEnqeh1/DkaJc+NqJ2Yqnl2m1Jeuh7CjGU+7LEnRD/yUo2qSeXBNZRCfbODu1V/z
 T6HIB0XbUPONs1uGgTn+xkQArTwiSPcS4zoMuEHUkvRaFFX6uDoAtSuDowfLt3SlkWaK
 PJpBYS/hbRXB0yRN3ybrnR/rbgctTWbnXPkKaR4zlcwDOtK4v38xvyd6BvIM4dbPgOUE
 m6NcphyEMXw9QxJ0x2B93UHy01OcuZWOExqJbzf5OOhbmEgbtXMC66kLjeyJWafsMHBJ
 GaAR9O6V9qaff46f02rxqWWHMwMqjfCVgULwIQiqeVC0kyFGs5YdALtPGmCDXbV20Ag3
 55Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=OuigYDRHbp0KD0Zigxqddli6PufHO0STYLtihCwC7Hk=;
 b=jUWWk6eITTyvRTCKPalXDmYLA0fEnhKdh8YyToGLa+VOYLC0W6Vc4cVn5Tsb5BkhjQ
 g2066bmhdrx9sY+yCEYGwTO/S68b8MNVaaFE1heQCZY7fPP4aBvYi2Bk/0avv1blSbvj
 +Yp4bDJNJjOTblz+qhYwdeTiBqJ/Am1UDgprOakriuio0bCrXZzC++Pvwk/WiHvO+f7F
 lvrO5vjuUqR9UdNkmWVDYm787x7v1BJQyOjSnvMWeWGP5i24KDTpjX2KpdLOz5hPVR2F
 /tyYvPSzj7P3XwkejDKQDBHmR//Atx8GbfKpIODN+uDcF0e74oCvcPFC1RaGODT0DrN+
 8nqQ==
X-Gm-Message-State: AOAM530cdA89+cV2E3dIg+hdtvWsCQJ1Qb6pttC6DU+xXkdtKqmWC4/u
 PzATWuPPaPU47G170PJB0T4=
X-Google-Smtp-Source: ABdhPJwvfHdveujPEOwZqSc9XJ9uaa/erp/yRgUdSL3/XppVxyA1noiGOKt0mKK7osmvKdkm8bmg7A==
X-Received: by 2002:a05:620a:4051:: with SMTP id
 i17mr886364qko.457.1598647298769; 
 Fri, 28 Aug 2020 13:41:38 -0700 (PDT)
Received: from LeoBras ([2804:14d:8084:8e41:9b0d:571e:a65:b5d8])
 by smtp.gmail.com with ESMTPSA id i14sm255894qkn.53.2020.08.28.13.41.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 13:41:37 -0700 (PDT)
Message-ID: <2aacd45f047489642da1731c92d3555ad101e3c7.camel@gmail.com>
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
Date: Fri, 28 Aug 2020 17:41:29 -0300
In-Reply-To: <da473389-f921-075a-ec8e-ea516de4f177@ozlabs.ru>
References: <20200817234033.442511-1-leobras.c@gmail.com>
 <20200817234033.442511-3-leobras.c@gmail.com>
 <7b9640e0-568f-1470-40f4-a3ccec8abcf2@ozlabs.ru>
 <c67c66e466ad27d15aa2b970c48d2336d95b2971.camel@gmail.com>
 <da473389-f921-075a-ec8e-ea516de4f177@ozlabs.ru>
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

On Fri, 2020-08-28 at 11:40 +1000, Alexey Kardashevskiy wrote:
> > I think it would be better to keep the code as much generic as possible
> > regarding page sizes. 
> 
> Then you need to test it. Does 4K guest even boot (it should but I would
> not bet much on it)?

Maybe testing with host 64k pagesize and IOMMU 16MB pagesize in qemu
should be enough, is there any chance to get indirect mapping in qemu
like this? (DDW but with smaller DMA window available) 

> > > Because if we want the former (==support), then we'll have to align the
> > > size up to the bigger page size when allocating/zeroing system pages,
> > > etc. 
> > 
> > This part I don't understand. Why do we need to align everything to the
> > bigger pagesize? 
> > 
> > I mean, is not that enough that the range [ret, ret + size[ is both
> > allocated by mm and mapped on a iommu range?
> > 
> > Suppose a iommu_alloc_coherent() of 16kB on PAGESIZE = 4k and
> > IOMMU_PAGE_SIZE() == 64k.
> > Why 4 * cpu_pages mapped by a 64k IOMMU page is not enough? 
> > All the space the user asked for is allocated and mapped for DMA.
> 
> The user asked to map 16K, the rest - 48K - is used for something else
> (may be even mapped to another device) but you are making all 64K
> accessible by the device which only should be able to access 16K.
> 
> In practice, if this happens, H_PUT_TCE will simply fail.

I have noticed mlx5 driver getting a few bytes in a buffer, and using
iommu_map_page(). It does map a whole page for as few bytes as the user
wants mapped, and the other bytes get used for something else, or just
mapped on another DMA page.
It seems to work fine.  

> 
> 
> > > Bigger pages are not the case here as I understand it.
> > 
> > I did not get this part, what do you mean?
> 
> Possible IOMMU page sizes are 4K, 64K, 2M, 16M, 256M, 1GB, and the
> supported set of sizes is different for P8/P9 and type of IO (PHB,
> NVLink/CAPI).
> 
> 
> > > > Update those functions to guarantee alignment with requested size
> > > > using IOMMU_PAGE_ALIGN() before doing iommu_alloc() / iommu_free().
> > > > 
> > > > Also, on iommu_range_alloc(), replace ALIGN(n, 1 << tbl->it_page_shift)
> > > > with IOMMU_PAGE_ALIGN(n, tbl), which seems easier to read.
> > > > 
> > > > Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> > > > ---
> > > >  arch/powerpc/kernel/iommu.c | 17 +++++++++--------
> > > >  1 file changed, 9 insertions(+), 8 deletions(-)
> > > > 
> > > > diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
> > > > index 9704f3f76e63..d7086087830f 100644
> > > > --- a/arch/powerpc/kernel/iommu.c
> > > > +++ b/arch/powerpc/kernel/iommu.c
> > > > @@ -237,10 +237,9 @@ static unsigned long iommu_range_alloc(struct device *dev,
> > > >  	}
> > > >  
> > > >  	if (dev)
> > > > -		boundary_size = ALIGN(dma_get_seg_boundary(dev) + 1,
> > > > -				      1 << tbl->it_page_shift);
> > > > +		boundary_size = IOMMU_PAGE_ALIGN(dma_get_seg_boundary(dev) + 1, tbl);
> > > 
> > > Run checkpatch.pl, should complain about a long line.
> > 
> > It's 86 columns long, which is less than the new limit of 100 columns
> > Linus announced a few weeks ago. checkpatch.pl was updated too:
> > https://www.phoronix.com/scan.php?page=news_item&px=Linux-Kernel-Deprecates-80-Col
> 
> Yay finally :) Thanks,

:)

> 
> 
> > > 
> > > >  	else
> > > > -		boundary_size = ALIGN(1UL << 32, 1 << tbl->it_page_shift);
> > > > +		boundary_size = IOMMU_PAGE_ALIGN(1UL << 32, tbl);
> > > >  	/* 4GB boundary for iseries_hv_alloc and iseries_hv_map */
> > > >  
> > > >  	n = iommu_area_alloc(tbl->it_map, limit, start, npages, tbl->it_offset,
> > > > @@ -858,6 +857,7 @@ void *iommu_alloc_coherent(struct device *dev, struct iommu_table *tbl,
> > > >  	unsigned int order;
> > > >  	unsigned int nio_pages, io_order;
> > > >  	struct page *page;
> > > > +	size_t size_io = size;
> > > >  
> > > >  	size = PAGE_ALIGN(size);
> > > >  	order = get_order(size);
> > > > @@ -884,8 +884,9 @@ void *iommu_alloc_coherent(struct device *dev, struct iommu_table *tbl,
> > > >  	memset(ret, 0, size);
> > > >  
> > > >  	/* Set up tces to cover the allocated range */
> > > > -	nio_pages = size >> tbl->it_page_shift;
> > > > -	io_order = get_iommu_order(size, tbl);
> > > > +	size_io = IOMMU_PAGE_ALIGN(size_io, tbl);
> > > > +	nio_pages = size_io >> tbl->it_page_shift;
> > > > +	io_order = get_iommu_order(size_io, tbl);
> > > >  	mapping = iommu_alloc(dev, tbl, ret, nio_pages, DMA_BIDIRECTIONAL,
> > > >  			      mask >> tbl->it_page_shift, io_order, 0);
> > > >  	if (mapping == DMA_MAPPING_ERROR) {
> > > > @@ -900,11 +901,11 @@ void iommu_free_coherent(struct iommu_table *tbl, size_t size,
> > > >  			 void *vaddr, dma_addr_t dma_handle)
> > > >  {
> > > >  	if (tbl) {
> > > > -		unsigned int nio_pages;
> > > > +		size_t size_io = IOMMU_PAGE_ALIGN(size, tbl);
> > > > +		unsigned int nio_pages = size_io >> tbl->it_page_shift;
> > > >  
> > > > -		size = PAGE_ALIGN(size);
> > > > -		nio_pages = size >> tbl->it_page_shift;
> > > >  		iommu_free(tbl, dma_handle, nio_pages);
> > > > +
> > > 
> > > Unrelated new line.
> > 
> > Will be removed. Thanks!
> > 
> > > 
> > > >  		size = PAGE_ALIGN(size);
> > > >  		free_pages((unsigned long)vaddr, get_order(size));
> > > >  	}
> > > > 

