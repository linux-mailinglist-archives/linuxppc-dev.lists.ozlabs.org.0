Return-Path: <linuxppc-dev+bounces-972-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8E296B845
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2024 12:23:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzJV60Hznz2yVG;
	Wed,  4 Sep 2024 20:23:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725445390;
	cv=none; b=WnHGWhVh7BcCn0OLNh7ksMbMk1tQT9qu0m5cX+THioJG/THiybmy56Fz5MxV+7vhWa8a6fzePoCkmZ34F21pGTsm55Dvp3C1duYchy6S4JSex3A4medaHwKCLB+6JhdwdXgEMh8L20kYM+r300X4gOaj2B7b3JFiMfrIeMzicoWoTX5e3EN8zfAV3xr1+YHpQaLVPRKJRwymif4J83Mti37WkJ4buNZZUVSJ4tdWiRZQHM9QsaoKI1QmAEyL6XhuprNN/WTPmPsLv8PJj0hmJ5C4ryk4NducvP2xEDoNZLH/Zzg5ZQIW7Zn0/v3XzZ07uggkMWETYD/SF12lLLawtA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725445390; c=relaxed/relaxed;
	bh=PdIy0IDxxcEhjL8PbG0hJAsg75yLIk5qtMcVRqIYb0I=;
	h=DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To; b=aU28a8Vv8ulnHMW0rcY/2RbcQoLFTnQ0HmK1pyeGmJdtG3ddBKk9DgsXcKJZydpWDS1h5NzFHzyTwB4oTfYL6vJpp8NaJJHK4N8nTXgIfSbIQCk5qYwRzMhBJywt02fIuL6mmtHHipbvnjJEIR4/8zJpthD3KxbrnWSwFhftg5gNg7Pq/PDlRTMFuz3TKis+guE41OJOZiLTt/rkskd2eVGf70hIZhURuJNGfoSCoXS1LyEdWBI8vqf5ZYbp6vHBHZ+fSVN9Kz0UEmA00/C+15c9l8SKbff8dYuNdF8qmN5Uky9FVWjojWD+HY2JPf9dZkvce3uIt8UH8gY1WtGWOg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XFuWolvo; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=will@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XFuWolvo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=will@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzJV53C1Mz2yS0
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2024 20:23:09 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 89E0E5C56EA;
	Wed,  4 Sep 2024 10:22:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E02FEC4CEC6;
	Wed,  4 Sep 2024 10:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725445382;
	bh=x6g+EMj9hEE7gJBznAvd51VhitMf4AGn6YNEwakOXnM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XFuWolvohOrzFjBimZJsYPU40a03g6/+mE8Mf5MyAP+BtHCQ04YOEk3qScOLHFauH
	 LHvXml9pB5vCkZObjlHtsowepQgfnDM0ZXqIYnHwqg+RVtgRYP0PCfrbaEsNTbu9Nf
	 LklDAmkyWdjN4wkHFRPAcV7LSz7OKTnxR4MAvSHC0x1f8PBWRcwOlhLJ2k0w14koAs
	 86Fgnm5u0+u999x7MXvWytZryAmoTWHrymaEp+DTUrlT1oUzsmEaY8g7A2F/gyuSgW
	 0TSCRY37gyHXmyfic0kLPzDjGO4QFwgv25bixlW6H66a5BOAIPiZ0AZR+kAufu8J+E
	 maWhiRUgAL2EA==
Date: Wed, 4 Sep 2024 11:22:54 +0100
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
Message-ID: <20240904102254.GA13280@willie-the-truck>
References: <20240822151113.1479789-1-joey.gouly@arm.com>
 <20240822151113.1479789-7-joey.gouly@arm.com>
 <20240823144531.GH32156@willie-the-truck>
 <Zsi7ovLOfuFdfuuz@arm.com>
 <20240823170835.GA1181@willie-the-truck>
 <ZsjXtE7Kg0LQwNAL@arm.com>
 <20240827113803.GB4318@willie-the-truck>
 <ZtYNGBrcE-j35fpw@arm.com>
 <20240903145413.GB3669886@e124191.cambridge.arm.com>
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
In-Reply-To: <20240903145413.GB3669886@e124191.cambridge.arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Sep 03, 2024 at 03:54:13PM +0100, Joey Gouly wrote:
> On Mon, Sep 02, 2024 at 08:08:08PM +0100, Catalin Marinas wrote:
> > On Tue, Aug 27, 2024 at 12:38:04PM +0100, Will Deacon wrote:
> > > On Fri, Aug 23, 2024 at 07:40:52PM +0100, Catalin Marinas wrote:
> > > > On Fri, Aug 23, 2024 at 06:08:36PM +0100, Will Deacon wrote:
> > > > > On Fri, Aug 23, 2024 at 05:41:06PM +0100, Catalin Marinas wrote:
> > > > > > On Fri, Aug 23, 2024 at 03:45:32PM +0100, Will Deacon wrote:
> > > > > > > On Thu, Aug 22, 2024 at 04:10:49PM +0100, Joey Gouly wrote:
> > > > > > > > +static void permission_overlay_switch(struct task_struct *next)
> > > > > > > > +{
> > > > > > > > +	if (!system_supports_poe())
> > > > > > > > +		return;
> > > > > > > > +
> > > > > > > > +	current->thread.por_el0 = read_sysreg_s(SYS_POR_EL0);
> > > > > > > > +	if (current->thread.por_el0 != next->thread.por_el0) {
> > > > > > > > +		write_sysreg_s(next->thread.por_el0, SYS_POR_EL0);
> > > > > > > > +		/* ISB required for kernel uaccess routines when chaning POR_EL0 */
> > > > > > >
> > > > > > > nit: typo "chaning".
> > > > > > >
> > > > > > > But more substantially, is this just to prevent spurious faults in the
> > > > > > > context of a new thread using a stale value for POR_EL0?
> > > > > >
> > > > > > Not just prevent faults but enforce the permissions from the new
> > > > > > thread's POR_EL0. The kernel may continue with a uaccess routine from
> > > > > > here, we can't tell.
> > [...]
> > > > > So what do we actually gain by having the uaccess routines honour this?
> > > >
> > > > I guess where it matters is more like not accidentally faulting because
> > > > the previous thread had more restrictive permissions.
> > >
> > > That's what I wondered initially, but won't the fault handler retry in
> > > that case?
> >
> > Yes, it will retry and this should be fine (I assume you are only
> > talking about the dropping ISB in the context switch).
> >
> > For the case of running with a more permissive stale POR_EL0, arguably it's
> > slightly more predictable for the user but, OTOH, some syscalls like
> > readv() could be routed through GUP with no checks. As with MTE, we
> > don't guarantee uaccesses honour the user permissions.
> >
> > That said, at some point we should sanitise this path anyway and have a
> > single ISB at the end. In the meantime, I'm fine with dropping the ISB
> > here.
> >
> 
> commit 3141fb86bee8d48ae47cab1594dad54f974a8899
> Author: Joey Gouly <joey.gouly@arm.com>
> Date:   Tue Sep 3 15:47:26 2024 +0100
> 
>     fixup! arm64: context switch POR_EL0 register
> 
> diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
> index a3a61ecdb165..c224b0955f1a 100644
> --- a/arch/arm64/kernel/process.c
> +++ b/arch/arm64/kernel/process.c
> @@ -515,11 +515,8 @@ static void permission_overlay_switch(struct task_struct *next)
>                 return;
> 
>         current->thread.por_el0 = read_sysreg_s(SYS_POR_EL0);
> -       if (current->thread.por_el0 != next->thread.por_el0) {
> +       if (current->thread.por_el0 != next->thread.por_el0)
>                 write_sysreg_s(next->thread.por_el0, SYS_POR_EL0);
> -               /* ISB required for kernel uaccess routines when chaning POR_EL0 */
> -               isb();
> -       }
>  }

What about the one in flush_poe()? I'm inclined to drop that as well.

> Will, do you want me to re-send the series with this and the permissions
> diff from the other thread [1],
> or you ok with applying them when you pull it in?

I'll have a crack now, but if it fails miserably then I'll let you know.

Will

