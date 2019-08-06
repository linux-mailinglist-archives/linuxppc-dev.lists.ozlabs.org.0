Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6323F82D4C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2019 10:01:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 462nC93VHKzDr5X
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2019 18:01:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="KFxQJm9j"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 462n8z0XKszDqlP
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Aug 2019 17:59:31 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 462n8t4vmJz9txY9;
 Tue,  6 Aug 2019 09:59:26 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=KFxQJm9j; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id eVrhqiZLxRqx; Tue,  6 Aug 2019 09:59:26 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 462n8t3n2Vz9txYC;
 Tue,  6 Aug 2019 09:59:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1565078366; bh=5YDv6dgHqzqllJC8kOdquh3d9tD4kkNE+Dq/5rv/yKs=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=KFxQJm9jm+lxXqyhh6dliy3lQUqobK1qGDV7RjvFSl3PoKQSYuhWGF/pKMVIMfMdW
 /pqEOIY6pXA1umTwCLQafvpwujltnxD7WzRA3bC5bWspTt4n4pzeq//6UBzXjt4prz
 2MiJS42SMHOtAlHV37pdB+evxeLnlJIC3jFcBrIU=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 821698B75F;
 Tue,  6 Aug 2019 09:59:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Bv8rgec24Mhz; Tue,  6 Aug 2019 09:59:27 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B58558B7E2;
 Tue,  6 Aug 2019 09:59:26 +0200 (CEST)
Subject: Re: [PATCH v4 09/10] powerpc/fsl_booke/kaslr: support nokaslr cmdline
 parameter
To: Jason Yan <yanaijie@huawei.com>, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, diana.craciun@nxp.com,
 benh@kernel.crashing.org, paulus@samba.org, npiggin@gmail.com,
 keescook@chromium.org, kernel-hardening@lists.openwall.com
References: <20190805064335.19156-1-yanaijie@huawei.com>
 <20190805064335.19156-10-yanaijie@huawei.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <e7703798-c2e2-c75f-1001-46c01db88238@c-s.fr>
Date: Tue, 6 Aug 2019 09:59:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190805064335.19156-10-yanaijie@huawei.com>
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
 jingxiangfeng@huawei.com, zhaohongjiang@huawei.com, thunder.leizhen@huawei.com,
 fanchengyang@huawei.com, yebin10@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 05/08/2019 à 08:43, Jason Yan a écrit :
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
> Reviewed-by: Diana Craciun <diana.craciun@nxp.com>
> Tested-by: Diana Craciun <diana.craciun@nxp.com>

Reviewed-by: Christophe Leroy <christophe.leroy@c-s.fr>

Tiny comment below.

> ---
>   arch/powerpc/kernel/kaslr_booke.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/arch/powerpc/kernel/kaslr_booke.c b/arch/powerpc/kernel/kaslr_booke.c
> index 4b3f19a663fc..7c3cb41e7122 100644
> --- a/arch/powerpc/kernel/kaslr_booke.c
> +++ b/arch/powerpc/kernel/kaslr_booke.c
> @@ -361,6 +361,18 @@ static unsigned long __init kaslr_choose_location(void *dt_ptr, phys_addr_t size
>   	return kaslr_offset;
>   }
>   
> +static inline __init bool kaslr_disabled(void)
> +{
> +	char *str;
> +
> +	str = strstr(boot_command_line, "nokaslr");
> +	if ((str == boot_command_line) ||
> +	    (str > boot_command_line && *(str - 1) == ' '))
> +		return true;

I don't think additional () are needed for the left part 'str == 
boot_command_line'

> +
> +	return false;
> +}
> +
>   /*
>    * To see if we need to relocate the kernel to a random offset
>    * void *dt_ptr - address of the device tree
> @@ -376,6 +388,8 @@ notrace void __init kaslr_early_init(void *dt_ptr, phys_addr_t size)
>   	kernel_sz = (unsigned long)_end - KERNELBASE;
>   
>   	kaslr_get_cmdline(dt_ptr);
> +	if (kaslr_disabled())
> +		return;
>   
>   	offset = kaslr_choose_location(dt_ptr, size, kernel_sz);
>   
> 
