Return-Path: <linuxppc-dev+bounces-12232-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B56B57F7B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Sep 2025 16:50:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQSdD733Cz3dwG;
	Tue, 16 Sep 2025 00:50:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757947840;
	cv=none; b=Iz3ZTtDtkzBsgMnP0VwkXtZinUMNbIdsJ2ce6bB0S+pc+wLlv4e9nlcrZGo+Rqdok5MV87VKPPc3mqJLtDxd2Lwupx186waKSTzrumme+YoWsNQOZqY9d9imSaK2AD5Uph5yZovY2tIhcx2JTynnhQeCcm0FXjoMS82ibalR2dNEu+N2y6Fq/IYTeJT4+M9VxkomGlpE+uYLrGhCVIjhWEFxb+se1M4hxaI9OzenRtgDenojG6BsKCGnKCIJqr7Wer+m+jJxFTt1fNaMWrCHXqhUy5C3T6kPYaP3W9saxOqk94r1CIgLBW7mThBC70AUuZxQ5DGDLsdUS9h6w1nQkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757947840; c=relaxed/relaxed;
	bh=A7SCR9BDVn4RNVUVtun87smf4PKhLZ879PG0u2HnQME=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KFLpOzcVFS0dbweILAjrL0d0iW4Wup0wZwTqNuO9y1lkc+URkHnaXQI//h9+on5jckCv9kXUUGSlJbhMWxHWQlzOU7+ntZdM5TvoZ/Eib60iv5fIlvMN+/hkGBkdEW4s1Oo9+9w6G0f6ahIrfUqzp33a+UHbXNczughZabBCbDjMZiZF86vzhraVfWTisZZh0k4GMgPJc7p3AWrAS8Rt2OD6HfwnnGM73wl87vo/E17W7Mq29Ykf5mcyzcrBIfH+L9H5X4EVbzW+EWiYINQ8itqpWzPAr1ZCORy9znWT5dMuvludHTqxOczozntfM++yDolxddWVgIfLpQ4ZLj/oTw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQSdD2lbSz3dtJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Sep 2025 00:50:40 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cQMty1PZPz9sxj;
	Mon, 15 Sep 2025 13:17:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3y6qLNUbAYQ5; Mon, 15 Sep 2025 13:17:14 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cQMtx060wz9sxg;
	Mon, 15 Sep 2025 13:17:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id BF74D8B766;
	Mon, 15 Sep 2025 13:17:12 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id LLgTqAL1YNfN; Mon, 15 Sep 2025 13:17:12 +0200 (CEST)
Received: from [10.25.207.160] (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id F017B8B763;
	Mon, 15 Sep 2025 13:17:11 +0200 (CEST)
Message-ID: <8b56da8e-42d1-4548-8e39-286010c5d84a@csgroup.eu>
Date: Mon, 15 Sep 2025 13:17:11 +0200
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
Subject: Re: [PATCH RESEND 01/62] init: remove deprecated "load_ramdisk"
 command line parameter, which does nothing
To: Askar Safin <safinaskar@gmail.com>, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Christian Brauner <brauner@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
 Jan Kara <jack@suse.cz>, Christoph Hellwig <hch@lst.de>,
 Jens Axboe <axboe@kernel.dk>, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Aleksa Sarai <cyphar@cyphar.com>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Julian Stecklina <julian.stecklina@cyberus-technology.de>,
 Gao Xiang <hsiangkao@linux.alibaba.com>, Art Nikpal <email2tema@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, Eric Curtin <ecurtin@redhat.com>,
 Alexander Graf <graf@amazon.com>, Rob Landley <rob@landley.net>,
 Lennart Poettering <mzxreary@0pointer.de>, linux-arch@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-um@lists.infradead.org, x86@kernel.org,
 Ingo Molnar <mingo@redhat.com>, linux-block@vger.kernel.org,
 initramfs@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-efi@vger.kernel.org,
 linux-ext4@vger.kernel.org, "Theodore Y . Ts'o" <tytso@mit.edu>,
 linux-acpi@vger.kernel.org, Michal Simek <monstr@monstr.eu>,
 devicetree@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
 Kees Cook <kees@kernel.org>, Thorsten Blum <thorsten.blum@linux.dev>,
 Heiko Carstens <hca@linux.ibm.com>, patches@lists.linux.dev
References: <20250913003842.41944-1-safinaskar@gmail.com>
 <20250913003842.41944-2-safinaskar@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250913003842.41944-2-safinaskar@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 13/09/2025 à 02:37, Askar Safin a écrit :
> [Vous ne recevez pas souvent de courriers de safinaskar@gmail.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> This is preparation for initrd removal


Squash patch 1 and patch 2 together and say this is cleanup of two 
options deprecated by commit c8376994c86c ("initrd: remove support for 
multiple floppies") with the documentation by commit 6b99e6e6aa62 
("Documentation/admin-guide: blockdev/ramdisk: remove use of "rdev"")

Christophe


> 
> Signed-off-by: Askar Safin <safinaskar@gmail.com>
> ---
>   Documentation/admin-guide/kernel-parameters.txt | 2 --
>   arch/arm/configs/neponset_defconfig             | 2 +-
>   init/do_mounts.c                                | 7 -------
>   3 files changed, 1 insertion(+), 10 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 747a55abf494..d3b05ce249ff 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -3275,8 +3275,6 @@
>                          If there are multiple matching configurations changing
>                          the same attribute, the last one is used.
> 
> -       load_ramdisk=   [RAM] [Deprecated]
> -
>          lockd.nlm_grace_period=P  [NFS] Assign grace period.
>                          Format: <integer>
> 
> diff --git a/arch/arm/configs/neponset_defconfig b/arch/arm/configs/neponset_defconfig
> index 2227f86100ad..16f7300239da 100644
> --- a/arch/arm/configs/neponset_defconfig
> +++ b/arch/arm/configs/neponset_defconfig
> @@ -9,7 +9,7 @@ CONFIG_ASSABET_NEPONSET=y
>   CONFIG_ZBOOT_ROM_TEXT=0x80000
>   CONFIG_ZBOOT_ROM_BSS=0xc1000000
>   CONFIG_ZBOOT_ROM=y
> -CONFIG_CMDLINE="console=ttySA0,38400n8 cpufreq=221200 rw root=/dev/mtdblock2 mtdparts=sa1100:512K(boot),1M(kernel),2560K(initrd),4M(root) load_ramdisk=1 prompt_ramdisk=0 mem=32M noinitrd initrd=0xc0800000,3M"
> +CONFIG_CMDLINE="console=ttySA0,38400n8 cpufreq=221200 rw root=/dev/mtdblock2 mtdparts=sa1100:512K(boot),1M(kernel),2560K(initrd),4M(root) prompt_ramdisk=0 mem=32M noinitrd initrd=0xc0800000,3M"
>   CONFIG_FPE_NWFPE=y
>   CONFIG_PM=y
>   CONFIG_MODULES=y
> diff --git a/init/do_mounts.c b/init/do_mounts.c
> index 6af29da8889e..0f2f44e6250c 100644
> --- a/init/do_mounts.c
> +++ b/init/do_mounts.c
> @@ -34,13 +34,6 @@ static int root_wait;
> 
>   dev_t ROOT_DEV;
> 
> -static int __init load_ramdisk(char *str)
> -{
> -       pr_warn("ignoring the deprecated load_ramdisk= option\n");
> -       return 1;
> -}
> -__setup("load_ramdisk=", load_ramdisk);
> -
>   static int __init readonly(char *str)
>   {
>          if (*str)
> --
> 2.47.2
> 
> 


