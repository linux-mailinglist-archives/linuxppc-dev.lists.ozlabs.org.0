Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D02367F292
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Jan 2023 01:01:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P3ZNf3Kxhz3fMM
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Jan 2023 11:01:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ZI6mj7LM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b32; helo=mail-yb1-xb32.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ZI6mj7LM;
	dkim-atps=neutral
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P3ZMg70mLz3fD2
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Jan 2023 11:00:30 +1100 (AEDT)
Received: by mail-yb1-xb32.google.com with SMTP id b1so7865392ybn.11
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 16:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lijrLZpsXTwOwkkTPhsucO7YRqlZ4/gQhAOPSV+Ow1Y=;
        b=ZI6mj7LMKoNI/oOcrUtd9AUED9JuO6xGc225ZP5uALsCXRzd5tFQyZH9QfEgcc0bEJ
         9MyRsCvVZhFftsPfxOsSdKAlZ9GqA6WUrV9aTPd04wtI360xfqHl28+MEAyKXCixyLSk
         v8GrgI9q5COmywhNxiEU2+JydvMvd/BUJNpQDFUYR03wciVHZjv2EuSHGsiQLe/irS5u
         RDJKdxaqaPSErbAgtbt4IW1KQBMdHVynCsJnp7XSUo4WFhOq1Cn2ildO86zTjyE4mi+d
         qY/TAAQK5YagCO/hba9UdT8QCqoflyP2AkBiQBN42R1sMEg9No3XOKucr14HB2VVZKdY
         RBZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lijrLZpsXTwOwkkTPhsucO7YRqlZ4/gQhAOPSV+Ow1Y=;
        b=6+RxxXITy6a/FjXvdu/SjO/aHlwEVTcCRRiXxzkHIbhoHIDLSuMWbecQpqINXVDw3+
         OW2YFSJIENou3GNhptXPI9xWH/6G2k1D/wk6QAPCwmpBVc+0gU99GSRpw9I2juM+Avme
         gfseAtnDVbV+IFflQLV17uSuKkkJVi04MhZyChpzpbG5L+tpxvoUfNNAVNRsPkvs4wFa
         kV1dOfgesuupAwrMEH9+Uk9G1YeGeUXWCaIrvk/9yWAJArZN7PqY3p5s+yzgCUIIx5BJ
         paClFNEbWSRAy2GM4VVqp73YkpNq1RAmXP0cZGI+bABz4DzpK/zaAuUsmOxq/8C61CdV
         Nvbg==
X-Gm-Message-State: AFqh2kqUkpRqSTg1TCpPXXvJTLJV3acbNW64is30+C0ASp+et/oufLBy
	o/uL3X+gfvJvPMbB4MaK32sIi52QppFpSscHk0uUfg==
X-Google-Smtp-Source: AMrXdXt1DVl+V4XP4vcyqRZaRp4SMPhEnSli2MXcg6xWkpJvGYiDP4ZAV3sZnOd/WucpWORfIrnrxsVJGAKOMpQ5+cE=
X-Received: by 2002:a25:9801:0:b0:7d5:b884:3617 with SMTP id
 a1-20020a259801000000b007d5b8843617mr3722360ybo.380.1674864027905; Fri, 27
 Jan 2023 16:00:27 -0800 (PST)
MIME-Version: 1.0
References: <20230127194110.533103-1-surenb@google.com> <20230127145138.8cc44bf00ebf289dffec0975@linux-foundation.org>
 <Y9Rdmy5h2F1z5yR3@casper.infradead.org>
In-Reply-To: <Y9Rdmy5h2F1z5yR3@casper.infradead.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 27 Jan 2023 16:00:16 -0800
Message-ID: <CAJuCfpEq2F4EwWAeP6nLqS9m9XLpUss8n=35ZTgYgtiAJyvsxQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/33] Per-VMA locks
To: Matthew Wilcox <willy@infradead.org>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, Andrew Morton <akpm@linux-foundation.org>, tatashin@google.com, mgorman@techsingularity.net,
  rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jan 27, 2023 at 3:26 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Fri, Jan 27, 2023 at 02:51:38PM -0800, Andrew Morton wrote:
> > On Fri, 27 Jan 2023 11:40:37 -0800 Suren Baghdasaryan <surenb@google.co=
m> wrote:
> >
> > > Per-vma locks idea that was discussed during SPF [1] discussion at LS=
F/MM
> > > last year [2], which concluded with suggestion that =E2=80=9Ca reader=
/writer
> > > semaphore could be put into the VMA itself; that would have the effec=
t of
> > > using the VMA as a sort of range lock. There would still be contentio=
n at
> > > the VMA level, but it would be an improvement.=E2=80=9D This patchset=
 implements
> > > this suggested approach.
> >
> > I think I'll await reviewer/tester input for a while.

Sure, I don't expect the review to be very quick considering the
complexity, however I would appreciate any testing that can be done.

> >
> > > The patchset implements per-VMA locking only for anonymous pages whic=
h
> > > are not in swap and avoids userfaultfs as their implementation is mor=
e
> > > complex. Additional support for file-back page faults, swapped and us=
er
> > > pages can be added incrementally.
> >
> > This is a significant risk.  How can we be confident that these as yet
> > unimplemented parts are implementable and that the result will be good?
>
> They don't need to be implementable for this patchset to be evaluated
> on its own terms.  This patchset improves scalability for anon pages
> without making file/swap/uffd pages worse (or if it does, I haven't
> seen the benchmarks to prove it).

Making it work for all kinds of page faults would require much more
time. So, this incremental approach, when we tackle the mmap_lock
scalability problem part-by-part seems more doable. Even with
anonymous-only support, the patch shows considerable improvements.
Therefore I would argue that the patch is viable even if it does not
support the above-mentioned cases.

>
> That said, I'm confident that I have a good handle on how to make
> file-backed page faults work under RCU.

Looking forward to collaborating on that!
Thanks,
Suren.
