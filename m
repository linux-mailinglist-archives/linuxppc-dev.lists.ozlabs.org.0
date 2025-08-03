Return-Path: <linuxppc-dev+bounces-10534-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E6EB1946C
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Aug 2025 17:59:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bw4BB1Chsz2xWc;
	Mon,  4 Aug 2025 01:59:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::835"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754236754;
	cv=none; b=n3NLJNKl9OPngkqDb8bXakZDhdxb+X2d/UGg3DxbUfu0QJ86f2od3wOdo2KuHz5S+rraulpgwEi5Q9jppQbqvNV5+Tm+46JkDaNzzhGorh5vNJ9bX8NpdiiLrZbJ5b2sBzR3CxudYyGFO7lbSCJ4NZEjkYruB8USszJvQ1hstq3kK9YWf7Y4IdRBrwHOkP8m/RSWu+/51yC5apSsDZJS3T4oyxEt3Em42GDkXY4S4byY/G7mBRwwO9p1/F2o/tfGSE1Z0jNgIu6RaoeZhjw201jsPMvAAVEqJMMGoY6RI/iFYRLCs71GJiNajeQpbdE1Zrte3ccrloxodzvTJP3L7A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754236754; c=relaxed/relaxed;
	bh=8slyx6E/zt3CNU5aqFjzFMTLA7WC2ifuj8UOdB6q15U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JmodSyGPFALbTRamoYRMHc/ykeYnNE4CKQFh65EY8Uqvd/rPHR4b3EDdCeCEtZi6Vp8rd7APg0EvYjzUPRxYIlk5JdqLNNKAHa8LAbkH1KYolG5Y7ohuztRnxyu+Q5WRdpEoDn036bWqMRQLZdHi5GLbnA5ShsvwN2y9If/Au006eBZExdc5fXbBSfFgYcQ3YkagW9C2dTw6tFuJgWMH9GO+xu9eQGBp/r7G3zo92en1DblB2Kaog4QM/ivi6BuYHvRjRCMy4P+2poFlEB4fRq4+kFCdmDXGDAqQZNRUJXteRct8npTy8Rs0BzQ5W0fS6NfeiUL5bktiUfA0FdsjoA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=AUoqGEtn; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::835; helo=mail-qt1-x835.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org) smtp.mailfrom=ziepe.ca
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=AUoqGEtn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::835; helo=mail-qt1-x835.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org)
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bw4B84wSbz2xQ6
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Aug 2025 01:59:11 +1000 (AEST)
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-4aeb2e06b82so9222801cf.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 03 Aug 2025 08:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1754236748; x=1754841548; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8slyx6E/zt3CNU5aqFjzFMTLA7WC2ifuj8UOdB6q15U=;
        b=AUoqGEtnfN1szbsI4WQPfp2QqciiLlXXuspqGALXGBdb0umNjzVq5LuuAcByGGSd9y
         1DUmlV2uWri+/LaxHHJqxFnepA3ae8kyL6JAxwWxtnPXR3bCYVdsCDUk8e6pbmCxPEGn
         Jiu+0p0Oov3/X+H0CC/CchfjJ7VYSitnzhQrzaDSJA6ZNR1ERDg23qRQY+b9x4EErEpm
         bWye1Jxka837UCyBAbUopU0rkaJoNz26bIRxSmDteFQ9wdSS+JwSF47ITaIhvLVOBc0H
         kPcAxE9PcH6NX3VKeeJEpj0D3qUvDcwDYKludZpqI8/Axp58x8LeRXkJlnZlad4cBrrb
         1/tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754236748; x=1754841548;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8slyx6E/zt3CNU5aqFjzFMTLA7WC2ifuj8UOdB6q15U=;
        b=w96R66hRM5oJd5VPAE59b6SXWTUuwP/M9KtK/Lodr0uwxNXdOITQqVIVW3Ky8gAFYQ
         R2rCgBWpGpDf4pju2JZxtt//lZJQWi/wfRU75JkmNFNoXIeFbNXa3NdLGVZUAzLRNFwm
         WiK8xvaKaUpnUrRaltA5qRf6T9hcXEmCOBjdZGcuIPEL8Vfi0d4dgREmsdEOoiFpWi+v
         zD+2A09ZD7pOQLfApgna4kjp0AGlEHrz16KRpw2tsXdMpx6BGZhrJXC977ISciTpL2/o
         IyKWrZMpikPkRsTqfn5hL8esXYs1xIrlq8KUiG7rAuBDWotOQg2udHjGxfvwV5HWcUwX
         4yXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXo3n538Y86OlrUd7Wnfvnz+xaWBDpVNZNUQu+5bPRD+Mvbim6JqDAcz+lKd34Wbmnteds6oV8qONlYkqc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyB1NP+Eqqvzpm03+KZV4Z7eMn5WeFSxcg87ls5hfh790lmjzgq
	lamiFQY7Pao97QPZ0WM30U+TiHMrMqUGtJIC0FUE5PzE0PSUdhF6dkPycanSDtn9Uzo=
X-Gm-Gg: ASbGncsZxtORlWVC91Rr/ODCLK/q82iqX3zP5++GOG37dm4eaOPEu05GZyIQY4ytTa3
	A560TY/VkZpUJC0O5CqmKTjgD9FISKqbrc3tiN844VReCcsCAKwPSvrGyAhocBCe0ylj3C9/JGU
	+ysFshcsOdwXRpKD8/EafXlWbz0x6iVJ/wr9gqqHdyaooswAV0Yv1bHND91dOYDUpZR0WbIaMsK
	HVc6ohXoub3NvI879nm5hyuTN6S4TNaKM3y2i7jfgFqWeQVmHhSWaD8TQPBPGm39C6D0Fbhh/0c
	D054Ae8kU1T9WgE0//fZyOGJQX0uhhQPt6HXR1tcp8ULX4z1zPI6VqHeyYTrhD6PJrJRFTGOqMa
	lQShGDG//2TbvvGyw64SH4v1NGiivmPCxCj/t+oSs2nFMbyLrxsUFVLR5QmzujXtW88mm
X-Google-Smtp-Source: AGHT+IGXTSS5qgdnpS/eJ13tqSItmWfAUC8meUEvOe7mj0qBpcNtZfptB2QZRGNN4fnSPsBSKZwvXw==
X-Received: by 2002:a05:622a:1dc5:b0:4b0:6da3:26df with SMTP id d75a77b69052e-4b06da333ccmr13497821cf.29.1754236748067;
        Sun, 03 Aug 2025 08:59:08 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4af01e4aa4dsm29318401cf.23.2025.08.03.08.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Aug 2025 08:59:07 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uib74-00000001Hym-2XZx;
	Sun, 03 Aug 2025 12:59:06 -0300
Date: Sun, 3 Aug 2025 12:59:06 -0300
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
Message-ID: <20250803155906.GM26511@ziepe.ca>
References: <CGME20250625131920eucas1p271b196cde042bd39ac08fb12beff5baf@eucas1p2.samsung.com>
 <cover.1750854543.git.leon@kernel.org>
 <35df6f2a-0010-41fe-b490-f52693fe4778@samsung.com>
 <20250627170213.GL17401@unreal>
 <20250630133839.GA26981@lst.de>
 <69b177dc-c149-40d3-bbde-3f6bad0efd0e@samsung.com>
 <f912c446-1ae9-4390-9c11-00dce7bf0fd3@arm.com>
 <aIupx_8vOg8wQh6w@casper.infradead.org>
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
In-Reply-To: <aIupx_8vOg8wQh6w@casper.infradead.org>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jul 31, 2025 at 06:37:11PM +0100, Matthew Wilcox wrote:

> The replacement for kmap_atomic() is already here -- it's
> kmap_(atomic|local)_pfn().  If a simple wrapper like kmap_local_phys()
> would make this more palatable, that would be fine by me.  Might save
> a bit of messing around with calculating offsets in each caller.

I think that makes the general plan clearer. We should be removing the
struct pages entirely from the insides of DMA API layer and use the
phys_addr_t, kmap_XX_phys(), phys_to_virt(), and so on.

The request from Christoph and Marek to clean up the dma_ops makes
sense in that context, we'd have to go into the ops and replace the
struct page kmaps/etc with the phys based ones.

This hides the struct page requirement to get to a KVA inside the core
mm code only and that sort of modularity is exactly the sort of thing
that could help entirely remove a struct page requirement for some
kinds of DMA someday.

Matthew, do you think it makes sense to introduce types to make this
clearer? We have two kinds of values that a phys_addr_t can store -
something compatible with kmap_XX_phys(), and something that isn't.

This was recently a long discussion in ARM KVM as well which had a
similar confusion that a phys_addr_t was actually two very different
things inside its logic.

So what about some dedicated types:
 kphys_addr_t - A physical address that can be passed to
     kmap_XX_phys(), phys_to_virt(), etc.

 raw_phys_addr_t - A physical address that may not be cachable, may
     not be DRAM, and does not work with kmap_XX_phys()/etc.

We clearly have these two different ideas floating around in code,
page tables, etc.

I read some of Robin's concern that the struct page provided a certain
amount of type safety in the DMA API, this could provide similar.

Thanks,
Jason

