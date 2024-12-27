Return-Path: <linuxppc-dev+bounces-4485-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF5B9FD0A6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Dec 2024 07:50:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YKGMc1MGrz2xKL;
	Fri, 27 Dec 2024 17:50:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735282204;
	cv=none; b=C7S54a6vvPSLmp31L4PMpTQgsTDFcno/Gd+22AjOdRcy7vqkHE/bP0iayYWM4v6iRmKMkRD9iZY0LQEuuKkoLrqqHuWIA4DE+qFz0u7R2fYKmQmGMkkDy0COuAiW5Is0MSRW4t58FDwMWcilDXr16tz+zQUXqSoF65c4LRAHeh4dzqwWMBxtWaCEu1xcZJcAA24Xw8Ocw0qucayupNuDaMsFfcPyNVq0IJN9uP2WfMCl/aQp3Zcl4zyKoC6cm6RZdYT/EuXEiLNtRS7VBUyNFsgt6jGLqlUwN0dKNmo/xTWBmtDj+ju9wIC+QLgW4yal2jhUlcFfooAL7qwd3vCMwg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735282204; c=relaxed/relaxed;
	bh=CQWY+KPP0dr9K6HS5LtEaqWFZnorkYBcTwtRQZMMre0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZFtip4jKCD60m7CkBFy+hjUCIHa/FW6wMH8ICK2d5+kEe8I2hBdJ0hJ3MLynnRtN2s4v+tVYqw1pbDf3FUMCSjjTIK3njssujZE7bSbTgCVxB+mhON26xE7ZvIojHw+GPD1SBYTLGisohlPpX6MciQuYe040tr6F0QKBLUdLBnr9bHrlnDvGFfa0nOKHE/j8jUV+4fQkXYB+6LKU944F09XqLZYDO2e8NLJoL/4H9nhhrSEdfNR79MB9Q8GutNJJ++7TpvfKeeGahK5AzYQuQN9a8Zlf5imhltcXoY9U2v+iCU+73fQ9ya8+Nm0vm5LVkO1UVL9uuXi8YO8umz9Q3g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Pk4tX6D2; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=masahiroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Pk4tX6D2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=masahiroy@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YKGMZ6hplz2xJ8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Dec 2024 17:50:02 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 66327A4116F
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Dec 2024 06:48:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 808B3C4CEE7
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Dec 2024 06:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735282198;
	bh=hoLcZ+iT2dPn/slVVxv5fcZZF+pgka9JveM30viNiMg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Pk4tX6D29jsCMtwnAvNvxrSrih/vzfBSdcvD8vkIgdKLeLk9sATjFybus2OU9E9Sh
	 T/aNUr8TXUhInanpcfKjUANfyOS2V2WAxtgMiqPfuF/CH4qsiNwuUfYJzPVUuYSoIH
	 s9jkBwrUWn8yIzTVjvVZGY6TMZ4++SU6hWdQu/bpHcrxAeej4bsi2qZZyq318DSZjm
	 1yMiS2ZcrjBiCjIgK/FJNZV+tBNzQYXZYLRU+vscFJJub8e0ZVeVJ4XQRJOWwuJMl0
	 HOvLddb4jAJ3iZWn2VppuRz8yUxkbou4BRoGNUxpoCTGulKsack2zq1gJJrczEsbDp
	 7EWiYQtqb1KnA==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-303489e8775so76766451fa.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Dec 2024 22:49:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXTpBMnrCn6nf5vVDsoueYhkj1SHW3CNLJzQeH4PYWtL4NvxI74tCz8FWralV/0v2NkvRfH3ojiQQuNzmY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzJffte5pQHtvONvOUs4bhpkpeMQ4YvCraxTn+u2MOxShXgDsmv
	5qtaLHQHpOHXpAKVf6K5CmFvyqNGmq2XzIc2b7lG4efCw7YJCFoyhrAc1TA2iJ7KfxYmtpMOy/T
	HNGUaFYHRIFWy1LXO+ccHvRXfNzA=
X-Google-Smtp-Source: AGHT+IEfRIbAUfDGKqjk6EcYuB0PBijqceiyA7AyuHs+mi/poGZ6JbhNivinK0tX7pp0w8VpBEdhwiU4O5CAAZ1FhBA=
X-Received: by 2002:a05:6512:e98:b0:541:21d7:7056 with SMTP id
 2adb3069b0e04-542295301b4mr8226939e87.17.1735282196979; Thu, 26 Dec 2024
 22:49:56 -0800 (PST)
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
References: <20241223-extended-modversions-v11-0-221d184ee9a7@google.com> <20241223-extended-modversions-v11-3-221d184ee9a7@google.com>
In-Reply-To: <20241223-extended-modversions-v11-3-221d184ee9a7@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 27 Dec 2024 15:49:20 +0900
X-Gmail-Original-Message-ID: <CAK7LNARGJ8UMaiGC71f_wfk5ZqwhV2WD_Zf3NsQuS-+u_uT-iA@mail.gmail.com>
Message-ID: <CAK7LNARGJ8UMaiGC71f_wfk5ZqwhV2WD_Zf3NsQuS-+u_uT-iA@mail.gmail.com>
Subject: Re: [PATCH v11 3/5] modules: Allow extended modversions without basic MODVERSIONS
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
> If you know that your kernel modules will only ever be loaded by a newer
> kernel, you can disable BASIC_MODVERSIONS to save space. This also
> allows easy creation of test modules to seee how tooling will respond to


seee -> see


> modules that only have the new format.
>
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> ---
>  kernel/module/Kconfig    | 15 +++++++++++++++
>  scripts/Makefile.modpost |  1 +
>  scripts/mod/modpost.c    | 19 +++++++++++--------
>  3 files changed, 27 insertions(+), 8 deletions(-)
>
> diff --git a/kernel/module/Kconfig b/kernel/module/Kconfig
> index 9568b629a03ce8289d3f3597eefc66fc96445720..5f701391ab12c7d1b3ca496c9=
b3443c5a76a8745 100644
> --- a/kernel/module/Kconfig
> +++ b/kernel/module/Kconfig
> @@ -217,6 +217,21 @@ config EXTENDED_MODVERSIONS
>           The most likely reason you would enable this is to enable Rust
>           support. If unsure, say N.
>
> +config BASIC_MODVERSIONS
> +       bool "Basic Module Versioning Support"
> +       depends on MODVERSIONS
> +       default MODVERSIONS

Nit:

            default y

is simpler.


--
Best Regards

Masahiro Yamada

