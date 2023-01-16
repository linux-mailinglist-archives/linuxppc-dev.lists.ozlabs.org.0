Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 645AB66CA30
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Jan 2023 18:00:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NwdZ72mngz3cfW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 04:00:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=bbWXX/J2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2607:f8b0:4864:20::f2c; helo=mail-qv1-xf2c.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=bbWXX/J2;
	dkim-atps=neutral
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NwdY91CX1z3bTB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jan 2023 03:59:39 +1100 (AEDT)
Received: by mail-qv1-xf2c.google.com with SMTP id q10so19827302qvt.10
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Jan 2023 08:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KjSZzRBMAdo4mybRNiLTxM/648Q8PCOSrlXM8wfEg/Y=;
        b=bbWXX/J2n8gGWFtUKJ79/dybMp54eeRhJ8ySSIK9ik1Ce0uUusco6vLIjhKxkkmNR2
         k1+hK2DvdvTiwjmrwaSfpBBiEZCkBvHNFSblOid49EHhugPTMqxH1LznEPX7jA+7DZC6
         emQgnqb2QmJAnhgv5aqvzEUPOTkyNDkQF4oR0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KjSZzRBMAdo4mybRNiLTxM/648Q8PCOSrlXM8wfEg/Y=;
        b=ST+dDkEzZlNC4V7smYD1dyS3VfM/5jzLVtrIwZMoFFP9xUyLJu3LgwTWRZ4LDYyADS
         yfbKvxzfaq3RlORxbB+GBui2QXX9NcbXKnWro+avmR2OBZ6e2x70yi3Uo0d2o7i20k9f
         +RjT2rnp1BVSvi794FOvdfvEs3o+KlrrxPNWzUk6SXPVFIB1HRQIZr0rvMiBuaQrM606
         +L3HfASQa7pQOHz3JY9tujrIF1ZG3mb0UswjUDV9vY4ofgar/lZ4hc3l2WyxhP9sFiM3
         +HTHLdJS/YyUJ+RGTXJUMroKemueU5PTqstCjXnUta4JB8b0QQrXNZwjFGc9pcyqoE64
         77zQ==
X-Gm-Message-State: AFqh2kpIj91bhSLNPF2yIKoovCVa2u12jkBd50A3mimoi/eO9ygoOTOK
	9r/zOkWy7iNdSjoKKU7Fi4979IXQNdPQ54cn
X-Google-Smtp-Source: AMrXdXtRT+tymD6xrNKuEU2YSozo+SAi/R9vIRn3YhhGOtUwQjBu9j5NoFodyrTKbUGq/5zRowRztg==
X-Received: by 2002:a0c:e58a:0:b0:534:226b:fb7f with SMTP id t10-20020a0ce58a000000b00534226bfb7fmr355835qvm.33.1673888373662;
        Mon, 16 Jan 2023 08:59:33 -0800 (PST)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com. [209.85.219.41])
        by smtp.gmail.com with ESMTPSA id y4-20020a05620a44c400b007069375e0f4sm242716qkp.122.2023.01.16.08.59.32
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jan 2023 08:59:32 -0800 (PST)
Received: by mail-qv1-f41.google.com with SMTP id g10so14344834qvo.6
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Jan 2023 08:59:32 -0800 (PST)
X-Received: by 2002:a05:6214:5d11:b0:531:7593:f551 with SMTP id
 me17-20020a0562145d1100b005317593f551mr11158qvb.89.1673888372051; Mon, 16 Jan
 2023 08:59:32 -0800 (PST)
MIME-Version: 1.0
References: <CAGudoHHx0Nqg6DE70zAVA75eV-HXfWyhVMWZ-aSeOofkA_=WdA@mail.gmail.com>
 <CAHk-=wjthxgrLEvgZBUwd35e_mk=dCWKMUEURC6YsX5nWom8kQ@mail.gmail.com>
 <CPQQLU1ISBIJ.2SHU1BOMNO7TY@bobo> <CAHk-=wiRm+Z613bHt2d=N1yWJAiDiQVXkh0dN8z02yA_JS-rew@mail.gmail.com>
 <1966767.1673878095@warthog.procyon.org.uk>
In-Reply-To: <1966767.1673878095@warthog.procyon.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 16 Jan 2023 08:59:16 -0800
X-Gmail-Original-Message-ID: <CAHk-=whjFwzEq0u04=n=t7-kNJdX0HkAOjAMjmLXDDycJ+j9yQ@mail.gmail.com>
Message-ID: <CAHk-=whjFwzEq0u04=n=t7-kNJdX0HkAOjAMjmLXDDycJ+j9yQ@mail.gmail.com>
Subject: Re: Memory transaction instructions
To: David Howells <dhowells@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Mateusz Guzik <mjguzik@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Nicholas Piggin <npiggin@gmail.com>, tony.luck@intel.com, viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, Jan Glauber <jan.glauber@gmail.com>, Will Deacon <will@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jan 16, 2023 at 6:08 AM David Howells <dhowells@redhat.com> wrote:
>
> I'm not sure how relevant it is to the topic, but I seem to remember you
> having a go at implementing spinlocks with x86_64 memory transaction
> instructions a while back.  Do you have any thoughts on whether these
> instructions are ever likely to become something we can use?

Nope.

Not only are they buggy, the actual cost of them was prohibitive too.

The only implementation I ever did was what then became 'lockref' (so
this was about a decade ago), and using transactional memory was
actually quite noticeably *slower* than just using a spinlock in the
common cases (particularly the uncontended case - which is actually
the common one by far, despite some benchmarks).

And while the argument could be that transactional memory has improved
in the last decade (narrator: "It hasn't"), the problem is actually
quite fundamental.

The whole "best case scenario" for transactional memory concept is
literally optimized and designed for the rare circumstance - the case
where you have contention, but where the locking part is basically an
idempotent operation (so "lock+unlock" ends up undoing each other and
can use shared cachelines rather than bouncing the cacheline).

And contention pretty much happens in one situation, and one situation
only: in a combination of (a) bad locking and (b) benchmarks.

And for the kernel, where we don't have bad locking, and where we
actually use fine-grained locks that are _near_ the data that we are
locking (the lockref of the dcache is obviously one example of that,
but the skbuff queue you mention is almost certainly exactly the same
situation): the lock is right by the data that the lock protects, and
the "shared lock cacheline" model simply does not work. You'll bounce
the data, and most likely you'll also touch the same lock cacheline
too.

I was quite excited about transactional memory, but have (obviously)
come to the conclusion that it was one of those "looks good in theory,
but is just garbage in reality".

So this isn't an "the x86 implementation was bad" issue. This is a
"transactional memory is a bad idea" situation. It complicates the
most important part of the core CPU (the memory pipeline) enormously,
and it doesn't actually really work.

Now, with that "transactional memory is garbage" in mind, let me just
mention that there are obviously other circumstances:

 (a) horrendously bad locking

If you have a single centralized lock, and you really have serious
contention on it in real life all the time (and not just under
microbenchmarks), and the data that gets touched is spread out all
over, and you simply cannot fix the locking, then all those
theoretical advantages of transactional memory can actually come into
play.

But again: even then, there's an absolutely huge cost to the memory
pipeline.  So that advantage really doesn't come free. Nobody has ever
gotten transactional memory to actually work well in real life. Not
Intel, not IBM with powerpc HTM.

That should tell you something. The hw complexity cost is very very real.

But Intel actually had some loads where TSX helped. I think it was SAP
HANA, and I really think that what you should take away from that is
that SAP HANA locking is likely horrible garbage inside. But maybe I'm
biased, and maybe SAP HANA is lovely, and maybe it just happened to
work really well for TSX. I've never actually looked at that load, but
if I were a betting man...

 (b) very *limited* transactions are probably a great idea

LL/SC is arguably a form of "transactional memory", just with a single
word. Now, I think atomics are generally usually better than LL/SC
when it really is just a single word (because most of the time,
"single word" also means "simple semantics", and while CMPXCHG loops
aren't lovely when the semantics are a bit more complex, it's actually
nice and portable and works at a higher level than assembler sequences
and as such is actually a *lot* better than LL/SC in practice).

But a "N-word LL/SC with forward progress guarantees" would be
objectively stronger than atomics, and would allow for doing low-level
data structures in ways that atomics don't. Doubly linked lists
together with a lock check would argue for "N" being ~5 memory
operations. So I do believe in potentially *limited* memory
transactions, when they can be made limited enough that you have

 (1) forward progress guarantees with no "separate fallback on
contention" garbage

 (2) can keep the hw implementation simple enough with just a store
buffer and an (architecturally) very limited number of cacheline
accesses that you can actually order in HW so that you don't have ABBA
situations.

But the generic kind of transactional memory that Intel tried with TSX
(and IBM with HTM) is pure garbage, and almost certainly always will
be.

And all of the above is obviously just my opinionated input on it. But
I just happen to be right.

                Linus
