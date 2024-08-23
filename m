Return-Path: <linuxppc-dev+bounces-462-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C303A95CF89
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2024 16:24:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wr2Ph2tHrz2yw2;
	Sat, 24 Aug 2024 00:24:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724423048;
	cv=none; b=V4wHr3jv/9hQe2nbTPlrBYRcxpLy33t4yrO6XJAMu0GbwADGBlR1cUzVfPKRtIksseIGyRkVCFc/9uflg1daQQMmk3bfi7ePW/9ubeVXjW0i6Q338sgOQ9VUYosgfWEI6oxBiIdgpjNPM0QD8epBsMi9JbwL/AE26qs+2U89e1f4OnFYxrc/MacWWgM4uiQSIJm29JjE78ivXyEPG1J+aNKRRv7soXdqH/aytg+1Z7fJe9Xm5m+niy7Lm58oj4GET/TPNbCJ5bc0Tdy/4mqfSscBc2iRJz9k4RLWH24xtB1ELjzDEZjfHLjsasQJXBLeGZKPsJHfYxHa729w6mW8JA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724423048; c=relaxed/relaxed;
	bh=MxySSztRNEQp+bYS29RgV3DOrs+tlZkUurTU25/7YME=;
	h=Received:Received:DKIM-Signature:Received:Date:Message-ID:From:To:
	 Cc:Subject:In-Reply-To:References:User-Agent:MIME-Version:
	 Content-Type:X-SA-Exim-Connect-IP:X-SA-Exim-Rcpt-To:
	 X-SA-Exim-Mail-From:X-SA-Exim-Scanned; b=kefkbIRmlD3Rlc0728yxht+A+07ifnxpXvY5OvKwWKb+rR6DzJ9Dwsm+60R+TmMXHN7X6p0HfikhPFDSCi8tyG6fBv/8n18/dWQ3N8NmwvYKOiGlPssCM/YeJ+MhnSBQAn5WPuAJmV7AMEmF1B1ruWbF6dQZWMwuV/TBCAsWzzrzcOwqnP4rsOuYv4HBlCFDflN3GTaMkQ7XLx8mEPa4UK4u4r9hYWG3LsHGV5QT7fQ1T1shYcJBlilu2MQCf0fy9GfXy9YLXTuMwG3Z/bipLpWLF/OUhPOUTcKPRoFhbyWrb2/CPQAAQ2rqjwgrm9vtZAUuBA3XHpSSu2eMgkK88g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VWd+f4b2; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=maz@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VWd+f4b2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=maz@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wr2Pg73XZz2ypx
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Aug 2024 00:24:07 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 19B1B60FD9;
	Fri, 23 Aug 2024 14:24:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B35ACC32786;
	Fri, 23 Aug 2024 14:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724423045;
	bh=SLKDSke/wUGBLMnN3vAtRLfAoCEBzo3yPCvhIy66cMs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=VWd+f4b2S+YOt8PKvFw5i15F+pg7C+6aSIQa9MizkvCFuKxRrud1ZrCcdJw/AD8xf
	 /ciMYGVTP9SSf+vfKrx0qnwjy7dWxFvcVJPSQpWaB/HEu+TDMG96BQBTJQkCPLWquS
	 5pDyqFoAfYqdYLcl4qlUcydaXnm37OR69LPY+4+DXAp/jUN7D+5lMBrtrArsId1mi4
	 pW9OA1PmIwTosxByk06YAlOi3xUJADfAVKbLQUwhj5xm/pWHgmCSI5EcY+7t6E50o/
	 p6JoNnNhp5kL7TURfNRLZsw2sWTD74MEIxhFolJNAITP7r9wHti3u4tjeIEseeXYi8
	 YypkKASN5KcaA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1shVCt-006ICL-3b;
	Fri, 23 Aug 2024 15:24:03 +0100
Date: Fri, 23 Aug 2024 15:24:02 +0100
Message-ID: <86y14nwc59.wl-maz@kernel.org>
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

Yup, that works for me. I can take that prefix as the base for the AT
series and drop my copy of this patch.

Thanks,

	M.

-- 
Without deviation from the norm, progress is not possible.

