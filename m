Return-Path: <linuxppc-dev+bounces-796-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA1896594C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2024 10:01:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ww9Zw61NXz303K;
	Fri, 30 Aug 2024 18:01:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725004888;
	cv=none; b=bCvJcv6mSUxRZ0C1Ui3mm+9faKg4jyHLMKWtEj9ShskmZcT6vurR8f5CkqSVIuFp1eLNvsurtxINUS2Et/ychPdQhM4UuWgdC5YJweGa5XJTWD8doyUV0mNGFTturzas+AlH3eocohX2cxuUIOLiRdhWM2+i8h5gkFB5JQA3T3gAVv6jRHN7xKXMMJBqSeIFgBfQxr4rdQ5g+uDNZeaLQ9+aK+vI+c0D5rLKE+ZNiF+EnFAQqWeMz19oYf5UeyZ/ukTGmF2pvz2MnZuOUPmKjQ2xFV6nTemzttOs0YOokVd6CMOuIvun+Aa1ZZ5FlX0QDQHx7gm0GfXamOUd4lyV+w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725004888; c=relaxed/relaxed;
	bh=3Yzt4XiHB0walWfI3KW5WPqqibYSJH4S78r81brTuuo=;
	h=Received:Received:DKIM-Signature:Received:Date:Message-ID:From:To:
	 Cc:Subject:In-Reply-To:References:User-Agent:MIME-Version:
	 Content-Type:X-SA-Exim-Connect-IP:X-SA-Exim-Rcpt-To:
	 X-SA-Exim-Mail-From:X-SA-Exim-Scanned; b=i8O6rygTxwUmVD+s2CU8kswcf6ZyeTPPTi8USLWTwQRQYEU0ZohUPHKygfxv12LoBPCBHRnD6v2V+l9kQpMxYoNRO1Yf2WlJGbQt7fIWNenSYEKMsrI/uNE4RIQfkkGbxca/FE9fk2pt5+kwObuNwANROxByDq870zE4iqTEJ7cWQZxYw/m9fQjOSZ8GRKBZ/XRfugv7JAlwQzM+cP8YiRtubPHSCQrUbELqd/QTE6Nxj1AcYAFypoSfjsmjpBBNV5TloVuzcsdxG5gfGpChZEDPbGzTX5z9hExRNFzaf9UmyphMn0MrnA0ItNukoaSm7yzOOu/pQKTOgoWTTWALUg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DYMQKP0f; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=maz@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DYMQKP0f;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=maz@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ww9Zw1l8bz302f
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2024 18:01:28 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C967BA44154;
	Fri, 30 Aug 2024 08:01:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61A2DC4CEC2;
	Fri, 30 Aug 2024 08:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725004882;
	bh=VshpswIhHW2c4cRGikfOOFamWjs+IRqvkBaQTQe4Rmk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=DYMQKP0fbJqGrFkeyABDC3Xc1uAQUJL9WtZMQbpIQKfd3PjpKK5MwFFNDLMkWInXt
	 2VtN33L1xcTYIfHOwnNhHsnpOUhnAr1aKVo1dJ3SUWGwg4JLXcMubWrjgMYcEzS6lA
	 V5Yk8YclN7qN4SmHipKJONL/bEwHoiXLWBln+Mp8bTflBrerAGu5FcdRuo50zJ0Iiw
	 2yrR30XICxdZzY612s3+l+nkq211lGa4WJJIg654Vn/KZDLp1KwupaEVk/FHPrAsnP
	 ZjALZAa0jERSuG6ZpXjVo9/AeFgy4X3Fz1SjNY4gK0aVq61secb+UayB1h2PzRzo48
	 c38nvUpnlAwOQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1sjwZL-0089BF-S9;
	Fri, 30 Aug 2024 09:01:19 +0100
Date: Fri, 30 Aug 2024 09:01:18 +0100
Message-ID: <86cylqwib5.wl-maz@kernel.org>
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
In-Reply-To: <20240823134811.GG32156@willie-the-truck>
References: <20240822151113.1479789-1-joey.gouly@arm.com>
	<20240822151113.1479789-9-joey.gouly@arm.com>
	<20240823134811.GG32156@willie-the-truck>
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

Hi Will,

On Fri, 23 Aug 2024 14:48:11 +0100,
Will Deacon <will@kernel.org> wrote:
> 
> On Thu, Aug 22, 2024 at 04:10:51PM +0100, Joey Gouly wrote:
> > To allow using newer instructions that current assemblers don't know about,
> > replace the `at` instruction with the underlying SYS instruction.
> > 
> > Signed-off-by: Joey Gouly <joey.gouly@arm.com>
> > Cc: Marc Zyngier <maz@kernel.org>
> > Cc: Oliver Upton <oliver.upton@linux.dev>
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Will Deacon <will@kernel.org>
> > Reviewed-by: Marc Zyngier <maz@kernel.org>
> > ---
> >  arch/arm64/include/asm/kvm_asm.h       | 3 ++-
> >  arch/arm64/kvm/hyp/include/hyp/fault.h | 2 +-
> >  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> Marc -- what would you like to do with this patch? I think the POE series
> is really close now, so ideally I'd queue the lot on a branch in arm64
> and you could pull the first ~10 patches into kvmarm if you need 'em.
> 
> Would what work for you, or did you have something else in mind (since
> this one is also included in your series adding nv support for AT).

Is there any progress on this front? I am quite eager to queue the AT
series, but the dependency on this patch is preventing me to do so.

I can see there are outstanding questions on the POE series, so I was
wondering if we should consider reversing the dependency: I can create
a stable branch with this single patch, which you can pull as a prefix
of the POE series.

Please let me know what you prefer.

Thanks,

	M.

-- 
Without deviation from the norm, progress is not possible.

