Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D1674BFE0
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Jul 2023 01:01:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=Vf+Xnk7c;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qz5Nb2Djhz3c54
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Jul 2023 09:01:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=Vf+Xnk7c;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qz5Ml0175z301r
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Jul 2023 09:00:33 +1000 (AEST)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-992ace062f3so406588266b.2
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 08 Jul 2023 16:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1688857224; x=1691449224;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HMLbgJOTu2WV/nORFtWqoUMvz+jr1XXDxLBzD5NfFBo=;
        b=Vf+Xnk7ckppQamlkK+4M/GGejWTam+bQpeeboH9ndpUgamoZQ9DScK9Bl1BZ1OexPI
         Evmcdds+mrwJan1xIPzduFouMl8XVDehdq5KqueJGAZdPDKYexphvrfxNFJMR2SR+vgb
         BHG2OatsNce9QUGRZ0gppuF42+0QVxexbjy9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688857224; x=1691449224;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HMLbgJOTu2WV/nORFtWqoUMvz+jr1XXDxLBzD5NfFBo=;
        b=PsU2U6hdzUohv4SpUdl1QtDpyQoq2BqF6OpC1tlLzifA4QuAQh1basSL0iQPcmbksF
         cvOqdk3a8kgTkCpf5Y/U4qu1ikNvIyr/Amns7bCtyhCZk00oDW5liQgAyeiMy3rr1eYk
         yA5BEkApf6e6D1whZdrLFdUmVRLT0KeTNCPHSyVzJHfh55W91dKsWZNtpUDedMpV6mwO
         fuT5FflkWS+mIrF6j/uRUAOeDcVlJTa5KwI1PxzDiwkZs4TXnKMSsEN3OkRomMO7tjwo
         urc8A5LQcnISIw0qzPxnc4/xXsb25/HmmZpaZWw2YGDp98dgQgBbZYwbX947NkH9AqcX
         6Jjg==
X-Gm-Message-State: ABy/qLb1bBOPOkJQsB7WYagafKOw3bszMLvb3EH43N9ZSdNZyLgJqtwc
	O7U4n1mMlEakiiHc05f51lCZ45PLNI61CBACB4ll6P5P
X-Google-Smtp-Source: APBJJlHitFrLpvBHADFTXJDVy6d70zO9t5MT1TczBKQAWfBUCv6+KWExotrctPXP4q225Tb2mAdefQ==
X-Received: by 2002:a17:906:2a48:b0:992:a80e:e5bd with SMTP id k8-20020a1709062a4800b00992a80ee5bdmr6018883eje.48.1688857223788;
        Sat, 08 Jul 2023 16:00:23 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id s24-20020a170906169800b0096f7500502csm4007945ejd.199.2023.07.08.16.00.23
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Jul 2023 16:00:23 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-51e29913c35so4349100a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 08 Jul 2023 16:00:23 -0700 (PDT)
X-Received: by 2002:aa7:d383:0:b0:51a:50f2:4e7a with SMTP id
 x3-20020aa7d383000000b0051a50f24e7amr7201378edq.13.1688856837545; Sat, 08 Jul
 2023 15:53:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230708191212.4147700-1-surenb@google.com> <20230708191212.4147700-3-surenb@google.com>
 <CAHk-=whhXFQj0Vwzh7bnjnLs=SSTsxyiY6jeb7ovOGnCes4aWg@mail.gmail.com> <CAJuCfpHuFc1P=Wo6Oy0T0u-H1B_JsbRgqhVJxY7D64ZY1zh7Cg@mail.gmail.com>
In-Reply-To: <CAJuCfpHuFc1P=Wo6Oy0T0u-H1B_JsbRgqhVJxY7D64ZY1zh7Cg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 8 Jul 2023 15:53:40 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi9NQdt3-yHRXExdnu-QpUfXsqiSujkSTg6AdGjabPs6g@mail.gmail.com>
Message-ID: <CAHk-=wi9NQdt3-yHRXExdnu-QpUfXsqiSujkSTg6AdGjabPs6g@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] fork: lock VMAs of the parent process when forking
To: Suren Baghdasaryan <surenb@google.com>, David Hildenbrand <david@redhat.com>
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
Cc: jacobly.alt@gmail.com, regressions@lists.linux.dev, Jiri Slaby <jirislaby@kernel.org>, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, liam.howlett@oracle.com, linux-mm@kvack.org, peterx@redhat.com, regressions@leemhuis.info, willy@infradead.org, bagasdotme@gmail.com, stable@vger.kernel.org, akpm@linux-foundation.org, ldufour@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, =?UTF-8?Q?Holger_Hoffst=C3=A4tte?= <holger@applied-asynchrony.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 8 Jul 2023 at 15:36, Suren Baghdasaryan <surenb@google.com> wrote:
>
> On Sat, Jul 8, 2023 at 2:18=E2=80=AFPM Linus Torvalds
> >
> > Again - maybe I messed up, but it really feels like the missing
> > vma_start_write() was more fundamental, and not some "TLB coherency"
> > issue.
>
> Sounds plausible. I'll try to use the reproducer to verify if that's
> indeed happening here.

I really don't think that's what people are reporting, I was just
trying to make up a completely different case that has nothing to do
with any TLB issues.

My real point was simply this one:

> It's likely there are multiple problematic
> scenarios due to this missing lock though.

Right. That's my issue. I felt your explanation was *too* targeted at
some TLB non-coherency thing, when I think the problem was actually a
much larger "page faults simply must not happen while we're copying
the page tables because data isn't coherent".

The anon_vma case was just meant as another random example of the
other kinds of things I suspect can go wrong, because we're simply not
able to do this whole "copy vma while it's being modified by page
faults".

Now, I agree that the PTE problem is real, and probable the main
thing, ie when we as part of fork() do this:

        /*
         * If it's a COW mapping, write protect it both
         * in the parent and the child
         */
        if (is_cow_mapping(vm_flags) && pte_write(pte)) {
                ptep_set_wrprotect(src_mm, addr, src_pte);
                pte =3D pte_wrprotect(pte);
        }

and the thing that can go wrong before the TLB flush happens is that -
because the TLB's haven't been flushed yet - some threads in the
parent happily continue to write to the page and didn't see the
wrprotect happening.

And then you get into the situation where *some* thread see the page
protections change (maybe they had a TLB flush event on that CPU for
random reasons), and they will take a page fault and do the COW thing
and create a new page.

And all the while *other* threads still see the old writeable TLB
state, and continue to write to the old page.

So now you have a page that gets its data copied *while* somebody is
still writing to it, and the end result is that some write easily gets
lost, and so when that new copy is installed, you see it as data
corruption.

And I agree completely that that is probably the thing that most
people actually saw and reacted to as corruption.

But the reason I didn't like the explanation was that I think this is
just one random example of the more fundamental issue of "we simply
must not take page faults while copying".

Your explanation made me think "stale TLB is the problem", and *that*
was what I objected to. The stale TLB was just one random sign of the
much larger problem.

It might even have been the most common symptom, but I think it was
just a *symptom*, not the *cause* of the problem.

And I must have been bad at explaining that, because David Hildenbrand
also reacted negatively to my change.

So I'll happily take a patch that adds more commentary about this, and
gives several examples of the things that go wrong.

                Linus
