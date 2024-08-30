Return-Path: <linuxppc-dev+bounces-805-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B23EC966085
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2024 13:23:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WwG4G2kLmz307q;
	Fri, 30 Aug 2024 21:23:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:40e1:4800::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725017022;
	cv=none; b=WiJk4Jnu/U3Dr8QewBqArUbHvTT4tUW4aSuR4Tu0fvN0JT6K0rL256bU5rHMvHwfV9rMUOOJ472F3AwIiBE+DdXayv2Z04nX2kgkF7oyWm/BpnoEqzTJ81VSvgeB/TJPzpl87GUkv3rY4dwu/65W6+ZISqgrQP/ThiU/2CYXGedKXrRjH1P99SddxWntQa9ZNisFHaqa7BoLzhGdS0zEsp22NrH7NubGR+9jUo8twePqKXcv7aO+oAeUlJshY81Oyr/9iPXbxQP7lUOlI7oRh6vZNbq8vsm5KtiGk1K0Cd2fjyUnYhAX1HjyQwaic4acZdf/9wgF/RbozdscYtheBw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725017022; c=relaxed/relaxed;
	bh=BdIezKWvGIjwZFoKpUy+V4Te6THwMu34CrT50VvVtz0=;
	h=Received:Received:DKIM-Signature:Received:Date:Message-ID:From:To:
	 Cc:Subject:In-Reply-To:References:User-Agent:MIME-Version:
	 Content-Type:X-SA-Exim-Connect-IP:X-SA-Exim-Rcpt-To:
	 X-SA-Exim-Mail-From:X-SA-Exim-Scanned; b=PG/aWmQgUYcYJa8/3aBqw0kH8KBxH199aMzcetEV1btx2GYV4lyuz4ri3vxn8L/ca5gV5Fi5qksi81VFegFk+BgcxAyD4R0U+7sc9ENQF+H1ZgKbOIt0sL3miYfad/4sASygOiNTyVoRREGXssNGd7s3kM2JYQzXCOaQUipUJpWYBcQs19HXx+LRPr8tzIiDmROI47KG8ufGrxzcI6BLzJ4Kl46MPqKeY9oFmVhdtHYlxfCixcPoQ9ChLnUggB2jZATUkls/qwfNnZKoF+sgkjacPgrfMfbXXwnz9rOPPoCdJNtT2n6cWCjey55honh6DPZxSnd5JQKtOuPgnB1gJQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FfV/DDyU; dkim-atps=neutral; spf=pass (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=maz@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FfV/DDyU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=maz@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WwG4F6lJ3z306G
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2024 21:23:41 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4C58FCE1DF6;
	Fri, 30 Aug 2024 11:23:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FE0FC4CEC2;
	Fri, 30 Aug 2024 11:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725017016;
	bh=AGgg9f2fB958U4x1s+dxT22RX9ukSLHU6cLpkIryQgg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=FfV/DDyUHB/hVYd02Y6J9oRYH1/FQDQpAGF2WZWZcK1XYRSxlprKai7lONZjR2c7J
	 /Dex9/hW6AiFpZdIUF9XtPRzMSPhOF1ECWz927kRLIpnqj0wlikp1WkW+DBCmg155L
	 2Orx5Q48y0RPWknrfRx6q1K23VADyciCgMyVUQmlAT20BudJ/gQd8HQIJXHwGrZlJb
	 b9qzhlwYnCTjDzmZPNI2NI6zSLm5om4L2755PBZpZaC/Rf0brciIGb01ARqWb8Tpj3
	 gJ/dbjZhda7+5hLd24VnhzQVls4NVre2rek0cry2IffuYxE7oEd3YP+KJWMSUzJT+V
	 74eEWcuUjsKNw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1sjzj3-008DQD-JN;
	Fri, 30 Aug 2024 12:23:33 +0100
Date: Fri, 30 Aug 2024 12:23:33 +0100
Message-ID: <86bk1aw8y2.wl-maz@kernel.org>
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
In-Reply-To: <20240830092527.GB7678@willie-the-truck>
References: <20240822151113.1479789-1-joey.gouly@arm.com>
	<20240822151113.1479789-9-joey.gouly@arm.com>
	<20240830092527.GB7678@willie-the-truck>
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

On Fri, 30 Aug 2024 10:25:27 +0100,
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
> Acked-by: Will Deacon <will@kernel.org>
> 
> > diff --git arch/arm64/include/asm/kvm_asm.h arch/arm64/include/asm/kvm_asm.h
> > index 2181a11b9d92..38d7bfa3966a 100644
> > --- arch/arm64/include/asm/kvm_asm.h
> > +++ arch/arm64/include/asm/kvm_asm.h
> 
> FWIW (mainly for Marc): you seem to be missing the 'a/' and 'b/'
> prefixes here, so my git would't accept the change when I tried to
> apply locally for testing.

Seems like a spurious '--no-prefix' was added at patch formatting
time, That clashes with git-apply's default '-p1', which strips the
first component of the path.

There's probably a way to pass '-p0' to 'git am', but I don't feel
like trawling the git documentation by such a temperature...

	M.

-- 
Without deviation from the norm, progress is not possible.

