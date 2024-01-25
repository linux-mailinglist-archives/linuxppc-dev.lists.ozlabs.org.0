Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5E883C752
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jan 2024 16:53:44 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=DtNuW2WP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TLQNQ15bNz3cYY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jan 2024 02:53:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=DtNuW2WP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::72a; helo=mail-qk1-x72a.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org)
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TLQMd6SQ0z3cCh
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jan 2024 02:53:01 +1100 (AEDT)
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-783bc26b24aso63617085a.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jan 2024 07:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1706197978; x=1706802778; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nXkcT03fQJzA7SU2tkYYGBe/1RUS6Vir93r0aF05Hs4=;
        b=DtNuW2WPhlQC4Zf/GIqdNvfdIEJYGJgDnda5hhqYijYj3TME0KMdkyj6RiX2G7FDgm
         woocy5pVXLqovF5775VQjQr0/VnqESiPt3lf4T/+aJyS/OwP9DrlyxaI3Cvtc5jkLXW+
         gMtVCL21G5hmR9PmWDXhf+hMbMDvkzDUONZKaUorpgrELoyVsUpcrAlqVbFNG2g/K/lO
         7gKOuF3QkGgKP8DHdbtPyWDVIsID3BBLpbxVHDx/dGggNx1Aupew/++h6rTxjg94gGcv
         G9H7miHDbLbLGw+ll874ec1f2cFKF7P8/JKlqWMMJL1WxRMcRJltp6qk2veSZuLB847C
         SypA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706197978; x=1706802778;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nXkcT03fQJzA7SU2tkYYGBe/1RUS6Vir93r0aF05Hs4=;
        b=PcbMySsfB7U5ZoefuLwPBqPhG6l5csnz0h+zWI9PvHBzDbCMzl2uIKgjhg373hUUge
         eXRs7cupFjmvy76BndYkpo5SNtg3NtMKY5uyLzNkwZ05WcEunODkABl+5gyM46KciYlI
         kwewwqVoNnOJAdFCrMMi+WQX3MsLd2MK+2XyT764uBteRXOBaExwhXJHe6rIgUhDYiEs
         AAceEZ8tKAnej/ZpJiFCFEmAZ0wKSTK6N0MBG2MZe/3oX2I7ndSAKRaDNVAC1d2ZbOPc
         QwgzmglrcJsrSWAOneKiw5UvFd9SD+DhNfuGpeYYEWoQQd4qzszf5/NjRf3vmle6yrrB
         7WXA==
X-Gm-Message-State: AOJu0YwkjRtfN4kgI9EsCYWHQdvgfazr2AilsAWFrqXeLhu00ecnN6gv
	1TWG7OobYisLp1It7vbwkEYq6KguwTNvojXwQLD3/PTOEyeeRTrymENjCo+alTI=
X-Google-Smtp-Source: AGHT+IHXajryzJQCCc/lrmBpkvYox8Vi8CCsZcjFR2/aDDSHWFndELKjMTjZNZKUBFCwhwt7YOyYOA==
X-Received: by 2002:a05:620a:2ed:b0:783:9b7c:50c with SMTP id a13-20020a05620a02ed00b007839b7c050cmr1365722qko.119.1706197978503;
        Thu, 25 Jan 2024 07:52:58 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id j28-20020a05620a0a5c00b007833dbbc07asm5167764qka.0.2024.01.25.07.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 07:52:58 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1rT22D-0091ri-E7;
	Thu, 25 Jan 2024 11:52:57 -0400
Date: Thu, 25 Jan 2024 11:52:57 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Shivaprasad G Bhat <sbhat@linux.ibm.com>
Subject: Re: [PATCH 2/2] iommu: Fix the domain type checks when
 default_domain is set
Message-ID: <20240125155257.GX50608@ziepe.ca>
References: <170618450592.3805.8216395093813382208.stgit@ltcd48-lp2.aus.stglab.ibm.com>
 <170618452753.3805.4425669653666211728.stgit@ltcd48-lp2.aus.stglab.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <170618452753.3805.4425669653666211728.stgit@ltcd48-lp2.aus.stglab.ibm.com>
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
Cc: jroedel@suse.de, gbatra@linux.vnet.ibm.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, aneesh.kumar@kernel.org, tpearson@raptorengineering.com, iommu@lists.linux.dev, npiggin@gmail.com, bgray@linux.ibm.com, naveen.n.rao@linux.ibm.com, vaibhav@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, aik@amd.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 25, 2024 at 06:08:52AM -0600, Shivaprasad G Bhat wrote:
> On PPC64, the iommu_ops.def_domain_type() is not defined and
> CONFIG_IOMMU_DMA not enabled. With commit 0f6a90436a57 ("iommu: Do not
> use IOMMU_DOMAIN_DMA if CONFIG_IOMMU_DMA is not enabled"), the
> iommu_get_default_domain_type() return IOMMU_DOMAIN_IDENTITY. With
> commit 2ad56efa80db ("powerpc/iommu: Setup a default domain and remove
> set_platform_dma_ops"), the defaule_domain is set wih the type being
> PLATFORM. With these two changes, iommu_group_alloc_default_domain()
> ends up returning the NULL(with recent changes, ERR_PTR(-EINVAL))
> leading to iommu_probe_device() failure and the device has no
> iommu_group set in effect. Subsequently, the bind to vfio(VFIO_IOMMU)
> fail as the iommu_group is not set for the device.
> 
> Make the iommu_get_default_domain_type() to take default_domain->type
> into consideration along with default_domain_type() and fix
> iommu_group_alloc_default_domain() to not error out if the requested
> type is same as default domain type.
> 
> Fixes: 2ad56efa80db ("powerpc/iommu: Setup a default domain and remove set_platform_dma_ops")
> Fixes: 0f6a90436a57 ("iommu: Do not use IOMMU_DOMAIN_DMA if CONFIG_IOMMU_DMA is not enabled")
> Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
> ---
>  drivers/iommu/iommu.c |   14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)

Are you OK with this version?

https://lore.kernel.org/linux-iommu/20240123174905.GS50608@ziepe.ca/

?

I think it does the same thing

Jason
