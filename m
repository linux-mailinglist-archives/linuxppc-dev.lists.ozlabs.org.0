Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7502275D509
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jul 2023 21:30:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=GfaxQaKw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R704v2S20z3cZ9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jul 2023 05:30:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=GfaxQaKw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R703z1ST4z3bl6
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jul 2023 05:29:19 +1000 (AEST)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6686c74183cso2005226b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jul 2023 12:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1689967756; x=1690572556;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6PVgaqPhmt4wq0AWBCFQwFhvxfFvbSlDYNh4o0Ppojs=;
        b=GfaxQaKw5x3cV3SfUeA/pzqiy5kUPg0RiENjQHq5dJ46ftZgr6GcEH/8NPMVHUyb15
         On/HsOGxBo53R9kz/XnoR9KMjvnJ97KGyHZILWXEZUXDlYAOXodZDrfICC/dFZ/SBWkd
         1A9RMfpQiCSehrZEKBRYWCGM6pKRLOddyYpQM6Qny0c2Dyrj6km1I0ScE3lw/3LopZBU
         mHYA9vyZkoPJGJHI+Ym0bW0XfaN4vFlO0PPvWesldgcLxIRfysJNLp6bSRDAquiwOdvT
         eYGeNlDw9g03rR9btRmI3899ViEqGdpcH6xzhKko4eGdvLMWmTIAcasv3gC2fW/6G2ma
         6EnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689967756; x=1690572556;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6PVgaqPhmt4wq0AWBCFQwFhvxfFvbSlDYNh4o0Ppojs=;
        b=lo9yevo6armvQKKcEHqIXBfozbKCfu5Q5+UpvpVRcuMs88ubxykkcrbrYDhLJTa9PW
         bV4fuSkkaRXTRQKulRLDyxaBEGOuomBLBXLGth29/38d3jFybzpmG4CFhmpK7ZPs9yK1
         9QRv4QHMnfSNYJjDsPTA82eTpmmSQwhezx9tJ2CkT8RTDtfKVXS/M05F3gO9pw2z3iUK
         eT52JaijgAfITJHAVitnv33wy3z2IWCYDXQbj1GRy1CHQUoFf2IrFSipkwUSKUzn7aAf
         Nc/3/2Bfenv2imQbl640BtYzOSuurAkAKXp5ZRiwBiJuEknMleGSh6JZwM8PFh0meqc+
         4qRg==
X-Gm-Message-State: ABy/qLbznIWPX0U8kYLAyMWd7c1YuraYoenXAE0OtYOqSSygXtPjmcRw
	EIcSfZ0et52/LEK0sTUms7kGag==
X-Google-Smtp-Source: APBJJlHhX/ECiPtAgKTdPj/SAH5GJPTRrsthr/G8wSLG2KG1XyYAjgc1lH1BQS59ustvdAeajObIAA==
X-Received: by 2002:a05:6a20:8f15:b0:137:293b:f9c0 with SMTP id b21-20020a056a208f1500b00137293bf9c0mr3542725pzk.33.1689967756135;
        Fri, 21 Jul 2023 12:29:16 -0700 (PDT)
Received: from ziepe.ca ([206.223.160.26])
        by smtp.gmail.com with ESMTPSA id i14-20020a63bf4e000000b0054ff36967f7sm3181162pgo.54.2023.07.21.12.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 12:29:15 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1qMvoP-003IF4-QK;
	Fri, 21 Jul 2023 16:29:13 -0300
Date: Fri, 21 Jul 2023 16:29:13 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v3 4/5] mmu_notifiers: Don't invalidate secondary TLBs as
 part of mmu_notifier_invalidate_range_end()
Message-ID: <ZLrciTXW9CfLCLar@ziepe.ca>
References: <cover.b24362332ec6099bc8db4e8e06a67545c653291d.1689842332.git-series.apopple@nvidia.com>
 <141e786b68527b1db9fc5a3259066c360448e7a4.1689842332.git-series.apopple@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <141e786b68527b1db9fc5a3259066c360448e7a4.1689842332.git-series.apopple@nvidia.com>
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

On Thu, Jul 20, 2023 at 06:39:26PM +1000, Alistair Popple wrote:
> Secondary TLBs are now invalidated from the architecture specific TLB
> invalidation functions. Therefore there is no need to explicitly
> notify or invalidate as part of the range end functions. This means we
> can remove mmu_notifier_invalidate_range_end_only() and some of the
> ptep_*_notify() functions.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---
>  include/linux/mmu_notifier.h | 56 +------------------------------------
>  kernel/events/uprobes.c      |  2 +-
>  mm/huge_memory.c             | 25 ++---------------
>  mm/hugetlb.c                 |  1 +-
>  mm/memory.c                  |  8 +----
>  mm/migrate_device.c          |  9 +-----
>  mm/mmu_notifier.c            | 25 ++---------------
>  mm/rmap.c                    | 40 +--------------------------
>  8 files changed, 14 insertions(+), 152 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
