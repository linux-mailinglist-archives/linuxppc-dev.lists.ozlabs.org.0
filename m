Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D04047584D5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 20:30:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=i3PLfLk9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R56vL5Gw9z30gL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 04:30:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=i3PLfLk9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R56tP0v90z2yFC
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jul 2023 04:29:31 +1000 (AEST)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-666ecf9a081so6037593b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 11:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1689704969; x=1692296969;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S7o51YlRNS3zPl1LsUYTJR0KoGseri+clhYp1sqA+7o=;
        b=i3PLfLk9r7NY7Uevj6PA3cYqDyv4GmY8ZTpAyOTEMVm18YLHoILcZ61oG+F9iFTHtV
         OX8jgLzmPYLYjT5nTvuf48EZuGhjT3nXDpUtIzZoLmFT/vwScgj8TKUey6e+GcVODdO/
         aR6/yFWorh49MLpPBPS4KJKiFuCN20/QPxl/yYbUzWAditSFcUD4YBXKid/OyWwMGSU4
         hTdhkYgK99mIeIotW/7zP2M7qvX9TABdVEY82e39977TCXOnZTAAMs6Q2HmEVszoN4iv
         VRVVMQY0DZtRHIz7VWFEh8j8Dqyv1YGRYWzfSCH0PzDWSbsFyOPnQYwqfHvs+eC+iMQF
         VveA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689704969; x=1692296969;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S7o51YlRNS3zPl1LsUYTJR0KoGseri+clhYp1sqA+7o=;
        b=Y+RLTVGVJR89573I7f2MqjxHawOPUw6Yc/2KxdFpRa0iQuhmOpr1E/CygRAGDHv6C+
         +r5DScTKRw47R/+QwqcRnMmiHr52u6OoB/MFOlpVTyOb8UZw0vESr8Ud9wb2iHFoIGm1
         f2tzx6sZ6UYaeL693ggZb7+8V6Swe3FZ037kzjTOpbp14V2K2iimN+ZhANtifkgt3NRg
         GNKmaPdhPcRPPq0kJQvB/egc4QKgqyIy1fY4LRWBxEtw6vkjzJUQhuNkuXiXB0ZMrlZ9
         gzNGPzbMvUJXgsuXkBE9yehCxYZFAfYLOgMpG/zo6xjdGCS/m1bj4HNr/nzIAKpTfQfV
         d/wQ==
X-Gm-Message-State: ABy/qLbOH25Hk/A7ezWvPfcW6GdiDlNo2yWp39RccxT8kMBGg59Xs9JW
	o0GuQrcnBg44mXgpOkyin0QQTw==
X-Google-Smtp-Source: APBJJlGRXuPRhwkyVNmCMc2KhNqjSUeDWEj142071UHQ2p4xg0uemtxHiHrQn61P1ux7F7gEcQuZIA==
X-Received: by 2002:a05:6a00:3a1d:b0:668:8705:57cf with SMTP id fj29-20020a056a003a1d00b00668870557cfmr19016531pfb.25.1689704968961;
        Tue, 18 Jul 2023 11:29:28 -0700 (PDT)
Received: from ziepe.ca ([206.223.160.26])
        by smtp.gmail.com with ESMTPSA id u21-20020aa78395000000b0065434edd521sm1797726pfm.196.2023.07.18.11.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 11:29:28 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1qLpRu-002ayW-Jq;
	Tue, 18 Jul 2023 15:29:26 -0300
Date: Tue, 18 Jul 2023 15:29:26 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 3/4] mmu_notifiers: Call arch_invalidate_secondary_tlbs()
 when invalidating TLBs
Message-ID: <ZLbaBpfaAqigFzIT@ziepe.ca>
References: <cover.b4454f7f3d0afbfe1965e8026823cd50a42954b4.1689666760.git-series.apopple@nvidia.com>
 <791a6c1c4a79de6f99bffc594b53a39a6234e87f.1689666760.git-series.apopple@nvidia.com>
 <20230718111759.5642b4c4ffd72ddd9c8aa29f@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230718111759.5642b4c4ffd72ddd9c8aa29f@linux-foundation.org>
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
Cc: kevin.tian@intel.com, x86@kernel.org, ajd@linux.ibm.com, kvm@vger.kernel.org, catalin.marinas@arm.com, Alistair Popple <apopple@nvidia.com>, will@kernel.org, linux-kernel@vger.kernel.org, npiggin@gmail.com, zhi.wang.linux@gmail.com, linux-mm@kvack.org, iommu@lists.linux.dev, nicolinc@nvidia.com, jhubbard@nvidia.com, fbarrat@linux.ibm.com, seanjc@google.com, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, robin.murphy@arm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 18, 2023 at 11:17:59AM -0700, Andrew Morton wrote:
> On Tue, 18 Jul 2023 17:56:17 +1000 Alistair Popple <apopple@nvidia.com> wrote:
> 
> > The arch_invalidate_secondary_tlbs() is an architecture specific mmu
> > notifier used to keep the TLB of secondary MMUs such as an IOMMU in
> > sync with the CPU page tables. Currently it is called from separate
> > code paths to the main CPU TLB invalidations. This can lead to a
> > secondary TLB not getting invalidated when required and makes it hard
> > to reason about when exactly the secondary TLB is invalidated.
> > 
> > To fix this move the notifier call to the architecture specific TLB
> > maintenance functions for architectures that have secondary MMUs
> > requiring explicit software invalidations.
> > 
> > This fixes a SMMU bug on ARM64. On ARM64 PTE permission upgrades
> > require a TLB invalidation. This invalidation is done by the
> > architecutre specific ptep_set_access_flags() which calls
> > flush_tlb_page() if required. However this doesn't call the notifier
> > resulting in infinite faults being generated by devices using the SMMU
> > if it has previously cached a read-only PTE in it's TLB.
> 
> This sounds like a pretty serious bug.  Can it happen in current
> released kernels?  If so, is a -stable backport needed?

There are currently no in-kernel drivers using the IOMMU SVA API, so
the impact for -stable is sort of muted. But it is serious if you are
unlucky to hit it.

Jason
