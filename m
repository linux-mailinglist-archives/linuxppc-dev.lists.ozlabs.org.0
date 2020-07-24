Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B62222C22C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 11:23:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCkJk4Y1FzF0PZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 19:23:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCkFL2hhzzDvJ4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 19:20:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=IBcm+Zm6; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4BCkFL1MnKz9sSt; Fri, 24 Jul 2020 19:20:22 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BCkFK6JGBz9sR4;
 Fri, 24 Jul 2020 19:20:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1595582422;
 bh=UPIxsyZfLqUDnT8iObHrZ8nb9iLP4cZ7fUXdGyHcmoY=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=IBcm+Zm6smdWh9PEK2Ss0rAnWl1DnQ/MqeA9ZxGG7OMSj5P/JP1IPUY2izxEO91Lh
 YAkwG4Qio5k7RC4FL7WIQZuF7oyC3Xd1RRYOZkSUxy5QMknsyJUJDHz+Eeu/KKy8D2
 Yj8ivvRvo695X+JLD7Sv+CqSKISjUJCY4NXGryZHHqScHu6DLebQN5O2YeWJVK91aS
 kTpe65r4wtIWyXCXq9ZJmHY3iAOobFHTdAGAataxWlkQOYyGRq4xNEumJ9p3qztAfJ
 oEtCBqHexVP0DDwwP8IINOU9+Qu43bHU1dzxXV7MkNfTUKFrCQTC8+SlwQuxuOA24I
 a73JbJdb8pVzA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Daniel Axtens <dja@axtens.net>, linuxppc-dev@ozlabs.org
Subject: Re: [PATCH 2/5] powerpc: Allow 4096 bytes of stack expansion for the
 signal frame
In-Reply-To: <87blk6tkuv.fsf@dja-thinkpad.axtens.net>
References: <20200703141327.1732550-1-mpe@ellerman.id.au>
 <20200703141327.1732550-2-mpe@ellerman.id.au>
 <87blk6tkuv.fsf@dja-thinkpad.axtens.net>
Date: Fri, 24 Jul 2020 19:20:18 +1000
Message-ID: <87wo2tp8vh.fsf@mpe.ellerman.id.au>
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
Cc: linux-arch@vger.kernel.org, hughd@google.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Daniel Axtens <dja@axtens.net> writes:
> Hi Michael,
>
> Unfortunately, this patch doesn't completely solve the problem.
>
> Trying the original reproducer, I'm still able to trigger the crash even
> with this patch, although not 100% of the time. (If I turn ASLR off
> outside of tmux it reliably crashes, if I turn ASLR off _inside_ of tmux
> it reliably succeeds; all of this is on a serial console.)
>
> ./foo 1241000 & sleep 1; killall -USR1 foo; echo ok
>
> If I add some debugging information, I see that I'm getting
> address + 4096 = 7fffffed0fa0
> gpr1 =           7fffffed1020
>
> So address + 4096 is 0x80 bytes below the 4k window. I haven't been able
> to figure out why, gdb gives me a NIP in __kernel_sigtramp_rt64 but I
> don't know what to make of that.

Thanks for testing.

I looked at it again this morning and it's fairly obvious when it's not
11pm :)

We need space for struct rt_sigframe as well as another 128 bytes,
which is __SIGNAL_FRAMESIZE. It's actually mentioned in the comment
above struct rt_sigframe.

I'll send a v2.

> P.S. I don't know what your policy on linking to kernel bugzilla is, but
> if you want:
>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=205183

In general I prefer to keep things clean with just a single Link: tag
pointing to the archive of the patch submission.

That can then contain further links and other info, and has the
advantage that people can reply to the patch submission in the future to
add information to the thread that wasn't known at the time of the
commit.

cheers
