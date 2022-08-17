Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B465979BA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Aug 2022 00:43:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M7NN32FN3z3c3J
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Aug 2022 08:43:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XIWINdBl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::34; helo=mail-oa1-x34.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XIWINdBl;
	dkim-atps=neutral
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com [IPv6:2001:4860:4864:20::34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M7NMQ3xV5z2xrK
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Aug 2022 08:42:56 +1000 (AEST)
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-11c5505dba2so3250261fac.13
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Aug 2022 15:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=vJ56H4HHvdOEMXdVFBYNUPdgSXtxD8je+p7tgo3xp+A=;
        b=XIWINdBlm5TS4jOlsPceVH2dmu3LBWJlovIs+j2AuwKL0XTyDXSxX01FkSQTnyf0Vh
         ftu8cZXWCF7MbPuPHGMtOmJ0w+M0SFa9SSGbZXi5SUI2xZWLfD07/dca5x7qCROUHYQ8
         WqVnzWNDRLfs7GdfK6lDg/Ca1Dey9JiGHSdui+qBmwOeYsow5N8qRTUWNShCh6UzXiQq
         QXN0/GjpdkJzIyMHYy3S7vnKYiYU8GGlYl4rvimx0LoW7MMHwkpf9RR2tVV6+hqJIEuB
         NVYJ20fHy+ck6OkIdFi4wtHu2+S2lNCkRCOxM2b3Deq2JpZuR523mD6SrGR7redBLSi4
         aYfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=vJ56H4HHvdOEMXdVFBYNUPdgSXtxD8je+p7tgo3xp+A=;
        b=fsnXDaqHZJ/OWxy6DBUeHY9bDvc9iwwoCbw271b4LolDXA57rHWnT4Dgktu9WvMfbg
         2oNqVd/Nq9H3laAHn/0oBTvC9KXvFeUHHESs8b7GDWv7i4pkSTVyCaN+Lck7NY1kOfiJ
         fchWWM0RqJr8uFodd5NUhiqPbQgnQiaSnzSO/+nS6fMo0VVAImuv1kXSnOBIUMloKO3P
         tyFe2zcto41QjeglTLsPqDoMUrrNz6wVe3S+1E9lppW7BMuo+bOTlmxivs97VzVoKOHk
         9uNqQjiND90MgEzM2emYDzA/3qjRbZxtKEQYpNF3cw4HbRDEkxVlLSHNsJuDlvO9Peht
         zc+Q==
X-Gm-Message-State: ACgBeo2M+T0tCTTT65BGR/eVzOG7+R4Fd/SloBs/64UmNQMVNkVFSAIa
	5KDjNmToiVSiiUa4nOKpFQI62Y9y4HypXjwEup8=
X-Google-Smtp-Source: AA6agR4pM4EalGAbyux0BG08SI5+/4TnznXhO7kXWQlvmYlVx3u054RnqrzzKxCyvK+opTCtVaw2C/ESacsMZKYMWGQ=
X-Received: by 2002:a05:6871:783:b0:101:3d98:ba86 with SMTP id
 o3-20020a056871078300b001013d98ba86mr2804128oap.132.1660776170197; Wed, 17
 Aug 2022 15:42:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220802015052.10452-1-ojeda@kernel.org> <20220802015052.10452-28-ojeda@kernel.org>
 <CAK8P3a0jqhGY9E85VC9gNem5q6-dWeq0H6-7bhJopinMnLtOKQ@mail.gmail.com>
 <CANiq72nNucEhXAXkXSujnGkpQrkv3-Pcn7ua8N=2XB-suAjs9w@mail.gmail.com> <rYTolA_zKqIX3oCL_i-vlIqKS99s0bYQmRKAdcScDq0mcyxti3imzP7AvJzBpiI6RAuH5RU5BpU4xuEY1Vzq57CuY5v47tO3SuUNAMd7seM=@protonmail.com>
In-Reply-To: <rYTolA_zKqIX3oCL_i-vlIqKS99s0bYQmRKAdcScDq0mcyxti3imzP7AvJzBpiI6RAuH5RU5BpU4xuEY1Vzq57CuY5v47tO3SuUNAMd7seM=@protonmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 18 Aug 2022 00:42:37 +0200
Message-ID: <CANiq72mp4pgfszjM5t6zgLOBFTmUO4oZkbMxHhekbiNwUe9YLw@mail.gmail.com>
Subject: Re: [PATCH v8 27/31] Kbuild: add Rust support
To: =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>
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
Cc: Sven Van Asbroeck <thesven73@gmail.com>, Philip Herron <philip.herron@embecosm.com>, Catalin Marinas <catalin.marinas@arm.com>, "H. Peter Anvin" <hpa@zytor.com>, Miguel Cano <macanroj@gmail.com>, Albert Ou <aou@eecs.berkeley.edu>, Paul Mackerras <paulus@samba.org>, Gary Guo <gary@garyguo.net>, Douglas Su <d0u9.su@outlook.com>, linux-riscv@lists.infradead.org, Finn Behrens <me@kloenk.de>, Will Deacon <will@kernel.org>, Martin Rodriguez Reboredo <yakoyoku@gmail.com>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, rust-for-linux@vger.kernel.org, Richard Weinberger <richard@nod.at>, Masahiro Yamada <masahiroy@kernel.org>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Arthur Cohen <arthur.cohen@embecosm.com>, Ingo Molnar <mingo@redhat.com>, Wedson Almeida Filho <wedsonaf@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, Antonio Terceiro <antonio.terceiro@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Antoni Boucher <bouanto@zoho.com>, Adam 
 Bratschi-Kaye <ark.email@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>, linux-um@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Tiago Lam <tiagolam@gmail.com>, Borislav Petkov <bp@alien8.de>, David Gow <davidgow@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, Dariusz Sosnowski <dsosnowski@dsosnowski.pl>, linux-arm-kernel@lists.infradead.org, Michal Marek <michal.lkml@markovi.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Boris-Chengbiao Zhou <bobo1239@web.de>, Jarkko Sakkinen <jarkko@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Daniel Xu <dxu@dxuuu.xyz>, Johannes Berg <johannes@sipsolutions.net>, Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 17, 2022 at 6:11 PM Bj=C3=B6rn Roy Baron
<bjorn3_gh@protonmail.com> wrote:
>
> There is already a prototype of such a driver. It can be found at https:/=
/github.com/Rust-GCC/cargo-gccrs. Unlike what the name suggests it is not c=
argo specific. It consists of two binaries. The first calls cargo, but tell=
s it to use the second binary instead of a real rustc. This second part the=
n translates all arguments to what gccrs expects. It is possible to directl=
y invoke this second binary. For now it probably won't work for rust-for-li=
nux though as it doesn't have all arguments that are used by rust-for-linux=
 implemented.

I spoke with them about this a few weeks ago, but I thought it was
best to leave it up to the GCC Rust folks to detail how they will
proceed if they already know.

> As alternative to GCC Rust there is also github.com/rust-lang/rustc_codeg=
en_gcc/ which uses libgccjit as backend for the official rust compiler rath=
er than writing a full Rust frontend for GCC from scratch. With a bit of pa=
tching to force it to be used, I was able to compile all Rust samples with =
GCC using rustc_codegen_gcc. However it gives warnings of the following kin=
d:
>
>     ld.lld: warning: rust/built-in.a(core.o):(.data.rel.local) is being p=
laced in '.data.rel.local'
>
> And hangs very early in the boot process. If I enable early logging, it p=
rints up to "Booting the kernel." and then does nothing. This is probably b=
ecause support for setting a different relocation model is not yet implemen=
ted. I opened https://github.com/rust-lang/rustc_codegen_gcc/issues/205 for=
 this.

Thanks Bj=C3=B6rn for giving it a go!

Arnd maintains a set of cross-GCC binaries for kernel developers, so I
assumed he was mainly interested in including GCC Rust there -- I
didn't mean to leave `rustc_codegen_gcc` aside! :) In fact, a few
weeks ago I also spoke with Antoni (Cc'd too!) about whether he would
be interested in getting it to work with Rust for Linux soon, whether
and how we could help him, etc.

In any case, both GCC Rust and  `rustc_codegen_gcc` will be present in
Kangrejos and LPC (Rust MC), so hopefully we will discuss the details
face-to-face!

> There may be other issues, but rustc_codegen_gcc is probably going to be =
the easiest route towards a LLVM free rust-for-linux build. By the way note=
 that rust-bindgen which we use for generating rust bindings from C headers=
 depends on LLVM. See https://github.com/rust-lang/rust-bindgen/issues/1949=
.

Yeah, `rustc_codegen_gcc` is possibly going to happen sooner than GCC
Rust for the kernel.

As for `bindgen`, it is indeed a pain point. There are several
possibilities we have been considering (GCC backend in `bindgen`, an
equivalent tool in GCC, something based on other parsers, something
else entirely, "just checking the results" approaches, even convincing
upstream Rust that C header support would be amazing for Rust
uptake... ;-). Ideally we would get funding to have somebody working
on the problem, but we will see.

Cheers,
Miguel
