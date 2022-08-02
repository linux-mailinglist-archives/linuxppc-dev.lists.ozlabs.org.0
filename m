Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA36587D5B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Aug 2022 15:46:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lxx9Y6K0Nz2yjC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Aug 2022 23:46:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Ix9fPoJ5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Ix9fPoJ5;
	dkim-atps=neutral
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lxx8v24Pvz2xJQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Aug 2022 23:46:05 +1000 (AEST)
Received: by mail-io1-xd29.google.com with SMTP id h145so10640505iof.9
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 02 Aug 2022 06:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ColewwI6l3g5ZDtLvTS82d/pMaZ2whxLZFnC491Bn6M=;
        b=Ix9fPoJ51D0qSPNpA+0N27SSr+MNMIyYRhiTE7KDWG2BBH2bO6g80DXYnJnms6YJjG
         agUuOKCD9wiLdQ++JXvVGshqkEc8jxhyZXYsdpoauxQCswodvgdOoEDts4s54Ghpbktb
         vUGPGAO5uX2H8URrsKOvTlDlM9wx7V0BdREsaLOQlEg9gcsSoCWN2ZqxBjxNBxXC98n7
         rmdqT/SparDIm/Ml8dTc/TzNdWkvacAdxkfHXMUkpv8D//AosWIR2t3EGy/AaSJxJ8IF
         oB9E+nbhcEuuHe8zonZZK1ucnrxX31t2oWw/hOQxYs7RO/jvYm6dpNY/E1kQfJvrcc6P
         XNEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ColewwI6l3g5ZDtLvTS82d/pMaZ2whxLZFnC491Bn6M=;
        b=cgDxMt2jrnE5c4kfnMjGSvSMSmiQnmoJe0OIv+KHr112siRzQvrwlLwHOOVU9UYZ3W
         sg4VVAgh8aNYiL+Xwsp/B1v+zk3vO+M4z4H0NgsvRQ7f5zcsKg0Byb9Pt17nCxcSuHE8
         0pBxPMGYq1JaNrXPFo7vn/2JI3SIOrBOo4+D8ym+0jdXfAPRPEByt6AciFU9eQ6z0Y/+
         Zobd3zZvrVNhjj2E8cvtRwIlOThBDUY1HG4h7on7xW13RIEsOxhFw0voHpBTojsh/mHe
         Nd0EPj4sUwZjoiP9WexfzzCidKppmaOWMmRwQOsDV1K8yQvO3bCOtSTDjimHEm+eg0yR
         W+CQ==
X-Gm-Message-State: AJIora/RmLFU+Z+TmXXZ43FuJWQcbZh93++ClLDWKifi64ExeDJsBZkt
	CAg0o+QIarMFGYhqafLMVMxmqxEzMGsSwZyF4tU=
X-Google-Smtp-Source: AGRyM1uCQS8jcQ0eTYdpzXJtMC+GsUZV7viJg2lh4yuiqsyHiT1OZ2XaNk9WVUmOTbXEr/cMDTnXeLewlffITgyBAM4=
X-Received: by 2002:a05:6638:dd1:b0:341:5666:dd0a with SMTP id
 m17-20020a0566380dd100b003415666dd0amr8504893jaj.199.1659447961680; Tue, 02
 Aug 2022 06:46:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220802015052.10452-1-ojeda@kernel.org> <YukYByl76DKqa+iD@casper.infradead.org>
In-Reply-To: <YukYByl76DKqa+iD@casper.infradead.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 2 Aug 2022 15:45:50 +0200
Message-ID: <CANiq72k7JKqq5-8Nqf3Q2r2t_sAffC8g86A+v8yBc=W-1--_Tg@mail.gmail.com>
Subject: Re: [PATCH v8 00/31] Rust support
To: Matthew Wilcox <willy@infradead.org>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-fsdevel@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kbuild@vger.kernel.org, linux-um@lists.infradead.org, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-gpio@vger.kernel.org, Jarkko Sakkinen <jarkko@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, live-patching@vger.kernel.org, linux-riscv@lists.infradead.org, Linus Torvalds <torvalds@linux-foundation.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Willy,

On Tue, Aug 2, 2022 at 2:26 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> None of this (afaict) has been discussed on linux-fsdevel.  And I may
> have missed somethiing, but I don't see the fs module in this series
> of patches.  Could linux-fsdevel be cc'd on the development of Rust
> support for filesystems in the future?

In order to provide example drivers and kernel modules, we need to
have some safe abstractions for them, thus we are adding some as we
need them.

More importantly, the abstractions also serve as a showcase of how
they may be written in the future if Rust support is merged.

This does not mean these abstractions are a final design or that we
plan to develop them independently of subsystem maintainers. In fact,
we would prefer the opposite: in the future, when the support is
merged and more people start having more experience with Rust, we hope
that the respective kernel maintainers start developing and
maintaining the abstractions themselves.

But we have to start somewhere, and at least provide enough examples
to serve as guidance and to show that it is actually possible to write
abstractions that restrict the amount of unsafe code.

And, of course, if you are already interested in developing them, that
would be actually great and we would love your input and/or that you
join us.

As for the `fs` module, I see in lore 2 patches didn't make it
through, but I didn't get a bounce (I do get bounces for the
rust-for-linux ML, but I was told that was fine as long as LKML got
them). Sorry about that... I will ask what to do.

Meanwhile, you can see the patches in this branch:

    https://github.com/Rust-for-Linux/linux.git rust-next

Cheers,
Miguel
