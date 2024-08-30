Return-Path: <linuxppc-dev+bounces-809-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F0A96612F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2024 13:59:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WwGs50SHKz2xXw;
	Fri, 30 Aug 2024 21:59:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725019145;
	cv=none; b=HaXH1UEX53RtR4ikNxceq23yig3UidgobxwE/mvWzBJMZ3wrFmeO+U/e9L9GZa1pg3Bodjv+rGrmJO7qAR0XW1RspcMpTbN1oOc6YB5cedevftd8QCk+6Dnw8yXzqKcMmXEA9oRa1Af9Nsz5uzQ23Kyd4+N1260wGYys7oXxmMggd+abWeVVKCFLBuuHOrbtNv+Gh5iBE5+bfRJgmU7q2Bz0dwfq39GeLeXG5FBgAxx2+T9TP9imToqe0IvSWYfpSLfXmIXtwTNR/QCaeIaI/YZi1e5WoDcT8XEv8ojgr5yiiHrGFVnEXO0Mm29Y4/hIDV7vc6MFKFeuxDbKgiFvog==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725019145; c=relaxed/relaxed;
	bh=PJmln/CG5iMI09NjG1i4YN2rdEBJMeeOmypct1YMRLc=;
	h=Received:Received:DKIM-Signature:Received:Date:Message-ID:From:To:
	 Cc:Subject:In-Reply-To:References:User-Agent:MIME-Version:
	 Content-Type:X-SA-Exim-Connect-IP:X-SA-Exim-Rcpt-To:
	 X-SA-Exim-Mail-From:X-SA-Exim-Scanned; b=SttyfpHbI7B9hcP223mX6uvq37+ehcUQ/ZBV8X9oYYDBonvl+xVdRwCxST1sE15Y/EBweJjB7DU70HdiYyJ1gtmgwKEmsOTtgrxjUoN1X5onsZEc2WnaDTp4B2nKAc2t3gMPjNbm0cSq4zHo4QXSuOxD7YPydBhTWakNbmfLFXftD7jO2q5hyZX+/jOoVipivIweRF045wP4cz39MPxQ1ODFtT63yO6+IODTSqhrTwEGSqQUYN7MxlAHr8mfEhnZZ/rdlvvzZDHE9LlvpHvbvMKy0jJGRfWTu7GfePqHqPqscOQXPXbI+odexdxWUyb5s4Wm0aPQFwPbZRGwqlCdXQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UfrhExWc; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=maz@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UfrhExWc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=maz@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WwGs449THz2xCj
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2024 21:59:04 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C10B8A44708;
	Fri, 30 Aug 2024 11:58:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A3B1C4CEC2;
	Fri, 30 Aug 2024 11:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725019141;
	bh=VEP7aVQREPxzdE+e/d07GI+Bf+lB2Ws+XRqTgaeCxu4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=UfrhExWcg1C6SQizVcm2DJ85tiDdXrFnSB8Y2HXg+epYhEwbxwSFuCfWuclYXue6N
	 Az88yVQSFZrVWRa6I2mg39jBGRA6JtmF8GwvK1gSOpQrHPpvs8nT9/PurJreRgj+JE
	 Oo0T8x2FsW+FZwZL6JYPi3RA7KqNIvtOkt7ydZSizQAHe3gEUVpFtYD/b/Utjrhwg4
	 oqXfSQqKwsOhWrZXW5Yab56eVHxNrB7njUykaAPOpQTgYnHKGIaLjywFCL3Ys+Ux5G
	 l/9V+IniLg2JVb5VWjHCCgemFIp5oCZhPrFQkcmUvdvnJ6TRR7LsM0ROlHEW6PgHpQ
	 DZ9XOSBvXLmLw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1sk0HK-008E0N-Of;
	Fri, 30 Aug 2024 12:58:58 +0100
Date: Fri, 30 Aug 2024 12:58:57 +0100
Message-ID: <86a5guw7b2.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Will Deacon <will@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	nd@arm.com,
	akpm@linux-foundation.org,
	aneesh.kumar@kernel.org,
	aneesh.kumar@linux.ibm.com,
	anshuman.khandual@arm.com,
	bp@alien8.de,
	broonie@kernel.org,
	catalin.marinas@arm.com,
	christophe.leroy@csgroup.eu,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	mingo@redhat.com,
	mpe@ellerman.id.au,
	naveen.n.rao@linux.ibm.com,
	npiggin@gmail.com,
	oliver.upton@linux.dev,
	shuah@kernel.org,
	skhan@linuxfoundation.org,
	szabolcs.nagy@arm.com,
	tglx@linutronix.de,
	x86@kernel.org,
	kvmarm@lists.linux.dev,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 08/30] KVM: arm64: make kvm_at() take an OP_AT_*
In-Reply-To: <20240830090522.GA7678@willie-the-truck>
References: <20240822151113.1479789-1-joey.gouly@arm.com>
	<20240822151113.1479789-9-joey.gouly@arm.com>
	<20240823134811.GG32156@willie-the-truck>
	<86cylqwib5.wl-maz@kernel.org>
	<20240830090522.GA7678@willie-the-truck>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/29.4
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: will@kernel.org, joey.gouly@arm.com, linux-arm-kernel@lists.infradead.org, nd@arm.com, akpm@linux-foundation.org, aneesh.kumar@kernel.org, aneesh.kumar@linux.ibm.com, anshuman.khandual@arm.com, bp@alien8.de, broonie@kernel.org, catalin.marinas@arm.com, christophe.leroy@csgroup.eu, dave.hansen@linux.intel.com, hpa@zytor.com, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, mingo@redhat.com, mpe@ellerman.id.au, naveen.n.rao@linux.ibm.com, npiggin@gmail.com, oliver.upton@linux.dev, shuah@kernel.org, skhan@linuxfoundation.org, szabolcs.nagy@arm.com, tglx@linutronix.de, x86@kernel.org, kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false

On Fri, 30 Aug 2024 10:05:22 +0100,
Will Deacon <will@kernel.org> wrote:
> 
> Hey Marc,
> 
> On Fri, Aug 30, 2024 at 09:01:18AM +0100, Marc Zyngier wrote:
> > On Fri, 23 Aug 2024 14:48:11 +0100,
> > Will Deacon <will@kernel.org> wrote:
> > > 
> > > On Thu, Aug 22, 2024 at 04:10:51PM +0100, Joey Gouly wrote:
> > > > To allow using newer instructions that current assemblers don't know about,
> > > > replace the `at` instruction with the underlying SYS instruction.
> > > > 
> > > > Signed-off-by: Joey Gouly <joey.gouly@arm.com>
> > > > Cc: Marc Zyngier <maz@kernel.org>
> > > > Cc: Oliver Upton <oliver.upton@linux.dev>
> > > > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > > > Cc: Will Deacon <will@kernel.org>
> > > > Reviewed-by: Marc Zyngier <maz@kernel.org>
> > > > ---
> > > >  arch/arm64/include/asm/kvm_asm.h       | 3 ++-
> > > >  arch/arm64/kvm/hyp/include/hyp/fault.h | 2 +-
> > > >  2 files changed, 3 insertions(+), 2 deletions(-)
> > > 
> > > Marc -- what would you like to do with this patch? I think the POE series
> > > is really close now, so ideally I'd queue the lot on a branch in arm64
> > > and you could pull the first ~10 patches into kvmarm if you need 'em.
> > > 
> > > Would what work for you, or did you have something else in mind (since
> > > this one is also included in your series adding nv support for AT).
> > 
> > Is there any progress on this front? I am quite eager to queue the AT
> > series, but the dependency on this patch is preventing me to do so.
> > 
> > I can see there are outstanding questions on the POE series, so I was
> > wondering if we should consider reversing the dependency: I can create
> > a stable branch with this single patch, which you can pull as a prefix
> > of the POE series.
> 
> That sounds like a good idea. The uaccess discussion seems to have
> stalled and I don't really want to merge the series without concluding
> that.
> 
> So please go ahead with this single patch and I'll pull it in if things
> start moving again.

Now pushed to [1].

Thanks,

	M.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git/log/?h=arm64-shared-6.12

-- 
Without deviation from the norm, progress is not possible.

