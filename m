Return-Path: <linuxppc-dev+bounces-229-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1887A958856
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2024 15:55:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wp9w46cH8z2xfB;
	Tue, 20 Aug 2024 23:55:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=dave.martin@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wp9w40Zk0z2xYl
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2024 23:55:30 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5A545DA7;
	Tue, 20 Aug 2024 06:55:24 -0700 (PDT)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.59])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5460C3F66E;
	Tue, 20 Aug 2024 06:54:55 -0700 (PDT)
Date: Tue, 20 Aug 2024 14:54:50 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Joey Gouly <joey.gouly@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org, akpm@linux-foundation.org,
	aneesh.kumar@kernel.org, aneesh.kumar@linux.ibm.com, bp@alien8.de,
	broonie@kernel.org, christophe.leroy@csgroup.eu,
	dave.hansen@linux.intel.com, hpa@zytor.com,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org, maz@kernel.org, mingo@redhat.com,
	mpe@ellerman.id.au, naveen.n.rao@linux.ibm.com, npiggin@gmail.com,
	oliver.upton@linux.dev, shuah@kernel.org, szabolcs.nagy@arm.com,
	tglx@linutronix.de, will@kernel.org, x86@kernel.org,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH v4 18/29] arm64: add POE signal support
Message-ID: <ZsSgKl2JINjdpuW1@e133380.arm.com>
References: <ZqJ2knGETfS4nfEA@e133380.arm.com>
 <20240801155441.GB841837@e124191.cambridge.arm.com>
 <Zqu2VYELikM5LFY/@e133380.arm.com>
 <20240806103532.GA1986436@e124191.cambridge.arm.com>
 <20240806143103.GB2017741@e124191.cambridge.arm.com>
 <ZrzHU9et8L_0Tv_B@arm.com>
 <20240815131815.GA3657684@e124191.cambridge.arm.com>
 <Zr4aJqc/ifRXJQAd@e133380.arm.com>
 <ZsN8MnSqIWEMh7Ma@arm.com>
 <20240820095441.GA688664@e124191.cambridge.arm.com>
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
In-Reply-To: <20240820095441.GA688664@e124191.cambridge.arm.com>

On Tue, Aug 20, 2024 at 10:54:41AM +0100, Joey Gouly wrote:
> On Mon, Aug 19, 2024 at 06:09:06PM +0100, Catalin Marinas wrote:
> > On Thu, Aug 15, 2024 at 04:09:26PM +0100, Dave P Martin wrote:
> > > On Thu, Aug 15, 2024 at 02:18:15PM +0100, Joey Gouly wrote:
> > > > That's a lot of words to say, or ask, do you agree with the approach of only
> > > > saving POR_EL0 in the signal frame if num_allocated_pkeys() > 1?
> > > > 
> > > > Thanks,
> > > > Joey
> > > 
> > > ...So..., given all the above, it is perhaps best to go back to
> > > dumping POR_EL0 unconditionally after all, unless we have a mechanism
> > > to determine whether pkeys are in use at all.
> > 
> > Ah, I can see why checking for POR_EL0_INIT is useful. Only checking for
> > the allocated keys gets confusing with pkey 0.
> > 
> > Not sure what the deal is with pkey 0. Is it considered allocated by
> > default or unallocatable? If the former, it implies that pkeys are
> > already in use (hence the additional check for POR_EL0_INIT). In
> > principle the hardware allows us to use permissions where the pkeys do
> > not apply but we'd run out of indices and PTE bits to encode them, so I
> > think by default we should assume that pkey 0 is pre-allocated.
> > 
> > 
> 
> You can consider pkey 0 allocated by default. You can actually pkey_free(0), there's nothing stopping that.

Is that intentional?

You're not supposed to free pkeys that are in use, and it's quasi-
impossible to know whether pkey 0 is in use: all binaries in the
process assume that pkey is available and use it by default for their
pages, plus the stack will be painted with pkey 0, and the vDSO has to
be painted with some pkey.

Actually, that's a good point, because of the vDSO I think that only
special bits of code with a private ABI (e.g., JITted code etc.) that
definitely don't call into the vDSO can block permissions on pkey 0...
otherwise, stuff will break.

> 
> > So I agree that it's probably best to save it unconditionally.
> 
> Alright, will leave it as is!

Ack, I think the whole discussion around this has shown that there
isn't a _simple_ argument for conditionally dumping POR_EL0... so I'm
prepared to admit defeat here.

We might still try to slow down the consumption of the remaining space
with a "misc registers" record, instead of dedicating a record to
POR_EL0.  I have some thoughts on that, but if nobody cares that much
then this probably isn't worth pursuing.

Cheers
---Dave

