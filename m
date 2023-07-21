Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F21E75D505
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jul 2023 21:28:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=ho7FX/Gu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R703006ZKz3cbM
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jul 2023 05:28:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=ho7FX/Gu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R701V0FmXz3cQm
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jul 2023 05:27:09 +1000 (AEST)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-666e64e97e2so1482667b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jul 2023 12:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1689967627; x=1690572427;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=D1nGAoqkQE9tORj40d+ZOdFx3TBXwI2iMVqB+EH0J9M=;
        b=ho7FX/Gu/yFttlKppWHadCl+z3p3hJNnyUWo1gZ62PEyBJbQY6EYc+cgqOF/vQCsNL
         Mkj3evoOdg5kQNIS2GHTYB2bsdau7no004XCgCzhg70C7hzjuBTgqZBM8fhGLoNoppsr
         kqTwMYeEw+ixSgRXlOs7lxHbvsOYYXsbxRGJLY9Xj9ZAmOizPWpr0ddjxYm6D/ZBDDur
         8kFjVO0kxTqPNd2AEoeDXPQtEpGr6MWERNLupARD7mBgQc27VY17l2Dq7N7guA1ips9f
         8Sf/a3XpW02K8gKcfPE6pA/EbZNlePzntRg9/8m15RDd8Lh+iQ3IDCBxkHiaCB8eeHk6
         pVoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689967627; x=1690572427;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D1nGAoqkQE9tORj40d+ZOdFx3TBXwI2iMVqB+EH0J9M=;
        b=YD2mSNoo5UgVidgNFcKVYFFfnsS0fF24piOJJlKe5nsMWvUUCEHedYIpqdodOuEPU1
         x0ZgCgiymXUFN2kN6uh5qYKCSFiLKvlYgOKdJqMx7S8qMsRPcHsgHXeWfXGo2IOgz+7H
         ZynfhmonQNl4z/Qrg0Ax67L+prz/bQ8/ojuw8WMpjJ1tWBdD/AGRPpzEtQOoLO6WoTw0
         WTabbMujescN0FhYOgkX7yWpX6vmWYDGoWntd0dPC2O7fM7/a3F6ap448HuDHDiKLI+s
         1gfrEM143/6umycWKtSsubQcwyOUi5tcTpHw9j4Bz9BXQsETVHUjAZ8ng96qz8/8yXUR
         NOvw==
X-Gm-Message-State: ABy/qLa3Mcn1u+8SPeK/aOT3zSGoH+i1ZplsnjxT2FMmrL8Vj6EW7rMj
	i08Y00Tmwe6qiKhaCKVzNqpjcA==
X-Google-Smtp-Source: APBJJlEJHy5FiukXEMdXavX4iO5BgBEVLB0I27AjF1BNpwKJMi9kmjgl4tr0TNNlWYEs0Uxb6e5yVA==
X-Received: by 2002:a05:6a20:8e1f:b0:122:20c:fbb1 with SMTP id y31-20020a056a208e1f00b00122020cfbb1mr3108454pzj.44.1689967626960;
        Fri, 21 Jul 2023 12:27:06 -0700 (PDT)
Received: from ziepe.ca ([206.223.160.26])
        by smtp.gmail.com with ESMTPSA id g2-20020aa78742000000b0066a31111ccdsm3333938pfo.65.2023.07.21.12.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 12:27:06 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1qMvmK-003IDr-B2;
	Fri, 21 Jul 2023 16:27:04 -0300
Date: Fri, 21 Jul 2023 16:27:04 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v3 3/5] mmu_notifiers: Call invalidate_range() when
 invalidating TLBs
Message-ID: <ZLrcCI5fyBcj2myR@ziepe.ca>
References: <cover.b24362332ec6099bc8db4e8e06a67545c653291d.1689842332.git-series.apopple@nvidia.com>
 <86a0bf86394f1765fcbf9890bbabb154ba8dd980.1689842332.git-series.apopple@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86a0bf86394f1765fcbf9890bbabb154ba8dd980.1689842332.git-series.apopple@nvidia.com>
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

On Thu, Jul 20, 2023 at 06:39:25PM +1000, Alistair Popple wrote:
> The invalidate_range() is going to become an architecture specific mmu
> notifier used to keep the TLB of secondary MMUs such as an IOMMU in
> sync with the CPU page tables. Currently it is called from separate
> code paths to the main CPU TLB invalidations. This can lead to a
> secondary TLB not getting invalidated when required and makes it hard
> to reason about when exactly the secondary TLB is invalidated.
> 
> To fix this move the notifier call to the architecture specific TLB
> maintenance functions for architectures that have secondary MMUs
> requiring explicit software invalidations.
> 
> This fixes a SMMU bug on ARM64. On ARM64 PTE permission upgrades
> require a TLB invalidation. This invalidation is done by the
> architecutre specific ptep_set_access_flags() which calls
> flush_tlb_page() if required. However this doesn't call the notifier
> resulting in infinite faults being generated by devices using the SMMU
> if it has previously cached a read-only PTE in it's TLB.
> 
> Moving the invalidations into the TLB invalidation functions ensures
> all invalidations happen at the same time as the CPU invalidation. The
> architecture specific flush_tlb_all() routines do not call the
> notifier as none of the IOMMUs require this.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Suggested-by: Jason Gunthorpe <jgg@ziepe.ca>
> Tested-by: SeongJae Park <sj@kernel.org>
> ---
>  arch/arm64/include/asm/tlbflush.h             | 5 +++++
>  arch/powerpc/include/asm/book3s/64/tlbflush.h | 1 +
>  arch/powerpc/mm/book3s64/radix_hugetlbpage.c  | 1 +
>  arch/powerpc/mm/book3s64/radix_tlb.c          | 6 ++++++
>  arch/x86/include/asm/tlbflush.h               | 2 ++
>  arch/x86/mm/tlb.c                             | 2 ++
>  include/asm-generic/tlb.h                     | 1 -
>  7 files changed, 17 insertions(+), 1 deletion(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
