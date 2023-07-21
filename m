Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0971C75D500
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jul 2023 21:27:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=PapxbFN9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R70206rb9z3c82
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jul 2023 05:27:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=PapxbFN9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R700Z2DTJz3cN9
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jul 2023 05:26:22 +1000 (AEST)
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-262ff3a4659so1325228a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jul 2023 12:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1689967579; x=1690572379;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xr6a3wPaSbxEaGpekcRzvtgOYy20EpF6cLmCTWGM/d8=;
        b=PapxbFN9nlQZ0hbhKVwwawBN6LdJjW3Jxp3CpwEUvmqx8VSIfzvyAWjZmPM7Kc45gi
         qopDwV5z676Si5veJkfi0qrd8a5xaySsryWYloQnQkx318xKe2pYBW9+lqkzldmdemE1
         99prBRal3lq3NgQTCz4ZW//9sRY8xNIj5NBo9hLhMiknT0FEv9J2i7fnVBCc6RRf9Znf
         uwsKZ1RZ5VKXjQYWscKe/M+wHdFj68hEhUuwbDqS0RyuhUHk9xpOWf2qzUNm03raJDUF
         LRxvhcmz1Sp9N4r1u6RxuFKGIRB8KKPMrUgr5brHzLqEYPIE9mcLBomKV+bnZZ4ylsbl
         XTPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689967579; x=1690572379;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xr6a3wPaSbxEaGpekcRzvtgOYy20EpF6cLmCTWGM/d8=;
        b=Xx4PA0Z/oZfhuM2vnoC6/uR3+xxGtM5e+Q4NY5fAje5+qAml37mBmNAuJYH+pb3KI0
         jFe/Y6GTg+Uz1SykVBQQUtR0BfPM6G4n8u/ER45mcfNN5xOAfBrUGtlzp97wACdXCqmN
         qpkn+IQpwFL6dAlz9Y0Up+L7rLFp50SVswxpQpg3AA1o2cVOXzq8jB1AyW8A0az6v4pL
         xZeQNaIfVdgMFiSKJEQ//45Rn8T0cWmiM6+EpSwm+7RCbFx8qQujXzJ1ZyltC+TlbFVc
         RV4p4M57P/LUgAABIOF/dkdwhm4E6NwCBZBqNeT62JudtCLTvcxTHjdYCle3bZTvUQ0w
         aPBg==
X-Gm-Message-State: ABy/qLbuJSiklEkf3MwCSRAqMcQLKMwbScw8XjN40TtjdIhQRwj/HzW1
	q+UwisWqMT6x2bHzwosxDGIhlw==
X-Google-Smtp-Source: APBJJlGqDcvhn/GzUoUrWJEAu6LLTtj6nE8lbyEgpTLg48+TgijhmiTggNpW3leZ2HelRF+2igrYUQ==
X-Received: by 2002:a17:90a:bb09:b0:260:fd64:a20 with SMTP id u9-20020a17090abb0900b00260fd640a20mr2495306pjr.9.1689967579259;
        Fri, 21 Jul 2023 12:26:19 -0700 (PDT)
Received: from ziepe.ca ([206.223.160.26])
        by smtp.gmail.com with ESMTPSA id e23-20020a17090ab39700b002609cadc56esm2802248pjr.11.2023.07.21.12.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 12:26:18 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1qMvlZ-003IDP-Dp;
	Fri, 21 Jul 2023 16:26:17 -0300
Date: Fri, 21 Jul 2023 16:26:17 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v3 2/5] mmu_notifiers: Fixup comment in
 mmu_interval_read_begin()
Message-ID: <ZLrb2Xq/ZgDgVPNf@ziepe.ca>
References: <cover.b24362332ec6099bc8db4e8e06a67545c653291d.1689842332.git-series.apopple@nvidia.com>
 <06fa82756e4d6458895962a7743cc7f162658a54.1689842332.git-series.apopple@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <06fa82756e4d6458895962a7743cc7f162658a54.1689842332.git-series.apopple@nvidia.com>
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

On Thu, Jul 20, 2023 at 06:39:24PM +1000, Alistair Popple wrote:
> The comment in mmu_interval_read_begin() refers to a function that
> doesn't exist and uses the wrong call-back name. The op for mmu
> interval notifiers is mmu_interval_notifier_ops->invalidate() so fix
> the comment up to reflect that.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---
>  mm/mmu_notifier.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
