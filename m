Return-Path: <linuxppc-dev+bounces-4712-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBD9A027AB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jan 2025 15:20:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YRbtH09DPz306J;
	Tue,  7 Jan 2025 01:20:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736173206;
	cv=none; b=M8UKSSqAdnqR5Zu+Xbf7eAeUo6DABdLAwuPLQc9xRKVPTFlKYJRluISBw103XaOKP5doDQPBhKU+2DTpzm/KNKjcQ5KuWuW0kPIChtoKiSDTPsywZtuvziEZ+nLglxtPY6RHS0OcayQ7wqd/524z3Zyznsj/V9uYPqlyp6ZZFU3l3EjiksepRAsuPJ6dmlATlj8GKRqursYdOAz5NULmY1nS3YY+7W+i9vJ4lw7zQOfeJ4pLJ3NOnV1m9tgV0t7ptn6Mc26rFWhdjo0bB3rdZ0EwsRPR7RfeGvs6W6cTDAZEBXfB+HCTzswdbzyAN2f+jixNijD2DndbQrfCky1QCA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736173206; c=relaxed/relaxed;
	bh=G4SHAxlid5roUOrdQs15Mz6ooHb5rvbHcXMSh4aYTaw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YWADJ3mlK0E5Fm3Bk9kVICBHDfhSsz4BjjC9W6SIohDFxiDui3jfynLzGIAaFHQ1aNuNllNj2zJ/L9IHqGJPe/3hP87laIgpbpUgFRb2aEvZhcptI4ABPjzj63k/DHFU7oRZzphY6QQAKsJCibH46qZn28ghtCRngRao13hl+yKZM+4ebV0HLDLw1s6Kg34kZyFqyXlJ+v//VfQuxAlLMiARmsydVNQBg5Qq4TE+xrlrWFnFkyybofB6w1vYYnRjv1JPUaxgfzOM7xPh+N+xct/rMBB9JZv906lDdD9TjsgzCV5ktj010ZUiXrNaIFvv5WxFOk2Mshwe6GPpnQumlA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YRbtF4sd6z2y8p
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jan 2025 01:20:05 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YRbH0570yz9sSH;
	Mon,  6 Jan 2025 14:53:00 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mCGRxpvgUuLn; Mon,  6 Jan 2025 14:53:00 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YRbH03qJfz9sSC;
	Mon,  6 Jan 2025 14:53:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 6F5D88B76D;
	Mon,  6 Jan 2025 14:53:00 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id sf1e-5A563xg; Mon,  6 Jan 2025 14:53:00 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B60678B763;
	Mon,  6 Jan 2025 14:52:59 +0100 (CET)
Message-ID: <f4552e33-87d9-4b71-be21-f6884e4b5fa1@csgroup.eu>
Date: Mon, 6 Jan 2025 14:52:59 +0100
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/19] powerpc: boot: Enable FIT image generation
To: j.ne@posteo.net, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Frank Li <Frank.Li@nxp.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20250102-mpc83xx-v1-0-86f78ba2a7af@posteo.net>
 <20250102-mpc83xx-v1-8-86f78ba2a7af@posteo.net>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250102-mpc83xx-v1-8-86f78ba2a7af@posteo.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=2.0 required=5.0 tests=PDS_OTHER_BAD_TLD,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 02/01/2025 à 19:31, J. Neuschäfer via B4 Relay a écrit :
> [Vous ne recevez pas souvent de courriers de devnull+j.ne.posteo.net@kernel.org. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> From: "J. Neuschäfer" <j.ne@posteo.net>
> 
> The Flat Image Tree (FIT) format combines a kernel, a set of
> devicetrees, and optionally additional resources into a single file that
> can be loaded by a bootloader such as U-Boot. Generating a FIT image as
> part of the kernel build reduces the need for additional build scripts,
> and produces a single boot image without falling back to one of the
> many legacy methods implemented in arch/powerpc/boot/Makefile, which
> would require additional changes for arch/powerpc/boot for each board.

Will that allow compressed vmlinux ?

Looking at the change I have the feeling it only includes raw 
uncompressed images.


> 
> Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> ---
> 
> Checkpatch warns:
> 
>    arch/powerpc/boot/Makefile:364: WARNING: Possible repeated word: 'Image'
> 
> for this line:
> 
>    image-y += Image image.fit
> 
> This is bogus and can be ignored.
> ---
>   arch/powerpc/Makefile      |  3 ++-
>   arch/powerpc/boot/Makefile | 11 +++++++++++
>   2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index f3804103c56ccfdb16289468397ccaea71bf721e..693c82c06072fb0529288736efee460e375b2476 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -225,7 +225,7 @@ KBUILD_CFLAGS += $(cflags-y)
>   all: zImage
> 
>   # With make 3.82 we cannot mix normal and wildcard targets
> -BOOT_TARGETS1 := zImage zImage.initrd uImage
> +BOOT_TARGETS1 := zImage zImage.initrd uImage image.fit
>   BOOT_TARGETS2 := zImage% dtbImage% treeImage.% cuImage.% simpleImage.% uImage.%
> 
>   PHONY += $(BOOT_TARGETS1) $(BOOT_TARGETS2)
> @@ -237,6 +237,7 @@ $(BOOT_TARGETS1): vmlinux
>   $(BOOT_TARGETS2): vmlinux
>          $(Q)$(MAKE) $(build)=$(boot) $(patsubst %,$(boot)/%,$@)
> 
> +image.fit: dtbs
> 
>   PHONY += bootwrapper_install
>   bootwrapper_install:
> diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
> index 1ff6ad4f6cd27755ea7bfe5b02af4a47ca33cea7..e0c62ab1cc5af99e43f6639be11bf1c64d352db8 100644
> --- a/arch/powerpc/boot/Makefile
> +++ b/arch/powerpc/boot/Makefile
> @@ -360,6 +360,9 @@ ifdef CONFIG_PPC32
>   image-$(CONFIG_PPC_PMAC)       += zImage.coff zImage.miboot
>   endif
> 
> +# FIT support (generic)
> +image-y += Image image.fit
> +
>   # Allow extra targets to be added to the defconfig
>   image-y        += $(CONFIG_EXTRA_TARGETS)
> 
> @@ -398,6 +401,14 @@ $(obj)/dtbImage.%: vmlinux $(wrapperbits) $(obj)/dts/%.dtb FORCE
>   $(obj)/vmlinux.strip: vmlinux
>          $(STRIP) -s -R .comment $< -o $@
> 
> +OBJCOPYFLAGS += -O binary
> +
> +$(obj)/Image: vmlinux FORCE
> +       $(call if_changed,objcopy)
> +
> +$(obj)/image.fit: $(obj)/Image $(obj)/dts/dtbs-list FORCE
> +       $(call if_changed,fit)
> +
>   $(obj)/uImage: vmlinux $(wrapperbits) FORCE
>          $(call if_changed,wrap,uboot)
> 
> 
> --
> 2.45.2
> 
> 


