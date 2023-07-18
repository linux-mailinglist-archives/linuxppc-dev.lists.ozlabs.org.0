Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DAF97584E9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 20:37:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=rSwv4V3D;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R57382yb2z30YT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 04:37:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=rSwv4V3D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R572K0K45z2xTR
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jul 2023 04:36:23 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 33063616A8;
	Tue, 18 Jul 2023 18:36:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE9F2C433C8;
	Tue, 18 Jul 2023 18:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1689705381;
	bh=JgrHe5DZ5UnZ31Le+DdrjV7UqhJAEhx+BMwzO0I0pyk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=rSwv4V3DUswnOOwtuqviHoHg8mtQl8Mycp8naGrr017s7gsEUs+LUFgW78b59OlD6
	 RJ07+aYugwPVV2ffN02N+TbXLoW/RPNxLL/RW1q/hReBJmWPBWvyF6ARM4VWnVkHi/
	 WwOrnVSIGZK5bXjK7yuuDSaj1cyDMcQJVsSO4MIU=
Date: Tue, 18 Jul 2023 11:36:20 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 1/4] mm_notifiers: Rename invalidate_range notifier
Message-Id: <20230718113620.fb29217344238307c3be76d7@linux-foundation.org>
In-Reply-To: <ZLbSeO+XjSx1W795@ziepe.ca>
References: <cover.b4454f7f3d0afbfe1965e8026823cd50a42954b4.1689666760.git-series.apopple@nvidia.com>
	<c0daf0870f7220bbf815713463aff86970a5d0fa.1689666760.git-series.apopple@nvidia.com>
	<ZLbSeO+XjSx1W795@ziepe.ca>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Tue, 18 Jul 2023 14:57:12 -0300 Jason Gunthorpe <jgg@ziepe.ca> wrote:

> On Tue, Jul 18, 2023 at 05:56:15PM +1000, Alistair Popple wrote:
> > diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
> > index b466172..48c81b9 100644
> > --- a/include/asm-generic/tlb.h
> > +++ b/include/asm-generic/tlb.h
> > @@ -456,7 +456,7 @@ static inline void tlb_flush_mmu_tlbonly(struct mmu_gather *tlb)
> >  		return;
> >  
> >  	tlb_flush(tlb);
> > -	mmu_notifier_invalidate_range(tlb->mm, tlb->start, tlb->end);
> > +	mmu_notifier_invalidate_secondary_tlbs(tlb->mm, tlb->start, tlb->end);
> >  	__tlb_reset_range(tlb);
> 
> Does this compile? I don't see
> "mmu_notifier_invalidate_secondary_tlbs" ?

Seems this call gets deleted later in the series.

> But I think the approach in this series looks fine, it is so much
> cleaner after we remove all the cruft in patch 4, just look at the
> diffstat..

I'll push this into -next if it compiles OK for me, but yes, a redo is
desirable please.

