Return-Path: <linuxppc-dev+bounces-797-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4B0965C48
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2024 11:05:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WwC0v4MX4z302b;
	Fri, 30 Aug 2024 19:05:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725008735;
	cv=none; b=U1rphwAIUfIIw6AV89Dco3Steki+GcpQYsBbor5D/I5D86I1kqYf9Kmf7m57CUUrckT86ODWRTtOuqJYbopNY9d76vyFj9tg83qeq7oU2/hjqjPwVtfzyg9eZ2D1m9uZ9lAqaQlYqJxcBUsC0K7zlSEj47M+URh3G8VbG5rfhjBrqklaH0L/lB4KHHxXqq1OdFWZ7O4huoQBPDAaZGlYQIdLWECCAUw6VcTKdMR6amYS0XV/JdCmP/XrjvczgbVU5UMevEE/64FEvcKt0hoTfnCASMGwNldvhHicPVfB/+ASs6ABUE91RiPM1vrosj7q8JRUh4T+1rJZ5hFY4O6DzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725008735; c=relaxed/relaxed;
	bh=qM1M6y52oOLcvTXXkYNi84CBuGT3KCKd7BKG8VvMHZE=;
	h=Received:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:User-Agent; b=W2XyZTTpAtK3jIJ87kcX+5dRdGDKEN2cKcI6BOL/16/N2jkGTbC+cah6b8drv0OLIpVTCsgWCiL5cYGk4dgwbOxMt2abDA7Eqwa8aRyt+26MFFIQYGlVOLXaxGP2H4THkCZs095ro5Pgz/NdX+JdY/ZxR+J5McAG9JB1kxSygesq5gMXUptl2oojYTrxxOMW33fiEjQ8z+k4BWFnUv8A4wR2tBIl3rwiI/GNmrCa0VUZJF1BomJ5e8aY2wsk4C8nz6LxDr/u3Yhq+no083zaUUrqQ8t/NFKvZsD8gmJKr9uUk6hYazOjvSKnKdVEiYZThJfKp9n/XdkxHjjJl9mYVQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HChw5GwJ; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=will@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HChw5GwJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=will@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WwC0v2TmFz302W
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2024 19:05:35 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 49FDCA4423E;
	Fri, 30 Aug 2024 09:05:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2380EC4CECB;
	Fri, 30 Aug 2024 09:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725008730;
	bh=jTLffhohIxJnzY99/Hvodz5uFraK2Vu7f7rbBUb7RL0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HChw5GwJcaBYA0YWU51Sq8KSuPRh1Qzu2RJlo+RjnG0gnt6HvvXNGLSnEMo6bhu/H
	 5KrS2WWo3ASz7iPKCdmLMbHD8svscNsJSIlxe7BKaZ4/wxEo9tBOBvXzSkgz0AJYpn
	 iHC4GnKqRIowewoJ+Jl/A96N/ImKtYszoY7j8nx3Xg6o9Kmj8UKSQgscBCyDkI3LH2
	 P5lw6WAkGEBegKDF3l0Omf7fHJhs7x7k4zNj2od0bzeSzhVPYASLGC6AXSGeMbjI1Q
	 CBpXqgx/gO299Yfg1XbGUPFWO3WG6aNjElKht3dNb51IQpPfhsZ1FGLfLJCkinw1uO
	 g59V4OZV0AImQ==
Date: Fri, 30 Aug 2024 10:05:22 +0100
From: Will Deacon <will@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>, linux-arm-kernel@lists.infradead.org,
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
Message-ID: <20240830090522.GA7678@willie-the-truck>
References: <20240822151113.1479789-1-joey.gouly@arm.com>
 <20240822151113.1479789-9-joey.gouly@arm.com>
 <20240823134811.GG32156@willie-the-truck>
 <86cylqwib5.wl-maz@kernel.org>
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
In-Reply-To: <86cylqwib5.wl-maz@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hey Marc,

On Fri, Aug 30, 2024 at 09:01:18AM +0100, Marc Zyngier wrote:
> On Fri, 23 Aug 2024 14:48:11 +0100,
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
> > Marc -- what would you like to do with this patch? I think the POE series
> > is really close now, so ideally I'd queue the lot on a branch in arm64
> > and you could pull the first ~10 patches into kvmarm if you need 'em.
> > 
> > Would what work for you, or did you have something else in mind (since
> > this one is also included in your series adding nv support for AT).
> 
> Is there any progress on this front? I am quite eager to queue the AT
> series, but the dependency on this patch is preventing me to do so.
> 
> I can see there are outstanding questions on the POE series, so I was
> wondering if we should consider reversing the dependency: I can create
> a stable branch with this single patch, which you can pull as a prefix
> of the POE series.

That sounds like a good idea. The uaccess discussion seems to have
stalled and I don't really want to merge the series without concluding
that.

So please go ahead with this single patch and I'll pull it in if things
start moving again.

Will

