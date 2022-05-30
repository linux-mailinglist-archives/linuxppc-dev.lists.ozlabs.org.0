Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB92537CC0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 May 2022 15:40:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LBc466scwz3btY
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 May 2022 23:40:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=cSzwr5IN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d2b; helo=mail-io1-xd2b.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=cSzwr5IN;
	dkim-atps=neutral
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LBc3X2b8kz2yL2
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 May 2022 23:40:07 +1000 (AEST)
Received: by mail-io1-xd2b.google.com with SMTP id s23so11323538iog.13
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 May 2022 06:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gIwe3AKRbCHeJRE3dPTatS7K/6ILlXUNL6T/HNDhAhU=;
        b=cSzwr5INM0XMJMTjfBIFqC6i5S58eV8gcJa/64rR0gDugFmRTU5nQgL16eOHpgeMFI
         7AfIC/ykpu26A1o3tWj6uRAXJg8F8QVvcvAIxqOgTwk//2oTGuNDuWVqcGupsqpPcM6T
         ZRAJqMTcOk2f0Pg5Sqy8051E3rZJH3I33bcAioIyj1QEd+htYi69FlxTGKOOn4GcVjjE
         pEirF1LZJZUjhxfS+0GnGmUhc97QLgfasJMGHXk9cu2E+2pU6QcPUuPNv5BRpstZpwXX
         9NoZsAOpE0EVU3IryTlU5mkC2xM3qI4IbFyk9WdwRkwSVZe45lL2Nx+m0vwWNHCFkswg
         kaCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gIwe3AKRbCHeJRE3dPTatS7K/6ILlXUNL6T/HNDhAhU=;
        b=4lUZUBduQoxqRyZ0Tojud+fVoVx0HNsWYHWUYoK3xnjsd3gONiUiW6Wd7gX4ZermWs
         d/joU/4HGo1xvqK03HKh8V8togcPRVRkAT53OhtR2qhY8K1/Wir48ZLWKYXWE9o91gI2
         Mw14cOWtGJq8MqKuScGNlBIjy6K4HpKFwbMXtzY37Pqcuw2VUi52KGtIoVjEvNpjkBqu
         Ha8KcQUefkxu+N0PZLzxBvn1aAXT/bC92PzN+2pG94M7kWiUFzABmv07jtD1Kh9jAS/r
         oxALikABo4egZ0Bvhha1X0ZyBgk1FVnAxE+IilwEHsZps8cijAL6tbdjR9RQYKAdHlN1
         7DbA==
X-Gm-Message-State: AOAM531Yv85A8LHEELhgcLT6MElUxugtQPteDS9Uudyqc8EZa2MQH3/i
	T1/mIrrnYLsXL2ohEkEYwQWk7GLZD61NTKfcUiY=
X-Google-Smtp-Source: ABdhPJynB3luYlUIXTTDca8c2gxMygZVtlz0csg40D16eodRT8Q+xqzjGbylbRXxbzD+mvxPI5WGRexbTj0PrTzr1DM=
X-Received: by 2002:a05:6638:f89:b0:32e:89f4:e150 with SMTP id
 h9-20020a0566380f8900b0032e89f4e150mr27799661jal.308.1653918002647; Mon, 30
 May 2022 06:40:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220523020209.11810-1-ojeda@kernel.org> <20220523020209.11810-22-ojeda@kernel.org>
 <CAKwvOdn+9qORm8UpDGnPXxiK7B7P_TW5CtXv1+8qkv7UvQr3hQ@mail.gmail.com>
In-Reply-To: <CAKwvOdn+9qORm8UpDGnPXxiK7B7P_TW5CtXv1+8qkv7UvQr3hQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 30 May 2022 15:39:51 +0200
Message-ID: <CANiq72n2bU3LSGu-4v66nif_95EVq--z2X_F2V7JBPU8v=h8EA@mail.gmail.com>
Subject: Re: [PATCH v7 21/25] Kbuild: add Rust support
To: Nick Desaulniers <ndesaulniers@google.com>
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
Cc: Sven Van Asbroeck <thesven73@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Miguel Cano <macanroj@gmail.com>, Paul Mackerras <paulus@samba.org>, Gary Guo <gary@garyguo.net>, Douglas Su <d0u9.su@outlook.com>, Borislav Petkov <bp@alien8.de>, linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, "H. Peter Anvin" <hpa@zytor.com>, Masahiro Yamada <masahiroy@kernel.org>, "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>, Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, Wedson Almeida Filho <wedsonaf@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, Antonio Terceiro <antonio.terceiro@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, Adam Bratschi-Kaye <ark.email@gmail.com>, Albert Ou <aou@eecs.berkeley.edu>, rust-for-linux <rust-for-linux@vger.kernel.org>, Linux Kbuild mailing list <linux-kbui
 ld@vger.kernel.org>, Boqun Feng <boqun.feng@gmail.com>, linux-um@lists.infradead.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Daniel Xu <dxu@dxuuu.xyz>, David Gow <davidgow@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, Dariusz Sosnowski <dsosnowski@dsosnowski.pl>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Michal Marek <michal.lkml@markovi.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel <linux-kernel@vger.kernel.org>, Boris-Chengbiao Zhou <bobo1239@web.de>, Jarkko Sakkinen <jarkko@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Richard Weinberger <richard@nod.at>, Finn Behrens <me@kloenk.de>, Johannes Berg <johannes@sipsolutions.net>, Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 26, 2022 at 12:25 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> Is there a reason to not just turn clippy on always? Might be nicer to
> start off with good practices by default. :^)

The idea crossed my mind too [1], but sadly Clippy disables some
optimizations and in general is not intended to be used for normal
compilation [2].

[1] https://github.com/rust-lang/rust-clippy/issues/8035
[2] https://github.com/rust-lang/rust-clippy/pull/8037

> Are there *.rmeta directories that we _don't_ want to remove via `make
> mrproper`? I'm curious why *.rmeta isn't just part of MRPROPER_FILES?

Putting them in `MRPROPER_FILES` would mean only those in a given
directory are removed (e.g. the root one), but the idea here is to
find them anywhere in the tree, since in the future we may have
library crates in different parts of the tree.

However, I am not sure I understand your first question in relation
with the second one -- if we put them in `MRPROPER_FILES`, that would
remove less, not more.

> I don't think we need to repeat dir/* here again for rust. The
> existing targets listed above (outside this hunk) make sense in both
> contexts.

The idea here is to document the differences (e.g. `RUSTFMT`) and that
we may have other targets in the future that do not apply to C (e.g.
MIR dump, if that happens to be useful).

But maybe I can fit that in the normal place and make it still look
good... I will give it a try.

> Does rustc really use .i as a conventional suffix for macro expanded
> sources? (The C compiler might use the -x flag to override the guess

It is not a conventional suffix at all as far as I am aware.

Maybe we should use a different one to aid editors and users anyway,
e.g. `.rsi`, similar to `.mi` for Objective-C `.m` files.

> it would make based on the file extension; I'm curious if rustc can
> ingest .i files or will it warn?)

The macro expanded output is not intended to be used as a compilable
input, but as a debugging aid only. I can note this there.

Having said that, `rustc` accepts the "preprocessed" output in the
sense that it will just treat them as normal source files (no flag
needed, and e.g. both `.i` and `.rsi` work); however, it may give new
diagnostics or may require extra flags to enable some compiler
features.

From a quick test, I managed to compile a "preprocessed" Rust kernel
module with only command-line changes. But if we really wanted to
support this, we would need to ask upstream Rust to actually support
it.

> Are these two kconfigs used anywhere?

Not for the moment, but it could still be useful when getting
`.config` reports (and we could add it to `LINUX_COMPILER` etc. in the
future).

> How does enabling or disabling debug info work for rustc? I may have
> missed it, but I was surprised to see no additional flags getting
> passed to rustc based on CONFIG_DEBUG info.

`-Cdebuginfo=` is the one; by default there is no debug info and that
option enables it (i.e. it is not just the level but the enablement
too).

(Note that in userspace, when compiling a common program, you will get
some debug info coming from the standard library and other
dependencies).

> Ah, that explains the host rust build infra.  Bravo! Hard coding the
> target files was my major concern last I looked at the series. I'm
> very happy to see it be generated properly from .config!
>
> I haven't actually reviewed this yet, but it makes me significantly
> more confident in the series to see this approach added. Good job
> whoever wrote this.

Thanks! I thought Rust would be a nice option for writing hostprogs,
though of course for the moment only programs that can assume Rust is
there may use it.

Note that non-x86 specific options need to be handled properly still
(e.g. move things between the arch Makefiles and the hostprog as
needed).

I would still want to see compilers come to some kind of common format
for this as we discussed other times, but... :)

> Does `$(READELF) -p .comment foo.o` print anything about which
> compiler was used? That seems less brittle IMO.

Currently, `rustc` does not add a `.comment` section; but we could
ask, I sent [3].

If debug info is enabled, another way is using the `DW_AT_language`
attribute, like `pahole` will be doing for a new option we need [4].
However, we would still need a way for the other case.

In any case, I am not sure something like `.comment` is less or more
brittle -- compilers could in theory change it (e.g. not emitting it),
while adding a symbol is something we control. So different kinds of
brittleness.

[3] https://github.com/rust-lang/rust/pull/97550
[4] https://git.kernel.org/pub/scm/devel/pahole/pahole.git/commit/?id=8ee363790b7437283c53090a85a9fec2f0b0fbc4

Cheers,
Miguel
