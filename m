Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BB9532D05
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 17:12:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6yPH4R7Zz3c8B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 May 2022 01:12:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Gx5DLI2+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::131;
 helo=mail-il1-x131.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Gx5DLI2+; dkim-atps=neutral
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6yNc6lNDz3bZc
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 May 2022 01:12:16 +1000 (AEST)
Received: by mail-il1-x131.google.com with SMTP id e9so7543430ilq.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 May 2022 08:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Gu6XrP09brfzVASce66siSDhg75Ij5bF3a/2sse9FTI=;
 b=Gx5DLI2+S6FgASvjmxzOMLEBTLLzoAeOJHUNf3qse7ftzHJRZNKIGlYfA7vzGBgRTO
 qTgrr/QrMpssZBVPExxUekM5wFpDSCMG20g+mdIisIrrqbSj8j8ach4aeT+H+1CPDjcY
 ofuIYAFZ0a1ST0nZaCgMaH9g0s8MDKoG8WUVuGjlCh3vgQMUp8zwHIFKbe8dhL1HhQTe
 sZWf5vyTao7FwxYkNnBY5UxCjXGw7WvpGDwAKwR0hZcAz9ljJn2ttXMG4oHl2DC/BtQd
 krQkv/WkL/ceZkaPabiR+mwCrn4tbOibG9mbSGHQ9sK9s67DEn4CdB96hUXVE/XXsJbF
 NRiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Gu6XrP09brfzVASce66siSDhg75Ij5bF3a/2sse9FTI=;
 b=ULt0gwGkyFNsBam5sXuAOhmlP0UAITpF119+vz6qH/GFq0vPm+y0SLYMtqn+DVOqdg
 fusTohyoFSplBHjhsSrnvvzTJYiPeNm0vDkQdRLEaZMzifVNPXC4WFhJua2C41ZH5wh9
 qxFq94qcrCYEzCJcV1j3daTGfKeRp5+a6plKPjRcExOe+2ijO0gbG/ckN4rkkvITrt7D
 FqZ/ZwzjtTH3On1J1wOdfNHQvTTFRDF/+uQqaROADsYMTG3chGONyb0dSI/d7z8ejS1/
 7Yo94WXBxjJhc5UOMzTUHUo/yMWqrjxF2r406RW2oR7t1dBTWCtOz9WO7qZYRhHeDJt5
 D14g==
X-Gm-Message-State: AOAM530ipTY/9RafVZsibJX2fZzRUzQUsfrvjV5d0uy7yyT8wkYXY8bS
 J6tfJuexDDMhR0wwTjPc9P6WTMDJblQGchs9aPc=
X-Google-Smtp-Source: ABdhPJxToNDnooDvM+F5z9jrpwZB87LsQbRXfl7xzsJlSJuT69wEeUzQA9y0IHhR27j6+JEjpMOS30/zFL5koffPamM=
X-Received: by 2002:a05:6e02:170b:b0:2cf:970f:6050 with SMTP id
 u11-20020a056e02170b00b002cf970f6050mr14549964ill.5.1653405130972; Tue, 24
 May 2022 08:12:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220523020209.11810-1-ojeda@kernel.org>
 <20220523020209.11810-22-ojeda@kernel.org>
 <CAKwvOdkTjxNEmCTnuH5f41WB50ef6ErBM2Kp2zJ-t9q_5U8rBA@mail.gmail.com>
In-Reply-To: <CAKwvOdkTjxNEmCTnuH5f41WB50ef6ErBM2Kp2zJ-t9q_5U8rBA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 24 May 2022 17:12:00 +0200
Message-ID: <CANiq72=QJsScPweqWO8w6t4wDKKd3ZWFkA6Dcto6qpJ8QcfgOg@mail.gmail.com>
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
Cc: Sven Van Asbroeck <thesven73@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Miguel Cano <macanroj@gmail.com>,
 Paul Mackerras <paulus@samba.org>, Gary Guo <gary@garyguo.net>,
 Douglas Su <d0u9.su@outlook.com>, Borislav Petkov <bp@alien8.de>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Masahiro Yamada <masahiroy@kernel.org>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>,
 Wedson Almeida Filho <wedsonaf@google.com>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Antonio Terceiro <antonio.terceiro@linaro.org>,
 Miguel Ojeda <ojeda@kernel.org>, Adam Bratschi-Kaye <ark.email@gmail.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 rust-for-linux <rust-for-linux@vger.kernel.org>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, linux-um@lists.infradead.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Daniel Xu <dxu@dxuuu.xyz>,
 David Gow <davidgow@google.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Dariusz Sosnowski <dsosnowski@dsosnowski.pl>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Michal Marek <michal.lkml@markovi.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Boris-Chengbiao Zhou <bobo1239@web.de>, Jarkko Sakkinen <jarkko@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Richard Weinberger <richard@nod.at>,
 Finn Behrens <me@kloenk.de>, Johannes Berg <johannes@sipsolutions.net>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 23, 2022 at 8:45 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> I'm super not into having the rust optimization level differ from the
> C optimization level.  This is just someone having too much fun
> wrapping every compiler flag in a kbuild option.  Either folks wan't

I mean, `Makefile`s are not my favorite pastime... :)

> smaller size or more optimizations. Allowing for RUST_OPT_LEVEL_S and
> CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE or RUST_OPT_LEVEL_3 and
> CONFIG_CC_OPTIMIZE_FOR_SIZE is just wacky nonsense that's going to
> make randconfig bug reports more confusing to tease out.

I think what is important is to decide whether extra levels, for C and
Rust, should be kept compile-able/maintained or not (I also replied in
the `-O1` for C thread [1]).

Note that the Rust side can be compiled as `-O0` or `-O1` at the
moment, which is something we do not have for the C side; thus having
only the C == Rust option means we will not have a configuration with
those anymore.

For me it is less complex to not have them, and I have not heard more
opinions on this, either for or against (apart from that thread
suggesting `-O1` for the C side), so if nobody else chimes in, I will
remove them.

[1] https://lore.kernel.org/lkml/CANiq72kySVvOQ7eqwe0Jzz3V0JTtrcqODHR9Ty4-sfDMdzP6XQ@mail.gmail.com/

Cheers,
Miguel
