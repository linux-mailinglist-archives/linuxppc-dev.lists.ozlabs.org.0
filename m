Return-Path: <linuxppc-dev+bounces-808-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 892029660E1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2024 13:36:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WwGMJ2LX0z309k;
	Fri, 30 Aug 2024 21:36:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725017804;
	cv=none; b=m/g/5fdA96UH20CZMhiMR0pzk7egVrOn1Ntb1eQ7dDYZ6mOZ1f1CHqLRWjIpj+3XQjCbvVENANnDOHSZBr7rPLnYhCa9m+W4sX9qgd1XmEGW+bv40t5/7El2+RNPHUm7llP1oywTldfd3u6dO8jnZR6zWJWWO943D6R/3HW3i11L3zqOx18Fo8MXvacIpI0zQmUBKFgmys4TlcFnSdQ6K8MHFhFdePTLUbqFEet41svsNaQoXl+qb61CiAvEcLZGj7/KuzybAf1/7U1el1dehYvXhxBc0SVNwUVIBP+5V413crPi0HQroIhGejyZBHjRF6anrGQRenOr8IH9DYQ0OA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725017804; c=relaxed/relaxed;
	bh=7kgZeBe0ARBlKzhy/1V40PQBo6HqzKnX60o5u6jfwvA=;
	h=Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To; b=HXWMmsQr34zECKSrNmSLzJr5P+8fvSi+iAt5yUQJRaC86KaER6FmVsDyJ6gxIC6z8XO540JJdqQwV69p7WfuyQ14t5bkC58i5hzrr6vroz5xAwirnVSF2jRBr6x0tY+CZQaU43i/PTlwbpcJ5U5t6mTd5o3trLD7YSfaeVqTIUHCTUrhwwCuMUb4mYrtm2jdyCcwLX1asFksSeBNm5rvBzt0Nuz0maSQUBMn3xaKahy0Iv9pTCw3mfLuaahEZngOWEQlewp8Rwmsyhok9QtnBh0i5ZOwLzGxnnvkCqUfgPAN5emMQ85sRGxsQ+T38VDdKJgJ9fFk6Wd4ZYOEC6HDTQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=joey.gouly@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=joey.gouly@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WwGMH4SyXz309W
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2024 21:36:41 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B27D0339;
	Fri, 30 Aug 2024 04:36:34 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2AE603F66E;
	Fri, 30 Aug 2024 04:36:05 -0700 (PDT)
Date: Fri, 30 Aug 2024 12:35:56 +0100
From: Joey Gouly <joey.gouly@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	nd@arm.com, akpm@linux-foundation.org, aneesh.kumar@kernel.org,
	aneesh.kumar@linux.ibm.com, anshuman.khandual@arm.com, bp@alien8.de,
	broonie@kernel.org, catalin.marinas@arm.com,
	christophe.leroy@csgroup.eu, dave.hansen@linux.intel.com,
	hpa@zytor.com, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org, mingo@redhat.com, mpe@ellerman.id.au,
	naveen.n.rao@linux.ibm.com, npiggin@gmail.com,
	oliver.upton@linux.dev, shuah@kernel.org, skhan@linuxfoundation.org,
	szabolcs.nagy@arm.com, tglx@linutronix.de, x86@kernel.org,
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 08/30] KVM: arm64: make kvm_at() take an OP_AT_*
Message-ID: <20240830113556.GA2952347@e124191.cambridge.arm.com>
References: <20240822151113.1479789-1-joey.gouly@arm.com>
 <20240822151113.1479789-9-joey.gouly@arm.com>
 <20240830092527.GB7678@willie-the-truck>
 <86bk1aw8y2.wl-maz@kernel.org>
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
In-Reply-To: <86bk1aw8y2.wl-maz@kernel.org>

On Fri, Aug 30, 2024 at 12:23:33PM +0100, Marc Zyngier wrote:
> On Fri, 30 Aug 2024 10:25:27 +0100,
> Will Deacon <will@kernel.org> wrote:
> > 
> > On Thu, Aug 22, 2024 at 04:10:51PM +0100, Joey Gouly wrote:
> > > To allow using newer instructions that current assemblers don't know about,
> > > replace the `at` instruction with the underlying SYS instruction.
> > > 
> > > Signed-off-by: Joey Gouly <joey.gouly@arm.com>
> > > Cc: Marc Zyngier <maz@kernel.org>
> > > Cc: Oliver Upton <oliver.upton@linux.dev>
> > > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > > Cc: Will Deacon <will@kernel.org>
> > > Reviewed-by: Marc Zyngier <maz@kernel.org>
> > > ---
> > >  arch/arm64/include/asm/kvm_asm.h       | 3 ++-
> > >  arch/arm64/kvm/hyp/include/hyp/fault.h | 2 +-
> > >  2 files changed, 3 insertions(+), 2 deletions(-)
> > 
> > Acked-by: Will Deacon <will@kernel.org>
> > 
> > > diff --git arch/arm64/include/asm/kvm_asm.h arch/arm64/include/asm/kvm_asm.h
> > > index 2181a11b9d92..38d7bfa3966a 100644
> > > --- arch/arm64/include/asm/kvm_asm.h
> > > +++ arch/arm64/include/asm/kvm_asm.h
> > 
> > FWIW (mainly for Marc): you seem to be missing the 'a/' and 'b/'
> > prefixes here, so my git would't accept the change when I tried to
> > apply locally for testing.
> 
> Seems like a spurious '--no-prefix' was added at patch formatting
> time, That clashes with git-apply's default '-p1', which strips the
> first component of the path.

I had --no-prefix in my .git/config for diffs, but I didn't realise that also
applied to git format-patch, sorry for that. I have removed it now.

If you want me to resend v5, or something else, let me know.

> 
> There's probably a way to pass '-p0' to 'git am', but I don't feel
> like trawling the git documentation by such a temperature...
> 
> 	M.

related to uaccess: Catalin is away, sure when he's back, so I'm hoping we can
resolve that when he's around.

Thanks,
Joey

