Return-Path: <linuxppc-dev+bounces-2282-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3220299E654
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2024 13:41:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XSXHX6SHGz3bnc;
	Tue, 15 Oct 2024 22:41:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728992488;
	cv=none; b=Osnj4N/NfC0CrGxfE2Tvs8BbwCvYPo5WoA9sdnAQoESpcgXrYZWBrHpirEN1LNjRSF/c/WL6SIKwr9dqVeviZ/hw+ii2dCm3WUXWGqAYMY1Hg9/H/HGBb4cQEbUpXTptaKXGsnRBdYpzWbEFh1LuXvzN/QNLOLcaoptq6cW9sQbL41pPej2KGGDY33863gxetvt/B+P13Xc5fazzijMMakqIinUtxTIpKDE446+lpOrcP0YgChORo0oHOEUySJrmFXKdoPuoLDOOsjkbDS2yPod9DaTGWg+5KQYm8+P3yCmIm4uUKh3tviCrfLAKhH1qo3sxQgQxH6Bv05pgNkCN2w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728992488; c=relaxed/relaxed;
	bh=MrJHQArAiuDbpB+jYLmra0DhH1iSL+p/MwXOTL9XyvA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=llWgIu0Z0E1hGqiNd/Il82Aeux417XcBvYh7V0iousY2U4V3VAw+tkY4tLA3VBR+OBIagoMERodgWPS3IPRIp2IxVaN8GRwSIhUnNam0dJvLPSBwh5IbvelVosp+YIt5RSXR0kE79Hx0YEK2Yi54L7wb3WtqqnuOHbBDrctw799r995L2r6wkiFHw8tcTrCK0DvcffMxVkNHxEqwK5DcwEKmWDyzlL/0ngFwJrfl0OALKx35NTOzFAs7YehDDNEcHKjNao4+ENJ0rXp1CC+P5QytdYRARjHxoJ+TIYGUVxhKlzDbZGho4SWNeSSZGu301CeDayBe7tsWQmlbhKh7ig==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BKWuWFQq; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=will@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BKWuWFQq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=will@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XSXHW5xkjz3bkf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2024 22:41:27 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 84EB5A42603;
	Tue, 15 Oct 2024 11:41:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21911C4CECF;
	Tue, 15 Oct 2024 11:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728992485;
	bh=MMLGYJ3ppH3zesWUxVBPsvLY3G0bLj+ulqZ3MXv+H+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BKWuWFQqTVTJynGPE8DqW8n/xI73kLFPuoP5rh/c5kK1CSzjaiF8IYtd8kopRff3K
	 XzdLUQpCs229QH3XbN6uW7uDFcld9GU4lQqyeSLikLmD2AArAbPqViBkORonVwi/F1
	 meo0nTDrGhQM/7o0bBVbjaX75lXFKFGpwWTYxfaZ1Q51KRZgYksDHYD54yqRhojHGr
	 lKXOeOPfylHxDC0UYfMvK4LV2v0EDh5S3knmX5cyQ9SV2mj0M5ieWdUUod7sj74EvF
	 xwI17jNouAEf7oIY/BXMWY8jbY8LGd8gPfdfvjZD8Bwi29mydpctt42T4rNrYJkSng
	 80ZuatKj9mzjg==
Date: Tue, 15 Oct 2024 12:41:16 +0100
From: Will Deacon <will@kernel.org>
To: Joey Gouly <joey.gouly@arm.com>
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
Message-ID: <20241015114116.GA19334@willie-the-truck>
References: <20240822151113.1479789-1-joey.gouly@arm.com>
 <20240822151113.1479789-20-joey.gouly@arm.com>
 <47e1537f-5b60-4541-aed1-a20e804c137d@arm.com>
 <20241009144301.GA12453@willie-the-truck>
 <20241014171023.GA18295@willie-the-truck>
 <20241015095911.GA3777204@e124191.cambridge.arm.com>
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
In-Reply-To: <20241015095911.GA3777204@e124191.cambridge.arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Oct 15, 2024 at 10:59:11AM +0100, Joey Gouly wrote:
> On Mon, Oct 14, 2024 at 06:10:23PM +0100, Will Deacon wrote:
> > Kevin, Joey,
> > 
> > On Wed, Oct 09, 2024 at 03:43:01PM +0100, Will Deacon wrote:
> > > On Tue, Sep 24, 2024 at 01:27:58PM +0200, Kevin Brodsky wrote:
> > > > On 22/08/2024 17:11, Joey Gouly wrote:
> > > > > @@ -1178,6 +1237,9 @@ static void setup_return(struct pt_regs *regs, struct k_sigaction *ka,
> > > > >  		sme_smstop();
> > > > >  	}
> > > > >  
> > > > > +	if (system_supports_poe())
> > > > > +		write_sysreg_s(POR_EL0_INIT, SYS_POR_EL0);
> > > > 
> > > > At the point where setup_return() is called, the signal frame has
> > > > already been written to the user stack. In other words, we write to the
> > > > user stack first, and then reset POR_EL0. This may be problematic,
> > > > especially if we are using the alternate signal stack, which the
> > > > interrupted POR_EL0 may not grant access to. In that situation uaccess
> > > > will fail and we'll end up with a SIGSEGV.
> > > > 
> > > > This issue has already been discussed on the x86 side, and as it happens
> > > > patches to reset PKRU early [1] have just landed. I don't think this is
> > > > a blocker for getting this series landed, but we should try and align
> > > > with x86. If there's no objection, I'm planning to work on a counterpart
> > > > to the x86 series (resetting POR_EL0 early during signal delivery).
> > > 
> > > Did you get a chance to work on that? It would be great to land the
> > > fixes for 6.12, if possible, so that the first kernel release with POE
> > > support doesn't land with known issues.
> > 
> > Looking a little more at this, I think we have quite a weird behaviour
> > on arm64 as it stands. It looks like we rely on the signal frame to hold
> > the original POR_EL0 so, if for some reason we fail to allocate space
> > for the POR context, I think we'll return back from the signal with
> > POR_EL0_INIT. That seems bad?
> 
> If we don't allocate space for POR_EL0, I think the program recieves SIGSGEV?
> 
> setup_sigframe_layout()
>         if (system_supports_poe()) {
>                 err = sigframe_alloc(user, &user->poe_offset,
>                                      sizeof(struct poe_context));
>                 if (err)
>                         return err;
>         }
> 
> Through get_sigframe() and setup_rt_frame(), that eventually hets here:
> 
> handle_signal()
> 	ret = setup_rt_frame(usig, ksig, oldset, regs);
> 
> 	[..]
> 
>         signal_setup_done(ret, ksig, test_thread_flag(TIF_SINGLESTEP));
> 
> void signal_setup_done(int failed, struct ksignal *ksig, int stepping)                                                                                                                         
> {                                                                                                                                                                                              
>         if (failed)                                                                                                                                                                            
>                 force_sigsegv(ksig->sig);                                                                                                                                                      
>         else                                                                                                                                                                                   
>                 signal_delivered(ksig, stepping);                                                                                                                                              
> }  
> 
> So I think it's "fine"?

Ah, yes, sorry about that. I got confused by the conditional push in
setup_sigframe():

	if (system_supports_poe() && err == 0 && user->poe_offset) {
		...

which gives the wrong impression that the POR is somehow optional, even
if the CPU supports POE. So we should drop that check of
'user->poe_offset' as it cannot be NULL here.

We also still need to resolve Kevin's concern, which probably means
keeping the thread's original POR around someplace.

Will

