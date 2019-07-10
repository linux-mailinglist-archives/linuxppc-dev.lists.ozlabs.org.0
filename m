Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E08648C3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2019 16:57:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45kMjM3MVnzDqLP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2019 00:57:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="kLZtyL5l"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45kMg714j6zDq67
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2019 00:55:13 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45kMg011QGz9vBL9;
 Wed, 10 Jul 2019 16:55:08 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=kLZtyL5l; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id S2QPTAofV8Wp; Wed, 10 Jul 2019 16:55:08 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45kMg000CBz9vBKx;
 Wed, 10 Jul 2019 16:55:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1562770508; bh=f04mWvdmBZY2FUDsS/VFc17IYEz8iYcB6pvDdm6nJ/c=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=kLZtyL5lE7nBm1ErK3byyuVey5XaQgz9Me5sRtZy3qLtE5xZFeB58gmCeDFnGVXsl
 +hwIN+jk8NgpDdkg/kYhjiatwapZFBaK/LNQL6HnfdhtNYQdkLvx8leP/IRnacpVmD
 5xeDrGiNJQqXyznSlzNxjcO49nbyv3gqtCGNcEnA=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 890A58B80B;
 Wed, 10 Jul 2019 16:55:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id eDcK6_YkQYDa; Wed, 10 Jul 2019 16:55:09 +0200 (CEST)
Received: from [172.25.230.101] (po15451.idsi0.si.c-s.fr [172.25.230.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3F8438B808;
 Wed, 10 Jul 2019 16:55:09 +0200 (CEST)
Subject: Re: [PATCH v3 7/7] kexec_elf: remove unused variable in
 kexec_elf_load()
To: Sven Schnelle <svens@stackframe.org>, kexec@lists.infradead.org
References: <20190710142944.2774-1-svens@stackframe.org>
 <20190710142944.2774-8-svens@stackframe.org>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <5ff70f9b-905d-000d-af59-cba5c37f9328@c-s.fr>
Date: Wed, 10 Jul 2019 16:55:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190710142944.2774-8-svens@stackframe.org>
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
> base was never unsigned, so we can remove it.

Do you mean never assigned ?


> 
> Signed-off-by: Sven Schnelle <svens@stackframe.org>

Reviewed-by: Christophe Leroy <christophe.leroy@c-s.fr>

> ---
>   kernel/kexec_elf.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/kernel/kexec_elf.c b/kernel/kexec_elf.c
> index b7e47ddd7cad..a56ec5481e71 100644
> --- a/kernel/kexec_elf.c
> +++ b/kernel/kexec_elf.c
> @@ -348,7 +348,7 @@ int kexec_elf_load(struct kimage *image, struct elfhdr *ehdr,
>   			 struct kexec_buf *kbuf,
>   			 unsigned long *lowest_load_addr)
>   {
> -	unsigned long base = 0, lowest_addr = UINT_MAX;
> +	unsigned long lowest_addr = UINT_MAX;
>   	int ret;
>   	size_t i;
>   
> @@ -370,7 +370,7 @@ int kexec_elf_load(struct kimage *image, struct elfhdr *ehdr,
>   		kbuf->bufsz = size;
>   		kbuf->memsz = phdr->p_memsz;
>   		kbuf->buf_align = phdr->p_align;
> -		kbuf->buf_min = phdr->p_paddr + base;
> +		kbuf->buf_min = phdr->p_paddr;
>   		ret = kexec_add_buffer(kbuf);
>   		if (ret)
>   			goto out;
> @@ -380,9 +380,6 @@ int kexec_elf_load(struct kimage *image, struct elfhdr *ehdr,
>   			lowest_addr = load_addr;
>   	}
>   
> -	/* Update entry point to reflect new load address. */
> -	ehdr->e_entry += base;
> -
>   	*lowest_load_addr = lowest_addr;
>   	ret = 0;
>    out:
> 
