Return-Path: <linuxppc-dev+bounces-985-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA78096BB10
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2024 13:43:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzLGW5GVcz2yYJ;
	Wed,  4 Sep 2024 21:43:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725450195;
	cv=none; b=W3NkRLv2CJrUOFW7nLkrTuLinDOVLArkMp/tbJs9fzQ5ilATD2b6U3eQ6BriIrFHa0Xsha4SUaqSISovuLToZhCUtuPvrx8BLXk/GmvQ2YwhPxj0xuvjJAxycqR3o2jGby3OjIfX2jJCu8WMe8hMg7QD5AljAVRr5CfI4M7RCPS/z/kjiIfqXLfOgDd66VMLsXSqKTQ5aOg+30LP4LxsM2wJ/WyqEKaxwwLopcKiSdzniE8tifxoIWBGzfkeaBWMLEMUohEngm5qxBLeiXHt7kVqIiKYdFPOV4X4GmYBld3SUbiYblsembAeFMBE2mp5VNqicvvYLWx87ck9+CXkFg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725450195; c=relaxed/relaxed;
	bh=3BTxzmFXXtBSc6qofBMwvBr17mPhTOeoD6JUn7O6HBE=;
	h=DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To; b=Q3I/5F/SVBdGb24rGZR1e7MQHsAXeo1mYvu+foXwXDbsp+fEOxAjNkpxPwLbdxxNsv6Dm0GH6U+rROCah7WUzkjHl9uEezgELIUz0AUmx/g/r23kVu+GzaaFjghfmPjRnmWPf3TodX8pQQJ6zhZxUgfbFrgBc9VKxPDzIpNx1DPOJaQy3KquWzd98tUuWEJv8jAzbXqHgLrWIiZFqvnbkXwRZdiKfV6r0cQE4toIWfV7KpXcMUVsListzO4ksl9BZDc5yplOAs6C1ZuZNj5rNawVZvrM0MoiYYCjAfxTwg2GPGX3vcVXxFwGbw+5mlaGUreN0OriJGJOhstekw/esg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kDOCm13e; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=will@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kDOCm13e;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=will@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzLGW1zn1z2yV3
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2024 21:43:15 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C98F4A440EC;
	Wed,  4 Sep 2024 11:43:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2318C4CEC2;
	Wed,  4 Sep 2024 11:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725450190;
	bh=1R47JLECqfMcUivgiQR6XDvQF6Jb0RlGzKzhZ5bCKsk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kDOCm13euF7DxBt8JcfDA8RsjG4MZJhZ27+NJPvRYOHFOIFVEJc0l6JGicavkhqFp
	 ocM/Hc7Ei/JeuUSqdamuIxsSmM5JmLH2Z52OgD5iztKVCIjp7sX8PLLUEu9j6MPmCH
	 BYX7tb0KyzLaSS647l0ocymi+ZWWv+J7JXsEwNWQp+rJTW0T0DXaaa93jW3QN9FGLb
	 biQUrzgmKdTHsim1RB78jWVNvmDQb4gv4JOoem65A64jZ/hpremFoloDb9L+1PbLXL
	 pOr5XcN9nzcv5FCk0AbNAEX4DfKr02w9IdPgHqDsgUC/Z58ctJv9XU8IOftgkkb4Yv
	 RQfwAY8aQDCkA==
Date: Wed, 4 Sep 2024 12:43:02 +0100
From: Will Deacon <will@kernel.org>
To: Joey Gouly <joey.gouly@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org, nd@arm.com,
	akpm@linux-foundation.org, aneesh.kumar@kernel.org,
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
Message-ID: <20240904114301.GA13550@willie-the-truck>
References: <20240822151113.1479789-7-joey.gouly@arm.com>
 <20240823144531.GH32156@willie-the-truck>
 <Zsi7ovLOfuFdfuuz@arm.com>
 <20240823170835.GA1181@willie-the-truck>
 <ZsjXtE7Kg0LQwNAL@arm.com>
 <20240827113803.GB4318@willie-the-truck>
 <ZtYNGBrcE-j35fpw@arm.com>
 <20240903145413.GB3669886@e124191.cambridge.arm.com>
 <20240904102254.GA13280@willie-the-truck>
 <20240904113221.GA3891700@e124191.cambridge.arm.com>
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
In-Reply-To: <20240904113221.GA3891700@e124191.cambridge.arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed, Sep 04, 2024 at 12:32:21PM +0100, Joey Gouly wrote:
> On Wed, Sep 04, 2024 at 11:22:54AM +0100, Will Deacon wrote:
> > On Tue, Sep 03, 2024 at 03:54:13PM +0100, Joey Gouly wrote:
> > > On Mon, Sep 02, 2024 at 08:08:08PM +0100, Catalin Marinas wrote:
> > > > On Tue, Aug 27, 2024 at 12:38:04PM +0100, Will Deacon wrote:
> > > > > On Fri, Aug 23, 2024 at 07:40:52PM +0100, Catalin Marinas wrote:
> > > > > > On Fri, Aug 23, 2024 at 06:08:36PM +0100, Will Deacon wrote:
> > > > > > > On Fri, Aug 23, 2024 at 05:41:06PM +0100, Catalin Marinas wrote:
> > > > > > > > On Fri, Aug 23, 2024 at 03:45:32PM +0100, Will Deacon wrote:
> > > > > > > > > On Thu, Aug 22, 2024 at 04:10:49PM +0100, Joey Gouly wrote:
> > > > > > > > > > +static void permission_overlay_switch(struct task_struct *next)
> > > > > > > > > > +{
> > > > > > > > > > +	if (!system_supports_poe())
> > > > > > > > > > +		return;
> > > > > > > > > > +
> > > > > > > > > > +	current->thread.por_el0 = read_sysreg_s(SYS_POR_EL0);
> > > > > > > > > > +	if (current->thread.por_el0 != next->thread.por_el0) {
> > > > > > > > > > +		write_sysreg_s(next->thread.por_el0, SYS_POR_EL0);
> > > > > > > > > > +		/* ISB required for kernel uaccess routines when chaning POR_EL0 */
> > > > > > > > >
> > > > > > > > > nit: typo "chaning".
> > > > > > > > >
> > > > > > > > > But more substantially, is this just to prevent spurious faults in the
> > > > > > > > > context of a new thread using a stale value for POR_EL0?
> > > > > > > >
> > > > > > > > Not just prevent faults but enforce the permissions from the new
> > > > > > > > thread's POR_EL0. The kernel may continue with a uaccess routine from
> > > > > > > > here, we can't tell.
> > > > [...]
> > > > > > > So what do we actually gain by having the uaccess routines honour this?
> > > > > >
> > > > > > I guess where it matters is more like not accidentally faulting because
> > > > > > the previous thread had more restrictive permissions.
> > > > >
> > > > > That's what I wondered initially, but won't the fault handler retry in
> > > > > that case?
> > > >
> > > > Yes, it will retry and this should be fine (I assume you are only
> > > > talking about the dropping ISB in the context switch).
> > > >
> > > > For the case of running with a more permissive stale POR_EL0, arguably it's
> > > > slightly more predictable for the user but, OTOH, some syscalls like
> > > > readv() could be routed through GUP with no checks. As with MTE, we
> > > > don't guarantee uaccesses honour the user permissions.
> > > >
> > > > That said, at some point we should sanitise this path anyway and have a
> > > > single ISB at the end. In the meantime, I'm fine with dropping the ISB
> > > > here.
> > > >
> > > 
> > > commit 3141fb86bee8d48ae47cab1594dad54f974a8899
> > > Author: Joey Gouly <joey.gouly@arm.com>
> > > Date:   Tue Sep 3 15:47:26 2024 +0100
> > > 
> > >     fixup! arm64: context switch POR_EL0 register
> > > 
> > > diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
> > > index a3a61ecdb165..c224b0955f1a 100644
> > > --- a/arch/arm64/kernel/process.c
> > > +++ b/arch/arm64/kernel/process.c
> > > @@ -515,11 +515,8 @@ static void permission_overlay_switch(struct task_struct *next)
> > >                 return;
> > > 
> > >         current->thread.por_el0 = read_sysreg_s(SYS_POR_EL0);
> > > -       if (current->thread.por_el0 != next->thread.por_el0) {
> > > +       if (current->thread.por_el0 != next->thread.por_el0)
> > >                 write_sysreg_s(next->thread.por_el0, SYS_POR_EL0);
> > > -               /* ISB required for kernel uaccess routines when chaning POR_EL0 */
> > > -               isb();
> > > -       }
> > >  }
> > 
> > What about the one in flush_poe()? I'm inclined to drop that as well.
> 
> Yes I guess that one can be removed too. Catalin any comments?
> 
> > 
> > > Will, do you want me to re-send the series with this and the permissions
> > > diff from the other thread [1],
> > > or you ok with applying them when you pull it in?
> > 
> > I'll have a crack now, but if it fails miserably then I'll let you know.
> 
> Thanks! Just to make sure, you should pick the patch up from
> 
> 	https://lore.kernel.org/linux-arm-kernel/20240903152937.GA3768522@e124191.cambridge.arm.com/
> 
> Not the one I linked to in [1] in my previous e-mail.

Right, there's quite a lot I need to do:

- Uncorrupt your patches
- Fix the conflict in the kvm selftests
- Drop the unnecessary ISBs
- Fix the ESR checking
- Fix the el2_setup labels
- Reorder the patches
- Drop the patch that is already in kvmarm

Working on it...

Will

