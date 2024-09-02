Return-Path: <linuxppc-dev+bounces-859-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A220967F3F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2024 08:19:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WxzB26XGZz2yLg;
	Mon,  2 Sep 2024 16:19:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725257978;
	cv=none; b=L8PtFsLYe7OP8gLNI/QAmviROol+TEVbofasOy4Ho7e6X3uF9aS30PLCxWjdzZaJ46WNQ/15dibBJPgTGTJtDFvecvgL6sBqI+byPHM8mcQw91UDqSkvd1xqEm8TEKt4uhiV78akFY4mYV4wE/liagvi5mGe2kOqKxTo86we+pc5pd+HUz77yU2NepnfDUz4bf5r9gJOgEljcMUdF5flAdJtVrx60M1AcEtUP/Hgzwg0AhRHgVIY9NJP+NUnH6Hb3Zpgb08ISszhNrJpxyM3bF8ut1Lk5WQNVookzIkPX7INtWPmFj9CvdBkdHcC89YjS4rivfnyO3r+IjDUU14Yhg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725257978; c=relaxed/relaxed;
	bh=HHgEOXh7sKDdLlkFOPXQwu8Qe2Jbr6SkQlE+sWd/XmQ=;
	h=Received:X-Virus-Scanned:Received:Received:Received:
	 X-Virus-Scanned:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding; b=B1aMq/zMmQGwsfgFz7NMmAcZ3+4jq2anF5iL5NbmUmZK30aC5YfR7g3NHZ0PK79EvqRwKK+sVMN4EKYGQUKxEJGpmKKfxXV1WXtuChoFiVX1SluJTRSm5mwM81XMKVUtj3EKq1reZlUaQRTHiv0foUFfwfyHo1zufz6WhJIQ2N++wAHWfBDjwSZruqvn5sROgWKRiZ4FviZEVFo567X0WGsj5hjujcJ+5p/OpyyKSaViv2yIxCr3XJninZZyTeP0KpuB6uXg7FtbnNiN5FevF+GG6GFdn0ufL3YRhJEO5Se1D7URQK7jA5iDOqvDOnU8KAE5V75qv8suxY8+KwNB1w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WxzB24B8Mz2yG9
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Sep 2024 16:19:37 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Wxz9y3zggz9sSN;
	Mon,  2 Sep 2024 08:19:34 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oh9ReoBVOWjB; Mon,  2 Sep 2024 08:19:34 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Wxz9y2zjLz9sSH;
	Mon,  2 Sep 2024 08:19:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 50A268B76C;
	Mon,  2 Sep 2024 08:19:34 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id gAfIussLeGez; Mon,  2 Sep 2024 08:19:34 +0200 (CEST)
Received: from [192.168.234.158] (PO19952.IDSI0.si.c-s.fr [192.168.234.158])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B2F1A8B763;
	Mon,  2 Sep 2024 08:19:33 +0200 (CEST)
Message-ID: <5fa50d78-6764-4f99-87b3-7bd7edbeea5a@csgroup.eu>
Date: Mon, 2 Sep 2024 08:19:33 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] mm: make copy_to_kernel_nofault() not fault on user
 addresses
To: Omar Sandoval <osandov@osandov.com>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Christoph Hellwig <hch@lst.de>, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-um@lists.infradead.org, kernel-team@fb.com
References: <cover.1725223574.git.osandov@fb.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1725223574.git.osandov@fb.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 02/09/2024 à 07:31, Omar Sandoval a écrit :
> [Vous ne recevez pas souvent de courriers de osandov@osandov.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> From: Omar Sandoval <osandov@fb.com>
> 
> Hi,
> 
> I hit a case where copy_to_kernel_nofault() will fault (lol): if the
> destination address is in userspace and x86 Supervisor Mode Access
> Prevention is enabled. Patch 2 has the details and the fix. Patch 1
> renames a helper function so that its use in patch 2 makes more sense.
> If the rename is too intrusive, I can drop it.

The name of the function is "copy_to_kernel". If the destination is a 
user address, it is not a copy to kernel but a copy to user and you 
already have the function copy_to_user() for that. copy_to_user() 
properly handles SMAP.

Christophe


> 
> Thanks,
> Omar
> 
> Omar Sandoval (2):
>    mm: rename copy_from_kernel_nofault_allowed() to
>      copy_kernel_nofault_allowed()
>    mm: make copy_to_kernel_nofault() not fault on user addresses
> 
>   arch/arm/mm/fault.c         |  2 +-
>   arch/loongarch/mm/maccess.c |  2 +-
>   arch/mips/mm/maccess.c      |  2 +-
>   arch/parisc/lib/memcpy.c    |  2 +-
>   arch/powerpc/mm/maccess.c   |  2 +-
>   arch/um/kernel/maccess.c    |  2 +-
>   arch/x86/mm/maccess.c       |  4 ++--
>   include/linux/uaccess.h     |  2 +-
>   mm/maccess.c                | 10 ++++++----
>   9 files changed, 15 insertions(+), 13 deletions(-)
> 
> --
> 2.46.0
> 
> 

