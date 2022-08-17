Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EACDE597355
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Aug 2022 17:56:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M7CLH0GHNz3c8C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Aug 2022 01:56:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=arndb.de (client-ip=212.227.17.13; helo=mout.kundenserver.de; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M7CKp0947z2ynh
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Aug 2022 01:55:56 +1000 (AEST)
Received: from mail-ej1-f46.google.com ([209.85.218.46]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1M3DBb-1oKktX324b-003h5E for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Aug
 2022 17:55:50 +0200
Received: by mail-ej1-f46.google.com with SMTP id tl27so25318230ejc.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Aug 2022 08:55:50 -0700 (PDT)
X-Gm-Message-State: ACgBeo0SNr6jJtlw2NN8+UKyUXnhb9/iAZs0lVo8tHXt0g7MyYiT2I5f
	BHQ+7xpqSXF3OVeuk6cosfFeKqR4oG+b2UOS/3w=
X-Google-Smtp-Source: AA6agR6Zf7lY1qLm89sTihdpHsj0aQ4umr8ol/DRSTBvAYEQUmT2uPZZqvLUfFS8neOBi78/JbDKpYlk6svZGBrs0nY=
X-Received: by 2002:a05:6402:520e:b0:43d:df14:fbed with SMTP id
 s14-20020a056402520e00b0043ddf14fbedmr23980070edd.16.1660749886667; Wed, 17
 Aug 2022 08:24:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220802015052.10452-1-ojeda@kernel.org> <20220802015052.10452-28-ojeda@kernel.org>
 <CAK8P3a0jqhGY9E85VC9gNem5q6-dWeq0H6-7bhJopinMnLtOKQ@mail.gmail.com> <CANiq72nNucEhXAXkXSujnGkpQrkv3-Pcn7ua8N=2XB-suAjs9w@mail.gmail.com>
In-Reply-To: <CANiq72nNucEhXAXkXSujnGkpQrkv3-Pcn7ua8N=2XB-suAjs9w@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 17 Aug 2022 17:24:30 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2YuGsSJY2-=npqXMHXEr+zaF36iDrM+kP=9nS85FLpbA@mail.gmail.com>
Message-ID: <CAK8P3a2YuGsSJY2-=npqXMHXEr+zaF36iDrM+kP=9nS85FLpbA@mail.gmail.com>
Subject: Re: [PATCH v8 27/31] Kbuild: add Rust support
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:nrpLlqioxCNmFN6sIixYkXmowB6GMyF7QPt7RyP9ySZbPKVrrYV
 N5v+WtAfE+IdHpI0EYftficOMsMi4WUQLzFm8poJ0VUdW2ZGem3I72hZUkxFH9pxn5vEvO+
 sEYc98808608ohZr3EtNbEuGavV0cgCwJA7qPSn0zl9chi+SceXKgP5w58329ySOsyKSRpA
 XydVlQfnxiKItmoxx0p1Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZrFtu0xB8C4=:5RZQJ45e1jlObNqyVK06LF
 n6hc6SQWJpFXfgzs5G7wsV08kAPbQSufqEn9DOhJ0CXI5jDT5lghox+q4mi4ijZUODTUIZxuY
 RI4HWbZuKrEd5wUyoi/Is5hzn92EdB9wdBX+BwJ+q8WRdmsrt3gq5LPZUqQqPd12b6hIJGpJH
 Ki+wWkeXYBvcxqvDxDrIw12+x7gw8WzWi95tNNj9H0chCYNuFESPjILIbTO8p0VyxV4vSca/A
 ga1kh3iOjrVHnS2VQqfu5Cy3wX1tpzZ5ImdVAEhVsvOsLQT45gKMMZ9dfX69v0bGNZuk6vyCv
 1ylLGTyO9uLExCEUNzlTlLL/6KEvajqbAwR9qLM+ZV1AzcxFN5h3x15zfdJOpn9/Af0Hj5X+m
 qBAF2Qfi6+xK0r7B2blrLUigZ67cIJSWV3hwqhjG5dhMewhxBWY3giJm9ENi74tMuWBrH9win
 aOw9DdSiJ4lPBQq+M8+vzNWYBnlidApxTeUn8AydNFjlSpaG5mFRVB9dnjXtB4Pnpyk+5O8Oc
 QxWUDIWuh65RiJJKTRD9kYqWD9JSCjPDTtVR5q+P8QcT4zfld91gxMLzycBuq3YkaJMxs/djA
 bBWJOCaGdJpiLKRm0PZ8elK8P+ekTWSMusOuLpvJ5QEyHC8PLslJlmcE4j1chODGaIsE3vLmn
 bNpm+SFUFYkBZekgesWan3Xh+pdbLfq/RWp+DI5t98ESleaiZ2WlvAwIH6bwWJQjsKrnbSGck
 GcrnF8KpfKF9xjz6Cbc1xPHW0xu9Fyg8BQCr8j/4wVnWNs+VEiNnSHpfC28OSFlLBPuzHZkW3
 /s0MDidR5SWGLM2pxyufP4O5TzCpWijvWh+yG7gxfCWIQ17YGV1+nSAJ76+L2eJXupRqf60sP
 TrjtFg1rxlP7SBw6LQlw==
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
Cc: Sven Van Asbroeck <thesven73@gmail.com>, Philip Herron <philip.herron@embecosm.com>, Catalin Marinas <catalin.marinas@arm.com>, "H. Peter Anvin" <hpa@zytor.com>, Miguel Cano <macanroj@gmail.com>, Albert Ou <aou@eecs.berkeley.edu>, Paul Mackerras <paulus@samba.org>, Gary Guo <gary@garyguo.net>, Douglas Su <d0u9.su@outlook.com>, linux-riscv@lists.infradead.org, Finn Behrens <me@kloenk.de>, Will Deacon <will@kernel.org>, Martin Rodriguez Reboredo <yakoyoku@gmail.com>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, rust-for-linux@vger.kernel.org, Richard Weinberger <richard@nod.at>, Masahiro Yamada <masahiroy@kernel.org>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Arthur Cohen <arthur.cohen@embecosm.com>, Ingo Molnar <mingo@redhat.com>, Wedson Almeida Filho <wedsonaf@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, Antonio Terceiro <antonio.terceiro@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Adam Bratschi-Kaye <ark.email@gmail.com>
 , Dave Hansen <dave.hansen@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>, linux-um@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, =?UTF-8?Q?Bj=C3=83B_6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Tiago Lam <tiagolam@gmail.com>, Borislav Petkov <bp@alien8.de>, David Gow <davidgow@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, Dariusz Sosnowski <dsosnowski@dsosnowski.pl>, linux-arm-kernel@lists.infradead.org, Michal Marek <michal.lkml@markovi.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Boris-Chengbiao Zhou <bobo1239@web.de>, Jarkko Sakkinen <jarkko@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Daniel Xu <dxu@dxuuu.xyz>, Johannes Berg <johannes@sipsolutions.net>, Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 17, 2022 at 5:13 PM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
> On Wed, Aug 17, 2022 at 4:40 PM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > I tried enabling rust support in the gcc builds I provide at
> > https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/arm64/12.1.0/
>
> Thanks for giving it a go!
>
> > to make this more accessible, but it appears that the command line
> > options here are not portable:
> >
> >  /home/arnd/cross/x86_64/gcc-12.1.0+rust-nolibc/x86_64-linux/bin/x86_64-linux-gccrs
>
> So you mean with GCC Rust, right? (i.e. we have "GCC builds" working,
> via compiling the Rust side with LLVM and linking with the GCC C side,
> but it is not intended for production or to be supported, even if we
> cover it in our CI, test it boots and loads modules etc.).

Yes, I meant GCC rust, with the contents of
https://gcc.gnu.org/git/?p=gcc.git;a=shortlog;h=refs/heads/devel/rust/master
merged into the gcc-12.1.0 release tag.

> > I guess nobody has tried this so far. Would you think that fixing this is only
> > a matter for fixing the build system to pass the correct flags depending on the
> > compiler, or is this broken in a more fundamental way?
>
> If you meant GCC Rust, then it is a bit too early for the compiler. As
> far as I now, they are working on compiling the `core` crate and
> supporting more stable language features. They are also researching
> the integration of the borrow checker, though we wouldn't need that
> for "only" compiling the kernel.
>
> Now, if they decided to focus on supporting Rust for Linux early on
> (which would be great), they would still need to work on the delta
> between what what they target now and what we use (which includes both
> stable and some unstable features), plus I assume infrastructure bits
> like the platform (target spec) support, the flags / `rustc` driver
> (though I would be happy to do as much as possible on our side to
> help), etc.
>
> (We privately talked about possible timelines for all that if they
> were to focus on Rust for Linux etc., but I let them comment or not on
> that... Cc'ing them! :)

Thanks for the explanation. My hope was that building the kernel
would actually be easier here than building the more complicated
rust user space.

The gcc cross-compilers on kernel.org are similarly easy to build for
all architectures the kernel supports because the complexity is
usually in picking a working libc for the more obscure architectures,
so I was naively thinking that this would work for building the
rust support across all architectures in Linux.

I tried one more step and just removed the unsupported command
line flags to see what would happen, but that did not get me any
further:

/home/arnd/cross/x86_64/gcc-12.1.0+rust-nolibc/x86_64-linux/bin/x86_64-linux-gccrs
-frust-edition=2021 -Dunsafe_op_in_unsafe_fn -Drust_2018_idioms
-Dunreachable_pub -Dnon_ascii_idents
-Drustdoc::missing_crate_level_docs -Dclippy::correctness
-Dclippy::style -Dclippy::suspicious -Dclippy::complexity
-Dclippy::perf -Dclippy::let_unit_value -Dclippy::mut_mut
-Dclippy::needless_bitwise_bool -Dclippy::needless_continue  -O
/git/arm-soc/scripts/generate_rust_target.rs; mv
scripts/generate_rust_target.d scripts/.generate_rust_target.d; sed -i
'/^#/d' scripts/.generate_rust_target.d
rust1: internal compiler error: Segmentation fault
0x7f37ee04b51f ???
./signal/../sysdeps/unix/sysv/linux/x86_64/libc_sigaction.c:0
0x7f37ee032fcf __libc_start_call_main
../sysdeps/nptl/libc_start_call_main.h:58
0x7f37ee03307c __libc_start_main_impl
../csu/libc-start.c:409
Please submit a full bug report, with preprocessed source (by using
-freport-bug).
Please include the complete backtrace with any bug report.
See <https://gcc.gnu.org/bugs/> for instructions.

      Arnd
