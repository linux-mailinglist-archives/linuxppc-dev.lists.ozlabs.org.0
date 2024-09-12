Return-Path: <linuxppc-dev+bounces-1293-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B40E976986
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2024 14:49:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4HM0741Dz2y8B;
	Thu, 12 Sep 2024 22:49:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726145356;
	cv=none; b=J0U67eXuEHaqP9oq/mSlt/ukzfLirpsWBw1+RBip8pQk/hewkMkCf9e7E/tyWqJFxML0X60ZX34xq6jHDlebG4chw4fjqW9qEmC0T0ZFyGftHoNj844X7DjBowM5iLSfLHdskhiHSSxqWpIEBmhKa2JgbT2FoD8yKMjlVj/qk5e/r74esJzS+HByv/S70rVSnghg/VOive2CfTePSSYAynV4AlOkumNkCCifKqpkVJTDiU5QfkzstS1F0o1KEeV9I5gMOofULxwgbWSn1OdwtH+lJZbm1xLHdc4GRSEQh2TeDR7MO7icXKs2sml/JsbFGyEFRYjviOemTmta7aNG6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726145356; c=relaxed/relaxed;
	bh=rLBLI5dVrkWWSsMh7JaRkvOf4Z8ws21UnPX+021OswE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BrdEm11TuF/oAZRKPm3FWLwLGI8yx9RkyuK6m4zCwBKmZeQN0KhgfliPJVR+QlF8UKhQGb0qM4crNrCSlGe/xzG5a9beLUiMygwsHhA9tDMB4YMsOwuNKOvIQZAHakTaYg9KZwoUsIjIwb7XZc/IoDHdxsw32WR9KNIDnlSX/tyyiI/0gO0Y10BkFQ+bjWuHT8hPdvFRf1YIoh++/1MtwTPxJOuGGPwX8Q0BmcvfBvvNiJzHTu1rzq93YWCUtx85i+wi1BrbWOJUT60qQSl8qaaVRY32Su7409FKE2E22wEGovVgOEaUobLLrHniSxHf8j0qRN9VDPs/vBrbpwwG7Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=joey.gouly@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=joey.gouly@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4HM04CWzz2xPf
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2024 22:49:16 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 96090DA7;
	Thu, 12 Sep 2024 05:49:14 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 04ED03F73B;
	Thu, 12 Sep 2024 05:48:40 -0700 (PDT)
Date: Thu, 12 Sep 2024 13:48:35 +0100
From: Joey Gouly <joey.gouly@arm.com>
To: Will Deacon <will@kernel.org>
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
Message-ID: <20240912124835.GA1220495@e124191.cambridge.arm.com>
References: <20240822151113.1479789-1-joey.gouly@arm.com>
 <20240822151113.1479789-7-joey.gouly@arm.com>
 <425b8f8c-b6b5-422a-b5f4-41dd2d1ae3bb@arm.com>
 <6c8ad091-a56b-41ba-b403-2e3c2e578100@intel.com>
 <20240912105017.GA22788@willie-the-truck>
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
In-Reply-To: <20240912105017.GA22788@willie-the-truck>

On Thu, Sep 12, 2024 at 11:50:18AM +0100, Will Deacon wrote:
> Hi Dave,
> 
> On Wed, Sep 11, 2024 at 08:33:54AM -0700, Dave Hansen wrote:
> > On 9/11/24 08:01, Kevin Brodsky wrote:
> > > On 22/08/2024 17:10, Joey Gouly wrote:
> > >> @@ -371,6 +382,9 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
> > >>  		if (system_supports_tpidr2())
> > >>  			p->thread.tpidr2_el0 = read_sysreg_s(SYS_TPIDR2_EL0);
> > >>  
> > >> +		if (system_supports_poe())
> > >> +			p->thread.por_el0 = read_sysreg_s(SYS_POR_EL0);
> > > Here we are only reloading POR_EL0's value if the target is a user
> > > thread. However, as this series stands, POR_EL0 is also relevant to
> > > kthreads, because any uaccess or GUP done from a kthread will also be
> > > checked against POR_EL0. This is especially important in cases like the
> > > io_uring kthread, which accesses the memory of the user process that
> > > spawned it. To prevent such a kthread from inheriting a stale value of
> > > POR_EL0, it seems that we should reload POR_EL0's value in all cases
> > > (user and kernel thread).
> > 
> > The problem with this is trying to figure out which POR_EL0 to use.  The
> > kthread could have been spawned ages ago and might not have a POR_EL0
> > which is very different from the current value of any of the threads in
> > the process right now.
> > 
> > There's also no great way for a kthread to reach out and grab an updated
> > value.  It's all completely inherently racy.
> > 
> > > Other approaches could also be considered (e.g. resetting POR_EL0 to
> > > unrestricted when creating a kthread), see my reply on v4 [1].
> > 
> > I kinda think this is the only way to go.  It's the only sensible,
> > predictable way.  I _think_ it's what x86 will end up doing with PKRU,
> > but there's been enough churn there that I'd need to go double check
> > what happens in practice.
> 
> I agree.
> 
> > Either way, it would be nice to get an io_uring test in here that
> > actually spawns kthreads:
> > 
> > 	tools/testing/selftests/mm/protection_keys.c
> 
> It would be good to update Documentation/core-api/protection-keys.rst
> as well, since the example with read() raises more questions than it
> answers!
> 
> Kevin, Joey -- I've got this series queued in arm64 as-is, so perhaps
> you could send some patches on top so we can iron this out in time for
> 6.12? I'll also be at LPC next week if you're about.

I found the code in arch/x86 that does this, I must have missed this previously.

arch/x86/kernel/process.c: int copy_thread()                                                                                                                   

        /* Kernel thread ? */                                                                                                                                                                  
        if (unlikely(p->flags & PF_KTHREAD)) {                                                                                                                                                 
                p->thread.pkru = pkru_get_init_value();                                                                                                                                        
                memset(childregs, 0, sizeof(struct pt_regs));                                                                                                                                  
                kthread_frame_init(frame, args->fn, args->fn_arg);                                                                                                                             
                return 0;                                                                                                                                                                      
        }

I can send a similar patch for arm64.  I have no idea how to write io_uring
code, so looking for examples I can work with to get a test written. Might just
send the arm64 fix first, if that's fine?

Thanks,
Joey

