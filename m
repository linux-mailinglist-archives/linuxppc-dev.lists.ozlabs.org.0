Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF0990071C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2024 16:44:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=c5MYrUXi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VwkVT3j6gz3cX9
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Jun 2024 00:44:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=c5MYrUXi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VwkTl6VZzz3bq0
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Jun 2024 00:43:39 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 183E5CE1D9F;
	Fri,  7 Jun 2024 14:43:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FACAC2BBFC;
	Fri,  7 Jun 2024 14:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717771411;
	bh=Aghj0cHV7oDMUlR2GlJobLXB2IWw7s4ne4SMNdsCqFU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c5MYrUXijLFyMMTns3Y1RmhtCMDTfGeUkaXeRVBhmPNyZIg2mApXb6ESEBshsy3Sd
	 64pVbnn+U/RspCFpmpw/179i6UAbJ/W7L40/aKygtpmMWeNhyZJ8UCz2Kj7mAJIlGN
	 9ul4dSj+UgSu4VFfox9z9wuN9kkN/MF3D+o96rWPTn1bSPTE28b5TcRJByejP20R5K
	 fU3hMmdDy8c86v/V6FZ+jh3eZbuWRJ3Qty4qwQ8CR+w8TotpMLldTaThU1yrvx4CB+
	 zLsbLYshtAo3I6Vl8VxFlL1gda/ALNpMTbBGgS2KGDQaKtiCaLrieqSUgef/ZGXsry
	 9uq9G9UadYaiw==
Date: Fri, 7 Jun 2024 07:43:29 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] powerpc: vdso: fix building with wrong-endian toolchain
Message-ID: <20240607144329.GB2483293@thelio-3990X>
References: <20240607061629.530301-1-arnd@kernel.org>
 <87frtoq5yz.fsf@mail.lhotse>
 <23ddf649-f70b-47b0-90df-af572fd50504@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <23ddf649-f70b-47b0-90df-af572fd50504@app.fastmail.com>
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
Cc: Arnd Bergmann <arnd@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 07, 2024 at 04:11:25PM +0200, Arnd Bergmann wrote:
> This patch seems to work as well for me, and is a little
> more logical, but it's also more invasive and has a
> higher regression risk:

Commit feb843a469fb ("kbuild: add $(CLANG_FLAGS) to KBUILD_CPPFLAGS")
did something similar for clang for the same reason, so I would say it
is worth pursuing this direction. It also avoids including KBUILD_CFLAGS
twice when generating .i files.

Cheers,
Nathan

> 8<---------
> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index 65261cbe5bfd..9ad4ca318e34 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -62,14 +62,14 @@ KBUILD_LDFLAGS_MODULE += arch/powerpc/lib/crtsavres.o
>  endif
>  
>  ifdef CONFIG_CPU_LITTLE_ENDIAN
> -KBUILD_CFLAGS  += -mlittle-endian
> +KBUILD_CPPFLAGS        += -mlittle-endian
>  KBUILD_LDFLAGS += -EL
>  LDEMULATION    := lppc
>  GNUTARGET      := powerpcle
>  MULTIPLEWORD   := -mno-multiple
>  KBUILD_CFLAGS_MODULE += $(call cc-option,-mno-save-toc-indirect)
>  else
> -KBUILD_CFLAGS += $(call cc-option,-mbig-endian)
> +KBUILD_CPPFLAGS += $(call cc-option,-mbig-endian)
>  KBUILD_LDFLAGS += -EB
>  LDEMULATION    := ppc
>  GNUTARGET      := powerpc
> @@ -95,7 +95,7 @@ aflags-$(CONFIG_CPU_BIG_ENDIAN)               += $(call cc-option,-mbig-endian)
>  aflags-$(CONFIG_CPU_LITTLE_ENDIAN)     += -mlittle-endian
>  
>  ifeq ($(HAS_BIARCH),y)
> -KBUILD_CFLAGS  += -m$(BITS)
> +KBUILD_CPPFLAGS        += -m$(BITS)
>  KBUILD_AFLAGS  += -m$(BITS)
>  KBUILD_LDFLAGS += -m elf$(BITS)$(LDEMULATION)
>  endif
> @@ -176,7 +176,6 @@ KBUILD_CPPFLAGS     += -I $(srctree)/arch/powerpc $(asinstr)
>  KBUILD_AFLAGS  += $(AFLAGS-y)
>  KBUILD_CFLAGS  += $(call cc-option,-msoft-float)
>  KBUILD_CFLAGS  += $(CFLAGS-y)
> -CPP            = $(CC) -E $(KBUILD_CFLAGS)
>  
>  CHECKFLAGS     += -m$(BITS) -D__powerpc__ -D__powerpc$(BITS)__
>  ifdef CONFIG_CPU_BIG_ENDIAN
> diff --git a/arch/powerpc/kernel/vdso/Makefile b/arch/powerpc/kernel/vdso/Makefile
> index 1b93655c2857..3516e71926e5 100644
> --- a/arch/powerpc/kernel/vdso/Makefile
> +++ b/arch/powerpc/kernel/vdso/Makefile
> @@ -59,7 +59,7 @@ ldflags-$(CONFIG_LD_IS_LLD) += $(call cc-option,--ld-path=$(LD),-fuse-ld=lld)
>  ldflags-$(CONFIG_LD_ORPHAN_WARN) += -Wl,--orphan-handling=$(CONFIG_LD_ORPHAN_WARN_LEVEL)
>  
>  # Filter flags that clang will warn are unused for linking
> -ldflags-y += $(filter-out $(CC_AUTO_VAR_INIT_ZERO_ENABLER) $(CC_FLAGS_FTRACE) -Wa$(comma)%, $(KBUILD_CFLAGS))
> +ldflags-y += $(filter-out $(CC_AUTO_VAR_INIT_ZERO_ENABLER) $(CC_FLAGS_FTRACE) -Wa$(comma)%, $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS))
>  
>  CC32FLAGS := -m32
>  LD32FLAGS := -Wl,-soname=linux-vdso32.so.1
> --------->8
> 
>      Arnd
