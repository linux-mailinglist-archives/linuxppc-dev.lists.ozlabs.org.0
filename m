Return-Path: <linuxppc-dev+bounces-2861-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 699469BC7EB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2024 09:23:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XjLvL0RCrz2yF0;
	Tue,  5 Nov 2024 19:23:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=63.228.1.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730795005;
	cv=none; b=iml/jb9wp59AJxHlqNwkhOl1oA0lsR3Q/ymtczXLxEleqMFulz/wrRlyuP7R9hVSL5kqW7yC2iDGcoPQcEgLypWY4Ir59uCVFk8NLV80UXPX1bxSiKiF+UAR8TuJEqMwlCb+8q8C85oaekdNjDifP+dsmKlIb0gfAhERL3vEYq+ZMBYTvj6tXS5K3b5cmM40uGjAPgU6uNOiyi0PoiPgCK/jKmgtisFp6FBbWBVqjvW4wzL7vW4J8xz0BDcUx8MT4V3IQk1bsXPpoPg+8E2rvi6Wp6GhzhZg9S7Jw87vu0hOdhIfGz7eazyXpPMDBepObR2qnE2n5EJEq/Z8lHrT3g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730795005; c=relaxed/relaxed;
	bh=IKrYCtHdnVCc7pNRKLdlmgPGSxNMgazJK8CUs7CInw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Mime-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eSMiJs4wKjepBNMK7XU6hCyF5Tf2aZw8XXFVNW2OkJTLaAKy9Hx9b8AMS40fjhW+znVIywzxnqz9eo02NgAtaB2NYj+oTWLcm+pLxs1sQLMicsWm/+F5Q9zBKfIPqK8Yk9whzclOZtxOK3g9yb8RfzCM1vOdrmPIToWLW2mCrh1P21m1pzws+bZ2NiBPnl5exjk8iQo/ZC0wb0KcPx17St7mJJv6EI2fe61kT+tCn8fKhrL7rjXimIb2ljHlFj8MDvZMT8nLhA0olSr/v97CPcAvqyb9Njv/6y12gKxEKpW2epa1GUhneVpHKIZy2hdWf76kBN/tvLRxItJOnlPTpA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XjLvH36M6z2xQ8
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Nov 2024 19:23:22 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 4A58KJ5r012914;
	Tue, 5 Nov 2024 02:20:20 -0600
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 4A58KISZ012909;
	Tue, 5 Nov 2024 02:20:18 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Tue, 5 Nov 2024 02:20:18 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Hari Bathini <hbathini@linux.ibm.com>
Cc: Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
        Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        "Naveen N. Rao" <naveen@kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        linux-trace-kernel@vger.kernel.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] selftests/ftrace: update kprobe syntax error test for ppc64le
Message-ID: <20241105082018.GA29862@gate.crashing.org>
References: <20241101191925.1550493-1-hbathini@linux.ibm.com> <20241101205948.GW29862@gate.crashing.org> <1916cb5c-cb3d-427c-bcf0-2c1b905fd6d1@linux.ibm.com> <20241104094431.GY29862@gate.crashing.org> <245fed6f-5fb4-4925-ba0a-fb2f32e650d0@linux.ibm.com> <20241104103615.GZ29862@gate.crashing.org> <f7e8243a-a4c8-44ce-ad03-7d232df461ed@linux.ibm.com>
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
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f7e8243a-a4c8-44ce-ad03-7d232df461ed@linux.ibm.com>
User-Agent: Mutt/1.4.2.3i
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi!

On Mon, Nov 04, 2024 at 11:06:23PM +0530, Hari Bathini wrote:
> Seems like a bit of misunderstanding there. Function entry here intends
> to mean the actual start of function code (function prologue) - after
> GEP and function profiling sequence (mflr r0; bl mcount).

What you call "function entry" here simply does not exist.  The compiler
can -- and ***WILL***, ***DOES*** -- mix up all of that.  In particular,
"function prologue" does not exist at all (on any architecture worth
its salt, including PowerPC), and all instructions you consider part of
a function prologue might end up anywhere.  The "profiling sequence" is
part of that btw, and that typically ends up *not* the first thing in
the function, not the first thing after the LEP (register saves are
earlier often, they are generated in that order in the first place,
but they can (and will) be moved if that schedules better).

> Function arguments can be accessed with kprobe only while setting a
> probe at an address the kernel treats as function start address.

That is a silly assumption to make.  There is no guarantee you can
access function arguments *at all*, we're not in 1975 anymore.  You
*need* to look at debug information if you want to deal with anything
about your high-level language program.  Looking at the machine code
can only tell you about the machine state, whatever is in registers
etc.

> Note that the test case pass criteria here is setting probe to fail by
> providing an address (sym+offset) beyond the function start address.
> 
> And in this specific test case (with "vfs_read+8", where vfs_read is
> the symbol and '8' is the offset), the test case was failing on powerpc
> because setting the probe at 'sym+8' was succeeding, as anywhere between
> 'sym' to 'sym+16' is treated as function start address on powerpc:

Yeah, fragile tests sometimes break.  Changing a randomly chosen number
to some other randomly chosen number will not fix the problem (but you
can postpone having to deal with it, sure!)


Segher

