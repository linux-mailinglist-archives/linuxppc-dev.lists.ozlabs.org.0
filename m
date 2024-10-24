Return-Path: <linuxppc-dev+bounces-2558-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3167D9AF5AE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2024 01:06:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XZM3q5LY4z2yM6;
	Fri, 25 Oct 2024 10:06:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729811191;
	cv=none; b=fRf88L5WXbFRHTsfibqOs69vI04Kl9ucr9EQO6ueiMmF2ug+mwJMQXdiQ7pygu7eCYizDAJnjRKjKs7hWbm/51VF5n1l840ayy/lruX4bF4v5Xj5Zrk6spYLTzcX2xxM+WStUxLbzSfauj9yQPvUElKZXsYNNlSncPik+3KK576hBDQ34zvP6FjiKxVBa/wnZNP3tNtw9jwduti6ViD4Rt4B5LrTW/oPUO3KeIV8fI7IXtfJwhNZMOgDjNS61u+2JBF3B1zXpa/g0BruupDSX2ybxg2Ldxu5rZPdxJADXomcV62aTq7rnTBHL9wQgkWh1phoWHUGTOfNQ8n6BnHydg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729811191; c=relaxed/relaxed;
	bh=ETJZ+z0riIyNZ07U3QSTstx4QvvpQHVTh5tLw1Ae2tI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g/GJsd8ZAjO/J6b5TOowXdqN2YC4mni+5Ivi/BWRLpw6UAPfq8UoNHPL8qq7vRn038hy9bxxU1DE2B9su5DkvIzXFn8Jvrol1hsqxNODAjW7FMwh8Afn9k3qetOaS0ASjXg1yYt4X4o2kKhMLLHvF1o+AKmMbEE/MpxvNPM8Dgfn+oEH+DitfSabUyY8cjTEU9xcInTPwoGqRzxihknEoFVq97H8GQO5YtcHLOdY4t09LLdEBzP3Xa5s+rg6vytoUk6bx7kjjNLlbKYqr5WFeEaQP+/bLPOz9WyQgO3YkYKKuB54FLPwMPFrBZN9k8rhza9bzKNua6xXYlsnd/QfXQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=cBkmc8sE; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=samitolvanen@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=cBkmc8sE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=samitolvanen@google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XZM3p3lZfz2xrJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2024 10:06:29 +1100 (AEDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-20ca03687fdso41965ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Oct 2024 16:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729811187; x=1730415987; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ETJZ+z0riIyNZ07U3QSTstx4QvvpQHVTh5tLw1Ae2tI=;
        b=cBkmc8sEG9JgWwWzegOvv5baGicSO1JpbJqQDAmkZxHyOYv2+9gIJzr7qy7utZErtL
         pGa23aC6X9xDEN7MfUztby9tLV7RtQK4b6fwXtnJUa3VQ6088jXKwVQSA8JTpdgwHkp5
         Vq/obn15S2wSzW3reV8shkQgJvWsDcar6+kSwZxP+A0rKa6/TCSsYpJpPhlQBtHNYAM5
         tGEOge6Bq2YuXqv/P8TyWs+pDBP1sEUZdpZGhjD/N5J9NnWYuQDsWw9BrhwsBNyXy9Pc
         FB3Cr6msMBNKUrLmRr2pXhEvkdU5g7JrG6x/BjtTeJSjQ3SCf3+T05xLCbqJDMoB/EYL
         dbgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729811187; x=1730415987;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ETJZ+z0riIyNZ07U3QSTstx4QvvpQHVTh5tLw1Ae2tI=;
        b=uQcP87+TuUWO6hXNE77osKZVVRknqTaRITtlBSYiXBUwcIZJDW/J7xD7Xr4iV6yB6U
         ysFRmXPvSfX3J+q2MGY0z24YNdOFkIHkuFzR0j3gBA+gDGX3ty8EoPymLKPAXJTGFbp8
         exZtpsm1XHhIg72vM8AEaWwuUnC/hG0uo3MZB11UzEWtuVTWgkwGSWS96/AbZf+TKU80
         Xn1LJGvKqCrf+wjBNM1/RZ+usb4OK1WERomaAbhtxHaiG+bFACeNEjaBRmoBrbYwvtKJ
         lzee9O75++gOwsvMk4O7k0ci6hPKh7QVDK0O3m+8vsPrxjICTi3jafX7vLU3S6ZPOMJn
         ol+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUClXViYQpqsiPf1SqFSy8arhdOnZBRioMruCH9iZn+6uZqqE3fjuj9LVWbVM+vdHHYLEOa6RbuxU8O6DA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxFVLHkgrQjMwYD92CVpOnbxVrhBlwkJZtSvQDlKQtFSWTs1DWg
	yyOErcH0h62aXw+gtMzWNp/tLJPX9GzlukGVKWlwxNgQo9WzTXVsYcAhVCHWjQ==
X-Google-Smtp-Source: AGHT+IFJuHdwPAvfIIk6Cjv1uHcC4bkvVJ4gTYWWjL2dM+mbjxBVmFxEzO9xnCcZL8zQeDD9a34Ovw==
X-Received: by 2002:a17:903:2445:b0:20b:a2b8:1850 with SMTP id d9443c01a7336-2105b1d0744mr482185ad.15.1729811186359;
        Thu, 24 Oct 2024 16:06:26 -0700 (PDT)
Received: from google.com (254.80.82.34.bc.googleusercontent.com. [34.82.80.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7ef0cc7csm76651665ad.101.2024.10.24.16.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 16:06:25 -0700 (PDT)
Date: Thu, 24 Oct 2024 23:06:22 +0000
From: Sami Tolvanen <samitolvanen@google.com>
To: Matthew Maurer <mmaurer@google.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v7 3/3] rust: Use gendwarfksyms + extended modversions
 for CONFIG_MODVERSIONS
Message-ID: <20241024230622.GC1382412@google.com>
References: <20241023-extended-modversions-v7-0-339787b43373@google.com>
 <20241023-extended-modversions-v7-3-339787b43373@google.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023-extended-modversions-v7-3-339787b43373@google.com>
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Oct 23, 2024 at 02:31:30AM +0000, Matthew Maurer wrote:
> From: Sami Tolvanen <samitolvanen@google.com>
> 
> Previously, two things stopped Rust from using MODVERSIONS:
> 1. Rust symbols are occasionally too long to be represented in the
>    original versions table
> 2. Rust types cannot be properly hashed by the existing genksyms
>    approach because:
> 	* Looking up type definitions in Rust is more complex than C
> 	* Type layout is potentially dependent on the compiler in Rust,
> 	  not just the source type declaration.
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
>  rust/Makefile | 32 ++++++++++++++++++++++++++++++--
>  2 files changed, 32 insertions(+), 3 deletions(-)
> 
> diff --git a/init/Kconfig b/init/Kconfig
> index 530a382ee0feb391b4717abdba3672e584a462d0..f5cce579f29b2ed89e97f8075a3bf70e32e71ad0 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -1942,7 +1942,8 @@ config RUST
>  	bool "Rust support"
>  	depends on HAVE_RUST
>  	depends on RUST_IS_AVAILABLE
> -	depends on !MODVERSIONS
> +	select EXTENDED_MODVERSIONS if MODVERSIONS
> +	depends on (GENDWARFKSYMS || !MODVERSIONS)

Nit: `depends on !MODVERSIONS || GENDWARFKSYMS` would match the
convention used below.

> +cmd_gendwarfksyms = $(if $(skip_gendwarfksyms),, \
> +	$(call rust_exports,$@,"%s\n",$$3) | \
> +	scripts/gendwarfksyms/gendwarfksyms \
> +		$(if $(KBUILD_SYMTYPES), --symtypes $(@:.o=.symtypes),) \
> +		$@ >> $(dot-target).cmd)

Note that Petr suggested adding a KBUILD_ flag for passing the
--stable parameter to gendwarfksyms, which I think would be useful,
so once I send out v5 of that series, we'll have to update this to
also use the parameter when processing Rust objects:

https://lore.kernel.org/linux-modules/8017c328-f039-46c3-b472-f203cd6e2cfe@suse.com/

Sami

