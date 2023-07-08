Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD5874BED5
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Jul 2023 21:07:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=J88jOUyA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qz0BL1hm0z3c60
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Jul 2023 05:07:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=J88jOUyA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::234; helo=mail-lj1-x234.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qz09R4MTsz30N3
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Jul 2023 05:06:17 +1000 (AEST)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2b69f958ef3so49023991fa.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 08 Jul 2023 12:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1688843171; x=1691435171;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=o+hqttwHhvpKq8WU0CE6n+csMr8KAQKC/7ZFjSW0qHs=;
        b=J88jOUyATBkjmgnPWcbmvEvvipdMd4O5bDYMkd+y7kl3E49/3caPwtRmSxlb6m0ieD
         Eu5Pyu3CvvmZA1MjJomUGkrss5TE6PzHip/vNR4V1aadBycmLllCS0qaflRAapmtMPP6
         S0bZyDZDcoAwG+eZq0fa4LQKswv+P3YjjLtCg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688843171; x=1691435171;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o+hqttwHhvpKq8WU0CE6n+csMr8KAQKC/7ZFjSW0qHs=;
        b=O49itjJef50qpLOrxGDatqmGrJXKWDii2I5HigDuyKPIFecNZQrvJHCcThG9L4Jw8m
         NHm8mHEZX2Bfnc3bQ0DiH12dzq537tESJBdO3BqhOk+A70zf88oLLLyEOFQ7fOflgYsg
         F0KwdRISYW0c6cFoI7bGSyYeoOBygNZoT6Y++akLx8mw3xBr+ZLNPEBT0nJOu+gUbBJR
         KVlP9kfqqyR4tM7Es9kuEhmXV7cBmQ0cOwTDOfaUuEvdl4RWeTgi02biq+/IUWtYIPfO
         QxbLhoGuCkAY30zEaEXBPOQGaE4a7TIPshPkrvPUA3tzNkFKKtZGN6uesYc/NVCk7vza
         D5xQ==
X-Gm-Message-State: ABy/qLbnJTVPjqmuSuAdDQVdJD6FMFKDFmnH483fjTS6pxnf9i40y8PJ
	gM3r5XREcXjgE+smi63+xNV6euG+UOlHeqY3zWl7A+Aa
X-Google-Smtp-Source: APBJJlH2qYMVpYatgDGMKn5rgLeED5bLv1/HhgHnZP/A7Hm9Hy5D8C4WXwdM5K7Dkso0O5EPRbRPJA==
X-Received: by 2002:a19:6506:0:b0:4f8:56cd:da8c with SMTP id z6-20020a196506000000b004f856cdda8cmr5660700lfb.34.1688843170553;
        Sat, 08 Jul 2023 12:06:10 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id s3-20020aa7c543000000b0051d9dbf5edfsm3618043edr.55.2023.07.08.12.06.09
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Jul 2023 12:06:09 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-51d805cb33aso4152226a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 08 Jul 2023 12:06:09 -0700 (PDT)
X-Received: by 2002:aa7:c1d4:0:b0:51d:d622:713d with SMTP id
 d20-20020aa7c1d4000000b0051dd622713dmr5404706edp.39.1688843168772; Sat, 08
 Jul 2023 12:06:08 -0700 (PDT)
MIME-Version: 1.0
References: <facbfec3-837a-51ed-85fa-31021c17d6ef@gmail.com>
 <5c7455db-4ed8-b54f-e2d5-d2811908123d@leemhuis.info> <CAJuCfpH7BOBYGEG=op09bZrh1x3WA8HMcGBXXRhe6M5RJaen5A@mail.gmail.com>
 <CAJuCfpH7t7gCV2FkctzG2eWTUVTFZD7CtD14-WuHqBqOYBo1jA@mail.gmail.com>
 <2023070359-evasive-regroup-f3b8@gregkh> <CAJuCfpF=XPpPYqp2Y1Vu-GUL=RBj4fyhXoXzjBY4EKtBnYE_eQ@mail.gmail.com>
 <2023070453-plod-swipe-cfbf@gregkh> <20230704091808.aa2ed3c11a5351d9bf217ac9@linux-foundation.org>
 <CAJuCfpE_WjRQoDT1XnvBghCH-kpqk+pfcBJGyDnK7DZLMVG5Mw@mail.gmail.com>
 <2023070509-undertow-pulverize-5adc@gregkh> <7668c45a-70b1-dc2f-d0f5-c0e76ec17145@leemhuis.info>
 <20230705084906.22eee41e6e72da588fce5a48@linux-foundation.org>
 <df1d7d39-56f3-699c-0d0f-fcc8774f182e@leemhuis.info> <CAHk-=whKd05V49AbZGF=inYmhU6H_yNvvw1grWyhQfQ=9+5-VQ@mail.gmail.com>
 <20230708103936.4f6655cd0d8e8a0478509e25@linux-foundation.org>
 <CAHk-=wh498i3s+BgOF=pUOF=Qe_A0A16-mFcH2YGy+iZXvNChQ@mail.gmail.com> <CAJuCfpFLc1yoZm9uqRcmcwtFNGHYKyjxrc71tzXennpGB7QbYQ@mail.gmail.com>
In-Reply-To: <CAJuCfpFLc1yoZm9uqRcmcwtFNGHYKyjxrc71tzXennpGB7QbYQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 8 Jul 2023 12:05:51 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi-99-DyMOGywTbjRnRRC+XfpPm=r=pei4A=MEL0QDBXA@mail.gmail.com>
Message-ID: <CAHk-=wi-99-DyMOGywTbjRnRRC+XfpPm=r=pei4A=MEL0QDBXA@mail.gmail.com>
Subject: Re: Fwd: Memory corruption in multithreaded user space program while
 calling fork
To: Suren Baghdasaryan <surenb@google.com>
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
Cc: Jacob Young <jacobly.alt@gmail.com>, Linux regressions mailing list <regressions@lists.linux.dev>, Greg KH <gregkh@linuxfoundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Memory Management <linux-mm@kvack.org>, Thorsten Leemhuis <regressions@leemhuis.info>, Bagas Sanjaya <bagasdotme@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Laurent Dufour <ldufour@linux.ibm.com>, Linux PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 8 Jul 2023 at 11:40, Suren Baghdasaryan <surenb@google.com> wrote:
>
> My understanding was that flush_cache_dup_mm() is there to ensure
> nothing is in the cache, so locking VMAs before doing that would
> ensure that no page faults would pollute the caches after we flushed
> them. Is that reasoning incorrect?

It is indeed incorrect.

The VIVT caches are fundamentally broken, and we have various random
hacks for them to make them work in legacy situations.

And that flush_cache_dup_mm() is exactly that: a band-aid to make sure
that when we do a fork(), any previous writes that are dirty in the
caches will have made it to memory, so that they will show up in the
*new* process that has a different virtual mapping.

BUT!

This has nothing to do with page faults, or other threads.

If you have a threaded application that does fork(), it can - and will
- dirty the VIVT caches *during* the fork, and so the whole
"flush_cache_dup_mm()" is completely and fundamentally race wrt any
*new* activity.

It's not even what it is trying to deal with. All it tries to do is to
make sure that the newly forked child AT LEAST sees all the changes
that the parent did up to the point of the fork. Anything after that
is simply not relevant at all.

So think of all this not as some kind of absolute synchronization and
cache coherency (because you will never get that on a VIVT
architecture anyway), but as a "for the simple cases, this will at
least get you the expected behavior".

But as mentioned, for the issue of PER_VMA_LOCK, this is all *doubly*
irrelevant. Not only was it not relevant to begin with (ie that cache
flush only synchronizes parent -> child, not other-threads -> child),
but VIVT caches don't even exist on any relevant architecture because
they are fundamentally broken in so many other ways.

So all our "synchronize caches by hand" is literally just band-aid for
legacy architectures. I think it's mostly things like the old broken
MIPS chips, some sparc32, pa-risc: the "old RISC" stuff, where people
simplified the hardware a bit too much.

VIVT is lovely for hardware people becasue they get a shortcut. But
it's "lovely" in the same way that "PI=3" is lovely. It's simpler -
but it's _wrong_.

And it's almost entirely useless if you ever do SMP. I guarantee we
have tons of races with it for very fundamental reasons - the problems
it causes for software are not fixable, they are "hidable for the
simple case".

So you'll also find things like dcache_page_flush(), which flushes
writes to a page to memory. And exactly like the fork() case, it's
*not* real cache coherency, and it's *not* some kind of true global
serialization.

It's used in cases where we have a particular user that wants the
changes *it* made to be made visible. And exactly like
flush_cache_dup_mm(), it cannot deal with concurrent changes that
other threads make.

> Ok, I think these two are non-controversial:
> https://lkml.kernel.org/r/20230707043211.3682710-1-surenb@google.com
> https://lkml.kernel.org/r/20230707043211.3682710-2-surenb@google.com

These look sane to me. I wonder if the vma_start_write() should have
been somewhere else, but at least it makes sense in context, even if I
get the feeling that maybe it should have been done in some helper
earlier.

As it is, we randomly do it in other helpers like vm_flags_set(), and
I've often had the reaction that these vma_start_write() calls are
randomly sprinked around without any clear _design_ for where they
are.

> and the question now is how we fix the fork() case:
> https://lore.kernel.org/all/20230706011400.2949242-2-surenb@google.com/
> (if my above explanation makes sense to you)

See above. That patch is nonsensical. Trying to order
flush_cache_dup_mm() is not about page faults, and is fundamentally
not doable with threads anyway.

> https://lore.kernel.org/all/20230705063711.2670599-2-surenb@google.com/

This is the one that makes sense to me.

               Linus
