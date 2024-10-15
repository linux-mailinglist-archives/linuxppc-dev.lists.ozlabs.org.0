Return-Path: <linuxppc-dev+bounces-2290-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE7399F086
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2024 17:02:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XSckx4LvJz3bpm;
	Wed, 16 Oct 2024 02:02:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729004521;
	cv=none; b=V2RvO9tecebjUivnky2JB+fDnCDZ00babqw7NsRunNJxQRBSXpKrvZiJCabe9/coGSYHBzKQMDB+RGjHX5MYBBWrG8n+s6xKES5mK9cHt2aSZwW8xuGmSVx6+arBoY13MuC/QwBZTnuJXpx4FgL4LSA4RBjXJ/4XWnUPa2szpQUR7G4PnQNjGGSf3ucCTUYlGSr82f5ZqxJe1L7zw4P0x93wJwf8l6KDRuy9zjmXO8hI8ghcyPlD76VSUfXrKz3EDCrAgPIIvbX02OE+ORQGKE/5F3z079UIGgN5pvHMokk41mxXQQs2FP02dQj3B7VjPG1qXN7CaH1QVWYBmC3WzA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729004521; c=relaxed/relaxed;
	bh=iHG/Gbx4wxyz4XiKAHoTWGclnCcTepNBq2ZEGp4DCJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dEOk1AkEhBC5Eg6KuJVT9Wh2Y6giw2WaoHwq/G0VqTBGYdlB5k74Q7d8na9beBU1lwhi+Gx4I9Bgdyc3A95eY12Ug9phrD1WBT+7xU4PSLEUc32Xw9soKr6zPbJBdNCddsyz7/3I93XTBVXePL+L5Z+OZI7JRlwePkZeIREEQvF/rJgAI17PUs7eHFqm56/fo4OzH6XQsMRzbgxzigABt3b1zZHNNHB8R1eyNWzIa53SMBcYvJ+I1Or+/umk+udqOBQ+W8ue243sJ5P03IVzIe12kh9i/DhAmmbINHP1s27WgXDRtw6hYLHhTIP45GrJR0K+W108njsHYHNo+R7XgQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XSckv2XVxz3bpS
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2024 02:01:59 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 45DD8A43252;
	Tue, 15 Oct 2024 15:01:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18141C4CEC6;
	Tue, 15 Oct 2024 15:01:49 +0000 (UTC)
Date: Tue, 15 Oct 2024 16:01:47 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>,
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
Subject: Re: [PATCH v5 19/30] arm64: add POE signal support
Message-ID: <Zw6D2waVyIwYE7wd@arm.com>
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
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Oct 15, 2024 at 12:41:16PM +0100, Will Deacon wrote:
> On Tue, Oct 15, 2024 at 10:59:11AM +0100, Joey Gouly wrote:
> > On Mon, Oct 14, 2024 at 06:10:23PM +0100, Will Deacon wrote:
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

I agree, we should remove this check as it's confusing.

> We also still need to resolve Kevin's concern, which probably means
> keeping the thread's original POR around someplace.

If we fail to allocate context for POR_EL0 (or anything else), we'll
deliver a SIGSEGV. I think it's quite likely that the SIGSEGV will also
fail to allocate context we end up with a fatal SIGSEGV. Not sure the
user can affect the allocation/layout, though it can change stack
attributes where the frame is written.

Assuming that the user tricks the kernel into failing to write the
context but allows it to succeed on the resulting SIGSEGV, POR_EL0
wouldn't have been reset and the SIGSEGV context will still have the
original value. I don't think we need to do anything here for 6.12.

However, in for-next/core, we have gcs_signal_entry() called after
resetting POR_EL0. If this fails, we can end up with a new POR_EL0 on
sigreturn (subject to the above user toggling permissions). I think this
needs to be fixed, POR_EL0 only reset when we know we are going to
deliver the signal.

-- 
Catalin

