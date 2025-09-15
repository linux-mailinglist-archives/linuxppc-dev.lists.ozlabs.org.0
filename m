Return-Path: <linuxppc-dev+bounces-12251-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C60B5846E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Sep 2025 20:20:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQYHT3g23z3chv;
	Tue, 16 Sep 2025 04:20:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757960437;
	cv=none; b=IXcprOA299nccgxxpewfjq2o1W3tQZmZBFAIPBpWwgqmv+EGHkxGKtUj+NlMYcxEqNxk1aXw1vnjRO51TfVptRsxc7YrhQKpua9B44E74PL5MzAIoDTyLTPRSiEu5dTxkltkSw1cNUz25vdtPTwyT0okkQ+2lTSBiORd4R2c639dwgwp1pp1Uw4RyOoprkXEJFs7d4/rcDBaw0kmDM+c3gNVWX5Pi24uKnoWr7Z7ndnxRONpbkqnH+bp57NxDMGiHla0gj+dVuaOslqmGDRyFYGHp0ycOMeYiIiepbMCEGY0D8QUBsmtM7wu+7didaRrFrIjmS8zMKPdNJsY/1Wl7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757960437; c=relaxed/relaxed;
	bh=O1XbvmLD6s56hdCCZ7aKsrxIqtTrO4/3OkagSH/bFM4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DpK/jCJn+TByCpW22x+Veocq60JtVu5v+l695vQbHb8SrXrdJTI7cFcdaMqUof2rpNUR4oGrGRIXqxNOPq0ioulGifu/hkZakm8FvxrB0nrEZ7elqtQ3ysmeHlW+UHJbNCprN6+paHoT9Y852JTWnpLaiKD1jqqUSJm3/8LLix0nOMNrr2nhXh+SOUILLUyT1YOolw1Y/pVnveWjbxIVt0Z6x2jjw5HgQ+MTsRa5nU9u+7Mj5MrPRO0mFmUqZjbyNDeb5Bu6/KyPTe+DfMkiqQhyHghMRdlb6UxdhgvdpSDZ2up3aRADJ3GKHOHRVg9opya6peQySUINJf1S31hP3A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQYHS5Y3dz306S
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Sep 2025 04:20:36 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cQNnR0pmTz9sxp;
	Mon, 15 Sep 2025 13:57:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CofbtF7b-0VV; Mon, 15 Sep 2025 13:57:31 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cQNnQ5DNGz9sxl;
	Mon, 15 Sep 2025 13:57:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 981DC8B766;
	Mon, 15 Sep 2025 13:57:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id aYicW_kKuipv; Mon, 15 Sep 2025 13:57:30 +0200 (CEST)
Received: from [10.25.207.160] (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 227808B763;
	Mon, 15 Sep 2025 13:57:30 +0200 (CEST)
Message-ID: <99563c3d-7322-4164-81f3-0d28e91ed653@csgroup.eu>
Date: Mon, 15 Sep 2025 13:57:29 +0200
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
Subject: Re: [PATCH RESEND 06/62] arm: init: remove special logic for setting
 brd.rd_size
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
 <20250913003842.41944-7-safinaskar@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250913003842.41944-7-safinaskar@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 13/09/2025 à 02:37, Askar Safin a écrit :
> [Vous ne recevez pas souvent de courriers de safinaskar@gmail.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> There is no any reason for having special mechanism
> for setting ramdisk size.
> 
> Also this allows us to change rd_size variable to static

Can you squash patches 6 to 9 all together ?

> 
> Signed-off-by: Askar Safin <safinaskar@gmail.com>
> ---
>   arch/arm/kernel/atags_parse.c | 12 ------------
>   drivers/block/brd.c           |  8 ++++----
>   include/linux/initrd.h        |  3 ---
>   3 files changed, 4 insertions(+), 19 deletions(-)
> 
> diff --git a/arch/arm/kernel/atags_parse.c b/arch/arm/kernel/atags_parse.c
> index a3f0a4f84e04..615d9e83c9b5 100644
> --- a/arch/arm/kernel/atags_parse.c
> +++ b/arch/arm/kernel/atags_parse.c
> @@ -87,18 +87,6 @@ static int __init parse_tag_videotext(const struct tag *tag)
>   __tagtable(ATAG_VIDEOTEXT, parse_tag_videotext);
>   #endif
> 
> -#ifdef CONFIG_BLK_DEV_RAM
> -static int __init parse_tag_ramdisk(const struct tag *tag)
> -{
> -       if (tag->u.ramdisk.size)
> -               rd_size = tag->u.ramdisk.size;
> -
> -       return 0;
> -}
> -
> -__tagtable(ATAG_RAMDISK, parse_tag_ramdisk);
> -#endif
> -
>   static int __init parse_tag_serialnr(const struct tag *tag)
>   {
>          system_serial_low = tag->u.serialnr.low;
> diff --git a/drivers/block/brd.c b/drivers/block/brd.c
> index 0c2eabe14af3..72f02d2b8a99 100644
> --- a/drivers/block/brd.c
> +++ b/drivers/block/brd.c
> @@ -27,6 +27,10 @@
> 
>   #include <linux/uaccess.h>
> 
> +static unsigned long rd_size = CONFIG_BLK_DEV_RAM_SIZE;
> +module_param(rd_size, ulong, 0444);
> +MODULE_PARM_DESC(rd_size, "Size of each RAM disk in kbytes.");
> +
>   /*
>    * Each block ramdisk device has a xarray brd_pages of pages that stores
>    * the pages containing the block device's contents.
> @@ -209,10 +213,6 @@ static int rd_nr = CONFIG_BLK_DEV_RAM_COUNT;
>   module_param(rd_nr, int, 0444);
>   MODULE_PARM_DESC(rd_nr, "Maximum number of brd devices");
> 
> -unsigned long rd_size = CONFIG_BLK_DEV_RAM_SIZE;
> -module_param(rd_size, ulong, 0444);
> -MODULE_PARM_DESC(rd_size, "Size of each RAM disk in kbytes.");
> -
>   static int max_part = 1;
>   module_param(max_part, int, 0444);
>   MODULE_PARM_DESC(max_part, "Num Minors to reserve between devices");
> diff --git a/include/linux/initrd.h b/include/linux/initrd.h
> index 6320a9cb6686..b42235c21444 100644
> --- a/include/linux/initrd.h
> +++ b/include/linux/initrd.h
> @@ -5,9 +5,6 @@
> 
>   #define INITRD_MINOR 250 /* shouldn't collide with /dev/ram* too soon ... */
> 
> -/* size of a single RAM disk */
> -extern unsigned long rd_size;
> -
>   /* 1 if it is not an error if initrd_start < memory_start */
>   extern int initrd_below_start_ok;
> 
> --
> 2.47.2
> 
> 


