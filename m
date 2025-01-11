Return-Path: <linuxppc-dev+bounces-5066-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D2979A0A056
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jan 2025 03:26:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YVMpP21bMz3clp;
	Sat, 11 Jan 2025 13:26:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736562381;
	cv=none; b=arQ8Tktk2s4s/DG8gy2xRckpH+fUdBSlDeESATfnBOhtGUncv8EpgW3/Sp+Eyr1QxjT9JneYOYgP8Glqs4NJg9nVFyOGegzSOu7lN/XFI8E1nmPVQkDNKfLPJJldgMBtOSl3TVzNj3kdf8C9Tou5kIx7h3lCUT/Ch8tcPPDD5ZQFIDHpdu9xg6Dj6hAK5ARyJfbwp8LU0yAvn07CH3gdodXImSR3N3bAOBisSPsBPPLzgNXN4G5Aew+I+x64UA9rSwYE5QeGjubGMoA2QsD3w8gMT3qV1kw5YbLclGA5GnkNBrddHXtTEiB/Klib8s5PPADWQN+uOtdF7OJsq2AE1A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736562381; c=relaxed/relaxed;
	bh=8XbQkcCzTQ+XDb9ZBND+4nmayb4pb+F56XX0o45hflY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iJ4phZoZxGKFlEEtsQGKuAg8Kibt/GDXfH/Dw6q9E/E/TB1GReNQS4d9SrvdJS06LxWld46vhzWVbqhPrbhoZpnhOEjDaPUKK5fCUHNbhtJWe+hT1Dg7SGhmStnpnaCm59c9H5w6ZXC2vKvJ0K4SS/l8oROWEBnB3W1dHbyNoxRZxdvsk8T2RzBeTVZ/wZaHvjdwCDqygGtDzgqZyVUdW52ktkjpiczjBbDXozPASr3SUOeBczJZlMItdkshmnjpMBRUUQ56zDivy4dJmi/iwyvCEnMACNeB141VSiYPFQ6Um6YfCw+2cFIwjqYXg7sLHgNn23hVqIh1pnzCC/EaEw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ohR/j8x4; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=masahiroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ohR/j8x4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=masahiroy@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YVMpM4M47z3cjS
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jan 2025 13:26:19 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7D203A42AB4
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jan 2025 02:24:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BB40C4CEE7
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jan 2025 02:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736562373;
	bh=Idfamzh46DJ+twDpww56R9aCJmI4wUd9lTayVqOmz9c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ohR/j8x4mduyecIm9IHmeoUkPWOY+eL9haML+1wT95TX7hFydUAGVoeVQu0NjFekQ
	 7100PZd0U0jMw+S9PnOCq51wYRBB5kuqlMx93Ojz3c5CvqCMuf8YcFbWDFhsPdG5Ln
	 xiMZ1grF3yIfJsreZkNdd747u+md/mGMbJUCSfodSNx/XSaydM+XC9LBAV2Qd/5h5S
	 TD5RoESsX13yR7dXyDgsM0ND+4siMR8z3j0bxDSaa6RzDvKxSt8mgb/QvrVHjrHbfE
	 wWh/KZ66qT4ksJbyx+zzmu9BcsdWe6yO2BrGmVtohVUea0qgLaeRSE94P55UFxDre3
	 45sU9DIbXc+qg==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-304d757a9c1so25011021fa.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2025 18:26:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX92WsHihIuJdTBQonIkV0kBtyFn64GgdXgWh4ZJCPB9orQVmSn2u6pmDl3CiWn0xMKd4HzVvhb6MT5PfY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxuZrzzgpRL/8Qj6Nl1NJFL6AFo+LsMQsaFA2U5eRujnSgz6Tdd
	G/mrxbu3oc7yHKomwdA9sQaUwtnK0Tz0FXx1ZfS2PSzufL5sVl6ZFsO8sFSqjzSoQqbRqlODXjz
	pwR8df0tZ/bbblmEXSu4rSKOPcKg=
X-Google-Smtp-Source: AGHT+IFSeUdKlBePUTptLfNo7AV+Ke5p3rh1RAhmgs6127AKDeZ16XwTtR3YDLtLxc44SZaiu8s77F1oCGDkn1B2CUY=
X-Received: by 2002:a2e:bc23:0:b0:302:1fce:393d with SMTP id
 38308e7fff4ca-305fcf85a3fmr26095711fa.2.1736562371733; Fri, 10 Jan 2025
 18:26:11 -0800 (PST)
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
References: <20250103-extended-modversions-v13-0-35d87c65ee04@google.com> <20250103-extended-modversions-v13-5-35d87c65ee04@google.com>
In-Reply-To: <20250103-extended-modversions-v13-5-35d87c65ee04@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 11 Jan 2025 11:25:35 +0900
X-Gmail-Original-Message-ID: <CAK7LNATGw-m_dcdjTBHsFwCZh7mTt8q8yNZQ7VFP=hMU8NvUvg@mail.gmail.com>
X-Gm-Features: AbW1kvb7GALEjFsi9ilnzzIkVesgxqvRHO2ZeNtTEBScvuq46-k7JP8S_G4h1io
Message-ID: <CAK7LNATGw-m_dcdjTBHsFwCZh7mTt8q8yNZQ7VFP=hMU8NvUvg@mail.gmail.com>
Subject: Re: [PATCH v13 5/5] rust: Use gendwarfksyms + extended modversions
 for CONFIG_MODVERSIONS
To: Matthew Maurer <mmaurer@google.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
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

On Sat, Jan 4, 2025 at 2:37=E2=80=AFAM Matthew Maurer <mmaurer@google.com> =
wrote:
>
> From: Sami Tolvanen <samitolvanen@google.com>
>
> Previously, two things stopped Rust from using MODVERSIONS:
> 1. Rust symbols are occasionally too long to be represented in the
>    original versions table
> 2. Rust types cannot be properly hashed by the existing genksyms
>    approach because:
>         * Looking up type definitions in Rust is more complex than C
>         * Type layout is potentially dependent on the compiler in Rust,
>           not just the source type declaration.
>
> CONFIG_EXTENDED_MODVERSIONS addresses the first point, and
> CONFIG_GENDWARFKSYMS the second. If Rust wants to use MODVERSIONS, allow
> it to do so by selecting both features.
>
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> Co-developed-by: Matthew Maurer <mmaurer@google.com>
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> ---
>  init/Kconfig  |  3 ++-
>  rust/Makefile | 34 ++++++++++++++++++++++++++++++++--
>  2 files changed, 34 insertions(+), 3 deletions(-)
>
> diff --git a/init/Kconfig b/init/Kconfig
> index c1f9eb3d5f2e892e977ba1425599502dc830f552..b60acfd9431e0ac2bf401ecb6=
523b5104ad31150 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -1959,7 +1959,8 @@ config RUST
>         bool "Rust support"
>         depends on HAVE_RUST
>         depends on RUST_IS_AVAILABLE
> -       depends on !MODVERSIONS
> +       select EXTENDED_MODVERSIONS if MODVERSIONS
> +       depends on !MODVERSIONS || GENDWARFKSYMS
>         depends on !GCC_PLUGIN_RANDSTRUCT
>         depends on !RANDSTRUCT
>         depends on !DEBUG_INFO_BTF || PAHOLE_HAS_LANG_EXCLUDE
> diff --git a/rust/Makefile b/rust/Makefile
> index a40a3936126d603836e0ec9b42a1285916b60e45..80f970ad81f7989afe5ff2b5f=
633f50feb7f6006 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -329,10 +329,11 @@ $(obj)/bindings/bindings_helpers_generated.rs: priv=
ate bindgen_target_extra =3D ;
>  $(obj)/bindings/bindings_helpers_generated.rs: $(src)/helpers/helpers.c =
FORCE
>         $(call if_changed_dep,bindgen)
>
> +rust_exports =3D $(NM) -p --defined-only $(1) | awk '$$2~/(T|R|D|B)/ && =
$$3!~/__cfi/ { printf $(2),$(3) }'
> +
>  quiet_cmd_exports =3D EXPORTS $@
>        cmd_exports =3D \
> -       $(NM) -p --defined-only $< \
> -               | awk '$$2~/(T|R|D|B)/ && $$3!~/__cfi/ {printf "EXPORT_SY=
MBOL_RUST_GPL(%s);\n",$$3}' > $@
> +       $(call rust_exports,$<,"EXPORT_SYMBOL_RUST_GPL(%s);\n",$$3) > $@

I noticed a nit:

Both of the two callsites of rust_exports pass
'$$3' to the last parameter instead of hardcoding it.

Is it a flexibility for future extensions?

I cannot think of any other use except for printing
the third column, i.e. symbol name.





--=20
Best Regards
Masahiro Yamada

