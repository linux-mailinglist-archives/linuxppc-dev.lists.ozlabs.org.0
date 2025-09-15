Return-Path: <linuxppc-dev+bounces-12231-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBD7B57F7A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Sep 2025 16:50:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQSd85f0Sz3dVd;
	Tue, 16 Sep 2025 00:50:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757947836;
	cv=none; b=VD47rbBXSKsL+mGgqq3XjQN8A+7TycQnpk2wOmtYsmobVMDrlZdqsxZQ72WN1SYbaPKxHzHbCRod+cLxnBwhP7EbuzDvxzjD/Dgp3bym4Tu7AvLLptQ1HDyCLp63/RlnvaD6jvWvWMaSSWa1LIUq1Phx+tEZk5THze25P+ZRUCi6AMusZgYKLl+3C2ai6Wl2cNf3nnURDwd/feZLJj2nLMwVWmTQkXSy2VnWq+9tfaLeW6FHUvBIfwVr7E7FVEwoNIkPgDMRbxOAtOK+ffem9u1BDudFStlOwPULLTgwcod/3W7lffivJYtWoeCuy6x3YU14NYei99odhsmx9MMKuA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757947836; c=relaxed/relaxed;
	bh=Vbe0w4DAnuCL8J2vrzWlMqCh99kSyQCieLV52a77G+Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TY3PNMig6MXrvTWSr2XTTKh8I+14NZJxywb73viQTdG0VflbQetjw6WskJpvG2ZaUzKiPUajcTfTvPRsx+NVfDK3kyl6KgnlocIPV2hIJtBwtzCm8LkxPE9wb8Q2PgecZ/AxQ4TIiax9J0/8SqDe2t5nVuehhDngEkNtpgU3miKkJvhl8SYDTWVr/RWovrG1REHy91NXR65N9hMQ5Beo04qL7iGdGhwLTGv7MV0n6CBOiA9Nn0z0nWKpYqj6W+J0RPiA4dGTYbYTH6uK2un62GQwY9UCo/1NbgKPySI1gyrIslPDlzRmZQwTtVh5Q1eFqQWD5HhTpOSFvXKUxL5rbQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQSd80F6Cz3dGr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Sep 2025 00:50:35 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cQMxX3w10z9sxn;
	Mon, 15 Sep 2025 13:19:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lsQzt4OAL5QC; Mon, 15 Sep 2025 13:19:28 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cQMxW2nkYz9sxl;
	Mon, 15 Sep 2025 13:19:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 27EFC8B766;
	Mon, 15 Sep 2025 13:19:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id niL9xnZy0o5E; Mon, 15 Sep 2025 13:19:27 +0200 (CEST)
Received: from [10.25.207.160] (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 6E3148B763;
	Mon, 15 Sep 2025 13:19:26 +0200 (CEST)
Message-ID: <c52c2589-9d7b-4ac7-a61f-68fa9ba18308@csgroup.eu>
Date: Mon, 15 Sep 2025 13:19:26 +0200
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
Subject: Re: [PATCH RESEND 03/62] init: sh, sparc, x86: remove unused
 constants RAMDISK_PROMPT_FLAG and RAMDISK_LOAD_FLAG
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
 Heiko Carstens <hca@linux.ibm.com>, patches@lists.linux.dev,
 stable+noautosel@kernel.org
References: <20250913003842.41944-1-safinaskar@gmail.com>
 <20250913003842.41944-4-safinaskar@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250913003842.41944-4-safinaskar@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 13/09/2025 à 02:37, Askar Safin a écrit :
> [Vous ne recevez pas souvent de courriers de safinaskar@gmail.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> They were used for initrd before c8376994c86.
> 
> c8376994c86c made them unused and forgot to remove them
> 
> Fixes: c8376994c86c ("initrd: remove support for multiple floppies")
> Cc: <stable+noautosel@kernel.org> # because changes uapi headers
> Signed-off-by: Askar Safin <safinaskar@gmail.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   arch/sh/kernel/setup.c                | 2 --
>   arch/sparc/kernel/setup_32.c          | 2 --
>   arch/sparc/kernel/setup_64.c          | 2 --
>   arch/x86/include/uapi/asm/bootparam.h | 2 --
>   arch/x86/kernel/setup.c               | 2 --
>   5 files changed, 10 deletions(-)
> 
> diff --git a/arch/sh/kernel/setup.c b/arch/sh/kernel/setup.c
> index 039a51291002..d66f098e9e9f 100644
> --- a/arch/sh/kernel/setup.c
> +++ b/arch/sh/kernel/setup.c
> @@ -71,8 +71,6 @@ EXPORT_SYMBOL(sh_mv);
>   extern int root_mountflags;
> 
>   #define RAMDISK_IMAGE_START_MASK       0x07FF
> -#define RAMDISK_PROMPT_FLAG            0x8000
> -#define RAMDISK_LOAD_FLAG              0x4000
> 
>   static char __initdata command_line[COMMAND_LINE_SIZE] = { 0, };
> 
> diff --git a/arch/sparc/kernel/setup_32.c b/arch/sparc/kernel/setup_32.c
> index 704375c061e7..eb60be31127f 100644
> --- a/arch/sparc/kernel/setup_32.c
> +++ b/arch/sparc/kernel/setup_32.c
> @@ -172,8 +172,6 @@ extern unsigned short root_flags;
>   extern unsigned short root_dev;
>   extern unsigned short ram_flags;
>   #define RAMDISK_IMAGE_START_MASK       0x07FF
> -#define RAMDISK_PROMPT_FLAG            0x8000
> -#define RAMDISK_LOAD_FLAG              0x4000
> 
>   extern int root_mountflags;
> 
> diff --git a/arch/sparc/kernel/setup_64.c b/arch/sparc/kernel/setup_64.c
> index 63615f5c99b4..f728f1b00aca 100644
> --- a/arch/sparc/kernel/setup_64.c
> +++ b/arch/sparc/kernel/setup_64.c
> @@ -145,8 +145,6 @@ extern unsigned short root_flags;
>   extern unsigned short root_dev;
>   extern unsigned short ram_flags;
>   #define RAMDISK_IMAGE_START_MASK       0x07FF
> -#define RAMDISK_PROMPT_FLAG            0x8000
> -#define RAMDISK_LOAD_FLAG              0x4000
> 
>   extern int root_mountflags;
> 
> diff --git a/arch/x86/include/uapi/asm/bootparam.h b/arch/x86/include/uapi/asm/bootparam.h
> index dafbf581c515..f53dd3f319ba 100644
> --- a/arch/x86/include/uapi/asm/bootparam.h
> +++ b/arch/x86/include/uapi/asm/bootparam.h
> @@ -6,8 +6,6 @@
> 
>   /* ram_size flags */
>   #define RAMDISK_IMAGE_START_MASK       0x07FF
> -#define RAMDISK_PROMPT_FLAG            0x8000
> -#define RAMDISK_LOAD_FLAG              0x4000
> 
>   /* loadflags */
>   #define LOADED_HIGH    (1<<0)
> diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
> index 1b2edd07a3e1..6409e766fb17 100644
> --- a/arch/x86/kernel/setup.c
> +++ b/arch/x86/kernel/setup.c
> @@ -223,8 +223,6 @@ extern int root_mountflags;
>   unsigned long saved_video_mode;
> 
>   #define RAMDISK_IMAGE_START_MASK       0x07FF
> -#define RAMDISK_PROMPT_FLAG            0x8000
> -#define RAMDISK_LOAD_FLAG              0x4000
> 
>   static char __initdata command_line[COMMAND_LINE_SIZE];
>   #ifdef CONFIG_CMDLINE_BOOL
> --
> 2.47.2
> 
> 


