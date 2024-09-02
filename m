Return-Path: <linuxppc-dev+bounces-885-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 98966968E1E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2024 21:08:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WyJF02MQMz2yHj;
	Tue,  3 Sep 2024 05:08:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725304100;
	cv=none; b=atmEqWg4kBKZdT8ivTLQ/4Xut5Wix56MPmjHFeCt7xPRPA3bhmd9SQX8F//TOnG+UYfHgahmwMBoS3HTXqPBlhPgKcNzWq/4vM71H68+so/Z85smlDUiT7HCYHstbWa0Hk+OyobQ9voYnYPX1I0WM9R78P0H8sjLS/VI+EqywdNILrNy6+nmvoqfH6ftVPCaIGg4d8PKxR7qUxj2XzjCRm14lAOCv5pv0BVMOMpMrXSAexWwSgJ3XTRDfmpgnBkKqCNi5sucRLp1PlMw2rLtgDRShEss28C7CPS3JvgnA/lCyPzdEPOcQEsIXECEUh0dF+0RLw+I1LdQnry5lwQmiA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725304100; c=relaxed/relaxed;
	bh=pn2nVuJ3P3f/HSlVJLpRyhFtgyUbvXYluAUxlc8oLnk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XAcdZv0PZMBR6vbMbVUdfviQTQqApIPnrSiU8QQpXJVky2z/ufbfE2kfplTcmSm7HuVJUJTWohZqoahW/r50FZyLNCCNK2B8JoCsiLrs3teHWWUEJbaXNWrwX19unp2rLfhdW8lAT0lQSr4BTamzeb4/35wco+eeZzGUGGR4fiJ/ch4FkUKDmGLyS74ATTOR02/JhXrOfGH9eQW/Zou5Ab8dfpxlV+EkweMpmt+dBM5ODBaxCxeXTW6cr2ya99y+HtmB+cjrM2cT+s2IqHiwJQ7lSuk5NalOQsbjgYRpgF45TNGrAwV7Jkt3lCeEk2yYF5UzQImuXz9BWGxw4oO9/g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WyJDz3Npvz2xbF
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2024 05:08:19 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6BE76A431C9;
	Mon,  2 Sep 2024 19:08:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FCD8C4CEC2;
	Mon,  2 Sep 2024 19:08:10 +0000 (UTC)
Date: Mon, 2 Sep 2024 20:08:08 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
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
Message-ID: <ZtYNGBrcE-j35fpw@arm.com>
References: <20240822151113.1479789-1-joey.gouly@arm.com>
 <20240822151113.1479789-7-joey.gouly@arm.com>
 <20240823144531.GH32156@willie-the-truck>
 <Zsi7ovLOfuFdfuuz@arm.com>
 <20240823170835.GA1181@willie-the-truck>
 <ZsjXtE7Kg0LQwNAL@arm.com>
 <20240827113803.GB4318@willie-the-truck>
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
In-Reply-To: <20240827113803.GB4318@willie-the-truck>

On Tue, Aug 27, 2024 at 12:38:04PM +0100, Will Deacon wrote:
> On Fri, Aug 23, 2024 at 07:40:52PM +0100, Catalin Marinas wrote:
> > On Fri, Aug 23, 2024 at 06:08:36PM +0100, Will Deacon wrote:
> > > On Fri, Aug 23, 2024 at 05:41:06PM +0100, Catalin Marinas wrote:
> > > > On Fri, Aug 23, 2024 at 03:45:32PM +0100, Will Deacon wrote:
> > > > > On Thu, Aug 22, 2024 at 04:10:49PM +0100, Joey Gouly wrote:
> > > > > > +static void permission_overlay_switch(struct task_struct *next)
> > > > > > +{
> > > > > > +	if (!system_supports_poe())
> > > > > > +		return;
> > > > > > +
> > > > > > +	current->thread.por_el0 = read_sysreg_s(SYS_POR_EL0);
> > > > > > +	if (current->thread.por_el0 != next->thread.por_el0) {
> > > > > > +		write_sysreg_s(next->thread.por_el0, SYS_POR_EL0);
> > > > > > +		/* ISB required for kernel uaccess routines when chaning POR_EL0 */
> > > > > 
> > > > > nit: typo "chaning".
> > > > > 
> > > > > But more substantially, is this just to prevent spurious faults in the
> > > > > context of a new thread using a stale value for POR_EL0?
> > > > 
> > > > Not just prevent faults but enforce the permissions from the new
> > > > thread's POR_EL0. The kernel may continue with a uaccess routine from
> > > > here, we can't tell.
[...]
> > > So what do we actually gain by having the uaccess routines honour this?
> > 
> > I guess where it matters is more like not accidentally faulting because
> > the previous thread had more restrictive permissions.
> 
> That's what I wondered initially, but won't the fault handler retry in
> that case?

Yes, it will retry and this should be fine (I assume you are only
talking about the dropping ISB in the context switch).

For the case of running with a more permissive stale POR_EL0, arguably it's
slightly more predictable for the user but, OTOH, some syscalls like
readv() could be routed through GUP with no checks. As with MTE, we
don't guarantee uaccesses honour the user permissions.

That said, at some point we should sanitise this path anyway and have a
single ISB at the end. In the meantime, I'm fine with dropping the ISB
here.

-- 
Catalin

