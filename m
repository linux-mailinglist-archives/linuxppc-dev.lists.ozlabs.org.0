Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF0F3E1129
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 11:18:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GgNMF6fp7z3clv
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 19:18:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GgNLr0g1zz3dGG
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Aug 2021 19:18:10 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4GgNLl4K04z9sWJ;
 Thu,  5 Aug 2021 11:18:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u8DIUV7I5wGA; Thu,  5 Aug 2021 11:18:07 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4GgNLl3KK1z9sWH;
 Thu,  5 Aug 2021 11:18:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 525F78B7BF;
 Thu,  5 Aug 2021 11:18:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 0W9Kg7YB8_OZ; Thu,  5 Aug 2021 11:18:07 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C02128B7BE;
 Thu,  5 Aug 2021 11:18:06 +0200 (CEST)
Subject: Re: [PATCH v5 8/8] lkdtm/powerpc: Fix code patching hijack test
To: "Christopher M. Riedl" <cmr@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20210713053113.4632-1-cmr@linux.ibm.com>
 <20210713053113.4632-9-cmr@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <7a6c97ed-815b-49fc-5568-ab4420f53122@csgroup.eu>
Date: Thu, 5 Aug 2021 11:18:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210713053113.4632-9-cmr@linux.ibm.com>
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
Cc: keescook@chromium.org, peterz@infradead.org, x86@kernel.org,
 npiggin@gmail.com, linux-hardening@vger.kernel.org, tglx@linutronix.de,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 13/07/2021 à 07:31, Christopher M. Riedl a écrit :
> Code patching on powerpc with a STRICT_KERNEL_RWX uses a userspace
> address in a temporary mm on Radix now. Use __put_user() to avoid write
> failures due to KUAP when attempting a "hijack" on the patching address.
> __put_user() also works with the non-userspace, vmalloc-based patching
> address on non-Radix MMUs.

It is not really clean to use __put_user() on non user address, allthought it works by change.

I think it would be better to do something like

	if (is_kernel_addr(addr))
		copy_to_kernel_nofault(...);
	else
		copy_to_user_nofault(...);



> 
> Signed-off-by: Christopher M. Riedl <cmr@linux.ibm.com>
> ---
>   drivers/misc/lkdtm/perms.c | 9 ---------
>   1 file changed, 9 deletions(-)
> 
> diff --git a/drivers/misc/lkdtm/perms.c b/drivers/misc/lkdtm/perms.c
> index 41e87e5f9cc86..da6a34a0a49fb 100644
> --- a/drivers/misc/lkdtm/perms.c
> +++ b/drivers/misc/lkdtm/perms.c
> @@ -262,16 +262,7 @@ static inline u32 lkdtm_read_patch_site(void)
>   /* Returns True if the write succeeds */
>   static inline bool lkdtm_try_write(u32 data, u32 *addr)
>   {
> -#ifdef CONFIG_PPC
> -	__put_kernel_nofault(addr, &data, u32, err);
> -	return true;
> -
> -err:
> -	return false;
> -#endif
> -#ifdef CONFIG_X86_64
>   	return !__put_user(data, addr);
> -#endif
>   }
>   
>   static int lkdtm_patching_cpu(void *data)
> 
