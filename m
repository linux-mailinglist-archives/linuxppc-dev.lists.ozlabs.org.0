Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB1E48EDF2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jan 2022 17:19:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jb62W5bb2z3bZW
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jan 2022 03:19:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jb6221RzNz3089
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Jan 2022 03:19:19 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Jb61t1XJ5z9sS9;
 Fri, 14 Jan 2022 17:19:14 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id plKx03bhxQzX; Fri, 14 Jan 2022 17:19:14 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Jb61t0dW2z9sS8;
 Fri, 14 Jan 2022 17:19:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 05E8D8B77D;
 Fri, 14 Jan 2022 17:19:14 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id YOIqkl7SpmOc; Fri, 14 Jan 2022 17:19:13 +0100 (CET)
Received: from [192.168.235.181] (unknown [192.168.235.181])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BFFD98B763;
 Fri, 14 Jan 2022 17:19:13 +0100 (CET)
Message-ID: <ef6785d1-2c0d-24f5-e63f-9be29f5d41e8@csgroup.eu>
Date: Fri, 14 Jan 2022 17:19:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 1/3] powerpc: Properly return error code from
 do_patch_instruction()
Content-Language: fr-FR
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
References: <cover.1587654213.git.naveen.n.rao@linux.vnet.ibm.com>
 <b1dbbb34a389a6f59eb6c99102d94c0070ddaf98.1587654213.git.naveen.n.rao@linux.vnet.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <b1dbbb34a389a6f59eb6c99102d94c0070ddaf98.1587654213.git.naveen.n.rao@linux.vnet.ibm.com>
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
Cc: Steven Rostedt <rostedt@goodmis.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 23/04/2020 à 17:09, Naveen N. Rao a écrit :
> With STRICT_KERNEL_RWX, we are currently ignoring return value from
> __patch_instruction() in do_patch_instruction(), resulting in the error
> not being propagated back. Fix the same.
> 
> Fixes: 37bc3e5fd764f ("powerpc/lib/code-patching: Use alternate map for patch_instruction()")
> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>

A similar patch was merged as 
https://github.com/linuxppc/linux/commit/a3483c3dd18c136785a31406fe27210649fc4fba#diff-e084bb6dc223aec74e7fc4208b7b260acc571bd5b50c9b709ec3de175cb1a979

Christophe


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
>   }
>   #else /* !CONFIG_STRICT_KERNEL_RWX */
>   
