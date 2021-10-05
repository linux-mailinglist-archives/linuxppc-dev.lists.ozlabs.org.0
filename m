Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE55421C40
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 03:56:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNgfl4w6sz305K
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 12:56:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=oI6DgPAm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNgf26M5Rz2yNQ
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 12:55:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=oI6DgPAm; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HNgdx17Hfz4xbX;
 Tue,  5 Oct 2021 12:55:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1633398938;
 bh=gYlu6Qv+8m83iP3aG7acEoyr8D3DPbZlTHZ8jerl4Jw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=oI6DgPAmrS6eid+iQKQamhFupmXA2CScxqKHRX+CJjC8/0fF1BV9+LamvP9D9eSE9
 npjDtMfC1MNcKzde3tkhkeuyG4S9CqgWI+LezmFwIFfQSxbUaY4NuejzURphht7FGp
 ek1oZ95ogFF9mgsmHq93KfvqDA7s9lg+SefS7Uu4jQH2xweVqk/OBZLY5w4Y8cz5FF
 jyvaNEhNFclinElquxf3fKJ2na1IGJxwQje4Hg2exFycrlUGHsDHKTaqoiruy7a9vc
 DhFa9QFOiNLbuIgQmTX/jgFIHs3lgRjeXXAezx290U6sPOlbkpQN1FwNvR9TVFpWGR
 ggckHw/xPBG0Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [RFC PATCH 4/8] powerpc: add CPU field to struct thread_info
In-Reply-To: <202109301045.15DDDA0B@keescook>
References: <20210914121036.3975026-1-ardb@kernel.org>
 <20210914121036.3975026-5-ardb@kernel.org>
 <CAMj1kXEojbQbNzCP39KT4EzFAyW3J1Tfm_stCZ+fGo8_SO90PA@mail.gmail.com>
 <87ee99lii7.fsf@mpe.ellerman.id.au> <87pmst1rn9.fsf@mpe.ellerman.id.au>
 <CAMj1kXFXtbD3=L+QvCnwbyFr-qbWivZ0wRGT0N4LNxANPD8x4g@mail.gmail.com>
 <878rzf0zmb.fsf@mpe.ellerman.id.au> <202109301045.15DDDA0B@keescook>
Date: Tue, 05 Oct 2021 12:55:31 +1100
Message-ID: <87ilycqlpo.fsf@mpe.ellerman.id.au>
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Paul Mackerras <paulus@samba.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>,
 "open list:S390" <linux-s390@vger.kernel.org>,
 Vasily Gorbik <gor@linux.ibm.com>, Russell King <linux@armlinux.org.uk>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 Heiko Carstens <hca@linux.ibm.com>, Keith Packard <keithpac@amazon.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:LINUX FOR POWERPC
 \(32-BIT AND 64-BIT\)" <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Kees Cook <keescook@chromium.org> writes:
> On Thu, Sep 30, 2021 at 08:46:04AM +1000, Michael Ellerman wrote:
>> Ard Biesheuvel <ardb@kernel.org> writes:
>> > On Tue, 28 Sept 2021 at 02:16, Michael Ellerman <mpe@ellerman.id.au> wrote:
>> >>
>> >> Michael Ellerman <mpe@ellerman.id.au> writes:
>> >> > Ard Biesheuvel <ardb@kernel.org> writes:
>> >> >> On Tue, 14 Sept 2021 at 14:11, Ard Biesheuvel <ardb@kernel.org> wrote:
>> >> >>>
>> >> >>> The CPU field will be moved back into thread_info even when
>> >> >>> THREAD_INFO_IN_TASK is enabled, so add it back to powerpc's definition
>> >> >>> of struct thread_info.
>> >> >>>
>> >> >>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>> >> >>
>> >> >> Michael,
>> >> >>
>> >> >> Do you have any objections or issues with this patch or the subsequent
>> >> >> ones cleaning up the task CPU kludge for ppc32? Christophe indicated
>> >> >> that he was happy with it.
>> >> >
>> >> > No objections, it looks good to me, thanks for cleaning up that horror :)
>> >> >
>> >> > It didn't apply cleanly to master so I haven't tested it at all, if you can point me at a
>> >> > git tree with the dependencies I'd be happy to run some tests over it.
>> >>
>> >> Actually I realised I can just drop the last patch.
>> >>
>> >> So that looks fine, passes my standard quick build & boot on qemu tests,
>> >> and builds with/without stack protector enabled.
>> >>
>> >
>> > Thanks.
>> >
>> > Do you have any opinion on how this series should be merged? Kees Cook
>> > is willing to take them via his cross-arch tree, or you could carry
>> > them if you prefer. Taking it via multiple trees at the same time is
>> > going to be tricky, or take two cycles, with I'd prefer to avoid.
>> 
>> I don't really mind. If Kees is happy to take it then that's OK by me.
>> 
>> If Kees put the series in a topic branch based off rc2 then I could
>> merge that, and avoid any conflicts.
>
> I've created:
>
> git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/thread_info/cpu
>
> it includes a --no-ff merge commit, which I'm not sure is desirable? Let
> me know if I should adjust this, or if Linus will yell about this if I
> send him a PR containing a merge commit? I'm not sure what's right here.

It looks good to me.

I don't think Linus will be bothered about that merge. It has useful
information, ie. explains why you're merging it and that arch
maintainers have acked it, and quotes Ard's cover letter.

cheers
