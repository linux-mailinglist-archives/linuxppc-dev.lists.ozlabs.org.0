Return-Path: <linuxppc-dev+bounces-5190-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28702A0C25C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2025 21:04:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YX3Bf1fL5z30fn;
	Tue, 14 Jan 2025 07:04:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::533"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736798682;
	cv=none; b=dQq8KtilSf5wkyZGP4zUBEdLMdE/2HlSyR4shWfG2a12miMybSLidxG7iuLbX8TU31baPSaObkGQRZ56X5Svncr5usLePPGqC/Xe/z9Hb3JvKsbI3fwW91LEvgexaXWgWkoOxAwqhJ7E4s8bcegUFNPEkwmR4jdm5/y3H8uex+T1gMOC+B89m+OttoMCGDE6To5NReKQ5IpdGiTvfnc8i/wGN+qcUuwqeUPDjxL33NjudIbYMeNMygxYaXsqxnshFGpN5BWqCSN21W0vaNhS/x6uvu4dDuXPe6j6Om96JF3wt6zUzfDIk/ezA3uyV3YwIKNvEMtcJA9QnDtCPYZFJw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736798682; c=relaxed/relaxed;
	bh=yHTlphgauUE0MdQoq+J6Kpo0ZGTAu35Dgo6BpbFsY+0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RHTfV/WZVk58iws65eWAuHpRRJutG+UvFw6YPPuBxq4DA5RO2BHx55tKKOmBtMq9kyp2TTH1UEJ4sty/3xEwknVBtUed9LIvr9ZBviXWdaVwZy8Vt+suxfmJVLhoLgMZx59ychyi6vjazraLOhrNdvOWPhtkWhEByEPrU5SFXuWtGl8DENZn/V9bLxFQ13/6gTGs17JzqSvABN9lyJR1m5sWgqyPH3nSvjq0BvxRx8xa+Ucb/2VThEbLerqXhL2mbwxDmQf/JNdE8g9Q8+V4GkQjC8XL27jzIvoZmuPm2yqBIFPJPgiJFBMxeGyOJkwl61OU7MDVqWKiU9+evSbDhw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=G4ebGA+8; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com; envelope-from=samitolvanen@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=G4ebGA+8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com; envelope-from=samitolvanen@google.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YX3Bb0V74z301x
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2025 07:04:37 +1100 (AEDT)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5d442f9d285so1321a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 12:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736798668; x=1737403468; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yHTlphgauUE0MdQoq+J6Kpo0ZGTAu35Dgo6BpbFsY+0=;
        b=G4ebGA+8+5ZQw8uSwR/KyGA7iorRDn6DXDWUm4FzUi+lHxODAmoMSS34rkEwSyv/+Y
         myRo3plOR1C7JS6n5RBiRmCRo1pFsixIvOmUWonK/k8/CKN4aRoP/MEkG6j1JNjpANJG
         x+L5GX3ung6ytZiTWC8dfhrm0FWKW/ALl2stFfJnulJ5ZslOgpanB4Yw7ze5Sp2lGBEh
         dvhXoe74QBexljy9QK50z7xpxC5G3Wjrwjh+hsuSn/O6ftfLgBh94LXhQan9wEpPQ8gH
         8pYuNRqAQ8wQ+ccyvCKpIaxI2M4c+sMkaFrLWBPQyy0yjHPBkjDC8QqORY9GZ+hQ2KvT
         9suA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736798668; x=1737403468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yHTlphgauUE0MdQoq+J6Kpo0ZGTAu35Dgo6BpbFsY+0=;
        b=Ps+P6ey4u+u6okmBDSaledSK9yqnY8Hgv8SiszsnwZhAyGeTfaonCQjl3OhKegU7av
         HYKGNTiNLS/Wqx0IcCy68Q20sJ0gi2swE3f4zRZ63XAky+5/qn7xwRVUSFZdm4oegx88
         mDBy16x3YzukHMGH/gIjZX6Z1TCSixJatqAwqrKcBCB7OhyY23vTfKrHYQDZG5c4IBGG
         OMLiZVri33EPd5HFFZZXw2PQqceZmeY8n8KqA0V/X6uaYWHQjWts9iHiAxKHG3UOhbAR
         nWvrTsLWgPRK54pgl/H3SipofUbBCsFtC/ha7SRC/gKK21Bl/nKpmxjVh7hXptAlKVA4
         01pw==
X-Forwarded-Encrypted: i=1; AJvYcCVSyKfAsmKR3yXX0sytMaZfeTaFWd1ic6EIjfyyePcWPp/7wPo3D/NuhoLzihD0N/t28MuLlsywdr1F5wQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzNOm0xvxYk9KrK0jzHpJ6cuNLoBfYCArwIitpKLcTrde0kJykE
	BnexYl21SWeZRSOa1A7gDvM/Sq2iD0lJt3TZgTnqqbINehVi11dl82Ga5PY9Pgbx3UFiX4ocO5A
	vpc9YkD73SMivt4T3GxQJx+goJdMnI0qRx0WH
X-Gm-Gg: ASbGncu4+lJCUlgMlxv/VjRVA3c970GuLuf6bF6p4m8FH7d/02WXySzLSIwmSdtBhxV
	DxUHTibdtsudf3R14IQQl8lYPRRx8nirFAcM=
X-Google-Smtp-Source: AGHT+IF0ImtytlLOuNBIguPAjeH7U4hIPd2noWdWrMGEBo3lMmqYucAvmrJESKCyXWngvaXS5pNjrcV4IkidF9a/DB4=
X-Received: by 2002:a50:ccdb:0:b0:5d9:5a5c:f2f9 with SMTP id
 4fb4d7f45d1cf-5d9f6c2c39bmr4420a12.7.1736798667639; Mon, 13 Jan 2025 12:04:27
 -0800 (PST)
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
 <20250103-extended-modversions-v13-5-35d87c65ee04@google.com> <CAK7LNATGw-m_dcdjTBHsFwCZh7mTt8q8yNZQ7VFP=hMU8NvUvg@mail.gmail.com>
In-Reply-To: <CAK7LNATGw-m_dcdjTBHsFwCZh7mTt8q8yNZQ7VFP=hMU8NvUvg@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 13 Jan 2025 12:03:51 -0800
X-Gm-Features: AbW1kvYivGs5dyWgDAa0jLS9Y99MI1ugBfYsduBbEB5OZ0TEDoer8gpSmAU-ynQ
Message-ID: <CABCJKuf-w1puUsypU-cr5BH8uvCdPPQmhZZ1qVKDDg3Y-iQhSg@mail.gmail.com>
Subject: Re: [PATCH v13 5/5] rust: Use gendwarfksyms + extended modversions
 for CONFIG_MODVERSIONS
To: Masahiro Yamada <masahiroy@kernel.org>
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
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Masahiro,

On Fri, Jan 10, 2025 at 6:26=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Sat, Jan 4, 2025 at 2:37=E2=80=AFAM Matthew Maurer <mmaurer@google.com=
> wrote:
> >
> > From: Sami Tolvanen <samitolvanen@google.com>
> >
> > Previously, two things stopped Rust from using MODVERSIONS:
> > 1. Rust symbols are occasionally too long to be represented in the
> >    original versions table
> > 2. Rust types cannot be properly hashed by the existing genksyms
> >    approach because:
> >         * Looking up type definitions in Rust is more complex than C
> >         * Type layout is potentially dependent on the compiler in Rust,
> >           not just the source type declaration.
> >
> > CONFIG_EXTENDED_MODVERSIONS addresses the first point, and
> > CONFIG_GENDWARFKSYMS the second. If Rust wants to use MODVERSIONS, allo=
w
> > it to do so by selecting both features.
> >
> > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> > Co-developed-by: Matthew Maurer <mmaurer@google.com>
> > Signed-off-by: Matthew Maurer <mmaurer@google.com>
> > ---
> >  init/Kconfig  |  3 ++-
> >  rust/Makefile | 34 ++++++++++++++++++++++++++++++++--
> >  2 files changed, 34 insertions(+), 3 deletions(-)
> >
> > diff --git a/init/Kconfig b/init/Kconfig
> > index c1f9eb3d5f2e892e977ba1425599502dc830f552..b60acfd9431e0ac2bf401ec=
b6523b5104ad31150 100644
> > --- a/init/Kconfig
> > +++ b/init/Kconfig
> > @@ -1959,7 +1959,8 @@ config RUST
> >         bool "Rust support"
> >         depends on HAVE_RUST
> >         depends on RUST_IS_AVAILABLE
> > -       depends on !MODVERSIONS
> > +       select EXTENDED_MODVERSIONS if MODVERSIONS
> > +       depends on !MODVERSIONS || GENDWARFKSYMS
> >         depends on !GCC_PLUGIN_RANDSTRUCT
> >         depends on !RANDSTRUCT
> >         depends on !DEBUG_INFO_BTF || PAHOLE_HAS_LANG_EXCLUDE
> > diff --git a/rust/Makefile b/rust/Makefile
> > index a40a3936126d603836e0ec9b42a1285916b60e45..80f970ad81f7989afe5ff2b=
5f633f50feb7f6006 100644
> > --- a/rust/Makefile
> > +++ b/rust/Makefile
> > @@ -329,10 +329,11 @@ $(obj)/bindings/bindings_helpers_generated.rs: pr=
ivate bindgen_target_extra =3D ;
> >  $(obj)/bindings/bindings_helpers_generated.rs: $(src)/helpers/helpers.=
c FORCE
> >         $(call if_changed_dep,bindgen)
> >
> > +rust_exports =3D $(NM) -p --defined-only $(1) | awk '$$2~/(T|R|D|B)/ &=
& $$3!~/__cfi/ { printf $(2),$(3) }'
> > +
> >  quiet_cmd_exports =3D EXPORTS $@
> >        cmd_exports =3D \
> > -       $(NM) -p --defined-only $< \
> > -               | awk '$$2~/(T|R|D|B)/ && $$3!~/__cfi/ {printf "EXPORT_=
SYMBOL_RUST_GPL(%s);\n",$$3}' > $@
> > +       $(call rust_exports,$<,"EXPORT_SYMBOL_RUST_GPL(%s);\n",$$3) > $=
@
>
> I noticed a nit:
>
> Both of the two callsites of rust_exports pass
> '$$3' to the last parameter instead of hardcoding it.
>
> Is it a flexibility for future extensions?
>
> I cannot think of any other use except for printing
> the third column, i.e. symbol name.

Good catch, the last parameter isn't necessary anymore. It was used in
early versions of the series to also pass symbol addresses to
gendwarfksyms, but that's not needed since we read the symbol table
directly now.

Sami

