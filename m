Return-Path: <linuxppc-dev+bounces-9107-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3F0ACC86C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Jun 2025 15:51:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bBXDt25XBz307K;
	Tue,  3 Jun 2025 23:51:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::731"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748958686;
	cv=none; b=R8bQdowdLpPxepcASXBZgrC+p4jM46pEMMAxEJT1povrI0W3Ob/C8HegvznYwFxQWtr+QiYJvmphw5ak/VDyICuU+qNEG7gAjccv99mtJWKKmzlTofdGvUvduxDmMRwbLt9Kr3BLowCPz6VDp7FWe2SZKzqpSdBK3uD3j4L4am8Rb21tz0Q8C3GCnkl+VYqWeY9rsURT/ZtPoKWWKyXQlrVaApGya8ubCNKJITe1348OslbBLU4H6XmveJrxpS3H8gxTboPY61gi8mZhuIJKQBoeqSjFOgZCKE9BTD1lTjb+Y0fnBRN2necjI5g06vf6DpOyr+dhqEUrjh70Fn9Bcw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748958686; c=relaxed/relaxed;
	bh=VzY+cZCL0448RY0GID08t4arF/zf+2+XaBNqbHYkIpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KHsct7suAbPlFjY5z5YeN6+nn237jFw+zQ0aPNL6/yC7mI0+NAZitNNXZbUHL838XwVZQAEbOEOv5b+NmlRQSRQFTNE/9x+c4eLdnAN+Xn4zXa9tijDyzmkSi8rjal30100RwWDscrU7x/ey+wgrnmVw0ti0L9d8azjnbtmmak1yBK9Gw5RQZ19K2ltW9eJvz81XVgzgo8JhoIgNw2NviKxxJkCZOZx/jVLbLOGj3b3aLrTvEoQyTFrihzISSe+ElY9NXDrGg4XN/scEYiMaqzQAeaoPTM5E9jeZM6m83KPe4jIQAyMCZ1zYbFq3KRsegxeleE7oxKbIPUmaLuI0Zw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=Av/3n279; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::731; helo=mail-qk1-x731.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org) smtp.mailfrom=ziepe.ca
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=Av/3n279;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::731; helo=mail-qk1-x731.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org)
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bBXDs4YRDz2yf3
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Jun 2025 23:51:25 +1000 (AEST)
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-7d0997d3ac7so660762285a.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Jun 2025 06:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1748958683; x=1749563483; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VzY+cZCL0448RY0GID08t4arF/zf+2+XaBNqbHYkIpY=;
        b=Av/3n279SaKSj42USvUm/c3kVUTs6Xincl7CE079+EfBadrdqsVXe2igcQYEuX6H9W
         /Uxi2BEK++AXm1hcC+RIE9gvjTMwtQ/Y5dw/z5TE3PxFdVH0Xg7XCle/wsqD/AHwLJc8
         1clArcA8VjkOXaoX6WxDcARz285OhPdIV31sjW31SQuEq65ZFeY0o8d81So0GXcp6oA/
         3d1ZEdOvknvkBp9VSLC7rsdfukmL2LqCHizqw18TwsQWnVPPK4zXzi/4pox7XoZ72y6G
         bnTfdKWC41o4GGtXwRul/7udtmo1UWkNnzY1UYccC7SjWha5GzxXPn7O60Iqu8GZKqnA
         1HiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748958683; x=1749563483;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VzY+cZCL0448RY0GID08t4arF/zf+2+XaBNqbHYkIpY=;
        b=EnQDs+1T2JDbNR83qPw7sDAtYPhz9yaEl3dH5cuPq0/SpR0SXIt4RP7gGWP3okNwnU
         Wq8sKFCHNvJBqszZTeAjmLe/a2fx/rMbtfqmg+9jalRgyGgJEF3I0/2vT+PAuwJTdjWn
         /GxYQGlkLdB745AIL48qWbNvaEZsNiX7VwADgLddqvhyF5ncHQpjIlefFfmHKQvdkudM
         6aveSFeLbBJ5cHbJehbOLCLyTMWibSqFg2y4asCYF6JDeDzNEOd15cSnZCuy4hFR+MXr
         vZ8wYGJsW0TAY7bC4POa9w7jNHk/FgeaSCQZqn/uudj2XAhN44zcfwu+zaCJRHs93MVo
         kiEw==
X-Forwarded-Encrypted: i=1; AJvYcCUNzYNFQS7rNLhHXPj2Xbx6FOBYoh12Ad18PzOfBQaKwx2uYJ8XDKQc0usaQuhf1Fj2O8eIeT0YDcXzED4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyVfOrDAbLR5663LqU5hAaEKN67IIn8vs1RcIzqpiuruX1FDNlt
	wHKEesYcjXqXOlkSPRZHgyb0o56t4i++wOK1h31pbVlvAScCIBrUeTf5+oAP2wJdqRI8ikSW/Uy
	Nd8RG
X-Gm-Gg: ASbGncvTu12BDw+732Q29KMEVdLb/2YExK6IPc6Bzmm3RirqIH8ialig3cZbYfIQW0X
	xjf7ifsla09Sa+0Dhz2N2/Cvyc3ntW2Eh2T9N8qN6N+xamciBVPzjaKeQ0aR8cpF2wyRC4oqJ9Z
	SXJ96bAwNSi+nU+lesagtCLADNfKYpNklzeu8IPqGC3DiH+kxjHlW+LN4e0Y/AvRLiOVzOZC7C6
	6GmfPQZQfelZewIZtaPJTyJiv8M6FdwvTLps6af1FkW3Qsku15CAmOU/tFZBZ7tJTW7SU193PPa
	Qj2nZYaofV5rr4gA9DGw6dccWDfmTNpeBbVBNyip2BbLkXt9tRHfPNlU0FrwoSPhFZn1v/6DjR8
	Uc6ml52s/OSlk6+Ds5QShe8sDCEQ=
X-Google-Smtp-Source: AGHT+IFvqH9ubcC6dbv0UqQGW5DGDtp+BZ9QNaQHwHo+bs9Vg0oCfSh3AzQ5xeJI5fTattmwccxXPg==
X-Received: by 2002:a05:6214:2aa3:b0:6fa:caa2:19bc with SMTP id 6a1803df08f44-6fad916605amr159392986d6.44.1748958672893;
        Tue, 03 Jun 2025 06:51:12 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fad0495cf2sm68040826d6.39.2025.06.03.06.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 06:51:12 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uMS2p-00000001hDX-3xh9;
	Tue, 03 Jun 2025 10:51:11 -0300
Date: Tue, 3 Jun 2025 10:51:11 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alistair Popple <apopple@nvidia.com>
Cc: linux-mm@kvack.org, gerald.schaefer@linux.ibm.com,
	dan.j.williams@intel.com, willy@infradead.org, david@redhat.com,
	linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
	zhang.lyra@gmail.com, debug@rivosinc.com, bjorn@kernel.org,
	balbirs@nvidia.com, lorenzo.stoakes@oracle.com,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-cxl@vger.kernel.org, dri-devel@lists.freedesktop.org,
	John@groves.net
Subject: Re: [PATCH 12/12] mm/memremap: Remove unused devmap_managed_key
Message-ID: <20250603135111.GM386142@ziepe.ca>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <112f77932e2dc6927ee77017533bf8e0194c96da.1748500293.git-series.apopple@nvidia.com>
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
In-Reply-To: <112f77932e2dc6927ee77017533bf8e0194c96da.1748500293.git-series.apopple@nvidia.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, May 29, 2025 at 04:32:13PM +1000, Alistair Popple wrote:
> It's no longer used so remove it.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---
>  mm/memremap.c | 27 ---------------------------
>  1 file changed, 27 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

