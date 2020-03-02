Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 91326175A3F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Mar 2020 13:17:43 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48WK0N6Z9LzDqXS
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Mar 2020 23:17:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48WJxV12r6zDqTq
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Mar 2020 23:15:09 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 022CEvNK020865;
 Mon, 2 Mar 2020 06:14:58 -0600
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 022CEtSw020859;
 Mon, 2 Mar 2020 06:14:55 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Mon, 2 Mar 2020 06:14:55 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [GIT PULL] Second batch of KVM changes for Linux 5.6-rc4 (or rc5)
Message-ID: <20200302121455.GH22482@gate.crashing.org>
References: <1583089390-36084-1-git-send-email-pbonzini@redhat.com>
 <CAHk-=wiin_LkqP2Cm5iPc5snUXYqZVoMFawZ-rjhZnawven8SA@mail.gmail.com>
 <87pndvrpvj.fsf@mpe.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87pndvrpvj.fsf@mpe.ellerman.id.au>
User-Agent: Mutt/1.4.2.3i
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
Cc: KVM list <kvm@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 02, 2020 at 09:51:44PM +1100, Michael Ellerman wrote:
> Linus Torvalds <torvalds@linux-foundation.org> writes:
> > Michael, what tends to be the triggers for people using
> > PPC_DISABLE_WERROR? Do you have reports for it?
> 
> My memory is that we have had very few reports of it actually causing
> problems. But I don't have hard data to back that up.

I build all archs with GCC trunk.

It always breaks for me, with thousands of errors, which is why since
many years I carry 21 lines of patch to thoroughly disable -Werror for
the powerpc arch.  It takes over a year from when a warning is added to
the kernel taking care of it -- and of course, I build with the current
development version of the compiler, so I get to see many misfiring
warnings and other fallout as well.  (Currently there are more than 100
warnings, this is way too many to consider attacking that as well).

> It has tripped up the Clang folks, but that's partly because they're
> building clang HEAD, and also because ~zero powerpc kernel developers
> are building regularly with clang. I'm trying to fix the latter ...

Is anyone building regularly with GCC HEAD?  Power or any other arch?

> And then building with GCC head sometimes requires disabling -Werror
> because of some new warning, sometimes valid sometimes not.

Yes.  And never worth breaking the build for.

-Werror is something you use if you do not trust your developers.

Warnings are not errors.  The compiler warns for things that
heuristically look suspicious.  And it errors for things that are wrong.

Some warnings have many false positives, but are so useful (find many
nasty problems, for example) that it is worth enabling them often.
-Werror sabotages that, giving people an extra incentive to disable
useful warnings.

> I think we could mostly avoid those problems by having the option only
> on by default for known compiler versions.

Well, the kernel disables most useful warnings anyway, so that might
even work, sure.

> It'd also be nice if we could do:
> 
>  $ make WERROR=0
> 
> Or something similarly obvious to turn off the WERROR option. That way
> users don't even have to edit their .config manually, they just rerun
> make with WERROR=0 and it works.

That would be nice, yes, that would help my situation as well.


Segher
