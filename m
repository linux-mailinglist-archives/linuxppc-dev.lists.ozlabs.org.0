Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BE049FDCC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jan 2022 17:16:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JljJB37Kdz3cQ3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jan 2022 03:16:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=u7segef+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=srs0=m9wh=sm=paulmck-thinkpad-p17-gen-1.home=paulmck@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=u7segef+; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JljHY12Xkz2yP9
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jan 2022 03:15:52 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 23D58B80D74;
 Fri, 28 Jan 2022 16:15:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECC36C340E0;
 Fri, 28 Jan 2022 16:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643386548;
 bh=cDuSg+CrlslaXesh3qz8z39IshhsZtN6MoZi6F8K0xk=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=u7segef+gdncKpEQohgwHgIhGqvbnUFBifeTtUFV4ZygoDyYKVuVBB1xLa+u8dghY
 JG0few1oVaOtJlHk7++1ERnoM2DnjGmZy5yLLSfxuzjz9jSkNgVHAREodlMIrZhyMj
 40yI84Andy6qnYfiG5JNiMiz6b0sHAh5LvOXxBwUQIQDmDbQMqoxyjZpH2V8hf6Ehe
 +h6YsLxwxK/F5wGMPFPJwEeWxnio35tF2EGaSPJHnDpjdqiD1L6MVFfvKh6AanrVvB
 3w/AvnGsjDRCfsUW+dtDJAgXaPEtwzJrQDxAFFU0RHDxSG/Bvu8zexVuydM6m7I2Qz
 8RODnJbK9Cq/A==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
 id A19145C098D; Fri, 28 Jan 2022 08:15:47 -0800 (PST)
Date: Fri, 28 Jan 2022 08:15:47 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Subject: Re: ftrace hangs waiting for rcu
Message-ID: <20220128161547.GL4285@paulmck-ThinkPad-P17-Gen-1>
References: <20220127114249.03b1b52b@gandalf.local.home>
 <YfLjIOlGfFmbh1Zv@FVFF77S0Q05N> <yt9dy231yq90.fsf_-_@linux.ibm.com>
 <YfQCohKWJg9H+uID@FVFF77S0Q05N> <yt9dee4rn8q7.fsf@linux.ibm.com>
 <YfQVzba5thVs+qap@FVFF77S0Q05N>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YfQVzba5thVs+qap@FVFF77S0Q05N>
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
Reply-To: paulmck@kernel.org
Cc: linux-s390@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 hca@linux.ibm.com, LKML <linux-kernel@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Ard Biesheuvel <ardb@kernel.org>,
 Sven Schnelle <svens@linux.ibm.com>, Sachin Sant <sachinp@linux.ibm.com>,
 Russell King <linux@armlinux.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>, Yinan Liu <yinan@linux.alibaba.com>,
 linuxppc-dev@lists.ozlabs.org, Ingo Molnar <mingo@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jan 28, 2022 at 04:11:57PM +0000, Mark Rutland wrote:
> On Fri, Jan 28, 2022 at 05:08:48PM +0100, Sven Schnelle wrote:
> > Hi Mark,
> > 
> > Mark Rutland <mark.rutland@arm.com> writes:
> > 
> > > On arm64 I bisected this down to:
> > >
> > >   7a30871b6a27de1a ("rcu-tasks: Introduce ->percpu_enqueue_shift for dynamic queue selection")
> > >
> > > Which was going wrong because ilog2() rounds down, and so the shift was wrong
> > > for any nr_cpus that was not a power-of-two. Paul had already fixed that in
> > > rcu-next, and just sent a pull request to Linus:
> > >
> > >   https://lore.kernel.org/lkml/20220128143251.GA2398275@paulmck-ThinkPad-P17-Gen-1/
> > >
> > > With that applied, I no longer see these hangs.
> > >
> > > Does your s390 test machine have a non-power-of-two nr_cpus, and does that fix
> > > the issue for you?
> > 
> > We noticed the PR from Paul and are currently testing the fix. So far
> > it's looking good. The configuration where we have seen the hang is a
> > bit unusual:
> > 
> > - 16 physical CPUs on the kvm host
> > - 248 logical CPUs inside kvm
> 
> Aha! 248 is notably *NOT* a power of two, and in this case the shift would be
> wrong (ilog2() would give 7, when we need a shift of 8).
> 
> So I suspect you're hitting the same issue as I was.

And apparently no one runs -next on systems having a non-power-of-two
number of CPUs.  ;-)

							Thanx, Paul

> Thanks,
> Mark.
> 
> > - debug kernel both on the host and kvm guest
> > 
> > So things are likely a bit slow in the kvm guest. Interesting is that
> > the number of CPUs is even. But maybe RCU sees an odd number of CPUs
> > and gets confused before all cpus are brought up. Have to read code/test
> > to see whether that could be possible.
> > 
> > Thanks for investigating!
> > Sven
