Return-Path: <linuxppc-dev+bounces-9099-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B2307ACC804
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Jun 2025 15:37:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bBWx44NnCz2yRn;
	Tue,  3 Jun 2025 23:37:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::82f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748957864;
	cv=none; b=Bm8GKldigxBYusWNBCMV1i1q2EPlFZNcpF0tOXrSon93bmiE97JjgCJLR7HGKqtuXwDQtqESuTb0+via603RrRC7rEZ8DDfDt8O9k8WdZ4ftih8v5NzCs3LpfwNY1hX2xEqMy343twZSDfWoCXk5UDHnW34T22S2NlKQmtxpXN2LcujuSDkYr0lNXjQrmJ3kYvmAv7k4jTOuk6OceiGlvgkKGIjpITw+v1bdfUEbF3/VLAlQN0jJCMPkV5iuoydf4y6TYEYqijgzDXCEz0yysQJvz+/0VDDTGpVnaaflSgbh62/bprrMNCMUvxgCTGKOkna6dcd+a8sTmbNAeiSvvg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748957864; c=relaxed/relaxed;
	bh=UoX6ZYAbWcKDR6KFcgyyRoqI5kTXzqc7rOw8qvSUCMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ADbO42SHrLginuJQte4fne45kxLP9HYwHwwO2ph4lM+0wGZBCqeWIUkB6kHNwhir+7Eq+Sehq4tiWGGkiNuiK0EGRgnTyxr2Q4XL5rduofEGJcT7kyX37WYAyCGeTIybyTxWSxfPfobRijVqCj2SbzVk1RJnB4gdNnbjgj8WEUN6z8wcNdKSY885vcRDxpEbruQLs6HPMz0iTJLb1V35qWHQJv8EdJHsEgmU7Gc8jUeJcxR+BgQJEktP9YvgrksrqLX9KTmGLTLzWGlYoxGbdg7R7Ep3jr96cYVBPvHy3DH4hNoWPyvDx6cDWApXzvjTvvcN7tabEB3nB4g3nrHq3A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=EjnqLYu6; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::82f; helo=mail-qt1-x82f.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org) smtp.mailfrom=ziepe.ca
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=EjnqLYu6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::82f; helo=mail-qt1-x82f.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org)
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bBWx36Pmhz2yPS
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Jun 2025 23:37:43 +1000 (AEST)
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-4a589b7dd5fso35498151cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Jun 2025 06:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1748957861; x=1749562661; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UoX6ZYAbWcKDR6KFcgyyRoqI5kTXzqc7rOw8qvSUCMg=;
        b=EjnqLYu6VfLY/21DmZZZ5GaV2UE5k5x6Wa3X2hTpS9jCMD4Aq7NCtGAFJEi3KTo3NK
         sSjQKQMj0zA6PsXNf+2X8Q0aVOabMiTd55ylVwhLzPCs1PIuGAp+82KEzOVAzq/mxrHf
         vgw1NvyX3PFR9c97Eq1KbMPumXJoTInY302J1o5EixbUGNLpAWYF6ZuhbBKXuW8ppo9Q
         CdhBMPhgoQCjQR/qrxjEZOMxdnR0zVIvFouC60gA9VlFzivwQJx8Lyo6WxQwYU6fFGCd
         WJ0tQLeHgIzcyMopxfol0xzK+PPa5Qv3LHrRJX4+xincrn9a/mu7FzfZZB9+ORwnsQRB
         nxdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748957861; x=1749562661;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UoX6ZYAbWcKDR6KFcgyyRoqI5kTXzqc7rOw8qvSUCMg=;
        b=lggSfXZBrDN5f/RFPRkzjycB1w6CIBKPPjgxJtFd/Z6HlNJz70E77mBuwQ+SoSdo+a
         ywn9MxQRT0Mswsw06Fg0YhZQsLZimdNzMUh7ToO5zTkMM65oEgCNwwlufNmwwJBm+Ik/
         GhCde4a/ZClNOffeL2vuxtXs2yqfgakmg5e2MUEyRrNzpTMF8ZvkYPP4fGzDP3bPLMBF
         O+E7hxHhknPX5/idrz8G/v4SW+mT0eA+yRYB3Ix2UmYzmmu+5MYatodkyW8nbmzlLRIr
         vsCmQC4r0qB+f7USfssOGhOgZll+Nk9X3kaRENVWWX3E/WT2tw1oLFTt8nUQ+MmXbGSD
         sz4w==
X-Forwarded-Encrypted: i=1; AJvYcCVFv4/dc6LJp6wtmo3Aoh3QEoeJHM5KssEtINmf61uvQn92Q7PuIF1Kr311qWybH/4eL0LNoRIuoxrFsEI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwFbwCYXBWYgmtB+klQYjAegDilzt50zb1iA+6InCQeD1nEWZu3
	1DNATJcAX+2w60EXD5cFH7KzyKnJAj4aSzz0KBdP0cKwPqzju+gZBuwDPFRi0ewAE6s=
X-Gm-Gg: ASbGncujy0MFrBBaK6TBLXi+n/qKU9tQWBDwcPFdZYQPWu6nrdQ+a9TtSnI/db+vNrP
	i3QBi8YhIEywHhSFF4h7SiOE5XVs88qef2VFYb3d+cB12mc8YK9A4vHdIzjxYJsMo/5gSiW09Iu
	rBwEjU3CdLgawyPQzISxxWo9WCuDBdIij4Uqu7fpDgdhpEeHUpR9Qv8mwqiVahez1bC3KMjAyjZ
	h1J0oHKDhmca5X0jzm0ZLzeOPAqpTl7ammCE5FR9Gd5bIwPOECmvGw2fRI6lVFiOZWTSPA7mILu
	Gbblr3c1ezz8ZEaLxPfnwRBTB3X976GK7n9IVCZ4B58o9kzqoXXZoxTTbp3ElMf45O3SRt8BpSK
	qbzjhCE4EIhof3CN56YaK6lo9larQyaaA7GGd8g==
X-Google-Smtp-Source: AGHT+IHIja21FGplZEuqybwyfzBxoI5k6ggct08qhelvg2n2Sr3vDQGi+qZrCCr84f/KmAHse8r0Yw==
X-Received: by 2002:a05:622a:4c16:b0:4a4:2e99:3a92 with SMTP id d75a77b69052e-4a443f2d1a2mr265367291cf.38.1748957861491;
        Tue, 03 Jun 2025 06:37:41 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a435a36e1bsm73924021cf.62.2025.06.03.06.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 06:37:40 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uMRpk-00000001h5v-1tYD;
	Tue, 03 Jun 2025 10:37:40 -0300
Date: Tue, 3 Jun 2025 10:37:40 -0300
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
Subject: Re: [PATCH 04/12] mm: Convert vmf_insert_mixed() from using
 pte_devmap to pte_special
Message-ID: <20250603133740.GE386142@ziepe.ca>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <171c8ae407198160c434797a96fe56d837cdc1cd.1748500293.git-series.apopple@nvidia.com>
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
In-Reply-To: <171c8ae407198160c434797a96fe56d837cdc1cd.1748500293.git-series.apopple@nvidia.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, May 29, 2025 at 04:32:05PM +1000, Alistair Popple wrote:
> DAX no longer requires device PTEs as it always has a ZONE_DEVICE page
> associated with the PTE that can be reference counted normally. Other users
> of pte_devmap are drivers that set PFN_DEV when calling vmf_insert_mixed()
> which ensures vm_normal_page() returns NULL for these entries.
> 
> There is no reason to distinguish these pte_devmap users so in order to
> free up a PTE bit use pte_special instead for entries created with
> vmf_insert_mixed(). This will ensure vm_normal_page() will continue to
> return NULL for these pages.
> 
> Architectures that don't support pte_special also don't support pte_devmap
> so those will continue to rely on pfn_valid() to determine if the page can
> be mapped.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---
>  mm/hmm.c    |  3 ---
>  mm/memory.c | 20 ++------------------
>  mm/vmscan.c |  2 +-
>  3 files changed, 3 insertions(+), 22 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

