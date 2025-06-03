Return-Path: <linuxppc-dev+bounces-9088-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE95ACC07A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Jun 2025 08:50:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bBLvM3q8Gz2yNB;
	Tue,  3 Jun 2025 16:50:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748933439;
	cv=none; b=Acq6pOcKq44DMxhnzJeTezPA94cnbjluCPEHiF/iwlD3L92qrH9l06TbwNHajInTHkFQtO4bHLXhDi83/xm3sTTD7ZqIVI5+TczrqoceKnERGXedKOH2rO2+ZtvzT7InDIKtxpcRW5sXdShIXp/dFvXvtDteZO1Vvcm9bAmm1gjJxo0JqtnKOyQXgINrGKoRjNyp6gL05LWntEDYR6pLlAmpE9K6PeWjyJV710h6dDkAIYGenva2ZOgjtEIY0IaPY2nkm+hIQr51R7jIyYF764T7+F0PUnYkr4F7JypYUk2KUIEig9kX8W4AemiEs5Nj+UkvYLdXtBhJzyeGjgeJOg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748933439; c=relaxed/relaxed;
	bh=W9de7jHyyi7evOifFTIQ9/m9iBZ5RWO3QkmEBJCYbTE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fhDCxEhJ5gO6EV5Xw1xNUUmMfNdU4HittIAZySw4Jhaga66qQTFpG88KsgH4v7WCllgSFYUv87v3F0mACAZwVEzwfeBHX0HDx3Ad2yLSSjbnn5h7LUPYYbUlgGXfm6RvuuE+u1ZNkBMw4QtxMI91SSmS/DZih5slEYPtB5Ct/40QEBeKYZ3fkX5kYP0t030ZcqNTww1zT6v1Ob0yRc5EET3OA9Gj673ZDL+HhWjBgOePSBlUIo6F0vfKgKUgZzAHwdEwrrS6a9cPwWQc+2dsv0OgU++gMvWisdsNS2UMMaoTRAGLtrsDE9trAGtIYAjQacbt4xy88dbxlRIdTQTi8w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bBLvL3TL6z2yKq
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Jun 2025 16:50:35 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bBLln4vWSz9vY5;
	Tue,  3 Jun 2025 08:44:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jjqPCRYCwsSv; Tue,  3 Jun 2025 08:44:05 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bBLln47Zbz9vY4;
	Tue,  3 Jun 2025 08:44:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 88DBB8B765;
	Tue,  3 Jun 2025 08:44:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id WDcIPDlhdCxM; Tue,  3 Jun 2025 08:44:05 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 2D7CC8B763;
	Tue,  3 Jun 2025 08:44:05 +0200 (CEST)
Message-ID: <3cebc3c4-dbaf-41f6-b98d-1d33bea2eeeb@csgroup.eu>
Date: Tue, 3 Jun 2025 08:44:04 +0200
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
Subject: Re: [PATCH] powerpc: use always-y instead of extra-y in Makefiles
To: Masahiro Yamada <masahiroy@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org
References: <20250602163302.478765-1-masahiroy@kernel.org>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250602163302.478765-1-masahiroy@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 02/06/2025 à 18:32, Masahiro Yamada a écrit :
> The extra-y syntax is planned for deprecation because it is similar
> to always-y.
> 
> When building the boot wrapper, always-y and extra-y are equivalent.
> Use always-y instead.
> 
> In arch/powerpc/kernel/Makefile, I added ifdef KBUILD_BUILTIN to
> keep the current behavior: prom_init_check is skipped when building
> only modular objects.

I don't understand what you mean.

CONFIG_PPC_OF_BOOT_TRAMPOLINE is a bool, it cannot be a module.

prom_init_check is only to check the content of prom_init.o which is 
never a module.

Is always-y to run _after_ prom_init.o is built ?

Christophe

> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>   arch/powerpc/boot/Makefile   | 6 +++---
>   arch/powerpc/kernel/Makefile | 4 +++-
>   2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
> index 184d0680e661..b003f7ac8755 100644
> --- a/arch/powerpc/boot/Makefile
> +++ b/arch/powerpc/boot/Makefile
> @@ -242,13 +242,13 @@ $(obj)/wrapper.a: $(obj-wlib) FORCE
>   hostprogs	:= addnote hack-coff mktree
>   
>   targets		+= $(patsubst $(obj)/%,%,$(obj-boot) wrapper.a) zImage.lds
> -extra-y		:= $(obj)/wrapper.a $(obj-plat) $(obj)/empty.o \
> +always-y	:= $(obj)/wrapper.a $(obj-plat) $(obj)/empty.o \
>   		   $(obj)/zImage.lds $(obj)/zImage.coff.lds $(obj)/zImage.ps3.lds
>   
>   dtstree		:= $(src)/dts
>   
>   wrapper		:= $(src)/wrapper
> -wrapperbits	:= $(extra-y) $(addprefix $(obj)/,addnote hack-coff mktree) \
> +wrapperbits	:= $(always-y) $(addprefix $(obj)/,addnote hack-coff mktree) \
>   			$(wrapper) FORCE
>   
>   #############
> @@ -455,7 +455,7 @@ WRAPPER_DTSDIR := /usr/lib/kernel-wrapper/dts
>   WRAPPER_BINDIR := /usr/sbin
>   INSTALL := install
>   
> -extra-installed		:= $(patsubst $(obj)/%, $(DESTDIR)$(WRAPPER_OBJDIR)/%, $(extra-y))
> +extra-installed		:= $(patsubst $(obj)/%, $(DESTDIR)$(WRAPPER_OBJDIR)/%, $(always-y))
>   hostprogs-installed	:= $(patsubst %, $(DESTDIR)$(WRAPPER_BINDIR)/%, $(hostprogs))
>   wrapper-installed	:= $(DESTDIR)$(WRAPPER_BINDIR)/wrapper
>   dts-installed		:= $(patsubst $(dtstree)/%, $(DESTDIR)$(WRAPPER_DTSDIR)/%, $(wildcard $(dtstree)/*.dts))
> diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
> index 4d2daa8e7bca..ac01cedad107 100644
> --- a/arch/powerpc/kernel/Makefile
> +++ b/arch/powerpc/kernel/Makefile
> @@ -201,7 +201,9 @@ obj-$(CONFIG_ALTIVEC)		+= vector.o
>   
>   obj-$(CONFIG_PPC_OF_BOOT_TRAMPOLINE) += prom_init.o
>   obj64-$(CONFIG_PPC_OF_BOOT_TRAMPOLINE) += prom_entry_64.o
> -extra-$(CONFIG_PPC_OF_BOOT_TRAMPOLINE) += prom_init_check
> +ifdef KBUILD_BUILTIN
> +always-$(CONFIG_PPC_OF_BOOT_TRAMPOLINE) += prom_init_check
> +endif
>   
>   obj-$(CONFIG_PPC64)		+= $(obj64-y)
>   obj-$(CONFIG_PPC32)		+= $(obj32-y)


