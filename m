Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BFF597A03
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Aug 2022 01:14:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M7P3r0gddz3c8s
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Aug 2022 09:14:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=k1YA1pS6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::236; helo=mail-oi1-x236.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=k1YA1pS6;
	dkim-atps=neutral
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M7P3973KFz2xrC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Aug 2022 09:13:57 +1000 (AEST)
Received: by mail-oi1-x236.google.com with SMTP id w197so16946623oie.5
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Aug 2022 16:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=uAFZhRG94yqKesKWZYz5Nx3zn74jTlFRVSrtAcB7opM=;
        b=k1YA1pS6Eajn7sFpOI3x8NusjBtYGTLlphQCfOr2iifQhQYUaZT4rFqmLD/dnKP9b0
         utTJIDqQJUQkYqpDPJEQSpJJyYNfgsMs6oM0rq19CKnK4L95D5GfF+cXJl8IGJgwp3zi
         l8/2VaIIRMi4bLQ4ldVdetEpn6sUd8H3RC0bDOEMLSdFLYf/pm6WA4p9f3FBAmB/9mNO
         Ya+2NapCpC+1bkSFyYgo9K7XUiXikWQMDF89oUPh4N7c7kSVCLVYfHFf4RX2YmQD/BJ+
         RHahVZppC8tmZH9/nDlRSCFUHQ2Jjbnzz15ck+oNRgTfBuH2OYcBdWAaAK8ktADD0UsG
         Sepw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=uAFZhRG94yqKesKWZYz5Nx3zn74jTlFRVSrtAcB7opM=;
        b=UF1nZaL2V+7Og3Tw67GQxywVfgP3Zu5RCfbt2DHZMKLiaQV7NT5RGB2oU4XJcfY+w7
         G2t32kJAJ1IgLzfgS2ydqs9WtHuBWQr7DimB4Wd9M+pVfGFE5VNkRcnA9ZuyR55nNvMW
         euunyPJsZ/heO+llWAHNA3Y2oHLmPPyFMvY5liUl12JoA1/O2XmPB0ilJvwAzH/uxOD7
         l0emDJrGLwCIF5xLqiwZ/ZWV/PN1oQedBomh/pUPwWhEbQc1t2FYsXVnwMAmblR16tPb
         ZMmksLDX8HpcYR1W/kmixXWxNhZ7or5buxREX2jTSwW5B+UzX6TDNcFty0Ka46zfDwfD
         pmDg==
X-Gm-Message-State: ACgBeo27SfnUJ4+cqrvZVJZNxv9AfSzuAXXhRR6kllRYv516qaA15Z3K
	I0z+CwdQnvuq+bSvdyG2SwGW5KqgJ4lndo1P8UU=
X-Google-Smtp-Source: AA6agR5Gpv9Ub/ZSzw8wXnuwWJOg7P877U0UYF+ZIWdllhEPLwf7oW+lHlQM1was0sDQQVbiYoikM6dK3ZGBH+jke3Q=
X-Received: by 2002:a05:6808:4d2:b0:343:dc3:fa31 with SMTP id
 a18-20020a05680804d200b003430dc3fa31mr176406oie.120.1660778034487; Wed, 17
 Aug 2022 16:13:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220802015052.10452-1-ojeda@kernel.org> <20220802015052.10452-28-ojeda@kernel.org>
 <CAK8P3a0jqhGY9E85VC9gNem5q6-dWeq0H6-7bhJopinMnLtOKQ@mail.gmail.com>
 <CANiq72nNucEhXAXkXSujnGkpQrkv3-Pcn7ua8N=2XB-suAjs9w@mail.gmail.com> <CAK8P3a2YuGsSJY2-=npqXMHXEr+zaF36iDrM+kP=9nS85FLpbA@mail.gmail.com>
In-Reply-To: <CAK8P3a2YuGsSJY2-=npqXMHXEr+zaF36iDrM+kP=9nS85FLpbA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 18 Aug 2022 01:13:42 +0200
Message-ID: <CANiq72mW456PbD1WTkh0f=fhgO0FVdpjpXaT5cogXGT4BmKDjw@mail.gmail.com>
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

On Wed, Aug 17, 2022 at 5:51 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> Thanks for the explanation. My hope was that building the kernel

Don't mention it!

> would actually be easier here than building the more complicated
> rust user space.

Yeah, the kernel is complicated for them in different ways, so I
assume they will decide which bits to tackle first... Hopefully I will
succeed in my attempts to convince them to focus a bit on the kernel
at least ;)

> I tried one more step and just removed the unsupported command
> line flags to see what would happen, but that did not get me any
> further:

Thanks!

It looks like it failed when compiling the target spec generator,
which is a Rust host program. If they were to attempt the GCC Rust
support early on, we could make things easier for them by not
compiling host programs with gccrs.

By the way, feel free to remove all the `-D` flags ("denying") when
playing with it since they are related to diagnostics (making lints
errors that can still be bypassed if needed), in case the crash is
about handling those.

Cheers,
Miguel
