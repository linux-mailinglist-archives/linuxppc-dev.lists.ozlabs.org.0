Return-Path: <linuxppc-dev+bounces-16599-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2G++OoaYg2lnpwMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16599-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Feb 2026 20:05:42 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B883EBDB8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Feb 2026 20:05:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f5qYs4CCDz2xpk;
	Thu, 05 Feb 2026 06:05:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::72b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770231937;
	cv=none; b=niNyWnu+OuXoz9ew1LCbcIuCwYh9lYZyCrAiz7NGm+A60AUeuCprFsFGOjuWoi9fPaPC6FFxPXl6aL7Mi918bFPBsLaynbtkBValATj3z9TCvyFOkqVBD5DvST1ub/bkcc8c99PDe5QVnM8X/j/y9wibVWu2rTkDGDNfjD+WfHaWXjAkCO3+hG3la16uFVtckwi8eiTVY6tlMToUtA654By1vN9PYZ5JdXzGY80yVvKJCYIdh5m3aLlQR6IqAZb0REuchU1XAV+GPDbHPt18upieHVAkIynww3myGd9R9yfjxlj9+/033sZiNIpp9nxLdNsXDcSBrvfZK+Xe3prtYw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770231937; c=relaxed/relaxed;
	bh=qrnr88nIhCevN+aceQs8WpTSQON3sJePiJ1Sjfxvheg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kuqV6duKtj3Q3iL6s17uxdzt+4e4Uh18TFw5qQefcIoUNV/84I+vhZksr7s+FjfL+g0wH5DjtKtZuJStkSREb7nClVXs0qCS68KnkFgfYdsQPYhN/KDnN+JggbRAxQuktXbp0kNMBJsIkaEv/UvnQQyrL7WCuGn02FDEETUxmPN15mvDRA2KxH+fx0uzz9mvO0BgQRyLxx/ImVa0Thtlo+6ReIodA/U9B+anJNQ6tfCdujiFGoP02Y+i1kRbG26DEpHjwK54s11gi/hOVD/EAncECtPmLdUugpnwXmy83PBLlRcaScwyQhkuo0IXFpE2SaStbETzx9r7m97QupHPQQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HaowEHxV; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::72b; helo=mail-qk1-x72b.google.com; envelope-from=mkchauras@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HaowEHxV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72b; helo=mail-qk1-x72b.google.com; envelope-from=mkchauras@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f5qYq6pqvz2xJ5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Feb 2026 06:05:34 +1100 (AEDT)
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-8c7146b0854so5499285a.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Feb 2026 11:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770231931; x=1770836731; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qrnr88nIhCevN+aceQs8WpTSQON3sJePiJ1Sjfxvheg=;
        b=HaowEHxVVyuHbcX3p5JvIffi+Sn7pgMcCPxLpaHaMKLiUcixcoN2P+AyWNewBujq+i
         8DhIo/i1M0b1tKbVO6bQi3iGUYAmVK3mHf+bd02fhq47XvO/Y2stgpZyrQ2tyadIpC1N
         YYKTe9JBRittwOlguh3blg98zAdpAb06+xOFGK84TkOcycwH6eJpOOqCqEdEkqHr6xcx
         Ns13P5FKABhzGEfMip/hVpU2Lqhx7iiUjypo4t6RFdi+wfF91iumQTsZQfT3JDL8ffEJ
         DKU9+BlF7UN8UHrapcFjmbzLfN9YqDzXPFW10hpNmkCJB2siY8WkkXINTeuO3BqK1aqq
         Itbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770231931; x=1770836731;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qrnr88nIhCevN+aceQs8WpTSQON3sJePiJ1Sjfxvheg=;
        b=LzT7faex5Ot+4aUM7iI6KUqMobB0o7am3FnYDmKHCieyVxHBLyXgE3S1avwsPT+7jX
         QOjUIzea0D5qrM+yW/9POTNd8CLiS2T4L4NZi4J1HyZY5GQ4xWYV8JL9aLXH/iipkAqC
         ItjbjH1IW5GeNWWx7VdjOLweadZ+/l01zXvh84ut+Zmi0ep1XZjl6BSSA99Wf6+fky4c
         mhzuWaybXnnl3f1oaKLA/oCY20U2pNc4C7Hofaup9Nr+/1iyTAfMQW3Gd1+U1b14WVTp
         iJQeM7cRP+bo4Ls9Xqk4cepl8kykp1A8Hya6MJ0Tv6NJ7imBBmG3Mug3fskFyJLj+ynt
         OlzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVy4LePeLAv6dEY0TqrW5oun2b4JXjlIVSMfrxIw7/lSorlgSHuJlitqppqDe8s8BA2k3MP6ykLtjuSnBA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxhctHnaNkbmTmd5Jba9PCzSiD5qN/9TiinX1AcNx67qxUHHck6
	sV3KJqJt6cnfTd34WNWLiEdJwTTBXNhZqiruQQY5+KKOKa2VXLfbJZZKtPRXcQ==
X-Gm-Gg: AZuq6aIQWSQrpsqZft7uRlY5uEyFIkbef702oABDF9f2Z+bmzWyL2UKrvhPf8AWdqyQ
	C+yjPpaGEnmtTtoeo2Lb8QMXrKDD3yKGYjB+4nSDEdX0RhsgqEiMdQZFH3aPZRyTdXljAMDEbic
	e16BrDzSdbBZMMD/7jQGn3z3/Qq/LvpFxO4iUxs68RgkDh5ZvTryjSiw6Qg/T8BysX7U9ayxFwL
	twJc+sx1RSvO0Vz8IN8DbwgkHPGTegaW7HPcVga27Sd3IOZ/fQA5qhw4EQw6IRbmmTECJS0CkQB
	9I7Sf7tBGSJmkgLZxkqy/jOEQ/gvhYkeH/EX/ro0ZS2bSktG7FDFvLBYj1aJ60DFsqsvQcS5GxH
	FEmJNXBS879fHiwsAsPwlV3a9UOVJPnAnh0hUHAbqEMZMpL1H9MhUzjIJsh8AZDai4oSOWIi2j/
	xTRg+8HaY9JbbznrEO5DxJDVdWNVdxdLdYDCo9wnLeP6h+iM0r7+6c/xJ4MMUoYa/XdUjfVw==
X-Received: by 2002:a17:903:3d46:b0:2a0:de4f:ca7 with SMTP id d9443c01a7336-2a933cdd064mr26781485ad.1.1770226421229;
        Wed, 04 Feb 2026 09:33:41 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.164.193])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a933884954sm26879545ad.28.2026.02.04.09.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 09:33:40 -0800 (PST)
Date: Wed, 4 Feb 2026 23:03:28 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Link Mauve <linkmauve@linkmauve.fr>
Cc: rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Jason Baron <jbaron@akamai.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev, 
	officialTechflashYT@gmail.com, Ash Logan <ash@heyquark.com>, 
	Roberto Van Eeden <rw-r-r-0644@protonmail.com>, Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH] rust: Add PowerPC support
Message-ID: <aYOCWHF4CwzDVPuA@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260204030507.8203-1-linkmauve@linkmauve.fr>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260204030507.8203-1-linkmauve@linkmauve.fr>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-16599-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linkmauve@linkmauve.fr,m:rust-for-linux@vger.kernel.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:corbet@lwn.net,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:peterz@infradead.org,m:jpoimboe@kernel.org,m:jbaron@akamai.com,m:rostedt@goodmis.org,m:ardb@kernel.org,m:nathan@kernel.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:llvm@lists.linux.dev,m:officialTechflashYT@gmail.com,m:ash@heyquark.com,m:rw-r-r-0644@protonmail.com,m:j.neuschaefer@gmx.net,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mkchauras@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mkchauras@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,lwn.net,linux.ibm.com,ellerman.id.au,gmail.com,infradead.org,akamai.com,goodmis.org,lists.ozlabs.org,lists.linux.dev,heyquark.com,gmx.net];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev,lkml];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com:mid,linkmauve.fr:email]
X-Rspamd-Queue-Id: 6B883EBDB8
X-Rspamd-Action: no action

On Wed, Feb 04, 2026 at 04:05:04AM +0100, Link Mauve wrote:
> For now only Big Endian 32-bit PowerPC is supported, as that is the only
> hardware I have.  This has been tested on the Nintendo Wii so far, but I
> plan on also using it on the GameCube, Wii U and Apple G4.
> 
> These changes aren’t the only ones required to get the kernel to compile
> and link on PowerPC, libcore will also have to be changed to not use
> integer division to format u64, u128 and core::time::Duration, otherwise
> __udivdi3() and __umoddi3() will have to be added.  I have tested this
> change by replacing the three implementations with unimplemented!() and
> it linked just fine.
> 
Hey Link,
I sent a patch with ppc64le support. 
https://lore.kernel.org/all/20260204042417.83903-1-mkchauras@gmail.com/

Can i take this patch and put ppc64le support over it and send it out?

Regards,
Mukesh
> Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
> ---
>  Documentation/rust/arch-support.rst   |  1 +
>  arch/powerpc/Kconfig                  |  1 +
>  arch/powerpc/Makefile                 |  2 ++
>  arch/powerpc/include/asm/jump_label.h | 16 ++++++++++------
>  rust/Makefile                         |  4 +++-
>  scripts/generate_rust_target.rs       | 10 ++++++++++
>  6 files changed, 27 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arch-support.rst
> index 6e6a515d0899..70b9e192a7a0 100644
> --- a/Documentation/rust/arch-support.rst
> +++ b/Documentation/rust/arch-support.rst
> @@ -18,6 +18,7 @@ Architecture   Level of support  Constraints
>  ``arm``        Maintained        ARMv7 Little Endian only.
>  ``arm64``      Maintained        Little Endian only.
>  ``loongarch``  Maintained        \-
> +``powerpc``    Maintained        32-bit Big Endian only.
>  ``riscv``      Maintained        ``riscv64`` and LLVM/Clang only.
>  ``um``         Maintained        \-
>  ``x86``        Maintained        ``x86_64`` only.
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 9537a61ebae0..17db23b82e91 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -283,6 +283,7 @@ config PPC
>  	select HAVE_REGS_AND_STACK_ACCESS_API
>  	select HAVE_RELIABLE_STACKTRACE
>  	select HAVE_RSEQ
> +	select HAVE_RUST			if PPC32
>  	select HAVE_SAMPLE_FTRACE_DIRECT	if HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
>  	select HAVE_SAMPLE_FTRACE_DIRECT_MULTI	if HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
>  	select HAVE_SETUP_PER_CPU_AREA		if PPC64
> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index a58b1029592c..9fd82c75dcbd 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -61,6 +61,8 @@ else
>  KBUILD_LDFLAGS_MODULE += $(objtree)/arch/powerpc/lib/crtsavres.o
>  endif
>  
> +KBUILD_RUSTFLAGS += --target=powerpc-unknown-linux-gnu
> +
>  ifdef CONFIG_CPU_LITTLE_ENDIAN
>  KBUILD_CPPFLAGS	+= -mlittle-endian
>  KBUILD_LDFLAGS	+= -EL
> diff --git a/arch/powerpc/include/asm/jump_label.h b/arch/powerpc/include/asm/jump_label.h
> index d4eaba459a0e..238f0f625a36 100644
> --- a/arch/powerpc/include/asm/jump_label.h
> +++ b/arch/powerpc/include/asm/jump_label.h
> @@ -15,14 +15,18 @@
>  #define JUMP_ENTRY_TYPE		stringify_in_c(FTR_ENTRY_LONG)
>  #define JUMP_LABEL_NOP_SIZE	4
>  
> +/* This macro is also expanded on the Rust side. */
> +#define ARCH_STATIC_BRANCH_ASM(key, label)		\
> +	"1:\n\t"					\
> +	"nop # arch_static_branch\n\t"			\
> +	".pushsection __jump_table,  \"aw\"\n\t"	\
> +	".long 1b - ., " label " - .\n\t"		\
> +	 JUMP_ENTRY_TYPE key " - .\n\t"			\
> +	 ".popsection \n\t"
> +
>  static __always_inline bool arch_static_branch(struct static_key *key, bool branch)
>  {
> -	asm goto("1:\n\t"
> -		 "nop # arch_static_branch\n\t"
> -		 ".pushsection __jump_table,  \"aw\"\n\t"
> -		 ".long 1b - ., %l[l_yes] - .\n\t"
> -		 JUMP_ENTRY_TYPE "%c0 - .\n\t"
> -		 ".popsection \n\t"
> +	asm goto(ARCH_STATIC_BRANCH_ASM("%c0", "%l[l_yes]")
>  		 : :  "i" (&((char *)key)[branch]) : : l_yes);
>  
>  	return false;
> diff --git a/rust/Makefile b/rust/Makefile
> index 5c0155b83454..377e6fd68524 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -400,13 +400,15 @@ bindgen_skip_c_flags := -mno-fp-ret-in-387 -mpreferred-stack-boundary=% \
>  	-fno-inline-functions-called-once -fsanitize=bounds-strict \
>  	-fstrict-flex-arrays=% -fmin-function-alignment=% \
>  	-fzero-init-padding-bits=% -mno-fdpic \
> -	--param=% --param asan-% -fno-isolate-erroneous-paths-dereference
> +	--param=% --param asan-% -fno-isolate-erroneous-paths-dereference \
> +	-ffixed-r2 -mmultiple -mno-readonly-in-sdata
>  
>  # Derived from `scripts/Makefile.clang`.
>  BINDGEN_TARGET_x86	:= x86_64-linux-gnu
>  BINDGEN_TARGET_arm64	:= aarch64-linux-gnu
>  BINDGEN_TARGET_arm	:= arm-linux-gnueabi
>  BINDGEN_TARGET_loongarch	:= loongarch64-linux-gnusf
> +BINDGEN_TARGET_powerpc	:= powerpc-linux-gnu
>  BINDGEN_TARGET_um	:= $(BINDGEN_TARGET_$(SUBARCH))
>  BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
>  
> diff --git a/scripts/generate_rust_target.rs b/scripts/generate_rust_target.rs
> index 38b3416bb979..0054880ba0ea 100644
> --- a/scripts/generate_rust_target.rs
> +++ b/scripts/generate_rust_target.rs
> @@ -188,6 +188,16 @@ fn main() {
>          panic!("arm uses the builtin rustc target");
>      } else if cfg.has("ARM64") {
>          panic!("arm64 uses the builtin rustc aarch64-unknown-none target");
> +    } else if cfg.has("PPC32") {
> +        ts.push("arch", "powerpc");
> +        ts.push("data-layout", "E-m:e-p:32:32-Fn32-i64:64-n32");
> +        ts.push("features", "+soft-float");
> +        ts.push("llvm-target", "powerpc-unknown-eabi");
> +        if cfg.rustc_version_atleast(1, 91, 0) {
> +            ts.push("target-pointer-width", 32);
> +        } else {
> +            ts.push("target-pointer-width", "32");
> +        }
>      } else if cfg.has("RISCV") {
>          if cfg.has("64BIT") {
>              panic!("64-bit RISC-V uses the builtin rustc riscv64-unknown-none-elf target");
> -- 
> 2.52.0
> 

