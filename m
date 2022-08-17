Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D445971A8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Aug 2022 16:46:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M79n566f8z3drn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Aug 2022 00:46:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=arndb.de (client-ip=217.72.192.74; helo=mout.kundenserver.de; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
X-Greylist: delayed 308 seconds by postgrey-1.36 at boromir; Thu, 18 Aug 2022 00:45:40 AEST
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M79mh22Gbz3bTZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Aug 2022 00:45:39 +1000 (AEST)
Received: from mail-lj1-f172.google.com ([209.85.208.172]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MwgKC-1nRFRa2ecM-00yDXt for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Aug
 2022 16:40:24 +0200
Received: by mail-lj1-f172.google.com with SMTP id s9so13756492ljs.6
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Aug 2022 07:40:24 -0700 (PDT)
X-Gm-Message-State: ACgBeo1HXihVwRS/Ge5HPlYkKdxv8JDergWjmkS8S7/WALk0z6lS9KFa
	QMyqQsW8/d1nJt4SyVkJ6QqO8O5mjZfMb8yAWRs=
X-Google-Smtp-Source: AA6agR7iG7b/sKnfv3rtR0wMkiNVbuKu4gohq2MlJovs7t4zv9/h1/ech5e7m293ULb6jtgNsC4wsmH5KCjGWqjMolI=
X-Received: by 2002:a17:907:6da8:b0:730:8ed5:2df8 with SMTP id
 sb40-20020a1709076da800b007308ed52df8mr16850681ejc.75.1660747213344; Wed, 17
 Aug 2022 07:40:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220802015052.10452-1-ojeda@kernel.org> <20220802015052.10452-28-ojeda@kernel.org>
In-Reply-To: <20220802015052.10452-28-ojeda@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 17 Aug 2022 16:39:57 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0jqhGY9E85VC9gNem5q6-dWeq0H6-7bhJopinMnLtOKQ@mail.gmail.com>
Message-ID: <CAK8P3a0jqhGY9E85VC9gNem5q6-dWeq0H6-7bhJopinMnLtOKQ@mail.gmail.com>
Subject: Re: [PATCH v8 27/31] Kbuild: add Rust support
To: Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:T0sfSR/k0axbNhiFizyJpQmLAbgkjK4qJQiu9DQg66V1nXI3fTk
 Kylb4SArsBKi3hCbMTxodmypWe88MpO241apYyUUXxQgbr6ui8eE5wchcV4w4DbuRhDuoPd
 dO1dGWdmZ6weEc/tlbaO1Mi3fyaXyNdmRYQri/TbGTb6oHya0fhJYpm++wZuqIq4bI+3DOi
 Iq1y61dJP5dAhFt6x6smg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:przmRNX0Zso=:Hzs+d/cJ7ZxChFr6tlLUiS
 Itvm3dewd7dJaarawQ9FnzpmTxeWJUtcUJRLeacrEEaQPx6MnlkFQl29DcpWuaBu3vdyytpRg
 4GS5MwpIoq8GussBDv1MySSABPIyJC8yyCk1aahhMpVCAOIgq0vdzrImm5w/skbBNJkzRRV5g
 ly1G3SatpHiKyYVFP/074srf7xA5uSFQalY7aiApluCN/zQBWTyyXjWw0V4L33VHslNs3AISc
 ZsiaRFp1+auhgwFl51V1sGbq5bavQFBR9FO89PQP4jUwpYvupfBbbEPd9qAbTM+rMuhwCcKfP
 4yMKmCNr4K0n5GALONvWLqzYHxlXHPj/Ce9URNq45nqxsSocbEnfbKy7KXBT90SQ0puEoaXtA
 nKSTDbZX/gJf18RI4tSZtunleDtDtQE5xiY3VIhnNovqap+KWy0mHKZqXu9B8HK/ie3cdmk41
 zGBHMAiZmK+FO/GjIDbVqeRGAYbSEc4pjmUnwQPvJoOMt/S3e2JdzTsQu8vAncHzXhjMDjhHX
 2xMoLWNmbl8uon08inRYDFwJYwnB80P3iTPHsCyXFPomRPRnPbfHj3AVsAiUHpK/xrc/Vh2R8
 crP5xnMB8o3pw/i2hyNlsR7Jm1ncSIirq3jRvub5EB84JdjgmB+B7YFe9zpRP8NlF0oSUmSzy
 oN3DFkmh6cx4Ve3XDmMaYcwrvf/Hw7BScpsabJmcRRccAdbS7R/3prUnj00W2knbM6abXeptC
 sr/enZiujUHRfIfXPmOm0a3IZGBtMLaauZyxUAYE+Kt7IG4lVbkZDawyACStjZtOYpUyPqdL7
 nlwr7FxSCtEI7lTufxc075VfIIucrlqBak6/aFFJrrBMgnU686MEyV0IBuhCdqtQzMB5XAd+t
 VjuiVJyL1Ndh+3N6ZOi1NpayYvi90/3QAxPVQ7usLxofJuDZynFNTdcLPXshF3nU88VJB4Jiv
 5lvFSfthXkwPILPtg+nWRGKwHmLNyGHqwOpqYp0i49GNEEtKlnybO
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
Cc: Sven Van Asbroeck <thesven73@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, "H. Peter Anvin" <hpa@zytor.com>, Miguel Cano <macanroj@gmail.com>, Albert Ou <aou@eecs.berkeley.edu>, Paul Mackerras <paulus@samba.org>, Gary Guo <gary@garyguo.net>, Douglas Su <d0u9.su@outlook.com>, linux-riscv@lists.infradead.org, Finn Behrens <me@kloenk.de>, Will Deacon <will@kernel.org>, Martin Rodriguez Reboredo <yakoyoku@gmail.com>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, Richard Weinberger <richard@nod.at>, Masahiro Yamada <masahiroy@kernel.org>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, Wedson Almeida Filho <wedsonaf@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, Antonio Terceiro <antonio.terceiro@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, Adam Bratschi-Kaye <ark.email@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>, linux-um@
 lists.infradead.org, linuxppc-dev@lists.ozlabs.org, =?UTF-8?Q?Bj=C3=83B_6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Tiago Lam <tiagolam@gmail.com>, Borislav Petkov <bp@alien8.de>, David Gow <davidgow@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, Dariusz Sosnowski <dsosnowski@dsosnowski.pl>, linux-arm-kernel@lists.infradead.org, Michal Marek <michal.lkml@markovi.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Boris-Chengbiao Zhou <bobo1239@web.de>, Jarkko Sakkinen <jarkko@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Daniel Xu <dxu@dxuuu.xyz>, Johannes Berg <johannes@sipsolutions.net>, Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 2, 2022 at 3:50 AM Miguel Ojeda <ojeda@kernel.org> wrote:
>
> +# These flags apply to all Rust code in the tree, including the kernel and
> +# host programs.
> +export rust_common_flags := --edition=2021 \
> +                           -Zbinary_dep_depinfo=y \
> +                           -Dunsafe_op_in_unsafe_fn -Drust_2018_idioms \
> +                           -Dunreachable_pub -Dnon_ascii_idents \
> +                           -Wmissing_docs \
> +                           -Drustdoc::missing_crate_level_docs \
> +                           -Dclippy::correctness -Dclippy::style \
> +                           -Dclippy::suspicious -Dclippy::complexity \
> +                           -Dclippy::perf \
> +                           -Dclippy::let_unit_value -Dclippy::mut_mut \
> +                           -Dclippy::needless_bitwise_bool \
> +                           -Dclippy::needless_continue \
> +                           -Wclippy::dbg_macro

Hi Miguel,

I tried enabling rust support in the gcc builds I provide at
https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/arm64/12.1.0/
to make this more accessible, but it appears that the command line
options here are not portable:

 /home/arnd/cross/x86_64/gcc-12.1.0+rust-nolibc/x86_64-linux/bin/x86_64-linux-gccrs
--edition=2021 -Zbinary_dep_depinfo=y -Dunsafe_op_in_unsafe_fn
-Drust_2018_idioms -Dunreachable_pub -Dnon_ascii_idents -Wmissing_docs
-Drustdoc::missing_crate_level_docs -Dclippy::correctness
-Dclippy::style -Dclippy::suspicious -Dclippy::complexity
-Dclippy::perf -Dclippy::let_unit_value -Dclippy::mut_mut
-Dclippy::needless_bitwise_bool -Dclippy::needless_continue
-Wclippy::dbg_macro -O -Cstrip=debuginfo -Zallow-features=
--emit=dep-info,link --out-dir=scripts/
/git/arm-soc/scripts/generate_rust_target.rs; mv
scripts/generate_rust_target.d scripts/.generate_rust_target.d; sed -i
'/^#/d' scripts/.generate_rust_target.d
x86_64-linux-gccrs: error: unrecognized command-line option
'--edition=2021'; did you mean '-frust-edition=2021'?
x86_64-linux-gccrs: error: unrecognized command-line option
'-Zbinary_dep_depinfo=y'
x86_64-linux-gccrs: error: unrecognized command-line option
'-Wmissing_docs'; did you mean '-Wmissing-braces'?
x86_64-linux-gccrs: error: unrecognized command-line option
'-Wclippy::dbg_macro'
x86_64-linux-gccrs: error: unrecognized command-line option '-Cstrip=debuginfo'
x86_64-linux-gccrs: error: unrecognized command-line option '-Zallow-features='
x86_64-linux-gccrs: error: unrecognized command-line option
'--emit=dep-info,link'
x86_64-linux-gccrs: error: unrecognized command-line option '--out-dir=scripts/'
make[3]: *** [/git/arm-soc/scripts/Makefile.host:157:
scripts/generate_rust_target] Error 1

I guess nobody has tried this so far. Would you think that fixing this is only
a matter for fixing the build system to pass the correct flags depending on the
compiler, or is this broken in a more fundamental way?

         Arnd
