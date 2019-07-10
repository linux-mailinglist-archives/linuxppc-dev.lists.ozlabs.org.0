Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5427A64948
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2019 17:06:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45kMvY6jBxzDqhK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2019 01:06:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="BJ4sWu48"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45kMqf3dHTzDqQW
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2019 01:02:38 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45kMqX5g0Zz9vBK6;
 Wed, 10 Jul 2019 17:02:32 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=BJ4sWu48; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id uJEqSXiV2ybC; Wed, 10 Jul 2019 17:02:32 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45kMqX4b86z9vBJX;
 Wed, 10 Jul 2019 17:02:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1562770952; bh=p0Ol0rmBzFzZQpkrGhuxgq2fbJl2jXBPenG5CrgDc3A=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=BJ4sWu480Or7vHdI+GpJfMMdYqr3S2ortsnyas2gueBIzi017w123fgbdaphQ12V1
 hODB2wowkEr5/NuyEPeL41eecQHhSqClJHdA0HW7yGbKmWCBP3PvTkIT9ZrPTvZ3Mx
 obrsTaDx6xAHGqT1Kg7663yn2lqHo0A4dZZXYERY=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 369738B80B;
 Wed, 10 Jul 2019 17:02:34 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id rezQS68riQaZ; Wed, 10 Jul 2019 17:02:34 +0200 (CEST)
Received: from [172.25.230.101] (po15451.idsi0.si.c-s.fr [172.25.230.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D97958B807;
 Wed, 10 Jul 2019 17:02:33 +0200 (CEST)
Subject: Re: [PATCH v3 6/7] kexec_elf: remove Elf_Rel macro
To: Sven Schnelle <svens@stackframe.org>, kexec@lists.infradead.org
References: <20190710142944.2774-1-svens@stackframe.org>
 <20190710142944.2774-7-svens@stackframe.org>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <e9ad2137-f0a9-38e1-87a6-f4e215c87b53@c-s.fr>
Date: Wed, 10 Jul 2019 17:02:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190710142944.2774-7-svens@stackframe.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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
Cc: deller@gmx.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 10/07/2019 à 16:29, Sven Schnelle a écrit :
> It wasn't used anywhere, so lets drop it.

And also, it is already defined in asm-generic/module.h

> 
> Signed-off-by: Sven Schnelle <svens@stackframe.org>

Reviewed-by: Christophe Leroy <christophe.leroy@c-s.fr>

> ---
>   kernel/kexec_elf.c | 4 ----
>   1 file changed, 4 deletions(-)
> 
> diff --git a/kernel/kexec_elf.c b/kernel/kexec_elf.c
> index 99e6d63b5dfc..b7e47ddd7cad 100644
> --- a/kernel/kexec_elf.c
> +++ b/kernel/kexec_elf.c
> @@ -8,10 +8,6 @@
>   #include <linux/slab.h>
>   #include <linux/types.h>
>   
> -#ifndef Elf_Rel
> -#define Elf_Rel		Elf64_Rel
> -#endif /* Elf_Rel */
> -
>   static inline bool elf_is_elf_file(const struct elfhdr *ehdr)
>   {
>   	return memcmp(ehdr->e_ident, ELFMAG, SELFMAG) == 0;
> 
