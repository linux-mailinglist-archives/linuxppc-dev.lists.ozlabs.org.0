Return-Path: <linuxppc-dev+bounces-12254-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C12B58539
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Sep 2025 21:20:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQZcj0MVDz2xns;
	Tue, 16 Sep 2025 05:20:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757964036;
	cv=none; b=YEWdtzoCCwLHjBWwR8630ZuBXBkc/nwfF/d3cKmE6EP0163PmWacwTBfUzJtFMulebj1u0zPdcgvBiKO8COpODgrHYveh1F9cIlB3jesx25HCw/8MB2DFMBlumIAUW5KLFKOSTox5eWnZ5vXhlNBCbh02RTzuICe9PfQgWASRFwfwBlqVQ77idy3lJ9PJqM0tdJaafJgvzAzphhD/zrAUVZi6Ho7lq4+BgtQ+MnWa52K04NqcWIppuAC0EBA4cJGVcqQBzXutpjMxxqdKciWPX9Kgpqm2TB6VXejtlL9gWP2miJLnJ6954Le6nSyrogVQBAF6X1ChN33BNRk6MprqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757964036; c=relaxed/relaxed;
	bh=F10Z0OsYT+kNHV3Z5mbBWTZLBFcFmmcfUW5nyLJWgQ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SOBgsnA53gn9XAZqHWlJZanb5IgaKxw9xXHdhycN1P+LbvA5HTvSghuJi8NuEvyhq9RgNye8pGS8+Ui/MMbw4XAKLGV95jrH3Vd0vZ7zkjpkikcwQHlcELtjnEp6YkCJlHIcX/QyPchMP3WnOUYWOktfCDDVlaKHrVw94OOuJa9dPRAn63rnCNST1SfME/KGQrvE/8jXDLI+Pot80vSNAoMvhVq5ytTIktCi10F+xRmNW4LhSrJv/qDFx0uj9psGwZvrGWdCEFe4xCTVNhAsw/nn/JO1Gw+HUi9LaQGi1RZJ4Iie1aUY8OpSxpLMJonbtiblTCou7uKJCbA8pCP9Uw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQZch1xzZz2xQ2
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Sep 2025 05:20:36 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cQNbF5mghz9t06;
	Mon, 15 Sep 2025 13:48:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lGkOMbzCsqbk; Mon, 15 Sep 2025 13:48:41 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cQNbD4NF4z9t02;
	Mon, 15 Sep 2025 13:48:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 63D1F8B766;
	Mon, 15 Sep 2025 13:48:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id OqxzzIPrAedJ; Mon, 15 Sep 2025 13:48:40 +0200 (CEST)
Received: from [10.25.207.160] (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B11BF8B763;
	Mon, 15 Sep 2025 13:48:39 +0200 (CEST)
Message-ID: <2757ca88-5841-4024-932e-637130ac6b0b@csgroup.eu>
Date: Mon, 15 Sep 2025 13:48:39 +0200
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
Subject: Re: [PATCH RESEND 16/62] brd: remove "ramdisk_size" command line
 parameter
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
 <20250913003842.41944-17-safinaskar@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250913003842.41944-17-safinaskar@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 13/09/2025 à 02:37, Askar Safin a écrit :
> [Vous ne recevez pas souvent de courriers de safinaskar@gmail.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> It was used mostly for initrd. It could be used only if
> brd is built-in. Use "brd.rd_size" instead

For me it would make more sense to remove ramdisk_start and ramdisk_size 
at the same time.


> 
> Signed-off-by: Askar Safin <safinaskar@gmail.com>
> ---
>   .../admin-guide/kernel-parameters.txt         |  3 ---
>   Documentation/arch/m68k/kernel-options.rst    | 20 ++-----------------
>   arch/arm/configs/s3c6400_defconfig            |  2 +-
>   drivers/block/brd.c                           | 10 ----------
>   4 files changed, 3 insertions(+), 32 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index ad52e3d26014..e862a7b1d2ec 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -5279,9 +5279,6 @@
>          raid=           [HW,RAID]
>                          See Documentation/admin-guide/md.rst.
> 
> -       ramdisk_size=   [RAM] Sizes of RAM disks in kilobytes
> -                       See Documentation/admin-guide/blockdev/ramdisk.rst.
> -
>          random.trust_cpu=off
>                          [KNL,EARLY] Disable trusting the use of the CPU's
>                          random number generator (if available) to
> diff --git a/Documentation/arch/m68k/kernel-options.rst b/Documentation/arch/m68k/kernel-options.rst
> index 2008a20b4329..f6469ebeb2c7 100644
> --- a/Documentation/arch/m68k/kernel-options.rst
> +++ b/Documentation/arch/m68k/kernel-options.rst
> @@ -215,27 +215,11 @@ Devices possible for Atari:
>              seconds.
> 
> 
> -2.6) ramdisk_size=
> -------------------
> -
> -:Syntax: ramdisk_size=<size>
> -
> -This option instructs the kernel to set up a ramdisk of the given
> -size in KBytes. Do not use this option if the ramdisk contents are
> -passed by bootstrap! In this case, the size is selected automatically
> -and should not be overwritten.
> -
> -The only application is for root filesystems on floppy disks, that
> -should be loaded into memory. To do that, select the corresponding
> -size of the disk as ramdisk size, and set the root device to the disk
> -drive (with "root=").
> -
> -
> -2.7) swap=
> +2.5) swap=
> 
>     I can't find any sign of this option in 2.2.6.
> 
> -2.8) buff=
> +2.6) buff=
>   -----------
> 
>     I can't find any sign of this option in 2.2.6.
> diff --git a/arch/arm/configs/s3c6400_defconfig b/arch/arm/configs/s3c6400_defconfig
> index a37e6ac40825..23635d5b9322 100644
> --- a/arch/arm/configs/s3c6400_defconfig
> +++ b/arch/arm/configs/s3c6400_defconfig
> @@ -4,7 +4,7 @@ CONFIG_ARCH_MULTI_V6=y
>   # CONFIG_ARCH_MULTI_V7 is not set
>   CONFIG_ARCH_S3C64XX=y
>   CONFIG_MACH_WLF_CRAGG_6410=y
> -CONFIG_CMDLINE="console=ttySAC0,115200 root=/dev/ram init=/linuxrc initrd=0x51000000,6M ramdisk_size=6144"
> +CONFIG_CMDLINE="console=ttySAC0,115200 root=/dev/ram init=/linuxrc initrd=0x51000000,6M"
>   CONFIG_VFP=y
>   CONFIG_MODULES=y
>   CONFIG_MODULE_UNLOAD=y
> diff --git a/drivers/block/brd.c b/drivers/block/brd.c
> index 72f02d2b8a99..05c4325904d2 100644
> --- a/drivers/block/brd.c
> +++ b/drivers/block/brd.c
> @@ -222,16 +222,6 @@ MODULE_LICENSE("GPL");
>   MODULE_ALIAS_BLOCKDEV_MAJOR(RAMDISK_MAJOR);
>   MODULE_ALIAS("rd");
> 
> -#ifndef MODULE
> -/* Legacy boot options - nonmodular */
> -static int __init ramdisk_size(char *str)
> -{
> -       rd_size = simple_strtol(str, NULL, 0);
> -       return 1;
> -}
> -__setup("ramdisk_size=", ramdisk_size);
> -#endif
> -
>   /*
>    * The device scheme is derived from loop.c. Keep them in synch where possible
>    * (should share code eventually).
> --
> 2.47.2
> 
> 


