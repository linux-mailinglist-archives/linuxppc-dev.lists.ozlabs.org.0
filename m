Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 860F57D715B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Oct 2023 17:59:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=U+yq0mGb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SFtsV3NkLz3cVD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Oct 2023 02:59:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=U+yq0mGb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::c2a; helo=mail-oo1-xc2a.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com [IPv6:2607:f8b0:4864:20::c2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SFtrc1yN0z2xTm
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Oct 2023 02:58:38 +1100 (AEDT)
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-5842a94feb2so3213137eaf.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Oct 2023 08:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1698249514; x=1698854314; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xh9TIQAzLGtY8IKnRXxYUTC8KDsKOaw81BBkG/qg5HY=;
        b=U+yq0mGbZUrYv0lkHiiLuiJfjA0XixpdU+Bni6jI0zMHin6TcJTKaUoOY5rg0yHQnQ
         RZZmeudUv+N3me9fOb/qNvMfAjZk8VXE2dfs6/rss2UT6VQktYAqDEiBHC0CVgz5TLyE
         cVUPHmSNn90FTtFh5RgFSFS+IbXz68hI9LflpdNHKBY+b4IJhV5KUXKwTOugnSfNgYx9
         x+dWcFeB9ZK3LucYJiJIw7nH3ffkSysMlsjhulNoEcMptcRMJkcRFsa3nHpXt53uk5Wb
         4yO+Lxg8TiwTvRmavvaL4j/LA0l3jxb8Fnsacdf6xxKdesg7E8xTkVV8oHfUX2205cTE
         EGCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698249514; x=1698854314;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xh9TIQAzLGtY8IKnRXxYUTC8KDsKOaw81BBkG/qg5HY=;
        b=u4ZuyP6++6ykjXiDd/lwFKrVOSXKuklvQRU1qPyzbIK18051+bII0leNbrQM9/bhma
         +NRQr4llWzbLdEALcF7P2hsRb4SdREipZRWyqCpbvMSlIGi1ltXfnXrLUsF/4BCrEUhT
         E13PW6zBSjuL+Oyl6czQiXp2d8BSh3X632z4dIJqax6dV/jPLZILFPkFL/dwE639Vy/+
         kXbHQjNOv9uHm+B6z/htaYLnEYMq5MMO9W/LQpqVFLlep4CU6cOU/M8+theGhKR35e+/
         mP+Q0Pwaqc3UyLGiy9KuaPCdvViwA7gtQO2ivpamvtBs1BqD6/6nRJ2wpN1EEPbnfA59
         0zrA==
X-Gm-Message-State: AOJu0YxlESEJ0D5mKrgcl9MJnFDwwjU1kdLB7SoZuDZQUbiu1cPJtJ+/
	uKbcjRktDSiNSyqZg6MyyvPrng==
X-Google-Smtp-Source: AGHT+IFzIsrHLnoP3SfHHNSS732Byz8xbCh6I9WGwH1qvCmSKAsaFlHdvXIydQDBYtQoTuLU7GaqVw==
X-Received: by 2002:a4a:bd05:0:b0:581:ff09:62e4 with SMTP id n5-20020a4abd05000000b00581ff0962e4mr15571716oop.2.1698249513815;
        Wed, 25 Oct 2023 08:58:33 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-26-201.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.26.201])
        by smtp.gmail.com with ESMTPSA id y4-20020a4aaa44000000b0057e66fa004dsm26569oom.47.2023.10.25.08.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 08:58:33 -0700 (PDT)
From: jgg@ziepe.ca
X-Google-Original-From: Jason Gunthorpe <jgg@nvidia.com>, Joerg Roedel <joro@8bytes.org>
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1qvgHA-004tcE-CG;
	Wed, 25 Oct 2023 12:58:32 -0300
Date: Wed, 25 Oct 2023 12:58:32 -0300
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	David Woodhouse <dwmw2@infradead.org>, iommu@lists.linux.dev,
	Kevin Tian <kevin.tian@intel.com>,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	Hector Martin <marcan@marcan.st>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Sven Peter <sven@svenpeter.dev>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v2 0/9] iommu: Convert dart & iommufd to the new
 domain_alloc_paging()
Message-ID: <20231025155832.GA1167025@nvidia.com>
References: <0-v2-bff223cf6409+282-dart_paging_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0-v2-bff223cf6409+282-dart_paging_jgg@nvidia.com>
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
Cc: Janne Grunau <j@jannau.net>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 27, 2023 at 08:47:30PM -0300, Jason Gunthorpe wrote:
> Continue converting drivers to the new interface. Introduce
> ops->blocked_domain to hold the global static BLOCKED domain and convert
> all drivers supporting BLOCKED to use it.
> 
> This makes it trivial for dart and iommufd to convert over to
> domain_alloc_paging().
> 
> There are six drivers remaining:
> 
> drivers/iommu/amd/iommu.c:      .domain_alloc = amd_iommu_domain_alloc,
> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:    .domain_alloc           = arm_smmu_domain_alloc,
> drivers/iommu/arm/arm-smmu/arm-smmu.c:  .domain_alloc           = arm_smmu_domain_alloc,
> drivers/iommu/fsl_pamu_domain.c:        .domain_alloc   = fsl_pamu_domain_alloc,
> drivers/iommu/intel/iommu.c:    .domain_alloc           = intel_iommu_domain_alloc,
> drivers/iommu/virtio-iommu.c:   .domain_alloc           = viommu_domain_alloc,
> 
> v2:
>  - Rebase to Joerg's for-next
>  - New patch to remove force_bypass, as discussed with Janne
>  - Move some hunks between patches to accommodate Robin's change to the
>    attach_dev switch
> v1: https://lore.kernel.org/r/0-v1-8060f06462cc+c0a39-dart_paging_jgg@nvidia.com
> 
> Jason Gunthorpe (9):
>   iommu: Move IOMMU_DOMAIN_BLOCKED global statics to ops->blocked_domain
>   iommu/vt-d: Update the definition of the blocking domain
>   iommu/vt-d: Use ops->blocked_domain
>   iommufd: Convert to alloc_domain_paging()

Joerg can you grab these for this cycle please

>   iommu/dart: Use static global identity domains
>   iommu/dart: Move the blocked domain support to a global static
>   iommu/dart: Convert to domain_alloc_paging()
>   iommu/dart: Call apple_dart_finalize_domain() as part of
>     alloc_paging()
>   iommu/dart: Remove the force_bypass variable

I will poke more dart related people to get a tested-by, maybe next
cycle.

The arm patches at least need this

Thanks,
Jason
