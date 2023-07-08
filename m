Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7A574BEED
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Jul 2023 21:18:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=kgAq9llG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qz0R62qbkz3c3X
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Jul 2023 05:18:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=kgAq9llG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b36; helo=mail-yb1-xb36.google.com; envelope-from=surenb@google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qz0QG1GzXz30NK
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Jul 2023 05:17:24 +1000 (AEST)
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-bd61dd9a346so3625280276.2
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 08 Jul 2023 12:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688843841; x=1691435841;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X3LY7dYv5k15re4a/Llihk/Zb4iZk7kWPwhcuGYZHVQ=;
        b=kgAq9llGN6XA4R8/ZW4mQm2krbD3RuAy2NnKl17unmj7xKtTK7WE4GTVtAk3UgX4rx
         JIG25ZBE7XRe3DlgpSFq5q9k/0GDndch6DFxZVhjJG0ZVwZLuFxqKN0c+g9rOlS/DYu5
         /wZktXXImobRHfRGb7J5KNFmvLMpLeqOuNc+/jdLE6slEaEdCurnVeo76cqIesypaV+S
         4hD2bmMpab0v/qupOogGUVk5F93K4Ymh3Zt14ynvl83FF0NtppCEhd7H0dMIDRi1Fdym
         zE0bcwrcGEhT5CnFGfvW3xgsdM1Wb2BDdYEo1tc6VgVFX41XBrz6vVX/XgpKwLBOgIVF
         ZHyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688843841; x=1691435841;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X3LY7dYv5k15re4a/Llihk/Zb4iZk7kWPwhcuGYZHVQ=;
        b=XJiAOzD8X+eZtmQFI8plv8JFXy9HCCWOQn+1iZ10cUH/fi5A93rXTzXzzknazGrvkt
         tJgi+2ANRyQY+AzmpxewUfv+16cuDmboxnyqnEMZBmzUMHdoQmtnW9kx0eHXwclGfAEE
         SMuB3dJm+QBvgIFXckIGUh5/ocoIEivoa16MGSdKgjblLrovmkeeNWXaqtrqMtNmH22b
         c5uFofbvibP9Xl+QBaRw7sGSbau10mL+GlboS0ISd+Wvrz0L64w/TtJKFBk1T6HzLy+d
         5ORZe/14WiIt9fW3LHNW3STQxiPUZluFizBdKFcT8/rx12XTO1FEXq1A0iRNQHmym90f
         WZLA==
X-Gm-Message-State: ABy/qLZxa/VaHX0dNDC/N43HE+0yvFefjEBR/MvW0Bs0wVvoEB+TkszJ
	RUHkx4wSOSbjHgFtQH4FD5RUP6+CB/78wp07RCxJTw==
X-Google-Smtp-Source: APBJJlEoHrHoz6BmG+RC4l0pnykLqH5FaPicQh57ySeeIgGtPEduQgxdcLv7yLiT5UnAbSmnjSy6P3MEwJytlPhMWnU=
X-Received: by 2002:a81:4a0b:0:b0:573:98a3:f01a with SMTP id
 x11-20020a814a0b000000b0057398a3f01amr9036621ywa.40.1688843841416; Sat, 08
 Jul 2023 12:17:21 -0700 (PDT)
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
 <CAHk-=wh498i3s+BgOF=pUOF=Qe_A0A16-mFcH2YGy+iZXvNChQ@mail.gmail.com>
 <CAJuCfpFLc1yoZm9uqRcmcwtFNGHYKyjxrc71tzXennpGB7QbYQ@mail.gmail.com> <CAHk-=wi-99-DyMOGywTbjRnRRC+XfpPm=r=pei4A=MEL0QDBXA@mail.gmail.com>
In-Reply-To: <CAHk-=wi-99-DyMOGywTbjRnRRC+XfpPm=r=pei4A=MEL0QDBXA@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sat, 8 Jul 2023 12:17:10 -0700
Message-ID: <CAJuCfpHszCAc5hDdsxry+1xh3kz+=jsYdBCXKQez-Th9LESSZA@mail.gmail.com>
Subject: Re: Fwd: Memory corruption in multithreaded user space program while
 calling fork
To: Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Sat, Jul 8, 2023 at 12:06=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Sat, 8 Jul 2023 at 11:40, Suren Baghdasaryan <surenb@google.com> wrote=
:
> >
> > My understanding was that flush_cache_dup_mm() is there to ensure
> > nothing is in the cache, so locking VMAs before doing that would
> > ensure that no page faults would pollute the caches after we flushed
> > them. Is that reasoning incorrect?
>
> It is indeed incorrect.
>
> The VIVT caches are fundamentally broken, and we have various random
> hacks for them to make them work in legacy situations.
>
> And that flush_cache_dup_mm() is exactly that: a band-aid to make sure
> that when we do a fork(), any previous writes that are dirty in the
> caches will have made it to memory, so that they will show up in the
> *new* process that has a different virtual mapping.
>
> BUT!
>
> This has nothing to do with page faults, or other threads.
>
> If you have a threaded application that does fork(), it can - and will
> - dirty the VIVT caches *during* the fork, and so the whole
> "flush_cache_dup_mm()" is completely and fundamentally race wrt any
> *new* activity.
>
> It's not even what it is trying to deal with. All it tries to do is to
> make sure that the newly forked child AT LEAST sees all the changes
> that the parent did up to the point of the fork. Anything after that
> is simply not relevant at all.
>
> So think of all this not as some kind of absolute synchronization and
> cache coherency (because you will never get that on a VIVT
> architecture anyway), but as a "for the simple cases, this will at
> least get you the expected behavior".
>
> But as mentioned, for the issue of PER_VMA_LOCK, this is all *doubly*
> irrelevant. Not only was it not relevant to begin with (ie that cache
> flush only synchronizes parent -> child, not other-threads -> child),
> but VIVT caches don't even exist on any relevant architecture because
> they are fundamentally broken in so many other ways.
>
> So all our "synchronize caches by hand" is literally just band-aid for
> legacy architectures. I think it's mostly things like the old broken
> MIPS chips, some sparc32, pa-risc: the "old RISC" stuff, where people
> simplified the hardware a bit too much.
>
> VIVT is lovely for hardware people becasue they get a shortcut. But
> it's "lovely" in the same way that "PI=3D3" is lovely. It's simpler -
> but it's _wrong_.
>
> And it's almost entirely useless if you ever do SMP. I guarantee we
> have tons of races with it for very fundamental reasons - the problems
> it causes for software are not fixable, they are "hidable for the
> simple case".
>
> So you'll also find things like dcache_page_flush(), which flushes
> writes to a page to memory. And exactly like the fork() case, it's
> *not* real cache coherency, and it's *not* some kind of true global
> serialization.
>
> It's used in cases where we have a particular user that wants the
> changes *it* made to be made visible. And exactly like
> flush_cache_dup_mm(), it cannot deal with concurrent changes that
> other threads make.

Thanks for the explanation! It's quite educational.

>
> > Ok, I think these two are non-controversial:
> > https://lkml.kernel.org/r/20230707043211.3682710-1-surenb@google.com
> > https://lkml.kernel.org/r/20230707043211.3682710-2-surenb@google.com
>
> These look sane to me. I wonder if the vma_start_write() should have
> been somewhere else, but at least it makes sense in context, even if I
> get the feeling that maybe it should have been done in some helper
> earlier.
>
> As it is, we randomly do it in other helpers like vm_flags_set(), and
> I've often had the reaction that these vma_start_write() calls are
> randomly sprinked around without any clear _design_ for where they
> are.

We write-lock a VMA before any modification. I tried to provide
explanations for each such locking in my comments/patch descriptions
but I guess I haven't done a good job at that...

>
> > and the question now is how we fix the fork() case:
> > https://lore.kernel.org/all/20230706011400.2949242-2-surenb@google.com/
> > (if my above explanation makes sense to you)
>
> See above. That patch is nonsensical. Trying to order
> flush_cache_dup_mm() is not about page faults, and is fundamentally
> not doable with threads anyway.
>
> > https://lore.kernel.org/all/20230705063711.2670599-2-surenb@google.com/
>
> This is the one that makes sense to me.

Ok, I sent you 3-patch series with the fixes here:
https://lore.kernel.org/all/20230708191212.4147700-1-surenb@google.com/
Do you want me to disable per-VMA locks by default as well?


>
>                Linus
