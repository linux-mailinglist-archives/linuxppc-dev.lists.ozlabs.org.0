Return-Path: <linuxppc-dev+bounces-5263-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AF4A11092
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2025 19:58:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YXdgn1mhnz30NN;
	Wed, 15 Jan 2025 05:58:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::632"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736881109;
	cv=none; b=gIBUwqXCqUjuQtrvlnUKn09TicGnZfSa56mjAYqwEXMCwitA5YpICYOxQxYffhCYgyiF1jZYp/UsSvUN5YlTZz/DpLydy/h9LCt10Av87vUg443k9NiPqHGBphyGj7SaV4kG98IVkxtops63Cz59WVfeLtelP/axqTzK9jJKpcKopigWb8RdAWXiI/egMhJXhrwEz2qKslYKFpv9m88HVYik3JMfTFhI8ELJFzPr+Kx0xoJ5eGLydgToSNKbXGA++daC+qmaMmO1DTXhKNBWlQVPR//UmS+R0N+PN/jtNiCt30e9F63Fi9eN0cTD+bSZlFYea1eoXpTiJ8NqCobJtw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736881109; c=relaxed/relaxed;
	bh=t2CWdiE+Y588cATxDxllUErMB/2Ly3FWAF67BGEJO/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AitdeM9Vk0nGLePaR3hcsfpDeJMMxeQHJG7/B6l7o8ufYETrQtFpCbKvigAXNAmFG+A+JggIGWkS0Of+c8C3QbFHMdBSNEWilW37OHxW7RJa9dBU9RPSQZqDUsdITnvq0cPO7aUbvepwcYRrXY/CV34F/dNaXM96ILXwLZA5DmZXEa2bPYMcIRHXBguXvfXIySBfRoi99IpPmVAjQ0UgMKy0DN480uJYUoAtlwwZHnRAR9j/tFCLvdXrpRN1UQ9uP9pTgKt9YrrU3eMQjyrT1CQqneEX/WVCz3/i8OXBuLbFqVASoZS4ekWhZ/7a+RYuOGQVOVPaILpXId5WVddckg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=WzZcDkDR; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=samitolvanen@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=WzZcDkDR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=samitolvanen@google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YXdgl4SYbz3039
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jan 2025 05:58:26 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-215740b7fb8so214005ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2025 10:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736881104; x=1737485904; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t2CWdiE+Y588cATxDxllUErMB/2Ly3FWAF67BGEJO/4=;
        b=WzZcDkDR75VZhGe8Rw6TsBmCQQt0at1bVRlQClv9YQnGZHX4esCU6RKFZhl5eAsfAR
         C/D20Ivv2SMP994XadJseeIQnd2c8AGTbeDqFVAPZGkYa7flEDPxqgL7N+nUj/XjFfBu
         aeU21UwiVxjBE68wYLK3kKzRpefTsy//9nC+SQo1KFRbOyVbPgB3bRqHpX6JB130elLo
         oeqUlgturpkeLUuEY5I/j7oCzJjboWqjJ8DBvpwT+iQKDoWYI3C0y08NKFni2Ts7bEak
         IF/UphbDgorPSpBau37xT0jBE/s6hMt8oa5UtxR1N7/22o8HGyrYIz8NsIz0A2QOeiWC
         LcLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736881104; x=1737485904;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t2CWdiE+Y588cATxDxllUErMB/2Ly3FWAF67BGEJO/4=;
        b=Je1P+gXaoRQLV/Vn4zXq3JBcaRr4q9pfgFrcHAPlSJCOjXY1/wGFHXx4n3wWbkYuJx
         D+RJvew4Ka6nnJWvUuB2zHCuBTAlldsNLVPZDcr220Nal5LqNhigTmFYJhVqCtnIWsB3
         Q5o8RUGJ03b8tcnwKu/vWvyTQ5uaVORjSXV3eqIRYtTZqhFMX2zrAqSgoUsW4YQ2vKkY
         NNokBpdTm+Q7ykKCNkBHACdC+1i5JgmLAPZlyqFn3+/TdpuR0aCZQ7ejV9l/GhTIznhs
         vaQTYDcPmmzw+iWh1mhafRx9n0D60jCI6S3WQpQGd5BJFLi9bZMj0zAAVOdSKq4FF6K2
         yxaA==
X-Forwarded-Encrypted: i=1; AJvYcCUWWVIssXSdHBIG/3MGwEvaGxVpdktxWbxlfo/gf6B6N7V8JysyZIDmzOAehV8B22veM2UdYS1wSQpOO/w=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyXz3R2BaYt6G0SKhWjRe9Mhsweyeb/zxF9f19fR8zBFoL1+Emz
	B76IckzkVd7OFnCfTkeEYWq3hsfbSOcFZKzY7ILbDMaWXQqc2Mm7O3RIFsX5jg==
X-Gm-Gg: ASbGnctlw6/+/68NMiy33tm5wipqNut3PQ54rlMmWy9KL/f6dCmTYz2tcLkAcAIvnLn
	ptDOtkUgMowi0hBFJ1nAxyMp/RLYKOTHRlWBeMpb62eqcztv29pJTW+uxpGAkctU34dIN2++bWh
	NtBMuw47vyAqpc5Z1ZrKWLKN/6IwwZ13y7+tu8+Y4W2VMF/u79OT2XY1PDVfqev6CjH89ZCzaHn
	nfa+32LlD8FStGvBeAedyfJqPcY5iVlh7wu6J05UmDulC1ZCnAj+1lp1RtAQ1a0bwiSxf+4h3yh
	w61xiTO9ieHEcK698Ubq3PNP/5o=
X-Google-Smtp-Source: AGHT+IG/013Oj515jx+bAnxAgTCQ+vTnK59fPTZt8oVE2ZAEpSVnb9QRz1EEDwXZHaYE7mba9SJ2Ig==
X-Received: by 2002:a17:903:492:b0:20b:5e34:1850 with SMTP id d9443c01a7336-21bf0e598d9mr26285ad.23.1736881104251;
        Tue, 14 Jan 2025 10:58:24 -0800 (PST)
Received: from google.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f2339dasm69151185ad.177.2025.01.14.10.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 10:58:23 -0800 (PST)
Date: Tue, 14 Jan 2025 18:58:19 +0000
From: Sami Tolvanen <samitolvanen@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Matthew Maurer <mmaurer@google.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Jonathan Corbet <corbet@lwn.net>, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v13 5/5] rust: Use gendwarfksyms + extended modversions
 for CONFIG_MODVERSIONS
Message-ID: <20250114185819.GA2222429@google.com>
References: <20250103-extended-modversions-v13-0-35d87c65ee04@google.com>
 <20250103-extended-modversions-v13-5-35d87c65ee04@google.com>
 <CAK7LNATGw-m_dcdjTBHsFwCZh7mTt8q8yNZQ7VFP=hMU8NvUvg@mail.gmail.com>
 <CABCJKuf-w1puUsypU-cr5BH8uvCdPPQmhZZ1qVKDDg3Y-iQhSg@mail.gmail.com>
 <CAK7LNASh4xMN8nN5vwR6R1OCNW9u4MJz=CSwW4_4hvFOhczmWA@mail.gmail.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNASh4xMN8nN5vwR6R1OCNW9u4MJz=CSwW4_4hvFOhczmWA@mail.gmail.com>
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Jan 14, 2025 at 10:22:15AM +0900, Masahiro Yamada wrote:
> On Tue, Jan 14, 2025 at 5:04 AM Sami Tolvanen <samitolvanen@google.com> wrote:
> >
> > Hi Masahiro,
> >
> > On Fri, Jan 10, 2025 at 6:26 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > >
> > > On Sat, Jan 4, 2025 at 2:37 AM Matthew Maurer <mmaurer@google.com> wrote:
> > > >
> > > > From: Sami Tolvanen <samitolvanen@google.com>
> > > >
> > > > Previously, two things stopped Rust from using MODVERSIONS:
> > > > 1. Rust symbols are occasionally too long to be represented in the
> > > >    original versions table
> > > > 2. Rust types cannot be properly hashed by the existing genksyms
> > > >    approach because:
> > > >         * Looking up type definitions in Rust is more complex than C
> > > >         * Type layout is potentially dependent on the compiler in Rust,
> > > >           not just the source type declaration.
> > > >
> > > > CONFIG_EXTENDED_MODVERSIONS addresses the first point, and
> > > > CONFIG_GENDWARFKSYMS the second. If Rust wants to use MODVERSIONS, allow
> > > > it to do so by selecting both features.
> > > >
> > > > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> > > > Co-developed-by: Matthew Maurer <mmaurer@google.com>
> > > > Signed-off-by: Matthew Maurer <mmaurer@google.com>
> > > > ---
> > > >  init/Kconfig  |  3 ++-
> > > >  rust/Makefile | 34 ++++++++++++++++++++++++++++++++--
> > > >  2 files changed, 34 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/init/Kconfig b/init/Kconfig
> > > > index c1f9eb3d5f2e892e977ba1425599502dc830f552..b60acfd9431e0ac2bf401ecb6523b5104ad31150 100644
> > > > --- a/init/Kconfig
> > > > +++ b/init/Kconfig
> > > > @@ -1959,7 +1959,8 @@ config RUST
> > > >         bool "Rust support"
> > > >         depends on HAVE_RUST
> > > >         depends on RUST_IS_AVAILABLE
> > > > -       depends on !MODVERSIONS
> > > > +       select EXTENDED_MODVERSIONS if MODVERSIONS
> > > > +       depends on !MODVERSIONS || GENDWARFKSYMS
> > > >         depends on !GCC_PLUGIN_RANDSTRUCT
> > > >         depends on !RANDSTRUCT
> > > >         depends on !DEBUG_INFO_BTF || PAHOLE_HAS_LANG_EXCLUDE
> > > > diff --git a/rust/Makefile b/rust/Makefile
> > > > index a40a3936126d603836e0ec9b42a1285916b60e45..80f970ad81f7989afe5ff2b5f633f50feb7f6006 100644
> > > > --- a/rust/Makefile
> > > > +++ b/rust/Makefile
> > > > @@ -329,10 +329,11 @@ $(obj)/bindings/bindings_helpers_generated.rs: private bindgen_target_extra = ;
> > > >  $(obj)/bindings/bindings_helpers_generated.rs: $(src)/helpers/helpers.c FORCE
> > > >         $(call if_changed_dep,bindgen)
> > > >
> > > > +rust_exports = $(NM) -p --defined-only $(1) | awk '$$2~/(T|R|D|B)/ && $$3!~/__cfi/ { printf $(2),$(3) }'
> > > > +
> > > >  quiet_cmd_exports = EXPORTS $@
> > > >        cmd_exports = \
> > > > -       $(NM) -p --defined-only $< \
> > > > -               | awk '$$2~/(T|R|D|B)/ && $$3!~/__cfi/ {printf "EXPORT_SYMBOL_RUST_GPL(%s);\n",$$3}' > $@
> > > > +       $(call rust_exports,$<,"EXPORT_SYMBOL_RUST_GPL(%s);\n",$$3) > $@
> > >
> > > I noticed a nit:
> > >
> > > Both of the two callsites of rust_exports pass
> > > '$$3' to the last parameter instead of hardcoding it.
> > >
> > > Is it a flexibility for future extensions?
> > >
> > > I cannot think of any other use except for printing
> > > the third column, i.e. symbol name.
> >
> > Good catch, the last parameter isn't necessary anymore. It was used in
> > early versions of the series to also pass symbol addresses to
> > gendwarfksyms, but that's not needed since we read the symbol table
> > directly now.
> 
> If you submit a diff, I will squash it to 5/5.
> (You do not need to input commit description body)

Thanks, here's a diff that drops the last parameter.

Sami


diff --git a/rust/Makefile b/rust/Makefile
index 80f970ad81f7..ab300bfb46f6 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -329,11 +329,11 @@ $(obj)/bindings/bindings_helpers_generated.rs: private bindgen_target_extra = ;
 $(obj)/bindings/bindings_helpers_generated.rs: $(src)/helpers/helpers.c FORCE
 	$(call if_changed_dep,bindgen)
 
-rust_exports = $(NM) -p --defined-only $(1) | awk '$$2~/(T|R|D|B)/ && $$3!~/__cfi/ { printf $(2),$(3) }'
+rust_exports = $(NM) -p --defined-only $(1) | awk '$$2~/(T|R|D|B)/ && $$3!~/__cfi/ { printf $(2),$$3 }'
 
 quiet_cmd_exports = EXPORTS $@
       cmd_exports = \
-	$(call rust_exports,$<,"EXPORT_SYMBOL_RUST_GPL(%s);\n",$$3) > $@
+	$(call rust_exports,$<,"EXPORT_SYMBOL_RUST_GPL(%s);\n") > $@
 
 $(obj)/exports_core_generated.h: $(obj)/core.o FORCE
 	$(call if_changed,exports)
@@ -404,7 +404,7 @@ endif
 
 ifdef CONFIG_MODVERSIONS
 cmd_gendwarfksyms = $(if $(skip_gendwarfksyms),, \
-	$(call rust_exports,$@,"%s\n",$$3) | \
+	$(call rust_exports,$@,"%s\n") | \
 	scripts/gendwarfksyms/gendwarfksyms \
 		$(if $(KBUILD_GENDWARFKSYMS_STABLE), --stable) \
 		$(if $(KBUILD_SYMTYPES), --symtypes $(@:.o=.symtypes),) \

