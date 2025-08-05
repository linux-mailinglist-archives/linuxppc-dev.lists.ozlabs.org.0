Return-Path: <linuxppc-dev+bounces-10666-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DC4B1B799
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Aug 2025 17:36:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bxHZk1Vvhz3bm3;
	Wed,  6 Aug 2025 01:36:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::72b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754408174;
	cv=none; b=XMFlB3uWPczge3QX4yQQgG4E5e0yl/gwcXyMHAXJa8navqEx/1fzQRXvF/KDBgbUWH/UkgZvfAllrstwDT2ATq89sJiSj8szQiMYzoqBS8Zq3IzRNrsrF7qnq4Vo9VT5YOO6/flS65TwWifd/1thuol2ijZY8/UkstJ8Ww7RZUOsGprsfqkAO8EyAszrrPBz3krMXI1EamkHgNSAE286z6RRQciSEoWOlZY2f54N1FyXCoozo2N78vRsqxneC+SQ7TljPJrG56D6X2AuQaw+fr3EtH+7cynsSiBrU9J/itNEBRbPtLa6qOHr26dsE+MAJf7OsqcIKbqEHlhw1KFi6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754408174; c=relaxed/relaxed;
	bh=N1MKz8dfPt28HzEOpdUPkfZENcnUFV9NfsoMVTYwzbE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CgPTu54tHX69ioZtlw1g+owbcjeT0Ulvzn3e5B3Yzv1DdRHCdPKTmvS8losFnqLvRM0eDy0S6kFv2nHy4zliNNUU7SFf9JIkXQ3Iy6GMyYoknYWEwLLwKd54NTGIm3a+FkTBuUw3mQ/y4GNoP4139HBnyaF4UTl5hQ9fVom9dyFlJhYufdIR28SsDz0eR66GVKwgMJWYzKlKECbLaW2gx9TBDVpvvx3Hvp9AG6yvAPYoss2qnDlBBnLF4hDSClfQ+2cOnv4wIbbJQLNi+6wIRrDlTB32bbbFOozEVh4qpFK4ur3KdAwV1+NZSRgAlvIe1oyS0I2dc8qdRmesM3CZxA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=cFnH1mT+; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::72b; helo=mail-qk1-x72b.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org) smtp.mailfrom=ziepe.ca
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=cFnH1mT+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::72b; helo=mail-qk1-x72b.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org)
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bxHZh07x1z3bkg
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Aug 2025 01:36:11 +1000 (AEST)
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-7e809baeef7so149863085a.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 Aug 2025 08:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1754408168; x=1755012968; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N1MKz8dfPt28HzEOpdUPkfZENcnUFV9NfsoMVTYwzbE=;
        b=cFnH1mT+CIbexTJwGsDOtSPXJuAtsgVzfYUO6ADs7KRAWk2VqwkQIgZYcL0vTJD3yr
         0J7R/vJV/XC6/C1J7d0IKKgeIL6LwVdXpil/QtNAsuaX93UDSZp65haQOTpkD93iexMS
         EhG1Cp1NM/tWYcuQh2Uxd3IsuVJ3rvPkuvN153xJxkgfr4HV+DVo4Q6vqGUZZY3dyq9d
         HKgEUGYuR97wHcTT/r5nJp5uFevWXQpNJ4M1IC9ErUSl8RnaAvQgow7Z39sRF6YKdUrN
         smRYZcjVD9OtitzSsZhQ3x5fTGQ5dIB6cJT59cb0v14kh9y40GHjZeaS60F2UeO1QVCT
         oAKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754408168; x=1755012968;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N1MKz8dfPt28HzEOpdUPkfZENcnUFV9NfsoMVTYwzbE=;
        b=sRYWMbwJXI4rCBZ5IFGGkLlkGN6XNchz9cTzJHilYvYoM2PpgupfbOYzEQxNjDLsco
         T2xdgNzjYx4AuTjdLVe6+AZUNtvbMkeu2I92m5dY/WG50i2YmcY+4PGczg7khW2GssJv
         jNQlh7DRNLUeX3eKo2hbcXQxd/7EnLgIeVSD+62+DlHLfEOXH63w0TApN8L+Swu25PuC
         mm7Mqeh1irLzK50k37dxwoq8eJWDqbwHkEQR90h9owBY6urOnTOcpyQO2jRWCldeHADe
         GVQLAyQLw22P639vXqhDlNF2LtHKTo6f6YoA7KK8Jt1BXbZs2j9CjsNycqN6rm4HFpZs
         WBdg==
X-Forwarded-Encrypted: i=1; AJvYcCUQfMJD2salYUI7CeV0ipPVmseDCGEiW7cBtC3ToscJliACkid4IEcjFmwqTY6SE3SIHVKzoJ7tXQ5g9nM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwwDJ1Xe1dDMfCpoDEG0RIIJ1TquOxkcbggYtoCtu+mtkIDhNv7
	T3C7Y3icv59QaTe6cGiNOEptOIJuBAnlbvhJm3e6zMdbVcw27XfWdF778Smky9SZ0uc=
X-Gm-Gg: ASbGnctDU/RR2rH1rkSPU3de/kKPeKjvMPEO5bbIcBQYj7eBVzf96WLTFXGOdkCzAqU
	6UCPy3ej+nbtlPTGAOgsrQPEbr6YyJMzAk/umgCVOTSaosofug67tu6uDGvG9T4lxQeFcHOgohS
	up+BZjq/0t36essbWFjj4DrTbLTAXot5b7GLkdqRbrZdmC0Zth+EsESh9cH+5eINud55q7xovw4
	BSvlV2y/HDZBl+S/G32lxezbzci2kqLIMigaKMtb3nXJ0CAlG+bnrfdAv9Jo/8EBKDNsmftaxg5
	Sfaq3+Uh3OOqD3FdbZNdHgTn976LmM8A5OGK1g1JfqfkyAXReow/lMPOzNlHdFISQo0FKW22jau
	YPWI6VqPisNHok5oQj7FNVxR2it/Ks5EiMW6mz2k9M1nTeCzvdfrra18mIqljjORXGDnYDEGZLd
	kEhIw=
X-Google-Smtp-Source: AGHT+IF1+3bX6DUQCrRo5YyM2fp0OCvjM/jusyZc5iy/VSCxNo0II2PGkJ9MrYPb1oYSw7F9hqkESg==
X-Received: by 2002:a05:620a:12c6:b0:7e6:8f41:2055 with SMTP id af79cd13be357-7e6962e0c1bmr1733279285a.21.1754408168128;
        Tue, 05 Aug 2025 08:36:08 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e67f5cd63fsm689744985a.39.2025.08.05.08.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 08:36:07 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1ujJhu-00000001YWx-3rSt;
	Tue, 05 Aug 2025 12:36:06 -0300
Date: Tue, 5 Aug 2025 12:36:06 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Matthew Wilcox <willy@infradead.org>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Christoph Hellwig <hch@lst.de>, Leon Romanovsky <leon@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	=?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, iommu@lists.linux.dev,
	virtualization@lists.linux.dev, kasan-dev@googlegroups.com,
	linux-trace-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 0/8] dma-mapping: migrate to physical address-based API
Message-ID: <20250805153606.GR26511@ziepe.ca>
References: <CGME20250625131920eucas1p271b196cde042bd39ac08fb12beff5baf@eucas1p2.samsung.com>
 <cover.1750854543.git.leon@kernel.org>
 <35df6f2a-0010-41fe-b490-f52693fe4778@samsung.com>
 <20250627170213.GL17401@unreal>
 <20250630133839.GA26981@lst.de>
 <69b177dc-c149-40d3-bbde-3f6bad0efd0e@samsung.com>
 <f912c446-1ae9-4390-9c11-00dce7bf0fd3@arm.com>
 <aIupx_8vOg8wQh6w@casper.infradead.org>
 <20250803155906.GM26511@ziepe.ca>
 <aJArFNkuP8DJIdMY@casper.infradead.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aJArFNkuP8DJIdMY@casper.infradead.org>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Aug 04, 2025 at 04:37:56AM +0100, Matthew Wilcox wrote:
> On Sun, Aug 03, 2025 at 12:59:06PM -0300, Jason Gunthorpe wrote:
> > Matthew, do you think it makes sense to introduce types to make this
> > clearer? We have two kinds of values that a phys_addr_t can store -
> > something compatible with kmap_XX_phys(), and something that isn't.
> 
> I was with you up until this point.  And then you said "What if we have
> a raccoon that isn't a raccoon" and my brain derailed.

I though it was clear..

   kmap_local_pfn(phys >> PAGE_SHIFT)
   phys_to_virt(phys)

Does not work for all values of phys. It definately illegal for
non-cachable MMIO. Agree?

There is a subset of phys that is cachable and has struct page that is
usable with kmap_local_pfn()/etc

phys is always this:

> - CPU untranslated.  This is the "physical" address.  Physical address
>   0 is what the CPU sees when it drives zeroes on the memory bus.

But that is a pure HW perspective. It doesn't say which of our SW APIs
are allowed to use this address.

We have callchains in DMA API land that want to do a kmap at the
bottom. It would be nice to mark the whole call chain that the
phys_addr being passed around is actually required to be kmappable.

Because if you pass a non-kmappable MMIO backed phys it will explode
in some way on some platforms.

> > We clearly have these two different ideas floating around in code,
> > page tables, etc.

> No.  No, we don't.  I've never heard of this asininity before.

Welcome to the fun world of cachable and non-cachable memory.

Consider, today we can create struct pages of type
MEMORY_DEVICE_PCI_P2PDMA for non-cachable MMIO. I think today you
"can" use kmap to establish a cachable mapping in the vmap.

But it is *illegal* to establish a cachable CPU mapping of MMIO. Archs
are free to MCE if you do this - speculative cache line load of MMIO
can just error in HW inside the interconnect.

So, the phys_addr is always a "CPU untranslated physical address" but
the cachable/non-cachable cases, or DRAM vs MMIO, are sometimes
semantically very different things for the SW!

Jason

