Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBEC5972BB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Aug 2022 17:14:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M7BPc3d1dz3c2M
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Aug 2022 01:14:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=QylPRZ7p;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::134; helo=mail-il1-x134.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=QylPRZ7p;
	dkim-atps=neutral
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M7BP231xdz2yn5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Aug 2022 01:13:40 +1000 (AEST)
Received: by mail-il1-x134.google.com with SMTP id w8so3785933ilj.5
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Aug 2022 08:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=1Aw1dSa3JPytcA6jepz8LxW98jZGIVvGrbA5oXW6cF4=;
        b=QylPRZ7po85CmoykNUCyneM7mjy0jfxW6cm0tMG76VU+SEJs1TOHYjvUgCyJ5X34Ah
         29R7oZJhhLUIaE/wB+fpvInm0t+Qtil2d7DsxFJO50ROSKqBTc4hrnQGXwMIq6mca6hs
         54+kXi+r5dpmDFccUSfnuFBS3sWyt6leP9lY9G9/jXs02kwOe+87RXKykgBUvBdu+VxK
         zgC40tcbIxY+/ARk2CL5sgZZPmfoBBvLljwObz/HD90zb/2wCmgAigALmX3sUAZMaM6/
         yYvXO5L6d8RGEEhjCx/i99yVgYsx0VSd+Ea2XG0jsxBYGj9nUTR57UcZ9Som18Y15zyH
         eUjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=1Aw1dSa3JPytcA6jepz8LxW98jZGIVvGrbA5oXW6cF4=;
        b=MHL+gJfLBzUWrLrELT7vYAhBSyAe2DGWqJyX3D+MA2rR/14ooO5odNtbcrrxdvOseN
         1ACyZEXCTJBAOSjg5QJPqSbehCnHgoGDsBg6CsVShM3dJ9gziaD25o+2aHyfj+b3Hctw
         jiynjtU2tPOIAx/IzbgGC6SYLj41Tw2SNtnb/XqxE6Y8K3XIl1tFkPaNXPwBtVl6AKep
         ZkPM3KBc2DyNupvZivsrz/9ogSqOLi286ONXKy9mkAsF4j4IQJcW99ybN6lDbEiuPULJ
         kn7irn4t/o3H1EdSEQrC5MT7WP0nZkOhAdrYejR3SOAlV7QxtStmI+450cEmetjf7DFg
         Jlvw==
X-Gm-Message-State: ACgBeo2C96Wq1dCSbtQCd+6oLJ3FbwW7dILu1Qt0FHnVS9vNOvfFR1Kb
	BZRStCMhQ6cjue1XVuiuVHD5Wt1eiHWVXdlwUdo=
X-Google-Smtp-Source: AA6agR76oTCoP2K9omiY3xisTcRhkl/VGb6FFCKu/kjjdtf4CwkBwADBK/ZOKLvdnvOPta40wh5R8EYE/TiRBIyFijg=
X-Received: by 2002:a05:6e02:1522:b0:2e5:9e3c:a7c8 with SMTP id
 i2-20020a056e02152200b002e59e3ca7c8mr8021588ilu.237.1660749216849; Wed, 17
 Aug 2022 08:13:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220802015052.10452-1-ojeda@kernel.org> <20220802015052.10452-28-ojeda@kernel.org>
 <CAK8P3a0jqhGY9E85VC9gNem5q6-dWeq0H6-7bhJopinMnLtOKQ@mail.gmail.com>
In-Reply-To: <CAK8P3a0jqhGY9E85VC9gNem5q6-dWeq0H6-7bhJopinMnLtOKQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 17 Aug 2022 17:13:25 +0200
Message-ID: <CANiq72nNucEhXAXkXSujnGkpQrkv3-Pcn7ua8N=2XB-suAjs9w@mail.gmail.com>
Subject: Re: [PATCH v8 27/31] Kbuild: add Rust support
To: Arnd Bergmann <arnd@arndb.de>
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
Cc: Sven Van Asbroeck <thesven73@gmail.com>, Philip Herron <philip.herron@embecosm.com>, Catalin Marinas <catalin.marinas@arm.com>, "H. Peter Anvin" <hpa@zytor.com>, Miguel Cano <macanroj@gmail.com>, Albert Ou <aou@eecs.berkeley.edu>, Paul Mackerras <paulus@samba.org>, Gary Guo <gary@garyguo.net>, Douglas Su <d0u9.su@outlook.com>, linux-riscv@lists.infradead.org, Finn Behrens <me@kloenk.de>, Will Deacon <will@kernel.org>, Martin Rodriguez Reboredo <yakoyoku@gmail.com>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, Richard Weinberger <richard@nod.at>, Masahiro Yamada <masahiroy@kernel.org>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Arthur Cohen <arthur.cohen@embecosm.com>, Ingo Molnar <mingo@redhat.com>, Wedson Almeida Filho <wedsonaf@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, Antonio Terceiro <antonio.terceiro@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Adam Bratschi-Kaye <ark.email@gmail.com>, Dave Hansen <dave.hansen@linux
 .intel.com>, rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>, linux-um@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, =?UTF-8?Q?Bj=C3=83B_6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Tiago Lam <tiagolam@gmail.com>, Borislav Petkov <bp@alien8.de>, David Gow <davidgow@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, Dariusz Sosnowski <dsosnowski@dsosnowski.pl>, linux-arm-kernel@lists.infradead.org, Michal Marek <michal.lkml@markovi.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Boris-Chengbiao Zhou <bobo1239@web.de>, Jarkko Sakkinen <jarkko@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Daniel Xu <dxu@dxuuu.xyz>, Johannes Berg <johannes@sipsolutions.net>, Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Arnd,

On Wed, Aug 17, 2022 at 4:40 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> Hi Miguel,
>
> I tried enabling rust support in the gcc builds I provide at
> https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/arm64/12.1.0/

Thanks for giving it a go!

> to make this more accessible, but it appears that the command line
> options here are not portable:
>
>  /home/arnd/cross/x86_64/gcc-12.1.0+rust-nolibc/x86_64-linux/bin/x86_64-linux-gccrs

So you mean with GCC Rust, right? (i.e. we have "GCC builds" working,
via compiling the Rust side with LLVM and linking with the GCC C side,
but it is not intended for production or to be supported, even if we
cover it in our CI, test it boots and loads modules etc.).

Indeed, `gccrs` does not support `rustc` flags yet. I am not sure if
the GCC Rust team will eventually provide a driver for those like
clang does for e.g. `cl` -- I would hope they do, since many projects
would benefit from it, but maybe they plan to start simply by
modifying Cargo to call them as they need instead.

If they don't support it, we will have to map the flags on our side --
it should not be a big problem. However, see below...

> I guess nobody has tried this so far. Would you think that fixing this is only
> a matter for fixing the build system to pass the correct flags depending on the
> compiler, or is this broken in a more fundamental way?

If you meant GCC Rust, then it is a bit too early for the compiler. As
far as I now, they are working on compiling the `core` crate and
supporting more stable language features. They are also researching
the integration of the borrow checker, though we wouldn't need that
for "only" compiling the kernel.

Now, if they decided to focus on supporting Rust for Linux early on
(which would be great), they would still need to work on the delta
between what what they target now and what we use (which includes both
stable and some unstable features), plus I assume infrastructure bits
like the platform (target spec) support, the flags / `rustc` driver
(though I would be happy to do as much as possible on our side to
help), etc.

(We privately talked about possible timelines for all that if they
were to focus on Rust for Linux etc., but I let them comment or not on
that... Cc'ing them! :)

Cheers,
Miguel
