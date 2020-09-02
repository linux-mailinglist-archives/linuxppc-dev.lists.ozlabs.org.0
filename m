Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B0525A378
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 05:01:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bh7xG4ym4zDqQB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 13:01:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=JfSoCblq; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bh7tx5ffTzDqMd
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Sep 2020 12:59:03 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id c15so1591718plq.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Sep 2020 19:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=28qFhVucmi3MOA4EjVAZJj+la1Jhv4eS2/cK3Z3HiOY=;
 b=JfSoCblql0i+xp0AEKJ6Ado4VRkzPHhvozvtPDE6oea9heTe/Qv13NjtA7soBD1I2q
 5ClV6H3baFAV4TFVXNPIjM0dIQJqZCwx6HelgagOzJHkan4Nh82stOScL2Rmd0qA1tLC
 +8kgcNxRDIa0HytZ5vaeKN90PeVbhnkPa/0hQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=28qFhVucmi3MOA4EjVAZJj+la1Jhv4eS2/cK3Z3HiOY=;
 b=tc9U64RubbKxJ6CoTApw8ijg/Xzg5kbeFoEcgrNJtWwRluAMpbo8bBlheF4m6JEnhP
 5XipH3wvMnEyWKK9D2sItA4v4qbrTDosdzUZK5cSSSDcADm1ny6F8amCcDet0sp/ATET
 tbfRL9sZIA5C0focCnAKHp6qtpySh1BEAs08NLtfCGHC/QzxZVbj1SZEoDqPUQQ6DTwN
 A1JLyWShKUzCAjtOwC08OdwH9eqRtN1CMCGV5cKxYttGSCwNXKzvqXFMc8dm6jDJNXZp
 B3atkgXBGnXuqv5IZRRX4yBPqk7pnk0yhWmFwyOhei3Aw4dXgbPO2khaHly5Fvq/sj9A
 +aEg==
X-Gm-Message-State: AOAM5334bkgf7MuLuwTeiMl/gxwL8uS7tMrJMtnd+ouV5cXFQFqx8WF5
 sDIIQJ203dzEaL7m4hq1KocKTg==
X-Google-Smtp-Source: ABdhPJwHg3XhyABkHwBxZuW2xitf7WsgMQ/KpoHJFIq8bDR8n2hKuyuuKABcGtomYH3njASks0dzqA==
X-Received: by 2002:a17:90a:ea97:: with SMTP id
 h23mr295435pjz.48.1599015539699; 
 Tue, 01 Sep 2020 19:58:59 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id e123sm2864217pfh.167.2020.09.01.19.58.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 19:58:58 -0700 (PDT)
Date: Tue, 1 Sep 2020 19:58:57 -0700
From: Kees Cook <keescook@chromium.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH 2/2] powerpc/vdso32: link vdso64 with linker
Message-ID: <202009011957.83E306094@keescook>
References: <20200901222523.1941988-1-ndesaulniers@google.com>
 <20200901222523.1941988-3-ndesaulniers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200901222523.1941988-3-ndesaulniers@google.com>
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Joe Lawrence <joe.lawrence@redhat.com>, Fangrui Song <maskray@google.com>,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 clang-built-linux@googlegroups.com, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

I think $subject needs a typo update... vdso32...

On Tue, Sep 01, 2020 at 03:25:23PM -0700, Nick Desaulniers wrote:
> Rather than invoke the compiler as the driver, use the linker. That way
> we can check --orphan-handling=warn support correctly, as cc-ldoption
> was removed in
> commit 055efab3120b ("kbuild: drop support for cc-ldoption").
> 
> Requires dropping the .got section.  I couldn't find how it was used in
> the vdso32.
> 
> Fixes: commit f2af201002a8 ("powerpc/build: vdso linker warning for orphan sections")
> Link: https://lore.kernel.org/lkml/CAKwvOdnn3wxYdJomvnveyD_njwRku3fABWT_bS92duihhywLJQ@mail.gmail.com/
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
> Not sure removing .got is a good idea or not.  Otherwise I observe the
> following link error:
> powerpc-linux-gnu-ld: warning: orphan section `.got' from `arch/powerpc/kernel/vdso32/sigtramp.o' being placed in section `.got'
> powerpc-linux-gnu-ld: _GLOBAL_OFFSET_TABLE_ not defined in linker created .got
> powerpc-linux-gnu-ld: final link failed: bad value

If it's like the x86 and arm toolchains, I think you'll be required to
keep .got, but you can assert it to a 0 size, e.g.:

	/*
	 * Sections that should stay zero sized, which is safer to
	 * explicitly check instead of blindly discarding.
	 */
	.got : {
		*(.got)
	}
	ASSERT(SIZEOF(.got) == 0, "Unexpected GOT entries detected!")

(and put that at the end of the linker script)


-Kees

> 
> sigtramp.c doesn't mention anything from the GOT AFAICT, and doesn't
> look like it contains relocations that do, so I'm not sure where
> references to _GLOBAL_OFFSET_TABLE_ are coming from.
> 
>  arch/powerpc/kernel/vdso32/Makefile     | 7 +++++--
>  arch/powerpc/kernel/vdso32/vdso32.lds.S | 3 ++-
>  2 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/vdso32/Makefile b/arch/powerpc/kernel/vdso32/Makefile
> index 87ab1152d5ce..611a5951945a 100644
> --- a/arch/powerpc/kernel/vdso32/Makefile
> +++ b/arch/powerpc/kernel/vdso32/Makefile
> @@ -27,6 +27,9 @@ UBSAN_SANITIZE := n
>  ccflags-y := -shared -fno-common -fno-builtin -nostdlib \
>  	-Wl,-soname=linux-vdso32.so.1 -Wl,--hash-style=both
>  asflags-y := -D__VDSO32__ -s
> +ldflags-y := -shared -soname linux-vdso32.so.1 \
> +	$(call ld-option, --eh-frame-hdr) \
> +	$(call ld-option, --orphan-handling=warn) -T
>  
>  obj-y += vdso32_wrapper.o
>  extra-y += vdso32.lds
> @@ -49,8 +52,8 @@ $(obj-vdso32): %.o: %.S FORCE
>  	$(call if_changed_dep,vdso32as)
>  
>  # actual build commands
> -quiet_cmd_vdso32ld = VDSO32L $@
> -      cmd_vdso32ld = $(VDSOCC) $(c_flags) $(CC32FLAGS) -o $@ $(call cc-ldoption, -Wl$(comma)--orphan-handling=warn) -Wl,-T$(filter %.lds,$^) $(filter %.o,$^)
> +quiet_cmd_vdso32ld = LD      $@
> +      cmd_vdso32ld = $(cmd_ld)
>  quiet_cmd_vdso32as = VDSO32A $@
>        cmd_vdso32as = $(VDSOCC) $(a_flags) $(CC32FLAGS) -c -o $@ $<
>  
> diff --git a/arch/powerpc/kernel/vdso32/vdso32.lds.S b/arch/powerpc/kernel/vdso32/vdso32.lds.S
> index 4c985467a668..0ccdebad18b8 100644
> --- a/arch/powerpc/kernel/vdso32/vdso32.lds.S
> +++ b/arch/powerpc/kernel/vdso32/vdso32.lds.S
> @@ -61,7 +61,6 @@ SECTIONS
>  	.fixup		: { *(.fixup) }
>  
>  	.dynamic	: { *(.dynamic) }		:text	:dynamic
> -	.got		: { *(.got) }			:text
>  	.plt		: { *(.plt) }
>  
>  	_end = .;
> @@ -108,7 +107,9 @@ SECTIONS
>  	.debug_varnames  0 : { *(.debug_varnames) }
>  
>  	/DISCARD/	: {
> +		*(.got)
>  		*(.note.GNU-stack)
> +		*(.branch_lt)
>  		*(.data .data.* .gnu.linkonce.d.* .sdata*)
>  		*(.bss .sbss .dynbss .dynsbss)
>  		*(.glink .iplt .plt .rela*)
> -- 
> 2.28.0.402.g5ffc5be6b7-goog
> 

-- 
Kees Cook
