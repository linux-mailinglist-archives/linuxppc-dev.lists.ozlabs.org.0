Return-Path: <linuxppc-dev+bounces-10122-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 36219AF9FDC
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Jul 2025 13:44:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bZ7vC4237z2y06;
	Sat,  5 Jul 2025 21:44:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=63.228.1.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751715847;
	cv=none; b=Uzi8BkJP5gsDLnlKpn3iZtBvZ/Hfi4KD9rY0i12dU7rEyDSPyJ1kxvxhX9cbofPxTJzN53vFf2lQpqKzWG6XV+q/g4mwB3BxXOYJK+WrC73dEAnKkVGOirhBxM0RI/cCzvW3XfPWxZlA6sf/9Jow3yl+3tDHX7pL2OnkjsIOjshG8xe4EEMEIbf+xkRcwksvxF5Ilk7fFzMqsmihJxiz9XSpbKJ2YpLNm9tPBrdqG8rrwr51jzTCd3o6NkAKk4c1Mk6b8LqSUnPvG+R1Pp023ngtpKhtAN4WAgqkrP407LQFiy4UamqyMPReJTCtDZIpVMVPesy2dX4F9TY4GvYLqA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751715847; c=relaxed/relaxed;
	bh=IvOQa11YbBFj7yBOidHoEYVqbRCUb5Oj+6ppKy7JZX8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OeTGeU5VRaBTQ2E0xFA9P2r5ffqkLMLVWEeztBeI5uRwj2kHoIur8CBcQcDT/VTWh0dfeU8AMjF295L+IdtobqbKcaJiuF8UIz5VtB0g5OKzn/vmfw3c3THFl2nXGLMIKCo1r1PfbyZYSTBPN2JhmzTkOAql1NEShs56MolsOOxoSlv/6yRMvuKjE2Ct++ZqGx7ZWQQvJCWC/kaSEWZyuDNnr5BSDSEsR51tcTLrWJLMku4wO3fuVkQ44xE0TeIQCL0Bs/raN0LAZIs5L0WOTgRCf+FZkz/kVPFLKXAsWiDH9rVkzG0z4sMNNl9yH+SuMEcfFt4u2l12YlMnfYqbfQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bZ7vB0X13z2xlL
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Jul 2025 21:44:04 +1000 (AEST)
Received: from gate.crashing.org (localhost [127.0.0.1])
	by gate.crashing.org (8.18.1/8.18.1/Debian-2) with ESMTP id 565BgrOk149573;
	Sat, 5 Jul 2025 06:42:53 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.18.1/8.18.1/Submit) id 565BgnHF149569;
	Sat, 5 Jul 2025 06:42:49 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Sat, 5 Jul 2025 06:42:49 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: David Laight <david.laight.linux@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Darren Hart <dvhart@infradead.org>,
        Davidlohr Bueso <dave@stgolabs.net>,
        Andre Almeida <andrealmeid@igalia.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-fsdevel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 0/5] powerpc: Implement masked user access
Message-ID: <aGkPubjld7r6v2vm@gate>
References: <cover.1750585239.git.christophe.leroy@csgroup.eu>
 <20250622172043.3fb0e54c@pumpkin>
 <ff2662ca-3b86-425b-97f8-3883f1018e83@csgroup.eu>
 <20250624131714.GG17294@gate.crashing.org>
 <20250624175001.148a768f@pumpkin>
 <20250624182505.GH17294@gate.crashing.org>
 <20250624220816.078f960d@pumpkin>
 <83fb5685-a206-477c-bff3-03e0ebf4c40c@csgroup.eu>
 <20250626220148.GR17294@gate.crashing.org>
 <3e9bff9f-1aaf-4e91-a6c0-328a343d18f1@csgroup.eu>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3e9bff9f-1aaf-4e91-a6c0-328a343d18f1@csgroup.eu>
X-Spam-Status: No, score=-0.0 required=3.0 tests=SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi!

On Sat, Jul 05, 2025 at 12:55:06PM +0200, Christophe Leroy wrote:
> > > For book3s64, GCC only use isel with -mcpu=power9 or -mcpu=power10
> > 
> > I have no idea what "book3s64" means.
> 
> Well that's the name given in Linux kernel to the 64 bits power CPU
> processors.

A fantasy name.  Great.

> > What is "powerpc/32"?  It does not help if you use different names from
> > what everyone else does.
> 
> Again, that's the way it is called in Linux kernel, refer below commits
> subjects:

And another.

> It means everything built with CONFIG_PPC32

Similar names for very dissimilar concepts, even!  Woohoo!

> > > For powerpc/64 we have less constraint than on powerpc32:
> > > - Kernel memory starts at 0xc000000000000000
> > > - User memory stops at 0x0010000000000000
> > 
> > That isn't true, not even if you mean some existing name.  Usually
> > userspace code is mapped at 256MB (0x10000000).  On powerpc64-linux
> > anyway, different default on different ABIs of course :-)
> 
> 0x10000000 is below 0x0010000000000000, isn't it ? So why isn't it true ?

I understood "starts at".  I read cross-eyed maybe, hehe.


Segher

