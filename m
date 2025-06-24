Return-Path: <linuxppc-dev+bounces-9685-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BDAAE71B1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jun 2025 23:49:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bRdrS64rqz2xlK;
	Wed, 25 Jun 2025 07:49:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=63.228.1.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750801752;
	cv=none; b=JhXykLMgxtr3xPXWfaX2QI9TlWvAAcBnGhEcmFiwR1d/fQNuInsEGOAKbYr1iWB/8z8ZG+4/Ypetye3lxoqr7eObfKP3rx47eHHZGxw2zymsRY3G7Zkp31LeDECAWHncwVDXBWH9fPIL/aD9SJ6MCGe8KZCRL21o8VXzqk2/T4y5sVQ2xO8WxhMVZD4dvE5I5eVK+ugWPf/Z0xoLKjcc1igwEg3T5Z8CZ6VP6wKNN0HjzHyvoqE2udRJC1vGYq905EpM7bYB5AR9dr9JBThAVybBLF3UxqMWcgv8JTR41qn5GuqT7wVdsC9XuhOYOcC1082rIOjREuVjtOpQtHm/IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750801752; c=relaxed/relaxed;
	bh=Ddg87swFlzAfacr342BPMSmssxOzhDLpUUC2mPzRwOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Mime-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D1b4L3pzTE3DgsEXaGkdGoabAZZl0v45d/vk+jBZyT8RZeceYXhowbo2YwiOuDY0sYfPqJN116Cq8bAaofma4gk3/tHYqxOAMxG8AF/af/coIv6Wq4WDEksSmHIGghqO5FbovBguOnOlpnYiPyAyynrbNTzcGmQg04qnC1/KinJbPchX0/O8cosX+KWedyXGVEDCXCW8UoF1HxcHwwRY2gFDAkXhYBIfj2w3JLKMz7BL9WOoirAOotJ0QRiMzIQ/AA4BFXIjmIy67YqGrqDdTq+39JhlUXqgCLRhzLhVlbMHxQviI6RWU9i4PPyoAJCLk7qyOvummb8KpJ5u3tsSew==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bRdrN0HTtz2xRq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jun 2025 07:49:04 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 55OLbO3g015495;
	Tue, 24 Jun 2025 16:37:25 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 55OLbDMs015480;
	Tue, 24 Jun 2025 16:37:13 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Tue, 24 Jun 2025 16:37:12 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: David Laight <david.laight.linux@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
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
Message-ID: <20250624213712.GI17294@gate.crashing.org>
References: <cover.1750585239.git.christophe.leroy@csgroup.eu> <20250622172043.3fb0e54c@pumpkin> <ff2662ca-3b86-425b-97f8-3883f1018e83@csgroup.eu> <20250624093258.4906c0e0@pumpkin>
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
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624093258.4906c0e0@pumpkin>
User-Agent: Mutt/1.4.2.3i
X-Spam-Status: No, score=-0.0 required=3.0 tests=SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi!

On Tue, Jun 24, 2025 at 09:32:58AM +0100, David Laight wrote:
> > So GCC uses the 'unlikely' variant of the branch instruction to force 
> > the correct prediction, doesn't it ?
> 
> Nope...
> Most architectures don't have likely/unlikely variants of branches.

In GCC, "likely" means 80%. "Very likely" means 99.95%.  Most things get
something more appropriate than such coarse things predicted.

Most of the time GCC uses these predicted branch probabilities to lay
out code in such a way that the fall-through path is the expected one.

Target backends can do special things with it as well, but usually that
isn't necessary.

There are many different predictors.  GCC usually can predict things
not bad by just looking at the shape of the code, using various
heuristics.  Things like profile-guided optimisation allow to use a
profile from an actual execution to optimise the code such that it will
work faster (assuming that future executions of the code will execute
similarly!)

You also can use __builtin_expect() in the source code, to put coarse
static prediction in.  That is what the kernel "{un,}likely" macros do.

If the compiler knows some branch is not very predictable, it can
optimise the code knowing that.  Like, it could use other strategies
than conditional branches.

On old CPUs something like "this branch is taken 50% of the time" makes
it a totally unpredictable branch.  But if say it branches exactly every
second time, it is 100% predicted correctly by more advanced predictors,
not just 50%.

To properly model modern branch predictors we need to record a "how
predictable is this branch" score as well for every branch, not just a
"how often does it branch instead of falling through" score.  We're not
there yet.


Segher

