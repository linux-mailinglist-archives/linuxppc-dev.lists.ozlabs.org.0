Return-Path: <linuxppc-dev+bounces-608-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5FF960978
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2024 14:02:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WtR4Q6LqPz2yTy;
	Tue, 27 Aug 2024 22:02:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724760150;
	cv=none; b=fPeUbBXQVMuOFAtSf4H3ygVysc7ovirKY3UgPo5f1DFn97y1sNRk31kF6SoIPty+Jc0ICm3R3Tnrr+jmcPz5J5XGK7yxa94QiLjH+gKf3Rjragn/6d7hw5zgEHW3ljwLHl0AC4COVuUqjMBGCUl5gYzzA3LJWo9biiHyoeI5KQXmxHdynom6HI+g8xxkBWCKfSPlTU02UfKIfbsWsmDCQHVJZMTIwGsLnypSP0Xot1J7B90mJyN3JDw3a2xFEjGXJVgSlaGPLQWkDOQjdQFJ95nRAZsl8TlRIeuOG0elnVdvlRu9oa8aLrurvyHJ9xArVfMIxxM2WxmdOZmNQuPTgw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724760150; c=relaxed/relaxed;
	bh=/MLTjT4x0wpquiwumNovnGAf81Tdfup2rLk7uUNGOds=;
	h=Received:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:User-Agent; b=HJr4ImSlTbq/chwW/+m7DyyNY4z6gictyr3Y1ZEAT8k/iiKeX0Cb3Iat+rVGaroz9gfG1SpdWYDgc1/7lojrN9PPPHf2Dg3UO9CDwM0HAIpTv81SauAbeB3wHzH7Zbc8cgqFTOeoBQEPCcNq/9uM+o0xebIAXlxr9jQugE5es7Mph9VUAINOyCndPeQWvzAZIz76xUtWkqjNZy1hr3Ftoe64gHyDNGP3wJzoyXZ+/IDi3RmvhAL6A+kqnSu7VUmU7hWXZ5BDZGWxHLkHO6iIRb3Ggy1OsKUZVikZxaF4T+m6QTavH2BtB+GF5PEHGlYi/tdszuynJ9KbrL0JnIhFYQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Gpf8ddOX; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=will@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Gpf8ddOX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=will@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WtR4Q1tYXz2yQL
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 22:02:30 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B81A1A41943;
	Tue, 27 Aug 2024 12:02:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60A82C582AB;
	Tue, 27 Aug 2024 11:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724758692;
	bh=2+A2bF7Lj9wuQUwEpvgzmZKK3imkhu2KCOi7wnoixak=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gpf8ddOXDK2vLQMMp3FzmG/a/m/kr0GXzqv0V69de1kGXjsWZZVM5il9nZ3rJgJ/C
	 HhCk9FpXwrs24xGKZufPQ6AVtvbP5tMYwDBYGmyjXUFSAs0/qqunKiRjR5cHaGfdBj
	 NELnVGfuXrKZce7YLlJBXHfzEBMziXjXhbc2oCx/U/canba16aHthF+qGabnfRBtoM
	 BP6yHu6nKpM6xKRbubnCGD2Di4NReNtwAwTcMpZZI8xnW+1KjwLJ14ftgHU2j0y4CR
	 5qpdVZJYRS0/PkwK6KW2GK7c8ijyUvbxdWydqc2U6Yg0gjukfhNJnDfFkqe+yURXpL
	 dMagJjNp/hQXA==
Date: Tue, 27 Aug 2024 12:38:04 +0100
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Joey Gouly <joey.gouly@arm.com>, linux-arm-kernel@lists.infradead.org,
	nd@arm.com, akpm@linux-foundation.org, aneesh.kumar@kernel.org,
	aneesh.kumar@linux.ibm.com, anshuman.khandual@arm.com, bp@alien8.de,
	broonie@kernel.org, christophe.leroy@csgroup.eu,
	dave.hansen@linux.intel.com, hpa@zytor.com,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org, maz@kernel.org, mingo@redhat.com,
	mpe@ellerman.id.au, naveen.n.rao@linux.ibm.com, npiggin@gmail.com,
	oliver.upton@linux.dev, shuah@kernel.org, skhan@linuxfoundation.org,
	szabolcs.nagy@arm.com, tglx@linutronix.de, x86@kernel.org,
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 06/30] arm64: context switch POR_EL0 register
Message-ID: <20240827113803.GB4318@willie-the-truck>
References: <20240822151113.1479789-1-joey.gouly@arm.com>
 <20240822151113.1479789-7-joey.gouly@arm.com>
 <20240823144531.GH32156@willie-the-truck>
 <Zsi7ovLOfuFdfuuz@arm.com>
 <20240823170835.GA1181@willie-the-truck>
 <ZsjXtE7Kg0LQwNAL@arm.com>
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
In-Reply-To: <ZsjXtE7Kg0LQwNAL@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Fri, Aug 23, 2024 at 07:40:52PM +0100, Catalin Marinas wrote:
> On Fri, Aug 23, 2024 at 06:08:36PM +0100, Will Deacon wrote:
> > On Fri, Aug 23, 2024 at 05:41:06PM +0100, Catalin Marinas wrote:
> > > On Fri, Aug 23, 2024 at 03:45:32PM +0100, Will Deacon wrote:
> > > > On Thu, Aug 22, 2024 at 04:10:49PM +0100, Joey Gouly wrote:
> > > > > +static void permission_overlay_switch(struct task_struct *next)
> > > > > +{
> > > > > +	if (!system_supports_poe())
> > > > > +		return;
> > > > > +
> > > > > +	current->thread.por_el0 = read_sysreg_s(SYS_POR_EL0);
> > > > > +	if (current->thread.por_el0 != next->thread.por_el0) {
> > > > > +		write_sysreg_s(next->thread.por_el0, SYS_POR_EL0);
> > > > > +		/* ISB required for kernel uaccess routines when chaning POR_EL0 */
> > > > 
> > > > nit: typo "chaning".
> > > > 
> > > > But more substantially, is this just to prevent spurious faults in the
> > > > context of a new thread using a stale value for POR_EL0?
> > > 
> > > Not just prevent faults but enforce the permissions from the new
> > > thread's POR_EL0. The kernel may continue with a uaccess routine from
> > > here, we can't tell.
> > 
> > Hmm, I wondered if that was the case. It's a bit weird though, because:
> > 
> >   - There's a window between switch_mm() and switch_to() where you might
> >     reasonably expect to be able to execute uaccess routines
> 
> I don't think we can have any uaccess between these two switches (a
> uaccess could fault, that's a pretty weird state between these two).
> 
> >   - kthread_use_mm() doesn't/can't look at this at all
> 
> No, but a kthread would have it's own, most permissive, POR_EL0.
> 
> >   - GUP obviously doesn't care
> > 
> > So what do we actually gain by having the uaccess routines honour this?
> 
> I guess where it matters is more like not accidentally faulting because
> the previous thread had more restrictive permissions.

That's what I wondered initially, but won't the fault handler retry in
that case?

Will

