Return-Path: <linuxppc-dev+bounces-16600-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGjmM6icg2nppwMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16600-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Feb 2026 20:23:20 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B56EC0E7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Feb 2026 20:23:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f5qyD1ZNSz2xpk;
	Thu, 05 Feb 2026 06:23:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770232996;
	cv=none; b=lTtve6KQAAdxMIXE7O6yWqOm3UTUSm/A3dT8Fj0dgAmEmjEQo6VWJLH01NJE28fDT0u2EmGwVCLzKYvbzxZ79/OYOB0Y0rOLNOhIOeej7KINjET1RvnhIakiEMEjZRNCFbdODars2rDb07PgT6xNG9ORomq/b7uSZOlxGhwrlWYjSdly+kuPAd4iqnCMJjTMn6Z1mIgYjDA0yb3IK8AEbkCxpbdiw4Veubhm7Dkfu6uxxCPpPBywUnKFdDVSyiAYnYh2efyfAFXBLLx4DRB5nFEUjcoiwFRZHYkV3ReOss66TiXdwQXQcrpedeiE0y6GyHOyiqGEbzJisZCDgrgzFw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770232996; c=relaxed/relaxed;
	bh=pZYRyfQm2slhoCJVBlbeRDVIuS1dZe2tpNE2WvBoIdw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QFJAqrGWyh6q2etzlUgyOo6Ocnx1oAVR4V4Vnx9QB59Tl3+PlvjIiS8hEktswOGjgqbiv7rMqkmSRkgyycca2gjddA2IFIDohZEvOHuyOv5s+EYEUIm1NkEIJmND4UK1hIaEYhAle3F5GcpMqMrYSq7XmwV8v3UAceZL+hwra8NKHA3D8Czuh36pmnhrriV317RJWkcA12XDguSrd5xcuK70jN0N6ZO4Ml10/VdNAdxYS43ONc46RK9YiAhEqVwcl303jCrn0V+49dct6CTz0qzdFrzPKLymAXiHv8v/wSDvApnjCyKt7KXI2eeikN3SNPeE2a8DajLMrr8mCBBKqA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YVY2IZsD; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=mkchauras@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YVY2IZsD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=mkchauras@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f5qyB6rggz2xJ5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Feb 2026 06:23:13 +1100 (AEDT)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-81f5381d168so195361b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Feb 2026 11:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770232991; x=1770837791; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pZYRyfQm2slhoCJVBlbeRDVIuS1dZe2tpNE2WvBoIdw=;
        b=YVY2IZsDOFr2W7W2/iphPnsJNM5imT4ecTJUAeeit5xq9yWLjysw4eFWkevo+mwtd5
         mknDfyWtVbgdz1MyapPy9NgT1s+LQaWlQwWIO+kwhAx9kT4xDKsZKKGKdJEKEdjvshMB
         1Wqy3/TJFhWksrCrB+alNv1jSquiUVPovKubrL6TJt90V2errxzLbBIJVgffj9GBPAjR
         +I75wBouEh86XTAMAmXrGATZ9RcUubdJktzdEdN0NZaOhVAgbyplbWwAiwWo8UjgWEFn
         pWxnyMgYXAodgPpCj09Z+x8h9OtiFIRUJGoY5C/MClHqgJ1bFon7N5Ykw+5lueq+pYbO
         cQCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770232991; x=1770837791;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pZYRyfQm2slhoCJVBlbeRDVIuS1dZe2tpNE2WvBoIdw=;
        b=BvJZUI4WbS1j7miOsaLhRoMRItsEjKnIS8QJnAuxPnLX+i1f32xHJPuC9dERheSSX5
         RuuJ1RVf5TgEOhceDTmYg0ysmdXyFG7guzB/BNUTuVWftB+KoT8zkgrIbN5oS87TOUFC
         k7ZiEI3YUw+uURvjMWrtnNrn3SC0y8RevN96gZduEeiew6RdkjCA/0b4R5Icaect/2KS
         Q3D24kHFVxf82OP/YoqBLI/E/SXb0yHmMXwiw2N7LfJH12dqsOwjgY5IwyXkz9t/yGCQ
         Gu1dlnwSxE5TQOG8BzzLMsWOp5JofPOuKJwPZTp89B2CExWrnpziE1Q0IF4CKYK+Pnbk
         08qQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqN1664HmuHmRME+nhgjGx4kqhlUvt9apSfj99kNYhDetIaXsq4+tXxc8gJNe//m2nrN+Ko1uXGGOk0gw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywu/PTbFH8V/fq7gLSOuwnmsCPfvh/XaRBMsEW5N9vIiiDlvhvN
	bbD7Sf28wQlaQKWnkZOUSiY+g5faewppe6am0yXClbbqPW65lU4Sau8Z
X-Gm-Gg: AZuq6aKfVMylpCFr/MIWrNIQyflsuTPBATzydyM/N+z2gkYGgCR4KTnqcS63sbGVbzv
	s6zVQCv2TyYZohMGI2RJQffhi6dU9Kx1nxtcF9dHUk+C6FVHrGLWxdNQ/iXxmdFQ1xk2fpjaGPS
	ZLKnb8ZJHAfB8+yF6i7+pf0V2ISTJax6F0hI348rCnNTcKHLsniEkW1lMS2uCSLDQruTbmrVR1I
	debDDeItSlgJQPMPMQB7yOXYTMuQxmgmGRtCtjM7c2Y6R53OMlbV9j7p7FUjUr7Ak5iAzeorm5P
	Tj5OxpznzUAzVCoVPsVDMm+HX9xAfE4eqdtZdkbOkVBaE88QI5HVk7IDZV+qb5H2DjWpZNBkLin
	gyF8Ywu65/BlTu/VcLKVfCPH789ht1590boSd+Pug0c4w8dHrczzwXMIkz8rSR1fbmPZBVWDbSf
	WEIHhaQlUQAWm+zpXVXueTYQ3jxGmcf35INbrL+Sa60sD52BcYZA+LJ8l0h1jW3HjN9dwfvg==
X-Received: by 2002:a05:6a00:1391:b0:823:5270:f8d3 with SMTP id d2e1a72fcca58-8241c64d75cmr3547890b3a.54.1770226094264;
        Wed, 04 Feb 2026 09:28:14 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.164.193])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8241d434d12sm3016772b3a.40.2026.02.04.09.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 09:28:13 -0800 (PST)
Date: Wed, 4 Feb 2026 22:58:02 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, rostedt@goodmis.org, 
	ardb@kernel.org, ojeda@kernel.org, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev, Link Mauve <linkmauve@linkmauve.fr>
Subject: Re: [PATCH] powerpc: Enable Rust for ppc64le
Message-ID: <aYN_3P6aUaBWwQYo@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260204042417.83903-1-mkchauras@gmail.com>
 <da26fa6a-5262-45bf-890c-7afbf94d0897@kernel.org>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <da26fa6a-5262-45bf-890c-7afbf94d0897@kernel.org>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-16600-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mkchauras@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:chleroy@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:peterz@infradead.org,m:jpoimboe@kernel.org,m:jbaron@akamai.com,m:rostedt@goodmis.org,m:ardb@kernel.org,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:nathan@kernel.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:llvm@lists.linux.dev,m:linkmauve@linkmauve.fr,m:boqunfeng@gmail.com,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux.ibm.com,ellerman.id.au,gmail.com,infradead.org,kernel.org,akamai.com,goodmis.org,garyguo.net,protonmail.com,google.com,umich.edu,lists.ozlabs.org,vger.kernel.org,lists.linux.dev,linkmauve.fr];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mkchauras@gmail.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	REDIRECTOR_URL(0.00)[aka.ms];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev,lkml];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com:mid,aka.ms:url,high:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: F0B56EC0E7
X-Rspamd-Action: no action

On Wed, Feb 04, 2026 at 06:11:13PM +0100, Christophe Leroy (CS GROUP) wrote:
> Hi Mukesh, hi Link,
> 
> Le 04/02/2026 à 05:24, Mukesh Kumar Chaurasiya (IBM) a écrit :
> > [Vous ne recevez pas souvent de courriers de mkchauras@gmail.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> > 
> > Enabling rust support for ppc64 only.
> 
> Link Mauve has sent a patch for rust support on PPC32 a few hours before
> you, see
> https://lore.kernel.org/r/20260204030507.8203-1-linkmauve@linkmauve.fr
> Could you coordinate together to provide something supporting both PPC32 and
> PPC64 ?
> 
Hey Christophe,
Sure.
> I see the following conflicts at the time being. I also have a few comments
> down.
> 
Ohk.
> diff --git a/Documentation/rust/arch-support.rst
> b/Documentation/rust/arch-support.rst
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
> index b8d36a261009..80b2666fc5af 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -283,8 +283,10 @@ config PPC
>  	select HAVE_REGS_AND_STACK_ACCESS_API
>  	select HAVE_RELIABLE_STACKTRACE
>  	select HAVE_RSEQ
> +	select HAVE_RUST			if PPC32
>  	select HAVE_SAMPLE_FTRACE_DIRECT	if HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
>  	select HAVE_SAMPLE_FTRACE_DIRECT_MULTI	if
> HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
> +	select HAVE_RUST			if PPC64
>  	select HAVE_SETUP_PER_CPU_AREA		if PPC64
>  	select HAVE_SOFTIRQ_ON_OWN_STACK
>  	select HAVE_STACKPROTECTOR		if PPC32 && $(cc-option,$(m32-flag)
> -mstack-protector-guard=tls -mstack-protector-guard-reg=r2
> -mstack-protector-guard-offset=0)
> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index a58b1029592c..ac6fe8cc4ece 100644
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
> @@ -172,10 +174,11 @@ CFLAGS-y += $(CONFIG_TUNE_CPU)
> 
>  asinstr := $(call as-instr,lis 9$(comma)foo@high,-DHAVE_AS_ATHIGH=1)
> 
> -KBUILD_CPPFLAGS	+= -I $(srctree)/arch/powerpc $(asinstr)
> -KBUILD_AFLAGS	+= $(AFLAGS-y)
> -KBUILD_CFLAGS	+= $(CC_FLAGS_NO_FPU)
> -KBUILD_CFLAGS	+= $(CFLAGS-y)
> +KBUILD_CPPFLAGS		+= -I $(srctree)/arch/powerpc $(asinstr)
> +KBUILD_AFLAGS		+= $(AFLAGS-y)
> +KBUILD_CFLAGS		+= $(CC_FLAGS_NO_FPU)
> +KBUILD_CFLAGS		+= $(CFLAGS-y)
> +KBUILD_RUSTFLAGS        += -Ctarget-feature=-mma,-vsx,-hard-float,-altivec
> 
>  CHECKFLAGS	+= -m$(BITS) -D__powerpc__ -D__powerpc$(BITS)__
>  ifdef CONFIG_CPU_BIG_ENDIAN
> diff --git a/arch/powerpc/include/asm/jump_label.h
> b/arch/powerpc/include/asm/jump_label.h
> index d4eaba459a0e..d2284c72d21b 100644
> --- a/arch/powerpc/include/asm/jump_label.h
> +++ b/arch/powerpc/include/asm/jump_label.h
> @@ -15,14 +15,35 @@
>  #define JUMP_ENTRY_TYPE		stringify_in_c(FTR_ENTRY_LONG)
>  #define JUMP_LABEL_NOP_SIZE	4
> 
> +<<<<<<< HEAD
> +/* This macro is also expanded on the Rust side. */
> +#define ARCH_STATIC_BRANCH_ASM(key, label)		\
> +	"1:\n\t"					\
> +	"nop # arch_static_branch\n\t"			\
> +	".pushsection __jump_table,  \"aw\"\n\t"	\
> +	".long 1b - ., " label " - .\n\t"		\
> +	 JUMP_ENTRY_TYPE key " - .\n\t"			\
> +	 ".popsection \n\t"
> +
>  static __always_inline bool arch_static_branch(struct static_key *key, bool
> branch)
>  {
> -	asm goto("1:\n\t"
> -		 "nop # arch_static_branch\n\t"
> -		 ".pushsection __jump_table,  \"aw\"\n\t"
> -		 ".long 1b - ., %l[l_yes] - .\n\t"
> -		 JUMP_ENTRY_TYPE "%c0 - .\n\t"
> -		 ".popsection \n\t"
> +	asm goto(ARCH_STATIC_BRANCH_ASM("%c0", "%l[l_yes]")
> +=======
> +#define JUMP_TABLE_ENTRY(key, label)			\
> +	".pushsection __jump_table,  \"aw\"	\n\t"	\
> +	".long 1b - ., " label " - .		\n\t"	\
> +	JUMP_ENTRY_TYPE key " - .		\n\t"	\
> +	".popsection 				\n\t"
> +
> +#define ARCH_STATIC_BRANCH_ASM(key, label)		\
> +	"1:	nop				\n\t"	\
> +	JUMP_TABLE_ENTRY(key,label)
> +
> +static __always_inline bool arch_static_branch(struct static_key *key, bool
> branch)
> +{
> +	asm goto(
> +		 ARCH_STATIC_BRANCH_ASM("%c0", "%l[l_yes]")
> +>>>>>>> rust64
>  		 : :  "i" (&((char *)key)[branch]) : : l_yes);
> 
>  	return false;
> @@ -34,10 +55,7 @@ static __always_inline bool
> arch_static_branch_jump(struct static_key *key, bool
>  {
>  	asm goto("1:\n\t"
>  		 "b %l[l_yes] # arch_static_branch_jump\n\t"
> -		 ".pushsection __jump_table,  \"aw\"\n\t"
> -		 ".long 1b - ., %l[l_yes] - .\n\t"
> -		 JUMP_ENTRY_TYPE "%c0 - .\n\t"
> -		 ".popsection \n\t"
> +		 JUMP_TABLE_ENTRY("%c0", "%l[l_yes]")
>  		 : :  "i" (&((char *)key)[branch]) : : l_yes);
> 
>  	return false;
> diff --git a/rust/Makefile b/rust/Makefile
> index 5d357dce1704..9b72c1e96191 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -383,13 +383,19 @@ bindgen_skip_c_flags := -mno-fp-ret-in-387
> -mpreferred-stack-boundary=% \
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
> +<<<<<<< HEAD
> +BINDGEN_TARGET_powerpc	:= powerpc-linux-gnu
> +=======
> +BINDGEN_TARGET_powerpc	:= powerpc64le-linux-gnu
> +>>>>>>> rust64
>  BINDGEN_TARGET_um	:= $(BINDGEN_TARGET_$(SUBARCH))
>  BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
> 
> diff --git a/scripts/generate_rust_target.rs
> b/scripts/generate_rust_target.rs
> index 38b3416bb979..1860af50b926 100644
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
>              panic!("64-bit RISC-V uses the builtin rustc
> riscv64-unknown-none-elf target");
> @@ -256,6 +266,30 @@ fn main() {
>          }
>      } else if cfg.has("LOONGARCH") {
>          panic!("loongarch uses the builtin rustc
> loongarch64-unknown-none-softfloat target");
> +    } else if cfg.has("PPC64") {
> +        ts.push("arch", "powerpc64");
> +        ts.push(
> +            "data-layout",
> +            if cfg.has("CPU_LITTLE_ENDIAN") {
> +                "e-m:e-Fn32-i64:64-n32:64-S128-v256:256:256-v512:512:512"
> +            } else {
> +                "E-m:e-Fn32-i64:64-n32:64-S128-v256:256:256-v512:512:512"
> +            },
> +        );
> +        ts.push("features", "-mma,-altivec,-vsx,-hard-float");
> +        ts.push(
> +            "llvm-target",
> +            if cfg.has("CPU_LITTLE_ENDIAN") {
> +                "powerpc64le-linux-gnu"
> +            } else {
> +                "powerpc64-linux-gnu"
> +            },
> +        );
> +        if cfg.rustc_version_atleast(1, 91, 0) {
> +            ts.push("target-pointer-width", 64);
> +        } else {
> +            ts.push("target-pointer-width", "64");
> +        }
>      } else {
>          panic!("Unsupported architecture");
>      }
> 
> [...]
> 
> > ---
> >   arch/powerpc/Kconfig                  |  1 +
> >   arch/powerpc/Makefile                 |  9 +++++----
> >   arch/powerpc/include/asm/jump_label.h | 23 +++++++++++++----------
> >   rust/Makefile                         |  1 +
> >   scripts/generate_rust_target.rs       | 24 ++++++++++++++++++++++++
> >   5 files changed, 44 insertions(+), 14 deletions(-)
> > 
> > diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> > index 9537a61ebae0..e9b8d761ed52 100644
> > --- a/arch/powerpc/Kconfig
> > +++ b/arch/powerpc/Kconfig
> > @@ -285,6 +285,7 @@ config PPC
> >          select HAVE_RSEQ
> >          select HAVE_SAMPLE_FTRACE_DIRECT        if HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
> >          select HAVE_SAMPLE_FTRACE_DIRECT_MULTI  if HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
> > +       select HAVE_RUST                        if PPC64
> 
> Keep in alphabetic order
> 
Sure.
> >          select HAVE_SETUP_PER_CPU_AREA          if PPC64
> >          select HAVE_SOFTIRQ_ON_OWN_STACK
> >          select HAVE_STACKPROTECTOR              if PPC32 && $(cc-option,$(m32-flag) -mstack-protector-guard=tls -mstack-protector-guard-reg=r2 -mstack-protector-guard-offset=0)
> > diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> > index a58b1029592c..7ad28cf0fd35 100644
> > --- a/arch/powerpc/Makefile
> > +++ b/arch/powerpc/Makefile
> > @@ -172,10 +172,11 @@ CFLAGS-y += $(CONFIG_TUNE_CPU)
> > 
> >   asinstr := $(call as-instr,lis 9$(comma)foo@high,-DHAVE_AS_ATHIGH=1)
> > 
> > -KBUILD_CPPFLAGS        += -I $(srctree)/arch/powerpc $(asinstr)
> > -KBUILD_AFLAGS  += $(AFLAGS-y)
> > -KBUILD_CFLAGS  += $(CC_FLAGS_NO_FPU)
> > -KBUILD_CFLAGS  += $(CFLAGS-y)
> > +KBUILD_CPPFLAGS                += -I $(srctree)/arch/powerpc $(asinstr)
> > +KBUILD_AFLAGS          += $(AFLAGS-y)
> > +KBUILD_CFLAGS          += $(CC_FLAGS_NO_FPU)
> > +KBUILD_CFLAGS          += $(CFLAGS-y)
> > +KBUILD_RUSTFLAGS        += -Ctarget-feature=-mma,-vsx,-hard-float,-altivec
> > 
> >   CHECKFLAGS     += -m$(BITS) -D__powerpc__ -D__powerpc$(BITS)__
> >   ifdef CONFIG_CPU_BIG_ENDIAN
> > diff --git a/arch/powerpc/include/asm/jump_label.h b/arch/powerpc/include/asm/jump_label.h
> > index d4eaba459a0e..a6b211502bfe 100644
> > --- a/arch/powerpc/include/asm/jump_label.h
> > +++ b/arch/powerpc/include/asm/jump_label.h
> > @@ -15,14 +15,20 @@
> >   #define JUMP_ENTRY_TYPE                stringify_in_c(FTR_ENTRY_LONG)
> >   #define JUMP_LABEL_NOP_SIZE    4
> > 
> > +#define JUMP_TABLE_ENTRY(key, label)                   \
> > +       ".pushsection __jump_table,  \"aw\"     \n\t"   \
> > +       ".long 1b - ., " label " - .            \n\t"   \
> > +       JUMP_ENTRY_TYPE key " - .               \n\t"   \
> > +       ".popsection                            \n\t"
> > +
> > +#define ARCH_STATIC_BRANCH_ASM(key, label)             \
> > +       "1:     nop                             \n\t"   \
> > +       JUMP_TABLE_ENTRY(key,label)
> > +
> >   static __always_inline bool arch_static_branch(struct static_key *key, bool branch)
> >   {
> > -       asm goto("1:\n\t"
> > -                "nop # arch_static_branch\n\t"
> > -                ".pushsection __jump_table,  \"aw\"\n\t"
> > -                ".long 1b - ., %l[l_yes] - .\n\t"
> > -                JUMP_ENTRY_TYPE "%c0 - .\n\t"
> > -                ".popsection \n\t"
> > +       asm goto(
> > +                ARCH_STATIC_BRANCH_ASM("%c0", "%l[l_yes]")
> >                   : :  "i" (&((char *)key)[branch]) : : l_yes);
> > 
> >          return false;
> > @@ -34,10 +40,7 @@ static __always_inline bool arch_static_branch_jump(struct static_key *key, bool
> >   {
> >          asm goto("1:\n\t"
> >                   "b %l[l_yes] # arch_static_branch_jump\n\t"
> > -                ".pushsection __jump_table,  \"aw\"\n\t"
> > -                ".long 1b - ., %l[l_yes] - .\n\t"
> > -                JUMP_ENTRY_TYPE "%c0 - .\n\t"
> > -                ".popsection \n\t"
> > +                JUMP_TABLE_ENTRY("%c0", "%l[l_yes]")
> >                   : :  "i" (&((char *)key)[branch]) : : l_yes);
> > 
> >          return false;
> > diff --git a/rust/Makefile b/rust/Makefile
> > index 5d357dce1704..7a6daa822cbc 100644
> > --- a/rust/Makefile
> > +++ b/rust/Makefile
> > @@ -390,6 +390,7 @@ BINDGEN_TARGET_x86  := x86_64-linux-gnu
> >   BINDGEN_TARGET_arm64   := aarch64-linux-gnu
> >   BINDGEN_TARGET_arm     := arm-linux-gnueabi
> >   BINDGEN_TARGET_loongarch       := loongarch64-linux-gnusf
> > +BINDGEN_TARGET_powerpc := powerpc64le-linux-gnu
> 
> This needs to depend on CONFIG_PPC64 and CONFIG_CPU_LITTLE_ENDIAN.
> 
Yeah, will fix this.
> 
> >   BINDGEN_TARGET_um      := $(BINDGEN_TARGET_$(SUBARCH))
> >   BINDGEN_TARGET         := $(BINDGEN_TARGET_$(SRCARCH))
> > 
> > diff --git a/scripts/generate_rust_target.rs b/scripts/generate_rust_target.rs
> > index 38b3416bb979..875579b37424 100644
> > --- a/scripts/generate_rust_target.rs
> > +++ b/scripts/generate_rust_target.rs
> > @@ -256,6 +256,30 @@ fn main() {
> >           }
> >       } else if cfg.has("LOONGARCH") {
> >           panic!("loongarch uses the builtin rustc loongarch64-unknown-none-softfloat target");
> > +    } else if cfg.has("PPC64") {
> 
> Shouldn't this be done closer to PPC32 ?
> 
Yeah, I will build the 64 support over 32 and keep them together.
> > +        ts.push("arch", "powerpc64");
> > +        ts.push(
> > +            "data-layout",
> > +            if cfg.has("CPU_LITTLE_ENDIAN") {
> > +                "e-m:e-Fn32-i64:64-n32:64-S128-v256:256:256-v512:512:512"
> > +            } else {
> > +                "E-m:e-Fn32-i64:64-n32:64-S128-v256:256:256-v512:512:512"
> > +            },
> > +        );
> > +        ts.push("features", "-mma,-altivec,-vsx,-hard-float");
> > +        ts.push(
> > +            "llvm-target",
> > +            if cfg.has("CPU_LITTLE_ENDIAN") {
> > +                "powerpc64le-linux-gnu"
> > +            } else {
> > +                "powerpc64-linux-gnu"
> > +            },
> > +        );
> > +        if cfg.rustc_version_atleast(1, 91, 0) {
> > +            ts.push("target-pointer-width", 64);
> > +        } else {
> > +            ts.push("target-pointer-width", "64");
> > +        }
> >       } else {
> >           panic!("Unsupported architecture");
> >       }
> > --
> > 2.52.0
> > 
> 

