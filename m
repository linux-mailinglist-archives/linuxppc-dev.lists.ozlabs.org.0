Return-Path: <linuxppc-dev+bounces-2288-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E39699EDE7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2024 15:40:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XSZwz29XDz3bqM;
	Wed, 16 Oct 2024 00:40:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728999635;
	cv=none; b=VVLVFMOM8j3/ipHgvE3xDH3QEYGUB3gl0qw4Nsc9ZR07aDcbRQwIa8E6OtLvj6iKjeQwN/dr0VI/XBFY4xomy2473RjyYbyJoVi/5ffz9H1uR9kOJadzwG6NU39fK5mqCHTp4rkH4QI3VgJwUFdtNOmbnJEVhUeBxZ4ZdkjSqOLkLTY5deQ4fQL7B2axWUzFH7jPjYnxQuTVohyVmndFF+5L5k+C1XQMocOLInhZS5qmRNEZiPDMGf69iu43/Iko5w0qg8UXHEAG1GtLmtkKSJjVJo03KoMDSgDJE7NTObI/hKu06lf1hWKpiurqI44/LuWmw3NpZcd1ZDuDtr4ugw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728999635; c=relaxed/relaxed;
	bh=hwhgeRMk4jyYgedHBOUOc/6CODzmYlrjcK+trw2k++w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bjtl1ShVGexbo+7y6Z4OSFh96cFEE7wAFfYSWoCJdDlIcR6T5F2jgVwX+VlUZfpub2kGhDnBtfeQjon0X7DG1CUwewV/652YHOqlSC7pjet6dV/kPz1tyIQ5hYap0lXKIjruLFcNR6jsVZs6dPL+bSLdDC80Z1en/8qXYI121D4ONbfAgoU3cIEShw6aL44R8SC6qQlHKcWiKi/lLTTIfLriigC+Tx+FbxZqBz4QRlrecYAWfs6N0yJ8EvZ747/wTSCvnGvvIbBRYUYq/zNPzwqEx3aaCybr5oySw/m7/SUaY5bmMP12XUMT7g1tuso0wAVkSM2S5om7u166gW1ruQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=dave.martin@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=dave.martin@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XSZwx2Ylzz3bnm
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2024 00:40:31 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 911ABFEC;
	Tue, 15 Oct 2024 06:40:28 -0700 (PDT)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C40753F51B;
	Tue, 15 Oct 2024 06:39:54 -0700 (PDT)
Date: Tue, 15 Oct 2024 14:39:49 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Will Deacon <will@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>,
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
Subject: Re: [PATCH v5 19/30] arm64: add POE signal support
Message-ID: <Zw5wpTWgNC+aC+Vk@e133380.arm.com>
References: <20240822151113.1479789-1-joey.gouly@arm.com>
 <20240822151113.1479789-20-joey.gouly@arm.com>
 <47e1537f-5b60-4541-aed1-a20e804c137d@arm.com>
 <20241009144301.GA12453@willie-the-truck>
 <20241014171023.GA18295@willie-the-truck>
 <20241015095911.GA3777204@e124191.cambridge.arm.com>
 <20241015114116.GA19334@willie-the-truck>
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
In-Reply-To: <20241015114116.GA19334@willie-the-truck>
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Oct 15, 2024 at 12:41:16PM +0100, Will Deacon wrote:
> On Tue, Oct 15, 2024 at 10:59:11AM +0100, Joey Gouly wrote:
> > On Mon, Oct 14, 2024 at 06:10:23PM +0100, Will Deacon wrote:
> > > Kevin, Joey,
> > > 
> > > On Wed, Oct 09, 2024 at 03:43:01PM +0100, Will Deacon wrote:
> > > > On Tue, Sep 24, 2024 at 01:27:58PM +0200, Kevin Brodsky wrote:
> > > > > On 22/08/2024 17:11, Joey Gouly wrote:
> > > > > > @@ -1178,6 +1237,9 @@ static void setup_return(struct pt_regs *regs, struct k_sigaction *ka,
> > > > > >  		sme_smstop();
> > > > > >  	}
> > > > > >  
> > > > > > +	if (system_supports_poe())
> > > > > > +		write_sysreg_s(POR_EL0_INIT, SYS_POR_EL0);
> > > > > 
> > > > > At the point where setup_return() is called, the signal frame has
> > > > > already been written to the user stack. In other words, we write to the
> > > > > user stack first, and then reset POR_EL0. This may be problematic,
> > > > > especially if we are using the alternate signal stack, which the
> > > > > interrupted POR_EL0 may not grant access to. In that situation uaccess
> > > > > will fail and we'll end up with a SIGSEGV.
> > > > > 
> > > > > This issue has already been discussed on the x86 side, and as it happens
> > > > > patches to reset PKRU early [1] have just landed. I don't think this is
> > > > > a blocker for getting this series landed, but we should try and align
> > > > > with x86. If there's no objection, I'm planning to work on a counterpart
> > > > > to the x86 series (resetting POR_EL0 early during signal delivery).
> > > > 
> > > > Did you get a chance to work on that? It would be great to land the
> > > > fixes for 6.12, if possible, so that the first kernel release with POE
> > > > support doesn't land with known issues.
> > > 
> > > Looking a little more at this, I think we have quite a weird behaviour
> > > on arm64 as it stands. It looks like we rely on the signal frame to hold
> > > the original POR_EL0 so, if for some reason we fail to allocate space
> > > for the POR context, I think we'll return back from the signal with
> > > POR_EL0_INIT. That seems bad?
> > 
> > If we don't allocate space for POR_EL0, I think the program recieves SIGSGEV?
> > 
> > setup_sigframe_layout()
> >         if (system_supports_poe()) {
> >                 err = sigframe_alloc(user, &user->poe_offset,
> >                                      sizeof(struct poe_context));
> >                 if (err)
> >                         return err;
> >         }
> > 
> > Through get_sigframe() and setup_rt_frame(), that eventually hets here:
> > 
> > handle_signal()
> > 	ret = setup_rt_frame(usig, ksig, oldset, regs);
> > 
> > 	[..]
> > 
> >         signal_setup_done(ret, ksig, test_thread_flag(TIF_SINGLESTEP));
> > 
> > void signal_setup_done(int failed, struct ksignal *ksig, int stepping)                                                                                                                         
> > {                                                                                                                                                                                              
> >         if (failed)                                                                                                                                                                            
> >                 force_sigsegv(ksig->sig);                                                                                                                                                      
> >         else                                                                                                                                                                                   
> >                 signal_delivered(ksig, stepping);                                                                                                                                              
> > }  
> > 
> > So I think it's "fine"?
> 
> Ah, yes, sorry about that. I got confused by the conditional push in
> setup_sigframe():
> 
> 	if (system_supports_poe() && err == 0 && user->poe_offset) {
> 		...
> 
> which gives the wrong impression that the POR is somehow optional, even
> if the CPU supports POE. So we should drop that check of
> 'user->poe_offset' as it cannot be NULL here.

From memory and a quick glance at the code:

For other "conditionally unconditional" things, we don't have a
corresponding check on user->foo.

For conditional stuff, non-NULLness of user->foo is used to track
whether we decided to dump the corresponding record; for consistency
here, if we have system_supports_poe() && err == 0, then that's
sufficient (though in prior versions of this code, POR_EL0 dumping was
conditional and so the extra check did do something...)


In any case, if some allocation fails then we splat out with a SIGSEGV
before modifying the user task state to deliver the signal (in
setup_return() etc.)

If The user's POR_EL0 value is being clobbered before we get here, we
would save the wrong value -- so the code would be broken anyway.


So, as Joey says, this is probably fine, but the user->poe_offset check
looks superfluous.  The kernel will splat on us here and kill the thread
if it's NULL anyway.

[...]

Cheers
---Dave

