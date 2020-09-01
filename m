Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E16425A190
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 00:36:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bh24K2KLYzDqVV
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 08:36:49 +1000 (AEST)
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
 header.s=20161025 header.b=gF5wBGgq; dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bh2296YmxzDqJs
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Sep 2020 08:34:57 +1000 (AEST)
Received: by mail-qk1-x744.google.com with SMTP id w12so2508349qki.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Sep 2020 15:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :organization:user-agent:mime-version:content-transfer-encoding;
 bh=7MwszBb2S3FFQiLXkpCgU+/rECZFKBDqmxTKw+Pa+WQ=;
 b=gF5wBGgq9MXzk7YrLip5sEn+7JfsjKQQL8GaLDSMnLOPni/gzJtf/i+VAaRt5CAXmi
 81VM1zqMFR6H6CTU9UlAeaSGr68oAssloF4YWHLJ2CeWQCekX03gVDcDwxu7Qcoo6exp
 Eiww8XPBDcbYYgYjZ/lcPCOUXMiJ0NS3OB0eF8iFVsWDLaTL6rMlLDQDlv43pBAjlKDe
 gQkBKxxE+1rnsfoHm97dYf5WuMgKwk4qlxXkqRlnfytqnAA08l47jj+RGuJ8hrUo55gW
 +jExI5lxvuHBlCAXAtWcQq/BGUkWicQL24e658YYu8oMQNw6K/MdfURnAFgQYwCA/JDP
 cRHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=7MwszBb2S3FFQiLXkpCgU+/rECZFKBDqmxTKw+Pa+WQ=;
 b=G37Hmy/k5JmBgW6bk5ydRONd1XHB7uj3MryOeEKdq6TBlGnKZKQCrfIJK40/8hkEfx
 Kk5SlY1LHJnpwTCaDhtPTUZB6z6GngqhuYgVdsnU3EX3arTY2QcYcI4yhzQp4Zar9iNv
 8GGLkoIjAbqsgYSdYpASZh7H6wy1GknG4GrAkIhTrwzCnc2ii3RD3oMeQxac5aMXtTZo
 KocwhmqMgUtysREksgoRVwH2Kqehq4degH5sPNHM4nMc6rNGP3VC4iWyYzk4Vh32nwCj
 MQF90aGx3I75/kLYymGgEu0sUwA8Bq2oW6VZFUfDouo0JwGcFMYCkUYw/pIOXtBV7wMs
 CDNQ==
X-Gm-Message-State: AOAM531t9DRWZ32WQfW6n1uF5ZiLaOoQAYKBKZTHMbBAaU8UQBxbrKBP
 hlTnFQpFBx9gq4X/x3A4+nQ=
X-Google-Smtp-Source: ABdhPJzvWfquSTgJoCzf32bVlstktcaCMsBgQXBXdG3v/MsspFKc38an9Bg7hBzyRo3IvyI2GYy9cQ==
X-Received: by 2002:a37:9f95:: with SMTP id i143mr4206169qke.121.1598999694218; 
 Tue, 01 Sep 2020 15:34:54 -0700 (PDT)
Received: from LeoBras (179-125-130-62.dynamic.desktop.com.br.
 [179.125.130.62])
 by smtp.gmail.com with ESMTPSA id t186sm3167503qkc.98.2020.09.01.15.34.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 15:34:52 -0700 (PDT)
Message-ID: <39ad3a9c103faf9c5fc2fd5700d8606eb4a2b67e.camel@gmail.com>
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
Date: Tue, 01 Sep 2020 19:34:46 -0300
In-Reply-To: <81f106bd-8962-22f2-f14a-378d3486f57e@ozlabs.ru>
References: <20200817234033.442511-1-leobras.c@gmail.com>
 <20200817234033.442511-3-leobras.c@gmail.com>
 <7b9640e0-568f-1470-40f4-a3ccec8abcf2@ozlabs.ru>
 <c67c66e466ad27d15aa2b970c48d2336d95b2971.camel@gmail.com>
 <da473389-f921-075a-ec8e-ea516de4f177@ozlabs.ru>
 <2aacd45f047489642da1731c92d3555ad101e3c7.camel@gmail.com>
 <81f106bd-8962-22f2-f14a-378d3486f57e@ozlabs.ru>
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

On Mon, 2020-08-31 at 10:47 +1000, Alexey Kardashevskiy wrote:
> > 
> > Maybe testing with host 64k pagesize and IOMMU 16MB pagesize in qemu
> > should be enough, is there any chance to get indirect mapping in qemu
> > like this? (DDW but with smaller DMA window available) 
> 
> You will have to hack the guest kernel to always do indirect mapping or
> hack QEMU's rtas_ibm_query_pe_dma_window() to return a small number of
> available TCEs. But you will be testing QEMU/KVM which behave quite
> differently to pHyp in this particular case.
> 

As you suggested before, building for 4k cpu pagesize should be the
best approach. It would allow testing for both pHyp and qemu scenarios.

> > > > > Because if we want the former (==support), then we'll have to align the
> > > > > size up to the bigger page size when allocating/zeroing system pages,
> > > > > etc. 
> > > > 
> > > > This part I don't understand. Why do we need to align everything to the
> > > > bigger pagesize? 
> > > > 
> > > > I mean, is not that enough that the range [ret, ret + size[ is both
> > > > allocated by mm and mapped on a iommu range?
> > > > 
> > > > Suppose a iommu_alloc_coherent() of 16kB on PAGESIZE = 4k and
> > > > IOMMU_PAGE_SIZE() == 64k.
> > > > Why 4 * cpu_pages mapped by a 64k IOMMU page is not enough? 
> > > > All the space the user asked for is allocated and mapped for DMA.
> > > 
> > > The user asked to map 16K, the rest - 48K - is used for something else
> > > (may be even mapped to another device) but you are making all 64K
> > > accessible by the device which only should be able to access 16K.
> > > 
> > > In practice, if this happens, H_PUT_TCE will simply fail.
> > 
> > I have noticed mlx5 driver getting a few bytes in a buffer, and using
> > iommu_map_page(). It does map a whole page for as few bytes as the user
> 
> Whole 4K system page or whole 64K iommu page?

I tested it in 64k system page + 64k iommu page.

The 64K system page may be used for anything, and a small portion of it
(say 128 bytes) needs to be used for DMA. 
The whole page is mapped by IOMMU, and the driver gets info of the
memory range it should access / modify.

> 
> > wants mapped, and the other bytes get used for something else, or just
> > mapped on another DMA page.
> > It seems to work fine.  
> 
> 
> With 4K system page and 64K IOMMU page? In practice it would take an
> effort or/and bad luck to see it crashing. Thanks,

I haven't tested it yet. On a 64k system page and 4k/64k iommu page, it
works as described above.

I am new to this, so I am trying to understand how a memory page mapped
as DMA, and used for something else could be a problem.

Thanks!

> 
> > > 
> > > > > Bigger pages are not the case here as I understand it.
> > > > 
> > > > I did not get this part, what do you mean?
> > > 
> > > Possible IOMMU page sizes are 4K, 64K, 2M, 16M, 256M, 1GB, and the
> > > supported set of sizes is different for P8/P9 and type of IO (PHB,
> > > NVLink/CAPI).
> > > 
> > > 
> > > > > > Update those functions to guarantee alignment with requested size
> > > > > > using IOMMU_PAGE_ALIGN() before doing iommu_alloc() / iommu_free().
> > > > > > 
> > > > > > Also, on iommu_range_alloc(), replace ALIGN(n, 1 << tbl->it_page_shift)
> > > > > > with IOMMU_PAGE_ALIGN(n, tbl), which seems easier to read.
> > > > > > 
> > > > > > Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> > > > > > ---
> > > > > >  arch/powerpc/kernel/iommu.c | 17 +++++++++--------
> > > > > >  1 file changed, 9 insertions(+), 8 deletions(-)
> > > > > > 
> > > > > > diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
> > > > > > index 9704f3f76e63..d7086087830f 100644
> > > > > > --- a/arch/powerpc/kernel/iommu.c
> > > > > > +++ b/arch/powerpc/kernel/iommu.c
> > > > > > @@ -237,10 +237,9 @@ static unsigned long iommu_range_alloc(struct device *dev,
> > > > > >  	}
> > > > > >  
> > > > > >  	if (dev)
> > > > > > -		boundary_size = ALIGN(dma_get_seg_boundary(dev) + 1,
> > > > > > -				      1 << tbl->it_page_shift);
> > > > > > +		boundary_size = IOMMU_PAGE_ALIGN(dma_get_seg_boundary(dev) + 1, tbl);
> > > > > 
> > > > > Run checkpatch.pl, should complain about a long line.
> > > > 
> > > > It's 86 columns long, which is less than the new limit of 100 columns
> > > > Linus announced a few weeks ago. checkpatch.pl was updated too:
> > > > https://www.phoronix.com/scan.php?page=news_item&px=Linux-Kernel-Deprecates-80-Col
> > > 
> > > Yay finally :) Thanks,
> > 
> > :)
> > 
> > > 
> > > > > >  	else
> > > > > > -		boundary_size = ALIGN(1UL << 32, 1 << tbl->it_page_shift);
> > > > > > +		boundary_size = IOMMU_PAGE_ALIGN(1UL << 32, tbl);
> > > > > >  	/* 4GB boundary for iseries_hv_alloc and iseries_hv_map */
> > > > > >  
> > > > > >  	n = iommu_area_alloc(tbl->it_map, limit, start, npages, tbl->it_offset,
> > > > > > @@ -858,6 +857,7 @@ void *iommu_alloc_coherent(struct device *dev, struct iommu_table *tbl,
> > > > > >  	unsigned int order;
> > > > > >  	unsigned int nio_pages, io_order;
> > > > > >  	struct page *page;
> > > > > > +	size_t size_io = size;
> > > > > >  
> > > > > >  	size = PAGE_ALIGN(size);
> > > > > >  	order = get_order(size);
> > > > > > @@ -884,8 +884,9 @@ void *iommu_alloc_coherent(struct device *dev, struct iommu_table *tbl,
> > > > > >  	memset(ret, 0, size);
> > > > > >  
> > > > > >  	/* Set up tces to cover the allocated range */
> > > > > > -	nio_pages = size >> tbl->it_page_shift;
> > > > > > -	io_order = get_iommu_order(size, tbl);
> > > > > > +	size_io = IOMMU_PAGE_ALIGN(size_io, tbl);
> > > > > > +	nio_pages = size_io >> tbl->it_page_shift;
> > > > > > +	io_order = get_iommu_order(size_io, tbl);
> > > > > >  	mapping = iommu_alloc(dev, tbl, ret, nio_pages, DMA_BIDIRECTIONAL,
> > > > > >  			      mask >> tbl->it_page_shift, io_order, 0);
> > > > > >  	if (mapping == DMA_MAPPING_ERROR) {
> > > > > > @@ -900,11 +901,11 @@ void iommu_free_coherent(struct iommu_table *tbl, size_t size,
> > > > > >  			 void *vaddr, dma_addr_t dma_handle)
> > > > > >  {
> > > > > >  	if (tbl) {
> > > > > > -		unsigned int nio_pages;
> > > > > > +		size_t size_io = IOMMU_PAGE_ALIGN(size, tbl);
> > > > > > +		unsigned int nio_pages = size_io >> tbl->it_page_shift;
> > > > > >  
> > > > > > -		size = PAGE_ALIGN(size);
> > > > > > -		nio_pages = size >> tbl->it_page_shift;
> > > > > >  		iommu_free(tbl, dma_handle, nio_pages);
> > > > > > +
> > > > > 
> > > > > Unrelated new line.
> > > > 
> > > > Will be removed. Thanks!
> > > > 
> > > > > >  		size = PAGE_ALIGN(size);
> > > > > >  		free_pages((unsigned long)vaddr, get_order(size));
> > > > > >  	}
> > > > > > 

