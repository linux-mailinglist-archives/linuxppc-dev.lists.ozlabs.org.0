Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C131B60F4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Apr 2020 18:29:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 497N7J5stbzDr3Z
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Apr 2020 02:29:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=gK+o/aTg; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 497MxZ6vxVzDqc4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Apr 2020 02:21:22 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 497MxV0gX7zB09Zy;
 Thu, 23 Apr 2020 18:21:18 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=gK+o/aTg; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id ybOQ-QzuXd3d; Thu, 23 Apr 2020 18:21:18 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 497MxT6DLsz9v0yj;
 Thu, 23 Apr 2020 18:21:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1587658877; bh=wp3yhBrOeO4d7T/rA02pocd2W0NRamKkzEdV27oQFQU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=gK+o/aTgKg8K4IRpnrb1UulsbRJuvcKGb1kitfgXd550tmx6pyNiAWEemgJluzl9A
 lqMor+8xFtMuLgGxRug2whyzlq7RcqlNsuFEUfOK6PUbrpu/IYHgWTTjbIMwL1jLIE
 KQob869Yt/2itAbY3etIeCBf1spM3z+aMPiDbHqA=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7DE468B868;
 Thu, 23 Apr 2020 18:21:19 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id bj5M_Xm9v2qD; Thu, 23 Apr 2020 18:21:19 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1B8408B860;
 Thu, 23 Apr 2020 18:21:18 +0200 (CEST)
Subject: Re: [PATCH 1/3] powerpc: Properly return error code from
 do_patch_instruction()
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
References: <cover.1587654213.git.naveen.n.rao@linux.vnet.ibm.com>
 <b1dbbb34a389a6f59eb6c99102d94c0070ddaf98.1587654213.git.naveen.n.rao@linux.vnet.ibm.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <16070946-1185-2aad-62fe-f4ed9cd4eefe@c-s.fr>
Date: Thu, 23 Apr 2020 18:21:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <b1dbbb34a389a6f59eb6c99102d94c0070ddaf98.1587654213.git.naveen.n.rao@linux.vnet.ibm.com>
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
Cc: Steven Rostedt <rostedt@goodmis.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 23/04/2020 à 17:09, Naveen N. Rao a écrit :
> With STRICT_KERNEL_RWX, we are currently ignoring return value from
> __patch_instruction() in do_patch_instruction(), resulting in the error
> not being propagated back. Fix the same.

Good patch.

Be aware that there is ongoing work which tend to wanting to replace 
error reporting by BUG_ON() . See 
https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=166003

> 
> Fixes: 37bc3e5fd764f ("powerpc/lib/code-patching: Use alternate map for patch_instruction()")
> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
> ---
>   arch/powerpc/lib/code-patching.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
> index 3345f039a876..5c713a6c0bd8 100644
> --- a/arch/powerpc/lib/code-patching.c
> +++ b/arch/powerpc/lib/code-patching.c
> @@ -138,7 +138,7 @@ static inline int unmap_patch_area(unsigned long addr)
>   
>   static int do_patch_instruction(unsigned int *addr, unsigned int instr)
>   {
> -	int err;
> +	int err, rc = 0;
>   	unsigned int *patch_addr = NULL;
>   	unsigned long flags;
>   	unsigned long text_poke_addr;
> @@ -163,7 +163,7 @@ static int do_patch_instruction(unsigned int *addr, unsigned int instr)
>   	patch_addr = (unsigned int *)(text_poke_addr) +
>   			((kaddr & ~PAGE_MASK) / sizeof(unsigned int));
>   
> -	__patch_instruction(addr, instr, patch_addr);
> +	rc = __patch_instruction(addr, instr, patch_addr);
>   
>   	err = unmap_patch_area(text_poke_addr);
>   	if (err)
> @@ -172,7 +172,7 @@ static int do_patch_instruction(unsigned int *addr, unsigned int instr)
>   out:
>   	local_irq_restore(flags);
>   
> -	return err;
> +	return rc ? rc : err;

That's not really consistent. __patch_instruction() and 
unmap_patch_area() return a valid minus errno, while in case of 
map_patch_area() failure, err has value -1

>   }
>   #else /* !CONFIG_STRICT_KERNEL_RWX */
>   
> 

Christophe
