Return-Path: <linuxppc-dev+bounces-4504-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDE29FDBA2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Dec 2024 17:05:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YL6dV4RHRz2xfR;
	Sun, 29 Dec 2024 03:05:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735401902;
	cv=none; b=IGaKigalcwo9t5R0nNT1L8UBOoiwwJyAgytqL3hParC1SmFI8eh7DPa5wvIgsi/Nx2WU+CFxSZa8u+i2KnMnWx1wOU0BBboWd1CrErfNxSVlhgLxTf+9urn0Jo0fqGNfd1XhV9U283UCZGS6VPIUCcDHJOko4lzw+e04XynVsTjkaTfaNidKVQ2PSFpT6u9XevCT2cGb0TSC49YHev92ct+cohRSEwUZhl4WODdhu097KNR20pETCo4egS1OrYiabEV6QuE3NJEdtmZd/aUCuynZ38FANuzoS9ZX0C7iZApMn8jcQzW7U6F7wYtnXHZJ2XAIE88Pzuqb1jI7d/oAZg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735401902; c=relaxed/relaxed;
	bh=5QgL0Vl5TjDuu6ndHmdKYNddXG+TkONKnzmaUdlobDw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RYkcxELZqHiQd9ZJAHgx/rtvN+Hyv10/5N/XB4wskEJfbNVFqsmerhJT3Lc/gkxMs3qvkivf5n0Jsey5BwjfFhsAHd0W1GOsw1yRhO34xCGyRTswjg/xH6StQan4ArxarMoKwwe2tAx/1QpyTLkYFdM1BPP1lhdZXFRqtEnBDafJq2m61xcgH3C/xbacpS9gdGCAmk2rszFkwjn5CUeYLfES5ZHB4p+QZarqKhyj5xWxC5q1nu2jFYbYavl3UmMDMvkGQ9iPy0O/fgHiDB2gxsiHlXF6LnxgMR+/B6LXFgmNIftTiZVRARqGrJHwH1qZ9cR9XB3ffLXAkMdLueMztw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=o/0qyAgA; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=masahiroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=o/0qyAgA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=masahiroy@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YL6dT1SkXz2xHQ
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Dec 2024 03:05:01 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 10F38A406CC
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Dec 2024 16:03:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CB25C4CEE1
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Dec 2024 16:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735401898;
	bh=2E6nm/OO1NFUbYyyb2S56tAzsTPeNG1dBz8WsJ12wuU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=o/0qyAgAqiHrMhA0AnBg6Jytw03oB6R4rLYQm/kPP6WYvGI3bUIZNq2jJvm3Zd/j+
	 06o0tSurekPfFNPaNgKizA9ZXQUBLGO/9VbcmJDYph6WQnQBElsQW1Ww3J2pBUMNoo
	 YSWXCg4MZxH3q0E0AOGaQeaEA69rs6pcBcJGcGb6LSb8no1rlDCoaswkvxi8AUHWNe
	 Hsp4309ffVzoSDQi1vlj85etoYeAnwws396UswAdU+DcsF+Ro2lBYe8bZXKlTycRgm
	 f3hSCUsC+aeS3wx8wlsjQNI76IpNhn1K+9X861FQO3ZxEJfHz0plv+3u9oSva8uamz
	 aADZEDbV0dzgw==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3022598e213so11970591fa.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Dec 2024 08:04:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW0ZIpoYp17FZyfwFr8ZhH8WenIq/hC7Jg5cqji2g57kxcQj/p6lznxXP0Ay/G5x6LZ/CFXZ9W1rjlXBWw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw+UkTCUAq7VCP0Yrl3a16SrfsQwbgKcxFS281J3JJDUIokU1Oy
	56xLLLabIMK+lohN5AijsfOT/dNmJi+crOPNhOjQlAHlOhX5W1uqvM93MTix4tz4jsqH7KzzbRF
	+D+fUOxSx6aHvyWulwBh3nhE5Xx4=
X-Google-Smtp-Source: AGHT+IEx4wOx6hDhCtq+sNGb0B2IOrBhZqTgzm9BixFBzI8QvQhEwHzlWRtDn1bAHBzHcIAtfWptx18Y2McZcxU162o=
X-Received: by 2002:a05:6512:128f:b0:542:214c:533 with SMTP id
 2adb3069b0e04-5422953c131mr9938768e87.30.1735401896566; Sat, 28 Dec 2024
 08:04:56 -0800 (PST)
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
References: <20241223-extended-modversions-v11-0-221d184ee9a7@google.com> <20241223-extended-modversions-v11-2-221d184ee9a7@google.com>
In-Reply-To: <20241223-extended-modversions-v11-2-221d184ee9a7@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 29 Dec 2024 01:04:20 +0900
X-Gmail-Original-Message-ID: <CAK7LNASDYVfPPvR7RB1t2iB653nkFRmitKp-mV59Jx4DFm=jGQ@mail.gmail.com>
Message-ID: <CAK7LNASDYVfPPvR7RB1t2iB653nkFRmitKp-mV59Jx4DFm=jGQ@mail.gmail.com>
Subject: Re: [PATCH v11 2/5] modpost: Produce extended MODVERSIONS information
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

On Tue, Dec 24, 2024 at 5:13=E2=80=AFAM Matthew Maurer <mmaurer@google.com>=
 wrote:
>
> Generate both the existing modversions format and the new extended one
> when running modpost. Presence of this metadata in the final .ko is
> guarded by CONFIG_EXTENDED_MODVERSIONS.
>
> We no longer generate an error on long symbols in modpost if
> CONFIG_EXTENDED_MODVERSIONS is set, as they can now be appropriately
> encoded in the extended section. These symbols will be skipped in the
> previous encoding. An error will still be generated if
> CONFIG_EXTENDED_MODVERSIONS is not set.
>
> Reviewed-by: Sami Tolvanen <samitolvanen@google.com>
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> ---
>  kernel/module/Kconfig    | 10 ++++++++
>  scripts/Makefile.modpost |  1 +
>  scripts/mod/modpost.c    | 65 ++++++++++++++++++++++++++++++++++++++++++=
+++---
>  3 files changed, 72 insertions(+), 4 deletions(-)
>
> diff --git a/kernel/module/Kconfig b/kernel/module/Kconfig
> index d443fc504ffca0d1001f880ec496ab1f21fe979e..9568b629a03ce8289d3f3597e=
efc66fc96445720 100644
> --- a/kernel/module/Kconfig
> +++ b/kernel/module/Kconfig
> @@ -207,6 +207,16 @@ config ASM_MODVERSIONS
>           assembly. This can be enabled only when the target architecture
>           supports it.
>
> +config EXTENDED_MODVERSIONS
> +       bool "Extended Module Versioning Support"
> +       depends on MODVERSIONS
> +       help
> +         This enables extended MODVERSIONs support, allowing long symbol
> +         names to be versioned.
> +
> +         The most likely reason you would enable this is to enable Rust
> +         support. If unsure, say N.
> +
>  config MODULE_SRCVERSION_ALL
>         bool "Source checksum for all modules"
>         help
> diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
> index ab0e94ea62496e11dbaa3ffc289ce546862795ca..40426fc6350985780c0092beb=
49c6cc29b9eff62 100644
> --- a/scripts/Makefile.modpost
> +++ b/scripts/Makefile.modpost
> @@ -43,6 +43,7 @@ MODPOST =3D $(objtree)/scripts/mod/modpost
>  modpost-args =3D                                                        =
                 \
>         $(if $(CONFIG_MODULES),-M)                                       =
               \
>         $(if $(CONFIG_MODVERSIONS),-m)                                   =
               \
> +       $(if $(CONFIG_EXTENDED_MODVERSIONS),-x)                          =
               \
>         $(if $(CONFIG_MODULE_SRCVERSION_ALL),-a)                         =
               \
>         $(if $(CONFIG_SECTION_MISMATCH_WARN_ONLY),,-E)                   =
               \
>         $(if $(KBUILD_MODPOST_WARN),-w)                                  =
               \
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index fb787a5715f5e8b37713162979ca45355770dc73..c58f08681fc1e37929333ba3a=
3e0989c4db5a79d 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -33,6 +33,8 @@ static bool module_enabled;
>  static bool modversions;
>  /* Is CONFIG_MODULE_SRCVERSION_ALL set? */
>  static bool all_versions;
> +/* Is CONFIG_EXTENDED_MODVERSIONS set? */
> +static bool extended_modversions;
>  /* If we are modposting external module set to 1 */
>  static bool external_module;
>  /* Only warn about unresolved symbols */
> @@ -1804,6 +1806,52 @@ static void add_exported_symbols(struct buffer *bu=
f, struct module *mod)
>         }
>  }
>
> +/**
> + * Record CRCs for unresolved symbols, supporting long names
> + */
> +static void add_extended_versions(struct buffer *b, struct module *mod)
> +{
> +       struct symbol *s;
> +
> +       if (!extended_modversions)
> +               return;
> +
> +       buf_printf(b, "\n");
> +       buf_printf(b, "static const s32 ____version_ext_crcs[]\n");

In general, 's32' (i.e. signed) and the '%x' printf-format (i.e. unsigned)
are an odd combination. I know why you are mixing up these.

Previously, we had a reason to use 's32' because the 'crc' field may
contain a negative address offset.

After commit 7b4537199a4a, there is no more reason
for keeping this weirdness.

I will apply the following first.

https://lore.kernel.org/linux-kbuild/20241228154603.2234284-2-masahiroy@ker=
nel.org/T/#u

Then, you can change 's32' to 'u32' in this series.




> +       buf_printf(b, "__used __section(\"__version_ext_crcs\") =3D {\n")=
;
> +       list_for_each_entry(s, &mod->unresolved_symbols, list) {
> +               if (!s->module)
> +                       continue;
> +               if (!s->crc_valid) {
> +                       /*
> +                        * We already warned on this when producing the l=
egacy
> +                        * modversions table.
> +                        */
> +                       continue;

Personally, I tend to avoid a noise change because you will change this com=
ment
to warn() in the next commit.
It is up to you.



> +               }
> +               buf_printf(b, "\t%#8x,\n", s->crc);


This is also a copy-paste of the existing code.

I like to have zero-padding for better alignment.

Please follow this format:
https://lore.kernel.org/linux-kbuild/20241228154603.2234284-2-masahiroy@ker=
nel.org/T/#mc46376f41c0313c660990e92ed37689432f325c7




> +       }
> +       buf_printf(b, "};\n");
> +
> +       buf_printf(b, "static const char ____version_ext_names[]\n");
> +       buf_printf(b, "__used __section(\"__version_ext_names\") =3D\n");
> +       list_for_each_entry(s, &mod->unresolved_symbols, list) {
> +               if (!s->module)
> +                       continue;
> +               if (!s->crc_valid) {
> +                       /*
> +                        * We already warned on this when producing the l=
egacy
> +                        * modversions table.
> +                        * We need to skip its name too, as the indexes i=
n
> +                        * both tables need to align.
> +                        */
> +                       continue;
> +               }

Unnecessary braces.

Reason:
https://github.com/torvalds/linux/blob/v6.12/Documentation/process/coding-s=
tyle.rst?plain=3D1#L197


> +               buf_printf(b, "\t\"%s\\0\"\n", s->name);
> +       }
> +       buf_printf(b, ";\n");
> +}
> +
>  /**
>   * Record CRCs for unresolved symbols
>   **/
> @@ -1827,9 +1875,14 @@ static void add_versions(struct buffer *b, struct =
module *mod)
>                         continue;
>                 }
>                 if (strlen(s->name) >=3D MODULE_NAME_LEN) {
> -                       error("too long symbol \"%s\" [%s.ko]\n",
> -                             s->name, mod->name);
> -                       break;
> +                       if (extended_modversions)
> +                               /* this symbol will only be in the extend=
ed info */
> +                               continue;

You need braces here.

Reason:
https://github.com/torvalds/linux/blob/v6.12/Documentation/process/coding-s=
tyle.rst?plain=3D1#L213




--
Best Regards
Masahiro Yamada

