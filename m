Return-Path: <linuxppc-dev+bounces-460-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CE295CE55
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2024 15:48:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wr1cP6HKKz2yxP;
	Fri, 23 Aug 2024 23:48:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724420901;
	cv=none; b=bYEcjBrx6nHjAbGBBDxCpaJDLn9A5p66+GB5msWZgPge+iYrO64KRBInRI0wjqUr5tZ6VFzS5rlso66hYUILGJ6D/W6j2qRSYLW03XTfZ5pjj9k9puicKdXqoRUbSu8f2ATukZr1+YNxg9EEoO1hwHPsDUZmVhF9dgBxEUYolrCiJc9WgDc4+u/C5+iI7ki3YHb/OwS7uXJlEr++GObNu/zur28XORVNEwx+FoK23I+sVyB6C6L1WgPftA9yYAWreQw07djFN3vi2ZND6tFq3WRNvzEVVis49c4DNNQijE/26NdVzjwXnLg7Y/pFLYfjygAHeU1pfh3vbnjazhJZEw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724420901; c=relaxed/relaxed;
	bh=pLYFYTvMa9pQyDISoxFchiLV25oT3bMBi8TiEJWVe10=;
	h=Received:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:User-Agent; b=J+4LLC4Xquo6fa54kh+/aMmJ+hvdU40jesXhKL1xG/z9uQcA5u5seT/jzrbNg4Il3sO7yoDsEyWAHb5VlsTXPbVGZPnhefsk7NaUy/hfJlW9k2Sgz9ffTPx+ujgy0xxkdzx+trmmXUCVX7jjsp1C2xjnMQAJU3XhRI6nJdDUZmrAvI4N7ku2hpiMyEroKE/75nHyQCTC77U2V3aokHMgtwwLDzBV43+4yC5czZpoRKlXmZBtgJ7rDUiTpEW0ZQpxXKdkfuaz1tBsE1la3RiXawMFEeC8XMcuQGVp9NxwMGKgaaorkgtS5PDZJGDPIqE+dIVtQM9GY7ghcRfuYv2DqQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kziks+te; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=will@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kziks+te;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=will@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wr1cP4k5Dz2yw3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 23:48:21 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 883BA612BF;
	Fri, 23 Aug 2024 13:48:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62F9DC4AF0B;
	Fri, 23 Aug 2024 13:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724420899;
	bh=JIkqMCgIebwRUTuIcinW21G7FY3x6MY5j3ti9QJWUpY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kziks+te/BuykzKTqMKMAm8i1ejDZAh27QGp5y9Zp2y11SGWyfr3X8tN39n9705Nz
	 Ljop4jG7EJLldMweAoE56RJb57K0QKg1VWxx1ebf7wk2dLTgyVsyElBdUfhAC4xUiy
	 kBKTq+gnA9SnPglbx3k46c4LBIQ6bLE4Bvt9c2pBbn/8akTqSnBMymof4qK9lLM3LJ
	 xRC1X+6/eiVKwk5rwintXkbQe8/4CxeFwNSYoyzwD7LVStbyk4KOxJzFnkVehoLR6/
	 +BNzmHEjHiE/jgWwxjDsxDULSH/KDFq/t/ZOR+y/EFKqmRjZyBG5KHBtl0FBNj2LUR
	 sa+5r/DHUAV0w==
Date: Fri, 23 Aug 2024 14:48:11 +0100
From: Will Deacon <will@kernel.org>
To: Joey Gouly <joey.gouly@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, nd@arm.com,
	akpm@linux-foundation.org, aneesh.kumar@kernel.org,
	aneesh.kumar@linux.ibm.com, anshuman.khandual@arm.com, bp@alien8.de,
	broonie@kernel.org, catalin.marinas@arm.com,
	christophe.leroy@csgroup.eu, dave.hansen@linux.intel.com,
	hpa@zytor.com, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org, maz@kernel.org, mingo@redhat.com,
	mpe@ellerman.id.au, naveen.n.rao@linux.ibm.com, npiggin@gmail.com,
	oliver.upton@linux.dev, shuah@kernel.org, skhan@linuxfoundation.org,
	szabolcs.nagy@arm.com, tglx@linutronix.de, x86@kernel.org,
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 08/30] KVM: arm64: make kvm_at() take an OP_AT_*
Message-ID: <20240823134811.GG32156@willie-the-truck>
References: <20240822151113.1479789-1-joey.gouly@arm.com>
 <20240822151113.1479789-9-joey.gouly@arm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240822151113.1479789-9-joey.gouly@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Thu, Aug 22, 2024 at 04:10:51PM +0100, Joey Gouly wrote:
> To allow using newer instructions that current assemblers don't know about,
> replace the `at` instruction with the underlying SYS instruction.
> 
> Signed-off-by: Joey Gouly <joey.gouly@arm.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Oliver Upton <oliver.upton@linux.dev>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Reviewed-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/include/asm/kvm_asm.h       | 3 ++-
>  arch/arm64/kvm/hyp/include/hyp/fault.h | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)

Marc -- what would you like to do with this patch? I think the POE series
is really close now, so ideally I'd queue the lot on a branch in arm64
and you could pull the first ~10 patches into kvmarm if you need 'em.

Would what work for you, or did you have something else in mind (since
this one is also included in your series adding nv support for AT).

Cheers,

Will

