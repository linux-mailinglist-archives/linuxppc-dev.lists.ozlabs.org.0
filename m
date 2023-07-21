Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B88BF75D50F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jul 2023 21:31:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=kDmWxsg8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R70704YfYz3cXW
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jul 2023 05:31:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=kDmWxsg8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R70691GPWz30BZ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jul 2023 05:31:11 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1b8b4749013so17016925ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jul 2023 12:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1689967868; x=1690572668;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f3fNBXK6DdLEjSA1dgCCAp4qYAepk3u3d3m0rz5z1fE=;
        b=kDmWxsg8ZqlraY3EitIJv4Evr2CcqLMRY3qJJ8AcjlKJ3bFOzgBkDnjKefyYbdeSfz
         k86T0qkxGRO51XZTaYeEKipExFEf8j1Hv1UVrlMbeSWAAge69sWytNfaMcA7RqeT6zuL
         3L23q9S/iI50qzztXd/HyH2HoeCpvu0Z2gNnWlaIpHe3ERs66DUZ8IU1MTauRcMdzksf
         ILJCbJ6VdIAYJt/7FJu58WJgwsSS2VgS9zoptDQ2XjWHdUPjgabRgHusalzm4+RsCynb
         dnms2eGvIrcLiBFxG5n4oVrQg7cm8ONAc3J+1xhZDfp15hiSb0l0fBegQfffD1CHZhNd
         TBLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689967868; x=1690572668;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f3fNBXK6DdLEjSA1dgCCAp4qYAepk3u3d3m0rz5z1fE=;
        b=dEX4raAe3iqrzMWlj3fu5Xx9la7qagY6qkGCVKXaXc3oJrgUkKEZzHOnVFJiIJEMdy
         r0N+6Z8OTSIGFqZHY/GcqKxEX/On2TiyxD8IFZcBRvYZbppc5zwwDrcmTWKbTwyV09Ko
         gHcKLU2UelZoyvPzomMlPXl4EwkD/b1erCupwUiSa/wFnK+oI9nfW8cQpoQORkoy5gnE
         TKNNq+Bb1zFi9q90yEaL95RH76EOD7efyJXQzJCiLpS4lJW28iXJjrr6rRvKi7brdTzo
         wzvXVSbnQHNBLuuF/hUZAPbIIIrBFBgwcjb3vfQ/BfxCUM3E8tUrTsU+iKir0RvX/Gb7
         L75A==
X-Gm-Message-State: ABy/qLYp6MdCZgMB0AKWfUis3aigRKa45Krbur5eSXbRi77QGJ4/p+7L
	Pml4vaJ/dzZtajDrwW2VmBms+g==
X-Google-Smtp-Source: APBJJlHihJyY9wXFkjydx/6tfCAtPCW82R9C1y8RYnU52rOS6+M8sM4/6qnSkSyFxd3dSuGWl4EDkw==
X-Received: by 2002:a17:902:b418:b0:1b8:b2c6:7e8d with SMTP id x24-20020a170902b41800b001b8b2c67e8dmr2649069plr.66.1689967868340;
        Fri, 21 Jul 2023 12:31:08 -0700 (PDT)
Received: from ziepe.ca ([206.223.160.26])
        by smtp.gmail.com with ESMTPSA id r16-20020a170902be1000b001b8422f1000sm3860137pls.201.2023.07.21.12.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 12:31:07 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1qMvqE-003IGg-98;
	Fri, 21 Jul 2023 16:31:06 -0300
Date: Fri, 21 Jul 2023 16:31:06 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v3 5/5] mmu_notifiers: Rename invalidate_range notifier
Message-ID: <ZLrc+vEQcCEpI0wd@ziepe.ca>
References: <cover.b24362332ec6099bc8db4e8e06a67545c653291d.1689842332.git-series.apopple@nvidia.com>
 <3cbd2a644d56d503b47cfc35868d547f924f880e.1689842332.git-series.apopple@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3cbd2a644d56d503b47cfc35868d547f924f880e.1689842332.git-series.apopple@nvidia.com>
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
Cc: kevin.tian@intel.com, x86@kernel.org, ajd@linux.ibm.com, kvm@vger.kernel.org, catalin.marinas@arm.com, seanjc@google.com, will@kernel.org, linux-kernel@vger.kernel.org, npiggin@gmail.com, zhi.wang.linux@gmail.com, linux-mm@kvack.org, iommu@lists.linux.dev, sj@kernel.org, nicolinc@nvidia.com, jhubbard@nvidia.com, fbarrat@linux.ibm.com, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, robin.murphy@arm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 20, 2023 at 06:39:27PM +1000, Alistair Popple wrote:
> There are two main use cases for mmu notifiers. One is by KVM which
> uses mmu_notifier_invalidate_range_start()/end() to manage a software
> TLB.
> 
> The other is to manage hardware TLBs which need to use the
> invalidate_range() callback because HW can establish new TLB entries
> at any time. Hence using start/end() can lead to memory corruption as
> these callbacks happen too soon/late during page unmap.
> 
> mmu notifier users should therefore either use the start()/end()
> callbacks or the invalidate_range() callbacks. To make this usage
> clearer rename the invalidate_range() callback to
> arch_invalidate_secondary_tlbs() and update documention.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  arch/arm64/include/asm/tlbflush.h               |  6 +-
>  arch/powerpc/mm/book3s64/radix_hugetlbpage.c    |  2 +-
>  arch/powerpc/mm/book3s64/radix_tlb.c            | 10 ++--
>  arch/x86/include/asm/tlbflush.h                 |  2 +-
>  arch/x86/mm/tlb.c                               |  2 +-
>  drivers/iommu/amd/iommu_v2.c                    | 10 ++--
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c | 13 ++---
>  drivers/iommu/intel/svm.c                       |  8 +--
>  drivers/misc/ocxl/link.c                        |  8 +--
>  include/linux/mmu_notifier.h                    | 48 +++++++++---------
>  mm/huge_memory.c                                |  4 +-
>  mm/hugetlb.c                                    |  7 +--
>  mm/mmu_notifier.c                               | 20 ++++++--
>  13 files changed, 76 insertions(+), 64 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
