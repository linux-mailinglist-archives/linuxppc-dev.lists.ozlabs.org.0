Return-Path: <linuxppc-dev+bounces-12255-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3990BB5853A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Sep 2025 21:20:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQZcj71M5z2yqP;
	Tue, 16 Sep 2025 05:20:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757964037;
	cv=none; b=a3G9VEvz/mrp0YnhYbAt7chpYJFG5jVexwMl7sunXBaKmwjcLbgiebQWzjtoBJwbSH08Z/gOXtGNSNnejjuMoZI+FRWAyI6PH/Kwk7jj+6GSnP48Mkv/b/y3wd5ar+kVf2uCx2aUJFo130b8AKGPiY1ZAj4ELY1AL1vj0TjR7/3ZroeDnZJoRq+gzbPbrJJS6qWjYi5sexeFl2N3GQK+vRbHvYAJJJxjYUAF0dFtYrgiuAwG0l0yTKSQmWuNq5DxyFrnxxeoR5mBulIRg2Y/wqgCH9bTHmmE56m5f/n9sGT3cc2Dn0Y7fMoveo6Jw1FKw+LJ7XU4sZpfaMbe1LJigQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757964037; c=relaxed/relaxed;
	bh=vxB3h+WtgQ+HrdZMynkuAbpQeMT6bWxh3Yog2UqVf9A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FaymAlkN/hJPviqTNn2nTWNYq6BJExQ/XHSy7GnjGaB33YsAqpLnTqEUH8eaVu8BgusY1Jb2S4z98Qp3lY1Tk7CV0V9vpneG8457y3vjj2Fppj1ztrnurf+6+Oj6thJjsGFEBDBxZi2b3H3haRMDNah6MD+d33rYhfpvSCExF2GVSufRGP0axUQvB4BlzEe83++Ov0TGZxWZW3Ez0z1k9/TaUi0tnSC09VWSjj+ctH9kGH9cKU/Fk27hvWSOANHgYLyikoseDJEUbRgqmh0UX3JJC11OpD31yLNqsZw8L+1h3NemUd0etchd/JuspWuvjeThzeUifSezFE7cWTOtWA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQZch4slFz2xS2
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Sep 2025 05:20:36 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cQNZf0vcmz9syy;
	Mon, 15 Sep 2025 13:48:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 94pnKAlpBYHg; Mon, 15 Sep 2025 13:48:10 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cQNZd5CrVz9syw;
	Mon, 15 Sep 2025 13:48:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 7E35C8B766;
	Mon, 15 Sep 2025 13:48:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id uLBCpzlqUS-U; Mon, 15 Sep 2025 13:48:09 +0200 (CEST)
Received: from [10.25.207.160] (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id DC6128B763;
	Mon, 15 Sep 2025 13:48:08 +0200 (CEST)
Message-ID: <fe3aea1c-24eb-49f4-9ce3-8f132d8814be@csgroup.eu>
Date: Mon, 15 Sep 2025 13:48:08 +0200
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
Subject: Re: [PATCH RESEND 05/62] init: remove "ramdisk_start" command line
 parameter, which controls starting block number of initrd
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
 <20250913003842.41944-6-safinaskar@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250913003842.41944-6-safinaskar@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Have a simpler subject,

Le 13/09/2025 à 02:37, Askar Safin a écrit :
> [Vous ne recevez pas souvent de courriers de safinaskar@gmail.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> This is preparation for initrd removal

and make a more interesting message.


For me it would make more sense to remove ramdisk_start and ramdisk_size 
at the same time.

Christophe

> 
> Signed-off-by: Askar Safin <safinaskar@gmail.com>
> ---
>   Documentation/admin-guide/blockdev/ramdisk.rst  | 3 +--
>   Documentation/admin-guide/kernel-parameters.txt | 2 --
>   init/do_mounts_rd.c                             | 7 -------
>   3 files changed, 1 insertion(+), 11 deletions(-)
> 
> diff --git a/Documentation/admin-guide/blockdev/ramdisk.rst b/Documentation/admin-guide/blockdev/ramdisk.rst
> index 9ce6101e8dd9..e57c61108dbc 100644
> --- a/Documentation/admin-guide/blockdev/ramdisk.rst
> +++ b/Documentation/admin-guide/blockdev/ramdisk.rst
> @@ -74,12 +74,11 @@ arch/x86/boot/Makefile.
> 
>   Some of the kernel command line boot options that may apply here are::
> 
> -  ramdisk_start=N
>     ramdisk_size=M
> 
>   If you make a boot disk that has LILO, then for the above, you would use::
> 
> -       append = "ramdisk_start=N ramdisk_size=M"
> +       append = "ramdisk_size=M"
> 
>   4) An Example of Creating a Compressed RAM Disk
>   -----------------------------------------------
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index f940c1184912..07e8878f1e13 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -5285,8 +5285,6 @@
>          ramdisk_size=   [RAM] Sizes of RAM disks in kilobytes
>                          See Documentation/admin-guide/blockdev/ramdisk.rst.
> 
> -       ramdisk_start=  [RAM] RAM disk image start address
> -
>          random.trust_cpu=off
>                          [KNL,EARLY] Disable trusting the use of the CPU's
>                          random number generator (if available) to
> diff --git a/init/do_mounts_rd.c b/init/do_mounts_rd.c
> index 8e0a774a9c6f..864fa88d9f89 100644
> --- a/init/do_mounts_rd.c
> +++ b/init/do_mounts_rd.c
> @@ -17,13 +17,6 @@
>   static struct file *in_file, *out_file;
>   static loff_t in_pos, out_pos;
> 
> -static int __init ramdisk_start_setup(char *str)
> -{
> -       /* will be removed in next commit */
> -       return 1;
> -}
> -__setup("ramdisk_start=", ramdisk_start_setup);
> -
>   static int __init crd_load(decompress_fn deco);
> 
>   /*
> --
> 2.47.2
> 
> 


