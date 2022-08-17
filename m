Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F4A597D15
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Aug 2022 06:22:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M7Wvf4F3nz3bnj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Aug 2022 14:22:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=IsDoc4np;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=protonmail.com (client-ip=185.70.41.103; helo=mail-41103.protonmail.ch; envelope-from=bjorn3_gh@protonmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=IsDoc4np;
	dkim-atps=neutral
X-Greylist: delayed 500 seconds by postgrey-1.36 at boromir; Thu, 18 Aug 2022 02:19:48 AEST
Received: from mail-41103.protonmail.ch (mail-41103.protonmail.ch [185.70.41.103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M7CsJ5BrJz3bXg
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Aug 2022 02:19:48 +1000 (AEST)
Date: Wed, 17 Aug 2022 16:11:02 +0000
Authentication-Results: mail-41103.protonmail.ch;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="IsDoc4np"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1660752671; x=1661011871;
	bh=D7wmN5qV4emk+fg1faj1v+A7IXjv09X2AsHUIrsCn0k=;
	h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
	 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
	 Feedback-ID:Message-ID;
	b=IsDoc4npeWk0r72wVIlqVnw1Z7A9wz2QzGggjZ0LMDtOAWxh+wgWqOxMimKAoNGPA
	 yQN4hx+K4ji7Zo2YxqmLF+UAutLDoxVMcJ5EiOksPgBWJNSTfvRP01jcLdgn+U/IHR
	 lXnXYbDak+b9zfyGitx64bR07jPvJyYjob9QCO1BPGcMIKqF9J+JjWjsL3zFXa06e8
	 N9wayJKKpjGwuTW5ohs6cw9SrMhUNZU/zi/Ag4HZHPPprbH7yJA/VSPu9aTVjB/7Os
	 cou5MU5UT4+ZoTjhexXmeuzWC0G1mjkOuHMhvDsrU4XPDLebMxpzFTvKSYtr/3IUaN
	 pv0TUeeu7un9Q==
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
From: =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>
Subject: Re: [PATCH v8 27/31] Kbuild: add Rust support
Message-ID: <rYTolA_zKqIX3oCL_i-vlIqKS99s0bYQmRKAdcScDq0mcyxti3imzP7AvJzBpiI6RAuH5RU5BpU4xuEY1Vzq57CuY5v47tO3SuUNAMd7seM=@protonmail.com>
In-Reply-To: <CANiq72nNucEhXAXkXSujnGkpQrkv3-Pcn7ua8N=2XB-suAjs9w@mail.gmail.com>
References: <20220802015052.10452-1-ojeda@kernel.org> <20220802015052.10452-28-ojeda@kernel.org> <CAK8P3a0jqhGY9E85VC9gNem5q6-dWeq0H6-7bhJopinMnLtOKQ@mail.gmail.com> <CANiq72nNucEhXAXkXSujnGkpQrkv3-Pcn7ua8N=2XB-suAjs9w@mail.gmail.com>
Feedback-ID: 27884398:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 18 Aug 2022 14:22:23 +1000
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
Reply-To: =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>
Cc: Sven Van Asbroeck <thesven73@gmail.com>, Philip Herron <philip.herron@embecosm.com>, Catalin Marinas <catalin.marinas@arm.com>, "H. Peter Anvin" <hpa@zytor.com>, Miguel Cano <macanroj@gmail.com>, Albert Ou <aou@eecs.berkeley.edu>, Paul Mackerras <paulus@samba.org>, Gary Guo <gary@garyguo.net>, Douglas Su <d0u9.su@outlook.com>, linux-riscv@lists.infradead.org, Finn Behrens <me@kloenk.de>, Will Deacon <will@kernel.org>, Martin Rodriguez Reboredo <yakoyoku@gmail.com>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, rust-for-linux@vger.kernel.org, Richard Weinberger <richard@nod.at>, Masahiro Yamada <masahiroy@kernel.org>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Arthur Cohen <arthur.cohen@embecosm.com>, Ingo Molnar <mingo@redhat.com>, Wedson Almeida Filho <wedsonaf@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, Antonio Terceiro <antonio.terceiro@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Adam Bratschi-Kaye <ark.email@gmail.com>
 , Dave Hansen <dave.hansen@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>, linux-um@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Tiago Lam <tiagolam@gmail.com>, Borislav Petkov <bp@alien8.de>, David Gow <davidgow@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, Dariusz Sosnowski <dsosnowski@dsosnowski.pl>, linux-arm-kernel@lists.infradead.org, Michal Marek <michal.lkml@markovi.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Boris-Chengbiao Zhou <bobo1239@web.de>, Jarkko Sakkinen <jarkko@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Daniel Xu <dxu@dxuuu.xyz>, Johannes Berg <johannes@sipsolutions.net>, Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wednesday, August 17th, 2022 at 17:13, Miguel Ojeda <miguel.ojeda.sandon=
is@gmail.com> wrote:

> Hi Arnd,
>=20
> On Wed, Aug 17, 2022 at 4:40 PM Arnd Bergmann arnd@arndb.de wrote:
>=20
> > Hi Miguel,
> >=20
> > I tried enabling rust support in the gcc builds I provide at
> > https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/arm64/12.=
1.0/
>=20
>=20
> Thanks for giving it a go!
>=20
> > to make this more accessible, but it appears that the command line
> > options here are not portable:
> >=20
> > /home/arnd/cross/x86_64/gcc-12.1.0+rust-nolibc/x86_64-linux/bin/x86_64-=
linux-gccrs
>=20
>=20
> So you mean with GCC Rust, right? (i.e. we have "GCC builds" working,
> via compiling the Rust side with LLVM and linking with the GCC C side,
> but it is not intended for production or to be supported, even if we
> cover it in our CI, test it boots and loads modules etc.).
>=20
> Indeed, `gccrs` does not support `rustc` flags yet. I am not sure if
> the GCC Rust team will eventually provide a driver for those like
> clang does for e.g. `cl` -- I would hope they do, since many projects
> would benefit from it, but maybe they plan to start simply by
> modifying Cargo to call them as they need instead.

There is already a prototype of such a driver. It can be found at https://g=
ithub.com/Rust-GCC/cargo-gccrs. Unlike what the name suggests it is not car=
go specific. It consists of two binaries. The first calls cargo, but tells =
it to use the second binary instead of a real rustc. This second part then =
translates all arguments to what gccrs expects. It is possible to directly =
invoke this second binary. For now it probably won't work for rust-for-linu=
x though as it doesn't have all arguments that are used by rust-for-linux i=
mplemented.

>=20
> If they don't support it, we will have to map the flags on our side --
> it should not be a big problem. However, see below...
>=20
> > I guess nobody has tried this so far. Would you think that fixing this =
is only
> > a matter for fixing the build system to pass the correct flags dependin=
g on the
> > compiler, or is this broken in a more fundamental way?
>=20
>=20
> If you meant GCC Rust, then it is a bit too early for the compiler. As
> far as I now, they are working on compiling the `core` crate and
> supporting more stable language features. They are also researching
> the integration of the borrow checker, though we wouldn't need that
> for "only" compiling the kernel.
>=20
> Now, if they decided to focus on supporting Rust for Linux early on
> (which would be great), they would still need to work on the delta
> between what what they target now and what we use (which includes both
> stable and some unstable features), plus I assume infrastructure bits
> like the platform (target spec) support, the flags / `rustc` driver
> (though I would be happy to do as much as possible on our side to
> help), etc.
>=20
> (We privately talked about possible timelines for all that if they
> were to focus on Rust for Linux etc., but I let them comment or not on
> that... Cc'ing them! :)
>=20
> Cheers,
> Miguel

As alternative to GCC Rust there is also github.com/rust-lang/rustc_codegen=
_gcc/ which uses libgccjit as backend for the official rust compiler rather=
 than writing a full Rust frontend for GCC from scratch. With a bit of patc=
hing to force it to be used, I was able to compile all Rust samples with GC=
C using rustc_codegen_gcc. However it gives warnings of the following kind:

    ld.lld: warning: rust/built-in.a(core.o):(.data.rel.local) is being pla=
ced in '.data.rel.local'

And hangs very early in the boot process. If I enable early logging, it pri=
nts up to "Booting the kernel." and then does nothing. This is probably bec=
ause support for setting a different relocation model is not yet implemente=
d. I opened https://github.com/rust-lang/rustc_codegen_gcc/issues/205 for t=
his.

There may be other issues, but rustc_codegen_gcc is probably going to be th=
e easiest route towards a LLVM free rust-for-linux build. By the way note t=
hat rust-bindgen which we use for generating rust bindings from C headers d=
epends on LLVM. See https://github.com/rust-lang/rust-bindgen/issues/1949.

Cheers,
Bjorn
