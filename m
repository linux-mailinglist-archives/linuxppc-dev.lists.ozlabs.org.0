Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF543F6FB9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Aug 2021 08:42:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GvbyR5SYpz2yw3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Aug 2021 16:42:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gvby32VzGz2xTK
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Aug 2021 16:42:33 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Gvbxy1fXhz9sVG;
 Wed, 25 Aug 2021 08:42:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4y7WKXTVXuup; Wed, 25 Aug 2021 08:42:30 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Gvbxy0f1Vz9sV9;
 Wed, 25 Aug 2021 08:42:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EC0218B76A;
 Wed, 25 Aug 2021 08:42:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 8_K7q7wLCYoh; Wed, 25 Aug 2021 08:42:29 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5388A8B83C;
 Wed, 25 Aug 2021 08:42:29 +0200 (CEST)
Subject: Re: [PATCH linux-next] powerpc:security: replace
 DEFINE_SIMPLE_ATTRIBUTE with DEFINE_DEBUGFS_ATTRIBUTE
To: CGEL <cgel.zte@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>
References: <20210825064016.70421-1-deng.changcheng@zte.com.cn>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <9521dd23-34f6-837e-a397-ee2771675967@csgroup.eu>
Date: Wed, 25 Aug 2021 08:42:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210825064016.70421-1-deng.changcheng@zte.com.cn>
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
Cc: Jing Yangyang <jing.yangyang@zte.com.cn>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Zeal Robot <zealci@zte.com.cn>,
 linux-kernel@vger.kernel.org, Li Huafei <lihuafei1@huawei.com>,
 Paul Mackerras <paulus@samba.org>, Nicholas Piggin <npiggin@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

Le 25/08/2021 à 08:40, CGEL a écrit :
> From: Jing Yangyang <jing.yangyang@zte.com.cn>
> 
> Fix the following coccicheck warning:
> ./arch/powerpc/kernel/security.c:807:0-23: WARNING:
>   fops_entry_flush should be defined with DEFINE_DEBUGFS_ATTRIBUTE
> ./arch/powerpc/kernel/security.c:781:0-23:WARNING:
> fops_rfi_flush should be defined with DEFINE_DEBUGFS_ATTRIBUTE
> ./arch/powerpc/kernel/security.c:833:0-23:WARNING:
> fops_uaccess_flush should be defined with DEFINE_DEBUGFS_ATTRIBUTE

Can you give a few more details why the suggestion from coccicheck is a good suggestion ?

Thanks
Christophe

> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Jing Yangyang <jing.yangyang@zte.com.cn>
> ---
>   arch/powerpc/kernel/security.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/security.c b/arch/powerpc/kernel/security.c
> index 1a99849..cf8ce24 100644
> --- a/arch/powerpc/kernel/security.c
> +++ b/arch/powerpc/kernel/security.c
> @@ -778,7 +778,7 @@ static int rfi_flush_get(void *data, u64 *val)
>   	return 0;
>   }
>   
> -DEFINE_SIMPLE_ATTRIBUTE(fops_rfi_flush, rfi_flush_get, rfi_flush_set, "%llu\n");
> +DEFINE_DEBUGFS_ATTRIBUTE(fops_rfi_flush, rfi_flush_get, rfi_flush_set, "%llu\n");
>   
>   static int entry_flush_set(void *data, u64 val)
>   {
> @@ -804,7 +804,7 @@ static int entry_flush_get(void *data, u64 *val)
>   	return 0;
>   }
>   
> -DEFINE_SIMPLE_ATTRIBUTE(fops_entry_flush, entry_flush_get, entry_flush_set, "%llu\n");
> +DEFINE_DEBUGFS_ATTRIBUTE(fops_entry_flush, entry_flush_get, entry_flush_set, "%llu\n");
>   
>   static int uaccess_flush_set(void *data, u64 val)
>   {
> @@ -830,7 +830,7 @@ static int uaccess_flush_get(void *data, u64 *val)
>   	return 0;
>   }
>   
> -DEFINE_SIMPLE_ATTRIBUTE(fops_uaccess_flush, uaccess_flush_get, uaccess_flush_set, "%llu\n");
> +DEFINE_DEBUGFS_ATTRIBUTE(fops_uaccess_flush, uaccess_flush_get, uaccess_flush_set, "%llu\n");
>   
>   static __init int rfi_flush_debugfs_init(void)
>   {
> 
