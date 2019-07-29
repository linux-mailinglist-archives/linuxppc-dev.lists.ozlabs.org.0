Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5055B78AB9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2019 13:40:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45xyS25S8nzDqDy
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2019 21:40:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="CN1IqAJT"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45xyPx6l4VzDqHK
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jul 2019 21:39:01 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45xyPn5NCZz9v9Ll;
 Mon, 29 Jul 2019 13:38:53 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=CN1IqAJT; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id V-9LroEbPpfY; Mon, 29 Jul 2019 13:38:53 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45xyPn4HVzz9v9Lb;
 Mon, 29 Jul 2019 13:38:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1564400333; bh=nziOx+hsAmSgHaUew2nk7oKkm5bBxFcVZVeuZ8olOds=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=CN1IqAJT5TRTGPGfzxV/ACgvbI3nuqf2174u4PWQd9Ase9/M+vHqjqmWnrCYoIbw6
 yE3FBsZeQZsCnTcqZazPFn2WiXxexkLpBBbomM3ozi46ukMJ3IxVZgdpmFES3H2pwh
 4ivVSPPMX9Pw+vXzT5OWKhHUUUl7ClwZhgNV8iHg=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7776E8B7CE;
 Mon, 29 Jul 2019 13:38:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id qcnZa5PhHJ3f; Mon, 29 Jul 2019 13:38:58 +0200 (CEST)
Received: from [172.25.230.101] (po15451.idsi0.si.c-s.fr [172.25.230.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 00C3E8B7B3;
 Mon, 29 Jul 2019 13:38:57 +0200 (CEST)
Subject: Re: [RFC PATCH 09/10] powerpc/fsl_booke/kaslr: support nokaslr
 cmdline parameter
To: Jason Yan <yanaijie@huawei.com>, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, diana.craciun@nxp.com,
 benh@kernel.crashing.org, paulus@samba.org, npiggin@gmail.com,
 keescook@chromium.org, kernel-hardening@lists.openwall.com
References: <20190717080621.40424-1-yanaijie@huawei.com>
 <20190717080621.40424-10-yanaijie@huawei.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <e31851fd-5032-2787-ea36-c48a7a6ebbe9@c-s.fr>
Date: Mon, 29 Jul 2019 13:38:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190717080621.40424-10-yanaijie@huawei.com>
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
Cc: wangkefeng.wang@huawei.com, linux-kernel@vger.kernel.org,
 jingxiangfeng@huawei.com, thunder.leizhen@huawei.com, fanchengyang@huawei.com,
 yebin10@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 17/07/2019 à 10:06, Jason Yan a écrit :
> One may want to disable kaslr when boot, so provide a cmdline parameter
> 'nokaslr' to support this.
> 
> Signed-off-by: Jason Yan <yanaijie@huawei.com>
> Cc: Diana Craciun <diana.craciun@nxp.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Christophe Leroy <christophe.leroy@c-s.fr>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Kees Cook <keescook@chromium.org>
> ---
>   arch/powerpc/kernel/kaslr_booke.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/arch/powerpc/kernel/kaslr_booke.c b/arch/powerpc/kernel/kaslr_booke.c
> index 00339c05879f..e65a5d9d2ff1 100644
> --- a/arch/powerpc/kernel/kaslr_booke.c
> +++ b/arch/powerpc/kernel/kaslr_booke.c
> @@ -373,6 +373,18 @@ static unsigned long __init kaslr_choose_location(void *dt_ptr, phys_addr_t size
>   	return kaslr_offset;
>   }
>   
> +static inline __init bool kaslr_disabled(void)
> +{
> +	char *str;
> +
> +	str = strstr(early_command_line, "nokaslr");

Why using early_command_line instead of boot_command_line ?


> +	if ((str == early_command_line) ||
> +	    (str > early_command_line && *(str - 1) == ' '))

Is that stuff really needed ?

Why not just:

return strstr(early_command_line, "nokaslr") != NULL;

> +		return true;
> +
> +	return false;
> +}


> +
>   /*
>    * To see if we need to relocate the kernel to a random offset
>    * void *dt_ptr - address of the device tree
> @@ -388,6 +400,8 @@ notrace void __init kaslr_early_init(void *dt_ptr, phys_addr_t size)
>   	kernel_sz = (unsigned long)_end - KERNELBASE;
>   
>   	kaslr_get_cmdline(dt_ptr);
> +	if (kaslr_disabled())
> +		return;
>   
>   	offset = kaslr_choose_location(dt_ptr, size, kernel_sz);
>   
> 

Christophe
