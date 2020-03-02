Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8AE1758B7
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Mar 2020 11:54:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48WH8M6ClDzDqTY
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Mar 2020 21:54:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48WH5L4G9szDqHY
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Mar 2020 21:51:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=WRPVw0MY; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48WH5J5J6mz9sSb;
 Mon,  2 Mar 2020 21:51:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1583146309;
 bh=b16uewG1Ij2M7fZzm8YX4KBgHz05Ojayzf65tUSrteo=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=WRPVw0MYXwNvewO+4MvrFWaQWlL9dS4BusnrqtmZQRlGB+6kh6XdQbJ/NkeAkZ62e
 rlG+sfqNrJSwQZkKVb1KYy++Hwq3hKemJCshjrf8Ul5gYnrEvmiUMs9rYyRGr4zZMO
 QYD1e9yH1usGu4q46IOfyy79zR4/gTgA/r7v70iHo0En1K88RvIPnU7aEw/XfgBxCC
 yTIV7VGmeV35zMHdeCXfeOCtivsGQeFeUJxLuVxvoQzZY9HqbT+f46YCgXrabWIDX/
 ObdNVmIgrcAwBbyKsB4NpkWSMMnJzuTnrqCohNz/LkiwWjnmvAN98GsRzO/41qd6rl
 t+SkcBlfdgzHA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [GIT PULL] Second batch of KVM changes for Linux 5.6-rc4 (or rc5)
In-Reply-To: <CAHk-=wiin_LkqP2Cm5iPc5snUXYqZVoMFawZ-rjhZnawven8SA@mail.gmail.com>
References: <1583089390-36084-1-git-send-email-pbonzini@redhat.com>
 <CAHk-=wiin_LkqP2Cm5iPc5snUXYqZVoMFawZ-rjhZnawven8SA@mail.gmail.com>
Date: Mon, 02 Mar 2020 21:51:44 +1100
Message-ID: <87pndvrpvj.fsf@mpe.ellerman.id.au>
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
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 KVM list <kvm@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Linus Torvalds <torvalds@linux-foundation.org> writes:
> On Sun, Mar 1, 2020 at 1:03 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>>
>> Paolo Bonzini (4):
>>       KVM: allow disabling -Werror
>
> Honestly, this is just badly done.
>
> You've basically made it enable -Werror only for very random
> configurations - and apparently the one you test.
>
> Doing things like COMPILE_TEST disables it, but so does not having
> EXPERT enabled.
>
> So it looks entirely ad-hoc and makes very little sense. At least the
> "with KASAN, disable this" part makes sense, since that's a known
> source or warnings. But everything else looks very random.
>
> I've merged this, but I wonder why you couldn't just do what I
> suggested originally?
>
> Seriously, if you script your build tests, and don't even look at the
> results, then you might as well use
>
>    make KCFLAGS=-Werror
>
> instead of having this kind of completely random option that has
> almost no logic to it at all.
>
> And if you depend entirely on random build infrastructure like the
> 0day bot etc, this likely _is_ going to break when it starts using a
> new gcc version, or when it starts testing using clang, or whatever.
> So then we end up with another odd random situation where now kvm (and
> only kvm) will fail those builds just because they are automated.
>
> Yes, as I said in that original thread, I'd love to do -Werror in
> general, at which point it wouldn't be some random ad-hoc kvm special
> case for some random option. But the "now it causes problems for
> random compiler versions" is a real issue again - but at least it
> wouldn't be a random kernel subsystem that happens to trigger it, it
> would be a _generic_ issue, and we'd have everybody involved when a
> compiler change introduces a new warning.
>
> I've pulled this for now, but I really think it's a horrible hack, and
> it's just done entirely wrong.
>
> Adding the powerpc people, since they have more history with their
> somewhat less hacky one. Except that one automatically gets disabled
> by "make allmodconfig" and friends, which is also kind of pointless.
>
> Michael, what tends to be the triggers for people using
> PPC_DISABLE_WERROR? Do you have reports for it?

My memory is that we have had very few reports of it actually causing
problems. But I don't have hard data to back that up.

It has tripped up the Clang folks, but that's partly because they're
building clang HEAD, and also because ~zero powerpc kernel developers
are building regularly with clang. I'm trying to fix the latter ...


The thing that makes me disable -Werror (enable PPC_DISABLE_WERROR) most
often is bisecting back to before fixes for my current compiler were
merged.

For example with GCC 8 if you go back before ~4.18 you hit the warning
fixed by bee20031772a ("disable -Wattribute-alias warning for
SYSCALL_DEFINEx()").

And then building with GCC head sometimes requires disabling -Werror
because of some new warning, sometimes valid sometimes not.

I think we could mostly avoid those problems by having the option only
on by default for known compiler versions.

eg:

config WERROR
	bool "Build with -Werror"
	default CC_IS_GCC && (GCC_VERSION >= 70000 && GCC_VERSION <= 90000)

And we could bump the upper version up once each new GCC version has had
any problems ironed out.

> Could we have a _generic_ option that just gets enabled by default,
> except it gets disabled by _known_ issues (like KASAN).

Right now I don't think we could have a generic option that's enabled by
default, there's too many warnings floating around on minor arches and
in odd configurations.

But we could have a generic option that signifies the desire to build
with -Werror where possible, and then each arch/subsystem/etc could use
that config option to enable -Werror in stages.

Then after a release or three we could change the option to globally
enable -Werror and opt-out any areas that are still problematic.

It's also possible to use -Wno-error to turn certain warnings back into
warnings even when -Werror is set, so that's another way we could
incrementally attack the problem.


It'd also be nice if we could do:

 $ make WERROR=0

Or something similarly obvious to turn off the WERROR option. That way
users don't even have to edit their .config manually, they just rerun
make with WERROR=0 and it works.


> Being disabled for "make allmodconfig" is kind of against one of the
> _points_ of "the build should be warning-free".

True, it was just the conservative choice to disable it for allmod/yes.
We should probably revisit that these days.

cheers
