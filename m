Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 358CB3E10E2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 11:09:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GgN8q1DZ7z3d8Y
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 19:09:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GgN8T5wPrz2xbB
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Aug 2021 19:09:12 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4GgN8P4tb5z9sWJ;
 Thu,  5 Aug 2021 11:09:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bbX-U_KwuJ3S; Thu,  5 Aug 2021 11:09:09 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4GgN8P3rktz9sWH;
 Thu,  5 Aug 2021 11:09:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 213358B7BE;
 Thu,  5 Aug 2021 11:09:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id FM7R-FbjtVsw; Thu,  5 Aug 2021 11:09:09 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7BFF08B7BD;
 Thu,  5 Aug 2021 11:09:08 +0200 (CEST)
Subject: Re: [PATCH v5 4/8] lkdtm/x86_64: Add test to hijack a patch mapping
To: "Christopher M. Riedl" <cmr@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20210713053113.4632-1-cmr@linux.ibm.com>
 <20210713053113.4632-5-cmr@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <95de5ec5-8d48-c969-3c9f-966561f9f58e@csgroup.eu>
Date: Thu, 5 Aug 2021 11:09:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210713053113.4632-5-cmr@linux.ibm.com>
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
> A previous commit implemented an LKDTM test on powerpc to exploit the
> temporary mapping established when patching code with STRICT_KERNEL_RWX
> enabled. Extend the test to work on x86_64 as well.
> 
> Signed-off-by: Christopher M. Riedl <cmr@linux.ibm.com>
> ---
>   drivers/misc/lkdtm/perms.c | 26 ++++++++++++++++++++++----
>   1 file changed, 22 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/misc/lkdtm/perms.c b/drivers/misc/lkdtm/perms.c
> index 39e7456852229..41e87e5f9cc86 100644
> --- a/drivers/misc/lkdtm/perms.c
> +++ b/drivers/misc/lkdtm/perms.c
> @@ -224,7 +224,7 @@ void lkdtm_ACCESS_NULL(void)
>   }
>   
>   #if (IS_BUILTIN(CONFIG_LKDTM) && defined(CONFIG_STRICT_KERNEL_RWX) && \
> -	defined(CONFIG_PPC))
> +	(defined(CONFIG_PPC) || defined(CONFIG_X86_64)))
>   /*
>    * This is just a dummy location to patch-over.
>    */
> @@ -233,12 +233,25 @@ static void patching_target(void)
>   	return;
>   }
>   
> -#include <asm/code-patching.h>
>   const u32 *patch_site = (const u32 *)&patching_target;
>   
> +#ifdef CONFIG_PPC
> +#include <asm/code-patching.h>
> +#endif
> +
> +#ifdef CONFIG_X86_64
> +#include <asm/text-patching.h>
> +#endif
> +
>   static inline int lkdtm_do_patch(u32 data)
>   {
> +#ifdef CONFIG_PPC
>   	return patch_instruction((u32 *)patch_site, ppc_inst(data));
> +#endif
> +#ifdef CONFIG_X86_64
> +	text_poke((void *)patch_site, &data, sizeof(u32));
> +	return 0;
> +#endif
>   }
>   
>   static inline u32 lkdtm_read_patch_site(void)
> @@ -249,11 +262,16 @@ static inline u32 lkdtm_read_patch_site(void)
>   /* Returns True if the write succeeds */
>   static inline bool lkdtm_try_write(u32 data, u32 *addr)
>   {
> +#ifdef CONFIG_PPC
>   	__put_kernel_nofault(addr, &data, u32, err);
>   	return true;
>   
>   err:
>   	return false;
> +#endif
> +#ifdef CONFIG_X86_64
> +	return !__put_user(data, addr);
> +#endif
>   }
>   
>   static int lkdtm_patching_cpu(void *data)
> @@ -346,8 +364,8 @@ void lkdtm_HIJACK_PATCH(void)
>   
>   void lkdtm_HIJACK_PATCH(void)
>   {
> -	if (!IS_ENABLED(CONFIG_PPC))
> -		pr_err("XFAIL: this test only runs on powerpc\n");
> +	if (!IS_ENABLED(CONFIG_PPC) && !IS_ENABLED(CONFIG_X86_64))
> +		pr_err("XFAIL: this test only runs on powerpc and x86_64\n");
>   	if (!IS_ENABLED(CONFIG_STRICT_KERNEL_RWX))
>   		pr_err("XFAIL: this test requires CONFIG_STRICT_KERNEL_RWX\n");
>   	if (!IS_BUILTIN(CONFIG_LKDTM))
> 

Instead of spreading arch specific stuff into LKDTM, wouldn't it make sence to define common a 
common API ? Because the day another arch like arm64 implements it own approach, do we add specific 
functions again and again into LKDTM ?

Also, I find it odd to define tests only when they can succeed. For other tests like 
ACCESS_USERSPACE, they are there all the time, regardless of whether we have selected 
CONFIG_PPC_KUAP or not. I think it should be the same here, have it all there time, if 
CONFIG_STRICT_KERNEL_RWX is selected the test succeeds otherwise it fails, but it is always there.

Christophe
