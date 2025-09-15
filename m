Return-Path: <linuxppc-dev+bounces-12222-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7A3B57CB5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Sep 2025 15:22:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQQg12fGhz3dVx;
	Mon, 15 Sep 2025 23:22:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757942525;
	cv=none; b=kQAKGQppf8JfXaWWsWQf8kKa5CreA2l7Z0jVUx0VPxBcm0mFaN9Dch9t6KHeARR1hQcJDB01S4GqCeY5t3tUD1DK+gUOTsy1XS+IKl+7ndYWVkxhLcWHROC2FSIAqcM/BLmRhvkqz7qjkiyHBxcHBzBHPSDRzUeD9t1eU4kL5JiQHWuXI4dNV4Yd6tkCMQDpxXex2QM2rCTPOLVaRvfC3v+NjAuNtRriFqaheFQW+Kt7tTqUkt/RmeC+5Gz9vYRkBeUxhpbqCydKvetbabj0VS4rSrySfhhiWAMHaInH/CXCHqGJSHlSwHIHeXvnTWPa7EEo/m+J06Wna2Fv3xGoig==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757942525; c=relaxed/relaxed;
	bh=8LbZZQXBwakk1o8HoHgvDq6wMKD6k92z7xv9wHGbqAg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WWJUJYjChnTUzU/EpZtLYn1TQQ8d8cbAYUFuYQwdMBIJzL/ucS9wLFeFfP4ApO1uQi3lcf678U0UaUoVBfPCfH9OVvXe5t0Xlg1zIe1JZhvk7aVwSmwXpxqDaZg/io1fu0tvOT+GjpSStBnNbROrn08Nf6OuWFB8tna0KxJeasUN9DSZtBddSokJDlAfn139RcE90VBAW543yaC6sGOnQ5EjN3qFIIzfjKaG1ptsvi8PWDuVc0TD/dEyao3drGGrg0Joqt0cjfcIDsDQQlCNPm+PxK/7m4/CIcZNShRbFEUsQ6CtjRinrTxtSxYQQgWbmIkGs7S4Xmc5U7meSAtL3Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQQg02B6Zz3dTg
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Sep 2025 23:22:02 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cQNk651SSz9sxh;
	Mon, 15 Sep 2025 13:54:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zyKNPbK2UxYX; Mon, 15 Sep 2025 13:54:38 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cQNk52qX4z9sxf;
	Mon, 15 Sep 2025 13:54:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 307338B766;
	Mon, 15 Sep 2025 13:54:37 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id kYegUs-5AFEi; Mon, 15 Sep 2025 13:54:37 +0200 (CEST)
Received: from [10.25.207.160] (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 92F668B763;
	Mon, 15 Sep 2025 13:54:36 +0200 (CEST)
Message-ID: <a246ee31-1ea3-4278-b103-65fda6e692a9@csgroup.eu>
Date: Mon, 15 Sep 2025 13:54:36 +0200
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
Subject: Re: [PATCH RESEND 08/62] arm: init: remove FLAG_RDLOAD and
 FLAG_RDPROMPT
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
 <20250913003842.41944-9-safinaskar@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250913003842.41944-9-safinaskar@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 13/09/2025 à 02:37, Askar Safin a écrit :
> [Vous ne recevez pas souvent de courriers de safinaskar@gmail.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> They are unused since previous commit

Since which commit ?

> 
> Signed-off-by: Askar Safin <safinaskar@gmail.com>
> ---
>   Documentation/arch/arm/setup.rst | 4 ++--
>   arch/arm/kernel/atags_compat.c   | 2 --
>   2 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/arch/arm/setup.rst b/Documentation/arch/arm/setup.rst
> index 8e12ef3fb9a7..be77d4b2aac1 100644
> --- a/Documentation/arch/arm/setup.rst
> +++ b/Documentation/arch/arm/setup.rst
> @@ -35,8 +35,8 @@ below:
>       =====   ========================
>       bit 0   1 = mount root read only
>       bit 1   unused
> -    bit 2   0 = load ramdisk
> -    bit 3   0 = prompt for ramdisk
> +    bit 2   unused
> +    bit 3   unused
>       =====   ========================
> 
>    rootdev
> diff --git a/arch/arm/kernel/atags_compat.c b/arch/arm/kernel/atags_compat.c
> index b9747061fa97..8d04edee3066 100644
> --- a/arch/arm/kernel/atags_compat.c
> +++ b/arch/arm/kernel/atags_compat.c
> @@ -44,8 +44,6 @@ struct param_struct {
>              unsigned long ramdisk_size;         /*  8 */
>              unsigned long flags;                /* 12 */
>   #define FLAG_READONLY  1
> -#define FLAG_RDLOAD    4
> -#define FLAG_RDPROMPT  8
>              unsigned long rootdev;              /* 16 */
>              unsigned long video_num_cols;       /* 20 */
>              unsigned long video_num_rows;       /* 24 */
> --
> 2.47.2
> 
> 


