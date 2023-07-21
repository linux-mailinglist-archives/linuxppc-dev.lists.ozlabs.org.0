Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F72375D4F1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jul 2023 21:26:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=XQzjypm8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R70122vPJz3cWg
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jul 2023 05:26:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=XQzjypm8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R70042tM4z30hW
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jul 2023 05:25:53 +1000 (AEST)
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-26307d808a4so1317578a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jul 2023 12:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1689967550; x=1690572350;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MMsZNxLO6ied/G62NsNmuJtbpPqA/ZDXuniKdHv3YB4=;
        b=XQzjypm8qf/fouvehrBkEZjx7rraTNYkUvdCKXn1r1gfZnRnhcrrwzmNXN35Uu7gzI
         8oZahINtXmo9uCfjOT5mfF9tPFqadYED4ml2Rvg4gr4OGGmk2vfi6ALPhCVFDbYVbCVR
         bizj8weYssavNq2IYvHIenQVmt+p9+kOYvZhgrRMHxTk+VUEpNpnyoTxavBUyIHeBvaf
         qo1QRc6+YoA80RoGKZsLsD7vsvUGziFJq2u5Wn3UEGI6GwRgyCcJvjby4g2TfS0YmrN7
         IaJoLwJh5sfemxuaaNtQypWoArXN7KcGOCwTG4BZdi4RfD5EEjDf6oZVJxfS3TMV68DT
         4znQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689967550; x=1690572350;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MMsZNxLO6ied/G62NsNmuJtbpPqA/ZDXuniKdHv3YB4=;
        b=ZqFan+GULzQ6P9Zsq9RUu48cBElBiCkou9kkM0WkJ+we+/9vQui1uX5V6s6F5Y9RKQ
         6UGM7oTKLBR5MLutr/XNg2B1BsL+wAl/lYt+RVpAtL9P9COYp3E8NJBMpXNvNlXVQcnI
         mRvTxbu0Yw/zLgahBmGDr1gkEETMPl9f0vVBOwBzYiLR/rIEDSMVZZsOBfOQqVM8cSZt
         6e5xygFHkZCWVEZP7lHzNR6RlmrtHjwNipx3n9PC+pGCprxCMkU62RYLYlFdtMOPHqNa
         5gFDbx2XKxGJrZsZ3JVzrpZDIY1e7CFk6+dGLsNqKGWEvR9ZEhhDmsr17YBumbD3Nz+9
         1OjQ==
X-Gm-Message-State: ABy/qLZKxHgrGqauWEvuGLkoPdSgktcE5ujUCSec9WxmzBhD8tyFbCYj
	yREQi55Mqg781N+9PxmOEL2xqQ==
X-Google-Smtp-Source: APBJJlEp8s38SXROq49pagsC5pVvuYXs5UAkGBJHAYanGZ9PMcBXp3bCvAhBUtgXgds2MFlgz7aUow==
X-Received: by 2002:a17:90b:2308:b0:262:f06d:c0fc with SMTP id mt8-20020a17090b230800b00262f06dc0fcmr2530695pjb.7.1689967550531;
        Fri, 21 Jul 2023 12:25:50 -0700 (PDT)
Received: from ziepe.ca ([206.223.160.26])
        by smtp.gmail.com with ESMTPSA id d5-20020a17090a8d8500b0025bd4db25f0sm2845416pjo.53.2023.07.21.12.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 12:25:49 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1qMvl5-003ID1-Uq;
	Fri, 21 Jul 2023 16:25:47 -0300
Date: Fri, 21 Jul 2023 16:25:47 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v3 1/5] arm64/smmu: Use TLBI ASID when invalidating
 entire range
Message-ID: <ZLrbu6vk6x7l6xwJ@ziepe.ca>
References: <cover.b24362332ec6099bc8db4e8e06a67545c653291d.1689842332.git-series.apopple@nvidia.com>
 <082390057ec33969c81d49d35aa3024d7082b0bd.1689842332.git-series.apopple@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <082390057ec33969c81d49d35aa3024d7082b0bd.1689842332.git-series.apopple@nvidia.com>
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

On Thu, Jul 20, 2023 at 06:39:23PM +1000, Alistair Popple wrote:
> The ARM SMMU has a specific command for invalidating the TLB for an
> entire ASID. Currently this is used for the IO_PGTABLE API but not for
> ATS when called from the MMU notifier.
> 
> The current implementation of notifiers does not attempt to invalidate
> such a large address range, instead walking each VMA and invalidating
> each range individually during mmap removal. However in future SMMU
> TLB invalidations are going to be sent as part of the normal
> flush_tlb_*() kernel calls. To better deal with that add handling to
> use TLBI ASID when invalidating the entire address space.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
