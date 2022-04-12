Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA414FD0DE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Apr 2022 08:53:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KcxJd4hKrz3bdN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Apr 2022 16:53:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=j9fzeTPu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KcxJ4042wz2yK7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Apr 2022 16:53:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=j9fzeTPu; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KcxJ31rpNz4xLS;
 Tue, 12 Apr 2022 16:53:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1649746387;
 bh=1ftsgdlM2s1p9Bv3gKBBMIGD+RCglJUtel9pmwSHNAE=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=j9fzeTPuuxvTA0hWNL5trlwbaqRlvtKfaORvA6QsknstPUtFJ6v6PFjZgXmkF0/JG
 aswxL5c0wxB+d8q1ydipEEIav4smabKNFGe4PEfhaBwtduXKfW4oUtG4pMhU48dRnB
 EXcWOPaNl0NzHKbX4oeEf9+f9Ez1X0nM7S8upcIw6qO8EjCADPKEkwfCML8u7iAQ0i
 2uPo7YBhOy9XW5EuuT3Qoi6bIZyK+J2JRMMtFYcMqYV/XZqAd28slJZRlfHpYWsn6l
 UDUml9e5yTEuFd0WnOaxNIPZaMrLIPx7MElC0ydC3KceYEphVaTAZFNd1dgMVwQNs7
 vsYbGyGpLnp8g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: paulmck@kernel.org
Subject: Re: rcu_sched self-detected stall on CPU
In-Reply-To: <20220411030553.GW4285@paulmck-ThinkPad-P17-Gen-1>
References: <CANiq72k+5Rdj7i3Df2dcE6_OPYPXK3z5EWLKnY56sSMz4G3OvA@mail.gmail.com>
 <CAABZP2z64aYWfVSdXHaQopWc+BAbJJUGqtrju2iWER3DDTDFWg@mail.gmail.com>
 <20220406170012.GO4285@paulmck-ThinkPad-P17-Gen-1>
 <87pmls6nt7.fsf@mpe.ellerman.id.au>
 <CAABZP2wVAzybDTjUWxwGG4HmWK7V8rJVVFxpRx-3F9n5oST3+A@mail.gmail.com>
 <20220408140712.GZ4285@paulmck-ThinkPad-P17-Gen-1>
 <CAABZP2zEU8eULq30ZLcUeqxjXuLTKO4b3wm_Jo458Nq_JJ7pEw@mail.gmail.com>
 <871qy56ulk.fsf@mpe.ellerman.id.au>
 <20220411030553.GW4285@paulmck-ThinkPad-P17-Gen-1>
Date: Tue, 12 Apr 2022 16:53:06 +1000
Message-ID: <87mtgq6be5.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: rcu <rcu@vger.kernel.org>, Zhouyi Zhou <zhouzhouyi@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Paul E. McKenney" <paulmck@kernel.org> writes:
> On Sun, Apr 10, 2022 at 09:33:43PM +1000, Michael Ellerman wrote:
>> Zhouyi Zhou <zhouzhouyi@gmail.com> writes:
>> > On Fri, Apr 8, 2022 at 10:07 PM Paul E. McKenney <paulmck@kernel.org> wrote:
>> >> On Fri, Apr 08, 2022 at 06:02:19PM +0800, Zhouyi Zhou wrote:
>> >> > On Fri, Apr 8, 2022 at 3:23 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>> ...
>> >> > > I haven't seen it in my testing. But using Miguel's config I can
>> >> > > reproduce it seemingly on every boot.
>> >> > >
>> >> > > For me it bisects to:
>> >> > >
>> >> > >   35de589cb879 ("powerpc/time: improve decrementer clockevent processing")
>> >> > >
>> >> > > Which seems plausible.
>> >> > I also bisect to 35de589cb879 ("powerpc/time: improve decrementer
>> >> > clockevent processing")
>> ...
>> >>
>> >> > > Reverting that on mainline makes the bug go away.
>> 
>> >> > I also revert that on the mainline, and am currently doing a pressure
>> >> > test (by repeatedly invoking qemu and checking the console.log) on PPC
>> >> > VM in Oregon State University.
>> 
>> > After 306 rounds of stress test on mainline without triggering the bug
>> > (last for 4 hours and 27 minutes), I think the bug is indeed caused by
>> > 35de589cb879 ("powerpc/time: improve decrementer clockevent
>> > processing") and stop the test for now.
>> 
>> Thanks for testing, that's pretty conclusive.
>> 
>> I'm not inclined to actually revert it yet.
>> 
>> We need to understand if there's actually a bug in the patch, or if it's
>> just exposing some existing bug/bad behavior we have. The fact that it
>> only appears with CONFIG_HIGH_RES_TIMERS=n is suspicious.
>> 
>> Do we have some code that inadvertently relies on something enabled by
>> HIGH_RES_TIMERS=y, or do we have a bug that is hidden by HIGH_RES_TIMERS=y ?
>
> For whatever it is worth, moderate rcutorture runs to completion without
> errors with CONFIG_HIGH_RES_TIMERS=n on 64-bit x86.

Thanks for testing that, I don't have any big x86 machines to test on :)

> Also for whatever it is worth, I don't know of anything other than
> microcontrollers or the larger IoT devices that would want their kernels
> built with CONFIG_HIGH_RES_TIMERS=n.  Which might be a failure of
> imagination on my part, but so it goes.

Yeah I agree, like I said before I wasn't even aware you could turn it
off. So I think we'll definitely add a select HIGH_RES_TIMERS in future,
but first I need to work out why we are seeing stalls with it disabled.

cheers
