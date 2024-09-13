Return-Path: <linuxppc-dev+bounces-1340-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9832978412
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2024 17:15:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4yXw4zw1z2yk8;
	Sat, 14 Sep 2024 01:15:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726240512;
	cv=none; b=d22djWWolmoVrknMcpIjK0dEDCPH2zPl4xGZDm2JHfLXRmixH94IEIVFd+Omma916QbzzMXKBCf1kEwA/esAPAurvsICyvtUqd2adJsuWNkIORm0EvqNedymWPfZpVE5j37C8WUVYL4aH0Nl7Ngwizcr82J4+DQTv2jYHSy13Z3qneKyshjGb9k4gX9pG7BXGVD2XOlHvgfxYmZARbCwloMjE3pB7NjpGFbRUke1Jvqd3q0lww7LQ4F5EYMIESqR3Cyc822qFl4nbxsvQb4UB3P7edMQHAFao3TJOkyjvl0xTmMMJbJME38WyRYsG0Ry23rvawVlyhcKshMzoc0bdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726240512; c=relaxed/relaxed;
	bh=dTLu7MIFHyDNhq8ItbYdY645AH8LAcdSbZc+lrrmu0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OKw6Cxm0ae39Kk+uywQJunXU1xYKp5h30z9vzxyq3ErYVLYqnz5dFPlthXaCvtbGC7oHD4Aorw8SUDTn5UOZjYQy2vOiCu/7O+X0jmRis4KzGkDIORbSX4HF6vE4N81ol7x5Lmb25TlhH3CIOWXI7tRaFjfLRs7UJSRYj12VY6dWAVbmQMLhNxybUVCKWLAxJVESbpsucguNJiFi9Ayw/RADUnmbssKbfeVV92RtwWX3IxmNCOgUKk97qKH1PQeBm54I5bZGETmNMn68mkm/WZ+IgPmQvgX3zSGiFeGJJ1f4KH9kF7Rhwrx1/RSlXhfyU2ucdj68kb++VwOduMvALw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BWnylCm4; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=will@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BWnylCm4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=will@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X4yXw20Xrz2xjd
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Sep 2024 01:15:12 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 591CA5C5529;
	Fri, 13 Sep 2024 15:15:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BB3AC4CEC0;
	Fri, 13 Sep 2024 15:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726240508;
	bh=hG0+mr6n6c2AOqquKXji3PgaSzohcst94Wj42JS1S+I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BWnylCm4mReU8AS0leB+Zu+H/60Ov75IX+4RcMT07bw/NSlFUtgczPE92soGj0A0q
	 542x8M8eWvcVYa3w8j1pJ4wodResMwstCU9WRWL+4Bv7klLpSkpILEqOXkK2xTbvjI
	 k7LO3FcSRX+QQPQ85stGEPkaCLs/93PocVVcAqwc97TkLzlGfXUTiDkvoa/W31NhS8
	 ZTsEo1Zfjv/PTpTlD075NPfKSAhzSd7lUsWT3ZAvYgMWVY06K4V/tyQXnFNxB9zsX0
	 tss/gEKf+QaNU/wq7UCRsBMZMRdCi4O4eV+W/SoX8gfoYY4bCaUnaRFI3uHHSOXLks
	 8MndKUMe6veNw==
Date: Fri, 13 Sep 2024 16:14:59 +0100
From: Will Deacon <will@kernel.org>
To: Joey Gouly <joey.gouly@arm.com>
Cc: Dave Hansen <dave.hansen@intel.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	linux-arm-kernel@lists.infradead.org, nd@arm.com,
	akpm@linux-foundation.org, aneesh.kumar@kernel.org,
	aneesh.kumar@linux.ibm.com, anshuman.khandual@arm.com, bp@alien8.de,
	broonie@kernel.org, catalin.marinas@arm.com,
	christophe.leroy@csgroup.eu, dave.hansen@linux.intel.com,
	hpa@zytor.com, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org, maz@kernel.org, mingo@redhat.com,
	mpe@ellerman.id.au, naveen.n.rao@linux.ibm.com, npiggin@gmail.com,
	oliver.upton@linux.dev, shuah@kernel.org, skhan@linuxfoundation.org,
	szabolcs.nagy@arm.com, tglx@linutronix.de, x86@kernel.org,
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 06/30] arm64: context switch POR_EL0 register
Message-ID: <20240913151459.GA24129@willie-the-truck>
References: <20240822151113.1479789-1-joey.gouly@arm.com>
 <20240822151113.1479789-7-joey.gouly@arm.com>
 <425b8f8c-b6b5-422a-b5f4-41dd2d1ae3bb@arm.com>
 <6c8ad091-a56b-41ba-b403-2e3c2e578100@intel.com>
 <20240912105017.GA22788@willie-the-truck>
 <20240912124835.GA1220495@e124191.cambridge.arm.com>
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
In-Reply-To: <20240912124835.GA1220495@e124191.cambridge.arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Thu, Sep 12, 2024 at 01:48:35PM +0100, Joey Gouly wrote:
> On Thu, Sep 12, 2024 at 11:50:18AM +0100, Will Deacon wrote:
> > On Wed, Sep 11, 2024 at 08:33:54AM -0700, Dave Hansen wrote:
> > > On 9/11/24 08:01, Kevin Brodsky wrote:
> > > > On 22/08/2024 17:10, Joey Gouly wrote:
> > > >> @@ -371,6 +382,9 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
> > > >>  		if (system_supports_tpidr2())
> > > >>  			p->thread.tpidr2_el0 = read_sysreg_s(SYS_TPIDR2_EL0);
> > > >>  
> > > >> +		if (system_supports_poe())
> > > >> +			p->thread.por_el0 = read_sysreg_s(SYS_POR_EL0);
> > > > Here we are only reloading POR_EL0's value if the target is a user
> > > > thread. However, as this series stands, POR_EL0 is also relevant to
> > > > kthreads, because any uaccess or GUP done from a kthread will also be
> > > > checked against POR_EL0. This is especially important in cases like the
> > > > io_uring kthread, which accesses the memory of the user process that
> > > > spawned it. To prevent such a kthread from inheriting a stale value of
> > > > POR_EL0, it seems that we should reload POR_EL0's value in all cases
> > > > (user and kernel thread).
> > > 
> > > The problem with this is trying to figure out which POR_EL0 to use.  The
> > > kthread could have been spawned ages ago and might not have a POR_EL0
> > > which is very different from the current value of any of the threads in
> > > the process right now.
> > > 
> > > There's also no great way for a kthread to reach out and grab an updated
> > > value.  It's all completely inherently racy.
> > > 
> > > > Other approaches could also be considered (e.g. resetting POR_EL0 to
> > > > unrestricted when creating a kthread), see my reply on v4 [1].
> > > 
> > > I kinda think this is the only way to go.  It's the only sensible,
> > > predictable way.  I _think_ it's what x86 will end up doing with PKRU,
> > > but there's been enough churn there that I'd need to go double check
> > > what happens in practice.
> > 
> > I agree.
> > 
> > > Either way, it would be nice to get an io_uring test in here that
> > > actually spawns kthreads:
> > > 
> > > 	tools/testing/selftests/mm/protection_keys.c
> > 
> > It would be good to update Documentation/core-api/protection-keys.rst
> > as well, since the example with read() raises more questions than it
> > answers!
> > 
> > Kevin, Joey -- I've got this series queued in arm64 as-is, so perhaps
> > you could send some patches on top so we can iron this out in time for
> > 6.12? I'll also be at LPC next week if you're about.
> 
> I found the code in arch/x86 that does this, I must have missed this previously.
> 
> arch/x86/kernel/process.c: int copy_thread()                                                                                                                   
> 
>         /* Kernel thread ? */                                                                                                                                                                  
>         if (unlikely(p->flags & PF_KTHREAD)) {                                                                                                                                                 
>                 p->thread.pkru = pkru_get_init_value();                                                                                                                                        
>                 memset(childregs, 0, sizeof(struct pt_regs));                                                                                                                                  
>                 kthread_frame_init(frame, args->fn, args->fn_arg);                                                                                                                             
>                 return 0;                                                                                                                                                                      
>         }
> 
> I can send a similar patch for arm64.  I have no idea how to write io_uring
> code, so looking for examples I can work with to get a test written. Might just
> send the arm64 fix first, if that's fine?

I think fix + documentation is what we need before 6.12, but you've still
got plenty of time after the merge window.

Cheers,

Will

