Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7147F4B92
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Nov 2023 16:50:34 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Lf41l0og;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sb5LJ5ZQMz3dDP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Nov 2023 02:50:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Lf41l0og;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=masahiroy@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sb5KP62kWz2yDM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Nov 2023 02:49:45 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 98EBBB8264D
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Nov 2023 15:49:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F13FDC433C8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Nov 2023 15:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700668179;
	bh=BYCJA3x5TTAbbQPMEAHdhxb9CpYziBSEh7qg5KYFc3Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Lf41l0og8Tssr/hb/ubSBpyXsbiBnPgG2tAw23ddfqRwz1CZu59t60YaMYFHd8bRo
	 8iLpKtrocyaGbjEHRv4usmFfoRkieMPxaEUIlXxPhWmvy6QEByllSsydUjXkWK830b
	 o3jHhP7F1ioMa2Q+Nxwy7Bpem4ZYprHsFuTIYVYWq+/yWnkJ81xXBKJz+MqMeNarcX
	 2rVGUTJGdLOEngFCjMvoNtpm9shzVCPsFgNhFOZtMfwH1S0avG5tuSRA4ZdCACJ8s0
	 I4ydnXS2p4dHVC7dnvadHyP/eaEqAg+Jy9xt2mgoScn8uKLm/G1MguQEqc9iUtVctN
	 PXqAqIzofO9Fg==
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-1f938410f92so1900565fac.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Nov 2023 07:49:38 -0800 (PST)
X-Gm-Message-State: AOJu0YzSjKc3M25vSZDwQ9WaAtQYYSZws1XZRMdFecp/9f7QEi2u+six
	3WIxs/g6VpUpVzX0kguz6HOXSNOgduGIqYuNdIk=
X-Google-Smtp-Source: AGHT+IGTa6C9d+mB8rUW3KBSbfG6/zDIsmWbZmbmj2c74lexp3YXviv1PGHzD95lJw6SS5pitC5dIey5qGrQgDzlQ+w=
X-Received: by 2002:a05:6870:cb97:b0:1e9:919d:83ec with SMTP id
 ov23-20020a056870cb9700b001e9919d83ecmr3553401oab.28.1700668178329; Wed, 22
 Nov 2023 07:49:38 -0800 (PST)
MIME-Version: 1.0
References: <20231118025748.2778044-1-mmaurer@google.com>
In-Reply-To: <20231118025748.2778044-1-mmaurer@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 23 Nov 2023 00:49:01 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQt8fy5+vSwpd1aXfzjzeZ5hiyW7EW9SW7pbG2eTJZAOA@mail.gmail.com>
Message-ID: <CAK7LNAQt8fy5+vSwpd1aXfzjzeZ5hiyW7EW9SW7pbG2eTJZAOA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] MODVERSIONS + RUST Redux
To: Matthew Maurer <mmaurer@google.com>
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
Cc: Nicolas Schier <nicolas@fjasle.eu>, rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, Laura Abbott <laura@labbott.name>, linuxppc-dev@lists.ozlabs.org, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Nov 18, 2023 at 11:58=E2=80=AFAM Matthew Maurer <mmaurer@google.com=
> wrote:
>
> The goal of this patch series is to allow MODVERSIONS and RUST to be
> enabled simultaneously. The primary issue with doing this at the moment
> is that Rust uses some extremely long symbol names - for those
> unfamiliar with Rust, it may be helpful to think of some of the mangled
> C++ names you may have seen in binaries in the past.
>
> Previously, Gary Guo attempted to accomplish this by modifying the
> existing modversion format [1] to support variable-length symbol names.
> This was unfortunately considered to be a potential userspace break
> because kmod tools inspect this kernel module metadata. Masahiro Yamada
> suggested [2] that this could instead be done with a section per-field.
> This gives us the ability to be more flexible with this format in the
> future, as a new field or additional information will be in a new
> section which userspace tools will not yet attempt to read.
>
> In the previous version of this patchset, Luis Chamberlain suggested [3]
> I move validation out of the version checking and into the elf validity
> checker, and also add kernel-docs over there. I found
> elf_validity_cached_copy to be fairly dense and difficult to directly
> describe, so I refactored it into easier to explain pieces. In the
> process, I found a few missing checks and added those as well. See
> [PATCH 2/5] for more details. If this is too much, I'm more than happy
> to drop this patch from the series in favor of just adding the
> kernel-doc to the original code, but figured I'd offer it up in case the
> added clarity and checks were valuable.
>
> [1] https://lore.kernel.org/lkml/20230111161155.1349375-1-gary@garyguo.ne=
t/
> [2] https://lore.kernel.org/lkml/CAK7LNATsuszFR7JB5ZkqVS1W=3DhWr9=3DE7bTf=
+MvgJ+NXT3aZNwg@mail.gmail.com/
> [3] https://lore.kernel.org/lkml/ZVZNh%2FPA5HiVRkeb@bombadil.infradead.or=
g/





I want to know why this is useful.


To clarify my question, let me first explain
what the modversion is.



In C, a function callee and callers must agree
with the interface of the function.


This is usually done by having a function prototype
in a header file.


Say, we have a function declaration

    int foo(int x, int y);

in include/linux/foo.h


Then, the C file that defines foo() and all C files
that call it must include <linux/foo.h> so that
argument mismatch can be detected.




Same for EXPORT_SYMBOL; the symbol provider and consumers
must agree with the interface of exported symbols.

In the kernel, however, there is no promise for in-kernel ABI
compatibility across different kernel versions.
The kernel only promises the compatibility of the userspace interface.


To load modules, by principle, vmlinux and modules must have
the same version.

To slightly loosen the limitation, CONFIG_MODVERSIONS was
introduced; when it is enabled, you can load a module
as long as all the prototypes of exported symbols match.

To do this, we need to encode information about prototypes.


This is done by a tool called genksyms (scripts/genksyms/genksyms).



Say, we have this code:


int foo(int x, int y)
{
     // genksyms does not care about
     // the function body.
}
EXPORT_SYMBOL(foo);


Genksyms parses the code and computes a CRC value for 'foo'.
Genksyms is only interested in the function name and its prototype.

It sees

   int foo(int, int)

and it transforms it into a CRC.


Any change to the prototype results in a
different CRC, so the module subsystem
can check the interface compatibility
before loading a module.


It is obvious that this is impossible for Rust source
because scripts/genksyms/genksyms is only able to
parse C code.


Then, what is happening here?

See rust/exports.c


  #define EXPORT_SYMBOL_RUST_GPL(sym) extern int sym; EXPORT_SYMBOL_GPL(sym=
)


The global scope symbols in Rust (i.e. 'pub) are automatically
exported, and all of them are visible as 'int' variables
from C world.


Genksyms will see this code:

  extern int foo;
  EXPORT_SYMBOL_GPL(foo);

Of course, this is not a true prototype.
The real signature on the Rust side might be:

  fn foo(x: i32, y: i32) -> i32


So, even if you enable CONFIG_MODVERSIONS,
nothing is checked for Rust.
Genksyms computes a CRC from "int foo", and
the module subsystem confirms it is a "int"
variable.

We know this check always succeeds.

Why is this useful?






> Matthew Maurer (5):
>   export_report: Rehabilitate script
>   modules: Refactor + kdoc elf_validity_cached_copy
>   modpost: Extended modversion support
>   rust: Allow MODVERSIONS
>   export_report: Use new version info format
>
>  arch/powerpc/kernel/module_64.c |  25 +-
>  init/Kconfig                    |   1 -
>  kernel/module/internal.h        |  18 +-
>  kernel/module/main.c            | 663 +++++++++++++++++++++++++-------
>  kernel/module/version.c         |  43 +++
>  scripts/export_report.pl        |  17 +-
>  scripts/mod/modpost.c           |  37 +-
>  7 files changed, 642 insertions(+), 162 deletions(-)
>
> --
> 2.43.0.rc0.421.g78406f8d94-goog
>


--
Best Regards





Masahiro Yamada
