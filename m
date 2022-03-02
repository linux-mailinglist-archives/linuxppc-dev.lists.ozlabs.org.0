Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C7A4CA5F8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Mar 2022 14:26:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K7vzN3plpz3bdk
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Mar 2022 00:26:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7vyw0GmCz3bb9
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Mar 2022 00:26:30 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4K7vyn5r5Lz9sS9;
 Wed,  2 Mar 2022 14:26:25 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bws1KgY2kVPG; Wed,  2 Mar 2022 14:26:25 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4K7vyn56R6z9sS8;
 Wed,  2 Mar 2022 14:26:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9EC1C8B76D;
 Wed,  2 Mar 2022 14:26:25 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id VHSrabEcIYa5; Wed,  2 Mar 2022 14:26:25 +0100 (CET)
Received: from [172.25.230.108] (unknown [172.25.230.108])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 81F458B763;
 Wed,  2 Mar 2022 14:26:25 +0100 (CET)
Message-ID: <318681e5-f65a-45e8-14f9-2cc341fb9b9a@csgroup.eu>
Date: Wed, 2 Mar 2022 14:26:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH -next] powerpc/pmac: remove not use symbol
Content-Language: fr-FR
To: Zucheng Zheng <zhengzucheng@huawei.com>, benh@kernel.crashing.org,
 mpe@ellerman.id.au, paulus@samba.org, oohall@gmail.com,
 akpm@linux-foundation.org, rppt@kernel.org
References: <20210409093519.118000-1-zhengzucheng@huawei.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20210409093519.118000-1-zhengzucheng@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 09/04/2021 à 11:35, Zucheng Zheng a écrit :
> sccdbg symbol is not used, so remove it

You could mention that it hasn't been used since commit 51d3082fe6e5 
("[PATCH] powerpc: Unify udbg (#2)")


> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zucheng Zheng <zhengzucheng@huawei.com>
> ---
>   arch/powerpc/platforms/powermac/setup.c | 4 ----
>   1 file changed, 4 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/powermac/setup.c b/arch/powerpc/platforms/powermac/setup.c
> index db5107c80485..df9ea37d5708 100644
> --- a/arch/powerpc/platforms/powermac/setup.c
> +++ b/arch/powerpc/platforms/powermac/setup.c
> @@ -83,10 +83,6 @@ extern struct machdep_calls pmac_md;
>   
>   #define DEFAULT_ROOT_DEVICE Root_SDA1	/* sda1 - slightly silly choice */
>   
> -#ifdef CONFIG_PPC64
> -int sccdbg;
> -#endif
> -
>   sys_ctrler_t sys_ctrler = SYS_CTRLER_UNKNOWN;
>   EXPORT_SYMBOL(sys_ctrler);
>   
