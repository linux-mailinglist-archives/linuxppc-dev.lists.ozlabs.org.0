Return-Path: <linuxppc-dev+bounces-16612-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4P6rOGtRhGkp2gMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16612-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Feb 2026 09:14:35 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9B3EFC7A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Feb 2026 09:14:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f69476l9hz2yFb;
	Thu, 05 Feb 2026 19:14:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770279271;
	cv=none; b=dDYrQpSgLDTbVfWHJdtGOAqNaaCYvgzde1J2j70NX9vSyITxJfIsZHD5a2wCoFMjWu4yfp7hJCPin7Q/h1N3G7S/O6bZL/ZXp9degy9kA7Vjt9Mv3UsSDhFZ+X0iysc2ELIdFWS+Ep6VdGKzXlEPMMhdsvDNBKhrj9h17nhvb736Kq3gziHPs4ql6u0qmvx6ytVyba24h75w9N8LQgVw9BAZD10OpQgGrI7cwjd5zHHY/VZYprCW8yjz5ZLrbPjb6+LeptJ1Cbtl0jDWjT5OaO6VU0FF7KFgBVdC1ymhwBgXhrrNNyztA69+BaxTrkEJh3yKfxGplCdDkui/q4P2mA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770279271; c=relaxed/relaxed;
	bh=WbJ2qWt8+naLT3O/Bsm6nMQ2lN5+Wm3WXMgIkB3Do/M=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=o23a3DQRIn+u1zL+cbOs8nogCrhMASB4TjbxgxJODe8A55s3CLpj3ONHDQTqhXUNKrDDUdQJ8TXTogjDwpguOnS/VhwRLYmTjfbPapOGbuPGZxI12gt/tu0q4HkPDdIYsUBINGCiqfbaZGcXYbqVK4WAWucdwJOuXTDWt5fGRKJmI0ooFrP1f7i2M2D72cZFfMK2pr8KmC+NR0qDSEhVGofsUX+r0yWWLr/WIWW5vjuT/n9L0fO8zXg3SHjVBxAYRbWP7uMKheFmv7GLSnCMcdDGqEv6Rchz5eFcgjp01f/P8NICjsu9HVz0oMb/y/RMlqb40dVVQY6sp8t1Idv0Aw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iyaGNRv2; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iyaGNRv2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f69466wY6z2xg9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Feb 2026 19:14:30 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 178084447C;
	Thu,  5 Feb 2026 08:14:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D34DC19421;
	Thu,  5 Feb 2026 08:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770279269;
	bh=FUwMNUGw/cKb8caxS4zPWsELhg0HADhxQNboK0Epa2E=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=iyaGNRv2Js5q9pgtoHuFBucTUOFUsUN1C2xgrkKqyESBhEHPj0pQKVVUlHpIo65s4
	 bGzpGqQWEmdfuOowPMZYKTQEQ/hjwstej2OE+O90+l2XPfpzbGaflh+LjF57tDss+e
	 21dJn313jpVF/pE2d4YAP4h80QMAJeWbE5kE5nbtYvHu/CJQ7wRkHMhE2fjACWNPny
	 JvySe+RFyzAbs8koXYQ3rTLHfwXV+I/C+89Ci4okrDFQ8jQSISg/FoppQ0E4kBQHSR
	 rl1SomuA9JxMXri6TO1hHNVxaR3vzYz2GD2Rl5zvvAZCIVqIZ+KWjSmfF1mIDai/8Z
	 WqEhN8JST13Ag==
Message-ID: <f3de29ec-ae58-4108-862b-a9457e8ac7eb@kernel.org>
Date: Thu, 5 Feb 2026 09:14:22 +0100
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 3/3] powerpc: Enable Rust for ppc64le
To: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>,
 linkmauve@linkmauve.fr, ojeda@kernel.org, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 dakr@kernel.org, corbet@lwn.net, maddy@linux.ibm.com, mpe@ellerman.id.au,
 npiggin@gmail.com, peterz@infradead.org, jpoimboe@kernel.org,
 jbaron@akamai.com, rostedt@goodmis.org, ardb@kernel.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
References: <20260204210125.613350-1-mkchauras@gmail.com>
 <20260204210125.613350-4-mkchauras@gmail.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260204210125.613350-4-mkchauras@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16612-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,linkmauve.fr,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,lwn.net,linux.ibm.com,ellerman.id.au,infradead.org,akamai.com,goodmis.org,vger.kernel.org,lists.ozlabs.org];
	FORGED_SENDER(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_RECIPIENTS(0.00)[m:mkchauras@gmail.com,m:linkmauve@linkmauve.fr,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:corbet@lwn.net,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:peterz@infradead.org,m:jpoimboe@kernel.org,m:jbaron@akamai.com,m:rostedt@goodmis.org,m:ardb@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	REDIRECTOR_URL(0.00)[aka.ms];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aka.ms:url]
X-Rspamd-Queue-Id: 5E9B3EFC7A
X-Rspamd-Action: no action



Le 04/02/2026 à 22:01, Mukesh Kumar Chaurasiya (IBM) a écrit :
> [Vous ne recevez pas souvent de courriers de mkchauras@gmail.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> Enabling rust support for ppc64le only.
> 
> Tested on powernv9:
> 
> $ uname -rm
> 6.19.0-rc8+ ppc64le
> 
> $ sudo modprobe rust_minimal
> [  632.890850] rust_minimal: Rust minimal sample (init)
> [  632.890881] rust_minimal: Am I built-in? false
> [  632.890898] rust_minimal: test_parameter: 1
> 
> $ sudo rmmod rust_minimal
> [  648.272832] rust_minimal: My numbers are [72, 108, 200]
> [  648.272873] rust_minimal: Rust minimal sample (exit)
> 
> $ sudo modprobe rust_print
> [  843.410391] rust_print: Rust printing macros sample (init)
> [  843.410424] rust_print: Emergency message (level 0) without args
> [  843.410451] rust_print: Alert message (level 1) without args
> [  843.410477] rust_print: Critical message (level 2) without args
> [  843.410503] rust_print: Error message (level 3) without args
> [  843.410530] rust_print: Warning message (level 4) without args
> [  843.410557] rust_print: Notice message (level 5) without args
> [  843.410594] rust_print: Info message (level 6) without args
> [  843.410617] rust_print: A line that is continued without args
> [  843.410646] rust_print: Emergency message (level 0) with args
> [  843.410675] rust_print: Alert message (level 1) with args
> [  843.410691] rust_print: Critical message (level 2) with args
> [  843.410727] rust_print: Error message (level 3) with args
> [  843.410761] rust_print: Warning message (level 4) with args
> [  843.410796] rust_print: Notice message (level 5) with args
> [  843.410821] rust_print: Info message (level 6) with args
> [  843.410854] rust_print: A line that is continued with args
> [  843.410892] rust_print: 1
> [  843.410895] rust_print: "hello, world"
> [  843.410924] rust_print: [samples/rust/rust_print_main.rs:35:5] c = "hello, world"
> [  843.410977] rust_print: Arc<dyn Display> says 42
> [  843.410979] rust_print: Arc<dyn Display> says hello, world
> 
> $ sudo rmmod rust_print
> [  843.411003] rust_print: "hello, world"
> [  888.499935] rust_print: Rust printing macros sample (exit)
> 
> Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>

Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

Small comment below

> ---
>   Documentation/rust/arch-support.rst | 2 +-
>   arch/powerpc/Kconfig                | 2 +-
>   arch/powerpc/Makefile               | 9 ++++++++-
>   rust/Makefile                       | 9 ++++++++-
>   4 files changed, 18 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arch-support.rst
> index e26a94808e97..627471ac9238 100644
> --- a/Documentation/rust/arch-support.rst
> +++ b/Documentation/rust/arch-support.rst
> @@ -18,7 +18,7 @@ Architecture   Level of support  Constraints
>   ``arm``        Maintained        ARMv7 Little Endian only.
>   ``arm64``      Maintained        Little Endian only.
>   ``loongarch``  Maintained        \-
> -``powerpc``    Experimental      32-bit Big Endian only.
> +``powerpc``    Experimental      64-bit Little Endian. 32-bit Big Endian.
>   ``riscv``      Maintained        ``riscv64`` and LLVM/Clang only.
>   ``um``         Maintained        \-
>   ``x86``        Maintained        ``x86_64`` only.
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 17db23b82e91..c5dd03713af2 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -283,7 +283,7 @@ config PPC
>          select HAVE_REGS_AND_STACK_ACCESS_API
>          select HAVE_RELIABLE_STACKTRACE
>          select HAVE_RSEQ
> -       select HAVE_RUST                        if PPC32
> +       select HAVE_RUST                        if PPC32 || (PPC64 && CPU_LITTLE_ENDIAN)

Would be better to leave the first line as is and add a second line as 
follows:

	select HAVE_RUST			if PPC64 && CPU_LITTLE_ENDIAN

>          select HAVE_SAMPLE_FTRACE_DIRECT        if HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
>          select HAVE_SAMPLE_FTRACE_DIRECT_MULTI  if HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
>          select HAVE_SETUP_PER_CPU_AREA          if PPC64
> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index 9fd82c75dcbd..f93816ddc036 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -61,7 +61,14 @@ else
>   KBUILD_LDFLAGS_MODULE += $(objtree)/arch/powerpc/lib/crtsavres.o
>   endif
> 
> -KBUILD_RUSTFLAGS += --target=powerpc-unknown-linux-gnu
> +ifdef CONFIG_PPC64
> +ifdef CONFIG_CPU_LITTLE_ENDIAN
> +KBUILD_RUSTFLAGS       += --target=powerpc64le-unknown-linux-gnu
> +endif
> +KBUILD_RUSTFLAGS       += -Ctarget-feature=-mma,-vsx,-hard-float,-altivec
> +else
> +KBUILD_RUSTFLAGS       += --target=powerpc-unknown-linux-gnu
> +endif
> 
>   ifdef CONFIG_CPU_LITTLE_ENDIAN
>   KBUILD_CPPFLAGS        += -mlittle-endian
> diff --git a/rust/Makefile b/rust/Makefile
> index ae22f2c5f0b3..c3961fd0d9a4 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -392,10 +392,17 @@ BINDGEN_TARGET_x86        := x86_64-linux-gnu
>   BINDGEN_TARGET_arm64   := aarch64-linux-gnu
>   BINDGEN_TARGET_arm     := arm-linux-gnueabi
>   BINDGEN_TARGET_loongarch       := loongarch64-linux-gnusf
> -BINDGEN_TARGET_powerpc := powerpc-linux-gnu
>   BINDGEN_TARGET_um      := $(BINDGEN_TARGET_$(SUBARCH))
>   BINDGEN_TARGET         := $(BINDGEN_TARGET_$(SRCARCH))
> 
> +ifdef CONFIG_PPC64
> +ifdef CONFIG_CPU_LITTLE_ENDIAN
> +BINDGEN_TARGET_powerpc := powerpc64le-linux-gnu
> +endif
> +else
> +BINDGEN_TARGET_powerpc := powerpc-linux-gnu
> +endif
> +
>   # All warnings are inhibited since GCC builds are very experimental,
>   # many GCC warnings are not supported by Clang, they may only appear in
>   # some configurations, with new GCC versions, etc.
> --
> 2.52.0
> 


