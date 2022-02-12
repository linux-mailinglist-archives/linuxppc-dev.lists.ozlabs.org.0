Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6531E4B377B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Feb 2022 19:57:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jx09T6cclz3bbS
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Feb 2022 05:57:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=n5D8bwCK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d30;
 helo=mail-io1-xd30.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=n5D8bwCK; dkim-atps=neutral
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jx08s1VdDz2xtp
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Feb 2022 05:57:16 +1100 (AEDT)
Received: by mail-io1-xd30.google.com with SMTP id m185so15349063iof.10
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Feb 2022 10:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PW5bHK7lbz8mAfQVLbpabS9JQmvxuuP5i13vS9JUmWQ=;
 b=n5D8bwCKZRUGpl68+OwDfJK+AQroTXijhLf+Ev2Dbodadyb6WRz6/fX9TzoLv5JY44
 vKXzGhsqvNG0b1NNUEa1R2yJntFRgZVvW8w2wrpRBfSWda7h6ZxvPtJrBrf7yYHVOrwG
 vAfadKq2gwnHNR05HepbxldrYBHyblxQyutjIhO/hkKuz8jVpizo184RCyuaFwUdEEMB
 gDMdiJYy6LOQ+V5N1zvv/KQitEvAl4D/B6TT8xoaot76ok9JaRjP2+PcQoyjgjVx3f6a
 lXTyQk2kypAbwHMmpvW3hdXfwbXpl8GXVhdG++7HxqqIr3Iu7+Tp6uJUOhRFTYsDQXUJ
 gPwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PW5bHK7lbz8mAfQVLbpabS9JQmvxuuP5i13vS9JUmWQ=;
 b=rtSR9jUuxz0sGGsniZy+1epIMP8I1+s/iCSnmrvafPTLqYi19bp4/6c8I2otXxY/HX
 36jcwbcMjUFzGJtpovKowVdnyPbxrqugrPE/jAxVv32vr3lOzGaiIkdbEN+C6nMK/+Tu
 oNmk2x1YY/igwUKV9yDRZk7PhM6D46mRFZHdteCQ0dU6iS7BDHfcEBHtaQVM9vAQePog
 6Y4yp6iFo/5CFpzq0GKQ8M3ZbHomEOpdYS3CmYRJjhw8ukwCJgI2HnpBqAtVMpsSQD+d
 EISCiVKjlU9J9SWN3GlDHpn6t/I1GC4ukI3MYJVrKKz0SQaQwFI+kWSRciybqCv8n0l2
 9xww==
X-Gm-Message-State: AOAM5320bvIidoWyoDi1oGSUnNXFmqmVSxVFdt5r0nMjkyG+rMopFprj
 zJqrtjhxldWnyduDfYns3QtZDB5nOi98PWL57as=
X-Google-Smtp-Source: ABdhPJzk7Y0eW6BAf4q+QY2CyD1I+LhA8kHRLDkHhRJc6kXcI3wPehj/4lCy3W2LRh5ctFx5JYUIvMk52bxjHJ2CH2Q=
X-Received: by 2002:a5d:941a:: with SMTP id v26mr3564701ion.64.1644692234068; 
 Sat, 12 Feb 2022 10:57:14 -0800 (PST)
MIME-Version: 1.0
References: <20220212130410.6901-17-ojeda@kernel.org>
 <0396e38b-f681-a035-b6ea-21127fdf5615@physik.fu-berlin.de>
In-Reply-To: <0396e38b-f681-a035-b6ea-21127fdf5615@physik.fu-berlin.de>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 12 Feb 2022 19:57:02 +0100
Message-ID: <CANiq72=U3A-5LfbOThPoex9PfFg+UsHuMY33nbtLH=aK=odh0Q@mail.gmail.com>
Subject: Re: [PATCH v4 16/20] Kbuild: add Rust support
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
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
 Dave Hansen <dave.hansen@linux.intel.com>,
 =?UTF-8?B?TWlndWVsIENhw7Fv?= <macanroj@gmail.com>,
 Paul Mackerras <paulus@samba.org>, Gary Guo <gary@garyguo.net>,
 Douglas Su <d0u9.su@outlook.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Russell King - ARM Linux admin <linux@armlinux.org.uk>,
 Linus Torvalds <torvalds@linux-foundation.org>, Ingo Molnar <mingo@redhat.com>,
 Wedson Almeida Filho <wedsonaf@google.com>,
 Alex Gaynor <alex.gaynor@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Adam Bratschi-Kaye <ark.email@gmail.com>, Albert Ou <aou@eecs.berkeley.edu>,
 rust-for-linux <rust-for-linux@vger.kernel.org>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>,
 Antonio Terceiro <antonio.terceiro@linaro.org>, Borislav Petkov <bp@alien8.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Finn Behrens <me@kloenk.de>,
 Dariusz Sosnowski <dsosnowski@dsosnowski.pl>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Michal Marek <michal.lkml@markovi.net>, Greg KH <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Boris-Chengbiao Zhou <bobo1239@web.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Daniel Xu <dxu@dxuuu.xyz>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi John Paul,

On Sat, Feb 12, 2022 at 7:27 PM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
>
> Is there any particular reason why this list excludes MIPS*, i386, big-endian
> PowerPC and SPARC targets which are already supported by the Rust programming
> language?

The variations we have so far were intended to showcase the Rust
support in several major architectures, rather than cover everything.
But as long as LLVM (& the kernel, i.e. ClangBuiltLinux) supports the
target (and as long there are no compiler/toolchain issues), you
should be able to try it.

> Are the arch/$ARCH/rust/target.json files everything that's needed for supporting
> the other targets?

Mostly -- there is also `rust/kernel/c_types.rs` and you may need to
tweak `rust/compiler_builtins.rs`, but not much more.

Note that for the target spec files, the short-term plan is to
generate dynamically the target spec file according to what the
architecture requests, instead of using these static files. Longer
term, we need a Rust-stable way to setup custom targets from upstream
`rustc` (though it is not clear yet how it will look, e.g. it could be
via command-line flags).

Cheers,
Miguel
