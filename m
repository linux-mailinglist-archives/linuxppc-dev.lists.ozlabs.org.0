Return-Path: <linuxppc-dev+bounces-7981-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A32A9CA5C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Apr 2025 15:31:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZkYf44jmLz2yr2;
	Fri, 25 Apr 2025 23:31:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745587900;
	cv=none; b=Jb448g+yIlhzeEzKGwuN5FoQtvouip1KtjnL3kVKNjsp6MRISOTTodJrUfDGvNe4XYU/NaaPMamvzV+6xk2ncku5wc4T9B8A+AGufJe4OfGCQZ8cc8YzTIkwzLACvYFG+rOL2gZmxKWgDQwPFiXnfIh2Jt5mabn3b7XX0sYGNPxVjOfpsNLkLb/AqzpZIknMnJY3SUuutPnZ7HCLdfnHB2Ba1xQ4czhWZnsd5h5uMY7+IGjQ2iG+LyZP1o0VMgYwETSZczGAhbuGZOywQCVlTQ3f8Tib/GpwQI9yV2jNuKNF2bZTKvHWifOHu2szh6g5XxtcuxBYNFF8505ojkqL7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745587900; c=relaxed/relaxed;
	bh=djfFPUnOt5o5/K/Hxm87135eBcbaPqNQQBh2lVeaSNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lH1xAmH28H2xRtQMsbN56DXEIHpms3ZyXzQBdS/hUpJ7Tz5o0qJ3H+EDVWVRvnX6Zyu6giggcpmOOGcSR8+M+zEJO5Q15kD7GbVKk8poIa3Mx9Zo9KHI/4MReUdE5/ksedz2HuRZvvi4dr6rF2sKnnxPln4RGreUSHzbFeXxGLeJiZm0cwtoIXWI4hOAohHfTPoM0mkJbqsgnj4ca223PiTTDPI9UmOZGCtqT1YXKMU1eGJAQ2j8256B4An8E9IUBNcZ42qyOKBuJA57vEZ459+lwAI/tta1JxmMbkKhBD2QDLUFe6hii+HreuOxcw52/DyK7mEVRSeoKXn3smcaVg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=NbrJ58cQ; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=M3uDObKF; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=bigeasy@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=NbrJ58cQ;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=M3uDObKF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=bigeasy@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZkYf32X2zz2yb9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Apr 2025 23:31:39 +1000 (AEST)
Date: Fri, 25 Apr 2025 15:31:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745587892;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=djfFPUnOt5o5/K/Hxm87135eBcbaPqNQQBh2lVeaSNc=;
	b=NbrJ58cQQLxXBxZtAXQe+0leM/OhjC7mHW8Q6Fun3qTXFaeuG2CKR161yMy4wpc4h3RfQi
	g5o/RQfSg71p32NL3qGFc+4TdwcAU21CMoOOn8FqeMIYCxl77P8qlO5aANA59mLuuEfHDB
	eWhP0GDSwOqIF2pmoJNqvZb2bL6IoW4Y6v8o6GoXXwK7gk3v78LD9316Me35ZTcs6NGLbp
	QLRYwuGkE4KD8JgDeLhCzMffGtDUIoyHxERltw6I7HINzowzQ3Akwus0dkD7LN8ZSV138K
	+sZkzS25dwZaENmXKMAXGoBC80mT8UMekbc9tAsKbCQztZp9j1LmzFNct79f6Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745587892;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=djfFPUnOt5o5/K/Hxm87135eBcbaPqNQQBh2lVeaSNc=;
	b=M3uDObKFOzxgMvD4Ccg/EIEXg+NEN+pYyyvPdzNbKq2UCYS8t2y5jdWSue//HRtzaIq07G
	00U/v3RpfBKzeoBQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: npiggin@gmail.com, vaibhav@linux.ibm.com, maddy@linux.ibm.com,
	linuxppc-dev@lists.ozlabs.org, christophe.leroy@csgroup.eu,
	gautam@linux.ibm.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] powerpc: kvm: use generic transfer to guest mode work
Message-ID: <20250425133131.DTvWJE29@linutronix.de>
References: <20250421102837.78515-1-sshegde@linux.ibm.com>
 <20250421102837.78515-2-sshegde@linux.ibm.com>
 <20250424144215._ooDjDz9@linutronix.de>
 <365ba747-9311-45ab-b798-80ba4e578796@linux.ibm.com>
 <20250424183811.7_MLThpt@linutronix.de>
 <2891b989-6249-4e84-969e-f11af3f92b0b@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2891b989-6249-4e84-969e-f11af3f92b0b@linux.ibm.com>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2025-04-25 16:49:19 [+0530], Shrikanth Hegde wrote:
> On 4/25/25 00:08, Sebastian Andrzej Siewior wrote:
> > On 2025-04-24 21:27:59 [+0530], Shrikanth Hegde wrote:
> > > > > diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> > > > > index 19f4d298d..123539642 100644
> > > > > --- a/arch/powerpc/kvm/book3s_hv.c
> > > > > +++ b/arch/powerpc/kvm/book3s_hv.c
> > > > > @@ -4901,7 +4901,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
> > > > >    	}
> > > > >    	if (need_resched())
> > > > > -		cond_resched();
> > > > > +		schedule();
> > > > 
> > > 
> > > 
> > > > This looks unrelated and odd. I don't why but this should be a
> > > > cond_resched() so it can be optimized away on PREEMPT kernels.
> > > 
> > > This is needed, otherwise KVM on powerVM setup gets stuck on preempt=full/lazy.
> > 
> > But this makes no sense. On preempt=full the cond_resched() gets patched
> > out while schedule() doesn't. Okay, this explains the stuck.
> 
> cond_resched works. What you said is right about schedule and preemption models.
> Initially I had some other code changes and they were causing it get stuck. i retested it.

so it is unrelated then ;)

> But looking at the semantics of usage of xfer_to_guest_mode_work
> I think using schedule is probably right over here.
> Correct me if i got it all wrong.

No, if you do xfer_to_guest_mode_work() then it will invoke schedule()
when appropriate. It just the thing in kvmhv_run_single_vcpu() looks odd
and might have been duct tape or an accident and could probably be
removed.

> on x86:
> kvm_arch_vcpu_ioctl_run
> 	vcpu_run
> 		for () {
> 			.. run guest..
> 			xfer_to_guest_mode_handle_work
> 				schedule
> 		}
> 
> 
> on Powerpc:  ( taking book3s_hv flavour):
> kvm_arch_vcpu_ioctl_run
> kvmppc_vcpu_run_hv  *1
> 	do while() {
> 		kvmhv_run_single_vcpu or kvmppc_run_vcpu
> 			-- checking for need_resched and signals and bails out *2
> 	}
>
> 
> *1 - checks for need resched and signals before entering guest
I don't see the need_resched() check here.

> *2 - checks for need resched and signals while running the guest
> 
> 
> This patch is addressing only *1 but it needs to address *2 as well using generic framework.
> I think it is doable for books3s_hv atleast. (though might need rewrite)
> 
> __kvmppc_vcpu_run is a block box to me yet. I think it first makes sense
> to move it C and then try use the xfer_to_guest_mode_handle_work.
> nick, vaibhav, any idea on __kvmppc_vcpu_run on how is it handling signal pending, and need_resched.
> 
> 
> So this is going to need more work specially on *2 and doing that is also key for preempt=lazy/full to work
> for kvm on powepc. will try to figure out.

Okay.

Sebastian

