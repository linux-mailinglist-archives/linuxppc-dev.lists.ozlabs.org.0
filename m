Return-Path: <linuxppc-dev+bounces-2284-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 203C599E9BC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2024 14:26:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XSYHB5Kx1z3bnx;
	Tue, 15 Oct 2024 23:26:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728995174;
	cv=none; b=h/yUtgUP3/rRBQqRvyfs19Acz6zf1IhenyYlWj1zHQUABdxk1K2xuQh/8aV8MvHx4CltwZ5eTXFcCSuhE2flFKcY9KJay9Nskjpksgr9EnJElYdMmkYOJ54IYMzLA/Pe8DOdUaFl6xIZg/7fbUBCj5h08fFUw6sbDq11ggx0VukcXrogcfTh/nccCuA1WYKZ6E8tdkpTP0zJSK8yECq9SEio4ApIwIIXijxvDvFBRlgcUTEfiWNDgHCbiOwWR2sL2CiLXQgf/I0upLSZBysauR0gOr0VzES7hYWpRxe8B/EzjryVBSD4TtzI6KX2bg6cX/We4Bz6O+CfQ4GJWXDbZA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728995174; c=relaxed/relaxed;
	bh=EcDTEARf512YJqUtZUJFtTjK1It0DHuN+lYfzfYdyh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CHc5F43Y6aUe0LhVxzEgbByyiJHgmsXV+omCc1dZSaVkZF+6yywBBscamuweK9WIW1qxAiUzTLQW2Nd1wZpUWkwZTcK6tClWJ6P4f1soDEmoU3Q3wRXGr159aYhn/62vnPAzKvxV2zyr8GYT2NwEfKqDC1Jzev/d5QJnd3BZ0XrL7VCbD/z+0v8NCtq7cPKk0vc8R5iLeSzriVNgEij8ZS4EZcMYbHRnfFvef6iGZ+LEEcS/YsOlbVuw1A+fLM/GzZ3r0OsrdGN16uqAJdIjwL1x4Ja3QoxzyIgZPSf8s73Sw5nstyiHRtcRimT+hZJnh/coMegllrlk1zDa6Lkqtg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=joey.gouly@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=joey.gouly@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XSYH86HLVz3blh
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2024 23:26:10 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E0829DA7;
	Tue, 15 Oct 2024 05:26:07 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 394F43F71E;
	Tue, 15 Oct 2024 05:25:34 -0700 (PDT)
Date: Tue, 15 Oct 2024 13:25:29 +0100
From: Joey Gouly <joey.gouly@arm.com>
To: Will Deacon <will@kernel.org>
Cc: Kevin Brodsky <kevin.brodsky@arm.com>,
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
Message-ID: <20241015122529.GA3820764@e124191.cambridge.arm.com>
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
> 
> We also still need to resolve Kevin's concern, which probably means
> keeping the thread's original POR around someplace.

That was cargo culted (by me) from the rest of the function (apart from TPIDR2
and FPMR). I think Kevin is planning on sending his signal changes still, but
is on holiday, maybe he can remove the last part of the condition as part of
his series.

Thanks,
Joey

