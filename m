Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 61207134879
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2020 17:51:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47tFcv3x4xzDqSt
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2020 03:51:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="egBuE1zI"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47tFZX49lyzDqSn
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jan 2020 03:49:07 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 47tFZP3B1tz9v449;
 Wed,  8 Jan 2020 17:49:01 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=egBuE1zI; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id aYFtmaBbl-yR; Wed,  8 Jan 2020 17:49:01 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47tFZP26Nsz9v448;
 Wed,  8 Jan 2020 17:49:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1578502141; bh=fDLf2Lbvma1ro6euRU/zp5f/MAKJXOINHS68Q4Ro8U4=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=egBuE1zIY1PsLgbe954KQXy9/itY9Eqwe36YBGMFHa1PUpNnUC7uhP4kXsVFIJjgr
 oYEA6UiZrikmE8WfXbsE9sImVVXBYeMyQhgDnjx4tFEfuAu+9SQogBqSDrwDPcHtVF
 hiE6nieL29hN/VIjsHDYCrrp+8JGUSZWD7pXWPnc=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D44778B80D;
 Wed,  8 Jan 2020 17:49:02 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id yuK7jyfVRGSV; Wed,  8 Jan 2020 17:49:02 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 510148B7EA;
 Wed,  8 Jan 2020 17:49:00 +0100 (CET)
Subject: Re: [PATCH v6 2/5] powerpc/kprobes: Mark newly allocated probes as RO
To: Russell Currey <ruscur@russell.cc>, linuxppc-dev@lists.ozlabs.org
References: <20191224055545.178462-1-ruscur@russell.cc>
 <20191224055545.178462-3-ruscur@russell.cc>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <51b9b43b-9f25-bb68-93f2-cd5ba7d67f38@c-s.fr>
Date: Wed, 8 Jan 2020 17:48:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191224055545.178462-3-ruscur@russell.cc>
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
Cc: ajd@linux.ibm.com, kernel-hardening@lists.openwall.com, npiggin@gmail.com,
 joel@jms.id.au, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 24/12/2019 à 06:55, Russell Currey a écrit :
> With CONFIG_STRICT_KERNEL_RWX=y and CONFIG_KPROBES=y, there will be one
> W+X page at boot by default.  This can be tested with
> CONFIG_PPC_PTDUMP=y and CONFIG_PPC_DEBUG_WX=y set, and checking the
> kernel log during boot.
> 
> powerpc doesn't implement its own alloc() for kprobes like other
> architectures do, but we couldn't immediately mark RO anyway since we do
> a memcpy to the page we allocate later.  After that, nothing should be
> allowed to modify the page, and write permissions are removed well
> before the kprobe is armed.
> 
> The memcpy() would fail if >1 probes were allocated, so use
> patch_instruction() instead which is safe for RO.
> 
> Reviewed-by: Daniel Axtens <dja@axtens.net>
> Signed-off-by: Russell Currey <ruscur@russell.cc>
> ---
>   arch/powerpc/kernel/kprobes.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
> index 2d27ec4feee4..b72761f0c9e3 100644
> --- a/arch/powerpc/kernel/kprobes.c
> +++ b/arch/powerpc/kernel/kprobes.c
> @@ -24,6 +24,7 @@
>   #include <asm/sstep.h>
>   #include <asm/sections.h>
>   #include <linux/uaccess.h>
> +#include <linux/set_memory.h>
>   
>   DEFINE_PER_CPU(struct kprobe *, current_kprobe) = NULL;
>   DEFINE_PER_CPU(struct kprobe_ctlblk, kprobe_ctlblk);
> @@ -124,13 +125,14 @@ int arch_prepare_kprobe(struct kprobe *p)
>   	}
>   
>   	if (!ret) {
> -		memcpy(p->ainsn.insn, p->addr,
> -				MAX_INSN_SIZE * sizeof(kprobe_opcode_t));
> +		patch_instruction(p->ainsn.insn, *p->addr);
>   		p->opcode = *p->addr;
>   		flush_icache_range((unsigned long)p->ainsn.insn,
>   			(unsigned long)p->ainsn.insn + sizeof(kprobe_opcode_t));

patch_instruction() already does the flush, no need to flush again with 
flush_icache_range()

>   	}
>   
> +	set_memory_ro((unsigned long)p->ainsn.insn, 1);
> +

I don't really understand, why do you need to set this ro ? Or why do 
you need to change the memcpy() to patch_instruction() if the area is 
not already ro ?

If I understand correctly, p->ainsn.insn is within a special executable 
page allocated via module_alloc(). Wouldn't it be more correct to modify 
kprobe get_insn_slot() logic so that allocated page is ROX instead of RWX ?

>   	p->ainsn.boostable = 0;
>   	return ret;
>   }
> 

Christophe
