Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD523EE3E3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Aug 2021 03:42:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GpYgS1MtHz30GM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Aug 2021 11:42:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tUFuHJjK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=nathan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=tUFuHJjK; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GpYfl4RHcz2yX6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Aug 2021 11:41:51 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 73B6660EAF;
 Tue, 17 Aug 2021 01:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629164508;
 bh=QekGBuAmgIA3toUVqOHwstIHLQ0d84+8ZOIgxqMHWX0=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=tUFuHJjKv5HUYZX1ooB8WUXqb3BzLvzTGfDJz3tDTumhk9zjL8vHOfGNa1UYFLraO
 Ipn6sQWu5U6ijtyBi7wdrkBVZOnQHNgytPe/e1YlFqpXQlsNLcbSopaEJFZ6l8ugXj
 vu2UjVSJzzLdLlTIiq3zn/sZ0+UI5YWF2K2Zfzo2sB/dermM4hqv3OFWjPbqTD9k/y
 IoI65S5p6xsAhja/iflop20HWad9Y5YO989aMkozzTg6tYEg4WwRiK8/kB2t4KsmSY
 xsBKNEhEkB4mo16BpKis/lnYL8zQ7BEGAUOguP/imil37CHYzukEZ5kLnR7LV0C8eU
 clqBobRoceDzA==
Subject: Re: [PATCH 3/7] powerpc: replace cc-option-yn uses with cc-option
To: Nick Desaulniers <ndesaulniers@google.com>,
 Masahiro Yamada <masahiroy@kernel.org>
References: <20210817002109.2736222-1-ndesaulniers@google.com>
 <20210817002109.2736222-4-ndesaulniers@google.com>
From: Nathan Chancellor <nathan@kernel.org>
Message-ID: <b6a02209-858b-3755-5cb7-7c0b0713c8c7@kernel.org>
Date: Mon, 16 Aug 2021 18:41:45 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210817002109.2736222-4-ndesaulniers@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 8/16/2021 5:21 PM, 'Nick Desaulniers' via Clang Built Linux wrote:
> cc-option-yn can be replaced with cc-option. ie.
> Checking for support:
> ifeq ($(call cc-option-yn,$(FLAG)),y)
> becomes:
> ifneq ($(call cc-option,$(FLAG)),)
> 
> Checking for lack of support:
> ifeq ($(call cc-option-yn,$(FLAG)),n)
> becomes:
> ifeq ($(call cc-option,$(FLAG)),)
> 
> This allows us to pursue removing cc-option-yn.
> 
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
>   arch/powerpc/Makefile      | 12 ++++++------
>   arch/powerpc/boot/Makefile |  5 +----
>   2 files changed, 7 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index 9aaf1abbc641..85e224536cf7 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -12,12 +12,12 @@
>   # Rewritten by Cort Dougan and Paul Mackerras
>   #
>   
> -HAS_BIARCH	:= $(call cc-option-yn, -m32)
> +HAS_BIARCH	:= $(call cc-option,-m32)
>   
>   # Set default 32 bits cross compilers for vdso and boot wrapper
>   CROSS32_COMPILE ?=
>   
> -ifeq ($(HAS_BIARCH),y)
> +ifeq ($(HAS_BIARCH),-m32)
>   ifeq ($(CROSS32_COMPILE),)
>   ifdef CONFIG_PPC32
>   # These options will be overridden by any -mcpu option that the CPU
> @@ -107,7 +107,7 @@ cflags-$(CONFIG_CPU_LITTLE_ENDIAN)	+= -mlittle-endian
>   aflags-$(CONFIG_CPU_BIG_ENDIAN)		+= $(call cc-option,-mbig-endian)
>   aflags-$(CONFIG_CPU_LITTLE_ENDIAN)	+= -mlittle-endian
>   
> -ifeq ($(HAS_BIARCH),y)
> +ifeq ($(HAS_BIARCH),-m32)
>   KBUILD_CFLAGS	+= -m$(BITS)
>   KBUILD_AFLAGS	+= -m$(BITS) -Wl,-a$(BITS)
>   KBUILD_LDFLAGS	+= -m elf$(BITS)$(LDEMULATION)
> @@ -125,7 +125,9 @@ LDFLAGS_vmlinux-$(CONFIG_RELOCATABLE) := -pie
>   LDFLAGS_vmlinux	:= $(LDFLAGS_vmlinux-y)
>   
>   ifdef CONFIG_PPC64
> -ifeq ($(call cc-option-yn,-mcmodel=medium),y)
> +ifeq ($(call cc-option,-mcmodel=medium),)
> +	export NO_MINIMAL_TOC := -mno-minimal-toc
> +else
>   	# -mcmodel=medium breaks modules because it uses 32bit offsets from
>   	# the TOC pointer to create pointers where possible. Pointers into the
>   	# percpu data area are created by this method.
> @@ -135,8 +137,6 @@ ifeq ($(call cc-option-yn,-mcmodel=medium),y)
>   	# kernel percpu data space (starting with 0xc...). We need a full
>   	# 64bit relocation for this to work, hence -mcmodel=large.
>   	KBUILD_CFLAGS_MODULE += -mcmodel=large
> -else
> -	export NO_MINIMAL_TOC := -mno-minimal-toc
>   endif
>   endif
>   
> diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
> index 10c0fb306f15..33e1de5d1c95 100644
> --- a/arch/powerpc/boot/Makefile
> +++ b/arch/powerpc/boot/Makefile
> @@ -66,10 +66,7 @@ ifdef CONFIG_DEBUG_INFO
>   BOOTCFLAGS	+= -g
>   endif
>   
> -ifeq ($(call cc-option-yn, -fstack-protector),y)
> -BOOTCFLAGS	+= -fno-stack-protector
> -endif
> -
> +BOOTCFLAGS	+= $(call cc-option,-fstack-protector)

This was previously disabling the stack protector but now it is enabling 
it. Just remove the ifeq conditional altogether as the kernel assumes 
-fno-stack-protector is always supported after commit 893ab00439a4 
("kbuild: remove cc-option test of -fno-stack-protector").

>   BOOTCFLAGS	+= -I$(objtree)/$(obj) -I$(srctree)/$(obj)
>   
>   DTC_FLAGS	?= -p 1024
> 
