Return-Path: <linuxppc-dev+bounces-1890-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A66996E6E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Oct 2024 16:43:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XNwc13kh2z3bc6;
	Thu, 10 Oct 2024 01:43:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728484993;
	cv=none; b=WESq8kuv4VYuQhDxSclVskvG5LnF+14phVm5nehRIijZ6+1+EXureojYygCI9H0qRlOdtnlMhmUGufuYLqus6GATK437ueUFsXHMIZPnHoQCEVOGbKROAe/nMAqTtAemnxb6OXozx54TE7fN4pfHzPec2lKUPTI3soj9J/PWIXDDXmIOuLlIjjgs5Vho+99do6wf8RRn7duHylq2AWSpmtBf5dDORHRl59Y19FQjottWbRawSoOmPuQhzLE6jjx3Th8hH7dhOoV4eKQtryuN5615MUwqPj6BU0GUsjs8+y9AST5khfMMg399O/4bnoHSXbzk2wZ2qhkdr61CU7dUHg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728484993; c=relaxed/relaxed;
	bh=hVSeVulzIXxFAOaQHQc1C9HduC6nzFi7yi14/OzxfWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fs9Mp4Ad3tNqghTy+pnr4Sf8twQTWx/x2lZ+UYR7fE53n6lVwZfn1P2Z5qPD2LifOEMw3R05JaES8mJzyHQk4IfvcngpcoxxMlAUv0cwoxZB4utX8DfijtVLYPAyI4sXdbUJMtugDqI58wOoq8PDGyaqgmkzYcRdZBagjQ1yqlnN5gWuFraLvZR0jll4kDtoWdNsMfpKSKT+SzaGS6xOo4VwoBSubphBwzqBcJFIXRLoXp1YwQeSpAXjje9lj2pK8mpgl0oGp5+FTEbNiJALcJIT6Lt8LtjuujA/YmqvKCxv+ZaoSg6rPjQ/QIN4yZISaMn78UkmN/zRQwW5jluT2g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AxAi7gMo; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=will@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AxAi7gMo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=will@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XNwc048DMz3bby
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 01:43:12 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7744F5C059E;
	Wed,  9 Oct 2024 14:43:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56DCBC4CEC3;
	Wed,  9 Oct 2024 14:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728484990;
	bh=ghDXhJ8N/Fq5uvX13sqCHmKOKO+si/SzPYqkee2gkCU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AxAi7gMooCiJGqGzS0LWH7kBxoZwHJn5xIZ5q0R7f2JFhjQ8vFEszC3neoypcep6A
	 T04nDesXSfu08Vf9+sA3K4h/yiH8T7lKmbtsmltNb0rLX7hIshVw4gzVgAfVGilHON
	 T0lVRGhKcASYRRGMfUFMkMr67ctpsruVmTf/b0/87df+LAofBUCNmmbLqvjK7vPZ2k
	 kspRbAd1hTXLUznLCT2elteYkVFC35t8ffslqZHPDDQVxJc3HWCIAs7chSvJU/deEg
	 YmHhdQwxG3GwSOPLrsvvcQZQ+tHMwtBNb7AHKPREGF1DC1YOwPzF+LLL9SFcA8W16M
	 a061/KbZx2orA==
Date: Wed, 9 Oct 2024 15:43:02 +0100
From: Will Deacon <will@kernel.org>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Joey Gouly <joey.gouly@arm.com>, linux-arm-kernel@lists.infradead.org,
	nd@arm.com, akpm@linux-foundation.org, aneesh.kumar@kernel.org,
	aneesh.kumar@linux.ibm.com, anshuman.khandual@arm.com, bp@alien8.de,
	broonie@kernel.org, catalin.marinas@arm.com,
	christophe.leroy@csgroup.eu, dave.hansen@linux.intel.com,
	hpa@zytor.com, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org, maz@kernel.org, mingo@redhat.com,
	mpe@ellerman.id.au, naveen.n.rao@linux.ibm.com, npiggin@gmail.com,
	oliver.upton@linux.dev, shuah@kernel.org, skhan@linuxfoundation.org,
	szabolcs.nagy@arm.com, tglx@linutronix.de, x86@kernel.org,
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 19/30] arm64: add POE signal support
Message-ID: <20241009144301.GA12453@willie-the-truck>
References: <20240822151113.1479789-1-joey.gouly@arm.com>
 <20240822151113.1479789-20-joey.gouly@arm.com>
 <47e1537f-5b60-4541-aed1-a20e804c137d@arm.com>
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
In-Reply-To: <47e1537f-5b60-4541-aed1-a20e804c137d@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Kevin,

On Tue, Sep 24, 2024 at 01:27:58PM +0200, Kevin Brodsky wrote:
> On 22/08/2024 17:11, Joey Gouly wrote:
> > @@ -1178,6 +1237,9 @@ static void setup_return(struct pt_regs *regs, struct k_sigaction *ka,
> >  		sme_smstop();
> >  	}
> >  
> > +	if (system_supports_poe())
> > +		write_sysreg_s(POR_EL0_INIT, SYS_POR_EL0);
> 
> At the point where setup_return() is called, the signal frame has
> already been written to the user stack. In other words, we write to the
> user stack first, and then reset POR_EL0. This may be problematic,
> especially if we are using the alternate signal stack, which the
> interrupted POR_EL0 may not grant access to. In that situation uaccess
> will fail and we'll end up with a SIGSEGV.
> 
> This issue has already been discussed on the x86 side, and as it happens
> patches to reset PKRU early [1] have just landed. I don't think this is
> a blocker for getting this series landed, but we should try and align
> with x86. If there's no objection, I'm planning to work on a counterpart
> to the x86 series (resetting POR_EL0 early during signal delivery).

Did you get a chance to work on that? It would be great to land the
fixes for 6.12, if possible, so that the first kernel release with POE
support doesn't land with known issues.

Cheers,

Will

