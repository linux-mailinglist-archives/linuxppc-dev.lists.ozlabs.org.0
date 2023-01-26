Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FAD567D12C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 17:19:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2mBD1yfSz3fFL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 03:19:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=H348+fay;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b30; helo=mail-yb1-xb30.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=H348+fay;
	dkim-atps=neutral
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2m9K6M50z2yPY
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 03:18:44 +1100 (AEDT)
Received: by mail-yb1-xb30.google.com with SMTP id t16so2610679ybk.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 08:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vvEyqxPpR8M4BC65XVopg/XEu9SCivMiAr3QBDUWiyU=;
        b=H348+fayL/o7ZK4OMOl0X4WP2eMya1R6g3s71mVa0DA8XCsYAD7Mno2OaEE7NA0CmO
         e4033coOL787sHvi/S6s9OFvGkRHoLaUuJ1duFsKOvl5kj/wYF8+5cRX76ijn0+r9mVN
         /MK6vYc4x8jCg28wjYXYjcmydOgZp19VGDCnfGGlA3w2bC3Yw6+bgXPCcc6kwlaa/Dld
         Xkvgt3oautRKkhJGYhlwnO6TvcpaegDMiJu4G7chvMyMJzFUHGEi5AWj6fisELCIR8Mt
         LiDJG1ULptGXP+W67GIwNcq68sjgGTmxbYOeP0BP5KnuDIfe/tA0SCD/oII/g1WHFURW
         dp6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vvEyqxPpR8M4BC65XVopg/XEu9SCivMiAr3QBDUWiyU=;
        b=BEFopVZ3DnPogSZh/6e5vWqg7URsluH8xKft9DMdImliNLfbRY7wVJjYbkLdNTk/1k
         Q/fVIBjsNhT+Zd2Ciz4RilIJA9gftGF+DbcewL+8piPx/iSM111pKTf81yN/6Qovx7M0
         i6nRp92S6uzO/V+AaESq4M+Jk3mRzGOQi+8j8fDMzWlpQwa2FXh7QcvKko2MUnfiyNAq
         CaElQCt2SIAZzg+Q9Vjs6e+FGd/MKzgvGbX1BgSbC0ssOQLsTfz1bn3X9atu7BNgs255
         Tza4dBWSoH3p7KoMZfl97iDOkwX8mua6gK+PgPY64UZSapx1isiR3aMXTLpa8WLfoVLM
         dIMg==
X-Gm-Message-State: AO0yUKWvNuH1ETatmGLfZR482GgGdUAxxziLSSjbdt/5yFEmXvFUpviE
	XLqWxyHjAljMGALJMQKTZyHuQS2lS4drnkQT6SkZJg==
X-Google-Smtp-Source: AK7set9P+5mtUtKJMZFiPeuyZhPr8TwEdg7FU3uDJVhz4F2UDpdSR6q0zVgkPPrpoaJxmCX2P+Pz2XDq0fuB0xLwifk=
X-Received: by 2002:a25:6811:0:b0:80b:c92b:ed7c with SMTP id
 d17-20020a256811000000b0080bc92bed7cmr466120ybc.593.1674749922312; Thu, 26
 Jan 2023 08:18:42 -0800 (PST)
MIME-Version: 1.0
References: <20230125233554.153109-1-surenb@google.com> <20230125233554.153109-7-surenb@google.com>
 <20230126154740.j3a3lu4x557c56yi@techsingularity.net>
In-Reply-To: <20230126154740.j3a3lu4x557c56yi@techsingularity.net>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 26 Jan 2023 08:18:31 -0800
Message-ID: <CAJuCfpHP6hQAWZr2exZEXOzLbMNU_c9qNNc7pa2NYAhYLe=EKQ@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] mm: introduce mod_vm_flags_nolock and use it in untrack_pfn
To: Mel Gorman <mgorman@techsingularity.net>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@google.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 26, 2023 at 7:47 AM Mel Gorman <mgorman@techsingularity.net> wrote:
>
> On Wed, Jan 25, 2023 at 03:35:53PM -0800, Suren Baghdasaryan wrote:
> > In cases when VMA flags are modified after VMA was isolated and mmap_lock
> > was downgraded, flags modifications would result in an assertion because
> > mmap write lock is not held.
>
> Add note that it's also used during exit when the locking of the VMAs
> becomes irrelevant (mm users is 0, should be no VMA modifications taking
> place other than zap).

Ack.

>
> The typical naming pattern when a caller either knows it holds the necessary
> lock or knows it does not matter is __mod_vm_flags()

Ok. It sounds less explicit but plenty of examples, so I'm fine with
such rename. Will apply in the next version.

>
> > Introduce mod_vm_flags_nolock to be used in such situation, when VMA is
> > not part of VMA tree and locking it is not required.
>
> Instead of such situations, describe in as "used when the caller takes
> responsibility for the required locking".

Ack.

>
> > Pass a hint to untrack_pfn to conditionally use mod_vm_flags_nolock for
> > flags modification and to avoid assertion.
> >
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
>
> Patch itself looks ok. It strays close to being "conditional locking"
> though which might attract some complaints.

The description seems to accurately describe what's done here but I'm
open to better suggestions.
Thanks!

>
> --
> Mel Gorman
> SUSE Labs
