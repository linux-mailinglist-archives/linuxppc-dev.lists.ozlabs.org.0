Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2774B376A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Feb 2022 19:33:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jwzcq4x7Lz3cQN
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Feb 2022 05:32:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Kd9daEZT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d31;
 helo=mail-io1-xd31.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Kd9daEZT; dkim-atps=neutral
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jwzc95r7Zz2yPv
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Feb 2022 05:32:24 +1100 (AEDT)
Received: by mail-io1-xd31.google.com with SMTP id e79so15254952iof.13
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Feb 2022 10:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1ZU/xBo4v5syghhPRoThoLn4tvhr/EqUMFObZCi2t6k=;
 b=Kd9daEZTG01vUunj9KpOq4Tlqe0AR4jwzTryhBoDOCJdLk42Frgjx5QOJZwOdTvdN+
 5w6brYZzwx55wGfNgrwE5v2ZviNe+FwzOcEXZPCCTgxQWcbXWgChRoh9HLPVEVDETjmk
 d9NsqcqbTXHDOtZwjLE4n7UUOIUFvneVQT9KKksB5OsjSpk+CJtKwm0ffErWL3d2MpWN
 On531QRK/Woo9hRSZ7uKcmAR96JfoYJd8xqRGQzqkPPWOgOCuepjsbD/2jefhJ/MmnQc
 IukF4P2PM+zgNqEx4bpvhAl9Kl8kSD/iYMM6o+K44UEiQElLwa5b9FHlYd9VVslmOe1J
 G1yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1ZU/xBo4v5syghhPRoThoLn4tvhr/EqUMFObZCi2t6k=;
 b=i7gY4gL42pZB95ojsVHdiUQ7veT4zZAqodyH/eRVhCyqAYNHlBuPykXo3UUVHv8CCU
 uoWH8oQJICWtxWmyIVW4n3ZncIJ6xyGhhYr5pRCsiB5hZXaP23KPKNE7FmnGbmwwQ0Vo
 pUMqQwGm6pceioHh3DWudDldI3qqxaKbmdIuvnxqvGmEoT8VAy0K84FX59gqlwkU/T7O
 EDrK9x9qXrCpbfS0IZ0XKt/M9LvwfJDxcK/Q9ENfnMdhVJmlmBSL8Ouz4DrztVRA45nV
 zK658hzqFhDjQbg0bKZRNG6fzkfqOkgH2z3UDIRJ99Yzfhz5bEMsecRf/gtYNtYhokHj
 V4Cw==
X-Gm-Message-State: AOAM5323jnnWj93waXY1IHu3he97ywYNWm+g0vYu0yefnflyHYzbRUDj
 0fv84r7dL0In8WxhYLWZQupUhlaDqWzdC4weFdQ=
X-Google-Smtp-Source: ABdhPJxhKfrcH+lK8uelMajrMeOApGW6jMfAwT6cR0dIvA+JEuKlkp7IRqBjao43DlOrigol+LGAzUNojko+nvrOueg=
X-Received: by 2002:a05:6638:4105:: with SMTP id
 ay5mr4155184jab.186.1644690741790; 
 Sat, 12 Feb 2022 10:32:21 -0800 (PST)
MIME-Version: 1.0
References: <20220212130410.6901-1-ojeda@kernel.org>
 <20220212130410.6901-17-ojeda@kernel.org>
 <YgfBUhYdLXA46kOX@shell.armlinux.org.uk>
 <CANiq72nMhUH1s0HMeLb+hfp5=u3h20ryC4uqAgB1Znuq52e=Pw@mail.gmail.com>
 <Ygfd82QN/wmSmlHa@shell.armlinux.org.uk>
In-Reply-To: <Ygfd82QN/wmSmlHa@shell.armlinux.org.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 12 Feb 2022 19:32:10 +0100
Message-ID: <CANiq72mdru-MyP_QoRSpKu1bhB8v5sZNs8mvGdWsJp7NfXE+bQ@mail.gmail.com>
Subject: Re: [PATCH v4 16/20] Kbuild: add Rust support
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
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
Cc: Sven Van Asbroeck <thesven73@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Miguel Cano <macanroj@gmail.com>,
 Paul Mackerras <paulus@samba.org>, Gary Guo <gary@garyguo.net>,
 Douglas Su <d0u9.su@outlook.com>, Borislav Petkov <bp@alien8.de>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Wedson Almeida Filho <wedsonaf@google.com>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Antonio Terceiro <antonio.terceiro@linaro.org>,
 Miguel Ojeda <ojeda@kernel.org>, Adam Bratschi-Kaye <ark.email@gmail.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 rust-for-linux <rust-for-linux@vger.kernel.org>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Daniel Xu <dxu@dxuuu.xyz>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Dariusz Sosnowski <dsosnowski@dsosnowski.pl>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Michal Marek <michal.lkml@markovi.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Boris-Chengbiao Zhou <bobo1239@web.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Finn Behrens <me@kloenk.de>, Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Feb 12, 2022 at 5:19 PM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> Right, so why made it dependent on CPU_32v6 || CPU_32v6K if ARMv7 is
> supported? What about CPU_32v7? What about CPU_32v7M?
>
> I think it would be saner to use the CPU_V6, CPU_V6K, CPU_V7 and maybe
> CPU_V7M here - even bettern to select "HAVE_RUST" from these symbols,
> since I'm sure you'd start to see the issue behind my "HAVE_RUST"
> suggestion as it means having four symbols just for 32-bit ARM on your
> dependency line.

To support arch variations properly we also have to configure the
compiler via filling a target spec on the fly, but so far we only have
a few static variations as an example. This is one of the missing
parts of the arch support. I will let you know when we have something
ready.

> Interestingly, it does not list arm-unknown-linux-gnueabihf, which
> is the "tuple" commonly used to build 32-bit ARM kernels.

I see it there (Tier 2).

> Probably because people incorrectly think it's required or some other
> minor reason. As I say:

In that case, we should remove them and warn about those instances,
assuming the preferred style is to not have it.

> so using the argument
> that there are "500+ instances" and therefore should be seen as
> correct is completely misguided.

I did not use any such argument.

> I mean, if we end up with, e.g. a filesystem coded in Rust, that
> filesystem will not be available on architectures that the kernel

As long as that filesystem is an optional feature (or as long as there
is a C version), it should be fine.

> supports until either (a) Rust gains support for that architecture

For this, it would be ideal if entities behind some of the
architectures could support LLVM & ClangBuiltLinux, or the GCC Rust
frontend, or the GCC backend for `rustc`.

For instance, Arm is supporting both LLVM and the Rust project.

> or (b) someone re-codes the filesystem in C - at which point, what
> is the point of having Rust in the kernel?

Having a C version of some system does not mean a Rust version would
not offer advantages. In fact, we are adding Rust precisely because we
believe it offers some advantages over C, for both end users and
maintainers.

(Please see the RFC [1], previous discussions, etc.)

[1] https://lore.kernel.org/lkml/20210414184604.23473-1-ojeda@kernel.org/

Cheers,
Miguel
