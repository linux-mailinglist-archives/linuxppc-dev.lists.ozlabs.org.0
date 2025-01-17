Return-Path: <linuxppc-dev+bounces-5369-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE072A15A32
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jan 2025 00:54:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YZc5b5wfKz30DD;
	Sat, 18 Jan 2025 10:54:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737158051;
	cv=none; b=eFJvffiq/WAxP8dCJWUT6RKiSJwmN3Q91bv+svIz589eSiFK1vOxAMJB93Co6a7DbfW0gi5BgN/0vsvYSYQ4UTHU/MHS8iTJHPhqmNJh2eSey28mmINA5QCmWIltAXPHCUoUPz1Ysuad7iU5B9lq6lymxEKuiJgu3QyQZsZKuSCDZjZcPr670l7OaciMXpGyEqR25hmt5ilYXxUU1b+IArzHaumzq83twpT3Vb9Sr2EGPL43g19ajxCaP1gQ4HINyyVm2drwZl3klm7qwt71oucQsOtlj6u7J3blAXukpnazmdchJVvBDVCsuQaDqgksPoATdaRH6Lmt+tMaBaiJhw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737158051; c=relaxed/relaxed;
	bh=xFXIQMexIjuwV73DjhuGbvjawsXOBiqEUbJ2Z6Hi5Fs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OpFc9rLp18Tru9HtSWjTczbsnRTKIwN2fE8foeTYYK43n9R6zMBm7PSJBwvIJEPxp1p9MpgwZS5PlrxXAIUkYJlVwnnImJhiYre+6i4TAP+lWKNWKJQBKNzKc/Tp5565AC0nUrjBObpy9yeHE6ik11i5UJiSNf/7S2cs9wBQQyz0KjZX9GXlllOW4uKZ3qbiTSvrhZ8CZcMppGGhaXlsxZMxF3dA1G5Auvk+L/eB9VDfmEkej2ReJv/jEXniZy+9ylrKB84L2KF4thRPO/5C8F4Mc7sociiXUyM4VLsvGahQaWcmXFPbO2pzyqtN4M8rNkCn8uVQwdz4cUOvBLyZHw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gVsY3WJ/; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=masahiroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gVsY3WJ/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=masahiroy@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YZc5Y5MnJz30CL
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jan 2025 10:54:09 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 98191A43503
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jan 2025 23:52:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68C54C4CEE7
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jan 2025 23:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737158045;
	bh=m8ZfCoz+QGoeKH7gpzr+DtbpzkszLlope3/7aqelGNo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gVsY3WJ/q+t/rFDdtrcaqnSSa1hVY4YQAAXAgcBMkqbh3QmONSC0De4NhSYmQTVPu
	 GjuY0zxIGQkjxerzBHXZ8sYt/CzeOUCwQGpuSkKrngnJHcajmqk2wXp4jQzY2aeZkr
	 J8La2wsP2j5hzCBtEZM7W8hRhUjrokxi9Xdsat0O+7T3zkg/ZJULWKNrbXo+1aH+bX
	 Ke7D/vXir/EBBx2Y9wZMN/aMRAae9NzdVI16VZk4z9Y2YL6kk6lSR2PRqpa2yHEDVN
	 X+HI+zv4S1RNhMVO7V3z5RT8NajxXqZ+6BKe5KuxMYiX0xFv9afO1D1butRJHz9YZk
	 mEIOoeXZsb9ww==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54024ecc33dso2513086e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jan 2025 15:54:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW/gW06h4JmwLT/UDN9PCOIWTeJflucG6MvAAMWlwdq9iAT9MlupmqPVKvz86UKYRQwNU0t4hyBEzzwkTo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy2OqFjagylsMc0IQrcyqrf/WtTMYTUfTSAWB6suhb7FWJBwhuf
	wmeWxMjVXi/ikkOoLkNgSSlIPvMerULEzHoxjHu2jSr0UObrk5XhTz2t7y5FbVhFTgUg/uCO8MH
	gsVPXFZ+axHe/vW4QH1sL6lDm6Lw=
X-Google-Smtp-Source: AGHT+IExF/k3Se+h2APx/UW58ua4xWf/ZRu8ZQvl0deaJxQpL77zmMnsyOKqNs5x4WdzpyLPqC1//WGF4Am0tjc/OHU=
X-Received: by 2002:a05:6512:3b9d:b0:540:1be6:f15f with SMTP id
 2adb3069b0e04-5439c1bfd49mr1612216e87.0.1737158043976; Fri, 17 Jan 2025
 15:54:03 -0800 (PST)
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
 <CAK7LNATGw-m_dcdjTBHsFwCZh7mTt8q8yNZQ7VFP=hMU8NvUvg@mail.gmail.com>
 <CABCJKuf-w1puUsypU-cr5BH8uvCdPPQmhZZ1qVKDDg3Y-iQhSg@mail.gmail.com>
 <CAK7LNASh4xMN8nN5vwR6R1OCNW9u4MJz=CSwW4_4hvFOhczmWA@mail.gmail.com> <20250114185819.GA2222429@google.com>
In-Reply-To: <20250114185819.GA2222429@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 18 Jan 2025 08:53:27 +0900
X-Gmail-Original-Message-ID: <CAK7LNARD5GV6rxMQc0Hu97LmsUDoREstNAgHGkVUmNk8dcAj+g@mail.gmail.com>
X-Gm-Features: AbW1kvZvVs_nJfbEUH3iAOiRf4pxKgGnbT-H8Stwhl79ZTob5w_6kEzM6PlRNxI
Message-ID: <CAK7LNARD5GV6rxMQc0Hu97LmsUDoREstNAgHGkVUmNk8dcAj+g@mail.gmail.com>
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

On Wed, Jan 15, 2025 at 3:58=E2=80=AFAM Sami Tolvanen <samitolvanen@google.=
com> wrote:
>
> On Tue, Jan 14, 2025 at 10:22:15AM +0900, Masahiro Yamada wrote:
> > On Tue, Jan 14, 2025 at 5:04=E2=80=AFAM Sami Tolvanen <samitolvanen@goo=
gle.com> wrote:
> > >
> > > Hi Masahiro,
> > >
> > > On Fri, Jan 10, 2025 at 6:26=E2=80=AFPM Masahiro Yamada <masahiroy@ke=
rnel.org> wrote:
> > > >
> > > > On Sat, Jan 4, 2025 at 2:37=E2=80=AFAM Matthew Maurer <mmaurer@goog=
le.com> wrote:
> > > > >
> > > > > From: Sami Tolvanen <samitolvanen@google.com>
> > > > >
> > > > > Previously, two things stopped Rust from using MODVERSIONS:
> > > > > 1. Rust symbols are occasionally too long to be represented in th=
e
> > > > >    original versions table
> > > > > 2. Rust types cannot be properly hashed by the existing genksyms
> > > > >    approach because:
> > > > >         * Looking up type definitions in Rust is more complex tha=
n C
> > > > >         * Type layout is potentially dependent on the compiler in=
 Rust,
> > > > >           not just the source type declaration.
> > > > >
> > > > > CONFIG_EXTENDED_MODVERSIONS addresses the first point, and
> > > > > CONFIG_GENDWARFKSYMS the second. If Rust wants to use MODVERSIONS=
, allow
> > > > > it to do so by selecting both features.
> > > > >
> > > > > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> > > > > Co-developed-by: Matthew Maurer <mmaurer@google.com>
> > > > > Signed-off-by: Matthew Maurer <mmaurer@google.com>
> > > > > ---
> > > > >  init/Kconfig  |  3 ++-
> > > > >  rust/Makefile | 34 ++++++++++++++++++++++++++++++++--
> > > > >  2 files changed, 34 insertions(+), 3 deletions(-)
> > > > >
> > > > > diff --git a/init/Kconfig b/init/Kconfig
> > > > > index c1f9eb3d5f2e892e977ba1425599502dc830f552..b60acfd9431e0ac2b=
f401ecb6523b5104ad31150 100644
> > > > > --- a/init/Kconfig
> > > > > +++ b/init/Kconfig
> > > > > @@ -1959,7 +1959,8 @@ config RUST
> > > > >         bool "Rust support"
> > > > >         depends on HAVE_RUST
> > > > >         depends on RUST_IS_AVAILABLE
> > > > > -       depends on !MODVERSIONS
> > > > > +       select EXTENDED_MODVERSIONS if MODVERSIONS
> > > > > +       depends on !MODVERSIONS || GENDWARFKSYMS
> > > > >         depends on !GCC_PLUGIN_RANDSTRUCT
> > > > >         depends on !RANDSTRUCT
> > > > >         depends on !DEBUG_INFO_BTF || PAHOLE_HAS_LANG_EXCLUDE
> > > > > diff --git a/rust/Makefile b/rust/Makefile
> > > > > index a40a3936126d603836e0ec9b42a1285916b60e45..80f970ad81f7989af=
e5ff2b5f633f50feb7f6006 100644
> > > > > --- a/rust/Makefile
> > > > > +++ b/rust/Makefile
> > > > > @@ -329,10 +329,11 @@ $(obj)/bindings/bindings_helpers_generated.=
rs: private bindgen_target_extra =3D ;
> > > > >  $(obj)/bindings/bindings_helpers_generated.rs: $(src)/helpers/he=
lpers.c FORCE
> > > > >         $(call if_changed_dep,bindgen)
> > > > >
> > > > > +rust_exports =3D $(NM) -p --defined-only $(1) | awk '$$2~/(T|R|D=
|B)/ && $$3!~/__cfi/ { printf $(2),$(3) }'
> > > > > +
> > > > >  quiet_cmd_exports =3D EXPORTS $@
> > > > >        cmd_exports =3D \
> > > > > -       $(NM) -p --defined-only $< \
> > > > > -               | awk '$$2~/(T|R|D|B)/ && $$3!~/__cfi/ {printf "E=
XPORT_SYMBOL_RUST_GPL(%s);\n",$$3}' > $@
> > > > > +       $(call rust_exports,$<,"EXPORT_SYMBOL_RUST_GPL(%s);\n",$$=
3) > $@
> > > >
> > > > I noticed a nit:
> > > >
> > > > Both of the two callsites of rust_exports pass
> > > > '$$3' to the last parameter instead of hardcoding it.
> > > >
> > > > Is it a flexibility for future extensions?
> > > >
> > > > I cannot think of any other use except for printing
> > > > the third column, i.e. symbol name.
> > >
> > > Good catch, the last parameter isn't necessary anymore. It was used i=
n
> > > early versions of the series to also pass symbol addresses to
> > > gendwarfksyms, but that's not needed since we read the symbol table
> > > directly now.
> >
> > If you submit a diff, I will squash it to 5/5.
> > (You do not need to input commit description body)
>
> Thanks, here's a diff that drops the last parameter.

Squashed.
Thanks!




--=20
Best Regards
Masahiro Yamada

