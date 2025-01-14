Return-Path: <linuxppc-dev+bounces-5204-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FC9A0FE03
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2025 02:23:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YXBFw3079z3d9T;
	Tue, 14 Jan 2025 12:23:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736817780;
	cv=none; b=ouNACaGyWRZeQz7H3FbbDBtYGIgraZyjYJvUXVqmh/LM3oJPOi/bkJiZIXoelp9m6SonYAw1idlDS/hWFOlvNTU6D6jbBCtupZOTlBCeWyJXXyH0maK8SNOlJKtiS1aW0Xc+A2v/JT9yGimdbiCT7np1TIwNzh/ai2j51OnNEgl1k1lfLnKfxN0edsAoII3cgiIC+BknotGn/Uzrrfc0BybU/6bSdDGl2XdOMdqEgV7+JMRfScfA+Pv10ZjGXO/4p4ZYWBK1Iik7Ez8drLMrr0CoQ6MewZPOtNzg/C0of/5vCsturSplZNgUe8nPCwoSnUyphCaaoyxzwlGGe5Po2w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736817780; c=relaxed/relaxed;
	bh=sidi1WrXBDVPkQAPHm27bKo+39U3wsJ0i7ABlAjzb+A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hbXlyi5OmeL+bJH3GNNJjErAIgE9bEVOwQ9AwB8M95Tn8Uk8kLoi96hJIONTSqaVi8EZPoH+36MReuv6TRPsXq9sHozYnhLvuZQ0qKp7MPS7pfVAyebp/X7vDzSaz8R1PCYcMBQncJicp47jj0w+RpqJ5PaERRe2o8oDpWLrhDrdOmvMPtzvXN45d7e4NZ0rHDI9qfEFdEmaBQhz/N7CXNCdovKCHO8f801pTs+4SIlSpEU+kVeA1JRYEvCM3K7/Uptq6impVJNFmufWIox/X6Rh0Vsi47zN2e+GRZODAnLhnDQA2IY6K080I9dEdBDI/Cedto2tn5ZVNARcwZbQMg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Q8yhNI73; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=masahiroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Q8yhNI73;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=masahiroy@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YXBFs72ynz3bPR
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2025 12:22:57 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E4B22A40BAB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2025 01:21:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DEB6C4CEE6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2025 01:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736817774;
	bh=WWAWhrPDVE4hZLjlIHHtG5mo67QW053tLTfug92Cmg0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Q8yhNI73qWjJaT8OH+GgCaS0wKO61ripZky5L63DMuH/gwDmFtPtlg6RSHsIeGRhu
	 QrAp3w4FHYFA6BZpsJAhm8wkcdiIz9TZKRwhQYsJuAXuN3YoALsXYDHHvJnVs8zNrk
	 FZqhVUroeEGRPgqx90majKMGFrKVUK13ytatOZrtpVpWRDN0Gl6d+HBri5c9tOnMjJ
	 p4XmhP91mTYDMZyBrCLBYA9ZzJZhz22Zl/h8YFsp0v3sfaI5IEpgzcvOGeBgD/QC1K
	 R/Tm7tMwoSUMoq0Wt/gEEQ1VYriFszEm+yGgmgQdaqrXLt0/VV7WsAY6iA0CyN16SA
	 61DRdFhGl5HAA==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54024aa9febso4275195e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 17:22:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV/+Fb6Luo0HQ1FtVTLrg9GsTKmtH/Qx2gXAui7vD9zTF5+ZUFSDm2bGc1U86p16Zov8d1v0aeLtTD/hBs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwflCG8vFAUV1NZVBMoeuMWAlAmX3cX1PyDmrHzqgjDnoUMmYEt
	lkEtDggCBm+atgSfmQZigKRaY2K1/4+IGkkZMvir0kK+1/MVe1M5EmykLlQdC1eNDzMloVmjijS
	+lY0QcgRVIMvXv8VjkkwfK6eDI1U=
X-Google-Smtp-Source: AGHT+IESxyAm24XzrUgZGUb3R8oQ76pDssd8o0arSr9yWSbiBxQ8obkHFuQd2lZ3xWB3P/UgR+hVajnNX4k9qFATBCk=
X-Received: by 2002:ac2:4e0c:0:b0:542:2e04:e9b8 with SMTP id
 2adb3069b0e04-542845af12emr6189443e87.8.1736817772856; Mon, 13 Jan 2025
 17:22:52 -0800 (PST)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20250103-extended-modversions-v13-0-35d87c65ee04@google.com>
 <20250103-extended-modversions-v13-5-35d87c65ee04@google.com>
 <CAK7LNATGw-m_dcdjTBHsFwCZh7mTt8q8yNZQ7VFP=hMU8NvUvg@mail.gmail.com> <CABCJKuf-w1puUsypU-cr5BH8uvCdPPQmhZZ1qVKDDg3Y-iQhSg@mail.gmail.com>
In-Reply-To: <CABCJKuf-w1puUsypU-cr5BH8uvCdPPQmhZZ1qVKDDg3Y-iQhSg@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 14 Jan 2025 10:22:15 +0900
X-Gmail-Original-Message-ID: <CAK7LNASh4xMN8nN5vwR6R1OCNW9u4MJz=CSwW4_4hvFOhczmWA@mail.gmail.com>
X-Gm-Features: AbW1kva0Jrhvekt3XU_K0jJaW4gEA0CCxv9uoIHGVV-XYlKHjUpGlKLny-Lkcbo
Message-ID: <CAK7LNASh4xMN8nN5vwR6R1OCNW9u4MJz=CSwW4_4hvFOhczmWA@mail.gmail.com>
Subject: Re: [PATCH v13 5/5] rust: Use gendwarfksyms + extended modversions
 for CONFIG_MODVERSIONS
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Matthew Maurer <mmaurer@google.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Jonathan Corbet <corbet@lwn.net>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Jan 14, 2025 at 5:04=E2=80=AFAM Sami Tolvanen <samitolvanen@google.=
com> wrote:
>
> Hi Masahiro,
>
> On Fri, Jan 10, 2025 at 6:26=E2=80=AFPM Masahiro Yamada <masahiroy@kernel=
.org> wrote:
> >
> > On Sat, Jan 4, 2025 at 2:37=E2=80=AFAM Matthew Maurer <mmaurer@google.c=
om> wrote:
> > >
> > > From: Sami Tolvanen <samitolvanen@google.com>
> > >
> > > Previously, two things stopped Rust from using MODVERSIONS:
> > > 1. Rust symbols are occasionally too long to be represented in the
> > >    original versions table
> > > 2. Rust types cannot be properly hashed by the existing genksyms
> > >    approach because:
> > >         * Looking up type definitions in Rust is more complex than C
> > >         * Type layout is potentially dependent on the compiler in Rus=
t,
> > >           not just the source type declaration.
> > >
> > > CONFIG_EXTENDED_MODVERSIONS addresses the first point, and
> > > CONFIG_GENDWARFKSYMS the second. If Rust wants to use MODVERSIONS, al=
low
> > > it to do so by selecting both features.
> > >
> > > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> > > Co-developed-by: Matthew Maurer <mmaurer@google.com>
> > > Signed-off-by: Matthew Maurer <mmaurer@google.com>
> > > ---
> > >  init/Kconfig  |  3 ++-
> > >  rust/Makefile | 34 ++++++++++++++++++++++++++++++++--
> > >  2 files changed, 34 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/init/Kconfig b/init/Kconfig
> > > index c1f9eb3d5f2e892e977ba1425599502dc830f552..b60acfd9431e0ac2bf401=
ecb6523b5104ad31150 100644
> > > --- a/init/Kconfig
> > > +++ b/init/Kconfig
> > > @@ -1959,7 +1959,8 @@ config RUST
> > >         bool "Rust support"
> > >         depends on HAVE_RUST
> > >         depends on RUST_IS_AVAILABLE
> > > -       depends on !MODVERSIONS
> > > +       select EXTENDED_MODVERSIONS if MODVERSIONS
> > > +       depends on !MODVERSIONS || GENDWARFKSYMS
> > >         depends on !GCC_PLUGIN_RANDSTRUCT
> > >         depends on !RANDSTRUCT
> > >         depends on !DEBUG_INFO_BTF || PAHOLE_HAS_LANG_EXCLUDE
> > > diff --git a/rust/Makefile b/rust/Makefile
> > > index a40a3936126d603836e0ec9b42a1285916b60e45..80f970ad81f7989afe5ff=
2b5f633f50feb7f6006 100644
> > > --- a/rust/Makefile
> > > +++ b/rust/Makefile
> > > @@ -329,10 +329,11 @@ $(obj)/bindings/bindings_helpers_generated.rs: =
private bindgen_target_extra =3D ;
> > >  $(obj)/bindings/bindings_helpers_generated.rs: $(src)/helpers/helper=
s.c FORCE
> > >         $(call if_changed_dep,bindgen)
> > >
> > > +rust_exports =3D $(NM) -p --defined-only $(1) | awk '$$2~/(T|R|D|B)/=
 && $$3!~/__cfi/ { printf $(2),$(3) }'
> > > +
> > >  quiet_cmd_exports =3D EXPORTS $@
> > >        cmd_exports =3D \
> > > -       $(NM) -p --defined-only $< \
> > > -               | awk '$$2~/(T|R|D|B)/ && $$3!~/__cfi/ {printf "EXPOR=
T_SYMBOL_RUST_GPL(%s);\n",$$3}' > $@
> > > +       $(call rust_exports,$<,"EXPORT_SYMBOL_RUST_GPL(%s);\n",$$3) >=
 $@
> >
> > I noticed a nit:
> >
> > Both of the two callsites of rust_exports pass
> > '$$3' to the last parameter instead of hardcoding it.
> >
> > Is it a flexibility for future extensions?
> >
> > I cannot think of any other use except for printing
> > the third column, i.e. symbol name.
>
> Good catch, the last parameter isn't necessary anymore. It was used in
> early versions of the series to also pass symbol addresses to
> gendwarfksyms, but that's not needed since we read the symbol table
> directly now.

If you submit a diff, I will squash it to 5/5.
(You do not need to input commit description body)


--=20
Best Regards
Masahiro Yamada

