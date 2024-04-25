Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 573A18B202B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Apr 2024 13:28:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mRKJ93uq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VQD9z04s4z3vYy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Apr 2024 21:28:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mRKJ93uq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VQD9F5fk3z3dDh
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Apr 2024 21:27:29 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 75A0BCE19F8;
	Thu, 25 Apr 2024 11:27:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 872C5C113CC;
	Thu, 25 Apr 2024 11:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714044445;
	bh=/xag3OkcGEyfkLOWbreP2qxcC/ujNSwQZVNR+WIcJbw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mRKJ93uqcY3f24wDK0kXzBjcPBV39G7QObjuc4CmkQfRv5R+mMpJ1b6/J6H5u2HIm
	 t3h5+32yZNa9AnoOJhEsPXOxE743fBO/ZLvaD3SlDtF8Xs+uMfOxHE4vQafUCmrTeS
	 RauCHvdPX8zvNEuF1uoAtnZsVbEL6F3JQU4ITMpZeHMVpsbaStweISAUZ6NSPwqYK1
	 Bznvw3m7I67nKaMSLncnqLg+qkh3IpEMtvfeKnmZfr3+eXQJE4Y4h22qAAkj/prqE7
	 l7Z0jthgvYfF/3lWJ+ZN1Mj9l+O5eeFJL9TnW2NlZSe49x5nzyjc40EKQCg+px2KUW
	 1T6j/jrkd3wfw==
Date: Thu, 25 Apr 2024 16:47:58 +0530
From: Naveen N Rao <naveen@kernel.org>
To: Gautam Menghani <gautam@linux.ibm.com>
Subject: Re: [PATCH v5 RESEND] arch/powerpc/kvm: Add support for reading VPA
 counters for pseries guests
Message-ID: <ne4jzv6dyremumuulw6c5zcwgncz5igsesfmlazg4jxmkaz3te@jpqv3qfo7jlb>
References: <20240402070656.28441-1-gautam@linux.ibm.com>
 <aauzmvtbpgxbr4aa3s4k33cdi7fljs5q4ifn5x2swncz7dtvam@gclohylavkpl>
 <ualscagnpj54rvn33ncaznp7ibvvqulhrmq46qsg73wokgswxy@naopf7leuk66>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ualscagnpj54rvn33ncaznp7ibvvqulhrmq46qsg73wokgswxy@naopf7leuk66>
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, npiggin@gmail.com, aneesh.kumar@kernel.org, Vaibhav Jain <vaibhav@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 24, 2024 at 11:08:38AM +0530, Gautam Menghani wrote:
> On Mon, Apr 22, 2024 at 09:15:02PM +0530, Naveen N Rao wrote:
> > On Tue, Apr 02, 2024 at 12:36:54PM +0530, Gautam Menghani wrote:
> > >  static int kvmhv_vcpu_entry_nestedv2(struct kvm_vcpu *vcpu, u64 
> > >  time_limit,
> > >  				     unsigned long lpcr, u64 *tb)
> > >  {
> > > @@ -4130,6 +4161,11 @@ static int kvmhv_vcpu_entry_nestedv2(struct kvm_vcpu *vcpu, u64 time_limit,
> > >  	kvmppc_gse_put_u64(io->vcpu_run_input, KVMPPC_GSID_LPCR, lpcr);
> > >  
> > >  	accumulate_time(vcpu, &vcpu->arch.in_guest);
> > > +
> > > +	/* Enable the guest host context switch time tracking */
> > > +	if (unlikely(trace_kvmppc_vcpu_exit_cs_time_enabled()))
> > > +		kvmhv_set_l2_accumul(1);
> > > +
> > >  	rc = plpar_guest_run_vcpu(0, vcpu->kvm->arch.lpid, vcpu->vcpu_id,
> > >  				  &trap, &i);
> > >  
> > > @@ -4156,6 +4192,10 @@ static int kvmhv_vcpu_entry_nestedv2(struct kvm_vcpu *vcpu, u64 time_limit,
> > >  
> > >  	timer_rearm_host_dec(*tb);
> > >  
> > > +	/* Record context switch and guest_run_time data */
> > > +	if (kvmhv_get_l2_accumul())
> > > +		do_trace_nested_cs_time(vcpu);
> > > +
> > >  	return trap;
> > >  }
> > 
> > I'm assuming the counters in VPA are cumulative, since you are zero'ing 
> > them out on exit. If so, I think a better way to implement this is to 
> > use TRACE_EVENT_FN() and provide tracepoint registration and 
> > unregistration functions. You can then enable the counters once during 
> > registration and avoid repeated writes to the VPA area. With that, you 
> > also won't need to do anything before vcpu entry. If you maintain 
> > previous values, you can calculate the delta and emit the trace on vcpu 
> > exit. The values in VPA area can then serve as the cumulative values.
> > 
> 
> This approach will have a problem. The context switch times are reported
> in the L1 LPAR's CPU's VPA area. Consider the following scenario:
> 
> 1. L1 has 2 cpus, and L2 has 1 cpu
> 2. L2 runs on L1's cpu0 for a few seconds, and the counter values go to
> 1 million
> 3. We are maintaining a copy of values of VPA in separate variables, so
> those variables also have 1 million.
> 4. Now if L2's vcpu is migrated to another L1 cpu, that L1 cpu's VPA
> counters will start from 0, so if we try to get delta value, we will end
> up doing 0 - 1 million, which would be wrong.

I'm assuming you mean migrating the task. If we maintain the previous 
readings in paca, it should work I think.

> 
> The aggregation logic in this patch works as we zero out the VPA after
> every switch, and maintain aggregation in a vcpu->arch

Are the cumulative values of the VPA counters of no significance? We 
lose those with this approach. Not sure if we care.


- Naveen

