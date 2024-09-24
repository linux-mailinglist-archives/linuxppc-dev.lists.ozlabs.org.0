Return-Path: <linuxppc-dev+bounces-1570-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A80AE984838
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2024 17:06:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XCjqD0dw1z2yRG;
	Wed, 25 Sep 2024 01:06:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727190360;
	cv=none; b=Ls+f+vYhdP2Al3K0CoIsvqOgFAnZZDm0j3VyHCe5OIXafIXL+/4vzNIjPtG7CJF1kL7aOYzbYQvQTnjgE/6vMmhXCRbQlARwHmmsZ9yahtmJk/UKJn/ha2cCius/JW9T0fmYEuF9nLw0z8BDsWPyjLvQe1GmB958AmYLshR8/kPKDU1QO7xJfxFg0sPbpLd7Uxv+rAn11S/TbMMSOGXpQ7mULcY3dEOwvAb7/gqTGXq13906RFE8K804D6EfOuaiWSlRparDm7Q7JSlQ7hESF9QKQ5fQ8Gg6mtrsBTH1eLU0kM14fCYrQEPLe9ZKzRiitTtIZCCYfVZhlcq58FmpGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727190360; c=relaxed/relaxed;
	bh=mklFHkXhRn/bZ8Lhq7FZkmILG+yT7GCgmYCDnIZpfBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jfXJfL8HF4P+geDtGBHpqejXoBxwdEMBRguADr3hQhUcLcEVtetnfTXaR+iCr6P0Te32B6TTRqKE4C11Qw57vYsrpXtXITVtoZMuRguGNO8PCgzhjyXy8Z2d3jv4o9oRf1snCbNjED+MTqHa8kDnM1P/gX6CjYXKwvddmPJwMjLAI4+97EhKUblKs2lFjtKsh4NBgyfmsITWTppHNtiHMQB4CLQrKZ9I//C9RpbS9nLUx/7jPPUmP80ajcpuoXWW1lbg0+nMAeCNRXItoDpVJ8OvImO2+uiC9S8IsJm0q87kCFsnq83UhTDfvF3eQQH9k736Mj1lAjUd9d0mbyHYkg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=dave.martin@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=dave.martin@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XCjqC36Dcz2yN1
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Sep 2024 01:05:57 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 68898DA7;
	Tue, 24 Sep 2024 08:05:54 -0700 (PDT)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9B4EF3F7A6;
	Tue, 24 Sep 2024 08:05:20 -0700 (PDT)
Date: Tue, 24 Sep 2024 16:04:43 +0100
From: Dave Martin <Dave.Martin@arm.com>
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
	szabolcs.nagy@arm.com, tglx@linutronix.de, will@kernel.org,
	x86@kernel.org, kvmarm@lists.linux.dev,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 19/30] arm64: add POE signal support
Message-ID: <ZvLVC0/baXfJHgww@e133380.arm.com>
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
> 
> Kevin
> 
> [1]
> https://lore.kernel.org/lkml/20240802061318.2140081-2-aruna.ramakrishna@oracle.com/

+1, all the uaccess in signal delivery is done by the kernel on behalf
of the signal handler context, so we should do it with (at least) the
same memory permissions that the signal handler is going to be entered
with.

(In an ideal world, userspace would save this information itself, using
its own handler permissions -- well, no, in an ideal world we wouldn't
have the signal delivery mechanism at all, but hopefully you get the
idea.)

Cheers
---Dave
> 

