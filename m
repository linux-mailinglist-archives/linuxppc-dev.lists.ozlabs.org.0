Return-Path: <linuxppc-dev+bounces-3007-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5D69C0D52
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2024 18:52:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XkqQn2qG5z3bq0;
	Fri,  8 Nov 2024 04:52:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731001937;
	cv=none; b=XFlLsWbNwSoP3F5VpvfUaZ3VhFKhjPAIs2AA/Z+Y5BkpqVuDp9fuWhhXtW6FULLfsv7kI1hOQrH1OAVQF1YMLSEyJUGCjDPljrlQKbBQSSJxgUtYmIUvrCdcdOjIh37mm1nEKeQqA3Cz0AQr3wcxZ0Zvy/TX6QHEp4SKpHLVY9wwFLtY/WMUoYnvIn+BOst8c9WYTcoO5zG3QGWczVwjMacAObFNNhmHfP4X1xk2DucNfn83Z9KRHVtlfHMhC3igPtiTO0VlXVW/eqhvTL/uBQo4UOdK4Gjvolzf6d/YZpEQqCZf9/LtwZteij5HDYni8Mn1mqfeyFBhaezk7ui6eA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731001937; c=relaxed/relaxed;
	bh=NW5WgtQ57Vsef24aMDWR3Zpkx51o63s1krev0qRHI7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eB918IIPve66s1Dt412ZA9ulEcVyDwIqEhOMcubb51ih0yra2/xKSaiQQoKTRU97expiKdwClyky0BvI0C60s+QAofV8Q7yXUdek2J8UZdqnoVoAINRmBFQ3SFK9v6VSSt91fpxZCaYAzHEpJ8pC4ZiP545MxhOnnW3wk5n670RMzyfZkdfg6W7s/bJf2UFQ9hlHCqw9d5B5NZcNlEd32uc795sQPiEQuvxP2m8rv5HTTrsGIHWvzoBDtp5se/R9WbRyodIXB6D0V/Hh/u0IdjfkIbhc/zlPS2DIgDEmoNqcDFyDQhdWUzFpkEimw7L+ZxnUem6kbQa0NmSGEgbReQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gKVmywyD; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gKVmywyD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XkqQm1xL7z3bkf
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Nov 2024 04:52:16 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D3ACA5C2D61;
	Thu,  7 Nov 2024 17:51:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 045C6C4CECC;
	Thu,  7 Nov 2024 17:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731001933;
	bh=ciwG1giWhBRqnHMQKhrdS/srXl4Xy6nNc928ND74YyM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gKVmywyDVZe8ZD2pLedZVs1DHq0TQCg8RQgdQeEdId+/cuzaCPTxOMOEaCjceEZ0m
	 jDH/EfKHELaIODBUbffbPZU3jZk6TPODL6wk2gtZcefxrqo9zX8NoUicYN7jLfV93b
	 Hvyf+uz5MAWdshOrYyPIFSvj9yH4+dK64vCoUJ+uwx8lxzcwCttFRZqz3i1H1hOqxi
	 N0eYZMjE/8serx044fMkOW+U8jqmsuTPX746SKp9rJUyMDNX0MkaBqEb7/rgOvbFt9
	 u8LztebqJo2pf+c3C81EvddVHwMyEqSj2X0CqnqYCj2CU9+hVJIYMj/kvo880s+Ljc
	 eWwfjf+e+ko1Q==
Date: Thu, 7 Nov 2024 10:52:11 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org, arnd@arndb.de
Subject: Re: [PATCH] powerpc/Makefile: Allow overriding CPP
Message-ID: <20241107175211.GA1277020@thelio-3990X>
References: <20241107112646.32401-1-mpe@ellerman.id.au>
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
In-Reply-To: <20241107112646.32401-1-mpe@ellerman.id.au>
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Nov 07, 2024 at 10:26:46PM +1100, Michael Ellerman wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Unlike all other arches, powerpc doesn't allow the user to override CPP,
> because it sets it unconditionally in the arch Makefile. This can lead
> to strange build failures.
> 
> Instead add the required flags to KBUILD_CPPFLAGS, which are passed
> to CPP, CC and AS invocations by the generic Makefile logic.
> 
> Reported-by: Arnd Bergmann <arnd@arndb.de>
> Closes: https://lore.kernel.org/all/20240607061629.530301-1-arnd@kernel.org
> [mpe: Rebase, write change log]
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

My builds are still green with this change applied.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  arch/powerpc/Makefile             | 7 +++----
>  arch/powerpc/kernel/vdso/Makefile | 2 +-
>  2 files changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index cbb353ddacb7..94a6ccb8ad12 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -62,14 +62,14 @@ KBUILD_LDFLAGS_MODULE += arch/powerpc/lib/crtsavres.o
>  endif
>  
>  ifdef CONFIG_CPU_LITTLE_ENDIAN
> -KBUILD_CFLAGS	+= -mlittle-endian
> +KBUILD_CPPFLAGS	+= -mlittle-endian
>  KBUILD_LDFLAGS	+= -EL
>  LDEMULATION	:= lppc
>  GNUTARGET	:= powerpcle
>  MULTIPLEWORD	:= -mno-multiple
>  KBUILD_CFLAGS_MODULE += $(call cc-option,-mno-save-toc-indirect)
>  else
> -KBUILD_CFLAGS += $(call cc-option,-mbig-endian)
> +KBUILD_CPPFLAGS	+= $(call cc-option,-mbig-endian)
>  KBUILD_LDFLAGS	+= -EB
>  LDEMULATION	:= ppc
>  GNUTARGET	:= powerpc
> @@ -95,7 +95,7 @@ aflags-$(CONFIG_CPU_BIG_ENDIAN)		+= $(call cc-option,-mbig-endian)
>  aflags-$(CONFIG_CPU_LITTLE_ENDIAN)	+= -mlittle-endian
>  
>  ifeq ($(HAS_BIARCH),y)
> -KBUILD_CFLAGS	+= -m$(BITS)
> +KBUILD_CPPFLAGS	+= -m$(BITS)
>  KBUILD_AFLAGS	+= -m$(BITS)
>  KBUILD_LDFLAGS	+= -m elf$(BITS)$(LDEMULATION)
>  endif
> @@ -168,7 +168,6 @@ KBUILD_CPPFLAGS	+= -I $(srctree)/arch/powerpc $(asinstr)
>  KBUILD_AFLAGS	+= $(AFLAGS-y)
>  KBUILD_CFLAGS	+= $(CC_FLAGS_NO_FPU)
>  KBUILD_CFLAGS	+= $(CFLAGS-y)
> -CPP		= $(CC) -E $(KBUILD_CFLAGS)
>  
>  CHECKFLAGS	+= -m$(BITS) -D__powerpc__ -D__powerpc$(BITS)__
>  ifdef CONFIG_CPU_BIG_ENDIAN
> diff --git a/arch/powerpc/kernel/vdso/Makefile b/arch/powerpc/kernel/vdso/Makefile
> index 31ca5a547004..af130c82a71a 100644
> --- a/arch/powerpc/kernel/vdso/Makefile
> +++ b/arch/powerpc/kernel/vdso/Makefile
> @@ -50,7 +50,7 @@ ldflags-$(CONFIG_LD_IS_LLD) += $(call cc-option,--ld-path=$(LD),-fuse-ld=lld)
>  ldflags-$(CONFIG_LD_ORPHAN_WARN) += -Wl,--orphan-handling=$(CONFIG_LD_ORPHAN_WARN_LEVEL)
>  
>  # Filter flags that clang will warn are unused for linking
> -ldflags-y += $(filter-out $(CC_AUTO_VAR_INIT_ZERO_ENABLER) $(CC_FLAGS_FTRACE) -Wa$(comma)%, $(KBUILD_CFLAGS))
> +ldflags-y += $(filter-out $(CC_AUTO_VAR_INIT_ZERO_ENABLER) $(CC_FLAGS_FTRACE) -Wa$(comma)%, $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS))
>  
>  CC32FLAGS := -m32
>  CC32FLAGSREMOVE := -mcmodel=medium -mabi=elfv1 -mabi=elfv2 -mcall-aixdesc
> -- 
> 2.47.0
> 

