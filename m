Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 551D94F9B49
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Apr 2022 19:03:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KZl222cznz3bZq
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Apr 2022 03:03:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=k/HNWFMW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::136;
 helo=mail-il1-x136.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=k/HNWFMW; dkim-atps=neutral
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KZl1L6vccz2xvW
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Apr 2022 03:02:46 +1000 (AEST)
Received: by mail-il1-x136.google.com with SMTP id t4so6853858ilo.12
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Apr 2022 10:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+cmSU0Va28wW3Wv27B01VfHd9CC4OB3jfpn/xb5rpDI=;
 b=k/HNWFMWUhwt5qbzB1IFJsSLxCUYI+nUO25IG7WP0fG4xUGslpD7gKg8IgZyAe2Z5T
 XTkga/PZ7VkogQDCJUAvDf+jS5PdNFlfp2Sfyvtma0bfgOLuV4TULJVHCVc+TADLwsXQ
 fSAeFByQvHnpplIJfZbugAjZoRxjB8bj69g+X7yNEWHVX9EgRXYihshUH3DxwFwD+b30
 Jt7m5F0KXE8CaOQpNOi0ObrsZt6tlXk0Xbqcpa1k3nRlsWqsquZVqGcqeb/db6D70r55
 +u8NeL9/JhKD4GVWqqEkYllK28NpQmzHgbDBVhW4kGssvNffQAI4/QCquN3Kpj3DmMjZ
 9giA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+cmSU0Va28wW3Wv27B01VfHd9CC4OB3jfpn/xb5rpDI=;
 b=Zr6KtA/VZTyJy4iyfD9ZOAkn/VM8YkSaxRX5inEOmJqsT7ljzpjOXqsmlT8p2MpJYK
 UokN327+IUPfenPEEvsbfCWWJSA6ZJy3Dbug25n31s43JVW7gE0Qiw/IoXc2BrUvV09p
 ae6TDGtFVrr9xPC+XNZoeXHDcbAHZAuK5ZICbo5JDSjySRHKeuQEaMjEBY8c1KfBGd1/
 g4e+cvKdxPIFbpKFzh31iWjgS5tLQqDlfilkpdq0kgzpbgYB75l+5Bvolm+u0T106ApF
 4Ugn58pwl1UzDn/Z/PjcdozcuJFM4PTss3iHFA6FTk8TFKBDlusnWvqS5IhigH3VSPff
 qnZg==
X-Gm-Message-State: AOAM531kYQ1Hxw9VcbDA5N5B3hhjpGoRfhHFaFEZ+V/iO8cDFkB0KJJr
 pgCZNCVTkxxtNdMlF4vwOVrrNTOVglElBkkpBLo=
X-Google-Smtp-Source: ABdhPJxuX89crWnUYos8OlxCY0JszVtXNikV3THYVoau7sPe8UOdn4n0i+tRO5nTSPvJh54DHbIACrJtJqwLHCU1HcU=
X-Received: by 2002:a05:6e02:1846:b0:2c7:b032:5d92 with SMTP id
 b6-20020a056e02184600b002c7b0325d92mr9261539ilv.237.1649437361331; Fri, 08
 Apr 2022 10:02:41 -0700 (PDT)
MIME-Version: 1.0
References: <CANiq72k+5Rdj7i3Df2dcE6_OPYPXK3z5EWLKnY56sSMz4G3OvA@mail.gmail.com>
 <CAABZP2z64aYWfVSdXHaQopWc+BAbJJUGqtrju2iWER3DDTDFWg@mail.gmail.com>
 <20220406170012.GO4285@paulmck-ThinkPad-P17-Gen-1>
 <87pmls6nt7.fsf@mpe.ellerman.id.au>
 <87k0bz7i1s.fsf@mpe.ellerman.id.au>
In-Reply-To: <87k0bz7i1s.fsf@mpe.ellerman.id.au>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 8 Apr 2022 19:02:30 +0200
Message-ID: <CANiq72=UXURR-caoXrP7zQNWmeKRtzZGRwF1iTi9svZEuHP22g@mail.gmail.com>
Subject: Re: rcu_sched self-detected stall on CPU
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
Cc: rcu <rcu@vger.kernel.org>, Zhouyi Zhou <zhouzhouyi@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Nicholas Piggin <npiggin@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 8, 2022 at 4:42 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> The Rust CI has it disabled because I copied that from the x86 defconfig
> they were using back when I added the Rust support. I think that was
> meant to be a stripped down fast config for CI, but the result is it's

Indeed, that was my intention when I created the original config.

> So I'll send a patch to turn HIGH_RES_TIMERS on for the Rust CI, and we
> can debug this further without blocking them.

Thanks! I can also do it on your behalf, if you prefer, when I sync with -rc1.

Cheers,
Miguel
