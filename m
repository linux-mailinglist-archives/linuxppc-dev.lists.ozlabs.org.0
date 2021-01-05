Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 261672EABE8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Jan 2021 14:28:46 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D9Cxd121RzDqZN
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jan 2021 00:28:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=will@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=h6CBueej; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D9CvD3sBJzDqXg
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Jan 2021 00:26:31 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F2194225AC;
 Tue,  5 Jan 2021 13:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609853189;
 bh=TmYNnmKpWB2t2Q9JsIHgrp8V/YLclj6QFBBv76JxcGI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h6CBueejxaIU+YgJTNSnl5xkqm0WnsJZ3JQodk76eUGNSvSvFWbgqtFlerBNe46O7
 KCfs6qTXHvoxl+KgOgnyYCRImBCjtoRl0Sv9bjlNM7osRSXL5kzyWRuDlBkuA2sEY2
 QXO+02ZXf0Vjg2WEgjj4nZeO5cWIkYARBS9IHsx3rT4etAm5hg7/iHbpBjw4rbhuhK
 qIJDgYPl94MPe9+jLH00xJ+fEhNuG22bB4+WGxTTh4ZRaynB+XUSxJRtTlY+EJebkh
 /xRJUMzBCY5wKF+Ee1YMNjFs4ud+Tv7pSwnGv6QdEHPG7ED4APzW6rwyo2ugYIjNbk
 qXL4nmbqdI1PQ==
Date: Tue, 5 Jan 2021 13:26:23 +0000
From: Will Deacon <will@kernel.org>
To: Andy Lutomirski <luto@kernel.org>
Subject: Re: [RFC please help] membarrier: Rewrite sync_core_before_usermode()
Message-ID: <20210105132623.GB11108@willie-the-truck>
References: <bf59ecb5487171a852bcc8cdd553ec797aedc485.1609093476.git.luto@kernel.org>
 <1609199804.yrsu9vagzk.astroid@bobo.none>
 <CALCETrX4v1KEf6ikVtFg6juh3Z_esJ-+6PLT1A21JJeTVh2k8g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALCETrX4v1KEf6ikVtFg6juh3Z_esJ-+6PLT1A21JJeTVh2k8g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Arnd Bergmann <arnd@arndb.de>, X86 ML <x86@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Paul Mackerras <paulus@samba.org>,
 stable <stable@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Andy,

Sorry for the slow reply, I was socially distanced from my keyboard.

On Mon, Dec 28, 2020 at 04:36:11PM -0800, Andy Lutomirski wrote:
> On Mon, Dec 28, 2020 at 4:11 PM Nicholas Piggin <npiggin@gmail.com> wrote:
> > > +static inline void membarrier_sync_core_before_usermode(void)
> > > +{
> > > +     /*
> > > +      * XXX: I know basically nothing about powerpc cache management.
> > > +      * Is this correct?
> > > +      */
> > > +     isync();
> >
> > This is not about memory ordering or cache management, it's about
> > pipeline management. Powerpc's return to user mode serializes the
> > CPU (aka the hardware thread, _not_ the core; another wrongness of
> > the name, but AFAIKS the HW thread is what is required for
> > membarrier). So this is wrong, powerpc needs nothing here.
> 
> Fair enough.  I'm happy to defer to you on the powerpc details.  In
> any case, this just illustrates that we need feedback from a person
> who knows more about ARM64 than I do.

I think we're in a very similar boat to PowerPC, fwiw. Roughly speaking:

  1. SYNC_CORE does _not_ perform any cache management; that is the
     responsibility of userspace, either by executing the relevant
     maintenance instructions (arm64) or a system call (arm32). Crucially,
     the hardware will ensure that this cache maintenance is broadcast
     to all other CPUs.

  2. Even with all the cache maintenance in the world, a CPU could have
     speculatively fetched stale instructions into its "pipeline" ahead of
     time, and these are _not_ flushed by the broadcast maintenance instructions
     in (1). SYNC_CORE provides a means for userspace to discard these stale
     instructions.

  3. The context synchronization event on exception entry/exit is
     sufficient here. The Arm ARM isn't very good at describing what it
     does, because it's in denial about the existence of a pipeline, but
     it does have snippets such as:

	(s/PE/CPU/)
       | For all types of memory:
       | The PE might have fetched the instructions from memory at any time
       | since the last Context synchronization event on that PE.

     Interestingly, the architecture recently added a control bit to remove
     this synchronisation from exception return, so if we set that then we'd
     have a problem with SYNC_CORE and adding an ISB would be necessary (and
     we could probable then make kernel->kernel returns cheaper, but I
     suspect we're relying on this implicit synchronisation in other places
     too).

Are you seeing a problem in practice, or did this come up while trying to
decipher the semantics of SYNC_CORE?

Will
