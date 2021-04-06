Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 65525354ABA
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Apr 2021 04:05:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FDrT338d6z3bc4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Apr 2021 12:05:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=KrXRPuMg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b30;
 helo=mail-yb1-xb30.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=KrXRPuMg; dkim-atps=neutral
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FDrSY2TN0z2xxm
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Apr 2021 12:04:42 +1000 (AEST)
Received: by mail-yb1-xb30.google.com with SMTP id l187so8294791ybl.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Apr 2021 19:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IsKpKFLiT3wtx5cqMiTmG28Qg3N24IRmgcB1sqJgkUM=;
 b=KrXRPuMgZin9BnvnaEjvBbaSjaMIa7j8Wac4CAR1vuc3H+okPo3Exhi4jfEnzVKdYe
 zm7srCO6+52uSWkWbX2c63C8aHCfWdCPyV25Vha0FMXmyumnkJyUxWzYOIR7idG/SPCm
 RG7hIcIjNi4DV3OYOWDGGSgaYe7jh8Azi8CbAVVsZz29tCsKfTq6S6xUdvDK5UQMTBhM
 87uh59c0jzpSD4QP57mj/jIK6Br0khsl/DrmEw2k3o2GflgIiuB+6JgUPxT/LJyekzXq
 10z05/F7uBZdz4au0bLCpkCy9coVxgsE5SgJLCHULpMLgozjSfYj92naTswZF2ai7eka
 wmmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IsKpKFLiT3wtx5cqMiTmG28Qg3N24IRmgcB1sqJgkUM=;
 b=q/5+7uNSEyVndWtYA+ov7ejoINI/8AmTF0lQFLQsmJuFQ61TndrRTpbgf2Z03wKZrX
 bcWvqEN4rQRa/jot0NSe7gp4uX/rm1qtSOD+yJGmF2HB/mylTMw6jbg969W5D5aCLyOh
 SzyMeLjTYkDDUr7yeduwRRDel/M7xVGW+/Wd/BS20aRrdmvnLEDBtib2If0+mI5QDVrd
 o3GOUTkqXhG0RrDghtXKLDYyn2MKow6YsO40DUakRR5hp7srqQn/z1TqvywvZH/Gtkbp
 Yjl8hF79ISv9NOFt3Gz8wO4NUtXz7XGE3+Dc0wwfXKoxHNbd5rlPj7Tw9N4lvHrkCEmv
 uX0Q==
X-Gm-Message-State: AOAM533ellFXQkx8jvy+e+IuD/PBbPX/RYK9zbN0pHB8yUZhkwTcB2CR
 5OYeIMuqTQsovuOamTTdIafOi/7JW7rPrbvPmpAWv7LSGIo=
X-Google-Smtp-Source: ABdhPJzaulgJzRtp2Fz3Pt2ZA0SErSHJuyrwz0wWBKokuHOai7Yj49yC6hxNAvO/8BA+n5ZZk1uZ8DSXA8JLYMq6prg=
X-Received: by 2002:a25:5146:: with SMTP id f67mr39455657ybb.332.1617674674539; 
 Mon, 05 Apr 2021 19:04:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210225032108.1458352-1-jniethe5@gmail.com>
 <20210225032108.1458352-3-jniethe5@gmail.com>
 <87czve15v5.fsf@mpe.ellerman.id.au>
In-Reply-To: <87czve15v5.fsf@mpe.ellerman.id.au>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Tue, 6 Apr 2021 12:04:23 +1000
Message-ID: <CACzsE9rcECYEBYpUCd=F0P3kNv5o7_2LqycFTsjFabTVgwxR5A@mail.gmail.com>
Subject: Re: [PATCH 3/3] powerpc/sstep: Always test lmw and stmw
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 2, 2021 at 12:39 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Hi Jordan,
>
> Jordan Niethe <jniethe5@gmail.com> writes:
> > Load Multiple Word (lmw) and Store Multiple Word (stmw) will raise an
> > Alignment Exception:
> >   - Little Endian mode: always
> >   - Big Endian mode: address not word aligned
> >
> > These conditions do not depend on cache inhibited memory. Test the
> > alignment handler emulation of these instructions regardless of if there
> > is cache inhibited memory available or not.
> >
> > Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> > ---
> >  .../powerpc/alignment/alignment_handler.c     | 96 ++++++++++++++++++-
> >  1 file changed, 94 insertions(+), 2 deletions(-)
>
> Because of dd3a44c06f7b ("selftests/powerpc: Only test lwm/stmw on big endian")
> this will need a respin sorry.
>
> You'll need to add macros to generate lmw/stmw using .long, to avoid the
> bug fixed in that commit.
Thanks, I will resend.
>
> cheers
